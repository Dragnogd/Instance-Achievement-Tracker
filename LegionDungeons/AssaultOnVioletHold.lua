--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Assault on Violet Hold Bosses
------------------------------------------------------
core.AssaultOnVioletHold = {}

function core.AssaultOnVioletHold:Festerface()
    if core.type == "UNIT_DIED" and core.destID == "102169" then
        core:getAchievementSuccess()
    end
end

function core.AssaultOnVioletHold:ClearVariables()
end