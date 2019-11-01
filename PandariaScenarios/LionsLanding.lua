--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Lion's Landing (Alliance)
------------------------------------------------------
core._1103 = {}
local numberFiveIsAliveFailed = false

function core._1103:TrackAdditional()
    --Brew the Boomer Brew without anyone in your party being hit by lightning during A Brewing Storm.
    if core.type == "UNIT_DIED" and (core.destID == "68581" or core.destID == "68685" or core.destID == "68871" or core.destID == "68883" or core.destID == "68870") and numberFiveIsAliveFailed == false then 
        core:sendMessage(GetAchievementLink(8011) .. " " .. L["Core_Failed"],true,"failed")
        numberFiveIsAliveFailed = true
    end
end

function core._1103:InstanceCleanup()
    numberFiveIsAliveFailed = false
end