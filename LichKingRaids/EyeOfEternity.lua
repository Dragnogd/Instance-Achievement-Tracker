--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Eye of Eternity Bosses
------------------------------------------------------
core._616 = {}

------------------------------------------------------
---- You Don't Have an Eternity
------------------------------------------------------
local timer
local timerStarted = false

function core._616:YouDontHaveAnEternity()
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(360, function()
            core:getAchievementFailed(2)
        end) 
    end
end

function core._616:APokeInTheEye()
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

function core._616:DenyinTheScion()
    if core.type == "PARTY_KILL" and core.destID == "30249" and UnitControllingVehicle(core.sourceName) == true then
        core:getAchievementSuccessPersonal(3,"source")
    end
end

function core._616:ClearVariables()
    ------------------------------------------------------
    ---- You Don't Have an Eternity
    ------------------------------------------------------
    timerStarted = false
    if timer ~= nil then
        timer:Cancel()
    end
end