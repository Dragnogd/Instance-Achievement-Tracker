--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Mogu'shan Vaults
------------------------------------------------------
core.MogushanVaults = {}

------------------------------------------------------
---- Feng The Accursed
------------------------------------------------------
local EpicenterReversed = false
local WildfireSparkReversed = false
local ArcaneResonanceReversed = false
local LightningFistsReversed = false
local ArcaneVelocityReversed = false
local itemsReversed = 0

function core.MogushanVaults:FengTheAccursed()
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

function MogushanVaults_TheSpiritKings()
	--If boss has cast pillage start timer

	--If user dances and timer has started add to array and user is not already in the array

	--If player gets pillaged add to another array

	--Compare 2 arrays once timer has finished. If they dance at the correct time and got hit by pillaged at the end they executed the move at the correct time

	--Announce in chat who did not dance in time.
end

function core.MogushanVaults:ClearVariables()
	------------------------------------------------------
	---- Feng The Accursed
	------------------------------------------------------
	EpicenterReversed = false
	WildfireSparkReversed = false
	ArcaneResonanceReversed = false
	ArcaneVelocityReversed = false
	LightningFistsReversed = false
	itemsReversed = 0
end