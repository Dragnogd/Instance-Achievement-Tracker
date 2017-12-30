--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Bloodmaul Slag Mines Bosses
------------------------------------------------------
core.BloodmaulSlagMines = {}

function core.BloodmaulSlagMines:Magmolatus()
    if core.type == "UNIT_DIED" and core.destID == "74571" then
        core:getAchievementFailedWithMessageAfter("(Reason: Calamity has died)")
    elseif core.type == "UNIT_DIED" and core.destID == "74570" then
        core:getAchievementFailedWithMessageAfter("(Reason: Ruination has died)")
    end
end

function core.BloodmaulSlagMines:Gugrokk()
    if core.type == "UNIT_DIED" and core.destID == "74927" then
        core:getAchievementFailed()
    end
end

function core.BloodmaulSlagMines:ClearVariables()

end