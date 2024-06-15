--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Tazavesh, the Veiled Market
------------------------------------------------------
core._2441 = {}

function core._2441:ZophexTheSentinel()
    --Defeat Zo'phex the Sentinel while covered in 4 different blended substances in Tazavesh, the Veiled Market on Mythic difficulty.

    --Blended Meat 356436
    --Blended Fruit 356397
    --Blended Toy 356484
    --Blended Glow Stick 356493

    if core:getBlizzardTrackingStatus(15109, 1) == true then
        core:getAchievementSuccess()
    end
end

-- function core._2441:MailroomMayhem()
--     --Defeat the P.O.S.T. Master after passing all Unstable Goods to at least one other player before delivery in Tazavesh, the Veiled Market on Mythic difficulty.

--     if core:getBlizzardTrackingStatus(15106, 1) == false then
--         core:getAchievementFailed()
--     end
-- end

-- function core._2441:Hylbrande()
--     --Defeat Hylbrande after only inserting Bypass Codes while afflicted with Sanitizing Field in Tazavesh, the Veiled Market on Mythic Difficulty.

--     if core:getBlizzardTrackingStatus(15179, 1) == true then
--         core:getAchievementSuccess()
--     end
-- end