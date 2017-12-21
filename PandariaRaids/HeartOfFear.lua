--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Heart Of Fear
------------------------------------------------------
core.HeartOfFear = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_AURA")
f:RegisterEvent("UNIT_AURA_APPLIED")
f:RegisterEvent("CRITERIA_COMPLETE")
f:RegisterEvent("CRITERIA_EARNED")
f:RegisterEvent("CRITERIA_UPDATE")


------------------------------------------------------
---- Imperial Vizier Zor'lok
------------------------------------------------------
local parasitePlayers = {}
local parasiteCounter = 0
local groupSize = 0

------------------------------------------------------
---- Grand Empress Shek'zeer
------------------------------------------------------
local timerStarted = false
local reaversKilled = 0

function core.HeartOfFear:ImperialVizierZorlok()
	if core.type == "UNIT_DIED" and core.unitTypePlayer == "Player" then
		if core.achievementCompleted == true then
			parasiteCounter = parasiteCounter - 1
			parasitePlayers[core.spawn_uid_dest_Player] = nil
			core.achievementCompleted = false	
		end
		core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED! (" .. core.destName .. " has died) DO NOT KILL BOSS!")
	end

	--If the player is not in a group
	local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
	if UnitDebuff("Player", GetSpellInfo(125785)) and parasitePlayers[spawn_uid_dest] == nil then
		parasiteCounter = parasiteCounter + 1
		core:sendMessage(UnitName("Player") .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
		parasitePlayers[spawn_uid_dest] = spawn_uid_dest
	end

	--If player is in a group
	if core.groupSize > 0 then
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
				if UnitDebuff(unit, GetSpellInfo(125785)) and parasitePlayers[spawn_uid_dest] == nil then
					parasiteCounter = parasiteCounter + 1
					core:sendMessage(UnitName(unit) .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
					parasitePlayers[spawn_uid_dest] = spawn_uid_dest
				end
			end
		end
	end

	if parasiteCounter == core.groupSize then
		core:getAchievementSuccess()
	end
end

function core.HeartOfFear:Garalon()
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 122786 then
		core:getAchievementFailed()		
	end
end

function core.HeartOfFear:GrandEmpressShekzeer()
	if core.type == "UNIT_DIED" and core.destID == "63591" then
		reaversKilled = reaversKilled + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(10, function()
				if reaversKilled == 2 then
					core:getAchievementSuccess()
				else
					core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED! (" .. reaversKilled .. "/2) reavers killed in time.")
					reaversKilled = 0
					timerStarted = false					
				end
			end)
		end
	end
end

function HeartOfFear_ClearVariables()
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