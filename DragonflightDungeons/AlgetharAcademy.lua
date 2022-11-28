--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Algeth'ar Academy Bosses
------------------------------------------------------
core._2526 = {}

------------------------------------------------------
---- Overgrown Ancient
------------------------------------------------------
local wellFedDucklingCounter = 0
local wellFedDucklingUID = {}
local overgrownAncientKilled = false

function core._2526:Vexamus()
   --Defeat Vexamus without players absorbing any Arcane Orbs in Algeth'ar Academy on Mythic Difficulty.
end

function core._2526:OvergrownAncient()
    --Defeat the Overgrown Ancient while all party members have a Well-Fed Duckling on their head in Algeth'ar Academy on Mythic difficulty.

	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],wellFedDucklingCounter,core.groupSize)

	if core.type == "UNIT_DIED" and core.destID == "196482" then
        overgrownAncientKilled = true
    end

	if overgrownAncientKilled == false then
		--Player has gained Well-Fed Duckling
		if core.type == "SPELL_AURA_APPLIED" and core.spellId == 392005 then
			if core.destName ~= nil and wellFedDucklingUID[core.spawn_uid_dest_Player] == nil then
				wellFedDucklingCounter = wellFedDucklingCounter + 1
				wellFedDucklingUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
				core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(392005) .. " (" .. wellFedDucklingCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerComplete(core.destName)
			end
		end

		if core.type == "SPELL_AURA_REMOVED" and core.spellId == 392005 then
			if core.destName ~= nil and wellFedDucklingUID[core.spawn_uid_dest_Player] ~= nil then
				wellFedDucklingCounter = wellFedDucklingCounter - 1
				wellFedDucklingUID[core.spawn_uid_dest_Player] = nil
				core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(392005) .. " (" .. wellFedDucklingCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerFailed(core.destName)
			end
		end

		--Announce success once everyone has had the debuff at some point during the fight
		if wellFedDucklingCounter == core.groupSize then
			core:getAchievementSuccess()
			core.achievementsFailed[1] = false
		end

		--Announce fail if player looses debuff after criteria has been met
		if core.achievementsCompleted[1] == true and wellFedDucklingCounter ~= core.groupSize then
			core:getAchievementFailed()
			core.achievementsCompleted[1] = false
		end
	end
end

function core._2526:Crawth()
    --Defeat Crawth after simultaneously activating both Goals in Algeth'ar Academy on Mythic difficulty.
end

function core._2526:ClearVariables()
    ------------------------------------------------------
    ---- Overgrown Ancient
    ------------------------------------------------------
    wellFedDucklingCounter = 0
    wellFedDucklingUID = {}
    overgrownAncientKilled = false
end