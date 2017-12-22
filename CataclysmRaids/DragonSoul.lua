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
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 106836 then
		pingPongCounter = 1
		core:sendMessage("Void of the Unmaking ("  .. pingPongCounter .. "/10)")
	elseif core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 106836 then
		pingPongCounter = pingPongCounter + 1
		core:sendMessage("Void of the Unmaking ("  .. pingPongCounter .. "/10)")
	end

	if pingPongCounter == 10 then
		core:getAchievementSuccess()	
	end
end

function core.DragonSoul:YorsahjTheUnsleeping()
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
		core:sendMessage("Black and Yellow combination found for " .. GetAchievementLink(core.currentAchievementID) .. " (" .. combinationsFound .. "/4)")
		blackYellowFound = true
	end

	if redFound == true and greenFound == true and redGreenFound == false then
		combinationsFound = combinationsFound + 1
		core:sendMessage("Red and Green combination found for " .. GetAchievementLink(core.currentAchievementID) .. " (" .. combinationsFound .. "/4)")
		redGreenFound = true
	end
	
	if blackFound == true and blueFound == true and blackBlueFound == false then
		combinationsFound = combinationsFound + 1
		core:sendMessage("Black and Blue combination found for " .. GetAchievementLink(core.currentAchievementID) .. " (" .. combinationsFound .. "/4)")
		blackBlueFound = true
	end

	if purpleFound == true and yellowFound == true and purpleYellowFound == false then
		combinationsFound = combinationsFound + 1
		core:sendMessage("Purple and Yellow combination found for " .. GetAchievementLink(core.currentAchievementID) .. " (" .. combinationsFound .. "/4)")
		purpleYellowFound = true
	end

	if combinationsFound == 4 then
		core:getAchievementSuccess()
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
	if core.type == "SPELL_DAMAGE" and core.spellId == 103327 then
		if core:has_value(hourOfTwilightPlayers, core.spawn_uid_dest) then
			core:getAchievementFailedWithMessageAfter("by (" .. core.destName .. ")")
		else
			table.insert(hourOfTwilightPlayers, core.spawn_uid_dest)
		end
	end
end

function core.DragonSoul:Skyfire()
	if core.type == "SPELL_DAMAGE" and core.spellId == 107501 and core.destID == "56598" then
		core:getAchievementFailed()
	end
end

function core.DragonSoul:SpineOfDeathwing()
	f:SetScript("OnEvent", function(self, event, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)
		if event == "CHAT_MSG_RAID_BOSS_EMOTE" and core.achievementCompleted == false then
			if message == "%s rolls right!" then
				if lastRole == "right" or lastRole == nil then
					rolesPerformed = 0
					core:getAchievementFailedWithMessageAfter("(This Achievement Can be Attempted Again)")
					core.achievementFailed = false
					core:sendMessage("Roll the boss LEFT now! (" .. rolesPerformed .. "/4)")
					lastRole = nil
				elseif lastRole == "left" then
					rolesPerformed = rolesPerformed + 1
					core:sendMessage("Roll the boss LEFT now! (" .. rolesPerformed .. "/4)")
					lastRole = "right"
				end
			elseif message == "%s rolls left!" then
				if lastRole == nil then
					rolesPerformed = rolesPerformed + 1
					core:sendMessage("Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)")
					lastRole = "left"
				elseif lastRole == "left" then
					rolesPerformed = 1
					core:getAchievementFailedWithMessageAfter("(This Achievement Can be Attempted Again)")
					core.achievementFailed = false
					core:sendMessage("Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)")
					lastRole = "left"
				elseif lastRole == "right" then
					rolesPerformed = rolesPerformed + 1
					core:sendMessage("Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)")
					lastRole = "left"
				end
			end
		end

		if rolesPerformed == 4 then
			core:getAchievementSuccess()
		end
	end)
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


function core.DragonSoul:ClearVariables()
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