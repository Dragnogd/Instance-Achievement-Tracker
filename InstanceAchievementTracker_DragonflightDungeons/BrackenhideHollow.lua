--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Brackenhide Hollow Bosses
------------------------------------------------------
core._2520 = {}

function core._2520:HackclawsWarBand()
    --Defeat Hackclaw's War-Band after freeing Chief Softpaw, equipping her with a spear and shield, and making sure she survives in Brackenhide Hollow on Mythic difficulty.

    --TODO: Check for Fail? Can it be repeated.

    if core:getBlizzardTrackingStatus(16296, 1) == true then
      core:getAchievementSuccess()
    end
end

function core._2520:Treemouth()
    --Defeat Treemouth after every player has been consumed at least once in Brackenhide Hollow on Mythic difficulty.

    --TODO: If all at the same time. Announce which player/player got the debuff each time attempted
    --TODO: If at some point during the fight. InfoFrame + announce to chat who has completed so far

    if core:getBlizzardTrackingStatus(16430, 1) == true then
      core:getAchievementSuccess()
    end
end

function core._2520:DecatriarchWratheye()
    --Defeat Decatriarch Wratheye after finding and planting three Resilient Mushrooms, then destroying them with Decaystrike in Brackenhide Hollow on Mythic difficulty.

    if core:getBlizzardTrackingStatus(16404, 1) == true then
      core:getAchievementSuccess()
    end
end
