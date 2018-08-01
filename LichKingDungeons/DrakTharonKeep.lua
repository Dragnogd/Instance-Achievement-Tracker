--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Drak'Tharon Keep Bosses
------------------------------------------------------
core._600 = {}

------------------------------------------------------
---- King Dred
------------------------------------------------------
local drakkariKilled = 0

function core._600:Trollgore()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount >= 10 then
        core:getAchievementFailed()
    end
end

function core._600:KingDred()
    if core.type == "UNIT_DIED" and (core.destID == "26641" or core.destID == "26628") and drakkariKilled < 6 then
        drakkariKilled = drakkariKilled + 1
        core:sendMessage(core:getAchievement() .. " Drakkari Gutrippers/Scytheclaw Killed (" .. drakkariKilled .. "/6)")
    end

    if drakkariKilled >= 6 then
        core:getAchievementSuccess()
    end
end

function core._600:ClearVariables()
    ------------------------------------------------------
    ---- King Dred
    ------------------------------------------------------
    drakkariKilled = 0
end