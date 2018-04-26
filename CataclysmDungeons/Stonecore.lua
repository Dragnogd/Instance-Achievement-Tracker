--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Stonecore Bosses
------------------------------------------------------
core.TheStonecore = {}

------------------------------------------------------
---- High Priestess Azil
------------------------------------------------------
local mobLimitReached = false
local devoutFollowersKilled = 0
local timerStarted = false

function core.TheStonecore:HighPriestessAzil()
    core:trackMob("42428", "Devout Follower", 60, "Kill the Devout Followers Now", 10, nil, nil)

    if core.mobCounter >= 60 then
        mobLimitReached = true
    end

    if core.overkill ~= nil then
        if core.overkill > 0 and core.destID == "42428" and core.sourceName ~= nil then
            devoutFollowersKilled = devoutFollowersKilled + 1
            print("Devout Follower Killed")
            if mobLimitReached == true and timerStarted == false then
                timerStarted = true
                core:sendMessage(core:getAchievement() .. " Timer Started! 10 seconds remaining!")
                C_Timer.After(10, function() 
                    if devoutFollowersKilled >= 60 then
                        core:getAchievementSuccess()
                    else
                        core:sendMessage(core:getAchievement() .. " FAILED! (" .. devoutFollowersKilled .. "/60) Devout Followers killed in time")
                        mobLimitReached = false
                        devoutFollowersKilled = 0
                        timerStarted = false
                    end
                end)
            elseif mobLimitReached == true and timerStarted == true then
                if devoutFollowersKilled >= 60 then
                    core:getAchievementSuccess()
                end
            end
        end
    end
end

function core.TheStonecore:ClearVariables()
end