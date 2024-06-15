--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Utgarde Keep Bosses
------------------------------------------------------
core._574 = {}

function core._574:PrinceKeleseth()
    --If a player has killed the frost tomb
    if core.destID == "23965" and core.overkill ~= nil then
        if core.overkill > 0 then
            core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ")")
        end
    end

    --If frost tomb debuff kills the player
    if core.type == "SPELL_PERIODIC_DAMAGE" and core.spellID == "48400" and core.overkill ~= nil then
        if core.overkill > 0 then
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
        end
    end
end

function core._574:ClearVariables()
end