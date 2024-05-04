--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Oculus Bosses
------------------------------------------------------
core._578 = {}

------------------------------------------------------
---- Make it Count
------------------------------------------------------
local timer
local timerStarted = false

function core._578:TrackAdditional()
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        if core.type == "UNIT_DIED" and core.destID == "27654" then
            core:sendMessage(core:getAchievement() .. " 20 Minutes to kill Ley-Guardian Eregos")
            if timerStarted == false then
                timerStarted = true
                timer = C_Timer.NewTimer(1200, function()
                    core:sendMessage(GetAchievementLink(1868) ..  " FAILED!")
                end) 
            end
        end
    
        if core.type == "UNIT_DIED" and core.destID == "27656" then
            if timer ~= nil then
                timer:Cancel()
            end
        end   
    end
end

function core._578:ClearVariables()
end