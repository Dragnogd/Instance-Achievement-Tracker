--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle of Dazar'alor Bosses
------------------------------------------------------
core._2070 = {}

function core._2070:KingRastakhan()
    --Defeat King Rastakhan with the Phantom of Retribution, Phantom of Rage and Phantom of Slaughter still alive on Normal difficulty or higher.

    --Phantom of Retribution Died
    if core.type == "UNIT_DIED" and core.destID == "146491" then
        core:getAchievementFailed()
    end

    --Phantom of Rage
    if core.type == "UNIT_DIED" and core.destID == "146492" then
        core:getAchievementFailed()
    end

    --Phantom of Slaughter
    if core.type == "UNIT_DIED" and core.destID == "146493" then
        core:getAchievementFailed()
    end
end

