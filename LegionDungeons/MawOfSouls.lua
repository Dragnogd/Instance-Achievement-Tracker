--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Maw of Souls Bosses
------------------------------------------------------
core.MawOfSouls = {}

------------------------------------------------------
---- Ymiron
------------------------------------------------------
local risenWarriorsKilled = 0

function core.MawOfSouls:Ymiron()
    if core.type == "UNIT_DIED" and core.destID == "98246" and core.destFlags == 0xa48 then
        risenWarriorsKilled = risenWarriorsKilled + 1
        core:sendMessage(core:getAchievement() .. " Risen Warriors Killed (" .. risenWarriorsKilled .. "/6)")
    end

    if risenWarriorsKilled >= 6 then
        core:getAchievementSuccess()
    end
end

function core.MawOfSouls:ClearVariables()
    ------------------------------------------------------
    ---- Ymiron
    ------------------------------------------------------
    risenWarriorsKilled = 0
end