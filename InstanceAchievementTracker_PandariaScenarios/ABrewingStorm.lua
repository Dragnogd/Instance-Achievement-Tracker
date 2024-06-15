--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- A Brewing Storm
------------------------------------------------------
core._1005 = {}
local achievement1Failed = false
local achievement2Failed = false

function core._1005:BorokhulaTheDestroyer()
    --Defeat Borokhula the Destroyer in A Brewing Storm without getting hit by his Swamp Smash.
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 115013 and UnitIsPlayer(core.destName) then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._1005:TrackAdditional()
    --Brew the Boomer Brew without anyone in your party being hit by lightning during A Brewing Storm.
    if core:getBlizzardTrackingStatus(7261) == false then
        if achievement1Failed == false then
            core:sendMessage(GetAchievementLink(7261) .. " " .. L["Core_Failed"],true,"failed")
            achievement1Failed = true
        end
    end

    --Finish A Brewing Storm with all six Thunderpaw Guardians still alive.
    if core:getBlizzardTrackingStatus(7258) == false then
        if achievement2Failed == false then
            core:sendMessage(GetAchievementLink(7258) .. " " .. L["Core_Failed"],true,"failed")
            achievement2Failed = true
        end
    end
end

function core._1005:InstanceCleanup()
    achievement1Failed = false
    achievement2Failed = false
end