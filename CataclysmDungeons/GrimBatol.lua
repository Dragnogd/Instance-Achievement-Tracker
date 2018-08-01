--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Grim Batol Bosses
------------------------------------------------------
core._670 = {}

function core._670:GeneralUmbriss()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 90170 and core.destID == "39625" then
        core.achievementsFailed[1] = false
        core:getAchievementSuccessWithMessageAfter("(20 seconds remaining)")
    elseif core.type == "SPELL_AURA_REMOVED" and core.spellId == 90170 and core.destID == "39625" then
        core.achievementsCompleted[1] = false
        core:getAchievementFailedWithMessageAfter("Achievement can still be completed by waiting for another Malignant Trogg")
    end
end

function core._670:Erudax()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 75520 then
        core:getAchievementFailed()
    end
end

function core._670:ClearVariables()
end