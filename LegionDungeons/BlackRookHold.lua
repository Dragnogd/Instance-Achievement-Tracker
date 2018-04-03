--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Black Rook Hold Bosses
------------------------------------------------------
core.BlackRookHold = {}

function core.BlackRookHold:AmalgamOfSouls()
    if core.type == "UNIT_DIED" and core.destID == "99664" then
        core:getAchievementSuccess()
    end
end

function core.BlackRookHold:IllysannaRavencrest()
    if core.type == "UNIT_DIED" and core.destID == "100485" then
        core:getAchievementFailed()
    end
end

function core.BlackRookHold:ClearVariables()
end