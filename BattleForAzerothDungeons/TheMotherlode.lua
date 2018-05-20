--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Motherlode Bosses
------------------------------------------------------
core.TheMotherlode = {}

function core.TheMotherlode:CoinOperatedCrowdPummeler()
    if core.type == "UNIT_DIED" and core.destID == "142625" then
        core:getAchievementSuccess()
    end
end