--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
core.Config = {} --adds a Config able to the addon namespace

local Config = core.Config
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

Config.currentTab = nil
Config.currentInstance = nil

--------------------------------------
-- Config functions
--------------------------------------
function Config:Toggle()
    local GUI = UIConfig or Config:CreateGUI()
    GUI:SetShown(not GUI:IsShown())
end

function Config:CreateButton(point, relativeFrame, relativePoint, yOffset, text)
	local btn = CreateFrame("Button", nil, relativeFrame, "GameMenuButtonTemplate");
	btn:SetPoint(point, relativeFrame, relativePoint, 0, yOffset);
	btn:SetSize(200, 30);
	btn:SetText(text);
	btn:SetNormalFontObject("GameFontNormal");
	btn:SetHighlightFontObject("GameFontHighlight");
	return btn;
end

function Config:CreateCheckBox(point, relativeFrame, relativePoint, xOffset, yOffset)
    local chk = CreateFrame("CheckButton", nil, relativeFrame, "UICheckButtonTemplate")
	chk:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset);
	return chk;
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

function Config:CreateText(point, relativeFrame, relativePoint, xOffset, yOffset, textString)
    local text = relativeFrame:CreateFontString(nil, relativeFrame, "GameFontHighlightSmall")
    text:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)
    text:SetText(textString)
    return text
end

local function Tab_OnClick(self)
    Config.currentTab = self:GetText();
    PanelTemplates_SetTab(self:GetParent(), self:GetID())

    local scrollChild = UIConfig.ScrollFrame:GetScrollChild()
    if scrollChild then
        scrollChild:Hide()
    end
    UIConfig.ScrollFrame:SetScrollChild(self.content)

    local scrollChild2 = UIConfig.ScrollFrame2:GetScrollChild()
    if scrollChild2 then
        scrollChild2:Hide()
    end
    UIConfig.ScrollFrame2:SetScrollChild(self.contenta)

    self.content:Show()

    if self.contenta ~= nil then
        self.contenta:Show()    
    end
end

local function SetTabs(frame, numTabs, ...)
	frame.numTabs = numTabs;
	
	local contents = {};
	local frameName = frame:GetName();
	
	for i = 1, numTabs do	
		local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate");
		tab:SetID(i);
		tab:SetText(select(i, ...));
		tab:SetScript("OnClick", Tab_OnClick);

		if (i == 1) then
            tab.content = CreateFrame("Frame", nil, UIConfig.ScrollFrame);
            tab.content:SetSize(778, 460);
            tab.content:Hide();
            
            table.insert(contents, tab.content)

			tab:SetPoint("TOPLEFT", UIConfig, "BOTTOMLEFT", 5, 7);
		else
            tab.content = CreateFrame("Frame", nil, UIConfig.ScrollFrame);
            tab.content:SetSize(220, 460);
            tab.content:Hide();

            tab.contenta = CreateFrame("Frame", nil, UIConfig.ScrollFrame2);
            tab.contenta:SetSize(558, 460);
            tab.contenta:Hide();
            
            table.insert(contents, tab.content)
            table.insert(contents, tab.contenta)

			tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i - 1)], "TOPRIGHT", -14, 0);
		end	
	end
	
	Tab_OnClick(_G[frameName.."Tab1"]);
	
	return unpack(contents);
end

function Config:CreateGUI()
    --Frame
    UIConfig = CreateFrame("Frame", "AchievementTracker", UIParent, "UIPanelDialogTemplate", "AchievementTemplate")
    UIConfig:SetSize(800, 500)
    UIConfig:SetPoint("CENTER") --Center of the screen
    --UIConfig:SetMovable(true)
    --UIConfig:EnableMouse(true)
    --UIConfig:SetClampedToScreen(true)
    --UIConfig:RegisterForDrag("LeftButton")
    --UIConfig:SetScript("OnDragStart", UIConfig.StartMoving)
    --UIConfig:SetScript("OnDragStop", UIConfig.StopMovingOrSizing)

    --Title
    UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	UIConfig.title:SetPoint("CENTER", AchievementTrackerTitleBG, "CENTER", 6, 1);
	UIConfig.title:SetText("Instance Achievement Tracker v0.3.0a");

    --Scroll Frame
    UIConfig.ScrollFrame = CreateFrame("ScrollFrame", nil, UIConfig, "UIPanelScrollFrameTemplate")
    UIConfig.ScrollFrame:SetPoint("TOPLEFT", AchievementTrackerDialogBG, "TOPLEFT", 4, -8)
    UIConfig.ScrollFrame:SetWidth(220)
    UIConfig.ScrollFrame:SetHeight(460)
    --UIConfig.ScrollFrame:SetPoint("BOTTOMLEFT", AchievementTrackerDialogBG, "BOTTOMLEFT", -3, 4)
    UIConfig.ScrollFrame:SetClipsChildren(true)

    --Scroll Bar
    UIConfig.ScrollFrame.ScrollBar:ClearAllPoints()
    UIConfig.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame, "TOPRIGHT", -12, -18)
    UIConfig.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame, "BOTTOMRIGHT", -7, 18)

    --Scroll Frame
     UIConfig.ScrollFrame2 = CreateFrame("ScrollFrame", nil, UIConfig, "UIPanelScrollFrameTemplate")
     UIConfig.ScrollFrame2:SetPoint("TOPRIGHT", AchievementTrackerDialogBG, "TOPRIGHT", 0, -8)
     UIConfig.ScrollFrame2:SetWidth(558)
     UIConfig.ScrollFrame2:SetHeight(460)
     --UIConfig.ScrollFrame:SetPoint("BOTTOMLEFT", AchievementTrackerDialogBG, "BOTTOMLEFT", -3, 4)
     --UIConfig.ScrollFrame2:SetClipsChildren(true)

     --Scroll Bar
     UIConfig.ScrollFrame2.ScrollBar:ClearAllPoints()
     UIConfig.ScrollFrame2.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame2, "TOPRIGHT", -12, -18)
     UIConfig.ScrollFrame2.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame2, "BOTTOMRIGHT", -7, 18)    

    --Tabs
    content1, LegionNav, LegionContent, WarlordsOfDraenorNav, WarlordsOfDraenorContent, MistsOfPandariaNav, MistsOfPandariaContent, CataclysmNav, CataclysmContent, WrathOfTheLichKingNav, WrathOfTheLichKingContent = SetTabs(UIConfig, 6, "Main", "Legion", "Warlords of Draenor", "Mists of Pandaria", "Cataclysm", "Wrath of the Lich King")

    --Content (Main)
	--content1.saveBtn = self:CreateButton("CENTER", content1, "TOP", -70, "Save");
    content1.title = content1:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
	content1.title:SetPoint("CENTER", AchievementTrackerDialogBG, "CENTER", -2, 210);
    content1.title:SetText("Welcome to Achievement Tracker V1.0");

    local menu = {
        { text = "Select an Option", isTitle = true},
        { text = "Option 1", func = function() print("You've chosen option 1"); end },
        { text = "Option 2", func = function() print("You've chosen option 2"); end },
        { text = "More Options", hasArrow = true,
            menuList = {
                { text = "Option 3", func = function() print("You've chosen option 3"); end }
            } 
        }
    }
    -- Note that this frame must be named for the dropdowns to work.
    local menuFrame = CreateFrame("Frame", "ExampleMenuFrame", UIParent, "UIDropDownMenuTemplate")
    
    -- Or make the menu appear at the frame:
    menuFrame:SetPoint("Center", UIParent, "Center")
    EasyMenu(menu, menuFrame, menuFrame, 0 , 0, "MENU");

    --Create the navigation buttons for each expansion
    local expansions = {"Legion", "WarlordsOfDraenor", "MistsOfPandaria", "Cataclysm", "WrathOfTheLichKing"}
    for i = 1, #expansions do
        --Raids
        local firstRaid = false
        local previousInstance
        for instance,v in pairs(core.Instances[expansions[i]].Raids) do
            if firstRaid == false then
                if expansions[i] == "Legion" then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav, "TOPLEFT", 0, core.Instances[expansions[i]].Raids[instance].name);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WarlordsOfDraenor" then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav, "TOPLEFT", 0, core.Instances[expansions[i]].Raids[instance].name);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "MistsOfPandaria" then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav, "TOPLEFT", 0, core.Instances[expansions[i]].Raids[instance].name);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "Cataclysm" then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav, "TOPLEFT", 0, core.Instances[expansions[i]].Raids[instance].name);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WrathOfTheLichKing" then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav, "TOPLEFT", 0, core.Instances[expansions[i]].Raids[instance].name);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                firstRaid = true
                previousInstance = instance
            else
                if expansions[i] == "Legion" then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Raids[instance].name);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WarlordsOfDraenor" then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Raids[instance].name);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "MistsOfPandaria" then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Raids[instance].name);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "Cataclysm" then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Raids[instance].name);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WrathOfTheLichKing" then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Raids[instance].name);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                previousInstance = instance
            end
        end
        --Dungeons
        local firstDungeon = false
        for instance,v in pairs(core.Instances[expansions[i]].Dungeons) do
            if firstDungeon == false then
                if expansions[i] == "Legion" then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -40, core.Instances[expansions[i]].Dungeons[instance].name);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WarlordsOfDraenor" then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -40, core.Instances[expansions[i]].Dungeons[instance].name);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "MistsOfPandaria" then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -40, core.Instances[expansions[i]].Dungeons[instance].name);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "Cataclysm" then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -40, core.Instances[expansions[i]].Dungeons[instance].name);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WrathOfTheLichKing" then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -40, core.Instances[expansions[i]].Dungeons[instance].name);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                firstDungeon = true
                previousInstance = instance
            else
                if expansions[i] == "Legion" then
                    LegionNav[instance] = self:CreateButton("TOPLEFT", LegionNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Dungeons[instance].name);
                    LegionNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WarlordsOfDraenor" then
                    WarlordsOfDraenorNav[instance] = self:CreateButton("TOPLEFT", WarlordsOfDraenorNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Dungeons[instance].name);
                    WarlordsOfDraenorNav[instance]:SetScript("OnClick", Instance_OnClick);                    
                elseif expansions[i] == "MistsOfPandaria" then
                    MistsOfPandariaNav[instance] = self:CreateButton("TOPLEFT", MistsOfPandariaNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Dungeons[instance].name);
                    MistsOfPandariaNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "Cataclysm" then
                    CataclysmNav[instance] = self:CreateButton("TOPLEFT", CataclysmNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Dungeons[instance].name);
                    CataclysmNav[instance]:SetScript("OnClick", Instance_OnClick);
                elseif expansions[i] == "WrathOfTheLichKing" then
                    WrathOfTheLichKingNav[instance] = self:CreateButton("TOPLEFT", WrathOfTheLichKingNav[previousInstance], "TOPLEFT", -32, core.Instances[expansions[i]].Dungeons[instance].name);
                    WrathOfTheLichKingNav[instance]:SetScript("OnClick", Instance_OnClick);
                end
                previousInstance = instance
            end            
        end
    end

    local buttonHeight = 30
    local numButtons = 200 --Total number of button we need for any instance. We can hide excess button for raids/dungeons with less bosses

    --Create the maximun number of buttons we could possible need for any instance
    for j = 1, #expansions do
        for i = 1, numButtons do
            if expansions[j] == "Legion" then
                LegionContentButtons[i] = CreateFrame("Button",nil,LegionContent)
                button = LegionContentButtons[i]
                button:SetSize(LegionContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",LegionContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif expansions[j] == "WarlordsOfDraenor" then
                WarlordsOfDraenorContentButtons[i] = CreateFrame("Button",nil,WarlordsOfDraenorContent)
                button = WarlordsOfDraenorContentButtons[i]
                button:SetSize(WarlordsOfDraenorContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",WarlordsOfDraenorContentButtons[i-1],"BOTTOMLEFT",0,0)
                end               
            elseif expansions[j] == "MistsOfPandaria" then
                MistsOfPandariaContentButtons[i] = CreateFrame("Button",nil,MistsOfPandariaContent)
                button = MistsOfPandariaContentButtons[i]
                button:SetSize(MistsOfPandariaContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",MistsOfPandariaContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif expansions[j] == "Cataclysm" then
                CataclysmContentButtons[i] = CreateFrame("Button",nil,CataclysmContent)
                button = CataclysmContentButtons[i]
                button:SetSize(CataclysmContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",CataclysmContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            elseif expansions[j] == "WrathOfTheLichKing" then
                WrathOfTheLichKingContentButtons[i] = CreateFrame("Button",nil,WrathOfTheLichKingContent)
                button = WrathOfTheLichKingContentButtons[i]
                button:SetSize(WrathOfTheLichKingContent:GetWidth()-18,buttonHeight)
                if i == 1 then
                    button:SetPoint("TOPLEFT",0,0-(i-1)*buttonHeight)
                else
                    button:SetPoint("TOPLEFT",WrathOfTheLichKingContentButtons[i-1],"BOTTOMLEFT",0,0)
                end
            end

            
            button:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
            button:SetID(i) -- we'll use this when collapsing/expanding
            button:SetScript("OnClick", ExpandExample_ListButtonOnClick)

            -- the text for the header
            button.headerText = button:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
            button.headerText:SetPoint("LEFT",12,0)
            button.headerText:SetText("This is headerText")

            -- the text for the content
            button.contentText = button:CreateFontString(nil,"ARTWORK","GameFontHighlight")
            button.contentText:SetPoint("TOPLEFT",16,0) -- a little extra indent
            button.contentText:SetText("This is contentText")
            button.contentText:SetJustifyH("LEFT")

            --Tactics
            button.tactics = Config:CreateButton2("TOPRIGHT", button, "TOPRIGHT", -1, -7, "Output Tactics")

            --Players
            button.players = Config:CreateButton2("TOPRIGHT", button.tactics, "TOPLEFT", -7, -1, "Output Players")

            --Track
            button.enabled = Config:CreateCheckBox("TOPRIGHT", button.players, "TOPLEFT", -7, -1)

            --Track Fontstring
            button.enabledText = Config:CreateText("TOPRIGHT", button.enabled, "TOPLEFT", 0, 1, "Track")

            button:Hide()
        end   
    end

end

function Config:Instance_OnClickAutomatic()
    Instance_OnClick(nil)
end

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
        core:sendDebugMessage("Clicked: " .. self:GetText())
        str = string.gsub(" " .. self:GetText(), "%W%l", string.upper):sub(2)
        local InstanceName = str:gsub("%s+", "")
        Config.currentInstance = InstanceName

        currentTabCompressed = string.gsub(" " .. Config.currentTab, "%W%l", string.upper):sub(2)
        currentTabCompressed = currentTabCompressed:gsub("%s+", "")
        if core.Instances[currentTabCompressed].Raids[InstanceName] ~= nil then
            instanceLocation = core.Instances[currentTabCompressed].Raids[InstanceName]
        else
            instanceLocation = core.Instances[currentTabCompressed].Dungeons[InstanceName]
        end
    else
        --Button needs updating for current instance
        if core.instanceType == "Raids" then
            instanceLocation = core.Instances[core.expansion].Raids[core.instance]
        elseif core.instanceType == "Dungeons" then
            instanceLocation = core.Instances[core.expansion].Dungeons[core.instance]
        end        

        --Set the current tab to the expansion of the current instance
        Config.currentTab = core.expansion

        --Set the current instance
        Config.currentInstance = core.instance

        --core:sendDebugMessage("Clicked: " .. Config.currentInstance)
    end

    for bossName,v in pairs(instanceLocation) do
        if bossName ~= "name" then
            local button

            --Header    
            if Config.currentTab == "Legion" then
                button = LegionContentButtons[counter]
            elseif Config.currentTab == "Warlords of Draenor" or Config.currentTab == "WarlordsOfDraenor" then
                button = WarlordsOfDraenorContentButtons[counter]
            elseif Config.currentTab == "Mists of Pandaria" or Config.currentTab == "MistsOfPandaria" then
                button = MistsOfPandariaContentButtons[counter]
            elseif Config.currentTab == "Cataclysm" then
                button = CataclysmContentButtons[counter]
            elseif Config.currentTab == "Wrath of the Lich King" or Config.currentTab == "WrathOfTheLichKing" then
                button = WrathOfTheLichKingContentButtons[counter]
            end
            button:Show()
            if counter > 1 then
                button:ClearAllPoints()
                if Config.currentTab == "Legion" then
                    button:SetPoint("TOPLEFT",LegionContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == "Warlords of Draenor" or Config.currentTab == "WarlordsOfDraenor" then
                    button:SetPoint("TOPLEFT",WarlordsOfDraenorContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == "Mists of Pandaria" or Config.currentTab == "MistsOfPandaria" then
                    button:SetPoint("TOPLEFT",MistsOfPandariaContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == "Cataclysm" then
                    button:SetPoint("TOPLEFT",CataclysmContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                elseif Config.currentTab == "Wrath of the Lich King" or Config.currentTab == "WrathOfTheLichKing" then
                    button:SetPoint("TOPLEFT",WrathOfTheLichKingContentButtons[counter-1],"BOTTOMLEFT",0,30-heightDifference)
                end                
            end
            button.headerText:SetText(instanceLocation["boss" .. counter2].name)
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
            --print(Config.currentTab)
            if Config.currentTab == "Legion" then
                button = LegionContentButtons[counter]
            elseif Config.currentTab == "Warlords of Draenor" or Config.currentTab == "WarlordsOfDraenor" then
                button = WarlordsOfDraenorContentButtons[counter]
            elseif Config.currentTab == "Mists of Pandaria" or Config.currentTab == "MistsOfPandaria" then
                button = MistsOfPandariaContentButtons[counter]
            elseif Config.currentTab == "Cataclysm" then
                button = CataclysmContentButtons[counter]
            elseif Config.currentTab == "Wrath of the Lich King" or Config.currentTab == "WrathOfTheLichKing" then
                button = WrathOfTheLichKingContentButtons[counter]
            end
            local players = "Players: "
            for i = 1, #instanceLocation["boss" .. counter2].players do
                players = players .. instanceLocation["boss" .. counter2].players[i] .. ", "
                --print(players)
            end
            button.contentText:SetText("Achievement: " .. GetAchievementLink(instanceLocation["boss" .. counter2].achievement) .. "\n\n" .. players .. "\n\nTactics: " .. instanceLocation["boss" .. counter2].tactics)
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
            
            button:Show()
            counter = counter + 1
            counter2 = counter2 + 1       
        end
    end

    --Hide the remaining buttons
    for i = counter, numButtons do
        local button
        if Config.currentTab == "Legion" then
            button = LegionContentButtons[i]
        elseif Config.currentTab == "Warlords of Draenor" or Config.currentTab == "WarlordsOfDraenor" then
            button = WarlordsOfDraenorContentButtons[i]
        elseif Config.currentTab == "Mists of Pandaria" or Config.currentTab == "MistsOfPandaria" then
            button = MistsOfPandariaContentButtons[i]
        elseif Config.currentTab == "Cataclysm" then
            button = CataclysmContentButtons[i]
        elseif Config.currentTab == "Wrath of the Lich King" or Config.currentTab == "WrathOfTheLichKing" then
            button = WrathOfTheLichKingContentButtons[i]
        end  
        button:Hide()
    end  
end

function Player_OnClick(self)
    --print("Clicked on players")
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
                                if #core.Instances[expansion][instanceType][instance][boss].players > 0 then
                                    players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " Players who need Achievement: "

                                    for i = 1, #core.Instances[expansion][instanceType][instance][boss].players do
                                        players = players .. core.Instances[expansion][instanceType][instance][boss].players[i] .. ", "
                                    end

                                    if core.scanFinished == false then
                                        players = players .. " (scan still in progress)"
                                    end
                                else
                                    if core.scanFinished == true then
                                        players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " No one in this group needs this achievement: "
                                    else
                                        players = GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " No one in this group needs this achievement (scan still in progress): "                        
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
    --print("Clicked on tactics")
    core:detectGroupType()
    local parent = self:GetParent()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
                    if core.Instances[expansion][instanceType][instance][boss].name == parent.headerText:GetText() then
                        local message, pattern, position;
                        local tactics = core.Instances[expansion][instanceType][instance][boss].tactics
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
                            status = "Disabled"
                        else
                            status = "Enabled"
                        end
                        core:printMessage(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " Tracking " .. status)
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