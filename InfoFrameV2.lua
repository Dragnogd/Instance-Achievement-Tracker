--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

core.InfoFramev2 = {}
core.InfoFramev2.Events = CreateFrame("Frame")

InfoFrameContentMixin = {}

INFOFRAMEBUTTON_COLLAPSEDHEIGHT = 25

function InfoFrameContentMixin:OnLoad()
    self.Highlight:Hide();
end

function InfoFrameContentMixin:OnEnter()
    local elementData = self:GetElementData();

    local achievementLink = GetAchievementLink(elementData.boss.i)

    GameTooltip:SetOwner(core.Config.UI, "ANCHOR_TOPRIGHT")
    GameTooltip:SetHyperlink(achievementLink)
    GameTooltip:Show()

    self.Highlight:Show();
end

function InfoFrameContentMixin:IsSelected()
	return SelectionBehaviorMixin.IsIntrusiveSelected(self);
end

function InfoFrameContentMixin:OnLeave()
    GameTooltip:Hide()
    self.Highlight:Hide();
end

function InfoFrameContentMixin:Expand(height)
	if ( not self.collapsed and self:GetHeight() == height ) then
		return;
	end
	self.collapsed = nil;
	self:SetHeight(height);
	self:GetHeight(); -- debug check
	self.Criteria:Show();
end

function InfoFrameContentMixin:Collapse()
    print("HERE collapsing " .. self:GetElementData().name)
	if ( self.collapsed ) then
		return;
	end
    print("HERE setting collapsed height for " .. self:GetElementData().name .. " as " .. INFOFRAMEBUTTON_COLLAPSEDHEIGHT)
	self.collapsed = true;
	self:SetHeight(INFOFRAMEBUTTON_COLLAPSEDHEIGHT);
    self.Criteria:Hide();
end

function InfoFrameContentMixin:Init(elementData)
	self.index = elementData.index;
	self.id = elementData.id;
    self.elementData = elementData

	self.Label:SetText(elementData.name);

    -- -- Ensure the achievement link is processed correctly
    -- local achievementLink = GetAchievementLink(elementData.key)
    -- achievementLink = achievementLink:gsub("&", "&amp;"); -- & in the achievement name would resolve the html syntax wrong

    -- -- Set default text for the tactics
    self:UpdateTacticsContent(elementData.defaultTacticText)

    -- Set the plus/minus texture
    self.PlusMinus:SetAtlas("QuestLog-icon-Expand")
end

function InfoFrameContentMixin:SetSelected(selected)
	self:Init(self:GetElementData());
	SetFocusedAchievement(self.id);
end

function InfoFrameContentMixin:UpdateTacticsContent(tacticText, highlightCriteriaID)
    print("highlightCriteriaID in UpdateTacticsContent", highlightCriteriaID)
    -- Ensure we have valid data
    local elementData = self:GetElementData()

    deepdump(elementData)

    if not elementData then return end

    -- Show critiera
    local html = core.Tracker:GetAchievementCriteriaHTML(elementData.key, highlightCriteriaID)
    self.Criteria:SetText("<html><body><p>" .. html .. "</p></body></html>")

    print("HTML" .. html)

    -- Calculate and update the height
    self.currentHeight = self.Criteria:GetContentHeight() + INFOFRAMEBUTTON_COLLAPSEDHEIGHT

    local index = core.Config.AchievementListDataProvider:FindIndex(elementData)
    core.Config.AchievementListDataProvider.collection[index].currentHeight = self.currentHeight

    -- Expand or collapse based on selection
    if SelectionBehaviorMixin.IsElementDataIntrusiveSelected(elementData) then
        local height = self.currentHeight + INFOFRAMEBUTTON_COLLAPSEDHEIGHT
        self:Expand(height)
    else
        self:Collapse()
    end
end

function core.InfoFramev2:CreateUI()
    self.UI = CreateFrame("Frame", "IAT_InfoFrameV2", UIParent, "NysTDL_MainFrameRetail")
    self.UI:SetSize(300, 400)
    self.UI:SetPoint("CENTER")
    self.UI:SetMovable(true)
    self.UI:SetClampedToScreen(true)
    self.UI:RegisterForDrag("LeftButton")
    self.UI:SetFrameStrata("HIGH")
    self.UI:EnableMouse(true)
    self.UI:SetResizable(true)
    self.UI:SetScript("OnDragStart", self.UI.StartMoving)
    self.UI:SetScript("OnDragStop", self.UI.StopMovingOrSizing)
    local title = self.UI.NineSlice and self.UI.NineSlice.TitleText
    if title then
        print("Found title:", title:GetText())
        title:ClearAllPoints()
        title:SetPoint("TOP", self.UI, "TOP", 0, -5)
        title:SetPoint("LEFT", self.UI, "LEFT", 10, 0)
        title:SetPoint("RIGHT", self.UI.CloseButton, "LEFT")
        title:SetWordWrap(false)
        title:SetText("Instance Achievement Tracker")
    end

    -- Create a frame to hold the navigation system
    self.UI.Navigation = CreateFrame("Frame", "InfoFramev2Navigation", self.UI)
    self.UI.Navigation:SetPoint("TOPLEFT", self.UI, "TOPLEFT", 0, -25)
    self.UI.Navigation:SetPoint("TOPRIGHT", self.UI, "TOPRIGHT", 0, -25)
    self.UI.Navigation:SetHeight(110)

    -- Add a font string with the text "Next Stop" to the top left of the navigation frame
    self.UI.Navigation.NextStopLabel = self.UI.Navigation:CreateFontString("InfoFramev2NextStopLabel", "ARTWORK", "GameFontNormalLarge")
    self.UI.Navigation.NextStopLabel:SetPoint("TOPLEFT", self.UI.Navigation, "TOPLEFT", 15, -10)
    self.UI.Navigation.NextStopLabel:SetText("Next Stop:")

    -- Add a button with the text "Plan Route" to the top right of the navigation frame
    self.UI.Navigation.PlanRouteButton = CreateFrame("Button", "InfoFramev2PlanRouteButton", self.UI.Navigation, "UIPanelButtonTemplate")
    self.UI.Navigation.PlanRouteButton:SetSize(100, 25)
    self.UI.Navigation.PlanRouteButton:SetPoint("TOPRIGHT", self.UI.Navigation, "TOPRIGHT", -10, 0)
    self.UI.Navigation.PlanRouteButton:SetText("Plan Route")
    self.UI.Navigation.PlanRouteButton:SetScript("OnClick", function()
        core.Navigation:PlotRoute()
    end)

    --  Add a fontstring below the Next Stop label to show the next stop name. Default text should be "Antoran Wastes"
    -- Text should be white and normal size
    self.UI.Navigation.NextStopName = self.UI.Navigation:CreateFontString("InfoFramev2NextStopName", "ARTWORK", "GameFontNormal")
    self.UI.Navigation.NextStopName:SetPoint("TOPLEFT", self.UI.Navigation.NextStopLabel, "BOTTOMLEFT", 0, -7)
    self.UI.Navigation.NextStopName:SetText("Waiting for route...")
    self.UI.Navigation.NextStopName:SetTextColor(1, 1, 1)

    -- Add a fontstring next to the next stop name with the distance to next stop and estimated time of arrival. This should be gray text and normal size
    self.UI.Navigation.NextStopDistanceETA = self.UI.Navigation:CreateFontString("InfoFramev2NextStopDistanceETA", "ARTWORK", "GameFontNormalSmall")
    self.UI.Navigation.NextStopDistanceETA:SetPoint("LEFT", self.UI.Navigation.NextStopName, "RIGHT", 10, 0)
    self.UI.Navigation.NextStopDistanceETA:SetText("5.2 km - ETA: 10 min")
    self.UI.Navigation.NextStopDistanceETA:SetTextColor(0.7, 0.7, 0.7)

    -- Add a button below the next stop name that says "Next Stop"
    self.UI.Navigation.NextStopButton = CreateFrame("Button", "InfoFramev2NextStopButton", self.UI.Navigation, "UIPanelButtonTemplate")
    self.UI.Navigation.NextStopButton:SetSize(80, 25)
    self.UI.Navigation.NextStopButton:SetPoint("TOPLEFT", self.UI.Navigation.NextStopName, "BOTTOMLEFT", 0, -10)
    self.UI.Navigation.NextStopButton:SetText("Next Stop")
    self.UI.Navigation.NextStopButton:SetScript("OnClick", function()
        --core.RoutePlanner:GoToNextStop()
    end)

    -- Create a container to hold the contents
    self.UI.Container = CreateFrame("Frame", "InfoFramev2Container", self.UI)
    -- Anchor the container to the bottom of the navigation frame
    self.UI.Container:SetPoint("TOPLEFT", self.UI.Navigation, "BOTTOMLEFT")
    self.UI.Container:SetPoint("TOPRIGHT", self.UI.Navigation, "BOTTOMRIGHT")

    -- Create a Scroll container for the tracked achievements
    self.UI.ScrollContainer = CreateFrame("Frame", "OptionsListScrollContainer", self.UI.Container)
    self.UI.ScrollContainer:SetSize(200, 30)
    self.UI.ScrollContainer:SetPoint("TOPLEFT", self.UI, "TOPLEFT", 10, -115)
    self.UI.ScrollContainer:SetPoint("BOTTOMRIGHT", self.UI, "BOTTOMRIGHT", -25, 10)

    --Create the ScrollBox Frame
    self.UI.ScrollContainer.ScrollBox = CreateFrame("Frame", "ScrollBox", self.UI.ScrollContainer, "WowScrollBoxList")
    self.UI.ScrollContainer.ScrollBox:SetPoint("TOPLEFT", 0, 0)
    self.UI.ScrollContainer.ScrollBox:SetPoint("BOTTOMRIGHT", 0, 0)

    self.UI.ScrollContainer.ScrollBar = CreateFrame("EventFrame", "ScrollBar", self.UI.ScrollContainer, "MinimalScrollBar")
    self.UI.ScrollContainer.ScrollBar:SetPoint("TOPLEFT", self.UI.ScrollContainer.ScrollBox, "TOPRIGHT", 3, 0)
    self.UI.ScrollContainer.ScrollBar:SetPoint("BOTTOMLEFT", self.UI.ScrollContainer.ScrollBox, "BOTTOMRIGHT", 3, 0)
    Mixin(self.UI.ScrollContainer, InfoFrameContentMixin)

    core.Config.InfoFrameDataProvider = CreateDataProvider()
    local ScrollView2 = CreateScrollBoxListLinearView()

    local function InfoFrameInitializer(button, data)
        --Allow the button to reveal tactics
        button:SetScript("OnClick", function(self)
            print("HERE opening tactics for " .. data.name)
            core.Config.InfoFrameSelectionBehavior:ToggleSelect(self);

            if self.collapsed == true then
                --QuestLog-icon-shrink"
                button.PlusMinus:SetAtlas("QuestLog-icon-Expand")
            else
                --QuestLog-icon-Expand
                button.PlusMinus:SetAtlas("QuestLog-icon-shrink")
            end
        end)

        -- Enable or disable the output tactics button based on the selected tactic
        -- if (data.defaultTacticText ~= nil and #data.defaultTacticText == 0) or data.defaultTacticText == nil then
        --     button.PlusMinus:Hide()
        -- else
        --     button.PlusMinus:Show()
        -- end
        button.PlusMinus:Show()

        --Allow item links to show/hide their relevant tooltip
        -- button.Tactics:SetScript("OnHyperlinkEnter", function(abc, linkData, link, button)
        --     GameTooltip:SetOwner(self.UI, "ANCHOR_TOPRIGHT")
        --     GameTooltip:SetHyperlink(linkData)
        --     GameTooltip:Show()
        -- end)
        -- button.Tactics:SetScript("OnHyperlinkLeave", function(self, linkData, link, button)
        --     GameTooltip:Hide()
        -- end)

        -- Allow criteria links to show/hide their relevant tooltip
        button.Criteria:SetScript("OnHyperlinkEnter", function(frame, linkData, link)
            local linkType, achievementID, criteriaID = strsplit(":", linkData)
            local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, duration, elapsed = GetAchievementCriteriaInfoByID(tonumber(achievementID), tonumber(criteriaID))

            print("HERE showing tooltip for criteria link " .. linkData)

            local databaseCriteriaData = nil
            local achievementID = tonumber(achievementID)
            local criteriaID = tonumber(criteriaID)
            local exists = core.db.a[achievementID] and core.db.a[achievementID].cr and core.db.a[achievementID].cr[criteriaID] ~= nil
            if exists then
                databaseCriteriaData = core.db.a[achievementID].cr[criteriaID]
            end

            GameTooltip:SetOwner(self.UI, "ANCHOR_TOPRIGHT")
            GameTooltip:ClearLines()

            -- Criteria title
            GameTooltip:AddLine(criteriaString, 1, 0.82, 0)
            GameTooltip:AddLine(" ", 1, 0.82, 0, true)
            GameTooltip:AddLine("Prerequisites:", 1, 1, 1, true)

            -- Criteria requirements if avaliable
            if databaseCriteriaData ~= nil then
                -- Quest requirement
                if databaseCriteriaData.q ~= nil then
                    print(databaseCriteriaData.q)
                    QuestEventListener:AddCallback(databaseCriteriaData.q, function()
                        local name = C_QuestLog.GetTitleForQuestID(databaseCriteriaData.q)
                        GameTooltip:AddLine("Quest: " .. name, 0, 1, 0, true)
                    end)

                end

                -- Coordinates if avaliable
                if databaseCriteriaData.x ~= nil then
                    GameTooltip:AddLine(" ", 1, 1, 1, true)
                    GameTooltip:AddLine("Coordinates:", 1, 1, 1, true)
                    GameTooltip:AddLine(databaseCriteriaData.x .. ", " .. databaseCriteriaData.y, 1, 1, 1, true)
                end

                -- Zone if avaliable
                if databaseCriteriaData.m ~= nil then
                    local info = C_Map.GetMapInfo(databaseCriteriaData.m)
                    GameTooltip:AddLine(" ", 1, 1, 1, true)
                    GameTooltip:AddLine("Zone:", 1, 1, 1, true)
                    GameTooltip:AddLine(info.name, 1, 1, 1, true)
                end
            end

            --GameTooltip:AddLine(linkData, 1, 0.82, 0)

            local elementData = button:GetElementData()

            print(criteriaID)
            button:UpdateTacticsContent("", criteriaID)

            GameTooltip:Show()
        end)

        button.Criteria:SetScript("OnHyperlinkLeave", function()
            GameTooltip:Hide()
        end)

        -- Reset tactics and criteria text when reusing the button
        -- button.Tactics:SetText("")
        button.Criteria:SetText("")

        --Show the achievement for the
        --button.Description:SetText("You have everything you need to complete this achievement! Click to view instructions")

        button.Criteria:SetTextColor("p", 1, 1, 1)

        button.Label:SetText(data.name)
        button.Criteria:Show()
    end

    ScrollView2:SetElementExtentCalculator(function(dataIndex, elementData)
        if SelectionBehaviorMixin.IsElementDataIntrusiveSelected(elementData) then
            local totalHeight = INFOFRAMEBUTTON_COLLAPSEDHEIGHT
            totalHeight = totalHeight + elementData.currentHeight

            return totalHeight
        else
            return INFOFRAMEBUTTON_COLLAPSEDHEIGHT
        end
    end)

    ScrollView2:SetElementInitializer("IATInfoFrameTemplate", InfoFrameInitializer)
    ScrollView2:SetDataProvider(core.Config.InfoFrameDataProvider)
    ScrollUtil.InitScrollBoxListWithScrollBar(self.UI.ScrollContainer.ScrollBox, self.UI.ScrollContainer.ScrollBar, ScrollView2)

    core.Config.InfoFrameSelectionBehavior = ScrollUtil.AddSelectionBehavior(self.UI.ScrollContainer.ScrollBox, SelectionBehaviorFlags.Deselectable, SelectionBehaviorFlags.Intrusive)
    core.Config.InfoFrameSelectionBehavior:RegisterCallback(SelectionBehaviorMixin.Event.OnSelectionChanged, function(o, elementData, selected)
        local button = self.UI.ScrollContainer.ScrollBox:FindFrame(elementData)
        if button then
            button:SetSelected(selected);
        end
    end, self)

    ScrollUtil.AddResizableChildrenBehavior(self.UI.ScrollContainer.ScrollBox);

    -- List of tabs
    self.tabDataProvider = {
        [1] = {name = "Tracked"},
        [2] = {name = "Current Zone"},
    }

    -- Create the tabs
    -- local tabs = {}
    -- for index, tabData in ipairs(self.tabDataProvider) do
    --     local tab = CreateFrame("Button", "IAT_InfoFrameV2_Tab"..index, self.UI, "CharacterFrameTabButtonTemplate")
    --     tab:SetID(index)
    --     tab:SetText(tabData.name)
    --     tab:SetPoint("TOPLEFT", self.UI, "BOTTOMLEFT", (index - 1) * 80, 7)

    --     tab:SetScript("OnClick", function(self)
    --         core.InfoFramev2:SwitchTab(self:GetID())
    --     end)

    --     tabs[index] = tab
    -- end

    self.UI:Show()
end