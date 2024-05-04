--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Culling of Stratholme Bosses
------------------------------------------------------
core._595 = {}

------------------------------------------------------
---- Zombiefest
------------------------------------------------------
local timerStarted = false
local zombieKilled = 0
local zombieCounterReached = false
local achievementCompleted = false

function core._595:ZombieFest()
    core:trackMob("27737", "Risen Zombie", 100, " 100 Risen Zombies Spawned!", 10, nil, nil)

    if core.mobCounter >= 100 then
        zombieCounterReached = true
    end

    if core.type == "UNIT_DIED" and core.destID == "27737" and zombieCounterReached == true then
        zombieKilled = zombieKilled + 1
        if timerStarted == false then
            core:sendMessage(GetAchievementLink(1872) .. " Timer Started! 60 seconds to kill Risen Zombies")
            timerStarted = true
            C_Timer.After(60, function()  
                if zombieKilled >= 100 then
                    if achievementCompleted == false then
                        core:sendMessage(GetAchievementLink(1872) .. " Criteria Met!")
                        achievementCompleted = true
                    end
                else
                    if achievementCompleted == false then
                        core:sendMessage(GetAchievementLink(1872) .. " (" .. zombieKilled .. "/100) Risen Zombies killed in time")
                        zombieKilled = 0
                        zombieCounterReached = false
                        achievementCompleted = false
                    end
                end
            end)
        else
            if zombieKilled >= 100 and achievementCompleted == false then
                core:sendMessage(GetAchievementLink(1872) .. " Criteria Met!")
                achievementCompleted = true
            end
        end
    end
end

function core._595:ClearVariables()
    ------------------------------------------------------
    ---- Zombiefest
    ------------------------------------------------------
    timerStarted = false
    zombieKilled = 0
    zombieCounterReached = false
end