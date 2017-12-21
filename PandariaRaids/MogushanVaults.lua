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
	core:displayAchievementsToTrackCurrent(6674)

	if core.type == "SPELL_AURA_APPLIED" then
		if core.spellId == 116936 and EpicenterReversed == false then
			EpicenterReversed = true
			itemsReversed = itemsReversed + 1
			SendChatMessage("[WIP] Epicenter Reversed (" .. itemsReversed .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		elseif core.spellId == 118307 and WildfireSparkReversed == false then
			WildfireSparkReversed = true
			itemsReversed = itemsReversed + 1
			SendChatMessage("[WIP] WildfireSpark Reversed (" .. itemsReversed .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		elseif core.spellId == 118194 and ArcaneResonanceReversed == false then
			ArcaneResonanceReversed = true
			itemsReversed = itemsReversed + 1
			SendChatMessage("[WIP] Arcane Resonance Reversed (" .. itemsReversed .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		elseif core.spellId == 115730 and LightningFistsReversed == false then
			LightningFistsReversed = true
			itemsReversed = itemsReversed + 1
			SendChatMessage("[WIP] Lightning Fists Reversed (" .. itemsReversed .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
	elseif core.type == "SPELL_CAST_SUCCESS" then
		if core.spellId == 116938 and ArcaneVelocityReversed == false then
			ArcaneVelocityReversed = true
			itemsReversed = itemsReversed + 1
			SendChatMessage("[WIP] Arcane Velocity Reversed (" .. itemsReversed .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
	end

	if itemsReversed == 5 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(6674) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end
end

function MogushanVaults_TheSpiritKings()
	--If boss has cast pillage start timer

	--If user dances and timer has started add to array and user is not already in the array

	--If player gets pillaged add to another array

	--Compare 2 arrays once timer has finished. If they dance at the correct time and got hit by pillaged at the end they executed the move at the correct time

	--Announce in chat who did not dance in time.
end

function MogushanVaults_ClearVariables()
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