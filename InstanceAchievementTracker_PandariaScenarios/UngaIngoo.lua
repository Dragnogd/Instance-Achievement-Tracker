--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Unga Ingoo
------------------------------------------------------
core._1048 = {}
local spillNoEvilFailed = false

function core._1048:CaptainOok()
    if core.type == "SPELL_HEAL" and core.spellId == 121973 then
        core:getAchievementFailed()
    end
end

function core._1048:TrackAdditional()
    --Brew the Boomer Brew without anyone in your party being hit by lightning during A Brewing Storm.
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 123137 and spillNoEvilFailed == false then 
        core:sendMessage(GetAchievementLink(7231) .. " " .. L["Core_Failed"],true,"failed")
        spillNoEvilFailed = true
    end
end

function core._1048:InstanceCleanup()
    spillNoEvilFailed = false
end


