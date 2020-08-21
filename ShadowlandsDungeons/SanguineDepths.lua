--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Sanguine Depths
------------------------------------------------------
core._2284 = {}

function core._2284:ExecutorTarvold()
    --Defeat Executor Tarvold after slaying 8 Forlorn Captives with the effects of Residue in Sanguine Depths on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14286, 1) == true then
        core:getAchievementSuccess()
    end
end