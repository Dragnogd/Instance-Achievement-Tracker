--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Freehold Bosses
------------------------------------------------------
core._1754 = {}

function core._1754:SkycapnKragg()
    if core.type == "UNIT_DIED" and core.destID == "138314" then
        core:getAchievementSuccess()
    end
end