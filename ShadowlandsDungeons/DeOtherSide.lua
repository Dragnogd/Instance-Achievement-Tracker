--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- De Other Side
------------------------------------------------------
core._2291 = {}

function core._2291:DealerXyexa()
    --Defeat Dealer Xy'exa after collecting all 5 orbs floating above her in De Other Side on Mythic Difficulty.

    if core:getBlizzardTrackingStatus(14606, 1) == true then
        core:getAchievementSuccess()
    end
end