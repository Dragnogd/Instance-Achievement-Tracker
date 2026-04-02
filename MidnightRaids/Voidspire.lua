--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Voidspire
------------------------------------------------------
core._2912 = {}
core._2912.Events = CreateFrame("Frame")

------------------------------------------------------
---- Vaelgor & Ezzorak
------------------------------------------------------
local firstTetherBroken = false

function core._2912:DevouringHost()
    -- Get consumed by the Devouring Host in The Voidspire or March on Quel'Danas.
end

function core._2912:ImperatorAverzian()
    -- Defeat Imperator Averzian after causing him to destroy your banners in the Voidspire on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(62106,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2912:Vorasius()
    -- Defeat Vorasius after every player feeds a hatchling enough to put it to sleep in The Voidspire on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(62058,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2912:FallenKingSalhadaar()
    -- Defeat Fallen-King Salhadaar after everyone /kneels to him before the battle starts in The Voidspire on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(61514,1) == true then
        core:getAchievementSuccess()
    elseif core:getBlizzardTrackingStatus(61514,1) == false then
        core:getAchievementSuccess()
    end
end

function core._2912:VaelgorEzzorak()
    -- Defeat Vaelgor & Ezzorak after all players break each Nullzone's tethers within 3 seconds in The Voidspire on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(61911,1) == true then
        core:getAchievementSuccess()
        firstTetherBroken = true
    end

    -- If trackers goes red after first success then we are nullzone tehter phase
    -- Wait three seconds
    if core:getBlizzardTrackingStatus(61911,1) == false then
        if firstTetherBroken == true then
            C_Timer.After(4, function()
                -- If tracker is still red then tethers were not broken within 3 seconds
                -- Hence achievement has failed
                if core:getBlizzardTrackingStatus(61911,1) == false then
                    core:getAchievementFailed()
                end
            end)
        end
    end
end

function core._2912:LightblindedVanguard()
    -- Defeat the Lightblinded Vanguard while your entire raid has Maximum Aura in The Voidspire on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(61936,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2912:CrownOfTheCosmos()
    -- Defeat Crown of the Cosmos after slaying a Fleshy Monstrosity and returning all of its meat to The Emptiness in The Voidspire on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(61346,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2912:ClearVariables()
    ------------------------------------------------------
    ---- Vaelgor & Ezzorak
    ------------------------------------------------------
    firstTetherBroken = false
end