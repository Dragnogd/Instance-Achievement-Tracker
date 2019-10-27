--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Greenstone Village
------------------------------------------------------
core._1024 = {}
local achievement1Failed = false
local achievement2Failed = false

function core._1024:TrackAdditional()
    --Return six stolen kegs without any being damaged in the Greenstone Village scenario.
    if (core.type == "SWING_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "UNIT_DIED") and core.destID == "62682" then
        if achievement1Failed == false then
            core:sendMessage(GetAchievementLink(7267) .. " " .. L["Core_Failed"],true,"failed")
            achievement1Failed = true
        end
    end

    --Complete the Greenstone Village scenario without using any Volatile Greenstone Brew.
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 119090 then
        if achievement2Failed == false then
            core:sendMessage(GetAchievementLink(7266) .. " " .. L["Core_Failed"] .. " (" .. core.sourceName .. ")",true,"failed")
            achievement2Failed = true
        end
    end
end

function core._1024:InstanceCleanup()
    achievement1Failed = false
    achievement2Failed = false
end