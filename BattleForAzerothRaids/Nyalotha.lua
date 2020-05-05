--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Ny’alotha
------------------------------------------------------
core._2217 = {}
core._2217.Events = CreateFrame("Frame")

------------------------------------------------------
---- Drest'agath
------------------------------------------------------
local initialTime = nil
local secondTime = nil

------------------------------------------------------
---- N'Zoth, the Corruptor
------------------------------------------------------
local giftOfNZothCounter = 0
local giftOfNZothUID = {}

------------------------------------------------------
---- Shad'har the Insatiable
------------------------------------------------------
local initialScan = false
local bittenHandCounter = 0
local bittenHandUID = {}
local shadharKilled = false

------------------------------------------------------
---- Prophet Skitra
------------------------------------------------------
local disciplesKilled = 0
local disciplesUID = {}

------------------------------------------------------
---- Hivemind
------------------------------------------------------
local evolvedSpecimenKilled = 0

------------------------------------------------------
---- Dark Inquisitor Xanesh
------------------------------------------------------
local voidOrbCounter = 0
local voidWokenExpirationTime = nil
local voidWokenBlock = false

------------------------------------------------------
---- Vexiona
------------------------------------------------------
local playerAnnihilationStacks = {}
local inititalVexionaSetup = false
local playersWithThirtyStacks = 0
local updateRequired = false
local lockInfoFrameUpdate = false

------------------------------------------------------
---- Carapace of N'Zoth
------------------------------------------------------
local synthesisStacks = 0
local carapaceTimerStarted = false
local blockCounter = false

------------------------------------------------------
---- Maut
------------------------------------------------------
local forbiddenManifestationSpawned = false

function core._2217:WrathionTheBlackEmperor()
	--Defeat Wrathion in Ny'alotha, the Waking City after defeating 10 Crackling Shards within 3 seconds of each other on Normal difficulty or higher.
	if core:getBlizzardTrackingStatus(14019) == true then
        core:getAchievementSuccess()
    end
end

function core._2217:ProphetSkitra()
	--Defeat the Prophet Skitra in Ny'alotha, the Waking City after defeating three Disciples of the Prophet on Normal difficulty or higher.
	if core.destID == "161935" or core.destID == "161573" then
		if core.type == "UNIT_DIED" then
			if disciplesUID[core.spawn_uid_dest] == nil then
				disciplesUID[core.spawn_uid_dest] = core.spawn_uid_dest
				disciplesKilled = disciplesKilled + 1
				core:sendMessage(core:getAchievement() .. " " .. getNPCName(161573) .. " " .. L["Shared_Killed"] .. " (" .. disciplesKilled .. "/3)",true)
			end
		elseif core.overkill ~= nil then
			if core.overkill > 0 then
				if disciplesUID[core.spawn_uid_dest] == nil then
					disciplesUID[core.spawn_uid_dest] = core.spawn_uid_dest
					disciplesKilled = disciplesKilled + 1
					core:sendMessage(core:getAchievement() .. " " .. getNPCName(161573) .. " " .. L["Shared_Killed"] .. " (" .. disciplesKilled .. "/3)",true)
				end
			end
		end
	end

	if disciplesKilled >= 3 then
		core:getAchievementSuccess()
	end
end

function core._2217:Hivemind()
	--Defeat the Hivemind in Ny'alotha, the Waking City after defeating 3 Evolved Specimen on Normal difficulty or higher.
	if core.type == "UNIT_DIED" and (core.destID == "161414" or core.destID == "161369" or core.destID == "161413" or core.destID == "162676") then
		evolvedSpecimenKilled = evolvedSpecimenKilled + 1
		core:sendMessage(core:getAchievement() .. " " .. getNPCName(161414) .. " " .. L["Shared_Killed"] .. " (" .. evolvedSpecimenKilled .. "/3)",true)
	end 

	if evolvedSpecimenKilled >= 3 then
		core:getAchievementSuccess()
	end
end

function core._2217:DarkInquisitorXanesh()
	--Defeat Dark Inquisitor Xanesh in Ny'alotha, the Waking City after safely eliminating a Void Orb with less than 3 seconds remaining on Voidwoken 3 times on Normal difficulty or higher.

	--Players who get Voidwoken Debuff
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 312406 then --312406
		core:sendDebugMessage("Detected Voidwoken Debuff Gained")
		if core.destName ~= nil then
			core:sendDebugMessage("Detected Voidwoken Debuff Gained on " .. core.destName)
			--Set the voidwoken debuff expiration time
			for i=1,40 do
				local _, _, _, _, _, expirationTime, _, _, _, spellId = UnitDebuff(core.destName, i)
				if spellId == 312406 then --312406 --8936
					if expirationTime > 0 then
						core:sendDebugMessage("Expiration time is " .. expirationTime)
						voidWokenExpirationTime = expirationTime			
					end
				end
			end
		end
	end

	--Players who loose Voidwoken Debuff
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 312406 then --312406
		core:sendDebugMessage("Detected Voidwoken Debuff Lost")
		if core.destName ~= nil then
			core:sendDebugMessage("Detected Voidwoken Debuff Lost on " .. core.destName)
			--Check if the player is alive
			if UnitIsDead(core.destName) == false then
				core:sendDebugMessage(core.destName .. " is alive")
				--Player has lost the buff. Lets check if they lost it within the time window
				if voidWokenExpirationTime ~= nil then
					core:sendDebugMessage("Expiration time is " .. voidWokenExpirationTime)
					if (voidWokenExpirationTime - GetTime() < 3) and (voidWokenExpirationTime - GetTime() > 0) then
						core:sendDebugMessage("Expiration time is within limit")
						if voidWokenBlock == false then
							voidWokenBlock = true
							voidOrbCounter = voidOrbCounter + 1
							core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(264908) .. " " .. L["Core_Counter"] .. " (" .. voidOrbCounter .. "/3)",true)
						end
					else
						core:sendDebugMessage("FAILED")
					end
	
					--This stops couter incrementing by 3 each time an orb is returned
					C_Timer.After(5, function() 
						core:sendDebugMessage("Unblocking voidWokenBlock")
						voidWokenBlock = false
					end)
				end
			end
		end
	end

	if voidOrbCounter >= 3 then
		core:getAchievementSuccess()
	end
end

function core._2217:DrestAgath()
	--Defeat Drest'agath after triggering Throes of Agony twice within 60 seconds, on Normal difficulty or higher.
	if core:getBlizzardTrackingStatus(14026) == true then
        core:getAchievementSuccess()
	end
	
	if core.achievementsCompleted[1] == false then
		--Temper Tantrum cast. Set initial timer
		if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 308941 and initialTime == nil then
			initialTime = GetTime()
		elseif core.type == "SPELL_CAST_SUCCESS" and core.spellId == 308941 and initialTime ~= nil then
			secondTime = GetTime()
			core:sendMessage(core:getAchievement() .. format(L["TimeBetweenLast"],GetSpellLink(308947), core:roundNumber(secondTime - initialTime)),true)
			initialTime = secondTime
			secondTime = nil
		end
	end
end

function core._2217:ShadharTheInsatiable()
	--Defeat Shad'har the Insatiable in Ny'alotha, the Waking City after having everyone /pet him on Normal difficulty or higher.
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],bittenHandCounter,core.groupSize)

	if core.type == "UNIT_DIED" and core.destID == "157231" then
        shadharKilled = true
    end

	if shadharKilled == false then
		--Player has gained Bitten Hand
		if core.type == "SPELL_AURA_APPLIED" and core.spellId == 312590 then
			if core.destName ~= nil and bittenHandUID[core.spawn_uid_dest_Player] == nil then
				bittenHandCounter = bittenHandCounter + 1
				bittenHandUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
				core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(312590) .. " (" .. bittenHandCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerComplete(core.destName)
			end
		end

		if core.type == "SPELL_AURA_REMOVED" and core.spellId == 312590 then
			if core.destName ~= nil and bittenHandUID[core.spawn_uid_dest_Player] ~= nil then
				bittenHandCounter = bittenHandCounter - 1
				bittenHandUID[core.spawn_uid_dest_Player] = nil
				core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(312590) .. " (" .. bittenHandCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerFailed(core.destName)
			end
		end

		--Announce success once everyone has had the debuff at some point during the fight
		if bittenHandCounter == core.groupSize then
			core:getAchievementSuccess()
			core.achievementsFailed[1] = false
		end

		--Announce fail if player looses debuff after criteria has been met
		if core.achievementsCompleted[1] == true and bittenHandCounter ~= core.groupSize then
			core:getAchievementFailed()
			core.achievementsCompleted[1] = false
		end
	end
end

function core._2217:Vexiona()
	if inititalVexionaSetup == false then
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersWithThirtyStacks,core.groupSize)
		inititalVexionaSetup = true
		for player,status in pairs(core.InfoFrame_PlayersTable) do
			if playerAnnihilationStacks[player] == nil then
				core:sendDebugMessage("Setting up " .. player)
				playerAnnihilationStacks[player] = 0
			end
		end
	end

	--Annihilation
	--306982 (Player), 307403 (Enemy), 310224 (Buff)
	if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and (core.spellId == 310224 or core.spellId == 306982) then
		--Track individually how many times each player has been hit
		--core:sendDebugMessage("Inside Anhiliation")
		if core.destName ~= nil then
			--Make sure we remove realm info from player before checking name
			local player = core.destName
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
				player = name
			end
			if playerAnnihilationStacks[player] ~= nil then
				playerAnnihilationStacks[player] = playerAnnihilationStacks[player] + 1
				--core:sendDebugMessage(player .. " : " .. playerAnnihilationStacks[player])
				if playerAnnihilationStacks[player] == 30 then
					if InfoFrame_GetPlayerCompleteWithMessage(player) == false then
						--core:sendDebugMessage("Setting player to complete: " .. player)
						InfoFrame_SetPlayerCompleteWithMessage(core.destName, playerAnnihilationStacks[player])
						playersWithThirtyStacks = playersWithThirtyStacks + 1
						core:sendMessage(core.destName .. " " .. L["Shared_HasCompleted"] .. " " .. core:getAchievement() .. " (" .. playersWithThirtyStacks .. "/" .. core.groupSize .. ")",true)
					
						--Update InfoFrame
						updateRequired = true
					end
				elseif playerAnnihilationStacks[player] < 30 then
					InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerAnnihilationStacks[player])

					--Update InfoFrame
					updateRequired = true
				end
			end
		end
	end

	if updateRequired == true and lockInfoFrameUpdate == false then
		lockInfoFrameUpdate = true
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersWithThirtyStacks,core.groupSize)
		updateRequired = false
		C_Timer.After(1, function() 
			lockInfoFrameUpdate = false
			if core:getBlizzardTrackingStatus(14139) == true and playersWithThirtyStacks == core.groupSize then
				--Blizzard tracking gone white so achievement completed
				core:getAchievementSuccess()
			end
		end)
	end
end

function core._2217:Maut()
	--Defeat Maut in Ny'alotha, the Waking City after defeating a Forbidden Manifestation on Normal difficulty or higher.

	--Announce when Forbidden Manifestation is found
	if (core.destName == getNPCName(160271) or core.sourceName == getNPCName(160271)) and forbiddenManifestationSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(160271)),true)
        forbiddenManifestationSpawned = true
    end

	if core:getBlizzardTrackingStatus(14008) == true then
        core:getAchievementSuccess()
    end
end

function core._2217:Raden()
	--Defeat Ra-den in Ny'alotha, the Waking City after destroying 2 obelisks with Unstable Void on Normal difficulty or higher.
	if core:getBlizzardTrackingStatus(13999) == true then
        core:getAchievementSuccess()
    end
end

function core._2217:IlgynothCorruptionReborn()
	--Defeat Il'gynoth, Corruption Reborn in Ny'alotha, the Waking City after defeating 10 Bloods of Ny'alotha in under 3 seconds on Normal difficulty or higher.
	core.MobCounter:Setup(10, 2.9, "159514")
	core.MobCounter:DetectSpawnedMob()
	core.MobCounter:DetectKilledMob()
end

function core._2217:CarapaceOfNZoth()
	--Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14147) == true then
		core:getAchievementSuccess()
	end

	--Check for Synthesis stacks on boss. If <16 start 10 second timer.
	--If achievement not marked as white after >10 seconds then announce fail
	if core.type == "SPELL_AURA_REMOVED_DOSE" and core.spellId == 307079 and core.amount ~= nil then
		if blockCounter == false then
			synthesisStacks = core.amount
		end

		if carapaceTimerStarted == false then
			carapaceTimerStarted = true
			C_Timer.After(10, function() 
				blockCounter = true

				--Make sure blizzard tracking has time to change
				C_Timer.After(2, function() 
					if core.achievementsCompleted[1] == false then
						core:getAchievementFailedWithMessageAfter("(" .. (16 - tonumber(synthesisStacks)) .. "/16)")
					end 
				end)
			end)
		end
	end
end

function core._2217:NZothTheCorruptor()
	--Defeat N'Zoth, the Corruptor in Ny'alotha, the Waking City while all players have accepted the Gift of N'Zoth on Normal difficulty or higher
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],giftOfNZothCounter,core.groupSize)

	--Player has gained Gift of N'zoth
	if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 313334 or core.spellId == 313609) and giftOfNZothUID[core.spawn_uid_dest_Player] == nil then
		giftOfNZothCounter = giftOfNZothCounter + 1
		giftOfNZothUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
		core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(313334) .. " (" .. giftOfNZothCounter .. "/" .. core.groupSize .. ")",true)
		InfoFrame_SetPlayerComplete(core.destName)
	end

	--Announce success once everyone has had the debuff at some point during the fight
	if giftOfNZothCounter == core.groupSize then
		core:getAchievementSuccess()
	end
end

function core._2217:ClearVariables()
	------------------------------------------------------
	---- Drest'agath
	------------------------------------------------------
	initialTime = nil
	secondTime = nil

	------------------------------------------------------
	---- N'Zoth, the Corruptor
	------------------------------------------------------
	giftOfNZothCounter = 0
	giftOfNZothUID = {}

	------------------------------------------------------
	---- Shad'har the Insatiable
	------------------------------------------------------
	initialScan = false
	bittenHandCounter = 0
	bittenHandUID = {}
	shadharKilled = false

	------------------------------------------------------
	---- Prophet Skitra
	------------------------------------------------------
	disciplesKilled = 0
	disciplesUID = {}

	------------------------------------------------------
	---- Hivemind
	------------------------------------------------------
	evolvedSpecimenKilled = 0

	------------------------------------------------------
	---- Vexiona
	------------------------------------------------------
	playerAnnihilationStacks = {}
	inititalVexionaSetup = false
	playersWithThirtyStacks = 0
	updateRequired = false
	lockInfoFrameUpdate = false

	------------------------------------------------------
	---- Dark Inquisitor Xanesh
	------------------------------------------------------
	voidOrbCounter = 0
	voidWokenExpirationTime = nil
	voidWokenBlock = false

	------------------------------------------------------
	---- Carapace of N'Zoth
	------------------------------------------------------
	synthesisStacks = 0
	carapaceTimerStarted = false
	blockCounter = false

	------------------------------------------------------
	---- Maut
	------------------------------------------------------
	forbiddenManifestationSpawned = false
end