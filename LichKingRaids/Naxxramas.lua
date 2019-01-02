--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _533 Bosses
------------------------------------------------------
core._533 = {}

------------------------------------------------------
---- Patchwerk
------------------------------------------------------
local timerStarted = false
local timer

------------------------------------------------------
---- Arachnophobia
------------------------------------------------------
local timer2Started = false
local timer2

------------------------------------------------------
---- Kel'Thuzad
------------------------------------------------------
local abominationsKilled = 0

function core._533:HeiganTheUnclean()
    if core.type == "UNIT_DIED" and core.currentUnit == "Player" then
        core:getAchievementFailed()
    end
end

function core._533:Loatheb()
    if core.type == "UNIT_DIED" and core.destID == "16286" then
        core:getAchievementFailed()
    end
end

function core._533:Patchwerk()
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(180, function() 
            core:getAchievementFailed()
        end)
    end  
end

function core._533:Arachnophobia()
    if core.type == "UNIT_DIED" and core.destID == "15956" then
        if timerStarted2 == false then
            timerStarted2 = true
            core:sendMessage(GetAchievementLink(1858) .. " 20 Minutes remaining to kill boss")
            timer2 = C_Timer.NewTimer(1200, function()
                if core.difficultyID == 3 then
                    core:sendMessage(GetAchievementLink(1858) .. " FAILED!")               
                elseif core.difficultyID == 4 then
                    core:sendMessage(GetAchievementLink(1859) .. " FAILED!")   
                end 
            end)
        end 
    end

    if core.type == "UNIT_DIED" and core.destID == "15952" then
        if timer2 ~= nil then
            --print("Timer Cancelled")
            timer2:Cancel()
        end
    end
end

function core._533:GrandWidowFaerlina()
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "15953" and core.spellId == 28732 then
        core:getAchievementFailed()
    end
end

function core._533:Subtraction()
    if core.difficultyID == 3 then
        --10 Man
        if core.groupSize < 9 then
            core:getAchievementSuccess()
        else
            core:getAchievementFailed()
        end
    elseif core.difficultyID == 4 then
        --25 Man
        if core.groupSize < 21 then
            core:getAchievementSuccess()
        else
            core:getAchievementFailed()
        end
    end
end

function core._533:Shocking()
    if core.spellId == 28085 or core.spellId == 28059 then
        core:getAchievementFailed(2)
    end
end

function core._533:FourHorsemen()
    if core.type == "UNIT_DIED" and (core.destID == "16063" or core.destID == "16064" or core.destID == "16065" or core.destID == "30549") then
        if timerStarted == false then
            timerStarted = true
            timer = C_Timer.NewTimer(15, function() 
                core:getAchievementFailed()
            end)
        end  
    end
end

function core._533:KelThuzad()
    if core.type == "UNIT_DIED" and (core.destID == "23562" or core.destID == "16428") and abominationsKilled < 18 then
        abominationsKilled = abominationsKilled + 1
        core:sendMessageDelay("Unstoppable Abomination Killed (" .. abominationsKilled .. "/18)", abominationsKilled, 3)
    end

    if abominationsKilled >= 18 then
        core:getAchievementSuccess()
    end
end

function core._533:ClearVariables()
    ------------------------------------------------------
    ---- Patchwerk
    ------------------------------------------------------
    if timer ~= nil then
        --print("Timer Cancelled")
        timer:Cancel()
    end

    ------------------------------------------------------
    ---- Kel'Thuzad
    ------------------------------------------------------
    abominationsKilled = 0
end