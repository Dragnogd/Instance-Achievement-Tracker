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
	core:displayAchievementsToTrackCurrent(6937)

	--Everyone in raid must have  Zealous Parasite, even if dead.
	--You must be alive.
	--You must not be mind controlled.

	if core.type == "UNIT_DIED" and core.unitTypePlayer == "Player" then
		if core.achievementCompleted == true then
			SendChatMessage("[WIP] "  .. GetAchievementLink(6937) .. " FAILED! (" .. core.destName .. " has died) DO NOT KILL BOSS!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			parasiteCounter = parasiteCounter - 1
			parasitePlayers[core.spawn_uid_dest_Player] = nil
			core.achievementCompleted = false
		else
			SendChatMessage("[WIP] "  .. GetAchievementLink(6937) .. " FAILED! (" .. core.destName .. " has died)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
	end

	if GetNumGroupMembers() == 0 then
		groupSize = 1
		local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
		if UnitDebuff("Player", GetSpellInfo(125785)) and parasitePlayers[spawn_uid_dest] == nil then
			parasiteCounter = parasiteCounter + 1
			SendChatMessage("[WIP] " .. UnitName("Player") .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. groupSize .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			parasitePlayers[spawn_uid_dest] = spawn_uid_dest
		end
	else
		groupSize = GetNumGroupMembers()	
	end

	for i = 1, GetNumGroupMembers() do
		local unit = nil
		if core.chatType == "PARTY" then
			if i < GetNumGroupMembers() then
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
				SendChatMessage("[WIP] " .. UnitName(unit) .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. groupSize .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				parasitePlayers[spawn_uid_dest] = spawn_uid_dest
			end
		end
	end

	if parasiteCounter == groupSize and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(6937) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end
end

function core.HeartOfFear:Garalon()
	core:displayAchievementsToTrackCurrent(6553)

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 122786 and core.achievementFailed == false then
		SendChatMessage("[WIP] " .. GetAchievementLink(6553) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true			
	end
end

function core.HeartOfFear:GrandEmpressShekzeer()
	core:displayAchievementsToTrackCurrent(6922)

	if core.type == "UNIT_DIED" and core.destID == "63591" and core.achievementCompleted == false then
		reaversKilled = reaversKilled + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(10, function()
				if reaversKilled == 2 then
					SendChatMessage("[WIP] "  .. GetAchievementLink(6922) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementCompleted = true
				else
					SendChatMessage("[WIP] " .. GetAchievementLink(6922) .. " FAILED! (" .. reaversKilled .. "/2) reavers killed in time",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
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
	groupSize = 0

	------------------------------------------------------
	---- Grand Empress Shek'zeer
	------------------------------------------------------
	timerStarted = false
	reaversKilled = 0
end

-- f:SetScript("OnEvent", function(self, event, ...)
-- 	if event == "CRITERIA_COMPLETE" then
-- 		print("Criteria Complete")
-- 	elseif event == "CRITERIA_EARNED" then
-- 		print("Criteria Earned")
-- 	end
-- end)