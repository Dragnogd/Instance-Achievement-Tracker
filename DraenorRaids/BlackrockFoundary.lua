--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Blackrock Foundary Bosses
------------------------------------------------------
core._1205 = {}
core._1205.Events = CreateFrame("Frame")

------------------------------------------------------
---- Blackhand
------------------------------------------------------
local ashCounter = 0

------------------------------------------------------
---- Operator Thogar
------------------------------------------------------
local timerStarted = false

------------------------------------------------------
---- The Iron Maidens
------------------------------------------------------
local bossesDead = 0

------------------------------------------------------
---- Blast Furnace
------------------------------------------------------
local primalElementalistsKilled = 0

------------------------------------------------------
---- Kromog
------------------------------------------------------
local graspingEarthKilled = 0

------------------------------------------------------
---- Beastlord Darmac
------------------------------------------------------
local messageSent = false

------------------------------------------------------
---- Beastlord Darmac
------------------------------------------------------
local oreFound = false

------------------------------------------------------
---- Gruul
------------------------------------------------------
local collectedOreUID = {}
local oreCounter = 0

------------------------------------------------------
---- Oregorger
------------------------------------------------------
local timer = nil

function core._1205:Oregorger()
	--Detect last player to pick up ore
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 163454 and core.achievementsCompleted[1] == false then
		oreFound = true

		if timer ~= nil then
			timer:Cancel()
		end
	end

	--When ore is dropped wait 5 seconds for another player to get orb else faile
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 163454 and core.achievementsCompleted[1] == false then
		oreFound = false
		timer = C_Timer.After(5, function() 
			if oreFound == false then
				if core.achievementsCompleted[1] == false then
					core:getAchievementFailed()
				end
			end
		end)
	end

    --Blizzard Tracker has gone white so achievement completed
    if core:getBlizzardTrackingStatus(8979) == true then
        core:getAchievementSuccess()
    end
end

function core._1205:BeastlordDarmac()
	if (core.sourceID == "76884" or core.sourceID == "76874" or core.sourceID == "76945") and messageSent == false then
		core:sendMessage(core.sourceName .. " Mounted First' part of " .. GetAchievementLink(core.achievementIDs[1]) .. " will be completed once boss is killed")
		messageSent = true	
	end
end

function core._1205:Blackhand()
	if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 163324 then
		ashCounter = ashCounter + 1
		core:sendMessage(core.destName .. " caught Ashes  (" .. ashCounter .. "/20)")					
	end

	if ashCounter >= 20 then
		core:getAchievementSuccess()
	end
end

function core._1205:OperatorThogar()
	if timerStarted == false then
		core:sendMessage("Note: The Toy Train Set Then Wind-Up Train Wrecker need to placed on the first track 8 seconds after the encounter has started.")	
		C_Timer.After(8, function()
			core:sendMessage("Place Your Toy Train Set Then Wind-Up Train Wrecker NOW")								
		end)
		C_Timer.After(25, function()
			if core.achievementsCompleted[1] == false then
				core:sendMessage("Your Toy Train Set Then Wind-Up Train Wrecker were not placed in time. Achievement can still be earned but WIP will not tell you when to place it")
			end									
		end)
		timerStarted = true
	end

	if core.type == "UNIT_DIED" and core.destID == "33404" then
		core:getAchievementSuccess()
	end
end

function core._1205:HansgarFranzok()
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 158140 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
	end
end

function core._1205:FlamebenderKagraz()
	if core.type == "UNIT_DIED" and core.destID == "77337" then
		core:getAchievementFailed()
	end
end

function core._1205:TheIronMaidens()
	if (core.type == "UNIT_DIED") and (core.destID == "77477" or core.destID == "77557" or core.destID == "77231") and timerStarted == false then
		timerStarted = true
		bossesDead = 1
		core:sendMessage("Timer started. 10 seconds remaining to kill bosses")		
		C_Timer.After(10, function()
			if bossesDead ~= 3 and core.inCombat == true then
				core:getAchievementFailedWithMessageAfter("(" .. bossesDead .. "/3)")
			end							
		end)
	elseif (core.type == "UNIT_DIED") and (core.destID == "77477" or core.destID == "77557" or core.destID == "77231") then
		bossesDead = bossesDead + 1
	end
end

function core._1205:BlastFurnace()
	if core.type == "UNIT_DIED" and core.destID == "76815" and core.achievementsFailed[1] == false and core.achievementsCompleted[1] == false then
		primalElementalistsKilled = primalElementalistsKilled + 1
		core:sendMessage("Primal Elementalists killed: (" .. primalElementalistsKilled .. "/4)")
		if timerStarted == false then
			timerStarted = true
			core:sendMessage("Timer Started!")
			C_Timer.After(10, function()
				if primalElementalistsKilled == 4 then
					core:getAchievementSuccess()
				elseif primalElementalistsKilled < 4 then
					core:getAchievementFailedWithMessageAfter("(" .. primalElementalistsKilled .. "/4) Primal Elementalists killed in time")				
				end
			end)
		else
			if primalElementalistsKilled == 4 then
				core:getAchievementSuccess()
			end
		end
	end
end

function core._1205:Kromog()
	if core.type == "UNIT_DIED" and core.destID == "77893" and core.achievementsCompleted[1] == false then
		graspingEarthKilled = graspingEarthKilled + 1
		core:sendMessageDelay("Grasping Earth Hands killed: (" .. graspingEarthKilled .. "/10)", graspingEarthKilled, 2)
		if timerStarted == false then
			timerStarted = true
			core:sendMessage(core:getAchievement() .. " Timer Started! 5 seconds remaining")
			C_Timer.After(5, function()
				if graspingEarthKilled >= 10 then
					core.getAchievementSuccess()
				elseif graspingEarthKilled < 10 then
					core:getAchievementFailed()
					graspingEarthKilled = 0
					timerStarted = false			
				end
			end)
		else
			if graspingEarthKilled >= 10 then
				core:getAchievementSuccess()
			end
		end
	end
end

function core._1205:InstanceCleanup()
    core._1205.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._1205.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1205:InitialSetup()
    core._1205.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._1205.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
	--print(GetSpellInfo(spellID))

	--If collect ore detected. Add 1 to counter, then 2 second cooldown on that user 

    if core.Instances[core.expansion][core.instanceType][core.instance]["boss7"].enabled == true then
		if collectedOreUID[lineID] == nil and spellID == 165184 then
			oreCounter = oreCounter + 1
			collectedOreUID[lineID] = lineID
			core:sendMessage(core:getAchievement() .. " Pristine True Iron Ore Counter (" .. oreCounter .. "/3)")
			if oreCounter == 3 then
				core:getAchievementSuccess()
			end
		end
	end
end

function core._1205:ClearVariables()
	------------------------------------------------------
	---- Blackhand
	------------------------------------------------------
	ashCounter = 0

	------------------------------------------------------
	---- Operator Thogar
	------------------------------------------------------
	timerStarted = false

	------------------------------------------------------
	---- The Iron Maidens
	------------------------------------------------------
	bossesDead = 0

	------------------------------------------------------
	---- Blast Furnace
	------------------------------------------------------
	primalElementalistsKilled = 0

	------------------------------------------------------
	---- Kromog
	------------------------------------------------------
	graspingEarthKilled = 0

	------------------------------------------------------
	---- Beastlord Darmac
	------------------------------------------------------
	messageSent = false

	------------------------------------------------------
	---- Beastlord Darmac
	------------------------------------------------------
	oreFound = false

	------------------------------------------------------
	---- Gruul
	------------------------------------------------------
	collectedOreUID = {}
	oreCounter = 0

	------------------------------------------------------
	---- Oregorger
	------------------------------------------------------
	local timer = nil
end
