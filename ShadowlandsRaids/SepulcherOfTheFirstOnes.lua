--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Sepulcher of the First Ones
------------------------------------------------------
core._2481 = {}
core._2481.Events = CreateFrame("Frame")

------------------------------------------------------
---- Vigilant Guardian
------------------------------------------------------
local depletedAutomaCharged = false

------------------------------------------------------
---- Skolex
------------------------------------------------------
local memorialPylonsDestroyed = 0
local currentOrder = 0
local pylon1Done = false
local pylon2Done = false
local pylon3Done = false
local pylon4Done = false

------------------------------------------------------
---- Rygelon
------------------------------------------------------
local heraldOfTheCosmosCounter = 0
local heraldOfTheCosmosUID = {}
local announceRygelonCompleted = false
local heraldOfTheCosmosCheck = false

------------------------------------------------------
---- Prototype Pantheon
------------------------------------------------------
local lickedCounter = 0
local playerLickedStacks = {}
local inititalPrototypeSetup = false

------------------------------------------------------
---- Xymox
------------------------------------------------------
local pilferedArtifactCounter = 0
local initialSetup = false
local artifactData = {}
local unstableRelic = false
local massiveRelic = false
local taintedRelic = false

------------------------------------------------------
---- Dausegne
------------------------------------------------------
local afterLifeCoreDetected = false
local jugglingCoreFound = false

------------------------------------------------------
---- Halondrus The Reclaimer
------------------------------------------------------
local strangeArtifactCounter = 0
local strangeConstructSpawned = false
local strangeConstructCounter = 0

------------------------------------------------------
---- Lihuvim
------------------------------------------------------
local reavingAutomaNeoSpawned = false

function core._2481:VigilantGuardian()
    --Defeat the Vigilant Guardian after defeating the Depleted Automa in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Depleted Automa has fully charged up and can now be killed
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 365637 and depletedAutomaCharged == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(184759)),true)
        depletedAutomaCharged = true
    end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15381,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Skolex()
    --Defeat Skolex, the Insatiable Ravener after getting it to burrow under and destroy all four Memorial Pylons in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Broken Memory Cast
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 366400 then
        --Memorial pylon destroyed

        --In memory of Liet...
        if core.sourceID == "185128" and pylon1Done == false then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185128) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
            if currentOrder == 0 then
                currentOrder = 1
            else
                core:getAchievementFailedWithMessageAfter(L["Shared_KilledInWrongOrder"])
            end
        end

        --...Researcher of the Ravener...
        if core.sourceID == "185129" and pylon2Done == false then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185129) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
            if currentOrder == 1 then
                currentOrder = 2
            else
                core:getAchievementFailedWithMessageAfter(L["Shared_KilledInWrongOrder"])
            end
        end

        --...who dubbed the name "Skolex"...
        if core.sourceID == "185130" and pylon3Done == false then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185130) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
            if currentOrder == 2 then
                currentOrder = 3
            else
                core:getAchievementFailedWithMessageAfter(L["Shared_KilledInWrongOrder"])
            end
        end

        --...and was then eaten by it.
        if core.sourceID == "185131" and pylon4Done == false then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185131) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
            if currentOrder == 3 then
                currentOrder = 4
            else
                core:getAchievementFailedWithMessageAfter(L["Shared_KilledInWrongOrder"])
            end
        end
    end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15401) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Xymox()
    --Defeat Xy'mox with all players under the effects of pilfered artifacts in the Sepulcher of the First Ones on Normal difficulty or higher.
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],pilferedArtifactCounter,core.groupSize)

    if initialSetup == false then
        --Set up a table with every player to track which debuffs they have
		initialSetup = true
		for player,status in pairs(core.InfoFrame_PlayersTable) do
            artifactData[player] = {}
            artifactData[player].Unstable = false
            artifactData[player].Crippling = false
            artifactData[player].Enfeebling = false
            artifactData[player].Count = false
            InfoFrame_SetPlayerNeutralWithMessage(player, 0)
		end
    end

    --Unstable Progenitor Relic (Unstable)
    if core:getHealthPercent("boss1") <= 100 and core:getHealthPercent("boss1") >= 10 and unstableRelic == false then
        core:sendMessage(format(L["Shared_HasSpawned2"], getNPCName(185427)),true)
        unstableRelic = true
    end

    --Massive Progenitor Relic (Crippling)
    if core:getHealthPercent("boss1") <= 76 and core:getHealthPercent("boss1") >= 10 and massiveRelic == false then
        core:sendMessage(format(L["Shared_HasSpawned2"], getNPCName(185438)),true)
        massiveRelic = true
    end

    --Tainted Progenitor Relic (Enfeebling)
    if core:getHealthPercent("boss1") <= 51 and core:getHealthPercent("boss1") >= 10 and taintedRelic == false then
        core:sendMessage(format(L["Shared_HasSpawned2"], getNPCName(185439)),true)
        taintedRelic = true
    end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15398,1) == true and pilferedArtifactCounter == core.groupSize then
        core:getAchievementSuccess()
    end
end

function core._2481:Dausegne()
    --Defeat Dausegne, the Fallen Oracle, while a player is carrying the Afterlife Core in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15397) == true then
        core:getAchievementSuccess()
        afterLifeCoreDetected = true
    end

    --Achievement tracker red as player has dropped the afterlife core
    if core:getBlizzardTrackingStatus(15397) == false and afterLifeCoreDetected == true then
        core:getAchievementFailed()
    end
end

function core._2481:PrototypePantheon()
    --Defeat the Prototype Pantheon after each player has petted 5 Corgis during Wild Stampede in the Sepulcher of the First Ones on Normal difficulty or higher.
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],lickedCounter,core.groupSize)

	if inititalPrototypeSetup == false then
		inititalPrototypeSetup = true
		for player,status in pairs(core.InfoFrame_PlayersTable) do
			if playerLickedStacks[player] == nil then
				playerLickedStacks[player] = 0
			end
		end
	end

    --Player has gained a stack of Licked
	if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 367322 then
		--Track individually how many times each player has been licked
		if core.destName ~= nil then
			--Make sure we remove realm info from player before checking name
			local player = core.destName
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
				player = name
			end
			if playerLickedStacks[player] ~= nil then
				playerLickedStacks[player] = playerLickedStacks[player] + 1
				if playerLickedStacks[player] >= 5 then
					if InfoFrame_GetPlayerCompleteWithMessage(player) == false then
						lickedCounter = lickedCounter + 1
						core:sendMessage(core.destName .. " " .. L["Shared_HasCompleted"] .. " " .. core:getAchievement() .. " (" .. lickedCounter .. "/" .. core.groupSize .. ")",true)
					end
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, playerLickedStacks[player])
				else
					InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerLickedStacks[player])
				end
			end
		end
	end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15400, 1) == true and lickedCounter == core.groupSize then
        core:getAchievementSuccess()
    end
end

function core._2481:Lihuvim()
    --Defeat Lihuvim after synthesizing and defeating a Reaving Automa: Neo in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Reaving Automa: Neo has spawned
    if core.type == "SPELL_CAST_START" and core.destID == "185423" and core.spellId == 367413 and reavingAutomaNeoSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(185423)),true)
        reavingAutomaNeoSpawned = true
    end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15419) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:HalondrusTheReclaimer()
    --Defeat Halondrus the Reclaimer after collecting six strange artifacts and defeating their constructs in the Sepulcher of the First Ones on Normal difficulty or higher.
    InfoFrame_UpdateDynamicPlayerList()
    InfoFrame_SetHeaderMessage(C_Spell.GetSpellLink(365761) .. " " .. L["Core_Counter"] .. " " .. strangeArtifactCounter)

    --Player has picked up a strange artifact
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 365761 then
        strangeArtifactCounter = strangeArtifactCounter + 1
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(365761) .. " (" .. strangeArtifactCounter .. "/6)",true)
        InfoFrame_SetDynamicPlayer(core.destName,1)
    end

    --Player has lost a strange artifact. This is a wipe as it cannot be picked up again
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 365761 then
        C_Timer.After(5, function()
            if strangeConstructSpawned == false then
                --We have not transitioned to the next phase, so achievement has failed
                core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
            end
        end)
    end

    --Strange Construct adds have spawned.
    if (core.destID == "181012" or core.sourceID == "181012") and strangeConstructSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(181012)),true)
        strangeConstructSpawned = true
    end

    --Strange Construct add has died
    if core.type == "UNIT_DIED" and core.destID == "181012" then
		strangeConstructCounter = strangeConstructCounter + 1
		core:sendMessage(core:getAchievement() .. " " .. getNPCName(181012) .. " " .. L["Shared_Killed"] .. " (" .. strangeConstructCounter .. "/6)",true)
	end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15386, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:AnduinWrynn()
    --Defeat Anduin Wrynn after defeating Anduin's Grief in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15399, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:LordsOfDread()
    --Defeat the Lords of Dread after finding and completing one simple task during Infiltration of Dread in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15315) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Rygelon()
    --Defeat Rygelon with all players under the effects of Herald of the Cosmos in the Sepulcher of the First Ones on Normal Difficulty or higher.
    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],heraldOfTheCosmosCounter,core.groupSize)

    --Achievement Criteria White
    if core:getBlizzardTrackingStatus(15396, 1) == true then
        core:getAchievementSuccess()
    end

    --Player has died so fail the Achievement
    if core.type == "UNIT_DIED" and core.currentDest == "Player" and core.destName ~= nil then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
        InfoFrame_SetPlayerFailed(core.destName)
    end

    --Check if all players have got the Herlad of the Cosmos debuff on boss pull.
    --If any player is missing, this is a fail and the raid will need to wipe and try again
    if heraldOfTheCosmosCheck == false then
        heraldOfTheCosmosCheck = true

        local playersWithoutBuff = ""
        local playersFailed = false

        C_Timer.After(3, function()
            for player,status in pairs(core.InfoFrame_PlayersTable) do
                --Check if player has the Wilted Rose Buff
                local debuffFound = false
                for i=1,40 do
                    local auraData = C_UnitAuras.GetDebuffDataByIndex(player, i)
                    if auraData ~= nil and auraData.spellId == 366195 then
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
        end)
    end
end

function core._2481:TheJailer()
    --Defeat the Jailer after collecting 6 Progenitor Orbs in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15494, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:ClearVariables()
    ------------------------------------------------------
    ---- Vigilant Guardian
    ------------------------------------------------------
    depletedAutomaCharged = false

    ------------------------------------------------------
    ---- Skolex
    ------------------------------------------------------
    memorialPylonsDestroyed = 0
    currentOrder = 0
    pylon1Done = false
    pylon2Done = false
    pylon3Done = false
    pylon4Done = false

    ------------------------------------------------------
    ---- Rygelon
    ------------------------------------------------------
    heraldOfTheCosmosCounter = 0
    heraldOfTheCosmosUID = {}
    announceRygelonCompleted = false
    heraldOfTheCosmosCheck = false

    ------------------------------------------------------
    ---- Prototype Pantheon
    ------------------------------------------------------
    lickedCounter = 0
    playerLickedStacks = {}
    inititalPrototypeSetup = false

    ------------------------------------------------------
    ---- Xymox
    ------------------------------------------------------
    pilferedArtifactCounter = 0
    initialSetup = false
    artifactData = {}
    unstableRelic = false
    massiveRelic = false
    taintedRelic = false

    ------------------------------------------------------
    ---- Dausegne
    ------------------------------------------------------
    afterLifeCoreDetected = false
    jugglingCoreFound = false

    ------------------------------------------------------
    ---- Halondrus The Reclaimer
    ------------------------------------------------------
    strangeArtifactCounter = 0
    strangeConstructSpawned = false
    strangeConstructCounter = 0

    ------------------------------------------------------
    ---- Lihuvim
    ------------------------------------------------------
    reavingAutomaNeoSpawned = false
end

function core._2481:InstanceCleanup()
    core._2481.Events:UnregisterEvent("UNIT_AURA")
end

core._2481.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2481:InitialSetup()
    core._2481.Events:RegisterEvent("UNIT_AURA")
end

function core._2481.Events:UNIT_AURA(self, unitID)
    local name, realm = UnitName(unitID)
    for i=1,40 do
        local auraData = C_UnitAuras.GetDebuffDataByIndex(unitID, i)
        if name ~= nil then
            if auraData ~= nil and auraData.spellId == 366324 and jugglingCoreFound == false then
                --Juggling Core
                core:sendMessage(name .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(366324),true)
                jugglingCoreFound = true
            end
        end
    end

    --Artificer Achievement
    if next(core.currentBosses) ~= nil then
		if core.currentBosses[1].encounterID == 2553 then
			local player, realm = UnitName(unitID)

            --Check if player has any of the debuffs
            local foundUnstable = false
            local foundCrippling = false
            local foundEnfeebling = false

            if artifactData[player] ~= nil then
                for i=1,40 do
                    local auraData = C_UnitAuras.GetDebuffDataByIndex(unitID, i)
                    --Unstable Ephemera
                    if auraData ~= nil and auraData.spellId == 367220 then
                        if player ~= nil then
                            if artifactData[player].Unstable == false then
                                artifactData[player].Unstable = true

                                if artifactData[player].Enfeebling == true and artifactData[player].Crippling == true then
                                    pilferedArtifactCounter = pilferedArtifactCounter + 1
                                    artifactData[player].Count = true
                                end
                            end
                            foundUnstable = true
                        end
                    end

                    --Crippling Ephemera
                    if auraData ~= nil and auraData.spellId == 367275 then
                        if player ~= nil then
                            if artifactData[player].Crippling == false then
                                artifactData[player].Crippling = true

                                if artifactData[player].Enfeebling == true and artifactData[player].Unstable == true then
                                    pilferedArtifactCounter = pilferedArtifactCounter + 1
                                    artifactData[player].Count = true
                                end
                            end
                            foundCrippling = true
                        end
                    end

                    --Enfeebling Ephemera
                    if auraData ~= nil and auraData.spellId == 367278 then
                        if player ~= nil then
                            if artifactData[player].Enfeebling == false then
                                artifactData[player].Enfeebling = true

                                if artifactData[player].Unstable == true and artifactData[player].Crippling == true then
                                    pilferedArtifactCounter = pilferedArtifactCounter + 1
                                    artifactData[player].Count = true
                                end
                            end
                            foundEnfeebling = true
                        end
                    end
                end

                if (foundUnstable == true or foundCrippling == true or foundEnfeebling == true) and core.achievementsFailed[1] ~= true then
                    --Check how many debuffs the player has in total and display in InfoFrame
                    local debuffCount = 0

                    if artifactData[player].Unstable == true then
                        debuffCount = debuffCount + 1
                    end
                    if artifactData[player].Crippling == true then
                        debuffCount = debuffCount + 1
                    end
                    if artifactData[player].Enfeebling == true then
                        debuffCount = debuffCount + 1
                    end

                    InfoFrame_SetPlayerNeutralWithMessage(player, debuffCount)
                end

                --Check if player has lost any of the debuffs
                if core:getHealthPercent("boss1") > 1 then
                    if artifactData[player].Crippling == true and foundCrippling == false then
                        InfoFrame_SetPlayerFailedWithMessage(player, "")
                        core:getAchievementFailedWithMessageAfter("(" .. player .. ")")
                        if artifactData[player].Count == true then
                            artifactData[player].Count = false
                            pilferedArtifactCounter = pilferedArtifactCounter - 1
                        end
                    end
                    if artifactData[player].Enfeebling == true and foundEnfeebling == false then
                        InfoFrame_SetPlayerFailedWithMessage(player, "")
                        core:getAchievementFailedWithMessageAfter("(" .. player .. ")")
                        if artifactData[player].Count == true then
                            artifactData[player].Count = false
                            pilferedArtifactCounter = pilferedArtifactCounter - 1
                        end
                    end
                    if artifactData[player].Unstable == true and foundUnstable == false then
                        InfoFrame_SetPlayerFailedWithMessage(player, "")
                        core:getAchievementFailedWithMessageAfter("(" .. player .. ")")
                        if artifactData[player].Count == true then
                            artifactData[player].Count = false
                            pilferedArtifactCounter = pilferedArtifactCounter - 1
                        end
                    end
                end
            end
        end
    end
end