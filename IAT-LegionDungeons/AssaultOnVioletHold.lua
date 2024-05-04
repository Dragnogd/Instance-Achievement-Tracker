--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Assault on Violet Hold Bosses
------------------------------------------------------
core._1544 = {}

function core._1544:Festerface()
    if core.type == "UNIT_DIED" and core.destID == "102169" then
        core:getAchievementSuccess()
    end
end

function core._1544:ClearVariables()
end