--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Heart Of Fear
------------------------------------------------------
core._1009 = {}

------------------------------------------------------
---- Imperial Vizier Zor'lok
------------------------------------------------------
local parasitePlayers = {}
local parasiteCounter = 0

------------------------------------------------------
---- Grand Empress Shek'zeer
------------------------------------------------------
local timerStarted = false
local reaversKilled = 0

function core._1009:ImperialVizierZorlok()
	if core.type == "UNIT_DIED" and core.unitTypePlayer == "Player" then
		--If the player was holding a parasite then reduce counter by 1
		if parasitePlayers[core.spawn_uid_dest_Player] ~= nil then
			parasiteCounter = parasiteCounter - 1
			parasitePlayers[core.spawn_uid_dest_Player] = nil

			--If achievement had already completed then fail it
			if core.achievementsCompleted[1] == true then
				core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died) DO NOT KILL BOSS!")
				core.achievementsCompleted[1] = false
			end
		end
	end

	--If player is in a group
	if core.groupSize > 1 then
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
			end
			
			if unit ~= nil then
				local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
				for i=1,40 do
					local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
					if spellId == 125785 and parasitePlayers[spawn_uid_dest] == nil then
						parasiteCounter = parasiteCounter + 1
						core:sendMessage(UnitName(unit) .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
						parasitePlayers[spawn_uid_dest] = spawn_uid_dest
					end
				end
			end
		end
	else
		--Player is not in a group
		local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
		for i=1,40 do
			local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff("Player", i)
			if spellId == 125785 and parasitePlayers[spawn_uid_dest] == nil then
				parasiteCounter = parasiteCounter + 1
				core:sendMessage(UnitName("Player") .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
				parasitePlayers[spawn_uid_dest] = spawn_uid_dest
			end
		end
	end

	if parasiteCounter == core.groupSize then
		core:getAchievementSuccess()
		core.achievementsFailed[1] = false
	end
end

function core._1009:Garalon()
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 122786 then
		core:getAchievementFailed()		
	end
end

function core._1009:GrandEmpressShekzeer()
	if core.type == "UNIT_DIED" and core.destID == "63591" then
		reaversKilled = reaversKilled + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(10, function()
				if core.inCombat == true then
					if reaversKilled == 2 then
						core:getAchievementSuccess()
					else
						core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED! (" .. reaversKilled .. "/2) reavers killed in time.")
						reaversKilled = 0
						timerStarted = false					
					end		
				end
			end)
		else
			if reaversKilled == 2 then
				core:getAchievementSuccess()
			end
		end
	end
end

function core._1009:AmberShaperUnsok()
	if core:getBlizzardTrackingStatus(6518) == true then
		core:getAchievementSuccess()
	end
end

function core._1009:ClearVariables()
	------------------------------------------------------
	---- Imperial Vizier Zor'lok
	------------------------------------------------------
	parasitePlayers = {}
	parasiteCounter = 0

	------------------------------------------------------
	---- Grand Empress Shek'zeer
	------------------------------------------------------
	timerStarted = false
	reaversKilled = 0
end