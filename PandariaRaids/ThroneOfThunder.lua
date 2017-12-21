--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Throne of Thunder Bosses
------------------------------------------------------
core.ThroneOfThunder = {}

------------------------------------------------------
---- Durumu the Forgotten
------------------------------------------------------
local OrangeFogBeast = false
local GreenFogBeast = false
local PurpleFogBeast = false
local FogBeastCounter = 3

------------------------------------------------------
---- Tortos
------------------------------------------------------
local kickShellCounter = 0
local timerStarted = false

------------------------------------------------------
---- Ji-Kun
------------------------------------------------------
local initalCounterDisplayed = false

------------------------------------------------------
---- Iron-Qon
------------------------------------------------------
local burningCindersFailed = false
local stormCloudFailed = false
local rushingWindsFailed = false
local frozenBloodFailed = false
local frozenSolidFailed = false

------------------------------------------------------
---- IronQon
------------------------------------------------------
local suenHealth = 0

function core.ThroneOfThunder:Horridon()
	core:displayAchievementsToTrackCurrent(8038)

	if core.type == "UNIT_DIED" and core.destID == "69221" and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8038) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.ThroneOfThunder:Tortos()
	core:displayAchievementsToTrackCurrent(8077)

	--Kick Shell Started so start 5 second timer to capture all hits
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 134031 and core.achievementCompleted == false then
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(5, function()
				if kickShellCounter >= 5 then
					SendChatMessage("[WIP] "  .. GetAchievementLink(8077) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementCompleted = true
				else
					SendChatMessage("[WIP] "  .. GetAchievementLink(8077) .. " FAILED! (This achievement can be repeated)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					kickShellCounter = 0						
				end
				timerStarted = false
			end)
		end
	end

	--Shell Concussion
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 136431 and core.destID == "67966" then
		kickShellCounter = kickShellCounter + 1
		SendChatMessage("[WIP] Whirl Turtles Concussion (" .. kickShellCounter .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end
end

function core.ThroneOfThunder:JiKun()
	core:displayAchievementsToTrackCurrent(8097)

	if initalCounterDisplayed == false then
		initalCounterDisplayed = true
		C_Timer.After(10, function()
			SendChatMessage("[WIP] Jump down to the platform now",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end)		
	end

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 139168 and core.achievementCompleted == false then
		--Wait 3 seconds to make sure the player has landed on the platform successfully
		SendChatMessage("[WIP] CATCH " .. core.destName .. " NOW! ",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		C_Timer.After(5, function()
			if core.achievementFailed == false and core.achievementCompleted == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(8077) .. core.destName .. " caught. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementCompleted = true
			end
		end)
	end

	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 139168 and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8097) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.ThroneOfThunder:DurumuTheForgotten()
	core:displayAchievementsToTrackCurrent(8098)

	if core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED" then
		if core.destName == "Orange Fog Beast" and OrangeFogBeast ~= true then
			FogBeastCounter = FogBeastCounter - 1
			SendChatMessage("[WIP] Orange Fog Beast Found! " .. FogBeastCounter .. " Fog Beasts Remaining",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			OrangeFogBeast = true
		elseif core.destName == "Green Fog Beast" and GreenFogBeast ~= true then
			FogBeastCounter = FogBeastCounter - 1
			SendChatMessage("[WIP] Green Fog Beast Found! " .. FogBeastCounter .. " Fog Beasts Remaining",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			GreenFogBeast = true
		elseif core.destName == "Purple Fog Beast" and PurpleFogBeast ~= true then
			FogBeastCounter = FogBeastCounter - 1
			SendChatMessage("[WIP] Purple Fog Beast Found! " .. FogBeastCounter .. " Fog Beasts Remaining",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			PurpleFogBeast = true
		end
	end	

	if FogBeastCounter == 0 and core.achievementCompleted == false then
		core:getAchievementSuccess(8098)
		core.achievementCompleted = true
	end
end

function core.ThroneOfThunder:Primordius()
	core:displayAchievementsToTrackCurrent(8037)

	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED" or core.type == "SPELL_MISSED" or core.type == "SPELL_AURA_APPLIED") and (core.spellId == 140508 or core.spellId == 136185 or core.spellId == 136187 or core.spellId == 136183 or core.spellId == 136181) and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8037) .. " FAILED! (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.ThroneOfThunder:IronQon()
	core:displayAchievementsToTrackCurrent(8087)

	--Burning Cinders
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137668 and burningCindersFailed == false then
		SendChatMessage("[WIP] 'Burning Cinders' part of "  .. GetAchievementLink(8087) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		burningCindersFailed = true
	end

	--Storm Cloud
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137669 and stormCloudFailed == false then
		SendChatMessage("[WIP] 'Storm Cloud' part of "  .. GetAchievementLink(8087) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		stormCloudFailed = true	
	end
	
	--Rushing Winds
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137654 and rushingWindsFailed == false then
		SendChatMessage("[WIP] 'Rushing Winds' part of "  .. GetAchievementLink(8087) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		rushingWindsFailed = true		
	end

	--Frozen Blood
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137664 and frozenBloodFailed == false then
		SendChatMessage("[WIP] 'Frozen Blood' part of "  .. GetAchievementLink(8087) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		frozenBloodFailed = true		
	end

	--Frozen Solid!
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 136892 and frozenSolidFailed == false then
		SendChatMessage("[WIP] 'Frozen Solid!' part of "  .. GetAchievementLink(8087) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		frozenSolidFailed = true	
	end
end

function core.ThroneOfThunder:TwinConsorts()
	core:displayAchievementsToTrackCurrent(8086)

	--Find Suen
	for i = 1, 4 do
		if UnitName("boss" .. i) == "Suen" then
			suenHealth = (UnitHealth("boss" .. i) / UnitHealthMax("boss" .. i)) * 100
		end 
	end

	if core.type == "UNIT_DIED" and core.destID == "68905" and core.achievementFailed == false then
		if suenHealth < 30 then
			SendChatMessage("[WIP] "  .. GetAchievementLink(8086) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementFailed = true			
		end
	end

	--When Lu'lin dies. If suen health is below 30% then achievement has failed

	--Defeat Lu'lin before Suen falls below 30% health
end

function ThroneOfThunder_ClearVariables()
	------------------------------------------------------
	---- Tortos
	------------------------------------------------------
	kickShellCounter = 0
	timerStarted = false

	------------------------------------------------------
	---- Durumu the Forgotten
	------------------------------------------------------
	OrangeFogBeast = false
	GreenFogBeast = false
	PurpleFogBeast = false
	FogBeastCounter = 3

	------------------------------------------------------
	---- Ji-Kun
	------------------------------------------------------
	initalCounterDisplayed = false

	------------------------------------------------------
	---- IronQon
	------------------------------------------------------
	burningCindersFailed = false
	stormCloudFailed = false
	rushingWindsFailed = false
	frozenBloodFailed = false
	frozenSolidFailed = false

	------------------------------------------------------
	---- IronQon
	------------------------------------------------------
	LulinKilled = false
end