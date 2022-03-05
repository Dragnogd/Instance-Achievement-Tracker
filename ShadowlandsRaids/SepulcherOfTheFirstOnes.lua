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

------------------------------------------------------
---- Rygelon
------------------------------------------------------
local heraldOfTheCosmosCounter = 0
local heraldOfTheCosmosUID = {}
local announceRygelonCompleted = false

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
local unstableEphemeraFound = false
local cripplingEphemeraFound = false
local enfeeblingEphemeraFound = false
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
        if core.destID == "185128" then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185128) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
        end

        if core.destID == "185130" then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185130) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
        end

        if core.destID == "185131" then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185131) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
        end

        if core.destID == "185129" then
            memorialPylonsDestroyed = memorialPylonsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(185129) .. " " .. L["Shared_Killed"] .. " (" .. memorialPylonsDestroyed .. "/4)",true)
        end
    end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15401) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Xymox()
    --Defeat Xy'mox with all players under the effects of pilfered artifacts in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Unstable Progenitor Relic (Unstable)
    if core:getHealthPercent("boss1") <= 100 and unstableRelic == false then
        core:sendMessage(format(L["Shared_HasSpawned2"], getNPCName(185427)),true)
        unstableRelic = true
    end

    --Massive Progenitor Relic (Crippling)
    if core:getHealthPercent("boss1") <= 75 and massiveRelic == false then
        core:sendMessage(format(L["Shared_HasSpawned2"], getNPCName(185438)),true)
        massiveRelic = true
    end

    --Tainted Progenitor Relic (Enfeebling)
    if core:getHealthPercent("boss1") <= 51 and taintedRelic == false then
        core:sendMessage(format(L["Shared_HasSpawned2"], getNPCName(185439)),true)
        taintedRelic = true
    end

    --Unstable Ephemera detected
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 367220 and unstableEphemeraFound == false then
        pilferedArtifactCounter = pilferedArtifactCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(99031) .. " " .. L["Core_Counter"] .. " (" .. pilferedArtifactCounter .. "/3)",true)
        unstableEphemeraFound = true
    end

    --Crippling Ephemera detected
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 367275 and cripplingEphemeraFound == false then
        pilferedArtifactCounter = pilferedArtifactCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(99031) .. " " .. L["Core_Counter"] .. " (" .. pilferedArtifactCounter .. "/3)",true)
        cripplingEphemeraFound = true
    end

    --Enfeebling Ephemera detected
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 367278 and enfeeblingEphemeraFound == false then
        pilferedArtifactCounter = pilferedArtifactCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(99031) .. " " .. L["Core_Counter"] .. " (" .. pilferedArtifactCounter .. "/3)",true)
        enfeeblingEphemeraFound = true
    end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15398,1) == true then
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
        core:getAchievementSuccess()
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
				if playerLickedStacks[player] == 5 then
					if InfoFrame_GetPlayerCompleteWithMessage(player) == false then
						InfoFrame_SetPlayerCompleteWithMessage(core.destName, playerLickedStacks[player])
						lickedCounter = lickedCounter + 1
						core:sendMessage(core.destName .. " " .. L["Shared_HasCompleted"] .. " " .. core:getAchievement() .. " (" .. lickedCounter .. "/" .. core.groupSize .. ")",true)
					end
				else
					InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerLickedStacks[player])
				end
			end
		end
	end

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15400, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Lihuvim()
    --Defeat Lihuvim after synthesizing and defeating a Reaving Automa: Neo in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Reaving Automa: Neo has spawned
    if core.type == "SWING_DAMAGE" and core.sourceID == "185423" and reavingAutomaNeoSpawned == false then
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
    InfoFrame_SetHeaderMessage(GetSpellLink(365761) .. " " .. L["Core_Counter"] .. " " .. strangeArtifactCounter)

    --Player has picked up a strange artifact
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 365761 then
        strangeArtifactCounter = strangeArtifactCounter + 1
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(365761) .. " (" .. strangeArtifactCounter .. "/6)",true)
        InfoFrame_SetDynamicPlayer(core.destName,1)
    end

    --Player has lost a strange artifact. This is a wipe as it cannot be picked up again
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 365761 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end

    --Strange Construct adds have spawned.
    if core.destID == "181012" or core.sourceID == "181012" and strangeConstructSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(181012)),true)
        strangeConstructSpawned = true
    end

    --Strange Construct add has died
    if core.type == "UNIT_DIED" and core.destID == "181012" then
		strangeConstructCounter = strangeConstructCounter + 1
		core:sendMessage(core:getAchievement() .. " " .. getNPCName(181012) .. " " .. L["Shared_Killed"] .. " (" .. strangeConstructCounter .. "/10)")
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

    --Achievement Criteria White
    if core:getBlizzardTrackingStatus(15396, 1) == true then
        core:getAchievementSuccess()
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

    ------------------------------------------------------
    ---- Rygelon
    ------------------------------------------------------
    heraldOfTheCosmosCounter = 0
    heraldOfTheCosmosUID = {}
    announceRygelonCompleted = false

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
    unstableEphemeraFound = false
    cripplingEphemeraFound = false
    enfeeblingEphemeraFound = false
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
        local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
        if name ~= nil then
            if spellId == 366324 and jugglingCoreFound == false then
                --Juggling Core
                core:sendMessage(name .. L["Shared_HasGained"] .. " " .. GetSpellLink(366324),true)
                jugglingCoreFound = true
            end
        end
    end
end