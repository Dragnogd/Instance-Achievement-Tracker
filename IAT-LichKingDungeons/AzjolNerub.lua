--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Azjol-Nerub Bosses
------------------------------------------------------
core._601 = {}

------------------------------------------------------
---- Watch Him Die
------------------------------------------------------
local achievementFailed = false

------------------------------------------------------
---- Anub'arak
------------------------------------------------------
local timerStarted = false
local timer

function core._601:TrackAdditional()
    --Watch Him Die
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
        if core.type == "UNIT_DIED" and (core.destID == "28729" or core.destID == "28730" or core.destID == "28731") and achievementFailed == false then
            achievementFailed = true
            core:sendMessage(GetAchievementLink(1296) .. " FAILED!")
        end
    end
end

function core._601:Anubarak()
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(241, function() 
            core:getAchievementFailed()
        end)
    end
end

function core._601:ClearVariables()
    ------------------------------------------------------
    ---- Anub'arak
    ------------------------------------------------------
    timerStarted = false
    if timer ~= nil then
        timer:Cancel()
    end
end