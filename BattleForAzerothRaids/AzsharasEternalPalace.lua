--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Azshara's Eternal Palace
------------------------------------------------------
core._2097 = {}
core._2097.Events = CreateFrame("Frame")

function core._2097:Zaqul() 
    --Defeat Za'qul in the Eternal Palace after killing ten Twinklehoof Bovine on Normal difficulty or higher.

    --Blizzard tracking gone white
	if core:getBlizzardTrackingStatus(13716) == true then
		core:getAchievementSuccess()
	end
end