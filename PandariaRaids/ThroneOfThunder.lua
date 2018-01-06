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
	if core.type == "UNIT_DIED" and core.destID == "69221" then
		core:getAchievementFailed()
	end
end

function core.ThroneOfThunder:Tortos()
	--Kick Shell Started so start 5 second timer to capture all hits
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 134031 and core.achievementsCompleted[1] == false then
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(5, function()
				if kickShellCounter >= 5 then
					core:getAchievementSuccess()
				else
					core:getAchievementFailedWithMessageAfter("(This achievement can be repeated)")
					kickShellCounter = 0						
				end
				timerStarted = false
			end)
		end
	end

	--Shell Concussion
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 136431 and core.destID == "67966" then
		kickShellCounter = kickShellCounter + 1
		core:sendMessage("Whirl Turtles Concussion (" .. kickShellCounter .. "/5)")
	end
end

function core.ThroneOfThunder:JiKun()
	if initalCounterDisplayed == false then
		initalCounterDisplayed = true
		C_Timer.After(10, function()
			core:sendMessage("Jump down to the platform now")
		end)		
	end

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 139168 and core.achievementsCompleted[1] == false then
		--Wait 3 seconds to make sure the player has landed on the platform successfully
		core:sendMessage("CATCH " .. core.destName .. " NOW! ")
		C_Timer.After(5, function()
			if core.achievementsFailed[1] == false then
				core:getAchievementSuccessWithCustomMessage("", core.destName .. " caught. Boss can now be killed!")
			end
		end)
	end

	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 139168 then
		core:getAchievementFailed()
	end
end

function core.ThroneOfThunder:DurumuTheForgotten()
	if core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED" then
		if core.destName == "Orange Fog Beast" and OrangeFogBeast ~= true then
			FogBeastCounter = FogBeastCounter - 1
			core:sendMessage("Orange Fog Beast Found! " .. FogBeastCounter .. " Fog Beasts Remaining")
			OrangeFogBeast = true
		elseif core.destName == "Green Fog Beast" and GreenFogBeast ~= true then
			FogBeastCounter = FogBeastCounter - 1
			core:sendMessage("Green Fog Beast Found! " .. FogBeastCounter .. " Fog Beasts Remaining")
			GreenFogBeast = true
		elseif core.destName == "Purple Fog Beast" and PurpleFogBeast ~= true then
			FogBeastCounter = FogBeastCounter - 1
			core:sendMessage("Purple Fog Beast Found! " .. FogBeastCounter .. " Fog Beasts Remaining")
			PurpleFogBeast = true
		end
	end	

	if FogBeastCounter == 0 then
		core:getAchievementSuccess()
	end
end

function core.ThroneOfThunder:Primordius()
	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED" or core.type == "SPELL_MISSED" or core.type == "SPELL_AURA_APPLIED") and (core.spellId == 140508 or core.spellId == 136185 or core.spellId == 136187 or core.spellId == 136183 or core.spellId == 136181) then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
	end
end

function core.ThroneOfThunder:IronQon()
	--Burning Cinders
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137668 and burningCindersFailed == false then
		core:sendMessage("'Burning Cinders' part of "  .. GetAchievementLink(core.achievementIDs[1]) .. " FAILED! by (" .. core.destName .. ")")
		burningCindersFailed = true
	end

	--Storm Cloud
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137669 and stormCloudFailed == false then
		core:sendMessage("'Storm Cloud' part of "  .. GetAchievementLink(core.achievementIDs[1]) .. " FAILED! by (" .. core.destName .. ")")
		stormCloudFailed = true	
	end
	
	--Rushing Winds
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137654 and rushingWindsFailed == false then
		core:sendMessage("'Rushing Winds' part of "  .. GetAchievementLink(core.achievementIDs[1]) .. " FAILED! by (" .. core.destName .. ")")
		rushingWindsFailed = true		
	end

	--Frozen Blood
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 137664 and frozenBloodFailed == false then
		core:sendMessage("'Frozen Blood' part of "  .. GetAchievementLink(core.achievementIDs[1]) .. " FAILED! by (" .. core.destName .. ")")
		frozenBloodFailed = true		
	end

	--Frozen Solid!
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 136892 and frozenSolidFailed == false then
		core:sendMessage("'Frozen Solid!' part of "  .. GetAchievementLink(core.achievementIDs[1]) .. " FAILED! by (" .. core.destName .. ")")
		frozenSolidFailed = true	
	end
end

function core.ThroneOfThunder:TwinConsorts()
	-- --Find Suen
	-- for i = 1, 4 do
	-- 	if UnitName("boss" .. i) == "Suen" then
	-- 		suenHealth = (UnitHealth("boss" .. i) / UnitHealthMax("boss" .. i)) * 100
	-- 	end 
	-- end

	-- if core.type == "UNIT_DIED" and core.destID == "68905" and core.achievementFailed == false then
	-- 	if suenHealth < 30 then
	-- 		SendChatMessage("[WIP] "  .. GetAchievementLink(8086) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	-- 		core.achievementFailed = true			
	-- 	end
	-- end

	--When Lu'lin dies. If suen health is below 30% then achievement has failed

	--Defeat Lu'lin before Suen falls below 30% health
end

function core.ThroneOfThunder:ClearVariables()
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