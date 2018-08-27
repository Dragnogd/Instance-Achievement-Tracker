--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Atal'Dazar Bosses
------------------------------------------------------
core._1763 = {}

------------------------------------------------------
---- Bringing Hexy Back
------------------------------------------------------
local playerHexed = false

function core._1763:PriestessAlunza()
    if core.destID == "131009" and (core.type == "SPELL_AURA_APPLIED_DOSE" or core.type == "SPELL_AURA_APPLIED") and core.spellId == 255558 then
        core:sendDebugMessage("Spirit of Gold " .. core.amount)
    end

    --Spirit of gold has 8 stacks of Tainted Blood
    if core.destID == "131009" and core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 255558 and core.amount == 8 then
        core:sendMessage(core:getAchievement() .. " Kill the Spirit of Gold NOW!")
    end

    --Achievment Complete
    if core.type == "UNIT_DIED" and core.destID == "131140" then
        core:getAchievementSuccess()
    end
end

function core._1763:BringingHexyBack()
    --1 Player in group must be hexed at each boss on kill.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 252781 then
        core:sendDebugMessage(core.destName .. " Hexed")
    end

    --Check if boss is less than 50% health to give people a chance to cc adds / reduce spam
    if core:getHealthPercent("boss1") <= 50 then
         --If player is hexed, complete the achievement.
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 252781 then
            if playerHexed == false then
                playerHexed = true
                core.achievementsFailed[1] = false
                core:getAchievementSuccess()
            end
        end

        --If player hex is removed, wait 1 second. If no one else is hexed fail achievement
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 252781 then
            playerHexed = false
            C_Timer.After(1000, function()
                if playerHexed == false then
                    core.achievementsCompleted[1] = false
                    core:getAchievementFailedWithMessageAfter("Atleast one players needs to be hexed on boss kill!")
                end
            end)
        end
    end
end

function core._1763:ClearVariables()
    ------------------------------------------------------
    ---- Bringing Hexy Back
    ------------------------------------------------------
    playerHexed = false
end