--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Black Rook Hold Bosses
------------------------------------------------------
core._1501 = {}

function core._1501:AmalgamOfSouls()
    if core.type == "UNIT_DIED" and core.destName == "Frustrated Soul" then
        core:getAchievementSuccess()
    end
end

function core._1501:IllysannaRavencrest()
    if core.type == "UNIT_DIED" and core.destID == "100485" then
        core:getAchievementFailed()
    end
end

function core._1501:ClearVariables()
end