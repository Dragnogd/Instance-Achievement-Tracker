--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Atal'Dazar Bosses
------------------------------------------------------
core.AtalDazar = {}

function core.AtalDazar:PriestessAlunza()
    if core.type == "UNIT_DIED" and core.destID == "131140" then
        core:getAchievementSuccess()
    end
end