--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Atal'Dazar Bosses
------------------------------------------------------
core._1763 = {}

function core._1763:PriestessAlunza()
    if core.type == "UNIT_DIED" and core.destID == "131140" then
        core:getAchievementSuccess()
    end
end