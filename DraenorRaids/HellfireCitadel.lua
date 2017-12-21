--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Hellfire Citadel Bosses
------------------------------------------------------
core.HellfireCitadel = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_HEALTH")
f:RegisterEvent("CHAT_MSG_MONSTER_YELL")

------------------------------------------------------
---- Iron Reaver
------------------------------------------------------
local hellfireGuardianKilled = 0

------------------------------------------------------
---- Hellfire High Council
------------------------------------------------------
local timerStarted = false
local unitsKilled = 0

------------------------------------------------------
---- Kormrok
------------------------------------------------------
local playersHit = {}

------------------------------------------------------
---- Shadow-Lord Iskar
------------------------------------------------------
local eyeOfAnzuPlayer = nil
local firstPickup = false

------------------------------------------------------
---- Socrethar the Eternal
------------------------------------------------------
local hauntingSoulsKilled = 0

function core.HellfireCitadel:HellfireAssualt()
	core:displayAchievementsToTrackCurrent(10026)

	f:SetScript("OnEvent", function(self, event, unitID)
		local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
		if event == "UNIT_HEALTH" and destID == "90018" and core.achievementFailed == false then
			--If health is less than 90% then fail the achievement
			if (UnitHealth(unitID) / UnitHealthMax(unitID)) * 100 < 90 then
				SendChatMessage("[WIP] "  .. GetAchievementLink(10026) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true				
			end
		end
	end)
end

function core.HellfireCitadel:IronReaver()
	core:displayAchievementsToTrackCurrent(10057)

	if core.type == "SPELL_INSTAKILL" and core.destID == "94985" and core.achievementCompleted == false then
		hellfireGuardianKilled = hellfireGuardianKilled + 1
		SendChatMessage("[WIP] Hellfire Guardians Killed (" .. hellfireGuardianKilled .. "/10)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	if hellfireGuardianKilled == 10 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(10057) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true		
	end
end

function core.HellfireCitadel:HellfireHighCouncil()
	core:displayAchievementsToTrackCurrent(10054)
	
	if core.type == "UNIT_DIED" and (core.destID == "92142" or core.destID == "92146" or core.destID == "92144") then
		unitsKilled = unitsKilled + 1
		if timerStarted == false then
			SendChatMessage("[WIP] Timer Started!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			timerStarted = true
			C_Timer.After(10, function()
				if unitsKilled ~= 3 and core.achievementFailed == false and core.inCombat == true then
					SendChatMessage("[WIP] "  .. GetAchievementLink(10054) .. " FAILED (" .. unitsKilled .. "/3) Killed in time",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementFailed = true							
				end
			end)
		end
	end
end

function core.HellfireCitadel:KilroggDeadeye()
	core:displayAchievementsToTrackCurrent(9972)

	-- if type == "UNIT_DIED" and destID == "90980" and core.achievementFailed == false then
	-- 	SendChatMessage("[WIP] "  .. GetAchievementLink(9972) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	-- 	core.achievementFailed = true			
	-- end

	f:SetScript("OnEvent", function(self, event, message, sender)
		if event == "CHAT_MSG_MONSTER_YELL" and message == "GHHAAAaaa!!!" and core.achievementFailed == false then
			SendChatMessage("[WIP] " .. GetAchievementLink(9972) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementFailed = true				
		end
	end)
end

function core.HellfireCitadel:Kormrok()
	core:displayAchievementsToTrackCurrent(10013)

	--If player gets hit by one of the abilities and has not already been hit then fail the achievement for the player
	if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 185521 or core.spellId == 185519 or core.spellId == 180270) and core:has_value(playersHit, core.spawn_uid_dest_Player) == false then
		table.insert(playersHit, core.spawn_uid_dest_Player)
		SendChatMessage("[WIP] " .. GetAchievementLink(10013) .. " Personal Achievement FAILED for " .. core.destName,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)		
	end
end

function core.HellfireCitadel:Gorefiend()
	core:displayAchievementsToTrackCurrent(9979)

	if core.type == "UNIT_DIED" and core.destID == "93145" and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(9979) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true				
	end
end

function core.HellfireCitadel:ShadowLordIskar()
	core:displayAchievementsToTrackCurrent(9988)

	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 179202 and core.achievementFailed == false then
		eyeOfAnzuPlayer = nil
	end

	--If player has had the Eye of Anzu for more than 5 seconds then fail the achievement
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 179202 and core.achievementFailed == false then
		eyeOfAnzuPlayer = core.destName
		firstPickup = true
		C_Timer.After(5, function()
			if eyeOfAnzuPlayer == core.destName then
				SendChatMessage("[WIP] " .. GetAchievementLink(9988) .. " FAILED! by " .. core.destName,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true				
			end
		end)				
	end

	if firstPickup == false then
		if GetNumGroupMembers() > 0 then
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

				if UnitBuff(unit, GetSpellInfo(179202)) then
					eyeOfAnzuPlayer = core.destName
					firstPickup = true
					C_Timer.After(5, function()
						if eyeOfAnzuPlayer == core.destName then
							SendChatMessage("[WIP] " .. GetAchievementLink(9988) .. " FAILED! by " .. core.destName,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
							core.achievementFailed = true				
						end
					end)						
				end
			end
		else
			if UnitBuff("Player", GetSpellInfo(179202)) then
				eyeOfAnzuPlayer = core.destName
				firstPickup = true
				C_Timer.After(5, function()
					if eyeOfAnzuPlayer == core.destName then
						SendChatMessage("[WIP] " .. GetAchievementLink(9988) .. " FAILED! by " .. core.destName,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
						core.achievementFailed = true				
					end
				end)						
			end			
		end
	end
end

function core.HellfireCitadel:FelLordZakuun()
	core:displayAchievementsToTrackCurrent(10012)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 179428 and core.achievementFailed == false then
		core.achievementFailed = true		
		C_Timer.After(6, function()
			SendChatMessage("[WIP] " .. GetAchievementLink(10012) .. " FAILED! by " .. core.destName,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end)		
	end
end

function core.HellfireCitadel:Xhulhorac()
	core:displayAchievementsToTrackCurrent(10087)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 185656 and core.achievementFailed == false then
		SendChatMessage("[WIP] " .. GetAchievementLink(10087) .. " FAILED! by " .. core.destName,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.HellfireCitadel:SocretharTheEternal()
	core:displayAchievementsToTrackCurrent(10086)

	if core.type == "UNIT_DIED" and core.destID == "91938" and core.achievementCompleted == false then
		hauntingSoulsKilled = hauntingSoulsKilled + 1
		SendChatMessage("[WIP] Haunting Souls Killed: (" .. hauntingSoulsKilled .. "/20)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)		
		if timerStarted == false then
			timerStarted = true
			SendChatMessage("[WIP] Timer Started! 10 seconds remaining",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			C_Timer.After(10, function()
				if hauntingSoulsKilled < 20 and core.inCombat == true then
					SendChatMessage("[WIP] " .. GetAchievementLink(10086) .. " FAILED! (" .. hauntingSoulsKilled .. "/20) Killed in time",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementFailed = true
					hauntingSoulsKilled = 0
					timerStarted = false
				elseif hauntingSoulsKilled >= 20 then
					SendChatMessage("[WIP] " .. GetAchievementLink(10086) .. " Requirements have been met. Boss can now be killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)												
					core.achievementCompleted = true
				end
			end)
		end
	end
end

function core.HellfireCitadel:TyrantVelhari()
	core:displayAchievementsToTrackCurrent(9989)

	if core.type == "UNIT_DIED" and core.destID == "90270" and core.achievementFailed == false then
		SendChatMessage("[WIP] " .. GetAchievementLink(9989) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true		
	end
end

function core.HellfireCitadel:Mannoroth()
	--core:displayAchievementsToTrackCurrent(10030)

	if core.type == "SPELL_DAMAGE" and core.spellId == 182077 and core.destID == "91241" and core.overkill > 0 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(10030) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true				
	end
end

function HellfireCitadel_ClearVariables()
	------------------------------------------------------
	---- Iron Reaver
	------------------------------------------------------
	hellfireGuardianKilled = 0

	------------------------------------------------------
	---- Hellfire High Council
	------------------------------------------------------
	timerStarted = false
	unitsKilled = 0	

	------------------------------------------------------
	---- Kormrok
	------------------------------------------------------
	playersHit = {}

	------------------------------------------------------
	---- Shadow-Lord Iskar
	------------------------------------------------------
	eyeOfAnzuPlayer = nil
	firstPickup = false

	------------------------------------------------------
	---- Socrethar the Eternal
	------------------------------------------------------
	hauntingSoulsKilled = 0
end