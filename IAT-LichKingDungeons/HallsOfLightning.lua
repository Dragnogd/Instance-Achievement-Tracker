--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Halls of Lightning Bosses
------------------------------------------------------
core._602 = {}

------------------------------------------------------
---- Volkhan
------------------------------------------------------
local brittleGolemsShattered = 0

------------------------------------------------------
---- Loken
------------------------------------------------------
local timer
local timerStarted = false

function core._602:GeneralBjarngrim()
    if core.type == "SPELL_AURA_REFRESH" and core.spellId == 52097 then
        core:getAchievementSuccess()
    end
end

function core._602:Volkhan()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 59527 then
        brittleGolemsShattered = brittleGolemsShattered + 1
    end

    if brittleGolemsShattered >= 4 then
        core:getAchievementFailed()
    end
end

function core._602:Loken()
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(121, function() 
            core:getAchievementFailed()
        end)
    end
end

function core._602:ClearVariables()
    ------------------------------------------------------
    ---- Volkhan
    ------------------------------------------------------
    brittleGolemsShattered = 0

    ------------------------------------------------------
    ---- Loken
    ------------------------------------------------------
    timerStarted = false
    if timer ~= nil then
        timer:Cancel()
    end
end