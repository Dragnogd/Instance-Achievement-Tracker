--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Eye of Eternity Bosses
------------------------------------------------------
core.TheEyeOfEternity = {}

------------------------------------------------------
---- You Don't Have an Eternity
------------------------------------------------------
local timer
local timerStarted = false

function core.TheEyeOfEternity:YouDontHaveAnEternity()
    timer = C_Timer.NewTimer(360, function()
        core:getAchievementFailed()
    end) 
end

function core.TheEyeOfEternity:ClearVariables()
    ------------------------------------------------------
    ---- You Don't Have an Eternity
    ------------------------------------------------------
    timerStarted = false
    if timer ~= nil then
        timer:Cancel()
    end
end