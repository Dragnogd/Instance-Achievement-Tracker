--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Bloodmaul Slag Mines Bosses
------------------------------------------------------
core._1175 = {}

function core._1175:Magmolatus()
    if core.type == "UNIT_DIED" and core.destID == "74571" then
        core:getAchievementFailedWithMessageAfter("(Reason: Calamity has died)")
    elseif core.type == "UNIT_DIED" and core.destID == "74570" then
        core:getAchievementFailedWithMessageAfter("(Reason: Ruination has died)")
    end
end

function core._1175:Gugrokk()
    if core.type == "UNIT_DIED" and core.destID == "74927" then
        core:getAchievementFailed()
    end
end

function core._1175:ClearVariables()
end