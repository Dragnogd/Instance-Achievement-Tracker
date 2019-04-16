--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle of Dazar'alor Bosses
------------------------------------------------------
core._2096 = {}

------------------------------------------------------
---- The Restless Cabal
------------------------------------------------------
local voidCrashesActive = 0

function core._2096:TheRestlessCabal()
    --Defeat the Restless Cabal in Crucible of Storms after having at least 10 Void Crashes active simultaneously in Normal Difficulty or higher.

    --Blizzard Tracker has gone white so achievement failed
    if core:getBlizzardTrackingStatus(13501) == true then
        core:getAchievementSuccess()
    end
end

function core._2096:ClearVariables()
    ------------------------------------------------------
    ---- The Restless Cabal
    ------------------------------------------------------
    voidCrashesActive = 0
end