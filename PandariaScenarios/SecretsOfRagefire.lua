--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Secrets of Ragefire
------------------------------------------------------
core._1131 = {}
local achievementFailed = false

function core._1131:TrackAdditional()
    if (core.type == "SPELL_DAMAGE" or core.type == "SWING_DAMAGE") and (core.destID == "70605" or core.destID == "70606" or core.destID == "70607" or core.destID == "70608" or core.destID == "70609") then
        if achievementFailed == false then
            core:sendMessage(GetAchievementLink(8295) .. " " .. L["Core_Failed"],true,"failed")
            achievementFailed = true
        end
    end
end

function core._1131:InstanceCleanup()
    achievementFailed = false
end