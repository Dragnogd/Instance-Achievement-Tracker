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

function core._2097:QueenAzshara()
	--Defeat Queen Azshara in The Eternal Palace with one player still alive who is currently affected by Essence of Azeroth on Normal difficulty or higher.

	if core.type == "UNIT_DIED" and core.currentDest == "Player" then
		--Loop through all players in the group and check if just 1 player is alive
		local playersAlive = 0
		local lastPlayerAlive = nil
        for i = 1, core.groupSize do
            local unit = nil
            if core.chatType == "PARTY" then
                if i < core.groupSize then
                    unit = "party" .. i
                else
                    unit = "player"
                end
            elseif core.chatType == "RAID" then
                unit = "raid" .. i
            elseif core.chatType == "SAY" then
                unit = "player"
            end
        
			if UnitIsDead(unit) == false then
				playersAlive = playersAlive + 1
				local name = UnitName(unit)
				lastPlayerAlive = name
			end
		end
		
		if playersAlive == 1 then
			for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unit, i)
				if spellId == 300866 then
					core:getAchievementSuccess()
				end
			end
		end
	end
end