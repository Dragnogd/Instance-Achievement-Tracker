--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Throne of Thunder Bosses
------------------------------------------------------
core._1098 = {}
core._1098.Events = CreateFrame("Frame")

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
---- Megaera
------------------------------------------------------
local frozenHeadKilled = false
local flamingHeadKilled = false
local venmousHeadKilled = false
local megaeraKilled = false

------------------------------------------------------
---- Ji-Kun
------------------------------------------------------
local initalCounterDisplayed = false
local eggCaught = false

------------------------------------------------------
---- Iron-Qon
------------------------------------------------------
local burningCindersFailed = false
local stormCloudFailed = false
local rushingWindsFailed = false
local frozenBloodFailed = false
local frozenSolidFailed = false

------------------------------------------------------
---- Twin Consorts
------------------------------------------------------
local lulinKilled = false

function core._1098:Horridon()
	if core.type == "UNIT_DIED" and core.destID == "69221" then
		core:getAchievementFailed()
	end
end

function core._1098:Tortos()
	--Kick Shell Started so start 5 second timer to capture all hits
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 134031 and core.achievementsCompleted[1] == false then
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(5, function()
				if kickShellCounter >= 5 then
					core:getAchievementSuccess()
				else
					core:sendMessage(core:getAchievement() .. "FAILED! (" .. kickShellCounter .. "/5) Killed in time. This acheivement can be repeated")
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

function core._1098:Megaera()
	if core.type == "UNIT_DIED" and core.destID == "68065" then
		megaeraKilled = true
	end

	if megaeraKilled == false then
		if core.type == "UNIT_DIED" and core.destID == "70235" then
			frozenHeadKilled = true
		elseif core.type == "UNIT_DIED" and core.destID == "70212" then
			flamingHeadKilled = true
		elseif core.type == "UNIT_DIED" and core.destID == "70247" then
			venmousHeadKilled = true
		end
	
		if frozenHeadKilled == true and flamingHeadKilled == true and venmousHeadKilled == true then
			core:getAchievementFailed()
		elseif frozenHeadKilled == true and flamingHeadKilled == true then
			core:getAchievementSuccessWithCustomMessage("'Venomous part of'", "will be completed once encounter is completed")
		elseif venmousHeadKilled == true and flamingHeadKilled == true then
			core:getAchievementSuccessWithCustomMessage("'Frozen part of'", "will be completed once encounter is completed")
		elseif frozenHeadKilled == true and venmousHeadKilled == true then	
			core:getAchievementSuccessWithCustomMessage("'Flaming part of'", "will be completed once encounter is completed")
		end
	end
end

function core._1098:JiKun()
	if initalCounterDisplayed == false then
		initalCounterDisplayed = true
		C_Timer.After(10, function()
			core:sendMessage("Jump down to the platform now")
		end)		
	end

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 139168 and core.achievementsCompleted[1] == false then
		--Wait 3 seconds to make sure the player has landed on the platform successfully
		core:sendMessage("CATCH " .. core.destName .. " NOW! ")
		eggCaught = true
		C_Timer.After(5, function()
			if core.achievementsFailed[1] == false then
				core:getAchievementSuccessWithCustomMessage("", core.destName .. " caught. Boss can now be killed!")
			end
		end)
	end

	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 139168 then
		core:getAchievementFailed()
	end

	--If egg has not been caught after 30 seconds then fail achievement
	C_Timer.After(30, function()
		if core.achievementsFailed[1] == false and core.achievementsCompleted[1] == false and eggCaught == false then
			core:getAchievementFailed()
		end
	end)
end

function core._1098:DurumuTheForgotten()
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

function core._1098:Primordius()
	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED" or core.type == "SPELL_MISSED" or core.type == "SPELL_AURA_APPLIED") and (core.spellId == 140508 or core.spellId == 136185 or core.spellId == 136187 or core.spellId == 136183 or core.spellId == 136181) then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
	end
end

function core._1098:IronQon()
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

function core._1098:TwinConsorts()
	if core.type == "UNIT_DIED" and core.destID == "68905" then
		lulinKilled = true
	end
end

function core._1098:ClearVariables()
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
	eggCaught = false

	------------------------------------------------------
	---- Megaera
	------------------------------------------------------
	frozenHeadKilled = false
	flamingHeadKilled = false
	venmousHeadKilled = false

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
	lulinKilled = false
end

function core._1098:InstanceCleanup()
    core._1098.Events:UnregisterEvent("UNIT_HEALTH")
    core._1098.Events:UnregisterEvent("UNIT_POWER_UPDATE")
end

function core._1098:InitialSetup()
	core._1098.Events:RegisterEvent("UNIT_HEALTH")
	core._1098.Events:RegisterEvent("UNIT_POWER_UPDATE")
end

core._1098.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1098.Events:UNIT_HEALTH(self, UnitID)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss11"].enabled == true then
		if UnitName(UnitID) == "Suen" then
			if core:getHealthPercent(UnitID) < 30 then		
				if lulinKilled == false then
					core:getAchievementFailed()
				end
			end	
		end	
	end
end

function core._1098.Events:UNIT_POWER_UPDATE(self, UnitID, powerType)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss12"].enabled == true then
		if UnitIsPlayer(UnitID) == false then
			if UnitPower(UnitID, ALTERNATE_POWER_INDEX) == 3 then
				core:getAchievementSuccessWithCustomMessage(UnitName(UnitID) .. " Disabled First part of","will be completed once boss is killed")
			end
		end
	end
end

