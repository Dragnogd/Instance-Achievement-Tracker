--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Halls of Infusion Bosses
------------------------------------------------------
core._2527 = {}

function core._2527:GulpingGoliath()
    --Defeat the Gulping Goliath after forcing it to become Hangry and devour 10 Curious Swoglets in Halls of Infusion on Mythic difficulty.

    --TODO: Counter for number of Swoglets alive
    --TODO: Announce when boss is Hangry and when players have enough swoglets alive to bring to boss to get gulped

    if core:getBlizzardTrackingStatus(16426, 1) == true then
      core:getAchievementSuccess()
    end
end

function core._2527:PrimalTsunami()
    --Defeat the Primal Tsunami after slaying three Flow Control Units in Halls of Infusion on Mythic difficulty.

    --TODO: Announce when a flow control unit is killed

    if core:getBlizzardTrackingStatus(16427, 1) == true then
      core:getAchievementSuccess()
    end
end