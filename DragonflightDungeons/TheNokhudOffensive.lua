--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- The Nokhud Offensive Bosses
------------------------------------------------------
core._2516 = {}

------------------------------------------------------
---- Teera and Maruuk
------------------------------------------------------
local teeraAndMaruukKilled = false

function core._2516:RagingTempest()
	--Defeat the Raging Tempest after striking a single player with 5 Lightning Strikes simultaneously and defeating a Storm Elemental in The Nokhud Offensive on Mythic difficulty.

	--TODO: Announce when Storm Elemental has spawned

	if core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 382628 then
			--TODO: Announce stacks of Storm Surge on player
	end

	if core:getBlizzardTrackingStatus(16447, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2516:TeeraAndMaruuk()
	--Defeat Teera and Maruuk while holding the Spear of Tolui, War Axe of Berke, and Bow of Sartaq in The Nokhud Offensive on Mythic difficulty.

	--TODO: Announce which player has which weapon

	if core.type == "UNIT_DIED" and (core.destID == "186339" or core.destID == "186338") then
        teeraAndMaruukKilled = true
    end

	if core:getBlizzardTrackingStatus(16456, 1) == false and teeraAndMaruukKilled == false then
		core:getAchievementFailed()
	end
end

function core._2516:BalakarKhan()
	--Defeat Balakar Khan after healing Ohn'ahra to full health in The Nokhud Offensive on Mythic difficulty.

	if core:getBlizzardTrackingStatus(16602, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2516:ClearVariables()
	------------------------------------------------------
	---- Teera and Maruuk
	------------------------------------------------------
	teeraAndMaruukKilled = false
end

