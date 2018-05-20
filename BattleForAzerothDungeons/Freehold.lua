--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Freehold Bosses
------------------------------------------------------
core.Freehold = {}

function core.Freehold:SkycapnKragg()
    if core.type == "UNIT_DIED" and core.destID == "138314" then
        core:getAchievementSuccess()
    end
end