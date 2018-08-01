--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Nexus Bosses
------------------------------------------------------
core._576 = {}

------------------------------------------------------
---- Grand Magus Telestra
------------------------------------------------------
local mob1Killed = false
local mob2Killed = false
local mob3Killed = false
local imageCounter = 0
local timerStarted = false

function core._576:GrandMagusTelestra()
    if core.overkill ~= nil then
        if core.overkill > 0 then
            if core.destID == "26928" and mob1Killed == false then
                --print("Mob 1 Killed")
                mob1Killed = true
                imageCounter = imageCounter + 1
            elseif core.destID == "26929" and mob2Killed == false then
                --print("Mob 2 Killed")
                mob2Killed = true
                imageCounter = imageCounter + 1
            elseif core.destID == "26930" and mob3Killed == false then
                --print("Mob 3 Killed")
                mob3Killed = true
                imageCounter = imageCounter + 1
            end

            if imageCounter >= 1 and timerStarted == false then
                timerStarted = true
                C_Timer.After(5, function() 
                    if imageCounter == 3 then
                        core:getAchievementSuccess()
                    else
                        core:sendMessage(core:getAchievement() .. " (" .. imageCounter .. "/3) Images killed in time")
                        timerStarted = false
                        imageCounter = 0
                        C_Timer.After(5, function ()
                            mob1Killed = false
                            mob2Killed = false
                            mob3Killed = false
                        end)
                    end
                end)
            end
        end
    end
end

function core._576:Anomalus()
    if core.type == "UNIT_DIED" and core.destID == "26918" then
        core:getAchievementFailed()
    end
end

function core._576:Keristrasza()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount > 2 then
        core:getAchievementFailedPersonal()    
    end
end

function core._576:ClearVariables()
    ------------------------------------------------------
    ---- Grand Magus Telestra
    ------------------------------------------------------
    mob1Killed = false
    mob2Killed = false
    mob3Killed = false
    imageCounter = 0
    timerStarted = false
end