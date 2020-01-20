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
local temperTantrumCounter = 0
local timerStarted = false
local timerDest = nil

------------------------------------------------------
---- N'Zoth, the Corruptor
------------------------------------------------------
local giftOfNZothCounter = 0
local giftOfNZothUID = {}

------------------------------------------------------
---- Shad'har the Insatiable
------------------------------------------------------
local playersCompletedAchievement = 0
local initialScan = false

------------------------------------------------------
---- Prophet Skitra
------------------------------------------------------
local disciplesKilled = 0

------------------------------------------------------
---- Hivemind
------------------------------------------------------
local evolvedSpecimenKilled = 0

------------------------------------------------------
---- Dark Inquisitor Xanesh
------------------------------------------------------
local voidWokenPlayers = {}
local voidWokenInTimeWindow = false
local darkCollapseCast = false
local voidOrbCounter = 0
local voidWokenPlayerCheck = false

------------------------------------------------------
---- Vexiona
------------------------------------------------------
local playerAnnihilationStacks = {}
local inititalVexionaSetup = false
local playersWithThirtyStacks = 0

function core._2217:WrathionTheBlackEmperor()
	--Defeat Wrathion in Ny'alotha, the Waking City after defeating 10 Crackling Shards within 3 seconds of each other on Normal difficulty or higher.
	if core:getBlizzardTrackingStatus(14019) == true then
        core:getAchievementSuccess()
    end
end

function core._2217:ProphetSkitra()
	--Defeat the Prophet Skitra in Ny'alotha, the Waking City after defeating three Disciples of the Prophet on Normal difficulty or higher.
	if core.type == "UNIT_DIED" and (core.destID == "161573" or core.destID == "161935") then
		disciplesKilled = disciplesKilled + 1
		core:sendMessage(core:getAchievement() .. " " .. getNPCName(161573) .. " " .. L["Shared_Killed"] .. " (" .. disciplesKilled .. "/3)",true)
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
	core:sendDebugMessage("Inside DarkInquisitorXanesh")

	--Dark Collapse happened. Orb not returned successfully
	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED" or core.type == "SPELL_MISSED") and core.spellId == 306876 then
		core:sendDebugMessage("Detected Dark Collapse")
		darkCollapseCast = true
	end

	--Players who get Voidwoken Debuff
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 312406 then
		core:sendDebugMessage("Detected Voidwoken Debuff Gained")
		if core.destName ~= nil then
			core:sendDebugMessage("Detected Voidwoken Debuff Gained on " .. core.destName)
			if core:has_value(voidWokenPlayers, core.destName) == false then
				core:sendDebugMessage("Inserting voidWokenPlayers " .. core.destName)
				table.insert(voidWokenPlayers, core.destName)
			end
		end
	end

	--Players who loose Voidwoken Debuff
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 312406 then
		core:sendDebugMessage("Detected Voidwoken Debuff Lost")
		if core.destName ~= nil then
			core:sendDebugMessage("Detected Voidwoken Debuff Lost on " .. core.destName)
			if core:has_value(voidWokenPlayers, core.destName) == true then
				core:sendDebugMessage("Removing voidWokenPlayers " .. core.destName)
				table.remove(voidWokenPlayers, core:tablefind(voidWokenPlayers, core.destName))
			end
		end
	end

	--Detected if orb was returned within the 3 second time window
	if #voidWokenPlayers > 0 then
		voidWokenPlayerCheck = true
		core:sendDebugMessage("Detected players in voidWokenPlayers table")
		for index, player in pairs(voidWokenPlayers) do
			local player = player
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
				player = name
			end
			core:sendDebugMessage("Found " .. player .. " at " .. index)
			for i=1,40 do
				local _, _, _, _, _, expirationTime, _, _, _, spellId = UnitDebuff(player, i)
				if spellId == 312406 then --312406
					core:sendDebugMessage("Detected " .. spellId .. " : " .. expirationTime .. " : " .. (expirationTime - GetTime()))
					if (expirationTime - GetTime() < 3) and (expirationTime - GetTime() > 0) then
						core:sendDebugMessage("Voidwoken is within time window: " .. expirationTime - GetTime())
						voidWokenInTimeWindow = true
					end					
				end
			end
		end
	end
	
	--Check if orb was successfully placed in time and without a dark collapse
	if #voidWokenPlayers == 0 then
		if voidWokenPlayerCheck == true then
			core:sendDebugMessage("Checking if orb was returned or not")
			voidWokenPlayerCheck = false
			--All players have lost the buff. Lets check if orb was placed successfully or not
			C_Timer.After(5, function() 
				if darkCollapseCast == false and voidWokenInTimeWindow == true then
					core:sendDebugMessage("Orb was returned successfully")
					voidOrbCounter = voidOrbCounter + 1
					core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(264908) .. " " .. L["Core_Counter"] .. " (" .. voidOrbCounter .. "/3)",true)

					if voidOrbCounter >= 3 then
						core:getAchievementSuccess()
					end
				else
					core:sendDebugMessage("Orb was not returned successfully")
				end

				darkCollapseCast = false
				voidWokenInTimeWindow = false
			end)
		end	
	end
end

function core._2217:DrestAgath()
	--Defeat Drest'agath after triggering Throes of Agony twice within 60 seconds, on Normal difficulty or higher.
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 308941 then
		temperTantrumCounter = temperTantrumCounter + 1
		core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(308941) .. " " .. L["Core_Counter"] .. " (" .. temperTantrumCounter .. "/2)")
		if timerStarted == false then
			core:sendDebugMessage("Timer Started")
			timerStarted = true
			core.achievementsFailed[1] = false
			timerDest = C_Timer.NewTimer(60, function()
				if temperTantrumCounter == 2 then
					core:getAchievementSuccess()
				else
					core:getAchievementFailed()
				end
				core:sendDebugMessage("Resetting Timer")
				timerStarted = false
			end)
		else	
			if temperTantrumCounter == 2 then
				core:getAchievementSuccess()
				if timerDest ~= nil then
					core:sendDebugMessage("Cancelled Drest Timer")
					timerDest:Cancel()
					timerStarted = false
					timerDest = nil
				end
			end
		end	
	end
end

function core._2217:ShadharTheInsatiable()
	--Defeat Shad'har the Insatiable in Ny'alotha, the Waking City after having everyone /pet him on Normal difficulty or higher.
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersCompletedAchievement,core.groupSize)
	core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"],"GameFontHighlight")
	core.IATInfoFrame:SetText2(L["Shared_Players25Yards"],200)
	
	if initialScan == false then
		initialScan = true
		core:sendMessage(L["Shared_Players25Yards"],true)
	end

	if playersCompletedAchievement == core.groupSize then
		core:getAchievementSuccess()
	end

	--Check for message in the sync queue
	for k, player in ipairs(core.syncMessageQueue) do
		if player ~= nil then
			--If someone is found then update InfoFrame
			if InfoFrame_GetPlayerComplete(player) == false then
				InfoFrame_SetPlayerComplete(player)
				playersCompletedAchievement = playersCompletedAchievement + 1
			end
			core.syncMessageQueue[k] = nil
		end
	end
end

function core._2217:Vexiona()
	--Track individually how many times each player has been hit
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersWithThirtyStacks,core.groupSize)

	if inititalVexionaSetup == false then
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
	if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 310224 then
		if core.destName ~= nil then
			--Make sure we remove realm info from player before checking name
			local player = core.destName
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
				player = name
			end
			playerAnnihilationStacks[player] = playerAnnihilationStacks[player] + 1
			core:sendDebugMessage(player .. " : " .. playerAnnihilationStacks[player])
			if playerAnnihilationStacks[player] >= 30 then
				if InfoFrame_GetPlayerCompleteWithMessage(player) == false then
					InfoFrame_SetPlayerCompleteWithMessage(core.destName, playerAnnihilationStacks[player])
					playersWithThirtyStacks = playersWithThirtyStacks + 1
				end 
			else
				InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerAnnihilationStacks[player])
			end
		end
	end

	--If player dies lets assume this resets the counter for now
	if core.type == "UNIT_DIED" and core.destName ~= nil then
		if UnitIsPlayer(core.destName) then
			local player = core.destName
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
				player = name
			end
			playerAnnihilationStacks[player] = 0
			if InfoFrame_GetPlayerCompleteWithMessage(player) == true then
				playersWithThirtyStacks = playersWithThirtyStacks - 1
				core:sendDebugMessage(player .. " : " .. playerAnnihilationStacks[player])
				InfoFrame_SetPlayerFailedWithMessage(core.destName, playerAnnihilationStacks[player])
			end
		end
	end

	--Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14139) == true then
		core:getAchievementSuccess()
	end
end

function core._2217:Maut()
	--Defeat Maut in Ny'alotha, the Waking City after defeating a Forbidden Manifestation on Normal difficulty or higher.
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
	core.MobCounter:Setup(10, 3, "159514")
	core.MobCounter:DetectSpawnedMob()
	core.MobCounter:DetectKilledMob()
end

function core._2217:CarapaceOfNZoth()
	--Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14147, 1) == true then
		core:getAchievementSuccess()
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
		InfoFrame_SetPlayerComplete(UnitName(core.destName))
	end

	--If player dies this will fail the achievement
	if core.type == "UNIT_DIED" and core.destName ~= nil then
		if UnitIsPlayer(core.destName) then
			if giftOfNZothUID[core.spawn_uid_dest_Player] ~= nil then
				giftOfNZothCounter = giftOfNZothCounter - 1
				giftOfNZothUID[core.spawn_uid_dest_Player] = nil
				core:sendMessage(core.destName .. " " .. L["Shared_HasDied"] .. " (" .. giftOfNZothCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerFailed(UnitName(core.destName))

				--Announce fail if success has happened and player has since died
				if core.achievementsCompleted[1] == true then
					core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
					core.achievementsCompleted[1] = false
				end
			end
		end
	end

	--Announce success once everyone has had the debuff at some point during the fight
	if giftOfNZothCounter == core.groupSize then
		core:getAchievementSuccess()
		core.achievementsFailed[1] = false
	end
end

function core._2217:ClearVariables()
	------------------------------------------------------
	---- Drest'agath
	------------------------------------------------------
	temperTantrumCounter = 0
	timerStarted = false
	if timerDest ~= nil then
		core:sendDebugMessage("Cancelled Drest Timer")
		timerDest:Cancel()
		timerStarted = false
		timerDest = nil
	end

	------------------------------------------------------
	---- N'Zoth, the Corruptor
	------------------------------------------------------
	giftOfNZothCounter = 0
	giftOfNZothUID = {}

	------------------------------------------------------
	---- Shad'har the Insatiable
	------------------------------------------------------
	playersCompletedAchievement = 0
	initialScan = false

	------------------------------------------------------
	---- Prophet Skitra
	------------------------------------------------------
	disciplesKilled = 0

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

	------------------------------------------------------
	---- Dark Inquisitor Xanesh
	------------------------------------------------------
	voidWokenPlayers = {}
	voidWokenInTimeWindow = false
	darkCollapseCast = false
	voidOrbCounter = 0
	voidWokenPlayerCheck = false
end

function core._2217:InstanceCleanup()
    core._2217.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
end

core._2217.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2217:InitialSetup()
    core._2217.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
end

function core._2217.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
		if InfoFrame_GetPlayerComplete(sender) == false then
			local emote, player, target, emoteString, relation = core:getEmote(message)
			if emote == "PET" then
				if target == getNPCName(157231) then
					--They have petted the correct npc
					InfoFrame_SetPlayerComplete(player)
					playersCompletedAchievement = playersCompletedAchievement + 1

					--Send message to other addon users
					C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. player, "RAID")
				end
			end
		end
	end
end