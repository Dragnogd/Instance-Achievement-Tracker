--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle on the High Seas
------------------------------------------------------
core._1099 = {}
local achievementFailed = false

function core._1099:TrackAdditional()
    --Brew the Boomer Brew without anyone in your party being hit by lightning during A Brewing Storm.
    if core.type == "SPELL_DAMAGE" and core.spellId == 132938 and achievementFailed == false and UnitIsPlayer(core.destName) then 
        core:sendMessage(GetAchievementLink(8347) .. " " .. L["Core_Failed"],true,"failed")
        achievementFailed = true
    end
end

function core._1099:InstanceCleanup()
    achievementFailed = false
end