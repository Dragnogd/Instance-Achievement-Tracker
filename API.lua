local _, core = ...

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
        print(lastAchievementID, lastExpansion, lastInstanceType, lastInstance)

        --Select correct tab for instance
        for tabIndex, tabData in ipairs(core.Config.tabDataProvider) do
            if lastExpansion == tabData.ExpansionID then
                PanelTemplates_SetTab(core.Config.UI, tabIndex)
                core.Config:ShowInstancesForTab(tabIndex)
            end
        end

        --Select instance tied to achievement
        local function FindInstance(item)
            return item.id == lastInstance
        end
        local foundItem = core.Config.InstanceListDataProvider:FindElementDataByPredicate(FindInstance)

        if foundItem ~= nil then
            core.Config:ToggleOn()

            core.Config:ShowContentForInstance(foundItem)

            local function FindBoss(item)
                return item.boss.achievement == lastAchievementID
            end

            --Scroll to the selected element
            core.Config.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:ScrollToElementDataByPredicate(FindBoss, ScrollBoxConstants.AlignCenter, nil, ScrollBoxConstants.NoScrollInterpolation);

            local elementData = core.Config.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:FindElementDataByPredicate(FindBoss);

            if elementData ~= nil then
                local button = core.Config.UI.ExpansionLayoutContainer.BossListScrollContainer.ScrollBox:FindFrame(elementData)
                if button then
                    core.Config.g_achievementSelectionBehavior:ToggleSelect(button);
                end
            end
        end
	end

    return nil
end