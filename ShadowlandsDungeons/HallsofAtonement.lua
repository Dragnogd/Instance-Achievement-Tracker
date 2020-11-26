--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Halls of Atonement
------------------------------------------------------
core._2297 = {}

function core._2297:Halkias()
    --Defeat Halkias after he absorbs all three Shards of Halkas in the Halls of Atonement on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14567, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2297:Echelon()
    --Defeat Echelon after shatter 18 or more Undying Stonefiends at one time in the Halls of Atonement on Mythic difficulty.

    --Adds turned to stone
    core.MobCounter:Setup(18, 2, "164363")
    core.MobCounter:DetectSpawnedMobsEchelon()
    core.MobCounter:DetectKilledMobEchelon()

    if core:getBlizzardTrackingStatus(14284, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2297:LordChamberlain()
    --Defeat Lord Chamberlain with 3 Sinstone Statues in corners of the room in the Halls of Atonement on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14352, 1) == true then
        core:getAchievementSuccess()
    end
end