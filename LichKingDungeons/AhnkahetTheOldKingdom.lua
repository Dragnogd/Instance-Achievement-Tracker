--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Ahn'kahet the Old Kingdom Bosses
------------------------------------------------------
core._619 = {}

------------------------------------------------------
---- Herald Volazj
------------------------------------------------------
local timerStarted = false
local timer

function core._619:ElderNadox()
    if core.type == "UNIT_DIED" and core.destID == "30176" then
        core:getAchievementFailed()
    end
end

function core._619:JedogaShadowseeker()
    core:getAchievementToTrack()

    if core.type == "UNIT_DIED" and core.destID == "30385" then
        core:getAchievementFailed()
    end
end

function core._619:HeraldVolazj()
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(121, function() 
            core:getAchievementFailed()
        end)
    end
end

function core._619:ClearVariables()
    ------------------------------------------------------
    ---- Herald Volazj
    ------------------------------------------------------
    timerStarted = false
    if timer ~= nil then
        timer:Cancel()
    end
end