--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Dragon Soul Bosses
------------------------------------------------------
core.DragonSoul = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")

------------------------------------------------------
---- Warlord Zon'ozz
------------------------------------------------------
local pingPongCounter = 0

------------------------------------------------------
---- Yor'sahj the Unsleeping
------------------------------------------------------
local timerStarted = false
local redFound = false
local yellowFound = false
local greenFound = false
local blackFound = false
local purpleFound = false
local blueFound = false
local blackYellowFound = false
local redGreenFound = false
local blackBlueFound = false
local purpleYellowFound = false
local combinationsFound = 0

------------------------------------------------------
---- Ultraxion
------------------------------------------------------
local hourOfTwilightPlayers = {}

------------------------------------------------------
---- Spine Of Deathwing
------------------------------------------------------
local lastRole = nil
local rolesPerformed = 0

function core.DragonSoul:WarlordZonozz()
	core:displayAchievementsToTrackCurrent(6128)

	--If void diffusion is applied and is SPELL_AURA_APPLIED then set counter to one
	--Else if void diffusion is applied and is SPELL_AURA_APPLIED_DOSE then increment counter by 1
	--If Counter equals 10 then complete the achievement

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 106836 then
		pingPongCounter = 1
		SendChatMessage("[WIP] Void of the Unmaking ("  .. pingPongCounter .. "/10)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	elseif core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 106836 then
		pingPongCounter = pingPongCounter + 1
		SendChatMessage("[WIP] Void of the Unmaking ("  .. pingPongCounter .. "/10)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	if pingPongCounter == 10 and core.achievementCompleted == false then
        SendChatMessage("[WIP] "  .. GetAchievementLink(6128) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        core.achievementCompleted = true		
	end
end

function core.DragonSoul:YorsahjTheUnsleeping()
	core:displayAchievementsToTrackCurrent(6129)

	--If type is spell aura applied and is one of the colours
	--Figure out which color it is and add to appropriate variable
	--Start a timer of 40 seconds and clear variables after the 40 seconds
	--If combination is found then alert the user

	--Set variable to detect which colours have been found
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 104897 and core.destID == "55312" then
		redFound = true
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 104901 and core.destID == "55312" then
		yellowFound = true
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 104898 and core.destID == "55312" then
		greenFound = true
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 104894 and core.destID == "55312" then
		blackFound = true
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 104896 and core.destID == "55312" then
		purpleFound = true
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 105027 and core.destID == "55312" then
		blueFound = true
	end

	--Check if any of the combinations have been matched
	if blackFound == true and yellowFound == true and blackYellowFound == false then
		combinationsFound = combinationsFound + 1
		SendChatMessage("[WIP] Black and Yellow combination found for " .. GetAchievementLink(6129) .. " (" .. combinationsFound .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		blackYellowFound = true
	end

	if redFound == true and greenFound == true and redGreenFound == false then
		combinationsFound = combinationsFound + 1
		SendChatMessage("[WIP] Red and Green combination found for " .. GetAchievementLink(6129) .. " (" .. combinationsFound .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		redGreenFound = true
	end
	
	if blackFound == true and blueFound == true and blackBlueFound == false then
		combinationsFound = combinationsFound + 1
		SendChatMessage("[WIP] Black and Blue combination found for " .. GetAchievementLink(6129) .. " (" .. combinationsFound .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		blackBlueFound = true
	end

	if purpleFound == true and yellowFound == true and purpleYellowFound == false then
		combinationsFound = combinationsFound + 1
		SendChatMessage("[WIP] Purple and Yellow combination found for " .. GetAchievementLink(6129) .. " (" .. combinationsFound .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		purpleYellowFound = true
	end

	if combinationsFound == 4 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(6129) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end

	--Reset variables once buff on boss has warn off
	if timerStarted == false then
		timerStarted = true
		C_Timer.After(60, function()
			redFound = false
			yellowFound = false
			greenFound = false
			blackFound = false
			purpleFound = false
			blueFound = false
			timerStarted = false
		end)		
	end

end

function core.DragonSoul:Ultraxion()
	core:displayAchievementsToTrackCurrent(6084)

	if core.type == "SPELL_DAMAGE" and core.spellId == 103327 then
		if core:has_value(hourOfTwilightPlayers, core.spawn_uid_dest) then
			SendChatMessage("[WIP] "  .. GetAchievementLink(6084) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		else
			table.insert(hourOfTwilightPlayers, core.spawn_uid_dest)
		end
	end
end

function core.DragonSoul:Skyfire()
	core:displayAchievementsToTrackCurrent(6105)

	if core.type == "SPELL_DAMAGE" and core.spellId == 107501 and core.destID == "56598" and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(6105) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.DragonSoul:SpineOfDeathwing()
	core:displayAchievementsToTrackCurrent(6133)

	f:SetScript("OnEvent", function(self, event, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)
		if event == "CHAT_MSG_RAID_BOSS_EMOTE" and core.achievementCompleted == false then
			if message == "%s rolls right!" then
				if lastRole == "right" or lastRole == nil then
					rolesPerformed = 0
					SendChatMessage("[WIP] "  .. GetAchievementLink(6133) .. " FAILED! (This Achievement Can be Attempted Again)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					SendChatMessage("[WIP] Roll the boss LEFT now! (" .. rolesPerformed .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					lastRole = nil
				elseif lastRole == "left" then
					rolesPerformed = rolesPerformed + 1
					SendChatMessage("[WIP] Roll the boss LEFT now! (" .. rolesPerformed .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					lastRole = "right"
				end
			elseif message == "%s rolls left!" then
				if lastRole == nil then
					rolesPerformed = rolesPerformed + 1
					SendChatMessage("[WIP] Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					lastRole = "left"
				elseif lastRole == "left" then
					rolesPerformed = 1
					SendChatMessage("[WIP] "  .. GetAchievementLink(6133) .. " FAILED! (This Achievement Can be Attempted Again)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					SendChatMessage("[WIP] Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					lastRole = "left"
				elseif lastRole == "right" then
					rolesPerformed = rolesPerformed + 1
					SendChatMessage("[WIP] Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					lastRole = "left"
				end
			end
		end

		if rolesPerformed == 4 and core.achievementCompleted == false then
			SendChatMessage("[WIP] "  .. GetAchievementLink(6133) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementCompleted = true			
		end
	end)
end

function DragonSoul_ClearVariables()
	------------------------------------------------------
	---- Warlord Zon'ozz
	------------------------------------------------------
	pingPongCounter = 0

	------------------------------------------------------
	---- Yor'sahj the Unsleeping
	------------------------------------------------------
	timerStarted = false
	redFound = false
	yellowFound = false
	greenFound = false
	blackFound = false
	purpleFound = false
	blueFound = false
	blackYellowFound = false
	redGreenFound = false
	blackBlueFound = false
	purpleYellowFound = false
	combinationsFound = 0

	------------------------------------------------------
	---- Ultraxion
	------------------------------------------------------
	hourOfTwilightPlayers = {}

	------------------------------------------------------
	---- Spine Of Deathwing
	------------------------------------------------------
	lastRole = nil
	rolesPerformed = 0		
end

--Deathwing (Cannot use function since boss is not registered before assualting a platform)
f:SetScript("OnEvent", function(self, event, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)
	if event == "CHAT_MSG_RAID_BOSS_EMOTE" and core.achievementCompleted == false then
		if string.match(message, "Ysera") and core.achievementCompleted == false then
			core:displayAchievementsToTrackCurrent(6180)
			SendChatMessage("[WIP] 'Ysera Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementCompleted = true
		elseif string.match(message, "Nozdormu") and core.achievementCompleted == false then
			core:displayAchievementsToTrackCurrent(6180)
			SendChatMessage("[WIP] 'Nozdormu Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementCompleted = true
		elseif string.match(message, "Alexstrasza") and core.achievementCompleted == false then
			core:displayAchievementsToTrackCurrent(6180)
			SendChatMessage("[WIP] 'Alexstrasza Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementCompleted = true
		elseif string.match(message, "Kalecgos") and core.achievementCompleted == false then
			core:displayAchievementsToTrackCurrent(6180)
			SendChatMessage("[WIP] 'Kalecgos Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementCompleted = true
		end
	end
end)