--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Stonecore Bosses
------------------------------------------------------
core._725 = {}

------------------------------------------------------
---- High Priestess Azil
------------------------------------------------------
local mobLimitReached = false
local devoutFollowersKilled = 0
local timerStarted = false

function core._725:HighPriestessAzil()
    core:trackMob("42428", "Devout Follower", 60, "Kill the Devout Followers Now", 10, nil, nil)

    if core.mobCounter >= 10 then
        mobLimitReached = true
    end

    if core.type == "PARTY_KILL" and core.spellId ~= 79021 and core.spellId ~= 79249 then
        devoutFollowersKilled = devoutFollowersKilled + 1
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

function core._725:ClearVariables()
    ------------------------------------------------------
    ---- High Priestess Azil
    ------------------------------------------------------
    mobLimitReached = false
    devoutFollowersKilled = 0
    timerStarted = false
end