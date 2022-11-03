--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Drak'Tharon Keep Bosses
------------------------------------------------------
core._600 = {}

------------------------------------------------------
---- King Dred
------------------------------------------------------
local drakkariKilled = 0

function core._600:Trollgore()
    --Defeat Trollgore in Drak'Tharon Keep on Heroic Difficulty before Consume reaches ten stacks.

    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount >= 10 and core.spellId == 59805 then
        core:getAchievementFailed()
    end
end

function core._600:NovosTheSummoner()
    --Defeat Novos the Summoner in Drak'Tharon Keep on Heroic Difficulty without allowing any undead minions to reach the floor.

    if core:getBlizzardTrackingStatus(2057) == false then
        core:getAchievementFailed()
    end
end

function core._600:KingDred()
    --Engage King Dred in Drak'Tharon Keep on Heroic Difficulty and slay 6 Drakkari Gutrippers or Drakkari Scytheclaw during his defeat.

    if core.type == "UNIT_DIED" and (core.destID == "26641" or core.destID == "26628") and drakkariKilled < 6 then
        drakkariKilled = drakkariKilled + 1
        if core.gameVersionMajor == 3 then
            core:sendMessage(core:getAchievement() .. " " .. getNPCNameClassic(26641) .. "/" .. getNPCNameClassic(26628) .. " " .. L["Shared_Killed"] .. " (" .. drakkariKilled .. "/6)",true)
        else
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(26641) .. "/" .. getNPCName(26628) .. " " .. L["Shared_Killed"] .. " (" .. drakkariKilled .. "/6)",true)
        end
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