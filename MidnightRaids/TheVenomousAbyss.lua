--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- The Venomous Abyss
------------------------------------------------------
core._3004 = {}
core._3004.Events = CreateFrame("Frame")

function core._3004:NekzaliTheSoulcoiler()
    -- Defeat Nek'zali, the Soulcoiler after returning Kupamanduka to the Soulcoil Well in The Venomous Abyss on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(63418,1) == true then
        core:getAchievementSuccess()
    end
end

function core._3004:EntombedSentinels()
    -- Defeat the Entombed Sentinels after each Sentinel uses Vitriolic Stasis to restore more than half its total health in The Venomous Abyss on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(63250,1) == true and core:getBlizzardTrackingStatus(63250,2) == true then
        core:getAchievementSuccess()
    end
end

function core._3004:TheLostExplorers()
    -- Defeat The Lost Explorers including Hoji in The Venomous Abyss on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(63645,1) == true then
        core:getAchievementSuccess()
    end
end

function core._3004:VashnikTheMalignant()
    -- Defeat Vashnik after killing the Solidified Snake Venom in The Venomous Abyss on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(63397,1) == true then
        core:getAchievementSuccess()
    end
end

function core._3004:Sszorak()
    -- Defeat Sszorak while jumping through each ring that appears in The Venomous Abyss on Normal difficulty or higher.

    --Tracker must be white on boss pull. If it is red on pull or turns red at any point throughout the fight then the achievement has failed
    if core:getBlizzardTrackingStatus(63391,1) == false then
        core:getAchievementFailed()
    end
end

function core._3004:TheTwinFangs()
    -- Defeat the Twin Fangs after feeding Ithraz the following slimes in order during Ravenous Feast in The Venomous Abyss on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(63656,1) == true and core:getBlizzardTrackingStatus(63656,2) == true and core:getBlizzardTrackingStatus(63656,3) == true and core:getBlizzardTrackingStatus(63656,4) == true then
        core:getAchievementSuccess()
    end
end

function core._3004:TheCoiledAltar()
    -- Defeat The Coiled Altar while all players are afflicted by Unnerving Fixation in The Venomous Abyss on Normal difficulty or higher.

    --Tracker goes green when all players have the debuff and can go back red if it falls off, so success and fail alternate.
    --Reset the opposite flag so each state change can be reported again
    if core:getBlizzardTrackingStatus(63669,1) == true then
        core.achievementsFailed[1] = false
        core:getAchievementSuccess()
    else
        core.achievementsCompleted[1] = false
        core:getAchievementFailed()
    end
end

function core._3004:UlaTek()
    -- Defeat Ula'tek before the Greasy Hatchling breaks in The Venomous Abyss on Normal difficulty or higher.

    --Tracker must be white on boss pull. If it is red on pull or turns red at any point throughout the fight then the achievement has failed
    if core:getBlizzardTrackingStatus(63609,1) == false then
        core:getAchievementFailed()
    end
end

function core._3004:ClearVariables()
end
