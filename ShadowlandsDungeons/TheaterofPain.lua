--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Theater of Pain
------------------------------------------------------
core._2293 = {}

function core._2293:Gorechop()
    --Defeat Gorechop after tenderizing 2 hunks of meat with Tenderizing Smash in the Theater of Pain on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14607, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2293:Mordretha()
    --Defeat Mordretha, the Endless Empress, after performing a /challenge and defeating 2 Ghostly Contenders in the Theater of Pain on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14533, 1) == true then
        core:getAchievementSuccess()
    end
end