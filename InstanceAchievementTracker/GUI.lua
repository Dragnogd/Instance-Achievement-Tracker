local _, core = ...
local L = core.L
core.Config = {}
core.IATInfoFrame = {}
local InfoFrame

local Config = core.Config
local IATInfoFrame = core.IATInfoFrame

Config.majorVersion = 4
Config.minorVersion = 42
Config.revisionVersion = 0
Config.classicPhase = 5

local Left = nil
local Top = nil
local InfoFrameScale = nil
local InfoFrameTestBarsActive = false

--API
local IAT_InstanceLocation = nil
local IAT_InstanceType = nil
local IAT_CurrentTab = nil

Config.currentTab = nil
Config.currentInstance = nil

AchievementTrackerOptions = {}

-- Purpose:         Stores NPC names
AchievementTrackerNPCCache = {}
AchievementTrackerNPCCacheClassic = {}

BOSSBUTTON_COLLAPSEDHEIGHT = 55;

local g_achievementSelectionBehavior = nil;
local g_achievementSelections = {{},{},{}};

------------------------------------------------------
---- Game Versions
------------------------------------------------------
-- Purpose:         Used to detect which version of the game the user is running. This is used so we can add features for different versions of the game.
core.gameVersion, core.gameBuild, core.gameDate, core.tocVersion = GetBuildInfo()

function getGameBuild()
    core.gameVersionMajor, core.gameVersionMinor, core.gameVersionRevision = strsplit(".", core.gameVersion, 3)

    core.gameVersionMajor = tonumber(core.gameVersionMajor)
    core.gameVersionMinor = tonumber(core.gameVersionMinor)
    core.gameVersionRevision = tonumber(core.gameVersionRevision)
end

------------------------------------------------------
---- Localisation
------------------------------------------------------

function Config:getLocalisedInstanceName(instanceID)
    print(instanceID)
    if instanceID ~= nil then
        if core.gameVersionMajor > 3 then
            return EJ_GetInstanceInfo(instanceID)
        else
            return ""
        end
    end
end

function Config:getLocalisedScenarioName(dungeonID)
    --Scenario were introduced in patch 5 (MoP)
    if core.gameVersionMajor >= 5 then
        return C_LFGInfo.GetDungeonInfo(dungeonID).name
    else
        return ""
    end
end

function Config:getLocalisedEncouterName(encounterID,instanceType)
    if type(encounterID) == "table" then
        --Decide if player is alliance or horde then return correct id
        if UnitFactionGroup("player") == "Alliance" then
            return EJ_GetEncounterInfo(encounterID[1])
        else--Horde
            return EJ_GetEncounterInfo(encounterID[2])
        end
    elseif tonumber(encounterID) then
        if instanceType == "Scenarios" then
            return getNPCName(encounterID)
        else
            return EJ_GetEncounterInfo(encounterID)
        end
    else
        --The encounterID is actually string since there is no dungeon journal entry for this achievement
        --This will happen for achievements that are not tied directly to a boss.
        --Localised strings will be attached in the instances database
        return encounterID
    end
end

-- Method:          Config:Toggle()
-- What it Does:    Toggles the GUI to show or hide
-- Purpose:         Checks whether the GUI is currently being shown and performs the opposite action
function Config:Toggle()
    local GUI = UI or Config:CreateUI()
    GUI:SetShown(not GUI:IsShown())
    GameTooltip:Hide()
end

function Config:ToggleOn()
    --Toggle on only
    local GUI = UI or Config:CreateUI()
    GUI:SetShown(true)
    GameTooltip:Hide()
end

function IAT_GlobalToggle()
    local GUI = UI or Config:CreateUI()
    GUI:SetShown(not GUI:IsShown())
    GameTooltip:Hide()
end

-- Method:          Config:CreateButton()
-- What it Does:    Create a new frame of type button
-- Purpose:         This is used to create a frame which the specified paramters. Returns a button frame.
function Config:CreateButton(point, relativeFrame, relativePoint, yOffset, text, mapID)
	local btn = CreateFrame("Button", nil, relativeFrame, "GameMenuButtonTemplate");
	btn:SetPoint(point, relativeFrame, relativePoint, 0, yOffset);
	btn:SetSize(200, 30);
	btn:SetText(text);
	btn:SetNormalFontObject("GameFontNormal");
    btn:SetHighlightFontObject("GameFontHighlight");
    if mapID ~= nil then                                                                --If the mapID paramters was passed, set the ID of the button the mapID
        local mapID = tostring(mapID)                                                   --This is used so when the user clicks on the button we can fetch the
        mapID = mapID:gsub('%-', '')                                                    --information relating to that ID from the instances table.
        btn:SetID(tonumber(mapID))
    end
	return btn;
end

function Config:CreateButton2(point, relativeFrame, relativePoint, xOffset, yOffset, text)
	local btn = CreateFrame("Button", nil, relativeFrame, "GameMenuButtonTemplate");
	btn:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset);
	btn:SetSize(200, 30);
	btn:SetText(text);
	btn:SetNormalFontObject("GameFontNormal");
	btn:SetHighlightFontObject("GameFontHighlight");
	return btn;
end

-- Method:          Config:CreateCheckBox()
-- What it Does:    Create a new frame of type checkbox
-- Purpose:         This is used to create a frame which the specified paramters. Returns a checkbutton frame.
function Config:CreateCheckBox(point, relativeFrame, relativePoint, xOffset, yOffset, checkboxName)
    local chk = CreateFrame("CheckButton", checkboxName, relativeFrame, "UICheckButtonTemplate")
	chk:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset);
	return chk;
end

function Config:CreateSlider(point, relativeFrame, relativePoint, xOffset, yOffset, sliderName)
    local chk = CreateFrame("Slider", sliderName, relativeFrame, "OptionsSliderTemplate")
	chk:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset);
	return chk;
end

-- Method:          Config:CreateText()
-- What it Does:    Create a new frame of type fontstring
-- Purpose:         This is used to put text on the GUI
function Config:CreateText(point, relativeFrame, relativePoint, xOffset, yOffset, textString)
    local text = relativeFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    text:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
    text:SetText(textString)
    return text
end

function Config:CreateText2(point, relativeFrame, relativePoint, xOffset, yOffset, textString, size)
    local text = UI:CreateFontString(nil, "OVERLAY", size)
    text:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
    text:SetText(textString)
    return text
end

function ATToggleShowInfoFrameTestFrame_OnClick(self)
    if InfoFrameTestBarsActive == false then
        InfoFrameTestBarsActive = true
        core.IATInfoFrame:SetupInfoFrame()
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(14148))
        core.IATInfoFrame:SetSubHeading1(L["Shared_PlayersMetCriteria"] .. " (0/10)")
        core.IATInfoFrame:SetText1(getNPCName(134442).."\n"..getNPCName(144637).."\n"..getNPCName(138314).."\n"..getNPCName(94960).."\n"..getNPCName(95833).."\n"..getNPCName(116691).."\n"..getNPCName(111882).."\n"..getNPCName(111861).."\n"..getNPCName(74571).."\n"..getNPCName(74570))
    else
        InfoFrameTestBarsActive = false
        core.IATInfoFrame:ToggleOff()
    end
end

function ATToggleChangeMinimapIcon_OnClick(self)
    AchievementTrackerOptions["changeMinimapIcon"] = self:GetChecked()
    setChangeMinimapIcon(self:GetChecked())
end

function ATToggleTrackAchievementsAutomatically_OnClick(self)
    AchievementTrackerOptions["trackAchievementsAutomatically"] = self:GetChecked()
    setTrackAchievementsAutomatically(self:GetChecked())
end

function ATToggleTrackCharacterAchievements_OnClick(self)
    AchievementTrackerOptions["trackCharacterAchievements"] = self:GetChecked()
    setTrackCharacterAchievements(self:GetChecked())
end

function ATToggleTrackAchievementsInBlizzardUI_OnClick(self)
    AchievementTrackerOptions["trackAchievementsInBlizzardUI"] = self:GetChecked()
    setTrackAchievementsInBlizzardUI(self:GetChecked())
end

function ATToggleInfoFrame_OnClick(self)
    AchievementTrackerOptions["displayInfoFrame"] = self:GetChecked()
    setDisplayInfoFrame(self:GetChecked())
end

function ATToggleAutomaticCombatLogging_OnClick(self)
    AchievementTrackerOptions["enableAutomaticCombatLogging"] = self:GetChecked()
    setEnableAutomaticCombatLogging(self:GetChecked())
end

function ATToggleHideCompletedAchievements_OnClick(self)
    AchievementTrackerOptions["hideCompletedAchievements"] = self:GetChecked()
    setHideCompletedAchievements(self:GetChecked())
end

function ATToggleGreyOutCompletedAchievements_OnClick(self)
    AchievementTrackerOptions["greyOutCompletedAchievements"] = self:GetChecked()
    setGreyOutCompletedAchievements(self:GetChecked())
end

function AchievementTracker_SelectSoundCompleted(self, arg1, arg2, checked)
    if arg1 == 1 then
        PlaySound(SOUNDKIT.READY_CHECK, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 1
        setCompletedSound(SOUNDKIT.READY_CHECK)
    elseif arg1 == 2 then
        PlaySound(SOUNDKIT.ALARM_CLOCK_WARNING_2, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 2
        setCompletedSound(SOUNDKIT.ALARM_CLOCK_WARNING_2)
    elseif arg1 == 3 then
        PlaySound(SOUNDKIT.ALARM_CLOCK_WARNING_3, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 3
        setCompletedSound(SOUNDKIT.ALARM_CLOCK_WARNING_3)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.AUCTION_WINDOW_CLOSE, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 4
        setCompletedSound(SOUNDKIT.AUCTION_WINDOW_CLOSE)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.AUCTION_WINDOW_CLOSE, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 4
        setCompletedSound(SOUNDKIT.AUCTION_WINDOW_CLOSE)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.AUCTION_WINDOW_CLOSE, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 4
        setCompletedSound(SOUNDKIT.AUCTION_WINDOW_CLOSE)
    elseif arg1 == 5 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Prepared.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Prepared.ogg"
        AchievementTrackerOptions["completedSoundID"] = 5
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Prepared.ogg")
    elseif arg1 == 6 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 6.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 6.ogg"
        AchievementTrackerOptions["completedSoundID"] = 6
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 6.ogg")
    elseif arg1 == 7 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 7.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 7.ogg"
        AchievementTrackerOptions["completedSoundID"] = 7
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 7.ogg")
    elseif arg1 == 8 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 8.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 8.ogg"
        AchievementTrackerOptions["completedSoundID"] = 8
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 8.ogg")
    elseif arg1 == 9 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 9.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 9.ogg"
        AchievementTrackerOptions["completedSoundID"] = 9
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 9.ogg")
    elseif arg1 == 10 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 10.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 10.ogg"
        AchievementTrackerOptions["completedSoundID"] = 10
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 10.ogg")
    elseif arg1 == 11 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 11.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 11.ogg"
        AchievementTrackerOptions["completedSoundID"] = 11
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 11.ogg")
    elseif arg1 == 12 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 12.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 12.ogg"
        AchievementTrackerOptions["completedSoundID"] = 12
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 12.ogg")
    elseif arg1 == 13 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Completed.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Completed.ogg"
        AchievementTrackerOptions["completedSoundID"] = 13
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Completed.ogg")
    end
    MSA_DropDownMenu_SetText(arg2, arg1)
end

function AchievementTracker_SelectSoundFailed(self, arg1, arg2, checked)
    if arg1 == 1 then
        PlaySound(SOUNDKIT.RAID_WARNING, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["failedSoundID"] = 1
        setFailedSound(SOUNDKIT.RAID_WARNING)
    elseif arg1 == 2 then
        PlaySound(SOUNDKIT.LFG_REWARDS, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.LFG_REWARDS
        AchievementTrackerOptions["failedSoundID"] = 2
        setFailedSound(SOUNDKIT.LFG_REWARDS)
    elseif arg1 == 3 then
        PlaySound(SOUNDKIT.UI_BATTLEGROUND_COUNTDOWN_FINISHED, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.UI_BATTLEGROUND_COUNTDOWN_FINISHED
        AchievementTrackerOptions["failedSoundID"] = 3
        setFailedSound(SOUNDKIT.UI_BATTLEGROUND_COUNTDOWN_FINISHED)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.UI_SCENARIO_ENDING, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.UI_SCENARIO_ENDING
        AchievementTrackerOptions["failedSoundID"] = 4
        setFailedSound(SOUNDKIT.UI_SCENARIO_ENDING)
    elseif arg1 == 5 then
        PlaySound(SOUNDKIT.UI_GARRISON_MISSION_COMPLETE_ENCOUNTER_FAIL, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.UI_GARRISON_MISSION_COMPLETE_ENCOUNTER_FAIL
        AchievementTrackerOptions["failedSoundID"] = 5
        setFailedSound(SOUNDKIT.UI_GARRISON_MISSION_COMPLETE_ENCOUNTER_FAIL)
    elseif arg1 == 6 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Not_Prepared.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Not_Prepared.ogg"
        AchievementTrackerOptions["failedSoundID"] = 6
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Not_Prepared.ogg")
    elseif arg1 == 7 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_2.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_2.ogg"
        AchievementTrackerOptions["failedSoundID"] = 7
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_2.ogg")
    elseif arg1 == 8 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_3.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_3.ogg"
        AchievementTrackerOptions["failedSoundID"] = 8
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_3.ogg")
    elseif arg1 == 9 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_4.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_4.ogg"
        AchievementTrackerOptions["failedSoundID"] = 9
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_4.ogg")
    elseif arg1 == 10 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_5.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_5.ogg"
        AchievementTrackerOptions["failedSoundID"] = 10
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_5.ogg")
    elseif arg1 == 11 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Failed.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Failed.ogg"
        AchievementTrackerOptions["failedSoundID"] = 11
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Failed.ogg")
    end
    MSA_DropDownMenu_SetText(arg2, arg1)
end

function ATToggleSound_OnClick(self)
    AchievementTrackerOptions["toggleSound"] = self:GetChecked()
    setEnableSound(self:GetChecked())
end

function ATToggleSoundFailed_OnClick(self)
    AchievementTrackerOptions["toggleSoundFailed"] = self:GetChecked()
    setEnableSoundFailed(self:GetChecked())
end

function ATToggleAnnounceToRaidWarning_OnClick(self)
    AchievementTrackerOptions["announceToRaidWarning"] = self:GetChecked()
    setAnnounceToRaidWarning(self:GetChecked())
end

function ATToggleTrackMissingAchievementsOnly_OnClick(self)
    AchievementTrackerOptions["onlyTrackMissingAchievements"] = self:GetChecked()
    setOnlyTrackMissingAchievements(self:GetChecked())
end

function ATToggleAchievementAnnounce_OnClick(self)
    AchievementTrackerOptions["announceTrackedAchievements"] = self:GetChecked()
    setAnnounceTrackedAchievementsToChat(self:GetChecked())
end

-- Method:          ATToggleMinimapIcon_OnClick()
-- What it Does:    Toggle minimap Icon
-- Purpose:         This will toggle to minimap button to show or hide depending on user preferences
function ATToggleMinimapIcon_OnClick(self)
    AchievementTrackerOptions["showMinimap"] = self:GetChecked()
    if self:GetChecked() then
        core.ATButton:Show("InstanceAchievementTracker")
        if core.ATButton:IsRegistered("ExplorationAchievementTracker") then
            core.ATButton:Hide("ExplorationAchievementTracker")
        end
    else
        core.ATButton:Hide("InstanceAchievementTracker")
    end
end

-- Method:          enableAddon_OnClick()
-- What it Does:    Toggle the addon on or off
-- Purpose:         This will toggle whether the addon will ask if user wants to track achievements or not when entering instances
function enableAddon_OnClick(self)
    if (core.inCombat == false and self:GetChecked() == false) or self:GetChecked() == true then
        AchievementTrackerOptions["enableAddon"] = self:GetChecked()
        setAddonEnabled(self:GetChecked())
    else
        core:printMessage(L["GUI_BlockDisableAddon"])
        self:SetChecked(true)
    end
end

-- Method:          EnableAchievementScan_OnClick()
-- What it Does:    TODO
-- Purpose:         TODO
function EnableAchievementScan_OnClick(self)
    AchievementTrackerOptions["enableAchievementScan"] = self:GetChecked()
    setAchievementScanEnabled(self:GetChecked())
    core.enableAchievementScanning = self:GetChecked()

    Config:SetupAchievementTracking(core.enableAchievementScanning)
end

-- Method:          Config:SetupAchievementTracking()
-- What it Does:    TODO
-- Purpose:         TODO
function Config:SetupAchievementTracking(mode)
    --Update GUI to say achievement tracking is disabled
    local instanceFound = false
    for expansion,_ in pairs(core.Instances) do
        for instanceType,_ in pairs(core.Instances[expansion]) do
            for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if string.match(boss, "boss") then
                        if mode == false then
                            core.Instances[expansion][instanceType][instance][boss].players = {}
                            table.insert(core.Instances[expansion][instanceType][instance][boss].players, L["GUI_TrackingDisabled"])
                        else
                            core.Instances[expansion][instanceType][instance][boss].players = {}
                            table.insert(core.Instances[expansion][instanceType][instance][boss].players, L["GUI_EnterInstanceToStartScanning"])
                            if core.inInstance == true then
                                if core.instance == instance and instanceFound == false then
                                    core:getPlayersInGroup2()
                                    instanceFound = true
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function IAT_OnClick()
    -- EAT_GlobalToggle()
    -- IAT_GlobalToggle()
end

function deepdump( tbl )
    local checklist = {}
    local function innerdump( tbl, indent )
        checklist[ tostring(tbl) ] = true
        for k,v in pairs(tbl) do
            print(indent..k,v,type(v),checklist[ tostring(tbl) ])
            if (type(v) == "table" and not checklist[ tostring(v) ]) then innerdump(v,indent.."    ") end
        end
    end
    print("=== DEEPDUMP -----")
    checklist[ tostring(tbl) ] = true
    innerdump( tbl, "" )
    print("------------------")
end

function IAT_CheckForEscape(self, key)
    if key == "ESCAPE" then
        Config:Toggle()
        --self.UI:SetPropagateKeyboardInput(false)
    else
        --self.UI:SetPropagateKeyboardInput(true)
    end
end

-- Function to create a tab
local function CreateTab(parent, id, data)
    local tab = CreateFrame("Button", parent:GetName().."Tab"..id, parent, "PanelTabButtonTemplate")
    tab:SetID(id)
    tab:SetText(data.Title)
    tab:SetScript("OnClick", function(self)
        PanelTemplates_SetTab(parent, id)
        Config:ShowInstancesForTab(self:GetID())
    end)
    return tab
end

InstanceListScrollContainerMixin = {}

function InstanceListScrollContainerMixin:OnLoad()
    local DefaultPad = 4
    local DefaultSpacing = 2
    local indent = 2
    local view = CreateScrollBoxListTreeListView(indent, DefaultPad, DefaultPad, DefaultPad, DefaultPad, DefaultSpacing)

    local function ExpandParentOfChild(childNode, dataProvider)
        local childData = childNode:GetData()
        local parentGroupID = childData.parentGroupID

        local collapsed = false
        dataProvider:SetCollapsedByPredicate(collapsed, function(node)
            local data = node:GetData()
            return data.groupID == parentGroupID
        end)
    end

    local function SetParentCollapsedState(node, button)
        if button.ParentIndicator then
			local childCount = node:GetSize();
			button.ParentIndicator:SetShown(childCount > 0);
			if node:IsCollapsed() then
				button.ParentIndicator:SetAtlas("Campaign_HeaderIcon_Closed");
				button.ParentIndicator:SetDesaturation(0);
			else
				button.ParentIndicator:SetAtlas("Campaign_HeaderIcon_Open");
				button.ParentIndicator:SetDesaturation(1);
			end
		end
    end

    local function CategoryInit(button, node)
        local data = node:GetData()
        local groupID = data.groupID
        local isTopLevelCategory = data.parentGroupID == 0

        if isTopLevelCategory then
            button.Icon:SetTexture() --TODO
            SetParentCollapsedState(node, button)
        end
        button.Text:SetText() --TODO

        button.SelectedTexture:SetShown(false)
        if self.selectionBehaviour:IsElementDataSelected(node) then
            button.SelectedTexture:SetShown(true)
        else
            local selectedNode = self.selectionBehaviour:GetFirstSelectedElementData()
            if selectedNode then
                local selectedData = selectedNode:GetData()
                if selectedData.parentGroupID == groupID then
                    button.SelectedTexture:SetShown(true)
                end
            end
        end

        button:SetScript("OnClick", function(button, buttonName)
            local node = button:GetElementData()
            local data = node:GetData()

            local firstNode = node:GetFirstNode()
            if firstNode then
                local dataProvider = self.ScrollBox:GetDataProvider()
                self:ExpandSelectFirstChild(node, dataProvider)
            else
                self.selectionBehaviour:ToggleSelectElementData(node)
            end
        end)

        button:SetScript("OnEnter", function(button)
            if button.disabledTooltip then
                --TODO
            else
                button.HighlightTexture:Show()
            end
        end)

        button:SetScript("OnLeave", function(button)
            button.HighlightTexture:Hide()
        end)
    end

    view:SetElementFactory(function(factory, node)
        local data = node:GetData()
        local categoryTemplate = data.parentGroupID == 0 --TODO
        factory(categoryTemplate, CategoryInit)
    end)

    ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, view);

    local function OnSelectionChanged(o, node, selected)
        local dataProvider = self.ScrollBox:GetDataProvider()
        local button = self.ScrollBox:FindFrame(node)
        if button then
            local childCount = node:GetSize()
            local data = node:GetData()
            local parentGroupID = data.parentGroupID

            if childCount == 0 then
                if selected then
                    if parentGroupID > 0 then
                        ExpandParentOfChild(node, dataProvider)
                    else
                        dataProvider:CollapseAll()
                    end
                    SelectCategoryGroupID(data.groupID)
                end
            else
                if selected then
                    if parentGroupID == 0 then
                        self:ExpandSelectFirstChild(node, dataProvider)
                    else
                        ExpandParentOfChild(node, dataProvider)
                        SelectCategoryGroupID(data.groupID)
                    end
                end
            end
            if selected then
                for _, frame in self.ScrollBox:EnumerateFrames() do
                    frame.SelectedTexture:SetShown(false)
                end
                button.SelectedTexture:SetShown(true)

                local parentNode = node.parent
                local parentFrame = self.ScrollBox:FindFrame(parentNode)
                if parentFrame then
                    parentFrame.SelectedTexture:SetShown(true)
                end
            end
            for _, frame in self.ScrollBox:EnumerateFrames() do
                local nodeData = frame:GetElementData()
                SetParentCollapsedState(nodeData, frame)
            end
        end
    end
	self.selectionBehavior = ScrollUtil.AddSelectionBehavior(self.ScrollBox);
	self.selectionBehavior:RegisterCallback(SelectionBehaviorMixin.Event.OnSelectionChanged, OnSelectionChanged, self);
end

function InstanceListScrollContainerMixin:ExpandSelectFirstChild(node, dataProvider)
    node:SetCollapsed(false)
    local parentFrame = self.ScrollBox:FindFrame(node);
	parentFrame.ParentIndicator:SetAtlas("Campaign_HeaderIcon_Open");
	local firstChildNode = node.nodes[1];
	self.selectionBehavior:SelectElementData(firstChildNode);
	local data = firstChildNode:GetData();
	SelectCategoryGroupID(data.groupID);
end

function InstanceListScrollContainerMixin:OnHide()
	StoreFrame_SetSelectedCategoryID(nil);
	self.selectionBehavior:ClearSelections();
	self.ScrollBox:RemoveDataProvider();
end

function InstanceListScrollContainerMixin:OnEvent(event, ...)
    self:UpdateCategories();
    local dataProvider = self.ScrollBox:GetDataProvider();
    local childrenNodes = dataProvider:GetChildrenNodes();
    local node = dataProvider:GetFirstChildNode();
    -- If a category has already been selected (e.g. via UpgradeAccount), use that.
    -- Otherwise, use the first node.
    for idx, child in ipairs(childrenNodes) do
        -- if(child.data and child.data.groupID == StoreFrame_GetSelectedCategoryID()) then
        --     node = child;
        --     break;
        -- end
    end
    if node then
        local firstNode = node:GetFirstNode();
        if firstNode then
            self:ExpandSelectFirstChild(node, dataProvider);
        else
            self.selectionBehavior:ToggleSelectElementData(node);
        end
    end
end

BossContentMixin = {}

function BossContentMixin:OnLoad()
    print("LOADED")
end

function BossContentMixin:OnClick(self, buttonName, down)
    local elementData = self:GetElementData();
    deepdump(elementData)
    --print("CLICKED", clickedFrame:GetName(), buttonName, down)
end

function BossContentMixin:Expand(height)
	if ( not self.collapsed and self:GetHeight() == height ) then
		return;
	end
	self.collapsed = nil;
	self:SetHeight(height);
	self:GetHeight(); -- debug check
	self.Test123:Show();
end

function BossContentMixin:Collapse()
	if ( self.collapsed ) then
		return;
	end
	self.collapsed = true;
	self:SetHeight(BOSSBUTTON_COLLAPSEDHEIGHT);
	self.Test123:Hide();
end

function BossContentMixin:Init(elementData)
	self.index = elementData.index;
	self.id = elementData.id;

	self.Label:SetText(elementData.name);

    local achievementLink = GetAchievementLink(elementData.boss.achievement)
    achievementLink = achievementLink:gsub("&", "&amp;"); -- & in the achievement name would resolve the html syntax wrong
	self.Test123:SetText("<html><body><p>" .. L["GUI_Achievement"] .. ": " .. achievementLink .. "<br /><br />" .. elementData.boss.tactics .. "</p></body></html>");

    self.currentHeight = self.Test123:GetContentHeight()

    local index = Config.BossListDataProvider:FindIndex(elementData)
    Config.BossListDataProvider.collection[index].currentHeight = self.currentHeight

	if SelectionBehaviorMixin.IsElementDataIntrusiveSelected(elementData) then
		local height = self.Test123:GetContentHeight() + BOSSBUTTON_COLLAPSEDHEIGHT
		self:Expand(height);
	else
		self:Collapse()
	end
end

function BossContentMixin:SetSelected(selected)
	self:Init(self:GetElementData());
	SetFocusedAchievement(self.id);
end

function Config:CreateUI()
    --Main Frame
    -- Create the main UI frame
    self.UI = CreateFrame("Frame", "AchievementTracker", UIParent, "PortraitFrameTemplate")
    self.UI:SetTitle("Instance Achievement Tracker")
    self.UI:SetPortraitToAsset([[Interface\Icons\ACHIEVEMENT_GUILDPERK_MRPOPULARITY]])
    self.UI:SetSize(950, 567)
    self.UI:SetPoint("CENTER")
    self.UI:SetMovable(true)
    self.UI:EnableMouse(true)
    self.UI:SetClampedToScreen(true)
    self.UI:RegisterForDrag("LeftButton")
    self.UI:SetFrameStrata("HIGH")
    self.UI:SetScript("OnKeyDown", IAT_CheckForEscape)
    self.UI:SetScript("OnDragStart", self.UI.StartMoving)
    self.UI:SetScript("OnDragStop", self.UI.StopMovingOrSizing)

    Config.tabDataProvider = {
        [1] = {Title = "Options", ExpansionID = 0},
        [2] = {Title = "The War Within", ExpansionID = 11},
        [3] = {Title = "Dragonflight", ExpansionID = 10},
        [4] = {Title = "Shadowlands", ExpansionID = 9},
        [5] = {Title = "BFA", ExpansionID = 8},
        [6] = {Title = "Legion", ExpansionID = 7},
        [7] = {Title = "WoD", ExpansionID = 6},
        [8] = {Title = "MoP", ExpansionID = 5},
        [9] = {Title = "Cata", ExpansionID = 4},
        [10] = {Title = "Wotlk", ExpansionID = 3}
    }

    local tabs = {}
    for k, data in ipairs(Config.tabDataProvider) do
        tabs[k] = CreateTab(self.UI, k, data)
        if k == 1 then
            tabs[k]:SetPoint("BOTTOMLEFT", self.UI, "BOTTOMLEFT", 20, -30)
        else
            tabs[k]:SetPoint("LEFT", tabs[k-1], "RIGHT", -15, 0)
        end
    end

    -- Set the first tab as selected
    PanelTemplates_SetNumTabs(self.UI, #tabs)
    PanelTemplates_SetTab(self.UI, 1)

    -- Create Left Inset
    self.UI.LeftInset = CreateFrame("Frame", "LeftInset", self.UI)
    self.UI.LeftInset:SetPoint("TOPLEFT", 4, -40)
    self.UI.LeftInset:SetPoint("BOTTOMLEFT", 4, 6)
    self.UI.LeftInset:SetSize(237, 526)

    -- Create Right Inset
    self.UI.RightInset = CreateFrame("Frame", "RightInset", self.UI)
    self.UI.RightInset:SetPoint("TOPRIGHT", -6, -40)
    self.UI.RightInset:SetPoint("BOTTOMLEFT", self.UI.LeftInset, "BOTTOMRIGHT", 2, 0)

    -- Create Left Display
    self.UI.LeftDisplay = CreateFrame("Frame", "LeftDisplay", self.UI)
    self.UI.LeftDisplay:SetPoint("TOPLEFT", self.UI.LeftInset, "TOPLEFT", 3, -3)
    self.UI.LeftDisplay:SetPoint("BOTTOMRIGHT", self.UI.LeftInset, "BOTTOMRIGHT", -3, 3)
    local LeftDisplayTexture = self.UI.LeftDisplay:CreateTexture(nil, "BACKGROUND", "store-category-bg")
    LeftDisplayTexture:SetAllPoints(self.UI.LeftDisplay)

    -- Create Right Display
    self.UI.RightDisplay = CreateFrame("Frame", "RightDisplay", self.UI)
    self.UI.RightDisplay:SetPoint("TOPLEFT", self.UI.RightInset, "TOPLEFT", 3, -3)
    self.UI.RightDisplay:SetPoint("BOTTOMRIGHT", self.UI.RightInset, "BOTTOMRIGHT", -3, 3)
    -- local ShadowOverlay = CreateFrame("Frame", "ShadowOverlay", self.UI.RightDisplay, "ShadowOverlayTemplate")
    -- ShadowOverlay:SetAllPoints(self.UI.RightDisplay)

    self.UI.InstanceListScrollContainer = CreateFrame("Frame", "InstanceListScrollContainer", self.UI)
    self.UI.InstanceListScrollContainer:SetSize(210, 419)
    self.UI.InstanceListScrollContainer:SetPoint("TOPLEFT", self.UI.LeftInset, "TOPLEFT", 6, -8)
    self.UI.InstanceListScrollContainer:SetPoint("BOTTOMLEFT", self.UI.LeftInset, "BOTTOMRIGHT", 6, 5)

    --Create the ScrollBox Frame
    self.UI.InstanceListScrollContainer.ScrollBox = CreateFrame("Frame", "ScrollBox", self.UI.InstanceListScrollContainer, "WowScrollBoxList")
    self.UI.InstanceListScrollContainer.ScrollBox:SetPoint("TOPLEFT", 0, 0)
    self.UI.InstanceListScrollContainer.ScrollBox:SetPoint("BOTTOMRIGHT", 0, 0)

    self.UI.InstanceListScrollContainer.ScrollBar = CreateFrame("EventFrame", "ScrollBar", self.UI.InstanceListScrollContainer, "MinimalScrollBar")
    self.UI.InstanceListScrollContainer.ScrollBar:SetPoint("TOPLEFT", self.UI.InstanceListScrollContainer.ScrollBox, "TOPRIGHT", 3, 0)
    self.UI.InstanceListScrollContainer.ScrollBar:SetPoint("BOTTOMLEFT", self.UI.InstanceListScrollContainer.ScrollBox, "BOTTOMRIGHT", 3, 0)
    --self.UI.InstanceListScrollContainer.ScrollBar.hideIfUnscrollable = true


    Config.InstanceListDataProvider = CreateDataProvider()
    local ScrollView = CreateScrollBoxListLinearView()
    ScrollView:SetDataProvider(Config.InstanceListDataProvider)

    ScrollUtil.InitScrollBoxListWithScrollBar(self.UI.InstanceListScrollContainer.ScrollBox, self.UI.InstanceListScrollContainer.ScrollBar, ScrollView)

    local function Initalizer(button, data)
        button:SetScript("OnClick", function()
            Config:ShowContentForInstance(data)
        end)
        button:SetText(data.name)
        button:SetID(data.id)
    end

    ScrollView:SetElementInitializer("UIPanelButtonTemplate", Initalizer)

    self.UI.BossListScrollContainer = CreateFrame("Frame", "BossListScrollContainer", self.UI)
    self.UI.BossListScrollContainer:SetSize(690, 419)
    self.UI.BossListScrollContainer:SetPoint("TOPLEFT", self.UI.RightInset, "TOPLEFT", 0, -3)
    self.UI.BossListScrollContainer:SetPoint("BOTTOMLEFT", self.UI.RightInset, "BOTTOMRIGHT", 0, 3)

    --Mixin(self.UI.InstanceListScrollContainer, InstanceListScrollContainerMixin)

    --Create the ScrollBox Frame
    self.UI.BossListScrollContainer.ScrollBox = CreateFrame("Frame", "ScrollBox", self.UI.BossListScrollContainer, "WowScrollBoxList")
    self.UI.BossListScrollContainer.ScrollBox:SetPoint("TOPLEFT", 0, 0)
    self.UI.BossListScrollContainer.ScrollBox:SetPoint("BOTTOMRIGHT", 0, 0)

    self.UI.BossListScrollContainer.ScrollBar = CreateFrame("EventFrame", "ScrollBar", self.UI.BossListScrollContainer, "MinimalScrollBar")
    self.UI.BossListScrollContainer.ScrollBar:SetPoint("TOPLEFT", self.UI.BossListScrollContainer.ScrollBox, "TOPRIGHT", 3, 0)
    self.UI.BossListScrollContainer.ScrollBar:SetPoint("BOTTOMLEFT", self.UI.BossListScrollContainer.ScrollBox, "BOTTOMRIGHT", 3, 0)
    Mixin(self.UI.BossListScrollContainer, BossContentMixin)


    Config.BossListDataProvider = CreateDataProvider()
    local ScrollView2 = CreateScrollBoxListLinearView()

    ScrollView2:SetElementExtentCalculator(function(dataIndex, elementData)
        if SelectionBehaviorMixin.IsElementDataIntrusiveSelected(elementData) then
            local totalHeight = BOSSBUTTON_COLLAPSEDHEIGHT
            totalHeight = totalHeight + elementData.currentHeight

            print(totalHeight)
            return totalHeight
        else
            return BOSSBUTTON_COLLAPSEDHEIGHT
        end
    end)

    local function BossInitializer(button, data)
        button:SetScript("OnClick", function(self)
            g_achievementSelectionBehavior:ToggleSelect(self);
        end)

        button.OutputTactics:SetScript("OnClick", function(self)
            core:detectGroupType()
            if core.gameVersionMajor > 4 then
                core:sendMessageSafe(GetAchievementLink(data.boss.achievement) .. " " .. data.boss.tactics)
            else
                core:sendMessageSafe(GetAchievementLink(data.boss.achievement) .. " " .. data.boss.tacticsClassic)
            end
        end)

        button.OutputPlayers:SetScript("OnClick", function(self)

        end)

        button.Test123:SetScript("OnHyperlinkEnter", function(abc, linkData, link, button)
            GameTooltip:SetOwner(self.UI, "ANCHOR_TOPRIGHT")
            GameTooltip:SetHyperlink(linkData)
            GameTooltip:Show()
        end)
        button.Test123:SetScript("OnHyperlinkLeave", function(self, linkData, link, button)
            GameTooltip:Hide()
        end)

        button.Label:SetText(data.name)
        button.Test123:Hide()
        button.OutputTactics:SetWidth(110)
        button.OutputPlayers:SetWidth(110)
    end

    ScrollView2:SetElementInitializer("CustomFrameTemplate", BossInitializer)
    ScrollView2:SetDataProvider(Config.BossListDataProvider)
    ScrollUtil.InitScrollBoxListWithScrollBar(self.UI.BossListScrollContainer.ScrollBox, self.UI.BossListScrollContainer.ScrollBar, ScrollView2)

    g_achievementSelectionBehavior = ScrollUtil.AddSelectionBehavior(self.UI.BossListScrollContainer.ScrollBox, SelectionBehaviorFlags.Deselectable, SelectionBehaviorFlags.Intrusive)
    g_achievementSelectionBehavior:RegisterCallback(SelectionBehaviorMixin.Event.OnSelectionChanged, function(o, elementData, selected)
        local button = self.UI.BossListScrollContainer.ScrollBox:FindFrame(elementData)
        if button then
            button:SetSelected(selected);
        end
    end, self)

    ScrollUtil.AddResizableChildrenBehavior(self.UI.BossListScrollContainer.ScrollBox);

    self.UI:Show()
end

function Config:ShowContentForInstance(data)
    local instanceName = data.name

    Config.BossListDataProvider:Flush()
    self.UI.BossListScrollContainer.ScrollBox:FullUpdate(ScrollBoxConstants.UpdateImmediately);

    local bossesToSort = {}

    for i, boss in pairs(core.Instances[data.ExpansionID][data.InstanceType][data.id]) do
        if string.match(i, "boss") then
            local data = {
                key = i,
                name = Config:getLocalisedEncouterName(boss.name, data.InstanceType),
                tactics = boss.tactics,
                tracking = boss.track,
                currentHeight = BOSSBUTTON_COLLAPSEDHEIGHT,
                boss = boss,
                Expanded = true
            }

            print(data.key)

            table.insert(bossesToSort, data)

            --Config.BossListDataProvider:Insert(data)
        end
    end

    table.sort(bossesToSort, function(a, b)
        return a.key < b.key
    end)

    for i, boss in ipairs(bossesToSort) do
        Config.BossListDataProvider:Insert(boss)
    end

    deepdump(Config.BossListDataProvider.collection)
end

-- Function to show instances for a given tab
function Config:ShowInstancesForTab(tabID)
    local data = Config.tabDataProvider[tabID]

    Config.InstanceListDataProvider:Flush()
    Config.BossListDataProvider:Flush()

    local instancesToSort = {}

    for instanceType, instances in pairs(core.Instances[data.ExpansionID]) do
        for instance, v in pairs(instances) do
            local instanceName

            if (core.gameVersionMajor > 4 and v.classicOnly ~= true) or (core.gameVersionMajor == 4 and v.retailOnly ~= true) then
                -- Do not load classic only instance on retail and vice versa

                if (core.gameVersionMajor == 3 and data.ExpansionID == 3) or (core.gameVersionMajor == 4 and data.ExpansionID == 3) then
                    -- For wrath we must fetch the localized names as the encounter journal is not available
                    if v.classicPhase <= Config.classicPhase then
                        instanceName = v.nameLocalised
                    end
                else
                    -- All other expansions have the encounter journal so pass the ID to fetch from API
                    -- In classic cata only cata is in encounter journal
                    if core.gameVersionMajor == 4 then
                        if data.ExpansionID == 4 then
                            instanceName = Config:getLocalisedInstanceName(v.name)
                        else
                            instanceName = ""
                        end
                    else
                        instanceName = Config:getLocalisedInstanceName(v.name)
                    end
                end

                if instanceName ~= nil then
                    table.insert(instancesToSort, {
                        name = instanceName,
                        id = instance,
                        ExpansionID = data.ExpansionID,
                        InstanceType = instanceType
                    })
                end
            end
        end
    end

    -- Define the custom sorting order
    local order = { Raids = 1, Dungeons = 2, Scenarios = 3 }

    -- Sort the instances based on the custom order and alphabetically by name
    table.sort(instancesToSort, function(a, b)
        if order[a.InstanceType] == order[b.InstanceType] then
            return a.name < b.name
        else
            return order[a.InstanceType] < order[b.InstanceType]
        end
    end)

    -- Insert the sorted instances into the DataProvider
    for _, instance in ipairs(instancesToSort) do
        Config.InstanceListDataProvider:Insert(instance)
    end
end

-- Function to show the options panel
function Config:ShowOptionsPanel()
end

-- Method:          Config:Instance_OnClickAutomatic()
-- What it Does:    Calls the Instance_OnClick() function
-- Purpose:         This is used when automatically selected the tab after enabling achievement for an instance
function Config:Instance_OnClickAutomatic()
end

function Config:Instance_OnClickAPI()
end

function Player_OnClick(self)
    core:detectGroupType()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if string.match(boss, "boss") then
                        if core.Instances[expansion][instanceType][instance][boss].generatedID == self:GetID() then
                            local players
                            if core.inInstance == true then
                                if core.Instances[expansion][instanceType][instance][boss].players[1] == "(" .. L["GUI_NoPlayersNeedAchievement"] .. ")" then
                                    if core.scanFinished == true then
                                        players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["GUI_NoPlayersNeedAchievement"]
                                    else
                                        players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["GUI_NoPlayersNeedAchievement"] .. " (" .. L["scan still in progress"] .. ")"
                                    end
                                elseif core.Instances[expansion][instanceType][instance][boss].players[1] == L["GUI_EnterInstanceToStartScanning"] then
                                    players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement)
                                else
                                    players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["GUI_PlayersWhoNeedAchievement"] .. ": "

                                    for i = 1, #core.Instances[expansion][instanceType][instance][boss].players do
                                        players = players .. core.Instances[expansion][instanceType][instance][boss].players[i] .. ", "
                                    end

                                    if core.scanFinished == false then
                                        players = players .. " (" .. L["GUI_ScanInProgress"] .. ")"
                                    end
                                end
                            else
                                players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement)
                            end

                            --Send message to chat
                            core:sendMessageSafe(players)
                        end
                    end
                end
			end
		end
	end
end

function Enabled_OnClick(self)
    core:detectGroupType()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if string.match(boss, "boss") then
                        if core.Instances[expansion][instanceType][instance][boss].generatedID == self:GetID() then
                            core.Instances[expansion][instanceType][instance][boss].enabled = self:GetChecked()
                            --Print to chat
                            local status = nil
                            if core.Instances[expansion][instanceType][instance][boss].enabled == false then
                                status = L["GUI_Disabled"]
                            else
                                status = L["GUI_Enabled"]
                            end
                            core:printMessage(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["GUI_Tracking"] .. " " .. status)
                        end
                    end
                end
			end
		end
	end
end

SlashCmdList["EXPANDEXAMPLE"] = ExpandExample_UpdateList
SLASH_EXPANDEXAMPLE1 = "/ex"

getGameBuild()
Config:CreateUI()
--UI:Hide()


------------------------------------------------------
------- Functions to create dynamic info frame -------
------------------------------------------------------
function IATInfoFrame:SetupInfoFrame()
    InfoFrame = CreateFrame("Frame", "AchievementTrackerInfoFrame", UIParent)
    InfoFrame:SetSize(200, 300)
    InfoFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 420, 500)

    --Initialise LibWindow
    local names = {
        prefix = "InfoFrame",
    }
    core.LibWindow.RegisterConfig(InfoFrame, AchievementTrackerOptions, names)
    core.LibWindow.RestorePosition(InfoFrame)
    core.LibWindow.MakeDraggable(InfoFrame)
    InfoFrame:EnableMouse(true)
    core.LibWindow.EnableMouseWheelScaling(InfoFrame)

    core:sendDebugMessage("InfoFrame Setup Complete")
    InfoFrame:SetShown(false)
end

function IATInfoFrame:SetHeading(text)
    if InfoFrame.heading == nil then
        InfoFrame.heading = InfoFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlightLarge")
    end
    InfoFrame.heading:SetText(text)
    InfoFrame.heading:SetHeight(InfoFrame.heading:GetStringHeight())
    InfoFrame.heading:SetPoint("TOPLEFT", InfoFrame, "TOPLEFT", 5, -5)
end

function IATInfoFrame:SetSubHeading1(text)
    if InfoFrame.subHeading1 == nil then
        InfoFrame.subHeading1 = InfoFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlightLarge")
    end
    InfoFrame.subHeading1:SetText(text)
    InfoFrame.subHeading1:SetHeight(InfoFrame.subHeading1:GetStringHeight())
    InfoFrame.subHeading1:ClearAllPoints()
    InfoFrame.subHeading1:SetPoint("TOPLEFT", InfoFrame.heading, "BOTTOMLEFT", 0, -5)
end

function IATInfoFrame:SetText1(text,size,colour,width)
    if InfoFrame.setText1 == nil then
        if size == nil then
            InfoFrame.setText1 = InfoFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlight")
        else
            InfoFrame.setText1 = InfoFrame:CreateFontString(nil, "BACKGROUND", size)
        end
    end

    if width ~= nil then
        InfoFrame.setText1:SetWidth(width)
    end

    InfoFrame.setText1:SetText(text)
    InfoFrame.setText1:SetHeight(InfoFrame.setText1:GetStringHeight())
    InfoFrame.setText1:SetPoint("TOPLEFT", InfoFrame.subHeading1, "BOTTOMLEFT", 0, -5)

    InfoFrame.setText1:SetJustifyH("LEFT")
    InfoFrame.setText1:SetJustifyV("TOP")
end

function IATInfoFrame:SetSubHeading2(text)
    if InfoFrame.setSubHeading2 == nil then
        InfoFrame.setSubHeading2 = InfoFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlightLarge")
    end
    InfoFrame.setSubHeading2:SetText(text)
    InfoFrame.setSubHeading2:SetHeight(InfoFrame.setSubHeading2:GetStringHeight())
    InfoFrame.setSubHeading2:SetPoint("TOPLEFT", InfoFrame.setText1, "BOTTOMLEFT", 0, -5)

    InfoFrame.setSubHeading2:SetJustifyH("LEFT")
    InfoFrame.setSubHeading2:SetJustifyV("TOP")
end

function IATInfoFrame:SetText2(text,width)
    if InfoFrame.setText2 == nil then
        InfoFrame.setText2 = InfoFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlight")
    end

    if width ~= nil then
        InfoFrame.setText2:SetWidth(width)
    end

    InfoFrame.setText2:SetText(text)
    InfoFrame.setText2:SetHeight(InfoFrame.setText2:GetStringHeight())
    InfoFrame.setText2:SetPoint("TOPLEFT", InfoFrame.setSubHeading2, "BOTTOMLEFT", 0, -5)

    InfoFrame.setText2:SetJustifyH("LEFT")
    InfoFrame.setText2:SetJustifyV("BOTTOM")
end

function IATInfoFrame:SetPosition(x,y,scaleFactor)
    InfoFrame:ClearAllPoints()
    InfoFrame:SetPoint("TOPLEFT",x/scaleFactor,y/scaleFactor)
    --print(AchievementTrackerOptions["infoFrameXPos"], AchievementTrackerOptions["infoFrameYPos"])
end

function IATInfoFrame:ChangeScale(scaleFactor)
    Left = AchievementTrackerOptions["infoFrameXPos"]
    Bottom = AchievementTrackerOptions["infoFrameYPos"]
    AchievementTrackerOptions["infoFrameScale"] = scaleFactor
    InfoFrameScale = scaleFactor

    InfoFrame:ClearAllPoints()
    InfoFrame:SetScale(scaleFactor)

    Config.LibWindowInfoFrame:SavePosition()
    --core.IATInfoFrame:SetPosition(Left, Bottom, scaleFactor)
end

function IATInfoFrame:ToggleOn()
    InfoFrame:SetShown(true)
end

function IATInfoFrame:ToggleOff()
    InfoFrame:SetShown(false)
end

function IATInfoFrame:IsVisible()
    return InfoFrame:IsVisible()
end

function IATInfoFrame:Reset()
    IATInfoFrame:ToggleOff()
    IATInfoFrame:SetHeading()
    IATInfoFrame:SetSubHeading1()
    IATInfoFrame:SetText1()
    IATInfoFrame:SetSubHeading2()
    IATInfoFrame:SetText2()
    core.InfoFrame_PlayersTable = {}
    core.InfoFrame_DynamicTable = {}
    core:sendDebugMessage("InfoFrame has been reset")
end

local tip = myTooltipFromTemplate or CreateFrame("GAMETOOLTIP", "myTooltipFromTemplate",nil,"GameTooltipTemplate")

-- takes an npcID and returns the name of the npc
function GetNameFromNpcIDCache(npcID)
    tip:SetOwner(WorldFrame, "ANCHOR_NONE")
    tip:SetHyperlink(format("unit:Creature-0-0-0-0-%d-0000000000",npcID))
    if tip:NumLines()>0 then
        local name = myTooltipFromTemplateTextLeft1:GetText()
        tip:Hide()
        if core.gameVersionMajor > 4 then
            core.NPCCache[npcID] = name
        else
            core.NPCCacheClassic[npcID] = name
        end

        --print(name)
		for expansion, _ in pairs(core.Instances) do
			for instanceType, _ in pairs(core.Instances[expansion]) do
				for instance, _ in pairs(core.Instances[expansion][instanceType]) do
					for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                        if string.match(boss, "boss") then
                            if type(core.Instances[expansion][instanceType][instance][boss].tactics) == "table" then
                                if UnitFactionGroup("player") == "Alliance" then
                                    if string.find(core.Instances[expansion][instanceType][instance][boss].tactics[1], ("IAT_" .. npcID)) then
                                        core.Instances[expansion][instanceType][instance][boss].tactics[1] = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics[1], ("IAT_" .. npcID), name)
                                    end
                                else
                                    if string.find(core.Instances[expansion][instanceType][instance][boss].tactics[2], ("IAT_" .. npcID)) then
                                        core.Instances[expansion][instanceType][instance][boss].tactics[2] = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics[2], ("IAT_" .. npcID), name)
                                    end
                                end
                            else
                                if string.find(core.Instances[expansion][instanceType][instance][boss].tactics, ("IAT_" .. npcID)) then
                                    core.Instances[expansion][instanceType][instance][boss].tactics = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics, ("IAT_" .. npcID), name)
                                end
                            end
						end
					end
				end
			end
        end

        --Add NPC to NPCCache
        if core.gameVersionMajor > 4 then
            AchievementTrackerNPCCache[npcID] = name
        else
            AchievementTrackerNPCCacheClassic[npcID] = name
        end
    else
        C_Timer.After(0.1, function()
            if tip:NumLines()>0 then
                local name = myTooltipFromTemplateTextLeft1:GetText()
                tip:Hide()
                if core.gameVersionMajor > 4 then
                    core.NPCCache[npcID] = name
                else
                    core.NPCCacheClassic[npcID] = name
                end
                for expansion, _ in pairs(core.Instances) do
                    for instanceType, _ in pairs(core.Instances[expansion]) do
                        for instance, _ in pairs(core.Instances[expansion][instanceType]) do
                            for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                                if string.match(boss, "boss") then
                                    if string.find(core.Instances[expansion][instanceType][instance][boss].tactics, ("IAT_" .. npcID)) then
                                        core.Instances[expansion][instanceType][instance][boss].tactics = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics, ("IAT_" .. npcID), name)
                                    end
                                end
                            end
                        end
                    end
                end

                --Add NPC to NPCCache
                if core.gameVersionMajor > 4 then
                    AchievementTrackerNPCCache[npcID] = name
                else
                    AchievementTrackerNPCCacheClassic[npcID] = name
                end
            else
                GetNameFromNpcIDCache(npcID)
            end
        end)
    end
end

function GetNameFromLocalNpcIDCache()
    --Attempt to fetch NPC name from local cache if it exists
    if core.gameVersionMajor > 4 then
        if AchievementTrackerNPCCache ~= nil then
            tmpSortedTable = {}
            for k in pairs(AchievementTrackerNPCCache) do table.insert(tmpSortedTable, k) end
            table.sort(tmpSortedTable)

            for i = #tmpSortedTable, 1, -1 do
                if tmpSortedTable[i] ~= nil then
                    npcID = tmpSortedTable[i]
                    for expansion, _ in pairs(core.Instances) do
                        for instanceType, _ in pairs(core.Instances[expansion]) do
                            for instance, _ in pairs(core.Instances[expansion][instanceType]) do
                                for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                                    if string.match(boss, "boss") then
                                        if type(core.Instances[expansion][instanceType][instance][boss].tactics) == "table" then
                                            if UnitFactionGroup("player") == "Alliance" then
                                                if string.find(core.Instances[expansion][instanceType][instance][boss].tactics[1], ("IAT_" .. npcID)) then
                                                    core.Instances[expansion][instanceType][instance][boss].tactics[1] = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics[1], ("IAT_" .. npcID), AchievementTrackerNPCCache[npcID])
                                                end
                                            else
                                                if string.find(core.Instances[expansion][instanceType][instance][boss].tactics[2], ("IAT_" .. npcID)) then
                                                    core.Instances[expansion][instanceType][instance][boss].tactics[2] = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics[2], ("IAT_" .. npcID), AchievementTrackerNPCCache[npcID])
                                                end
                                            end
                                        else
                                            if string.find(core.Instances[expansion][instanceType][instance][boss].tactics, ("IAT_" .. npcID)) then
                                                core.Instances[expansion][instanceType][instance][boss].tactics = string.gsub(core.Instances[expansion][instanceType][instance][boss].tactics, ("IAT_" .. npcID), AchievementTrackerNPCCache[npcID])
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        if AchievementTrackerNPCCacheClassic ~= nil then
            tmpSortedTable = {}
            for k in pairs(AchievementTrackerNPCCacheClassic) do table.insert(tmpSortedTable, k) end
            table.sort(tmpSortedTable)

            for i = #tmpSortedTable, 1, -1 do
                if tmpSortedTable[i] ~= nil then
                    npcID = tmpSortedTable[i]
                    for expansion, _ in pairs(core.Instances) do
                        if expansion == 3 then
                            for instanceType, _ in pairs(core.Instances[expansion]) do
                                for instance, _ in pairs(core.Instances[expansion][instanceType]) do
                                    for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                                        if string.match(boss, "boss") then
                                            if type(core.Instances[expansion][instanceType][instance][boss].tacticsClassic) == "table" then
                                                if UnitFactionGroup("player") == "Alliance" then
                                                    if string.find(core.Instances[expansion][instanceType][instance][boss].tacticsClassic[1], ("IAT_" .. npcID)) then
                                                        core.Instances[expansion][instanceType][instance][boss].tacticsClassic[1] = string.gsub(core.Instances[expansion][instanceType][instance][boss].tacticsClassic[1], ("IAT_" .. npcID), AchievementTrackerNPCCacheClassic[npcID])
                                                    end
                                                else
                                                    if string.find(core.Instances[expansion][instanceType][instance][boss].tacticsClassic[2], ("IAT_" .. npcID)) then
                                                        core.Instances[expansion][instanceType][instance][boss].tacticsClassic[2] = string.gsub(core.Instances[expansion][instanceType][instance][boss].tacticsClassic[2], ("IAT_" .. npcID), AchievementTrackerNPCCacheClassic[npcID])
                                                    end
                                                end
                                            else
                                                if string.find(core.Instances[expansion][instanceType][instance][boss].tacticsClassic, ("IAT_" .. npcID)) then
                                                    core.Instances[expansion][instanceType][instance][boss].tacticsClassic = string.gsub(core.Instances[expansion][instanceType][instance][boss].tacticsClassic, ("IAT_" .. npcID), AchievementTrackerNPCCacheClassic[npcID])
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

--API
local lastAchievementID, lastExpansion, lastInstanceType, lastInstance;
function IAT_HasAchievement(achievementID)
	lastAchievementID, lastExpansion, lastInstanceType, lastInstance = achievementID, nil, nil, nil

    -- Check if IAT has the achievement
    for expansion, _ in pairs(core.Instances) do
        for instanceType, _ in pairs(core.Instances[expansion]) do
            for instance, _ in pairs(core.Instances[expansion][instanceType]) do
                for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if string.match(boss, "boss") then
                        if core.Instances[expansion][instanceType][instance][boss].achievement == achievementID then
                            -- Achievement found
                            lastExpansion, lastInstanceType, lastInstance = expansion, instanceType, instance
                            return true
                        end
                    end
                end
            end
        end
    end
	-- No achievement with this ID

	return false
end

function IAT_DisplayAchievement(achievementID)
    -- Open IAT Gui and display the specific achievement

	-- Check here if IAT_HasAchievement has already been called for the same achievement ID
    local valid = lastAchievementID == achievementID;
    if not valid then
        valid = IAT_HasAchievement(achievementID)
    end
	-- If valid and none of the other 3 are nil, show the tactics
    if valid and lastExpansion and lastInstanceType and lastInstance then
        IAT_InstanceType = lastInstanceType
        IAT_InstanceLocation = lastInstance
        IAT_CurrentTab = lastExpansion

        Config:Instance_OnClickAPI("API")

        Config:ToggleOn()
	end
end
