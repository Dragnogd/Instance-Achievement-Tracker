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
---- Vexamus
------------------------------------------------------
local playerFailedAchievement = nil

------------------------------------------------------
---- Overgrown Ancient
------------------------------------------------------
local wellFedDucklingCounter = 0
local wellFedDucklingUID = {}
local overgrownAncientKilled = false
local ducklingCheck = false

function core._2526:Vexamus()
	--Defeat Vexamus without players absorbing any Arcane Orbs in Algeth'ar Academy on Mythic Difficulty.
	if core.type == "SPELL_ABSORBED" and core.spellId == 385981 then
		if core.destName ~= nil then
			playerFailedAchievement = core.destName
		end
	end

   	if core:getBlizzardTrackingStatus(16434, 1) == false then
		if playerFailedAchievement ~= nil then
			core:getAchievementFailedWithMessageAfter("(" .. playerFailedAchievement .. ")")
		else
			core:getAchievementFailed()
		end
	end
end

function core._2526:OvergrownAncient()
    --Defeat the Overgrown Ancient while all party members have a Well-Fed Duckling on their head in Algeth'ar Academy on Mythic difficulty.

	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],wellFedDucklingCounter,core.groupSize)

	--Check if all players have got the Duckling
    if ducklingCheck == false then
        ducklingCheck = true

        local playersWithoutBuff = ""
        local playersFailed = false

		for player,status in pairs(core.InfoFrame_PlayersTable) do
			local debuffFound = false
			for i=1,40 do
				local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(player, i)
				if spellId == 392005 then
					debuffFound = true
				end
			end
			if debuffFound == false then
				playersWithoutBuff = playersWithoutBuff .. player .. ", "
				playersFailed = true
				InfoFrame_SetPlayerFailed(player)
			else
				InfoFrame_SetPlayerComplete(player)
				heraldOfTheCosmosCounter = heraldOfTheCosmosCounter + 1
			end
		end

		if playersFailed == true then
			core:getAchievementFailed()
			core:sendMessageSafe(playersWithoutBuff,nil,true)
		end
    end

	if core.type == "UNIT_DIED" and core.destID == "196482" then
        overgrownAncientKilled = true
    end

	if overgrownAncientKilled == false then
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

	if core:getBlizzardTrackingStatus(16441, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2526:ClearVariables()
	------------------------------------------------------
	---- Vexamus
	------------------------------------------------------
	playerFailedAchievement = nil

    ------------------------------------------------------
    ---- Overgrown Ancient
    ------------------------------------------------------
    wellFedDucklingCounter = 0
    wellFedDucklingUID = {}
    overgrownAncientKilled = false
	ducklingCheck = false
end