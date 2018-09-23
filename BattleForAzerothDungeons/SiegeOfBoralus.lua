--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Siege of Boralus Bosses
------------------------------------------------------
core._1822 = {}

function core._1822:DreadCaptainLockwood()
    if core:getBlizzardTrackingStatus(12727) == false then
        core:getAchievementFailed()
    end
end