--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

core.Tracker = {}

function core.Tracker:CheckCriteriaRequirements(achievementID, criteriaID)
    local exists = core.db.a[achievementID]
    and core.db.a[achievementID].cr
    and core.db.a[achievementID].cr[criteriaID] ~= nil

    if exists then
        local critieraData = core.db.a[achievementID].cr[criteriaID]
        local requiremntsMet = true

        -- Check for quest requirement
        if critieraData.q then
            print("Checking quest requirement for questID:", critieraData.q)
            local questCompleted = core.Tracker:CheckQuestCompleted(critieraData.q)

            if not questCompleted then
                requiremntsMet = false
            end
        end

        -- Check

        return requiremntsMet
    else
        return nil
    end
end

-- Check if a quest is completed for the current character
function core.Tracker:CheckQuestCompleted(questID)
    local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(questID)

    if isCompleted then
        print("Quest", questID, "is completed.")
    end

    return isCompleted
end

-- Check if a world quest is currently active
function core.Tracker:CheckWorldQuestActive(questID)
    local activeQuests = C_TaskQuest.GetActiveQuests()
    for _, questInfo in ipairs(activeQuests) do
        if questInfo.questId == questID then
            print("World Quest", questID, "is active.")
            return true
        end
    end
    return false
end