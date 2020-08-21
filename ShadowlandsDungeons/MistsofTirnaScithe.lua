--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Mists of Tirna Scithe
------------------------------------------------------
core._2290 = {}

function core._2290:IngraMaloch()
    --Defeat Ingra Maloch after defeating an Overgrown Hydra on in thie Mists of Tirna Scithe on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14503, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2290:Tredova()
    --Defeat Tred'ova after defeating an Elightened Spinemaw Gorger in the Mists of Tirna Scithe on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14375, 1) == true then
        core:getAchievementSuccess()
    end
end