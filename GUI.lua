local _, core = ...
local L = core.L
core.Config = {}
core.IATInfoFrame = {}
local InfoFrame

local Config = core.Config
local IATInfoFrame = core.IATInfoFrame

Config.majorVersion = 5
Config.minorVersion = 8
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

BOSSBUTTON_COLLAPSEDHEIGHT = 84;

core.Config.g_achievementSelectionBehavior = nil;
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

------------------------------------------------------
---- Localisation
------------------------------------------------------

function Config:getLocalisedInstanceName(instanceID)
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
    local GUI = Config.UI or Config:CreateUI()
    GUI:SetShown(not GUI:IsShown())
    GameTooltip:Hide()
end

function Config:ToggleOn()
    --Toggle on only
    local GUI = Config.UI or Config:CreateUI()
    GUI:SetShown(true)
    GameTooltip:Hide()
end

function IAT_GlobalToggle()
    local GUI = Config.UI or Config:CreateUI()
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
    local text = self.UI:CreateFontString(nil, "OVERLAY", size)
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

function IAT_CheckForEscape(self, key)
    if key == "ESCAPE" then
        if not InCombatLockdown() then
            Config:Toggle()
            Config.UI:SetPropagateKeyboardInput(false)
        end
    elseif not InCombatLockdown() then
        Config.UI:SetPropagateKeyboardInput(true)
    end
end

local function CreateTab(parent, id, data)
    local tab

    if LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_CATACLYSM then
        --New style tab templates does not render correctly on cata wow so load old style tabs which look slightly better
        tab = CreateFrame("Button", parent:GetName().."Tab"..id, parent, "CharacterFrameTabButtonTemplate")
    else
        --New style tab templates for retail wow
        tab = CreateFrame("Button", parent:GetName().."Tab"..id, parent, "PanelTabButtonTemplate")
    end

    tab:SetID(id)
    tab:SetText(data.Title)
    tab:SetScript("OnClick", function(self)
        PanelTemplates_SetTab(parent, id)
        if self:GetID() == 1 then
            --Options
            Config:ShowOptionsPanel()
        else
            --Expansions
            Config:ShowInstancesForTab(self:GetID())
        end
    end)
    return tab
end

BossContentMixin = {}

function BossContentMixin:OnLoad()
    self.Highlight:Hide();
end

function BossContentMixin:OnEnter()
    local elementData = self:GetElementData();

    local achievementLink = GetAchievementLink(elementData.boss.achievement)

    GameTooltip:SetOwner(Config.UI, "ANCHOR_TOPRIGHT")
    GameTooltip:SetHyperlink(achievementLink)
    GameTooltip:Show()

    self.Highlight:Show();
end

function BossContentMixin:IsSelected()
	return SelectionBehaviorMixin.IsIntrusiveSelected(self);
end

function BossContentMixin:OnLeave()
    GameTooltip:Hide()
    self.Highlight:Hide();
end

function BossContentMixin:Expand(height)
	if ( not self.collapsed and self:GetHeight() == height ) then
		return;
	end
	self.collapsed = nil;
	self:SetHeight(height);
	self:GetHeight(); -- debug check
	self.Tactics:Show();
end

function BossContentMixin:Collapse()
	if ( self.collapsed ) then
		return;
	end
	self.collapsed = true;
	self:SetHeight(BOSSBUTTON_COLLAPSEDHEIGHT);
	self.Tactics:Hide();
end

function BossContentMixin:Init(elementData)
	self.index = elementData.index;
	self.id = elementData.id;

	self.Label:SetText(elementData.name);

    local achievementLink = GetAchievementLink(elementData.boss.achievement)
    achievementLink = achievementLink:gsub("&", "&amp;"); -- & in the achievement name would resolve the html syntax wrong

    local tactics = elementData.boss.tactics:gsub("%\n", "<br />")
    local tacticsStr = tactics == '' and '' or tactics

	self.Tactics:SetText("<html><body><p>" .. tacticsStr .. "</p></body></html>");

    self.currentHeight = self.Tactics:GetContentHeight()

    local index = Config.BossListDataProvider:FindIndex(elementData)
    Config.BossListDataProvider.collection[index].currentHeight = self.currentHeight

	if SelectionBehaviorMixin.IsElementDataIntrusiveSelected(elementData) then
		local height = self.Tactics:GetContentHeight() + BOSSBUTTON_COLLAPSEDHEIGHT
		self:Expand(height);
	else
		self:Collapse()
	end

    self.PlusMinus:SetTexCoord(0, .5, 0, 0.25);
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
    if LE_EXPANSION_LEVEL_CURRENT ~= LE_EXPANSION_CATACLYSM then
        --self.UI:SetPortraitToAsset([[Interface\Icons\ACHIEVEMENT_GUILDPERK_MRPOPULARITY]])
        self.UI:SetPortraitTextureRaw([[Interface\AddOns\InstanceAchievementTracker\Images\logo.png]])
        self.UI:SetPortraitTextureSizeAndOffset(55, -2, 4)
    else
        --Need to set manually for classic
        deepdump(self.UI.portrait)
        self.UI.portrait:SetTexture([[Interface\AddOns\InstanceAchievementTracker\Images\logo.png]]);
    end
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
        [1] = {Title = L["GUI_Options"], ExpansionID = 0},
        [2] = {Title = L["GUI_TheWarWithin"], ExpansionID = 11},
        [3] = {Title = L["GUI_Dragonflight"], ExpansionID = 10},
        [4] = {Title = L["GUI_Shadowlands"], ExpansionID = 9},
        [5] = {Title = L["GUI_BattleForAzeroth"], ExpansionID = 8},
        [6] = {Title = L["GUI_Legion"], ExpansionID = 7},
        [7] = {Title = L["GUI_WarlordsOfDraenor"], ExpansionID = 6},
        [8] = {Title = L["GUI_MistsOfPandaria"], ExpansionID = 5},
        [9] = {Title = L["GUI_Cataclysm"], ExpansionID = 4},
        [10] = {Title = L["GUI_WrathOfTheLichKing"], ExpansionID = 3}
    }

    local tabs = {}
    local lastIndex = 0
    for k, data in ipairs(Config.tabDataProvider) do
        if data.ExpansionID <= LE_EXPANSION_LEVEL_CURRENT + 1 then
            tabs[k] = CreateTab(self.UI, k, data)
            if k == 1 then
                tabs[k]:SetPoint("BOTTOMLEFT", self.UI, "BOTTOMLEFT", 20, -30)
            else
                tabs[k]:SetPoint("LEFT", tabs[lastIndex], "RIGHT", -15, 0)
            end
            lastIndex = k
        end
    end

    --Set a container to store the layout for the option tab
    self.UI.OptionsLayoutContainer = CreateFrame("FRAME", "OptionsTabContainer", self.UI)
    self.UI.OptionsLayoutContainer:SetPoint("TOPLEFT")
    self.UI.OptionsLayoutContainer:SetPoint("BOTTOMRIGHT")

    -- Create Left Inset
    self.UI.OptionsLayoutContainer.LeftInset = CreateFrame("Frame", "LeftInset", self.UI.OptionsLayoutContainer)
    self.UI.OptionsLayoutContainer.LeftInset:SetPoint("TOPLEFT", 4, -40)
    self.UI.OptionsLayoutContainer.LeftInset:SetPoint("BOTTOMLEFT", 4, 6)
    self.UI.OptionsLayoutContainer.LeftInset:SetSize(477, 526)

    -- Create Left Display
    self.UI.OptionsLayoutContainer.LeftDisplay = CreateFrame("Frame", "LeftDisplay", self.UI.OptionsLayoutContainer)
    self.UI.OptionsLayoutContainer.LeftDisplay:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.LeftInset, "TOPLEFT", 3, -3)
    self.UI.OptionsLayoutContainer.LeftDisplay:SetPoint("BOTTOMRIGHT", self.UI.OptionsLayoutContainer.LeftInset, "BOTTOMRIGHT", -3, 3)

    -- Create Right Inset
    self.UI.OptionsLayoutContainer.RightInset = CreateFrame("Frame", "RightInset", self.UI.OptionsLayoutContainer)
    self.UI.OptionsLayoutContainer.RightInset:SetPoint("TOPRIGHT", -6, -40)
    self.UI.OptionsLayoutContainer.RightInset:SetPoint("BOTTOMLEFT", self.UI.OptionsLayoutContainer.LeftInset, "BOTTOMRIGHT", 2, 0)

    -- Create Right Display
    self.UI.OptionsLayoutContainer.RightDisplay = CreateFrame("Frame", "RightDisplay", self.UI.OptionsLayoutContainer)
    self.UI.OptionsLayoutContainer.RightDisplay:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightInset, "TOPLEFT", 3, -3)
    self.UI.OptionsLayoutContainer.RightDisplay:SetPoint("BOTTOMRIGHT", self.UI.OptionsLayoutContainer.RightInset, "BOTTOMRIGHT", -3, 3)

    self.UI.OptionsLayoutContainer.OptionsListScrollContainer = CreateFrame("Frame", "OptionsListScrollContainer", self.UI.OptionsLayoutContainer)
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer:SetSize(450, 419)
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.LeftInset, "TOPLEFT", 6, -8)
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer:SetPoint("BOTTOMLEFT", self.UI.OptionsLayoutContainer.LeftInset, "BOTTOMRIGHT", 6, 5)

    --Create the ScrollBox Frame
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBox = CreateFrame("Frame", "ScrollBox", self.UI.OptionsLayoutContainer.OptionsListScrollContainer, "WowScrollBoxList")
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBox:SetPoint("TOPLEFT", 0, 0)
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBox:SetPoint("BOTTOMRIGHT", 0, 0)

    self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBar = CreateFrame("EventFrame", "ScrollBar", self.UI.OptionsLayoutContainer.OptionsListScrollContainer, "MinimalScrollBar")
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBar:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBox, "TOPRIGHT", 3, 0)
    self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBar:SetPoint("BOTTOMLEFT", self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBox, "BOTTOMRIGHT", 3, 0)

    Config.OptionsListDataProvider = CreateDataProvider()
    local ScrollView3 = CreateScrollBoxListLinearView()

    ScrollView3:SetDataProvider(Config.OptionsListDataProvider)

    ScrollUtil.InitScrollBoxListWithScrollBar(self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBox, self.UI.OptionsLayoutContainer.OptionsListScrollContainer.ScrollBar, ScrollView3)

    local function OptionsInitalizer(frame, data)
        frame.Text:SetText(data.name)
        if data.get() == nil then
            data.set(false)
        else
            frame.Checkbox:SetChecked(data.get())

            frame.Checkbox:SetScript("OnClick", function()
                if data.get() == true then
                    data.set(false)
                else
                    data.set(true)
                end
            end)
        end
    end

    ScrollView3:SetElementInitializer("IATOptionsFrameOption", OptionsInitalizer)

    --Set a container to store the layout for the expansion tabs
    self.UI.ExpansionLayoutContainer = CreateFrame("FRAME", "ExpansionTabContainer", self.UI)
    self.UI.ExpansionLayoutContainer:SetPoint("TOPLEFT")
    self.UI.ExpansionLayoutContainer:SetPoint("BOTTOMRIGHT")

    -- Create Left Inset
    self.UI.ExpansionLayoutContainer.LeftInset = CreateFrame("Frame", "LeftInset", self.UI.ExpansionLayoutContainer)
    self.UI.ExpansionLayoutContainer.LeftInset:SetPoint("TOPLEFT", 4, -40)
    self.UI.ExpansionLayoutContainer.LeftInset:SetPoint("BOTTOMLEFT", 4, 6)
    self.UI.ExpansionLayoutContainer.LeftInset:SetSize(237, 526)

    -- Create Right Inset
    self.UI.ExpansionLayoutContainer.RightInset = CreateFrame("Frame", "RightInset", self.UI.ExpansionLayoutContainer)
    self.UI.ExpansionLayoutContainer.RightInset:SetPoint("TOPRIGHT", -6, -40)
    self.UI.ExpansionLayoutContainer.RightInset:SetPoint("BOTTOMLEFT", self.UI.ExpansionLayoutContainer.LeftInset, "BOTTOMRIGHT", 2, 0)

    -- Create Left Display
    self.UI.ExpansionLayoutContainer.LeftDisplay = CreateFrame("Frame", "LeftDisplay", self.UI.ExpansionLayoutContainer)
    self.UI.ExpansionLayoutContainer.LeftDisplay:SetPoint("TOPLEFT", self.UI.ExpansionLayoutContainer.LeftInset, "TOPLEFT", 3, -3)
    self.UI.ExpansionLayoutContainer.LeftDisplay:SetPoint("BOTTOMRIGHT", self.UI.ExpansionLayoutContainer.LeftInset, "BOTTOMRIGHT", -3, 3)
    local LeftDisplayTexture = self.UI.ExpansionLayoutContainer.LeftDisplay:CreateTexture(nil, "BACKGROUND", "store-category-bg")
    LeftDisplayTexture:SetAllPoints(self.UI.ExpansionLayoutContainer.LeftDisplay)

    -- Create Right Display
    self.UI.ExpansionLayoutContainer.RightDisplay = CreateFrame("Frame", "RightDisplay", self.UI.ExpansionLayoutContainer)
    self.UI.ExpansionLayoutContainer.RightDisplay:SetPoint("TOPLEFT", self.UI.ExpansionLayoutContainer.RightInset, "TOPLEFT", 3, -3)
    self.UI.ExpansionLayoutContainer.RightDisplay:SetPoint("BOTTOMRIGHT", self.UI.ExpansionLayoutContainer.RightInset, "BOTTOMRIGHT", -3, 3)

    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer = CreateFrame("Frame", "InstanceListScrollContainer", self.UI.ExpansionLayoutContainer)
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer:SetSize(210, 419)
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer:SetPoint("TOPLEFT", self.UI.ExpansionLayoutContainer.LeftInset, "TOPLEFT", 6, -8)
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer:SetPoint("BOTTOMLEFT", self.UI.ExpansionLayoutContainer.LeftInset, "BOTTOMRIGHT", 6, 5)

    --Create the ScrollBox Frame
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBox = CreateFrame("Frame", "ScrollBox", self.UI.ExpansionLayoutContainer.InstanceListScrollContainer, "WowScrollBoxList")
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBox:SetPoint("TOPLEFT", 0, 0)
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBox:SetPoint("BOTTOMRIGHT", 0, 0)

    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBar = CreateFrame("EventFrame", "ScrollBar", self.UI.ExpansionLayoutContainer.InstanceListScrollContainer, "MinimalScrollBar")
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBar:SetPoint("TOPLEFT", self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBox, "TOPRIGHT", 3, 0)
    self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBar:SetPoint("BOTTOMLEFT", self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBox, "BOTTOMRIGHT", 3, 0)

    Config.InstanceListDataProvider = CreateDataProvider()
    local ScrollView = CreateScrollBoxListLinearView()
    ScrollView:SetDataProvider(Config.InstanceListDataProvider)

    ScrollUtil.InitScrollBoxListWithScrollBar(self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBox, self.UI.ExpansionLayoutContainer.InstanceListScrollContainer.ScrollBar, ScrollView)

    local function InstanceInitalizer(button, data)
        button:SetScript("OnClick", function()
            Config:ShowContentForInstance(data)
        end)
        button:SetText(data.name)
        button:SetID(data.id)
        button:SetPoint("TOP", 100, 100)
    end

    ScrollView:SetElementInitializer("UIPanelButtonTemplate", InstanceInitalizer)

    self.UI.ExpansionLayoutContainer.BossListScrollContainer = CreateFrame("Frame", "BossListScrollContainer", self.UI.ExpansionLayoutContainer)
    self.UI.ExpansionLayoutContainer.BossListScrollContainer:SetSize(690, 419)
    self.UI.ExpansionLayoutContainer.BossListScrollContainer:SetPoint("TOPLEFT", self.UI.ExpansionLayoutContainer.RightInset, "TOPLEFT", 0, -3)
    self.UI.ExpansionLayoutContainer.BossListScrollContainer:SetPoint("BOTTOMLEFT", self.UI.ExpansionLayoutContainer.RightInset, "BOTTOMRIGHT", 0, 3)

    --Create the ScrollBox Frame
    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox = CreateFrame("Frame", "ScrollBox", self.UI.ExpansionLayoutContainer.BossListScrollContainer, "WowScrollBoxList")
    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:SetPoint("TOPLEFT", 0, 0)
    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:SetPoint("BOTTOMRIGHT", 0, 0)

    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBar = CreateFrame("EventFrame", "ScrollBar", self.UI.ExpansionLayoutContainer.BossListScrollContainer, "MinimalScrollBar")
    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBar:SetPoint("TOPLEFT", self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox, "TOPRIGHT", 3, 0)
    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBar:SetPoint("BOTTOMLEFT", self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox, "BOTTOMRIGHT", 3, 0)
    Mixin(self.UI.ExpansionLayoutContainer.BossListScrollContainer, BossContentMixin)

    Config.BossListDataProvider = CreateDataProvider()
    local ScrollView2 = CreateScrollBoxListLinearView()

    ScrollView2:SetElementExtentCalculator(function(dataIndex, elementData)
        if SelectionBehaviorMixin.IsElementDataIntrusiveSelected(elementData) then
            local totalHeight = BOSSBUTTON_COLLAPSEDHEIGHT
            totalHeight = totalHeight + elementData.currentHeight

            return totalHeight
        else
            return BOSSBUTTON_COLLAPSEDHEIGHT
        end
    end)

    local function BossInitializer(button, data)
        --Allow the button to reveal tactics
        button:SetScript("OnClick", function(self)
            core.Config.g_achievementSelectionBehavior:ToggleSelect(self);

            if self.collapsed == true then
                button.PlusMinus:SetTexCoord(0, .5, 0, 0.25);
            else
                button.PlusMinus:SetTexCoord(0, .5, 0.25, 0.50);
            end
        end)

        --Button to announce the selected achievement tactics to the in-game chat
        button.OutputTactics:SetScript("OnClick", function(self)
            core:detectGroupType()
            if core.gameVersionMajor > 4 then
                core:sendMessageSafe(GetAchievementLink(data.boss.achievement) .. " " .. data.boss.tactics)
            else
                core:sendMessageSafe(GetAchievementLink(data.boss.achievement) .. " " .. data.boss.tacticsClassic)
            end
        end)

        --Button to announce to chat which players are missing the selected achievement
        button.OutputPlayers:SetScript("OnClick", function(self)

        end)

        --Allow item links to show/hide their relevant tooltip
        button.Tactics:SetScript("OnHyperlinkEnter", function(abc, linkData, link, button)
            GameTooltip:SetOwner(self.UI, "ANCHOR_TOPRIGHT")
            GameTooltip:SetHyperlink(linkData)
            GameTooltip:Show()
        end)
        button.Tactics:SetScript("OnHyperlinkLeave", function(self, linkData, link, button)
            GameTooltip:Hide()
        end)

        --Show the achievement for the
        button.Description:SetText(GetAchievementLink(data.boss.achievement):gsub("|cffffff00", "|cff0000FF"))

        button.Label:SetText(data.name)
        button.Tactics:Hide()
        button.OutputTactics:SetWidth(110)
        button.OutputPlayers:SetWidth(110)

        if string.len(data.boss.tactics) > 0 then
            button.PlusMinus:Show()
        else
            button.PlusMinus:Hide()
        end

        -- Get creature info
        local creatureIndex = 1 -- Assuming we want the first creature
        local creatureID, creatureName, creatureDescription, creatureDisplayID, creatureIcon = EJ_GetCreatureInfo(creatureIndex, data.boss.name)

        if creatureIcon then
            button.Icon.texture:SetTexture(creatureIcon)
        else
            button.Icon.texture:SetTexture("Interface\\Icons\\Spell_Misc_HellifrePVPHonorHoldFavor") -- Set default texture
        end

        if data.tracking ~= nil then
            button.Trackable:Show()
        else
            button.Trackable:Hide()
        end
    end

    ScrollView2:SetElementInitializer("IATBossFrameTemplate", BossInitializer)
    ScrollView2:SetDataProvider(Config.BossListDataProvider)
    ScrollUtil.InitScrollBoxListWithScrollBar(self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox, self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBar, ScrollView2)

    core.Config.g_achievementSelectionBehavior = ScrollUtil.AddSelectionBehavior(self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox, SelectionBehaviorFlags.Deselectable, SelectionBehaviorFlags.Intrusive)
    core.Config.g_achievementSelectionBehavior:RegisterCallback(SelectionBehaviorMixin.Event.OnSelectionChanged, function(o, elementData, selected)
        local button = self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:FindFrame(elementData)
        if button then
            button:SetSelected(selected);
        end
    end, self)

    ScrollUtil.AddResizableChildrenBehavior(self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox);

    -- Set the first tab as selected
    PanelTemplates_SetNumTabs(self.UI, #tabs)
    PanelTemplates_SetTab(self.UI, 1)
    Config:ShowOptionsPanel()

    self.UI.ExpansionLayoutContainer:Hide()
    self.UI:Hide()
end

function Config:ShowContentForInstance(data)
    local instanceName = data.name

    Config.BossListDataProvider:Flush()
    self.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:FullUpdate(ScrollBoxConstants.UpdateImmediately);

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
                Expanded = true,
                collapsed = true
            }

            --If we are currently not tracking achievements for the current player then scan the achievements on current tab so we can honor hide/grey achievements option
            local _, _, _, completed = GetAchievementInfo(data.boss.achievement)
            local completedAchievement = false
            if core.Options.HideCompletedAchievements.get() == true and core.achievementTrackingEnabled == false then
                if completed == true then
                    completedAchievement = true
                end
            end

            if core.Options.HideCompletedAchievements.get() == false or (core.Options.HideCompletedAchievements.get() == true and completedAchievement == false) then
                table.insert(bossesToSort, data)
            end
        end
    end

    table.sort(bossesToSort, function(a, b)
        return a.key < b.key
    end)

    for i, boss in ipairs(bossesToSort) do
        Config.BossListDataProvider:Insert(boss)
    end
end

-- Function to show instances for a given tab
function Config:ShowInstancesForTab(tabID)
    local data = Config.tabDataProvider[tabID]

    self.UI.ExpansionLayoutContainer:Show()
    self.UI.OptionsLayoutContainer:Hide()

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
                        if instanceType == "Scenarios" or instanceType == "Delves" then
                            instanceName = Config:getLocalisedScenarioName(v.name)
                        else
                            instanceName = Config:getLocalisedInstanceName(v.name)
                        end
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
    local order = { Raids = 1, Dungeons = 2, Scenarios = 3, Delves = 4 }

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
    self.UI.ExpansionLayoutContainer:Hide()
    self.UI.OptionsLayoutContainer:Show()

    -- Create the texture
    self.UI.OptionsLayoutContainer.RightDisplay.Logo = self.UI.OptionsLayoutContainer.RightDisplay:CreateTexture(nil, "OVERLAY")
    self.UI.OptionsLayoutContainer.RightDisplay.Logo:SetTexture("Interface\\AddOns\\InstanceAchievementTracker\\Images\\logo.png")
    self.UI.OptionsLayoutContainer.RightDisplay.Logo:SetSize(120, 120)
    self.UI.OptionsLayoutContainer.RightDisplay.Logo:SetPoint("TOPLEFT")

    self.UI.OptionsLayoutContainer.RightDisplay.LogoText = self.UI.OptionsLayoutContainer.RightDisplay:CreateTexture(nil, "OVERLAY")
    self.UI.OptionsLayoutContainer.RightDisplay.LogoText:SetTexture("Interface\\AddOns\\InstanceAchievementTracker\\Images\\IATTEXT.png")
    self.UI.OptionsLayoutContainer.RightDisplay.LogoText:SetSize(330, 180)
    self.UI.OptionsLayoutContainer.RightDisplay.LogoText:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.Logo, "TOPRIGHT", 5, 40)

    self.UI.OptionsLayoutContainer.RightDisplay.Translators = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.UI.OptionsLayoutContainer.RightDisplay.Translators:SetPoint("BOTTOMLEFT", self.UI.OptionsLayoutContainer.RightDisplay, "BOTTOMLEFT", 0, 0)
    self.UI.OptionsLayoutContainer.RightDisplay.Translators:SetText(L["GUI_Translators"] .. ": " .. L["Gui_TranslatorNames"])

    self.UI.OptionsLayoutContainer.RightDisplay.Tactics = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.UI.OptionsLayoutContainer.RightDisplay.Tactics:SetPoint("BOTTOMLEFT", self.UI.OptionsLayoutContainer.RightDisplay.Translators, "BOTTOMLEFT", 0, 20)
    self.UI.OptionsLayoutContainer.RightDisplay.Tactics:SetText(L["GUI_Tactics"] .. ": " .. L["Gui_TacticsNames"])

    self.UI.OptionsLayoutContainer.RightDisplay.Author = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.UI.OptionsLayoutContainer.RightDisplay.Author:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.Tactics, "TOPLEFT", 0, 20)
    self.UI.OptionsLayoutContainer.RightDisplay.Author:SetText(L["GUI_Author"] .. ": (EU) Whizzey-Doomhammer")

    self.UI.OptionsLayoutContainer.RightDisplay.Version = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.UI.OptionsLayoutContainer.RightDisplay.Version:SetPoint("BOTTOMRIGHT", self.UI.OptionsLayoutContainer.RightDisplay, "BOTTOMRIGHT", 0, 0)
    self.UI.OptionsLayoutContainer.RightDisplay.Version:SetText("v" .. Config.majorVersion .. "." .. Config.minorVersion .. "." .. Config.revisionVersion)

    self.UI.OptionsLayoutContainer.RightDisplay.Tracking = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    self.UI.OptionsLayoutContainer.RightDisplay.Tracking:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.Logo, "BOTTOMLEFT", 0, -5)
    self.UI.OptionsLayoutContainer.RightDisplay.Tracking:SetText(L["GUI_TrackingNumber"] .. ":")

    self.UI.OptionsLayoutContainer.RightDisplay.TrackingAchievements = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.UI.OptionsLayoutContainer.RightDisplay.TrackingAchievements:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.Tracking, "BOTTOMLEFT", 0, -5)
    self.UI.OptionsLayoutContainer.RightDisplay.TrackingAchievements:SetText(L["GUI_Achievements"] .. " (?%)")

    self.UI.OptionsLayoutContainer.RightDisplay.TrackingTactics = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.UI.OptionsLayoutContainer.RightDisplay.TrackingTactics:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.TrackingAchievements, "BOTTOMLEFT", 0, -5)
    self.UI.OptionsLayoutContainer.RightDisplay.TrackingTactics:SetText(L["GUI_Tactics"] .. " (?%)")

    self.UI.OptionsLayoutContainer.RightDisplay.DiscordTitle = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordTitle:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.TrackingTactics, "BOTTOMLEFT", 0, -15)
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordTitle:SetText(L["GUI_AchievementsDiscordTitle"] .. ":")

    self.UI.OptionsLayoutContainer.RightDisplay.DiscordURL = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordURL:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.DiscordTitle, "BOTTOMLEFT", 0, -5)
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordURL:SetText("https://discord.gg/achievements")

    self.UI.OptionsLayoutContainer.RightDisplay.DiscordDescription = self.UI.OptionsLayoutContainer:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordDescription:SetPoint("TOPLEFT", self.UI.OptionsLayoutContainer.RightDisplay.DiscordURL, "BOTTOMLEFT", 0, -5)
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordDescription:SetText(L["GUI_AchievementsDiscordDescription"])
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordDescription:SetWidth(400)
    self.UI.OptionsLayoutContainer.RightDisplay.DiscordDescription:SetJustifyH("LEFT")
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

getGameBuild()
Config:CreateUI()