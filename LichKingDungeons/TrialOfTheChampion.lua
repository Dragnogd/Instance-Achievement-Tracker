--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Trial of the Champion Bosses
------------------------------------------------------
core.TrialOfTheChampion = {}

function core.TrialOfTheChampion:TheBlackKnight()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 67729 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core.TrialOfTheChampion:ClearVariables()
end