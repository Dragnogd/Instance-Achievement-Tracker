--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Dragon Soul Bosses
------------------------------------------------------
core._967 = {}
core._967.Events = CreateFrame("Frame")

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

------------------------------------------------------
---- Deathwing
------------------------------------------------------
local platformAssualted = false

function core._967:WarlordZonozz()
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

function core._967:YorsahjTheUnsleeping()
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
		core:sendMessage("Black and Yellow combination found for " .. GetAchievementLink(core.achievementIDs[1]) .. " (" .. combinationsFound .. "/4)")
		blackYellowFound = true
	end

	if redFound == true and greenFound == true and redGreenFound == false then
		combinationsFound = combinationsFound + 1
		core:sendMessage("Red and Green combination found for " .. GetAchievementLink(core.achievementIDs[1]) .. " (" .. combinationsFound .. "/4)")
		redGreenFound = true
	end
	
	if blackFound == true and blueFound == true and blackBlueFound == false then
		combinationsFound = combinationsFound + 1
		core:sendMessage("Black and Blue combination found for " .. GetAchievementLink(core.achievementIDs[1]) .. " (" .. combinationsFound .. "/4)")
		blackBlueFound = true
	end

	if purpleFound == true and yellowFound == true and purpleYellowFound == false then
		combinationsFound = combinationsFound + 1
		core:sendMessage("Purple and Yellow combination found for " .. GetAchievementLink(core.achievementIDs[1]) .. " (" .. combinationsFound .. "/4)")
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

function core._967:Ultraxion()
	if core.type == "SPELL_DAMAGE" and core.spellId == 103327 then
		if core:has_value(hourOfTwilightPlayers, core.spawn_uid_dest) then
			core:getAchievementFailedWithMessageAfter("by (" .. core.destName .. ")")
		else
			table.insert(hourOfTwilightPlayers, core.spawn_uid_dest)
		end
	end
end

function core._967:Skyfire()
	if core.type == "SPELL_DAMAGE" and core.spellId == 107501 and core.destID == "56598" then
		core:getAchievementFailed()
	end
end

function core._967:SpineOfDeathwing()
	if rolesPerformed == 4 then
		core:getAchievementSuccess()
	end
end

function core._967:ClearVariables()
	------------------------------------------------------
	---- Warlord Zon'ozz
	------------------------------------------------------
	pingPongCounter = 0

	------------------------------------------------------
	---- Yor'sahj the Unsleepings
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
	------------------------------s------------------------
	hourOfTwilightPlayers = {}

	------------------------------------------------------
	---- Spine Of Deathwing
	------------------------------------------------------
	lastRole = nil
	rolesPerformed = 0
	
	------------------------------------------------------
	---- Deathwing
	------------------------------------------------------
	platformAssualted = false
end

function core._967:InstanceCleanup()
    core._967.Events:UnregisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
end

function core._967:InitialSetup()
    core._967.Events:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
end

core._967.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._967.Events:CHAT_MSG_RAID_BOSS_EMOTE(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss8"].enabled == true then
		if platformAssualted == false then
			if string.match(message, "Ysera") and platformAssualted == false then
				core:sendMessage("'Ysera Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed")
				platformAssualted = true
			elseif string.match(message, "Nozdormu") and platformAssualted == false then
				core:sendMessage("'Nozdormu Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed")
				platformAssualted = true
			elseif string.match(message, "Alexstrasza") and core.platformAssualted == false then
				core:sendMessage("'Alexstrasza Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed")
				platformAssualted = true
			elseif string.match(message, "Kalecgos") and platformAssualted == false then
				core:sendMessage("'Kalecgos Assualted First' part of " .. GetAchievementLink(6180) .. " will be completed once boss is killed")
				platformAssualted = true
			end
		end
	end

	if core.Instances[core.expansion][core.instanceType][core.instance]["boss7"].enabled == true then
		if message == "%s rolls right!" then
			if lastRole == "right" or lastRole == nil then
				rolesPerformed = 0
				core:sendMessage("(This Achievement Can be Attempted Again)")
				C_Timer.After(4, function() 
					core:sendMessage("Roll the boss LEFT now! (" .. rolesPerformed .. "/4)")				
				end)
				lastRole = nil
			elseif lastRole == "left" then
				rolesPerformed = rolesPerformed + 1
				C_Timer.After(4, function() 
					core:sendMessage("Roll the boss LEFT now! (" .. rolesPerformed .. "/4)")				
				end)
				lastRole = "right"
			end
		elseif message == "%s rolls left!" then
			if lastRole == nil then
				rolesPerformed = rolesPerformed + 1
				C_Timer.After(4, function()
					core:sendMessage("Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)")
				end)
				lastRole = "left"
			elseif lastRole == "left" then
				rolesPerformed = 1
				core:sendMessage("(This Achievement Can be Attempted Again)")
				C_Timer.After(4, function() 
					core:sendMessage("Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)")				
				end)
				lastRole = "left"
			elseif lastRole == "right" then
				rolesPerformed = rolesPerformed + 1
				C_Timer.After(4, function() 
					core:sendMessage("Roll the boss RIGHT now! (" .. rolesPerformed .. "/4)")				
				end)				
				lastRole = "left"
			end
		end
	end
end