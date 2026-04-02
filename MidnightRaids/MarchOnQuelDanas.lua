--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- March on Quel'Danas
------------------------------------------------------
core._2913 = {}
core._2913.Events = CreateFrame("Frame")

function core._2913:DevouringHost()
    -- Get consumed by the Devouring Host in The Voidspire or March on Quel'Danas.
end

function core._2913:MidnightFalls()
    -- Defeat Midnight Falls after returning 12 Memories of Alleria back to L'ura in March on Quel'Danas on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(62406,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2913:BelorenChildOfAlar()
    -- Defeat Belo'ren, Child of Al'ar after infusing the Sunwell Egg with Light and Void magic in March on Quel'Danas on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(61381,1) == true then
        core:getAchievementSuccess()
    end
end