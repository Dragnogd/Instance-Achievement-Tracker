--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Mogu'shan Vaults
------------------------------------------------------
core._1008 = {}

------------------------------------------------------
---- Feng The Accursed
------------------------------------------------------
local EpicenterReversed = false
local WildfireSparkReversed = false
local ArcaneResonanceReversed = false
local LightningFistsReversed = false
local ArcaneVelocityReversed = false
local itemsReversed = 0

------------------------------------------------------
---- Elegon
------------------------------------------------------
local empyrealFocusesDeactivated = 0
local energyChargeKilled = false

------------------------------------------------------
---- Will of The Emperor
------------------------------------------------------
local playerExecutedStrike = 0
local playersFailCounter = {}
local timerStarted = false

function core._1008:FengTheAccursed()
	if core.type == "SPELL_AURA_APPLIED" then
		if core.spellId == 116936 and EpicenterReversed == false then
			EpicenterReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Epicenter Reversed (" .. itemsReversed .. "/5)")
		elseif core.spellId == 118307 and WildfireSparkReversed == false then
			WildfireSparkReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("WildfireSpark Reversed (" .. itemsReversed .. "/5)")
		elseif core.spellId == 118194 and ArcaneResonanceReversed == false then
			ArcaneResonanceReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Arcane Resonance Reversed (" .. itemsReversed .. "/5)")
		elseif core.spellId == 115730 and LightningFistsReversed == false then
			LightningFistsReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Lightning Fists Reversed (" .. itemsReversed .. "/5)")
		end
	elseif core.type == "SPELL_CAST_SUCCESS" then
		if core.spellId == 116938 and ArcaneVelocityReversed == false then
			ArcaneVelocityReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Arcane Velocity Reversed (" .. itemsReversed .. "/5)")
		end
	end

	if itemsReversed == 5 then
		core:getAchievementSuccess()
	end
end

function core._1008:Elegon()
	if core.type == "UNIT_DIED" and core.destID == "60913" then
		energyChargeKilled = true
	end

	if core.type == "SPELL_CAST_SUCCESS" and core.sourceID == "60776" and core.spellId == 116989 and energyChargeKilled == false then
		empyrealFocusesDeactivated = empyrealFocusesDeactivated + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(10, function() 
				if empyrealFocusesDeactivated == 6 then
					core:getAchievementSuccess()
				else
					core:getAchievementFailedWithMessageAfter("(" .. empyrealFocusesDeactivated .. "/" .. ") Empyreal Focuses Deactivated in time")
				end
			end)
		else
			if empyrealFocusesDeactivated == 6 then
				core:getAchievementSuccess()
			end
		end
	end
end

function _1008_TheSpiritKings()
	--If boss has cast pillage start timer
	--If user dances and timer has started add to array and user is not already in the array
	--If player gets pillaged add to another array
	--Compare 2 arrays once timer has finished. If they dance at the correct time and got hit by pillaged at the end they executed the move at the correct time
	--Announce in chat who did not dance in time.
end

function core._1008:ClearVariables()
	------------------------------------------------------
	---- Feng The Accursed
	------------------------------------------------------
	EpicenterReversed = false
	WildfireSparkReversed = false
	ArcaneResonanceReversed = false
	ArcaneVelocityReversed = false
	LightningFistsReversed = false
	itemsReversed = 0

	------------------------------------------------------
	---- Elegon
	------------------------------------------------------
	empyrealFocusesDeactivated = 0
	energyChargeKilled = false

	------------------------------------------------------
	---- Will of The Emperor
	------------------------------------------------------
	playerExecutedStrike = 0
	timerStarted = false
end

--Show Me Your Moves
--When Boss casts first ability, Reset all counters
--If player gets hits then fail achievement
--Track how many times each player has failed achievement
--Check how many players executed opportunistic strike on boss
--If counter equals 10 or 25 then complete achievement

function core._1008:WillOfTheEmperor()
	--Hit by Devestating Arc
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 116835 then
		if playersFailCounter[core.destName] == nil then
			playersFailCounter[core.destName] = 1
		else
			playersFailCounter[core.destName] = playersFailCounter[core.destName] + 1
		end
		core:sendMessage(core.destName .. " hit by Devestating Arc (" .. playersFailCounter[core.destName] .. ")")
	end

	--Hit by Stomp
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 116969 then
		if playersFailCounter[core.destName] == nil then
			playersFailCounter[core.destName] = 1
		else
			playersFailCounter[core.destName] = playersFailCounter[core.destName] + 1
		end
		core:sendMessage(core.destName .. " hit by Stomp (" .. playersFailCounter[core.destName] .. ")")
	end

	--Executed opportunistic strike
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 116809 then
		playerExecutedStrike = playerExecutedStrike + 1
		if timerStarted == false then
			timerStarted = true

			C_Timer.After(10, function() 
				if playerExecutedStrike == core.maxPlayers then
					--core:sendMessage(core:getAchievement() .. " (" .. playerExecutedStrike .. "/" .. core.maxPlayers .. ") Opportunistic Strikes executed in time")					
					core:getAchievementSuccess()
				else
					core:sendMessage(core:getAchievement() .. " (" .. playerExecutedStrike .. "/" .. core.maxPlayers .. ") Opportunistic Strikes executed in time")
				end
	
				playerExecutedStrike = 0
				timerStarted = false
			end)
		else
			if playerExecutedStrike == core.maxPlayers then					
				core:getAchievementSuccess()
			end			
		end
	end
end