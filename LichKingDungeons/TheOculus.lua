--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Oculus Bosses
------------------------------------------------------
core.TheOculus = {}

------------------------------------------------------
---- Make it Count
------------------------------------------------------
local timer
local timerStarted = false

function core.TheOculus:TrackAdditional()
    if core.type == "UNIT_DIED" and core.destID == "27654" then
        core:sendMessage(core:getAchievement() .. " 20 Minutes to kill Ley-Guardian Eregos")
        if timerStarted == false then
            timerStarted = true
        end
    end
end

function core.TheOculus:ClearVariables()
end