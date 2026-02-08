--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Eye of Eternity Bosses
------------------------------------------------------
core._616 = {}

------------------------------------------------------
---- You Don't Have an Eternity
------------------------------------------------------
local timer
local timerStarted = false

------------------------------------------------------
---- A poke in the Eye
------------------------------------------------------
local wrongConfigAnnounced = false

function core._616:YouDontHaveAnEternity()
    --Defeat Malygos in 6 minutes or less-Defeat Malygos in 6 minutes or less

    if timerStarted == false then
        timerStarted = true
        if core.difficultyID == 3 then
            core.MobCounter:SetupCountdown(360, 1874)
        elseif core.difficultyID == 4 then
            core.MobCounter:SetupCountdown(360, 1875)
        end
    end
end

function core._616:APokeInTheEye()
    if wrongConfigAnnounced == false then
        wrongConfigAnnounced = true
        if core.difficultyID == 3 then
            --10 Man
            if core.groupSize > 9 then
                core:sendMessage(GetAchievementLink(1869) .. " " .. L["Shared_WrongGroupConfig"])
            end
        elseif core.difficultyID == 4 then
            --25 Man
            if core.groupSize > 21 then
                core:sendMessage(GetAchievementLink(1870) .. " " .. L["Shared_WrongGroupConfig"])
            end
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

    ------------------------------------------------------
    ---- A poke in the Eye
    ------------------------------------------------------
    wrongConfigAnnounced = false
end