-- Purpose:         Namespace
local _, core = ...         --Global addon namespace
local L = core.L            --Global localisation table
core.Config = {}            --Add a config table to the addon namespace

-- Purpose:         Stores all the frames for each tab in the GUI.
local Config = core.Config
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

-- Purpose:         Stores information about the current status of the GUI
Config.currentTab = nil             --Stores which tab is currently selected
Config.currentInstance = nil        --Stores which instance is currently selected

-- Purpose:         Stores information about the current options in the GUI
AchievementTrackerOptions = {}

-- Purpose:         Information about the current release. This is mianly used to detect which addon should output messages to chat to avoid spam
Config.majorVersion = 2						--Addon with a higher major version change have priority over a lower major version
Config.minorVersion = 4						--Addon with a minor version change have prioirty over a lower minor version
Config.revisionVersion = 0					--Addon with a revision change have the same priorty as a lower revision verison
Config.releaseType = ""                     --Release type (Alpha, Beta, Release)

-- Purpose:         Used to detect which version of the game the user is running. This is used so we can add features for different versions of the game.
local _, _, _, tocVersionloc = GetBuildInfo()
core.tocVersion = tocVersionloc

------------------------------------------------------
---- Localisation
------------------------------------------------------

function Config:getLocalisedInstanceName(instanceID)
    return EJ_GetInstanceInfo(instanceID)
end

function Config:getLocalisedEncouterName(encounterID)
    return EJ_GetEncounterInfo(encounterID)
end



-- Method:          Config:Toggle()
-- What it Does:    Toggles the GUI to show or hide
-- Purpose:         Checks whether the GUI is currently being shown and performs the opposite action
function Config:Toggle()
    local GUI = UIConfig or Config:CreateGUI()
    GUI:SetShown(not GUI:IsShown())
    AltGameTooltip:Hide()
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

-- Method:          Config:CreateText()
-- What it Does:    Create a new frame of type fontstring
-- Purpose:         This is used to put text on the GUI
function Config:CreateText(point, relativeFrame, relativePoint, xOffset, yOffset, textString)       
    local text = relativeFrame:CreateFontString(nil, relativeFrame, "GameFontHighlightSmall")      
    text:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)                            
    text:SetText(textString)                                                                        
    return text
end

function Config:CreateText2(point, relativeFrame, relativePoint, xOffset, yOffset, textString, size)
    local text = UIConfig:CreateFontString(nil, relativeFrame, size)
    text:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
    text:SetText(textString)
    return text
end

-- Method:          Tab_OnClick()
-- What it Does:    Event fired when the user clicks on a tab
-- Purpose:         This is used to load the correct frames when clicking on each of the tabs
function Tab_OnClick(self)
    Config.currentTab = self:GetID();                           --Get the ID of the tab the user has selected.
    PanelTemplates_SetTab(self:GetParent(), self:GetID())       --Changed the selected tab to the tab the user has just clicked on

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
    UIConfig.ScrollFrame2:SetScrollChild(self.contenta)

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
            
            UIConfig.Main2.features:Show()
            UIConfig.Main2.features1:Show()
            UIConfig.Main2.features2:Show()
            UIConfig.Main2.features3:Show()
            UIConfig.Main2.features4:Show()
            UIConfig.Main2.features5:Show()
            UIConfig.Main2.features6:Show()
            
            UIConfig.Main2.options:Show() 
            UIConfig.Main2.options:Show()
            UIConfig.Main2.options2:Show()
            UIConfig.Main2.options3:Show()
            UIConfig.Main2.options4:Show()
            UIConfig.Main2.options5:Show()

            UIConfig.Main.author:Show()
            UIConfig.Main.verison:Show()

            UIConfig.Main2.content:Show()
            UIConfig.Main2.content2:Show()
        else                                    --Main tab frames have not been created so need to create frames first before showing.
            --Heading
            UIConfig.Main = Config:CreateText2("TOP", AchievementTrackerDialogBG, "TOP", 0, -10, "Instance Achievement Tracker", "GameFontNormalLarge")
            UIConfig.Main:SetWidth(750)

            --Author
            UIConfig.Main.author = Config:CreateText2("BOTTOMRIGHT", AchievementTrackerDialogBG, "BOTTOMRIGHT", -5, 5, "(EU) Whizzey-Doomhammer","GameFontNormal")
            
            --Version
            UIConfig.Main.verison = Config:CreateText2("BOTTOMLEFT", AchievementTrackerDialogBG, "BOTTOMLEFT", 5, 5, "v" .. Config.majorVersion .. "." .. Config.minorVersion .. "." .. Config.revisionVersion .. Config.releaseType,"GameFontNormal")
    
            --Currently tracking
            UIConfig.Main2 = Config:CreateText2("TOPLEFT", UIConfig.Main, "TOPLEFT", 0, -45, L["Currently Tracking"] .. ":","GameFontNormalLarge")            
            UIConfig.Main2:SetWidth(300)
            UIConfig.Main2:SetJustifyH("LEFT")

            --Work out how many achievements and tactics are currently being tracked
            local achievementsTracked = 0
            local tacticsTracked = 0

            for expansion, _ in pairs(core.Instances) do
                for instanceType, _ in pairs(core.Instances[expansion]) do
                    for instance, _ in pairs(core.Instances[expansion][instanceType]) do
                        for boss, _ in pairs(core.Instances[expansion][instanceType][instance]) do
                            if boss ~= "name" then
                                if core.Instances[expansion][instanceType][instance][boss].track ~= nil then
                                    achievementsTracked = achievementsTracked + 1
                                end
                                if #core.Instances[expansion][instanceType][instance][boss].tactics > 1 then
                                    tacticsTracked = tacticsTracked + 1
                                end
                            end
                        end
                    end
                end
            end

            UIConfig.Main2.content = Config:CreateText2("TOPLEFT", UIConfig.Main2, "TOPLEFT", 0, -20, achievementsTracked .. " " .. L["Achievements"],"GameFontHighlight")
            UIConfig.Main2.content2 = Config:CreateText2("TOPLEFT", UIConfig.Main2.content, "TOPLEFT", 0, -15, tacticsTracked .. " " .. L["Tactics"],"GameFontHighlight") 
            
            --Features
            UIConfig.Main2.features = Config:CreateText2("TOPLEFT", UIConfig.Main2.content, "TOPLEFT", 0, -40, L["Features"] .. ":","GameFontNormalLarge")  
            UIConfig.Main2.features:SetWidth(750)    
            UIConfig.Main2.features:SetJustifyH("LEFT")        
            UIConfig.Main2.features1 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features, "TOPLEFT", 0, -20, L["- Tracks when the criteria of instance achievements have been met and output this to chat"],"GameFontHighlight")   
            UIConfig.Main2.features2 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features1, "TOPLEFT", 0, -20, L["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"],"GameFontHighlight")   
            UIConfig.Main2.features3 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features2, "TOPLEFT", 0, -20, L["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."],"GameFontHighlight")   
            UIConfig.Main2.features4 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features3, "TOPLEFT", 0, -30, L["- Scans all players in the group to see which achievements each player is missing for the current instance"],"GameFontHighlight")   
            UIConfig.Main2.features5 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features4, "TOPLEFT", 0, -20, L["- Announce to chat players who are missing achievements for certain bosses"],"GameFontHighlight")   
            UIConfig.Main2.features6 = Config:CreateText2("TOPLEFT", UIConfig.Main2.features5, "TOPLEFT", 0, -20, L["- Announce to chat tactics for a certain boss"],"GameFontHighlight")   
            UIConfig.Main2.features3:SetWidth(750)
            UIConfig.Main2.features3:SetJustifyH("LEFT") 

            --Options
            UIConfig.Main2.options = Config:CreateText2("TOPLEFT", UIConfig.Main2.features6, "TOPLEFT", 0, -30, L["Options"] .. ":","GameFontNormalLarge")
            UIConfig.Main2.options:SetWidth(750)    
            UIConfig.Main2.options:SetJustifyH("LEFT")

            --Enable Addon
            UIConfig.Main2.options2 = Config:CreateCheckBox("TOPLEFT", UIConfig, "TOPLEFT", 20, -320, "AchievementTracker_EnableAddon")
            UIConfig.Main2.options2:SetScript("OnClick", enableAddon_OnClick)
            UIConfig.Main2.options3 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options2, "TOPLEFT", 30, -9, L["Enable Addon"],"GameFontHighlight")

            --Toggle Minimap Icon
            UIConfig.Main2.options4 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options2, "TOPLEFT", 0, -25, "AchievementTracker_ToggleMinimapIcon")
            UIConfig.Main2.options4:SetScript("OnClick", ATToggleMinimapIcon_OnClick)
            UIConfig.Main2.options5 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options4, "TOPLEFT", 30, -9, L["Show Minimap Button"],"GameFontHighlight")            

            --Announce which acheivements are being tracked to group
            -- UIConfig.Main2.options6 = Config:CreateCheckBox("TOPLEFT", UIConfig.Main2.options3, "TOPLEFT", 0, -25, "AchievementTracker_ToggleMinimapIcon")
            -- UIConfig.Main2.options6:SetScript("OnClick", ATToggleMinimapIcon_OnClick)
            -- UIConfig.Main2.options7 = Config:CreateText2("TOPLEFT", UIConfig.Main2.options5, "TOPLEFT", 30, -9, "Show Minimap Button","GameFontHighlight")             

            -- print("Addon State: " .. AchievementTrackerOptions["enableAddon"])

            -- if AchievementTrackerOptions["enableAddon"] == nil or AchievementTrackerOptions["enableAddon"] == true then
            --     UIConfig.Main2.options2:SetChecked(true)
            -- else
            --     UIConfig.Main2.options2:SetChecked(false)
            -- end
            
        end
    else                                --User has selected an expansion tab so hide main menu options
        UIConfig.ScrollFrame:Show()
        UIConfig.ScrollFrame2:Show()
        
        UIConfig.Main:Hide()
        UIConfig.Main2:Hide()

        UIConfig.Main2.features:Hide()
        UIConfig.Main2.features1:Hide()
        UIConfig.Main2.features2:Hide()
        UIConfig.Main2.features3:Hide()
        UIConfig.Main2.features4:Hide()
        UIConfig.Main2.features5:Hide()
        UIConfig.Main2.features6:Hide()
        
        UIConfig.Main2.options:Hide() 
        UIConfig.Main2.options:Hide()
        UIConfig.Main2.options2:Hide()
        UIConfig.Main2.options3:Hide()
        UIConfig.Main2.options4:Hide()
        UIConfig.Main2.options5:Hide()
        
        UIConfig.Main.author:Hide()
        UIConfig.Main.verison:Hide()

        UIConfig.Main2.content:Hide()
        UIConfig.Main2.content2:Hide()
    end
end

-- Method:          ATToggleMinimapIcon_OnClick()
-- What it Does:    Toggle minimap Icon
-- Purpose:         This will toggle to minimap button to show or hide depending on user preferences
function ATToggleMinimapIcon_OnClick(self)
    AchievementTrackerOptions["showMinimap"] = self:GetChecked()
    if self:GetChecked() then
        core.ATButton:Show("InstanceAchievementTracker")
    else
        core.ATButton:Hide("InstanceAchievementTracker")
    end
end

-- Method:          enableAddon_OnClick()
-- What it Does:    Toggle the addon on or off
-- Purpose:         This will toggle whether the addon will ask if user wants to track achievements or not when entering instances
function enableAddon_OnClick(self)
    AchievementTrackerOptions["enableAddon"] = self:GetChecked()
    setAddonEnabled(self:GetChecked())
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
                    if boss ~= "name" then
                        if mode == false then
                            core.Instances[expansion][instanceType][instance][boss].players = {}
                            table.insert(core.Instances[expansion][instanceType][instance][boss].players, L["(Achievement Tracking Disabled)"])
                        else
                            core.Instances[expansion][instanceType][instance][boss].players = {}
                            table.insert(core.Instances[expansion][instanceType][instance][boss].players, L["(Enter instance to start scanning)"])
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
	
	for i = 1, numTabs do	
		local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate")
		tab:SetID(i)                                --This is used when clicking on the tab to load the correct frames
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
            tab.contenta:SetSize(558, 460)
            tab.contenta:Hide()
            
            table.insert(contents, tab.content)
            table.insert(contents, tab.contenta)

			tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", -14, 0)
		end	
	end
	
	Tab_OnClick(_G[frameName.."Tab1"]) --Load in the main frame to begin with
	
	return unpack(contents) --Return the table containing all the frames
end

-- Method:          Config:CreateGUI()
-- What it Does:    Create the IAT main GUI tab
-- Purpose:         This create the main GUI tab for IAT
function Config:CreateGUI()
    --Main Frame
    UIConfig = CreateFrame("Frame", "AchievementTracker", UIParent, "UIPanelDialogTemplate", "AchievementTemplate")
    UIConfig:SetSize(800, 500)
    UIConfig:SetPoint("CENTER")
    UIConfig:SetMovable(true)
    UIConfig:EnableMouse(true)
    UIConfig:SetClampedToScreen(true)
    UIConfig:RegisterForDrag("LeftButton")
    UIConfig:SetScript("OnDragStart", UIConfig.StartMoving)
    UIConfig:SetScript("OnDragStop", UIConfig.StopMovingOrSizing)

    --Title
    UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	UIConfig.title:SetPoint("CENTER", AchievementTrackerTitleBG, "CENTER", 6, 1);
	UIConfig.title:SetText(L["Instance Achievement Tracker"]);

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
     UIConfig.ScrollFrame2:SetWidth(558)
     UIConfig.ScrollFrame2:SetHeight(460)

     --Scroll Bar For Content
     UIConfig.ScrollFrame2.ScrollBar:ClearAllPoints()
     UIConfig.ScrollFrame2.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame2, "TOPRIGHT", -12, -18)
     UIConfig.ScrollFrame2.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame2, "BOTTOMRIGHT", -7, 18)    

    --Tabs
    content1, BattleForAzerothNav, BattleForAzerothContent, LegionNav, LegionContent, WarlordsOfDraenorNav, WarlordsOfDraenorContent, MistsOfPandariaNav, MistsOfPandariaContent, CataclysmNav, CataclysmContent, WrathOfTheLichKingNav, WrathOfTheLichKingContent = SetTabs(UIConfig, 7, L["Main"], L["Battle for Azeroth"], L["Legion"], L["Warlords of Draenor"], L["Mists of Pandaria"], L["Cataclysm"], L["Wrath of the Lich King"])    

    --Content (Main)
    content1.title = content1:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
	content1.title:SetPoint("CENTER", AchievementTrackerDialogBG, "CENTER", -2, 210);
    content1.title:SetText("Welcome to Achievement Tracker V1.0");

    --Create the navigation buttons for each expansion
    local expansions = 6
    
    for i = 2, 7 do
        --Raids
        local firstRaid = false
        local previousInstance
        for instance,v in pairs(core.Instances[i].Raids) do
            if firstRaid == false then
                if i == 2 then
                    BattleForAzerothNav[instance] = self:CreateButton("TOPLEFT", BattleForAzerothNav, "TOPLEFT", 0, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    BattleForAzerothNav[instance]:SetScript("OnClick", Instance_OnClick);                
                elseif i == 3 then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav, "TOPLEFT", 0, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav, "TOPLEFT", 0, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav, "TOPLEFT", 0, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav, "TOPLEFT", 0, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav, "TOPLEFT", 0, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                firstRaid = true
                previousInstance = instance
            else
                if i == 2 then
                    BattleForAzerothNav[instance] = self:CreateButton("TOPLEFT", BattleForAzerothNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    BattleForAzerothNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Raids[instance].name), instance);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                previousInstance = instance
            end
        end
        --Dungeons
        local firstDungeon = false
        for instance,v in pairs(core.Instances[i].Dungeons) do
            if firstDungeon == false then
                if i == 2 then
                    BattleForAzerothNav[instance] = self:CreateButton("TOPLEFT", BattleForAzerothNav[previousInstance], "TOPLEFT", -40, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    BattleForAzerothNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -40, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -40, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 5 then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -40, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -40, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -40, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                firstDungeon = true
                previousInstance = instance
            else
                if i == 2 then
                    BattleForAzerothNav[instance] = self:CreateButton("TOPLEFT", BattleForAzerothNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    BattleForAzerothNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 3 then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 4 then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);                    
                elseif i == 5 then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 6 then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif i == 7 then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -32, Config:getLocalisedInstanceName(core.Instances[i].Dungeons[instance].name), instance);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                previousInstance = instance
            end            
        end
    end

    local buttonHeight = 30
    local numButtons = 200 --Total number of button we need for any instance. We can hide excess button for raids/dungeons with less bosses

    --Create the maximun number of buttons we could possible need for any instance
    for j = 2, expansions do
        for i = 1, numButtons do
            if j == 2 then
                BattleForAzerothContentButtons[i] = CreateFrame("Button",nil,BattleForAzerothContent)
                button = BattleForAzerothContentButtons[i]
                button:SetSize(BattleForAzerothContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",BattleForAzerothContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 3 then
                LegionContentButtons[i] = CreateFrame("Button",nil,LegionContent)
                button = LegionContentButtons[i]
                button:SetSize(LegionContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",LegionContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 4 then
                WarlordsOfDraenorContentButtons[i] = CreateFrame("Button",nil,WarlordsOfDraenorContent)
                button = WarlordsOfDraenorContentButtons[i]
                button:SetSize(WarlordsOfDraenorContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",WarlordsOfDraenorContentButtons[i-1],"BOTTOMLEFT",0,0)
                end               
            elseif j == 5 then
                MistsOfPandariaContentButtons[i] = CreateFrame("Button",nil,MistsOfPandariaContent)
                button = MistsOfPandariaContentButtons[i]
                button:SetSize(MistsOfPandariaContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",MistsOfPandariaContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 6 then
                CataclysmContentButtons[i] = CreateFrame("Button",nil,CataclysmContent)
                button = CataclysmContentButtons[i]
                button:SetSize(CataclysmContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",CataclysmContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif j == 7 then
                WrathOfTheLichKingContentButtons[i] = CreateFrame("Button",nil,WrathOfTheLichKingContent)
                button = WrathOfTheLichKingContentButtons[i]
                button:SetSize(WrathOfTheLichKingContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",WrathOfTheLichKingContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            end

            
            --button:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
            --button:SetID(i) -- we'll use this when collapsing/expanding
            --button:SetScript("OnClick", ExpandExample_ListButtonOnClick)

            -- the text for the header
            button.headerText = button:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
            button.headerText:SetPoint("LEFT",12,0)
           -- button.headerText:SetText("This is headerText")

            -- the text for the content
            button.contentText = button:CreateFontString(nil,"ARTWORK","GameFontHighlight")
            button.contentText:SetPoint("TOPLEFT",16,0) -- a little extra indent
            --button.contentText:SetText("This is contentText")
            button.contentText:SetJustifyH("LEFT")

            --Tactics
            button.tactics = Config:CreateButton2("TOPRIGHT", button, "TOPRIGHT", -1, -7, L["Output Tactics"])

            --Players
            button.players = Config:CreateButton2("TOPRIGHT", button.tactics, "TOPLEFT", -7, -1, L["Output Players"])

            --Track
            button.enabled = Config:CreateCheckBox("TOPRIGHT", button.players, "TOPLEFT", -7, -1)

            --Track Fontstring
            button.enabledText = Config:CreateText("TOPRIGHT", button.enabled, "TOPLEFT", 0, 1, L["Track"])

            button:Hide()
        end   
    end

end

-- Method:          Config:Instance_OnClickAutomatic()
-- What it Does:    Calls the Instance_OnClick() function
-- Purpose:         This is used when automatically selected the tab after enabling achievement for an instance
function Config:Instance_OnClickAutomatic()
    Instance_OnClick(nil)
end

-- Method:          Config:Instance_OnClick()
-- What it Does:    Updates frame text for current instance clicked
-- Purpose:         This is used when clicking on an instance to update the contents with current instance
function Instance_OnClick(self)
    
    local instanceLocation
    local currentTabCompressed
    local str
    local numButtons = 200
    local counter = 1
    local counter2 = 1
    local heightDifference = 30

    if type(self) == "table" then
        --Button has been pressed by the user
        local InstanceID = self:GetID()     --Get the ID of the button that was pressed

        --If raid is wrath of the lich king as is not Ulduar then we need to re-add the '-' so the button can find the correct raid
        if Config.currentTab == 7 then --Current position of WOTLK expansion. Needs updating each expansion
            if InstanceID ~= 603 then
                InstanceID = tostring(InstanceID)
                InstanceID = InstanceID:sub(1, -3) .. "-" .. InstanceID:sub(-2)
            end
        end

        if core.Instances[Config.currentTab].Raids[InstanceID] ~= nil then
            instanceLocation = core.Instances[Config.currentTab].Raids[InstanceID]
        else
            instanceLocation = core.Instances[Config.currentTab].Dungeons[InstanceID]
        end
    else
        --Button needs updating for current instance. Automatically clicked by addon
        if core.instanceType == "Raids" then
            instanceLocation = core.Instances[core.expansion].Raids[core.instance]
        elseif core.instanceType == "Dungeons" then
            instanceLocation = core.Instances[core.expansion].Dungeons[core.instance]
        end        

        --Set the current tab to the expansion of the current instance
        Config.currentTab = core.expansion

        --Set the current instance
        Config.currentInstance = core.instance     
    end

    for bossName,v in pairs(instanceLocation) do
        if bossName ~= "name" then
            local button

            --Header
            if Config.currentTab == 2 then
                button = BattleForAzerothContentButtons[counter]               
            elseif Config.currentTab == 3 then
                button = LegionContentButtons[counter]
            elseif Config.currentTab == 4 then
                button = WarlordsOfDraenorContentButtons[counter]
            elseif Config.currentTab == 5 then
                button = MistsOfPandariaContentButtons[counter]
            elseif Config.currentTab == 6 then
                button = CataclysmContentButtons[counter]
            elseif Config.currentTab == 7 then
                button = WrathOfTheLichKingContentButtons[counter]
            end
            button:Show()
            if counter > 1 then
                button:ClearAllPoints()
                if Config.currentTab == 2 then
                    button:SetPoint("TOPLEFT",BattleForAzerothContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == 3 then
                    button:SetPoint("TOPLEFT",LegionContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == 4 then
                    button:SetPoint("TOPLEFT",WarlordsOfDraenorContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == 5 then
                    button:SetPoint("TOPLEFT",MistsOfPandariaContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == 6 then
                    button:SetPoint("TOPLEFT",CataclysmContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == 7 then
                    button:SetPoint("TOPLEFT",WrathOfTheLichKingContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                end                
            end
            button.headerText:SetText(Config:getLocalisedEncouterName(instanceLocation["boss" .. counter2].name))
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
            counter = counter + 1  

            --Content        
            if Config.currentTab == 2 then
                button = BattleForAzerothContentButtons[counter]
            elseif Config.currentTab == 3 then
                button = LegionContentButtons[counter]
            elseif Config.currentTab == 4 then
                button = WarlordsOfDraenorContentButtons[counter]
            elseif Config.currentTab == 5 then
                button = MistsOfPandariaContentButtons[counter]
            elseif Config.currentTab == 6 then
                button = CataclysmContentButtons[counter]
            elseif Config.currentTab == 7 then
                button = WrathOfTheLichKingContentButtons[counter]
            end

            local players = L["Players"] .. ": "
            for i = 1, #instanceLocation["boss" .. counter2].players do
                players = players .. instanceLocation["boss" .. counter2].players[i] .. ", "
            end

            button.contentText:SetText(L["Achievement"] .. ": " .. GetAchievementLink(instanceLocation["boss" .. counter2].achievement) .. "\n\n" .. players .. "\n\n" .. L["Tactics"] .. ": " .. instanceLocation["boss" .. counter2].tactics)
            button.contentText:Show()
            button.headerText:Hide()
            button:SetNormalTexture(nil)
            button.contentText:SetWidth(500)
            button.contentText:SetHeight(500)

            button.contentText:SetWordWrap(true)
            button.contentText:SetHeight(button.contentText:GetStringHeight())
            heightDifference = button.contentText:GetStringHeight();

            button.tactics:Hide()
            button.players:Hide()
            button.enabled:Hide()
            button.enabledText:Hide()

            button.achievementID = instanceLocation["boss" .. counter2].achievement
            button:SetScript("OnEnter", Achievement_OnEnter)
            button:Show()

            counter = counter + 1
            counter2 = counter2 + 1
        end
    end

    --Hide the remaining buttons
    for i = counter, numButtons do
        local button
        if Config.currentTab == 2 then
            button = BattleForAzerothContentButtons[i]        
        elseif Config.currentTab == 3 then
            button = LegionContentButtons[i]
        elseif Config.currentTab == 4 then
            button = WarlordsOfDraenorContentButtons[i]
        elseif Config.currentTab == 5 then
            button = MistsOfPandariaContentButtons[i]
        elseif Config.currentTab == 6 then
            button = CataclysmContentButtons[i]
        elseif Config.currentTab == 7 then
            button = WrathOfTheLichKingContentButtons[i]
        end  
        button:Hide()
    end  
end

function Achievement_OnEnter(self)
    if Config.currentTab == 2 then
        for i = 1, #BattleForAzerothContentButtons do
            if MouseIsOver(BattleForAzerothContentButtons[i]) then
                AltGameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                AltGameTooltip:SetHyperlink(GetAchievementLink(BattleForAzerothContentButtons[i].achievementID))
                AltGameTooltip:Show()
            end
        end
    elseif Config.currentTab == 3 then
        for i = 1, #LegionContentButtons do
            if MouseIsOver(LegionContentButtons[i]) then
                AltGameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                AltGameTooltip:SetHyperlink(GetAchievementLink(LegionContentButtons[i].achievementID))
                AltGameTooltip:Show()
            end
        end
    elseif Config.currentTab == 4 then
        for i = 1, #WarlordsOfDraenorContentButtons do
            if MouseIsOver(WarlordsOfDraenorContentButtons[i]) then
                AltGameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                AltGameTooltip:SetHyperlink(GetAchievementLink(WarlordsOfDraenorContentButtons[i].achievementID))
                AltGameTooltip:Show()
            end
        end
    elseif Config.currentTab == 5 then
        for i = 1, #MistsOfPandariaContentButtons do
            if MouseIsOver(MistsOfPandariaContentButtons[i]) then
                AltGameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                AltGameTooltip:SetHyperlink(GetAchievementLink(MistsOfPandariaContentButtons[i].achievementID))
                AltGameTooltip:Show()
            end
        end
    elseif Config.currentTab == 6 then
        for i = 1, #CataclysmContentButtons do
            if MouseIsOver(CataclysmContentButtons[i]) then
                AltGameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                AltGameTooltip:SetHyperlink(GetAchievementLink(CataclysmContentButtons[i].achievementID))
                AltGameTooltip:Show()
            end
        end
    elseif Config.currentTab == 7 then
        for i = 1, #WrathOfTheLichKingContentButtons do
            if MouseIsOver(WrathOfTheLichKingContentButtons[i]) then
                AltGameTooltip:SetOwner(UIConfig, "ANCHOR_TOPRIGHT")
                AltGameTooltip:SetHyperlink(GetAchievementLink(WrathOfTheLichKingContentButtons[i].achievementID))
                AltGameTooltip:Show()
            end
        end
    end  
end

function Player_OnClick(self)
    core:detectGroupType()
    local parent = self:GetParent()
    parent = parent:GetParent()

    core:sendDebugMessage(parent.headerText:GetText())

	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
            for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                if instance == Config.currentInstance then
                    for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                        if core.Instances[expansion][instanceType][instance][boss].name == parent.headerText:GetText() then
                            
                            local players
                            if core.inInstance == true then
                                if core.Instances[expansion][instanceType][instance][boss].players[1] == "(" .. L["No players in the group need this achievement"] .. ")" then
                                    if core.scanFinished == true then
                                        players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["No players in the group need this achievement"]
                                    else
                                        players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["No players in the group need this achievement"] .. " (" .. L["scan still in progress"] .. ")"                        
                                    end   
                                elseif core.Instances[expansion][instanceType][instance][boss].players[1] == "(" .. L["Enter instance to start scanning"] .. ")" then
                                    players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement)   
                                else
                                    players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["Players who need Achievement"] .. ": "

                                    for i = 1, #core.Instances[expansion][instanceType][instance][boss].players do
                                        players = players .. core.Instances[expansion][instanceType][instance][boss].players[i] .. ", "
                                    end

                                    if core.scanFinished == false then
                                        players = players .. " (" .. L["scan still in progress"] .. ")"
                                    end
                                end
                            else
                                players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement)
                            end
                            
                            local message, pattern, position;
                            position = 1;
                            for i = 1, #players, 249 do
                                message = players:sub(position, position + 248);
                                if #message < 249 then
                                    pattern = ".+";
                                else
                                    pattern = "(.+)%s";
                                end
                                for capture in message:gmatch(pattern) do
                                    core:sendMessage2(capture);
                                    position = position + #capture + 1;
                                end
                            end
                        end
                    end
                end
			end
		end
	end
end

function Tactics_OnClick(self)
    core:detectGroupType()
    local parent = self:GetParent()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if core.Instances[expansion][instanceType][instance][boss].name == parent.headerText:GetText() then
                        local message, pattern, position;
                        local tactics = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. core.Instances[expansion][instanceType][instance][boss].tactics
                        position = 1;
                        for i = 1, #tactics, 249 do
                            message = tactics:sub(position, position + 248);
                            if #message < 249 then
                                pattern = ".+";
                            else
                                pattern = "(.+)%s";
                            end
                            for capture in message:gmatch(pattern) do
                                core:sendMessage2(capture);
                                position = position + #capture + 1;
                            end
                        end
                    end
                end
			end
		end
	end
end

function Enabled_OnClick(self)
    local parent = self:GetParent()
    parent = parent:GetParent()
    parent = parent:GetParent()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if core.Instances[expansion][instanceType][instance][boss].name == parent.headerText:GetText() then
                        core.Instances[expansion][instanceType][instance][boss].enabled = self:GetChecked()

                        --Print to chat
                        local status = nil
                        if core.Instances[expansion][instanceType][instance][boss].enabled == false then
                            status = L["Disabled"]
                        else
                            status = L["Enabled"]
                        end
                        core:printMessage(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " " .. L["Tracking"] .. " " .. status)
                    end
                end
			end
		end
	end    
end

function ExpandExample_ListButtonOnClick(self)
    --print("Running This")
    --print(self:GetID())
    --print(self:Hide())
    -- local index = self:GetID()
    -- -- only headers can be expanded or collapsed

    --     CollapseTradeSkillSubClass(index)
    --     --ExpandTradeSkillSubClass(index)
    -- ExpandExample_UpdateList()
end 

function CollapseTradeSkillSubClass(self)
    self.contentText:Hide()
end

function ExpandExample_UpdateList()

end

    SlashCmdList["EXPANDEXAMPLE"] = ExpandExample_UpdateList
    SLASH_EXPANDEXAMPLE1 = "/ex"

Config:CreateGUI()
UIConfig:Hide()