--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Crypt of Forgotten Kings
------------------------------------------------------
core._1030 = {}

function core._1030:AbominationOfAnger1()
    --Defeat the Abomination of Anger in the Crypt of Forgotten Kings scenario without anyone taking damage from the red clouds.
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" and core.spellId == 12074) and UnitIsPlayer(core.destName) then    
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", 2)
    end
end

function core._1030:AbominationOfAnger2()
    --Defeat the Abomination of Anger in the Crypt of Forgotten Kings scenario with 20 stacks of Uncontrolled Anger.
    for i=1,40 do
        local _, _, count, _, _, _, _, _, _, spellId = UnitDebuff("Player", i)
        if spellId == 129025 then
            if count == 20 then
                core:getAchievementSuccess()
                core.achievementsFailed[1] = false
            end
        end
    end

    --Debuff has fallen off during kill
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 129025 and core.achievementsCompleted[1] == true then
        core:getAchievementFailed()
        core.achievementsCompleted[1] = false
    end
end