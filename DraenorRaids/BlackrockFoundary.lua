--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Blackrock Foundary Bosses
------------------------------------------------------
core.BlackrockFoundary = {}

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

function core.BlackrockFoundary:BeastlordDarmac()
	if (core.sourceID == "76884" or core.sourceID == "76874" or core.sourceID == "76945") then
		core:getAchievementSuccessWithCustomMessage(core.sourceName .. " Mounted First' part of " .. GetAchievementLink(core.currentAchievementID) .. " will be completed once boss is killed")	
	end
end

function core.BlackrockFoundary:Blackhand()
	if core.type == "SPELL_AURA_APPLIED" and core.spellName == "Ashes" then
		ashCounter = ashCounter + 1
		core:sendMessage(core.destName .. " caught Ashes  (" .. ashCounter .. "/20)")					
	end

	if ashCounter >= 20 then
		core:getAchievementSuccess()
	end
end

function core.BlackrockFoundary:OperatorThogar()
	if timerStarted == false then
		core:sendMessage("Note: The Toy Train Set Then Wind-Up Train Wrecker need to placed on the first track 8 seconds after the encounter has started.")	
		C_Timer.After(8, function()
			core:sendMessage("Place Your Toy Train Set Then Wind-Up Train Wrecker NOW")								
		end)
		C_Timer.After(25, function()
			if core.achievementCompleted == false then
				core:sendMessage("Your Toy Train Set Then Wind-Up Train Wrecker were not placed in time. Achievement can still be earned but WIP will not tell you when to place it")
			end									
		end)
		timerStarted = true
	end

	if core.type == "UNIT_DIED" and core.destID == "33404" then
		core:getAchievementSuccess()
	end
end

function core.BlackrockFoundary:HansgarFranzok()
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 158140 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
	end
end

function core.BlackrockFoundary:FlamebenderKagraz()
	if core.type == "UNIT_DIED" and core.destID == "77337" then
		core:getAchievementFailed()
	end
end

function core.BlackrockFoundary:TheIronMaidens()
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

function core.BlackrockFoundary:BlastFurnace()
	if core.type == "UNIT_DIED" and core.destID == "76815" and core.achievementFailed == false and core.achievementCompleted == false then
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
		end
	end
end

function core.BlackrockFoundary:Kromog()
	if core.type == "UNIT_DIED" and core.destID == "77893" and core.achievementFailed == false and core.achievementCompleted == false then
		graspingEarthKilled = graspingEarthKilled + 1
		core:sendMessage("Grasping Earth Hands killed: (" .. graspingEarthKilled .. "/10)")
		if timerStarted == false then
			timerStarted = true
			core:sendMessage("Timer Started!")
			C_Timer.After(5, function()
				if graspingEarthKilled >= 10 then
					core.getAchievementSuccess()
				elseif graspingEarthKilled < 10 then
					core.getAchievementFailedWithMessageAfter("(" .. graspingEarthKilled .. "/10) Grasping Earth Hands killed in time")			
				end
			end)
		end
	end
end

function core.BlackrockFoundary:ClearVariables()
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
end
