-- Purpose:         Namespace
local _, core = ...         --Global addon namespace
local L = core.L            --Global localisation table
core.Config = {}            --Add a config table to the addon namespace
core.IATInfoFrame = {}         --A frame for displaying useful information about the encounter during a fight without having to use chat channel
local InfoFrame

-- Purpose:         Stores all the frames for each tab in the GUI.
local Config = core.Config
local IATInfoFrame = core.IATInfoFrame
local DragonflightContent
local DragonflightContentButtons = {}
local ShadowlandsContent
local ShadowlandsContentButtons = {}
local BattleForAzerothContent
local BattleForAzerothContentButtons = {}
local LegionContent
local LegionContentButtons = {}
local WarlordsOfDraenorContent
local WarlordsOfDraenorContentButtons = {}
local MistsOfPandariaContent
local MistsOfPandariaContentButtons = {}
local CataclysmContent
local CataclysmContentButtons = {}
local WrathOfTheLichKingContent
local WrathOfTheLichKingContentButtons = {}

local Left = nil
local Top = nil
local InfoFrameScale = nil
local InfoFrameTestBarsActive = false

--API
local IAT_InstanceLocation = nil
local IAT_InstanceType = nil
local IAT_CurrentTab = nil

-- Purpose:                         Stores information about the current status of the GUI
Config.currentTab = nil             --Stores which tab is currently selected
Config.currentInstance = nil        --Stores which instance is currently selected

-- Purpose:         Stores information about the current options in the GUI
AchievementTrackerOptions = {}

-- Purpose:         Stores NPC names
AchievementTrackerNPCCache = {}
AchievementTrackerNPCCacheClassic = {}

-- Purpose:         Information about the current release. This is mianly used to detect which addon should output messages to chat to avoid spam
Config.majorVersion = 4						--Addon with a higher major version change have priority over a lower major version
Config.minorVersion = 43    				--Addon with a minor version change have prioirty over a lower minor version
Config.revisionVersion = 0					--Addon with a revision change have the same priorty as a lower revision verison
Config.releaseType = ""                     --Release type (Alpha, Beta, Release)
Config.classicPhase = 5                     --What phase classic realms are currently running

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
    if core.gameVersionMajor > 3 then
        return EJ_GetInstanceInfo(instanceID)
    else
        return ""
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
    local GUI = UIConfig or Config:CreateGUI()
    GUI:SetShown(not GUI:IsShown())
    GameTooltip:Hide()
end

function Config:ToggleOn()
    --Toggle on only
    local GUI = UIConfig or Config:CreateGUI()
    GUI:SetShown(true)
    GameTooltip:Hide()
end

function IAT_GlobalToggle()
    local GUI = UIConfig or Config:CreateGUI()
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
    local text = UIConfig:CreateFontString(nil, "OVERLAY", size)
    text:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
    text:SetText(textString)
    return text
end

-- Method:          Tab_OnClick()
-- What it Does:    Event fired when the user clicks on a tab
-- Purpose:         This is used to load the correct frames when clicking on each of the tabs
function Tab_OnClick(self)
    Config.currentTab = self:GetID();                           --Get the ID of the tab the user has selected.

    if Config.currentTab == 10 then
        --Dragonflight
        PanelTemplates_SetTab(self:GetParent(), 2)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 9 then
        --Shadowlands
        PanelTemplates_SetTab(self:GetParent(), 3)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 8 then
        --BFA
        PanelTemplates_SetTab(self:GetParent(), 4)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 7 then
        --Legion
        PanelTemplates_SetTab(self:GetParent(), 5)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 6 then
        --WoD
        PanelTemplates_SetTab(self:GetParent(), 6)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 5 then
        --Panda
        PanelTemplates_SetTab(self:GetParent(), 7)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 4 then
        --Cata
        PanelTemplates_SetTab(self:GetParent(), 8)       --Changed the selected tab to the tab the user has just clicked on
    elseif Config.currentTab == 3 then
        --WoTLK
        PanelTemplates_SetTab(self:GetParent(), 9)
    else
        PanelTemplates_SetTab(self:GetParent(), self:GetID())       --Changed the selected tab to the tab the user has just clicked on
    end

    --This scrollframe holds the button for each instances shown on the expansion tabs
    --If this scrollframe is currently being shown then hide it and shown the correct frame for the tab that has just been clicked
    local scrollChild = UIConfig.ScrollFrame:GetScrollChild()
    if scrollChild then
        scrollChild:Hide()
    end
    UIConfig.ScrollFrame:SetScrollChild(self.content)

    --This scrollframe holds the tactics, achievements and players for the selected instance.
    --If this scrollframe is currently being shown then hide it and shown the correct frame for the tab that has just been clicked
    local scrollChild2 = UIConfig.ScrollFrame2:GetScrollChild()
    if scrollChild2 then
        scrollChild2:Hide()
    end
    if Config.currentTab > 1 then
        UIConfig.ScrollFrame2:SetScrollChild(self.contenta)
    end

    --Show the content for the selected instances
    self.content:Show()
    if self.contenta ~= nil then
        self.contenta:Show()
    end

    if Config.currentTab == 1 then      --User has clicked on the "Main" tab
        UIConfig.ScrollFrame:Hide()
        UIConfig.ScrollFrame2:Hide()

        if UIConfig.Main then   --Main tab frames have already been created so just shown them.
            UIConfig.Main:Show()
            UIConfig.Main2:Show()

            -- UIConfig.Main2.features:Show()
            -- UIConfig.Main2.features1:Show()
            -- UIConfig.Main2.features2:Show()
            -- UIConfig.Main2.features3:Show()
            -- UIConfig.Main2.features4:Show()
            -- UIConfig.Main2.features5:Show()
            -- UIConfig.Main2.features6:Show()

            UIConfig.Main2.options:Show()
            UIConfig.Main2.options:Show()
            UIConfig.Main2.options2:Show()
            UIConfig.Main2.options3:Show()
            UIConfig.Main2.options4:Show()
            UIConfig.Main2.options5:Show()
            UIConfig.Main2.options6:Show()
            UIConfig.Main2.options7:Show()
            UIConfig.Main2.options8:Show()
            UIConfig.Main2.options9:Show()
            UIConfig.Main2.options10:Show()
            UIConfig.Main2.options11:Show()
            UIConfig.Main2.options12:Show()
            UIConfig.Main2.options012:Show()
            UIConfig.Main2.options013:Show()
            UIConfig.Main2.options13:Show()
            -- UIConfig.Main2.options14:Show()
            UIConfig.Main2.options15:Show()
            -- UIConfig.Main2.options16:Show()
            UIConfig.Main2.options17:Show()
            UIConfig.Main2.options18:Show()
            UIConfig.Main2.options19:Show()
            UIConfig.Main2.options20:Show()
            UIConfig.Main2.options21:Show()
            UIConfig.Main2.options22:Show()
            UIConfig.Main2.options23:Show()
            UIConfig.Main2.options24:Show()
            UIConfig.Main2.options25:Show()
            UIConfig.Main2.options26:Show()
            UIConfig.Main2.options27:Show()
            UIConfig.Main2.options28:Show()
            UIConfig.Main2.options29:Show()
            UIConfig.Main2.options30:Show()
            UIConfig.Main2.options31:Show()
            UIConfig.Main2.options32:Show()
            UIConfig.Main2.options33:Show()
            UIConfig.Main2.options34:Show()
            -- UIConfig.Main2.options35:Show()
            -- UIConfig.Main2.options36:Show()
            -- UIConfig.Main2.options37:Show()

            UIConfig.Main.author:Show()
            UIConfig.Main.tacticsCredit:Show()
            UIConfig.Main.verison:Show()

            UIConfig.Main2.content:Show()
            UIConfig.Main2.content2:Show()

            UIConfig.Main2.credits:Show()
            UIConfig.Main2.credits2:Show()
            UIConfig.Main2.credits3:Show()

            if UIConfig.Main.translators ~= nil then
                UIConfig.Main.translators:Show()
            end

            if UIConfig.achievementsCompleted ~= nil then
                UIConfig.achievementsCompleted:Hide()
            end
        else                                    --Main tab frames have not been created so need to create frames first before showing.
            --Heading
            UIConfig.Main = Config:CreateText2("TOP", AchievementTrackerDialogBG, "TOP", 0, -10, "Instance Achievement Tracker", "GameFontNormalLarge")
            UIConfig.Main:SetWidth(750)

            --Author & Translators
            if (GetLocale() == "enGB" or GetLocale() == "enUS") then
                UIConfig.Main.author = Config:CreateText2("BOTTOMRIGHT", AchievementTrackerDialogBG, "BOTTOMRIGHT", -5, 20, L["GUI_Author"] .. ": (EU) Whizzey-Doomhammer","GameFontNormal")
                UIConfig.Main.tacticsCredit = Config:CreateText2("BOTTOMRIGHT", AchievementTrackerDialogBG, "BOTTOMRIGHT", -5, 5,L["GUI_Tactics"] .. ": " .. L["Gui_TacticsNames"],"GameFontNormal")
            else
                UIConfig.Main.author = Config:CreateText2("BOTTOMRIGHT", AchievementTrackerDialogBG, "BOTTOMRIGHT", -5, 35, L["GUI_Author"] .. ": (EU) Whizzey-Doomhammer","GameFontNormal")
                UIConfig.Main.translators = Config:CreateText2("BOTTOMRIGHT", AchievementTrackerDialogBG, "BOTTOMRIGHT", -5, 20,L["GUI_Translators"] .. ": " .. L["Gui_TranslatorNames"],"GameFontNormal")
                UIConfig.Main.tacticsCredit = Config:CreateText2("BOTTOMRIGHT", AchievementTrackerDialogBG, "BOTTOMRIGHT", -5, 5,L["GUI_Tactics"] .. ": " .. L["Gui_TacticsNames"],"GameFontNormal")
            end

            --Version
            UIConfig.Main.verison = Config:CreateText2("BOTTOMLEFT", AchievementTrackerDialogBG, "BOTTOMLEFT", 5, 5, "v" .. Config.majorVersion .. "." .. Config.minorVersion .. "." .. Config.revisionVersion .. Config.releaseType,"GameFontNormal")

            --Currently tracking
            UIConfig.Main2 = Config:CreateText2("TOPLEFT", UIConfig.Main, "TOPLEFT", 0, -45, L["GUI_TrackingNumber"] .. ":","GameFontNormalLarge")
            UIConfig.Main2:SetWidth(300)
            UIConfig.Main2:SetJustifyH("LEFT")

            --Work out how many achievements and tactics are currently being tracked
            local achievementsTracked = 0
            local tacticsTracked = 0
            local totalCount = 0

            for expansion, _ in pairs(core.Instances) do
                for instanceType, _ in pairs(core.Instances[expansion]) do
                    for instance, _ in pairs(core.Instances[expansion][instanceType]) do
                        for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                            if string.match(boss, "boss") then
                                if core.Instances[expansion][instanceType][instance][boss].track ~= nil then
                                    achievementsTracked = achievementsTracked + 1
                                end
                                if #core.Instances[expansion][instanceType][instance][boss].tactics > 1 then
                                    tacticsTracked = tacticsTracked + 1
                                end
                                totalCount = totalCount + 1
                            end
                        end
                    end
                end
            end

            UIConfig.Main2.content = Config:CreateText2("TOPLEFT", UIConfig.Main2, "TOPLEFT", 0, -20, achievementsTracked .. " " .. L["GUI_Achievements"] .. " (" .. tonumber(string.format("%.0f", (achievementsTracked/totalCount)*100)) .. "%)","GameFontHighlight")
            UIConfig.Main2.content2 = Config:CreateText2("TOPLEFT", UIConfig.Main2.content, "TOPLEFT", 0, -15, tacticsTracked .. " " .. L["GUI_Tactics"] .. " (" .. tonumber(string.format("%.0f", (tacticsTracked/totalCount)*100)) .. "%)","GameFontHighlight")

            -- --Features
            -- UIConfig.Main2.features = Config:CreateText2("TOPLEFT", UIConfig.Main2.content, "TOPLEFT", 0, -40, L["Features"] .. ":","GameFontNormalLarge")
            -- UIConfig.Main2.features:SetWidth(750)
            -- UIConfig.Main2.features:SetJustifyH("LEFT")
            -- UIConfig.Main2.features1 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features, "TOPLEFT", 0, -20, L["- Tracks when the criteria of instance achievements have been met and output this to chat"],"GameFontHighlight")
            -- UIConfig.Main2.features2 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features1, "TOPLEFT", 0, -20, L["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"],"GameFontHighlight")
            -- UIConfig.Main2.features3 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features2, "TOPLEFT", 0, -20, L["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."],"GameFontHighlight")
            -- UIConfig.Main2.features4 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features3, "TOPLEFT", 0, -30, L["- Scans all players in the group to see which achievements each player is missing for the current instance"],"GameFontHighlight")
            -- UIConfig.Main2.features5 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features4, "TOPLEFT", 0, -20, L["- Announce to chat players who are missing achievements for certain bosses"],"GameFontHighlight")
            -- UIConfig.Main2.features6 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features5, "TOPLEFT", 0, -20, L["- Announce to chat tactics for a certain boss"],"GameFontHighlight")
            -- UIConfig.Main2.features3:SetWidth(750)
            -- UIConfig.Main2.features3:SetJustifyH("LEFT")

            --Options
            UIConfig.Main2.options = Config:CreateText2("TOPLEFT", UIConfig.Main2.content2, "TOPLEFT", 0, -30, L["GUI_Options"] .. ":","GameFontNormalLarge")
            UIConfig.Main2.options:SetWidth(750)
            UIConfig.Main2.options:SetJustifyH("LEFT")

            --Enable Addon
            UIConfig.Main2.options2 = Config:CreateCheckBox("TOPLEFT", UIConfig, "TOPLEFT", 20, -160, "AchievementTracker_EnableAddon")
            UIConfig.Main2.options2:SetScript("OnClick", enableAddon_OnClick)
            UIConfig.Main2.options3 = Config:CreateText2("TOPLEFT", UIConfig, "TOPLEFT", 51, -170, L["GUI_EnableAddon"],"GameFontHighlight")
            UIConfig.Main2.options2:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_EnableAddonDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options2:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Toggle Minimap Icon
            UIConfig.Main2.options4 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options2, "TOPLEFT", 0, -25, "AchievementTracker_ToggleMinimapIcon")
            UIConfig.Main2.options4:SetScript("OnClick", ATToggleMinimapIcon_OnClick)
            UIConfig.Main2.options5 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options4, "TOPLEFT", 30, -9, L["GUI_ToggleMinimap"],"GameFontHighlight")
            UIConfig.Main2.options4:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_ShowMimapButtonDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options4:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Link achievements being tracked for current boss to chat
            UIConfig.Main2.options6 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options4, "TOPLEFT", 0, -25, "AchievementTracker_ToggleAchievementAnnounce")
            UIConfig.Main2.options6:SetScript("OnClick", ATToggleAchievementAnnounce_OnClick)
            UIConfig.Main2.options7 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options6, "TOPLEFT", 30, -9, L["GUI_AnnounceTracking"],"GameFontHighlight")
            UIConfig.Main2.options7:SetWordWrap(true)
            UIConfig.Main2.options7:SetWidth(320)
            UIConfig.Main2.options7:SetJustifyH("LEFT")
            UIConfig.Main2.options6:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_AnnounceAchievementsToGroupDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options6:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Only track achievements in the group that players need.
            --Note this will only track achievements if players need them account wide not character wide
            --If players have achievements hidden then tracking may not start as intended
            UIConfig.Main2.options8 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options6, "TOPLEFT", 0, -25, "AchievementTracker_ToggleTrackMissingAchievementsOnly")
            UIConfig.Main2.options8:SetScript("OnClick", ATToggleTrackMissingAchievementsOnly_OnClick)
            UIConfig.Main2.options9 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options8, "TOPLEFT", 30, -9, L["GUI_OnlyTrackMissingAchievements"],"GameFontHighlight")
            UIConfig.Main2.options8:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_OnlyTrackMissingAchievementsDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options8:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Announce messages to Raid Warning if player has permission
            UIConfig.Main2.options10 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options8, "TOPLEFT", 0, -25, "AchievementTracker_ToggleAnnounceToRaidWarning")
            UIConfig.Main2.options10:SetScript("OnClick", ATToggleAnnounceToRaidWarning_OnClick)
            UIConfig.Main2.options11 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options10, "TOPLEFT", 30, -9, L["GUI_AnnounceMessagesToRaidWarning"],"GameFontHighlight")
            UIConfig.Main2.options10:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_AnnounceMessagesToRaidWarningDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options10:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Links to current guides and achievement discord credit for tactics
            UIConfig.Main2.credits = Config:CreateText2("TOPRIGHT",UIConfig, "TOPRIGHT", -10, -70, L["GUI_AchievementsDiscordTitle"] .. ":","GameFontNormalLarge")
            UIConfig.Main2.credits:SetWidth(400)
            UIConfig.Main2.credits:SetJustifyH("LEFT")
            UIConfig.Main2.credits2 = Config:CreateText2("TOPRIGHT", UIConfig.Main2.credits, "BOTTOMRIGHT", 0, -5, "https://discord.gg/achievements","GameFontNormal")
            UIConfig.Main2.credits2:SetWidth(400)
            UIConfig.Main2.credits2:SetJustifyH("LEFT")
            UIConfig.Main2.credits3 = Config:CreateText2("TOPRIGHT", UIConfig.Main2.credits2, "BOTTOMRIGHT", 0, -5, L["GUI_AchievementsDiscordDescription"],"GameFontHighlight")
            UIConfig.Main2.credits3:SetWidth(400)
            UIConfig.Main2.credits3:SetJustifyH("LEFT")

            --Make a sound when an achievement has been completed
            UIConfig.Main2.options12 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options10, "TOPLEFT", 0, -25, "AchievementTracker_ToggleSound")
            UIConfig.Main2.options12:SetScript("OnClick", ATToggleSound_OnClick)
            UIConfig.Main2.options13 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options12, "TOPLEFT", 30, -9, L["GUI_PlaySoundOnSuccess"],"GameFontHighlight")
            UIConfig.Main2.options12:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_PlaySoundOnCompletionDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options12:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Dropdown menu to select sound for completed Achievement
            UIConfig.Main2.options15 = MSA_DropDownMenu_Create("AchievementTracker_SelectSoundDropdownCompleted", UIConfig.Main2.options12)
            UIConfig.Main2.options15:SetPoint("TOPLEFT", UIConfig.Main2.options12, "TOPLEFT", UIConfig.Main2.options13:GetStringWidth() + 30, 0)
            MSA_DropDownMenu_SetWidth(UIConfig.Main2.options15, 100)
            MSA_DropDownMenu_SetText(UIConfig.Main2.options15, L["GUI_SelectSound"])
            MSA_DropDownMenu_Initialize(UIConfig.Main2.options15, function(self, level, menuList)
                local info = MSA_DropDownMenu_CreateInfo()
                info.func = AchievementTracker_SelectSoundCompleted
                for i=1,13 do
                    info.text = "Sound: " .. i
                    info.menuList = i
                    info.value = i
                    info.arg1 = i
                    info.arg2 = UIConfig.Main2.options15
                    MSA_DropDownMenu_AddButton(info)
                end
            end)

            --Make a sound when an achievement has been failed
            UIConfig.Main2.options012 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options12, "TOPLEFT", 0, -25, "AchievementTracker_ToggleSoundFailed")
            UIConfig.Main2.options012:SetScript("OnClick", ATToggleSoundFailed_OnClick)
            UIConfig.Main2.options013 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options012, "TOPLEFT", 30, -9, L["GUI_PlaySoundOnFailed"],"GameFontHighlight")
            UIConfig.Main2.options012:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_PlaySoundOnFailDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options012:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Dropdown menu to select sound for failed Achievement
            UIConfig.Main2.options17 = MSA_DropDownMenu_Create("AchievementTracker_SelectSoundDropdownFailed", UIConfig.Main2.options012)
            UIConfig.Main2.options17:SetPoint("TOPLEFT", UIConfig.Main2.options012, "TOPLEFT", UIConfig.Main2.options013:GetStringWidth() + 30, 0)
            MSA_DropDownMenu_SetWidth(UIConfig.Main2.options17, 100)
            MSA_DropDownMenu_SetText(UIConfig.Main2.options17, L["GUI_SelectSound"])
            MSA_DropDownMenu_Initialize(UIConfig.Main2.options17, function(self, level, menuList)
                local info = MSA_DropDownMenu_CreateInfo()
                info.func = AchievementTracker_SelectSoundFailed
                for i=1,11 do
                    info.text = "Sound: " .. i
                    info.menuList = i
                    info.value = i
                    info.arg1 = i
                    info.arg2 = UIConfig.Main2.options17
                    MSA_DropDownMenu_AddButton(info)
                end
            end)

            --Hide completed achievements
            UIConfig.Main2.options18 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options012, "TOPLEFT", 0, -25, "AchievementTracker_HideCompletedAchievements")
            UIConfig.Main2.options18:SetScript("OnClick", ATToggleHideCompletedAchievements_OnClick)
            UIConfig.Main2.options19 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options18, "TOPLEFT", 30, -9, L["GUI_HideCompletedAchievements"],"GameFontHighlight")
            UIConfig.Main2.options18:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_HideCompletedAchievementsDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options18:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Grey out completed achievements
            UIConfig.Main2.options20 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options18, "TOPLEFT", 0, -25, "AchievementTracker_GreyOutCompletedAchievements")
            UIConfig.Main2.options20:SetScript("OnClick", ATToggleGreyOutCompletedAchievements_OnClick)
            UIConfig.Main2.options21 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options20, "TOPLEFT", 30, -9, L["GUI_GreyOutCompletedAchievements"],"GameFontHighlight")
            UIConfig.Main2.options20:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_GreyOutCompletedAchievementsDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options20:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)
            -- UIConfig.Main2.options20:Hide()
            -- UIConfig.Main2.options21:Hide()

            --Enable Automatic Combat Logging
            UIConfig.Main2.options22 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options20, "TOPLEFT", 0, -25, "AchievementTracker_EnableAutomaticCombatLogging")
            UIConfig.Main2.options22:SetScript("OnClick", ATToggleAutomaticCombatLogging_OnClick)
            UIConfig.Main2.options23 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options22, "TOPLEFT", 30, -9, L["GUI_EnableAutomaticCombatLogging"],"GameFontHighlight")
            UIConfig.Main2.options22:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_EnableCombatLogDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options22:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Disable InfoFrame
            UIConfig.Main2.options24 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options22, "TOPLEFT", 0, -25, "AchievementTracker_DisplayInfoFrame")
            UIConfig.Main2.options24:SetScript("OnClick", ATToggleInfoFrame_OnClick)
            UIConfig.Main2.options25 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options24, "TOPLEFT", 30, -9, L["GUI_DisplayInfoFrame"],"GameFontHighlight")
            UIConfig.Main2.options24:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_EnableInfoFrameDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options24:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Track missing achievements in Blizzard UI
            UIConfig.Main2.options26 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options24, "TOPLEFT", 0, -25, "AchievementTracker_TrackAchievementsInBlizzardUI")
            UIConfig.Main2.options26:SetScript("OnClick", ATToggleTrackAchievementsInBlizzardUI_OnClick)
            UIConfig.Main2.options27 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options26, "TOPLEFT", 30, -9, L["GUI_TrackAchievementsInBlizzardUI"],"GameFontHighlight")
            UIConfig.Main2.options26:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_TrackAchievementsInUIDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options26:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Track achievements completed by player instead of account
            UIConfig.Main2.options28 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options2, "TOPLEFT", 363, 0, "AchievementTracker_TrackCharacterAchievements")
            UIConfig.Main2.options28:SetScript("OnClick", ATToggleTrackCharacterAchievements_OnClick)
            UIConfig.Main2.options29 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options28, "TOPLEFT", 30, -9, L["GUI_TrackCharacterAchievements"],"GameFontHighlight")
            UIConfig.Main2.options29:SetWordWrap(true)
            UIConfig.Main2.options29:SetWidth(400)
            UIConfig.Main2.options29:SetJustifyH("LEFT")
            UIConfig.Main2.options28:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_TrackChararcterAchievementsDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options28:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Track achievement automatically upon entering a compatible instance
            UIConfig.Main2.options30 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options28, "TOPLEFT", 0, -25, "AchievementTracker_TrackAchievementsAutomatically")
            UIConfig.Main2.options30:SetScript("OnClick", ATToggleTrackAchievementsAutomatically_OnClick)
            UIConfig.Main2.options31 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options30, "TOPLEFT", 30, -9, L["GUI_TrackAchievementsAutomatically"],"GameFontHighlight")
            UIConfig.Main2.options31:SetWordWrap(true)
            UIConfig.Main2.options31:SetWidth(400)
            UIConfig.Main2.options31:SetJustifyH("LEFT")
            UIConfig.Main2.options30:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_TrackAchievementsAutomaticallyDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options30:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Change Minimap icon when addon is enabled/disabled
            UIConfig.Main2.options32 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options30, "TOPLEFT", 0, -25, "AchievementTracker_ChangeMinimapIcon")
            UIConfig.Main2.options32:SetScript("OnClick", ATToggleChangeMinimapIcon_OnClick)
            UIConfig.Main2.options33 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options32, "TOPLEFT", 30, -9, L["GUI_ChangeMinimapIcon"],"GameFontHighlight")
            UIConfig.Main2.options33:SetWordWrap(true)
            UIConfig.Main2.options33:SetWidth(400)
            UIConfig.Main2.options33:SetJustifyH("LEFT")
            UIConfig.Main2.options32:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_ChangeMinimapIconDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options32:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            --Show/Hide InfoFrame
            UIConfig.Main2.options34 = Config:CreateButton2("TOPLEFT", UIConfig.Main2.options32, "TOPLEFT", 0, -35, L["GUI_ToggleInfoFrameTestFrame"])
            UIConfig.Main2.options34:SetWidth(UIConfig.Main2.options34:GetTextWidth() + 10)
            UIConfig.Main2.options34:SetScript("OnClick", ATToggleShowInfoFrameTestFrame_OnClick)
            UIConfig.Main2.options34:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
                GameTooltip:SetText(L["GUI_ToggleInfoFrameTestFrameDescription"],1.0,0.82,0.0,1,true)
                GameTooltip:Show()
            end)
            UIConfig.Main2.options34:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)

            -- --Make a sound whxen an achievement has been failed
            -- UIConfig.Main2.options35 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options34, "TOPLEFT", 0, -25, "AchievementTracker_ToggleLocalisation")
            -- UIConfig.Main2.options35:SetScript("OnClick", ATToggleSoundFailed_OnClick)
            -- UIConfig.Main2.options36 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options35, "TOPLEFT", 30, -9, L["GUI_SelectLocalisation"],"GameFontHighlight")
            -- UIConfig.Main2.options35:SetScript("OnEnter", function(self)
            --     GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
            --     GameTooltip:SetText(L["GUI_SelectLocalisationDescription"],1.0,0.82,0.0,1,true)
            --     GameTooltip:Show()
            -- end)
            -- UIConfig.Main2.options35:SetScript("OnLeave", function(self)
            --     GameTooltip:Hide()
            -- end)

            -- --Dropdown menu to select sound for failed Achievement
            -- UIConfig.Main2.options37 = MSA_DropDownMenu_Create("AchievementTracker_SelectLocalisationDropdown", UIConfig.Main2.options35)
            -- UIConfig.Main2.options37:SetPoint("TOPLEFT", UIConfig.Main2.options35, "TOPLEFT", UIConfig.Main2.options36:GetStringWidth() + 30, 0)
            -- MSA_DropDownMenu_SetWidth(UIConfig.Main2.options37, 100)
            -- MSA_DropDownMenu_SetText(UIConfig.Main2.options37, L["GUI_Automatic"])
            -- MSA_DropDownMenu_Initialize(UIConfig.Main2.options37, function(self, level, menuList)
            --     local info = MSA_DropDownMenu_CreateInfo()
            --     info.func = AchievementTracker_SelectLocalisation
            --     local languages = {L["GUI_Automatic"],_G["ENGB"],_G["DEDE"],_G["ESES"],_G["RURU"],_G["FRFR"],_G["ZHCN"],_G["ZHTW"]}
            --     for i=1,#languages do
            --         info.text = languages[i]
            --         info.menuList = i
            --         info.value = i
            --         info.arg1 = languages[i]
            --         info.arg2 = UIConfig.Main2.options37
            --         info.arg3 = i
            --         MSA_DropDownMenu_AddButton(info)
            --     end
            -- end)
        end
    else                                --User has selected an expansion tab so hide main menu options
        UIConfig.ScrollFrame:Show()
        UIConfig.ScrollFrame2:Show()

        UIConfig.Main:Hide()
        UIConfig.Main2:Hide()

        -- UIConfig.Main2.features:Hide()
        -- UIConfig.Main2.features1:Hide()
        -- UIConfig.Main2.features2:Hide()
        -- UIConfig.Main2.features3:Hide()
        -- UIConfig.Main2.features4:Hide()
        -- UIConfig.Main2.features5:Hide()
        -- UIConfig.Main2.features6:Hide()

        UIConfig.Main2.options:Hide()
        UIConfig.Main2.options:Hide()
        UIConfig.Main2.options2:Hide()
        UIConfig.Main2.options3:Hide()
        UIConfig.Main2.options4:Hide()
        UIConfig.Main2.options5:Hide()
        UIConfig.Main2.options6:Hide()
        UIConfig.Main2.options7:Hide()
        UIConfig.Main2.options8:Hide()
        UIConfig.Main2.options9:Hide()
        UIConfig.Main2.options10:Hide()
        UIConfig.Main2.options11:Hide()
        UIConfig.Main2.options12:Hide()
        UIConfig.Main2.options012:Hide()
        UIConfig.Main2.options013:Hide()
        UIConfig.Main2.options13:Hide()
        -- UIConfig.Main2.options14:Hide()
        UIConfig.Main2.options15:Hide()
        -- UIConfig.Main2.options16:Hide()
        UIConfig.Main2.options17:Hide()
        UIConfig.Main2.options18:Hide()
        UIConfig.Main2.options19:Hide()
        UIConfig.Main2.options20:Hide()
        UIConfig.Main2.options21:Hide()
        UIConfig.Main2.options22:Hide()
        UIConfig.Main2.options23:Hide()
        UIConfig.Main2.options24:Hide()
        UIConfig.Main2.options25:Hide()
        UIConfig.Main2.options26:Hide()
        UIConfig.Main2.options27:Hide()
        UIConfig.Main2.options28:Hide()
        UIConfig.Main2.options29:Hide()
        UIConfig.Main2.options30:Hide()
        UIConfig.Main2.options31:Hide()
        UIConfig.Main2.options32:Hide()
        UIConfig.Main2.options33:Hide()
        UIConfig.Main2.options34:Hide()
        -- UIConfig.Main2.options35:Hide()
        -- UIConfig.Main2.options36:Hide()
        -- UIConfig.Main2.options37:Hide()

        UIConfig.Main.author:Hide()
        UIConfig.Main.verison:Hide()
        UIConfig.Main.tacticsCredit:Hide()

        UIConfig.Main2.content:Hide()
        UIConfig.Main2.content2:Hide()

        UIConfig.Main2.credits:Hide()
        UIConfig.Main2.credits2:Hide()
        UIConfig.Main2.credits3:Hide()

        if UIConfig.Main.translators ~= nil then
            UIConfig.Main.translators:Hide()
        end

        if UIConfig.achievementsCompleted ~= nil then
            UIConfig.achievementsCompleted:Hide()
        end
    end
end

-- function AchievementTracker_SelectLocalisation(self, arg1, arg2, arg3, checked)
--     AchievementTrackerOptions["localisationOption"] = arg1
--     AchievementTrackerOptions["localisationOptionIndex"] = arg3
--     MSA_DropDownMenu_SetText(arg2, arg3)
-- end

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

-- Method:          SetTabs()
-- What it Does:    Adds tabs to the GUI
-- Purpose:         This will add all the tabs onto IAT GUI and set the appropriate click events.
local function SetTabs(frame, numTabs, ...)
	frame.numTabs = numTabs     --Number of tabs to create. This will need incrementing by 1 each expansion

	local contents = {} --Stores the frames for each of the tabs
	local frameName = frame:GetName()
    local lastTabAdded = 1

    --IAT Expansions Tabs
	for i = 1, numTabs do
        local tab
        if core.gameVersionMajor > 9 then
            tab = CreateFrame("Button", frameName.."Tab"..i, frame, "PanelTabButtonTemplate")
        else
            tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate")
        end

        if i == 1 then
            tab:SetID(i)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 2 then
            tab:SetID(10)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 3 then
            tab:SetID(9)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 4 then
            tab:SetID(8)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 5 then
            tab:SetID(7)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 6 then
            tab:SetID(6)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 7 then
            tab:SetID(5)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 8 then
            tab:SetID(4)                                --This is used when clicking on the tab to load the correct frames
        elseif i == 9 then
            tab:SetID(3)                                --This is used when clicking on the tab to load the correct frames
        end

        tab:SetText(select(i, ...))                 --This select the variables arguments passed into the function. Needs updating each expansion
		tab:SetScript("OnClick", Tab_OnClick)       --This will run the Tab_OnClick() function once the user has selected a tab so we can load the correct frames into the GUI

        if (i == 1) then
            --For the main frame we only want to create one scroll frame which fills the width of the GUI.
            --This is because we have no buttons to click on like in the expansion tabs
            tab.content = CreateFrame("Frame", nil, UIConfig.ScrollFrame)
            tab.content:SetSize(778, 460)
            tab.content:Hide()

            table.insert(contents, tab.content)

			tab:SetPoint("TOPLEFT", UIConfig, "BOTTOMLEFT", 5, 7);
        else
            --For the expansion frame, we want to create two scroll frames
            --One for the buttons and one for the content
            tab.content = CreateFrame("Frame", nil, UIConfig.ScrollFrame)
            tab.content:SetSize(220, 460)
            tab.content:Hide();

            tab.contenta = CreateFrame("Frame", nil, UIConfig.ScrollFrame2)
            tab.contenta:SetSize(658, 460)
            tab.contenta:Hide()

            table.insert(contents, tab.content)
            table.insert(contents, tab.contenta)

            if core.gameVersionMajor > 9 then
                tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(lastTabAdded)], "TOPRIGHT", 0, 0)
            else
                tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(lastTabAdded)], "TOPRIGHT", -14, 0)
            end
		end

        --Disable buttons higher than the game version being played
        if ((i + tab:GetID()) - i) > core.gameVersionMajor then
            tab:Hide()
        else
            lastTabAdded = i
        end
    end

    --Tabs for other addons
    -- local tab = CreateFrame("Button", "InstanceAchievementTrackerTab", frame, "OptionsFrameTabButtonTemplate")
    -- tab:SetID(100)                                 --This is used when clicking on the tab to load the correct frames
    -- tab:SetText("Dungeons & Raids")  --This select the variables arguments passed into the function. Needs updating each expansion
    -- tab:SetScript("OnClick", IAT_OnClick)       --This will run the Tab_OnClick() function once the user has selected a tab so we can load the correct frames into the GUI
    -- tab:SetPoint("TOPLEFT")
    -- tab:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 20)

    -- local tab = CreateFrame("Button", "ExplorationAchievementTrackerTab", _G["InstanceAchievementTrackerTab"], "OptionsFrameTabButtonTemplate")
    -- tab:SetID(100)                                 --This is used when clicking on the tab to load the correct frames
    -- tab:SetText("Exploration")  --This select the variables arguments passed into the function. Needs updating each expansion
    -- tab:SetScript("OnClick", EAT_OnClick)       --This will run the Tab_OnClick() function once the user has selected a tab so we can load the correct frames into the GUI
    -- tab:SetPoint("TOPLEFT")
    -- tab:SetPoint("TOPLEFT", _G["InstanceAchievementTrackerTab"], "TOPLEFT", 120, 0)

    -- local tab = CreateFrame("Button", "WorldEventsAchievementTab", _G["InstanceAchievementTrackerTab"], "OptionsFrameTabButtonTemplate")
    -- tab:SetID(100)                                 --This is used when clicking on the tab to load the correct frames
    -- tab:SetText("World Events")  --This select the variables arguments passed into the function. Needs updating each expansion
    -- tab:SetScript("OnClick", EAT_OnClick)       --This will run the Tab_OnClick() function once the user has selected a tab so we can load the correct frames into the GUI
    -- tab:SetPoint("TOPLEFT")
    -- tab:SetPoint("TOPLEFT", _G["ExplorationAchievementTrackerTab"], "TOPLEFT", 85, 0)

	Tab_OnClick(_G[frameName.."Tab1"]) --Load in the main frame to begin with

	return unpack(contents) --Return the table containing all the frames
end

function IAT_OnClick()
    -- EAT_GlobalToggle()
    -- IAT_GlobalToggle()
end

function EAT_OnClick()
    --IAT_GlobalToggle()
    if EAT_GlobalToggle == nil then
        core:printMessage("Coming Soon :)")
    else
        EAT_GlobalToggle()
    end
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
        UIConfig:SetPropagateKeyboardInput(false)
    else
        UIConfig:SetPropagateKeyboardInput(true)
    end
end

-- Method:          Config:CreateGUI()
-- What it Does:    Create the IAT main GUI tab
-- Purpose:         This create the main GUI tab for IAT
function Config:CreateGUI()
    --Get Game Version
    getGameBuild()

    --Main Frame
    UIConfig = CreateFrame("Frame", "AchievementTracker", UIParent, "UIPanelDialogTemplate", "AchievementTemplate")
    UIConfig:SetSize(900, 500)
    UIConfig:SetPoint("CENTER")
    UIConfig:SetMovable(true)
    UIConfig:EnableMouse(true)
    UIConfig:SetClampedToScreen(true)
    UIConfig:RegisterForDrag("LeftButton")
    UIConfig:SetScript("OnDragStart", UIConfig.StartMoving)
    UIConfig:SetScript("OnDragStop", UIConfig.StopMovingOrSizing)
    UIConfig:SetFrameStrata("HIGH")

    --Setup script to allow user to press esc to exit GUI
    UIConfig:SetScript("OnKeyDown", IAT_CheckForEscape)

    --Title
    UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	UIConfig.title:SetPoint("CENTER", AchievementTrackerTitleBG, "CENTER", 6, 1);
	UIConfig.title:SetText("Instance Achievement Tracker");

    --Scroll Frame For Buttons
    UIConfig.ScrollFrame = CreateFrame("ScrollFrame", nil, UIConfig, "UIPanelScrollFrameTemplate")
    UIConfig.ScrollFrame:SetPoint("TOPLEFT", AchievementTrackerDialogBG, "TOPLEFT", 4, -8)
    UIConfig.ScrollFrame:SetWidth(220)
    UIConfig.ScrollFrame:SetHeight(460)
    UIConfig.ScrollFrame:SetClipsChildren(true)

    --Scroll Bar For Buttons
    UIConfig.ScrollFrame.ScrollBar:ClearAllPoints()
    UIConfig.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame, "TOPRIGHT", -12, -18)
    UIConfig.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame, "BOTTOMRIGHT", -7, 18)

    --Scroll Frame For Content
     UIConfig.ScrollFrame2 = CreateFrame("ScrollFrame", nil, UIConfig, "UIPanelScrollFrameTemplate")
     UIConfig.ScrollFrame2:SetPoint("TOPRIGHT", AchievementTrackerDialogBG, "TOPRIGHT", 0, -8)
     UIConfig.ScrollFrame2:SetWidth(658)
     UIConfig.ScrollFrame2:SetHeight(460)

     --Scroll Bar For Content
     UIConfig.ScrollFrame2.ScrollBar:ClearAllPoints()
     UIConfig.ScrollFrame2.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame2, "TOPRIGHT", -12, -18)
     UIConfig.ScrollFrame2.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame2, "BOTTOMRIGHT", -7, 18)

    --Tabs
    content1, DragonflightNav, DragonflightContent, ShadowlandsNav, ShadowlandsContent, BattleForAzerothNav, BattleForAzerothContent, LegionNav, LegionContent, WarlordsOfDraenorNav, WarlordsOfDraenorContent, MistsOfPandariaNav, MistsOfPandariaContent, CataclysmNav, CataclysmContent, WrathOfTheLichKingNav, WrathOfTheLichKingContent = SetTabs(UIConfig, 9, L["GUI_Options"], L["GUI_Dragonflight"], L["GUI_Shadowlands"], L["GUI_BattleForAzeroth"], L["GUI_Legion"], L["GUI_WarlordsOfDraenor"], L["GUI_MistsOfPandaria"], L["GUI_Cataclysm"], L["GUI_WrathOfTheLichKing"])

    --Tabs (Top)
    --Addon_InstanceAchievementTracker, Addon_ExplorationAchievementTracker = SetTabs(UIConfig, 8, L["GUI_Options"], L["GUI_Shadowlands"], L["GUI_BattleForAzeroth"], L["Legion"], L["GUI_WarlordsOfDraenor"], L["GUI_MistsOfPandaria"], L["GUI_Cataclysm"], L["GUI_WrathOfTheLichKing"])

    --Content (Main)
    content1.title = content1:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
	content1.title:SetPoint("CENTER", AchievementTrackerDialogBG, "CENTER", -2, 210);
    --content1.title:SetText("Welcome to Achievement Tracker V1.0");

    --Create the navigation buttons for each expansion
    local expansions = 8

    for i = 3, 10 do
        --Raids
        local firstRaid = false
        local previousInstance

        local localisedRaidNames = {}
        local localisedDungeonNames = {}
        local localisedScenarioNames = {}

        --Lets get all localised names of the instances and place in a table, this can then be sorted alphabetically before we create the buttons
        --We need to save the original ID aswell so key value pairs
        for instance,v in pairs(core.Instances[i].Raids) do
            local instanceName

            if (core.gameVersionMajor > 4 and core.Instances[i].Raids[instance].classicOnly ~= true) or (core.gameVersionMajor == 4 and core.Instances[i].Raids[instance].retailOnly ~= true) then
                --Do not load classic only instance on retail and visa versa

                if (core.gameVersionMajor == 3 and i == 3) or (core.gameVersionMajor == 4 and i == 3) then
                    --For wrath we must fetch the localisaed names as the encounter journal is not avaliable
                    if core.Instances[i].Raids[instance].classicPhase <= Config.classicPhase then
                        instanceName = core.Instances[i].Raids[instance].nameLocalised
                    end
                else
                    --All other expansions have the encounter journal so pass the ID to fetch from API
                    --In classic cata only cata is in encounter journal
                    if core.gameVersionMajor == 4 then
                        if i == 4 then
                            instanceName = Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name)
                        else
                            instanceName = ""
                        end
                    else
                        instanceName = Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name)
                    end
                end

                if instanceName ~= nil then
                    table.insert(localisedRaidNames, {name = instanceName, id = instance});
                end
            end
        end

        for instance,v in pairs(core.Instances[i].Dungeons) do
            local instanceName

            if (core.gameVersionMajor == 3 and i == 3) or (core.gameVersionMajor == 4 and i == 3) then
                --For wrath we must fetch the localisaed names as the encounter journal is not avaliable
                if core.Instances[i].Dungeons[instance].classicPhase <= Config.classicPhase then
                    instanceName = core.Instances[i].Dungeons[instance].nameLocalised
                end
            else
                --All other expansions have the encounter journal so pass the ID to fetch from API
                if core.gameVersionMajor == 4 then
                    if i == 4 then
                        instanceName = Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name)
                    else
                        instanceName = ""
                    end
                else
                    instanceName = Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name)
                end
            end

            if instanceName ~= nil then
                table.insert(localisedDungeonNames, {name = instanceName, id = instance});
            end
        end

        --Scenarios only happen for MOP expansion. Needs updating each expansion
        if i == 5 then
            for instance,v in pairs(core.Instances[i].Scenarios) do
                if instance == 1103 or instance == 1000 then
                    --Alliance only scenarios
                    if UnitFactionGroup("Player") == "Alliance" then
                        local instanceName = Config:getLocalisedScenarioName(core.Instances[i].Scenarios[instance].name)
                        table.insert(localisedScenarioNames, {name = instanceName, id = instance});
                    end
                elseif instance == 1102 or instance == 999 then
                    --Horde only scenarios
                    if UnitFactionGroup("Player") == "Horde" then
                        local instanceName = Config:getLocalisedScenarioName(core.Instances[i].Scenarios[instance].name)
                        table.insert(localisedScenarioNames, {name = instanceName, id = instance});
                    end
                else
                    local instanceName = Config:getLocalisedScenarioName(core.Instances[i].Scenarios[instance].name)
                    table.insert(localisedScenarioNames, {name = instanceName, id = instance});
                end
            end
            table.sort(localisedScenarioNames, function( a,b ) return a.name < b.name end)
        end

        table.sort(localisedRaidNames, function( a,b ) return a.name < b.name end)
        table.sort(localisedDungeonNames, function( a,b ) return a.name < b.name end)

        for instance,instanceTable in pairs(localisedRaidNames) do
            if firstRaid == false then
                if i == 10 then
                    DragonflightNav[instanceTable.id] = self:CreateButton("TOPLEFT", DragonflightNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    DragonflightNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 9 then
                    ShadowlandsNav[instanceTable.id] = self:CreateButton("TOPLEFT", ShadowlandsNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    ShadowlandsNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 8 then
                    BattleForAzerothNav[instanceTable.id] = self:CreateButton("TOPLEFT", BattleForAzerothNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    BattleForAzerothNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    LegionNav[instanceTable.id] = self:CreateButton("TOPLEFT", LegionNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    LegionNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    WarlordsOfDraenorNav[instanceTable.id] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    WarlordsOfDraenorNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instanceTable.id] = self:CreateButton("TOPLEFT", MistsOfPandariaNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    MistsOfPandariaNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    CataclysmNav[instanceTable.id] = self:CreateButton("TOPLEFT", CataclysmNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    CataclysmNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    WrathOfTheLichKingNav[instanceTable.id] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav, "TOPLEFT", 0, instanceTable.name, instanceTable.id);
                    WrathOfTheLichKingNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                end
                firstRaid = true
                previousInstance = instanceTable.id
            else
                if i == 10 then
                    DragonflightNav[instanceTable.id] = self:CreateButton("TOPLEFT", DragonflightNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    DragonflightNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 9 then
                    ShadowlandsNav[instanceTable.id] = self:CreateButton("TOPLEFT", ShadowlandsNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    ShadowlandsNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 8 then
                    BattleForAzerothNav[instanceTable.id] = self:CreateButton("TOPLEFT", BattleForAzerothNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    BattleForAzerothNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    LegionNav[instanceTable.id] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    LegionNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    WarlordsOfDraenorNav[instanceTable.id] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    WarlordsOfDraenorNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instanceTable.id] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    MistsOfPandariaNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    CataclysmNav[instanceTable.id] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    CataclysmNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    WrathOfTheLichKingNav[instanceTable.id] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    WrathOfTheLichKingNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                end
                previousInstance = instanceTable.id
            end
        end

        --Dungeons
        local firstDungeon = false
        for instance,instanceTable in pairs(localisedDungeonNames) do
            if firstDungeon == false then
                if i == 10 then
                    DragonflightNav[instanceTable.id] = self:CreateButton("TOPLEFT", DragonflightNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    DragonflightNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 9 then
                    ShadowlandsNav[instanceTable.id] = self:CreateButton("TOPLEFT", ShadowlandsNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    ShadowlandsNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 8 then
                    BattleForAzerothNav[instanceTable.id] = self:CreateButton("TOPLEFT", BattleForAzerothNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    BattleForAzerothNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    LegionNav[instanceTable.id] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    LegionNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    WarlordsOfDraenorNav[instanceTable.id] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    WarlordsOfDraenorNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instanceTable.id] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    MistsOfPandariaNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    CataclysmNav[instanceTable.id] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    CataclysmNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    WrathOfTheLichKingNav[instanceTable.id] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                    WrathOfTheLichKingNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                end
                firstDungeon = true
                previousInstance = instanceTable.id
            else
                if i == 10 then
                    DragonflightNav[instanceTable.id] = self:CreateButton("TOPLEFT", DragonflightNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    DragonflightNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 9 then
                    ShadowlandsNav[instanceTable.id] = self:CreateButton("TOPLEFT", ShadowlandsNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    ShadowlandsNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 8 then
                    BattleForAzerothNav[instanceTable.id] = self:CreateButton("TOPLEFT", BattleForAzerothNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    BattleForAzerothNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    LegionNav[instanceTable.id] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    LegionNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    WarlordsOfDraenorNav[instanceTable.id] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    WarlordsOfDraenorNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instanceTable.id] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    MistsOfPandariaNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    CataclysmNav[instanceTable.id] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    CataclysmNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    WrathOfTheLichKingNav[instanceTable.id] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                    WrathOfTheLichKingNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                end
                previousInstance = instanceTable.id
            end
        end

        --Scenarios
        local firstScenario = false
        for instance,instanceTable in pairs(localisedScenarioNames) do
            if firstScenario == false then
                MistsOfPandariaNav[instanceTable.id] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -40, instanceTable.name, instanceTable.id);
                MistsOfPandariaNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                firstScenario = true
                previousInstance = instanceTable.id
            else
                MistsOfPandariaNav[instanceTable.id] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, instanceTable.name, instanceTable.id);
                MistsOfPandariaNav[instanceTable.id]:SetScript("OnClick", Instance_OnClick);
                previousInstance = instanceTable.id
            end
        end
    end

    --Create 200 buttons for each of the expansion tabs
    local buttonHeight = 30
    local numButtons = 200 --Total number of button we need for any instance. We can hide excess button for raids/dungeons with less bosses
    local idCounter = 0
    local button
    for j = 3, 10 do
        local globalCounter = 1
        for i = 1, numButtons do
            if j == 10 then
                DragonflightContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,DragonflightContent)
                button = DragonflightContentButtons[i]
                button:SetSize(DragonflightContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",DragonflightContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 9 then
                ShadowlandsContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,ShadowlandsContent)
                button = ShadowlandsContentButtons[i]
                button:SetSize(ShadowlandsContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",ShadowlandsContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 8 then
                BattleForAzerothContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,BattleForAzerothContent)
                button = BattleForAzerothContentButtons[i]
                button:SetSize(BattleForAzerothContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",BattleForAzerothContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 7 then
                LegionContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,LegionContent)
                button = LegionContentButtons[i]
                button:SetSize(LegionContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",LegionContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 6 then
                WarlordsOfDraenorContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,WarlordsOfDraenorContent)
                button = WarlordsOfDraenorContentButtons[i]
                button:SetSize(WarlordsOfDraenorContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",WarlordsOfDraenorContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 5 then
                MistsOfPandariaContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,MistsOfPandariaContent)
                button = MistsOfPandariaContentButtons[i]
                button:SetSize(MistsOfPandariaContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",MistsOfPandariaContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 4 then
                CataclysmContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,CataclysmContent)
                button = CataclysmContentButtons[i]
                button:SetSize(CataclysmContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",CataclysmContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 3 then
                WrathOfTheLichKingContentButtons[i] = CreateFrame("Button","IAT_Achievement_"..j.."_"..globalCounter,WrathOfTheLichKingContent)
                button = WrathOfTheLichKingContentButtons[i]
                button:SetSize(WrathOfTheLichKingContent:GetWidth()-18,buttonHeight)
                button:SetID(idCounter)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",WrathOfTheLichKingContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            end

            globalCounter = globalCounter + 1

            -- the text for the header
            button.headerText = button:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
            button.headerText:SetPoint("LEFT",12,0)

            -- the text for the content
            -- button.contentText = button:CreateFontString(nil,"ARTWORK","GameFontHighlight")
            button.contentText = CreateFrame("SimpleHTML")
            button.contentText:SetScript("OnHyperlinkEnter", function(self, linkData, link, button)
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(linkData)
                GameTooltip:Show()
            end)
            button.contentText:SetScript("OnHyperlinkLeave", function(self, linkData, link, button)
                GameTooltip:Hide()
            end)
            button.contentText:SetParent(button)
            button.contentText:SetPoint("TOPLEFT",16,0)
            button.contentText:SetJustifyH("p","LEFT")

            --button.contentText:SetIndentedWordWrap(true)

            --Tactics
            button.tactics = Config:CreateButton2("TOPRIGHT", button, "TOPRIGHT", -1, -7, L["GUI_OutputTactics"])
            button.tactics:SetID(idCounter)

            --Players
            button.players = Config:CreateButton2("TOPRIGHT", button.tactics, "TOPLEFT", -7, -1, L["GUI_OutputPlayers"])
            button.players:SetID(idCounter)

            --Track
            button.enabled = Config:CreateCheckBox("TOPRIGHT", button.players, "TOPLEFT", -7, -1)
            button.enabled:SetID(idCounter)

            --Track Fontstring
            button.enabledText = Config:CreateText("TOPRIGHT", button.enabled, "TOPLEFT", 0, 1, L["GUI_Track"])

            button:Hide()

            idCounter = idCounter + 1
        end
    end

    local generatedIDCounter = 0
    --Create a unqiue ID for each boss
    for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if string.match(boss, "boss") then
                        core.Instances[expansion][instanceType][instance][boss].generatedID = generatedIDCounter
                        generatedIDCounter = generatedIDCounter + 1
                        --print("Setting ID " .. generatedIDCounter .. " for " .. boss)
                        --print(core.Instances[expansion][instanceType][instance][boss].generatedID)
                    end
                end
			end
		end
    end


end

-- Method:          Config:Instance_OnClickAutomatic()
-- What it Does:    Calls the Instance_OnClick() function
-- Purpose:         This is used when automatically selected the tab after enabling achievement for an instance
function Config:Instance_OnClickAutomatic()
    Instance_OnClick(nil)
end

function Config:Instance_OnClickAPI()
    Instance_OnClick("API")
end

-- Method:          Config:Instance_OnClick()
-- What it Does:    Updates frame text for current instance clicked
-- Purpose:         This is used when clicking on an instance to update the contents with current instance
function Instance_OnClick(self)
    if Config.currentTab > 1 then
        local instanceLocation
        local currentTabCompressed
        local str
        local numButtons = 200
        local counter = 1
        local counter2 = 1
        local heightDifference = 30
        local instanceType

        if type(self) == "table" then
            --Button has been pressed by the user
            local InstanceID = self:GetID()     --Get the ID of the button that was pressed

            --If raid is wrath of the lich king as is not Ulduar then we need to re-add the '-' so the button can find the correct raid
            if Config.currentTab == 3 then --Current position of WOTLK expansion. Needs updating each expansion
                local numberToNotConvert = {603,574,576,595,601,619,600,608,604,599,602,578,575,650,632,658,668}
                if core:has_value(numberToNotConvert, InstanceID) == false then
                    InstanceID = tostring(InstanceID)
                    InstanceID = InstanceID:sub(1, -3) .. "-" .. InstanceID:sub(-2)
                end
            end

            if core.Instances[Config.currentTab].Raids[InstanceID] ~= nil then
                instanceLocation = core.Instances[Config.currentTab].Raids[InstanceID]
                instanceType = "Raids"
            elseif core.Instances[Config.currentTab].Dungeons[InstanceID] ~= nil then
                instanceLocation = core.Instances[Config.currentTab].Dungeons[InstanceID]
                instanceType = "Dungeons"
            elseif core.Instances[Config.currentTab].Scenarios[InstanceID] ~= nil then
                instanceLocation = core.Instances[Config.currentTab].Scenarios[InstanceID]
                instanceType = "Scenarios"
            end
        elseif self == "API" then
            --Button needs updating for current instance. Automatically clicked by addon
            if IAT_InstanceType == "Raids" then
                instanceLocation = core.Instances[IAT_CurrentTab].Raids[IAT_InstanceLocation]
                instanceType = "Raids"
            elseif IAT_InstanceType == "Dungeons" then
                instanceLocation = core.Instances[IAT_CurrentTab].Dungeons[IAT_InstanceLocation]
                instanceType = "Dungeons"
            elseif IAT_InstanceType == "Scenarios" then
                instanceLocation = core.Instances[IAT_CurrentTab].Scenarios[IAT_InstanceLocation]
                instanceType = "Scenarios"
            end

            --Set the current tab to the expansion of the current instance
            Config.currentTab = IAT_CurrentTab

            if Config.currentTab == 3 then
                Tab_OnClick(_G["AchievementTrackerTab2"])
            elseif Config.currentTab == 4 then
                Tab_OnClick(_G["AchievementTrackerTab3"])
            elseif Config.currentTab == 5 then
                Tab_OnClick(_G["AchievementTrackerTab4"])
            elseif Config.currentTab == 6 then
                Tab_OnClick(_G["AchievementTrackerTab5"])
            elseif Config.currentTab == 7 then
                Tab_OnClick(_G["AchievementTrackerTab6"])
            elseif Config.currentTab == 8 then
                Tab_OnClick(_G["AchievementTrackerTab7"])
            elseif Config.currentTab == 9 then
                Tab_OnClick(_G["AchievementTrackerTab8"])
            elseif Config.currentTab == 10 then
                Tab_OnClick(_G["AchievementTrackerTab9"])
            end
        else
            --Button needs updating for current instance. Automatically clicked by addon
            if core.instanceType == "Raids" then
                instanceLocation = core.Instances[core.expansion].Raids[core.instance]
                instanceType = "Raids"
            elseif core.instanceType == "Dungeons" then
                instanceLocation = core.Instances[core.expansion].Dungeons[core.instance]
                instanceType = "Dungeons"
            elseif core.instanceType == "Scenarios" then
                instanceType = "Scenarios"
                instanceLocation = core.Instances[core.expansion].Scenarios[core.instance]
            end

            --Set the current tab to the expansion of the current instance
            -- if core.expansion == 3 then
            --     Config.currentTab = 9
            -- elseif core.expansion == 4 then
            --     Config.currentTab = 8
            -- elseif core.expansion == 5 then
            --     Config.currentTab = 7
            -- elseif core.expansion == 6 then
            --     Config.currentTab = 6
            -- elseif core.expansion == 7 then
            --     Config.currentTab = 5
            -- elseif core.expansion == 8 then
            --     Config.currentTab = 4
            -- elseif core.expansion == 9 then
            --     Config.currentTab = 3
            -- elseif core.expansion == 10 then
            --     Config.currentTab = 2
            -- end

            --Set the current instance
            Config.currentInstance = core.instance
        end

        local achievementFound = false --This is so we can display "All Achievements completed for this instance" if needed
        if UIConfig.achievementsCompleted ~= nil then
            UIConfig.achievementsCompleted:Hide()
        end

        --Hide all buttons initially
        for i = 1, numButtons do
            local button

            if Config.currentTab == 10 then
                button = DragonflightContentButtons[i]
            elseif Config.currentTab == 9 then
                button = ShadowlandsContentButtons[i]
            elseif Config.currentTab == 8 then
                button = BattleForAzerothContentButtons[i]
            elseif Config.currentTab == 7 then
                button = LegionContentButtons[i]
            elseif Config.currentTab == 6 then
                button = WarlordsOfDraenorContentButtons[i]
            elseif Config.currentTab == 5 then
                button = MistsOfPandariaContentButtons[i]
            elseif Config.currentTab == 4 then
                button = CataclysmContentButtons[i]
            elseif Config.currentTab == 3 then
                button = WrathOfTheLichKingContentButtons[i]
            end
            button:Hide()
        end

        for bossName,v in pairs(instanceLocation) do
            if string.match(bossName, "boss") then --Don't fetch the name of the instance that has been clicked
                --Check if any players in the group need the achievement
                local playersFound = false

                --Check if any players in the group need the current achievement for the current instance they are inside off
                if core:has_value(instanceLocation["boss" .. counter2].players, L["GUI_NoPlayersNeedAchievement"]) == false and #instanceLocation["boss" .. counter2].players ~= 0 then
                    playersFound = true
                end

                --If we are currently not tracking achievements for the current player then scan the achievements on current tab so we can honor hide/grey achievements option
                if core.achievementTrackingEnabled == false then
                    local _, _, _, completed = GetAchievementInfo(instanceLocation["boss" .. counter2].achievement)
                    if completed == false then
                        playersFound = true
                    end
                end

                --Check whether or not to display the current achievements. This is done incase user wants to hide completed achievements
                if playersFound == true or core.achievementDisplayStatus == "show" or core.achievementDisplayStatus == "grey" then
                    achievementFound = true

                    --We need to display the current achievement
                    local button

                    --Header
                    --Get the set of buttons for the current selected tab
                    if Config.currentTab == 10 then
                        button = DragonflightContentButtons[counter]
                    elseif Config.currentTab == 9 then
                        button = ShadowlandsContentButtons[counter]
                    elseif Config.currentTab == 8 then
                        button = BattleForAzerothContentButtons[counter]
                    elseif Config.currentTab == 7 then
                        button = LegionContentButtons[counter]
                    elseif Config.currentTab == 6 then
                        button = WarlordsOfDraenorContentButtons[counter]
                    elseif Config.currentTab == 5 then
                        button = MistsOfPandariaContentButtons[counter]
                    elseif Config.currentTab == 4 then
                        button = CataclysmContentButtons[counter]
                    elseif Config.currentTab == 3 then
                        button = WrathOfTheLichKingContentButtons[counter]
                    end

                    button:Show()

                    if counter > 1 then
                        button:ClearAllPoints()
                        if Config.currentTab == 10 then
                            button:SetPoint("TOPLEFT",DragonflightContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 9 then
                            button:SetPoint("TOPLEFT",ShadowlandsContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 8 then
                            button:SetPoint("TOPLEFT",BattleForAzerothContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 7 then
                            button:SetPoint("TOPLEFT",LegionContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 6 then
                            button:SetPoint("TOPLEFT",WarlordsOfDraenorContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 5 then
                            button:SetPoint("TOPLEFT",MistsOfPandariaContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 4 then
                            button:SetPoint("TOPLEFT",CataclysmContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        elseif Config.currentTab == 3 then
                            button:SetPoint("TOPLEFT",WrathOfTheLichKingContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                        end
                    end

                    if (core.gameVersionMajor == 3 and Config.currentTab == 3) or (core.gameVersionMajor == 4 and Config.currentTab == 3) then
                        --Wrath classic requires us to use localised names as the encounter journal is not avaliable
                        button.headerText:SetText(instanceLocation["boss" .. counter2].nameWrath)
                    else
                        if core.gameVersionMajor == 4 then
                            if Config.currentTab == 4 then
                                button.headerText:SetText(Config:getLocalisedEncouterName(instanceLocation["boss" .. counter2].name,instanceType))
                            else
                                button.headerText:SetText("")
                            end
                        else
                            button.headerText:SetText(Config:getLocalisedEncouterName(instanceLocation["boss" .. counter2].name,instanceType))
                        end
                    end

                    button.contentText:SetID(instanceLocation["boss" .. counter2].achievement)
                    button.headerText:Show()
                    button.contentText:Hide()
                    button:SetNormalTexture("Interface\\Common\\Dark-GoldFrame-Button")

                    button.tactics:Show()
                    button.tactics:SetSize(120, 15)
                    button.tactics:SetScript("OnClick", Tactics_OnClick);
                    button.players:Show()
                    button.players:SetSize(120, 15)
                    button.players:SetScript("OnClick", Player_OnClick);
                    button.enabled:Show()
                    button.enabled:SetSize(20, 15)
                    button.enabled:SetChecked(instanceLocation["boss" .. counter2].enabled)
                    button.enabled:SetScript("OnClick", Enabled_OnClick);
                    if instanceLocation["boss" .. counter2].track ~= nil then
                        button.enabledText:Show()
                        button.enabledText:SetSize(30, 15)
                    else
                        button.enabledText:Hide()
                        button.enabled:Hide()
                    end

                    --print(instanceLocation["boss" .. counter2].generatedID)

                    --We need to set the ID of the tactics/players/track buttons to the id of the current boss so when clicked we know which boss we need to fetch info for
                    button.tactics:SetID(instanceLocation["boss" .. counter2].generatedID)
                    button.players:SetID(instanceLocation["boss" .. counter2].generatedID)
                    button.enabled:SetID(instanceLocation["boss" .. counter2].generatedID)

                    counter = counter + 1

                    if playersFound == false and core.achievementDisplayStatus == "grey" then
                        --Grey Out/Hide achievements
                        button.headerText:SetTextColor(0.827, 0.811, 0.811, 0.3)
                    else
                        --Show/Un-grey achievements
                        button.headerText:SetTextColor(1, 0.854, 0.039)
                    end

                    --Content
                    if Config.currentTab == 10 then
                        button = DragonflightContentButtons[counter]
                    elseif Config.currentTab == 9 then
                        button = ShadowlandsContentButtons[counter]
                    elseif Config.currentTab == 8 then
                        button = BattleForAzerothContentButtons[counter]
                    elseif Config.currentTab == 7 then
                        button = LegionContentButtons[counter]
                    elseif Config.currentTab == 6 then
                        button = WarlordsOfDraenorContentButtons[counter]
                    elseif Config.currentTab == 5 then
                        button = MistsOfPandariaContentButtons[counter]
                    elseif Config.currentTab == 4 then
                        button = CataclysmContentButtons[counter]
                    elseif Config.currentTab == 3 then
                        button = WrathOfTheLichKingContentButtons[counter]
                    end

                    local players = L["GUI_Players"] .. ": "
                    for i = 1, #instanceLocation["boss" .. counter2].players do
                        players = players .. instanceLocation["boss" .. counter2].players[i] .. ", "
                    end

                    --If tactics are in a table then we need to show diferent tactics for each faction
                    local tactics
                    if type(instanceLocation["boss" .. counter2].tactics) == "table" then
                        if UnitFactionGroup("player") == "Alliance" then
                            if core.gameVersionMajor > 4 then
                                tactics = instanceLocation["boss" .. counter2].tactics[1]
                            else
                                tactics = instanceLocation["boss" .. counter2].tacticsClassic[1]
                            end
                        else
                            if core.gameVersionMajor > 4 then
                                tactics = instanceLocation["boss" .. counter2].tactics[2]
                            else
                                tactics = instanceLocation["boss" .. counter2].tacticsClassic[2]
                            end
                        end
                    else
                        if core.gameVersionMajor > 4 then
                            tactics = instanceLocation["boss" .. counter2].tactics
                        else
                            tactics = instanceLocation["boss" .. counter2].tacticsClassic
                        end
                    end

                    tactics = tactics:gsub("%\n", "<br />")
                    local tacticsStr = tactics == '' and '' or L["GUI_Tactic"] .. ": " .. tactics

                    --Only show players if user has enabled achievement tracking
                    button.contentText:SetWidth(600)
                    if (GetLocale() == 'koKR') then
                        button.contentText:SetFont("p", "Fonts\\2002.TTF", 12, "OUTLINE");
                    elseif (GetLocale() == 'zhCN') then
                        button.contentText:SetFont("p", "Fonts\\ARKai_T.ttf", 16, "OUTLINE");
                    elseif (GetLocale() == 'zhTW') then
                        button.contentText:SetFont("p", "Fonts\\blei00d.TTF", 16, "OUTLINE");
                    elseif (GetLocale() == 'ruRU') then
                        button.contentText:SetFont("p", "Fonts\\FRIZQT___CYR.TTF", 12, "OUTLINE");
                    else
                        button.contentText:SetFont("p","Fonts\\FRIZQT__.TTF", 13, "OUTLINE");
                    end
                    local achievementLink = GetAchievementLink(instanceLocation["boss" .. counter2].achievement)
                    achievementLink = achievementLink:gsub("&", "&amp;"); -- & in the achievement name would resolve the html syntax wrong
                    if core.achievementTrackingEnabled == false then
                        if instanceLocation["boss" .. counter2].image ~= nil then
                            local imageTable = instanceLocation["boss" .. counter2].image
                            button.contentText:SetText("<html><body><p>" .. L["GUI_Achievement"] .. ": " .. achievementLink .. "<br /><br />" .. tacticsStr .. "</p><img src='Interface\\AddOns\\InstanceAchievementTracker\\Images\\" .. imageTable[1] .. "' width='" .. imageTable[2] .. "' height='" .. imageTable[3] .. "' align='center'/></body></html>")
                        else
                            button.contentText:SetText("<html><body><p>" .. L["GUI_Achievement"] .. ": " .. achievementLink .. "<br /><br />" .. tacticsStr .. "</p></body></html>")
                        end
                    else
                        if instanceLocation["boss" .. counter2].image ~= nil then
                            local imageTable = instanceLocation["boss" .. counter2].image
                            button.contentText:SetText("<html><body><p>" .. L["GUI_Achievement"] .. ": " .. achievementLink .. "<br /><br />" .. players .. "<br /><br />" .. tacticsStr .. "</p><img src='Interface\\AddOns\\InstanceAchievementTracker\\Images\\" .. imageTable[1] .. "' width='" .. imageTable[2] .. "' height='" .. imageTable[3] .. "' align='center'/></body></html>")
                        else
                            button.contentText:SetText("<html><body><p>" .. L["GUI_Achievement"] .. ": " .. achievementLink .. "<br /><br />" .. players .. "<br /><br />" .. tacticsStr .. "</p></body></html>")
                        end

                    end

                    if playersFound == false and core.achievementDisplayStatus == "grey" then
                        --Grey Out/Hide achievements
                        button.contentText:SetTextColor("p", 0.827, 0.811, 0.811, 0.3)
                    else
                        --Show/Un-grey achievements
                        button.contentText:SetTextColor("p", 1, 1, 1)
                    end

                    button.contentText:Show()
                    button.headerText:Hide()
                    --button:SetNormalTexture(nil)
                    button.contentText:SetHeight(button.contentText:GetContentHeight())
                    button:SetHeight(button.contentText:GetContentHeight())

                    button.tactics:Hide()
                    button.players:Hide()
                    button.enabled:Hide()
                    button.enabledText:Hide()

                    button.achievementID = instanceLocation["boss" .. counter2].achievement
                    button:SetScript("OnEnter", Achievement_OnEnter)
                    button:SetScript("OnLeave", Achievement_OnLeave)
                    button:SetScript("OnHide", Achievement_OnHide)

                    button:Show()
                    counter = counter + 1
                end
                counter2 = counter2 + 1
            end
        end

        if achievementFound == false then
            if UIConfig.achievementsCompleted == nil then
                UIConfig.achievementsCompleted = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
                UIConfig.achievementsCompleted:SetPoint("CENTER", UIConfig.ScrollFrame2, "CENTER", -20, 0);
                UIConfig.achievementsCompleted:SetWordWrap(true)
                UIConfig.achievementsCompleted:SetWidth(600)
            end

            if instanceType == "Scenarios" then
                UIConfig.achievementsCompleted:SetText(L["GUI_AchievementsCompletedForInstance"] .. " " .. Config:getLocalisedScenarioName(instanceLocation.name));
            else
                if core.gameVersionMajor == 3 and Config.currentTab == 3 then
                    UIConfig.achievementsCompleted:SetText(L["GUI_AchievementsCompletedForInstance"] .. " " .. instanceLocation.nameLocalised);
                else
                    UIConfig.achievementsCompleted:SetText(L["GUI_AchievementsCompletedForInstance"] .. " " .. Config:getLocalisedInstanceName(instanceLocation.name));
                end
            end
            UIConfig.achievementsCompleted:Show()
        end

        --Hide the remaining buttons
        for i = counter, numButtons do
            local button
            if Config.currentTab == 10 then
                button = DragonflightContentButtons[i]
            elseif Config.currentTab == 9 then
                button = ShadowlandsContentButtons[i]
            elseif Config.currentTab == 8 then
                button = BattleForAzerothContentButtons[i]
            elseif Config.currentTab == 7 then
                button = LegionContentButtons[i]
            elseif Config.currentTab == 6 then
                button = WarlordsOfDraenorContentButtons[i]
            elseif Config.currentTab == 5 then
                button = MistsOfPandariaContentButtons[i]
            elseif Config.currentTab == 4 then
                button = CataclysmContentButtons[i]
            elseif Config.currentTab == 3 then
                button = WrathOfTheLichKingContentButtons[i]
            end
            button:Hide()
        end
    end
end

function ClearGUITabs()
    for i = 1, 200 do
        local button
        button = DragonflightContentButtons[i]
        button:Hide()
        button = ShadowlandsContentButtons[i]
        button:Hide()
        button = BattleForAzerothContentButtons[i]
        button:Hide()
        button = LegionContentButtons[i]
        button:Hide()
        button = WarlordsOfDraenorContentButtons[i]
        button:Hide()
        button = MistsOfPandariaContentButtons[i]
        button:Hide()
        button = CataclysmContentButtons[i]
        button:Hide()
        button = WrathOfTheLichKingContentButtons[i]
        button:Hide()
    end
end

function Achievement_OnEnter(self)
    GameTooltip:Hide()
end

function Achievement_OnHide(self)
    GameTooltip:Hide()
end

function Achievement_OnEnter(self)
    local foundAchievement = false
    if Config.currentTab == 10 then
        for i = 1, #DragonflightContentButtons do
            if MouseIsOver(DragonflightContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(DragonflightContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 9 then
        for i = 1, #ShadowlandsContentButtons do
            if MouseIsOver(ShadowlandsContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(ShadowlandsContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 8 then
        for i = 1, #BattleForAzerothContentButtons do
            if MouseIsOver(BattleForAzerothContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(BattleForAzerothContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 7 then
        for i = 1, #LegionContentButtons do
            if MouseIsOver(LegionContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(LegionContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 6 then
        for i = 1, #WarlordsOfDraenorContentButtons do
            if MouseIsOver(WarlordsOfDraenorContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(WarlordsOfDraenorContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 5 then
        for i = 1, #MistsOfPandariaContentButtons do
            if MouseIsOver(MistsOfPandariaContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(MistsOfPandariaContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 4 then
        for i = 1, #CataclysmContentButtons do
            if MouseIsOver(CataclysmContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(CataclysmContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    elseif Config.currentTab == 3 then
        for i = 1, #WrathOfTheLichKingContentButtons do
            if MouseIsOver(WrathOfTheLichKingContentButtons[i]) then
                GameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                GameTooltip:SetHyperlink(GetAchievementLink(WrathOfTheLichKingContentButtons[i].achievementID))
                GameTooltip:Show()
                foundAchievement = true
            end
        end
    end

    if foundAchievement == false then
        GameTooltip:Hide()
    end
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

function Tactics_OnClick(self)
    core:detectGroupType()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if string.match(boss, "boss") then
                        if core.Instances[expansion][instanceType][instance][boss].generatedID == self:GetID() then
                            if core.gameVersionMajor > 4 then
                                if type(core.Instances[expansion][instanceType][instance][boss].tactics) == "table" then
                                    if UnitFactionGroup("player") == "Alliance" then
                                        core:sendMessageSafe(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. core.Instances[expansion][instanceType][instance][boss].tactics[1])
                                    else
                                        core:sendMessageSafe(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. core.Instances[expansion][instanceType][instance][boss].tactics[2])
                                    end
                                else
                                    core:sendMessageSafe(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. core.Instances[expansion][instanceType][instance][boss].tactics)
                                end
                            else
                                core:sendMessageSafe(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. core.Instances[expansion][instanceType][instance][boss].tacticsClassic)
                            end
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

Config:CreateGUI()
UIConfig:Hide()


------------------------------------------------------
------- Functions to create dynamic info frame -------
------------------------------------------------------

--On user accepting load create the frame.

--Add timer and text
--Be able to cancel timer

--Mirror array of players

-- Method:          InfoFrame:InitialiseFrame
-- What it Does:    Create the Info Frame shown during Fight Encounters
-- Purpose:         This is created to allow specific bosses to add useful information about a fight without having to use just chat channels.
local frameBackdrop = {
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	tile = true,
	tileSize = 16,
	insets = { left = 2, right = 14, top = 2, bottom = 2 },
}

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


    -- -- InfoFrame:SetBackdrop(frameBackdrop);
    -- InfoFrame:SetMovable(true)
    -- InfoFrame:EnableMouse(true)
    -- InfoFrame:SetClampedToScreen(true)
    -- InfoFrame:RegisterForDrag("LeftButton")
    -- InfoFrame:SetScript("OnDragStart", UIConfig.StartMoving)
    -- InfoFrame:SetScript("OnDragStop", function(self)
    --     self:StopMovingOrSizing()
    --     AchievementTrackerOptions["infoFrameXPos"] = self:GetLeft()
    --     AchievementTrackerOptions["infoFrameYPos"] = self:GetBottom()
    --     AchievementTrackerOptions["infoFrameScale"] = self:GetScale()
    -- end)

    -- --Info Frame X/Y Posiions
	-- if AchievementTrackerOptions["infoFrameXPos"] ~= nil and AchievementTrackerOptions["infoFrameYPos"] ~= nil then
    --     InfoFrame:ClearAllPoints()
    --     InfoFrame:SetPoint("BOTTOMLEFT",AchievementTrackerOptions["infoFrameXPos"],AchievementTrackerOptions["infoFrameYPos"])

    --     if AchievementTrackerOptions["infoFrameScale"] ~= nil then
    --         InfoFrame:SetScale(AchievementTrackerOptions["infoFrameScale"])
    --     end
	-- end

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

    -- if InfoFrame.heading:GetStringWidth() > InfoFrame:GetWidth() then
    --     InfoFrame:SetWidth(InfoFrame.heading:GetRight() - InfoFrame.heading:GetLeft() + 23)
    -- end
end

function IATInfoFrame:SetSubHeading1(text)
    if InfoFrame.subHeading1 == nil then
        InfoFrame.subHeading1 = InfoFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlightLarge")
    end
    InfoFrame.subHeading1:SetText(text)
    InfoFrame.subHeading1:SetHeight(InfoFrame.subHeading1:GetStringHeight())
    InfoFrame.subHeading1:ClearAllPoints()
    InfoFrame.subHeading1:SetPoint("TOPLEFT", InfoFrame.heading, "BOTTOMLEFT", 0, -5)

    -- if InfoFrame.subHeading1:GetStringWidth() > InfoFrame:GetWidth()then
    --     InfoFrame:SetWidth(InfoFrame.subHeading1:GetRight() - InfoFrame.subHeading1:GetLeft() + 23)
    -- end

    -- if InfoFrame.subHeading1:GetBottom() ~= nil and InfoFrame:GetTop() ~= nil then
    --     InfoFrame:SetHeight(InfoFrame.subHeading1:GetBottom() - InfoFrame:GetTop() - 10)
    -- end
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

    -- if InfoFrame.setText1:GetStringWidth() > InfoFrame:GetWidth()then
    --     InfoFrame:SetWidth(InfoFrame.setText1:GetRight() - InfoFrame.setText1:GetLeft() + 23)
    -- end

    -- if InfoFrame.setText1:GetBottom() ~= nil and InfoFrame:GetTop() ~= nil then
    --     InfoFrame:SetHeight(InfoFrame.setText1:GetBottom() - InfoFrame:GetTop() - 10)
    -- end

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

    -- if InfoFrame.setSubHeading2:GetStringWidth() > InfoFrame:GetWidth()then
    --     InfoFrame:SetWidth(InfoFrame.setSubHeading2:GetRight() - InfoFrame.setSubHeading2:GetLeft() + 23)
    -- end

    -- if InfoFrame.setSubHeading2:GetBottom() ~= nil and InfoFrame:GetTop() ~= nil then
    --     InfoFrame:SetHeight(InfoFrame.setSubHeading2:GetBottom() - InfoFrame:GetTop() - 10)
    -- end

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

    -- if InfoFrame.setText2:GetStringWidth() > InfoFrame:GetWidth() and width == nil then
    --     InfoFrame:SetWidth(InfoFrame.setText2:GetRight() - InfoFrame.setText2:GetLeft() + 23)
    -- end

    -- if InfoFrame.setText2:GetBottom() ~= nil and InfoFrame:GetTop() ~= nil then
    --     InfoFrame:SetHeight(InfoFrame.setText2:GetBottom() - InfoFrame:GetTop() - 10)
    -- end

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

        --Scroll to the correct position
        -- C_Timer.After(1, function()
        --     local _, maxVal =  UIConfig.ScrollFrame2.ScrollBar:GetMinMaxValues(); -- minVal = 0
        --     --local size = UIConfig.ScrollFrame2:GetTop() - UIConfig.ScrollFrame2:GetBottom(); -- This way you know the total height of your tactics scroll frame
        --     --Find Correct Frame
        --     --print("IAT_Achievement_" .. lastExpansion .. "_1")

        --     local newHeight = 0
        --     local headersInUse = 0
        --     -- print(maxVal,size,bossLocation, newHeight)
        --     for i=1,200 do
        --         local frameName = "IAT_Achievement_" .. lastExpansion .. "_" .. i
        --         if _G[frameName].achievementID == achievementID then
        --             --frameName = "IAT_Achievement_" .. (i - 1)
        --             print("IAT_Achievement_" .. lastExpansion .. headersInUse)
        --             local size = _G["IAT_Achievement_" .. lastExpansion .. "_1"].headerText:GetTop() - _G["IAT_Achievement_" .. lastExpansion .. "_" .. headersInUse]:GetBottom()
        --             local headerFrame = _G[frameName].headerText
        --             local bossLocation = headerFrame:GetTop(); -- this way you know where the boss is inside the container
        --             -- Now, based on size, maxVal and bossLocation, you might be able to calculate where to set the scrollBar value to show boss on top
        --             --local newHeight = size / newHeight * maxVal;
        --             local scaleFactor = newHeight / size * maxVal
        --             scaleFactor = min(scaleFactor, maxVal);
        --             UIConfig.ScrollFrame2.ScrollBar:SetValue(math.abs(scaleFactor));
        --             -- print(maxVal,size,bossLocation, scaleFactor)
        --             -- print("Scrollbar MaxValue: " .. maxVal)
        --             -- print("ScrollFrame Size: " .. size)
        --             -- print("Location of boss in Frame: " .. bossLocation)
        --             -- print("New Height: " .. newHeight)
        --             -- print("Scale Factor: " .. scaleFactor)
        --             -- print(UIConfig.ScrollFrame2:GetHeight())
        --         else
        --             headersInUse = headersInUse + 1
        --             if (i % 2 == 0) then
        --                 newHeight = newHeight + _G[frameName].contentText:GetContentHeight()
        --             else
        --                 newHeight = newHeight + _G[frameName].headerText:GetStringHeight()
        --             end
        --         end
        --     end
        -- end)
	end
end
