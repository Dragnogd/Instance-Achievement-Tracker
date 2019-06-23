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

function core._2097:AbyssalCommanderSivara()
    --Defeat Abyssal Commander Sivara in The Eternal Palace while all three of her lieutenants are alive and engaged in the fight on Normal difficulty or higher.

    --Blizzard tracking gone red so fail achievement
	if core:getBlizzardTrackingStatus(13684) == true then
		core:getAchievementFailed()
	end
end

function core._2097:Zaqul() 
    --Defeat Za'qul in the Eternal Palace after killing ten Twinklehoof Bovine on Normal difficulty or higher.

    --Blizzard tracking gone white so complete achievement
	if core:getBlizzardTrackingStatus(13716) == true then
		core:getAchievementSuccess()
	end
end