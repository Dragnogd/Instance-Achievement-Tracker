--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Castle Nathria
------------------------------------------------------
core._2296 = {}

------------------------------------------------------
---- Sire Denathrius
------------------------------------------------------
local burdenOfSinCounter = 0
local initialSetup = false
local burdernOfSinStackPlayers = {}

------------------------------------------------------
---- Huntsman Altimor
------------------------------------------------------
local MargoreCompleted = false
local HecutisCompleted = false
local BargastCompleted = false
local KennelsCompleted = 0

------------------------------------------------------
---- Artificer Xy'mox
------------------------------------------------------
local MaldraxxusReturned = false
local ArdenwealdReturned = false
local MawReturned = false
local AnimaReturned = 0

------------------------------------------------------
---- Stone Legion Generals
------------------------------------------------------
local BloomingFlowersCounter = 0
local initialStoneLegionSetup = false
local playersWiltedRoseStacks = {}
local playersBloomingRose = {}

function core._2296:Shriekwing()
    --Defeat Shriekwing after she kills six Sneaky Servitors in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14293, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:HuntsmanAltimor()
    --Defeat Huntsman Altimor after walking Margore, Bargast, and Hecutis to the corners of The Kennels in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14523, 1) == true and MargoreCompleted == false then
        MargoreCompleted = true
        KennelsCompleted = KennelsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(14523,1) .. " " .. L["Shared_Completed"] .. " (" .. KennelsCompleted .. "/3)")
    end
    if core:getBlizzardTrackingStatus(14523, 2) == true and HecutisCompleted == false then
        HecutisCompleted = true
        KennelsCompleted = KennelsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(14523,2) .. " " .. L["Shared_Completed"] .. " (" .. KennelsCompleted .. "/3)")
    end
    if core:getBlizzardTrackingStatus(14523, 3) == true and BargastCompleted == false then
        BargastCompleted = true
        KennelsCompleted = KennelsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(14523,3) .. " " .. L["Shared_Completed"] .. " (" .. KennelsCompleted .. "/3)")
    end

    if core:getBlizzardTrackingStatus(14523, 1) == true and core:getBlizzardTrackingStatus(14523, 2) == true and core:getBlizzardTrackingStatus(14523, 3) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:Kaelthas()
    --Redeem Kael'thas after lighting all four of the room's braziers in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14608, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:ArtificerXymox()
    --Defeat Artificer Xy'mox after returning loose Maldraxxus, Ardenweald, and Maw Anima to their display cases in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14617, 1) == true and MaldraxxusReturned == false then
        MaldraxxusReturned = true
        AnimaReturned = AnimaReturned + 1
        core:sendMessage(GetAchievementCriteriaInfo(14617,1) .. " " .. L["Shared_Completed"] .. " (" .. AnimaReturned .. "/3)")
    end
    if core:getBlizzardTrackingStatus(14617, 2) == true and MawReturned == false then
        MawReturned = true
        AnimaReturned = AnimaReturned + 1
        core:sendMessage(GetAchievementCriteriaInfo(14617,2) .. " " .. L["Shared_Completed"] .. " (" .. AnimaReturned .. "/3)")
    end
    if core:getBlizzardTrackingStatus(14617, 3) == true and ArdenwealdReturned == false then
        ArdenwealdReturned = true
        AnimaReturned = AnimaReturned + 1
        core:sendMessage(GetAchievementCriteriaInfo(14617,3) .. " " .. L["Shared_Completed"] .. " (" .. AnimaReturned .. "/3)")
    end

    if core:getBlizzardTrackingStatus(14617, 1) == true and core:getBlizzardTrackingStatus(14617, 2) == true and core:getBlizzardTrackingStatus(14617, 3) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:HungeringDestroyer()
    --Defeat the Hungering Destroyer after draining all of the large anima canisters with Volatile Ejection in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14376, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:LadyInervaDarkvein()
    --Defeat Lady Inerva Darkvein after defeating the Dark Animus in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14524, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:CouncilOfBlood()
    --Defeat the Council of Blood after throwing four bottles of wine in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14619, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:Sludgefist()
    --Defeat Sludgefist after he collides with pillars in Dirtflap's preferred order in Castle Nathria on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14294, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:StoneLegionGenerals()
    --Defeat the Stone Legion Generals while all players are carrying a Bouquet of Blooming Sanguine Roses in Castle Nathria on Normal difficulty or higher.
    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],BloomingFlowersCounter,core.groupSize)

    if initialStoneLegionSetup == false then
		for player,status in pairs(core.InfoFrame_PlayersTable) do
			if playersWiltedRoseStacks[player] == nil then
				playersWiltedRoseStacks[player] = 0
			end
		end
        initialStoneLegionSetup = true
    end

    --Wilting Sanguine Rose (Gained)
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 339565 then
		if core.destName ~= nil then
			local player = core.destName
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
				player = name
			end
			if playersWiltedRoseStacks[player] ~= nil then
				playersWiltedRoseStacks[player] = playersWiltedRoseStacks[player] + 1
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, playersWiltedRoseStacks[player])
			end
		end
    end

    --Wilting Sanguine Rose (Lost)
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 339565 then
        if core.destName ~= nil then
            C_Timer.After(1, function()
                if playersBloomingRose[core.destName] == nil then
                    core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
                end
            end)
        end
    end

    --Blooming Roses
    if core.type == "SPELL_AURA_APLLIED" and core.spellId == 339574 then
        if core.destName ~= nil then
            InfoFrame_SetPlayerCompleteWithMessage(core.destName, "")
            BloomingFlowersCounter = BloomingFlowersCounter + 1
            playersBloomingRose[core.destName] = core.destName
            core:sendMessage(core.destName .. " " .. L["Shared_HasCompleted"] .. " " .. core:getAchievement() .. " (" .. BloomingFlowersCounter .. "/" .. core.groupSize .. ")",true)
        end
    end

    if core:getBlizzardTrackingStatus(14525, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:SireDenathrius()
    --Defeat Sire Denathrius after removing Burden of Sin from all players before March of the Penitent is cast in Castle Nathria on Normal difficulty or higher.
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],burdenOfSinCounter,core.groupSize)

    if initialSetup == false then
        --Set every players counter to 4 stacks at the start of the fight
		initialSetup = true
		for player,status in pairs(core.InfoFrame_PlayersTable) do
            burdernOfSinStackPlayers[player] = 4
            InfoFrame_SetPlayerFailedWithMessage(name, burdernOfSinStackPlayers[name])
            burdernOfSinsCounter = burdenOfSinCounter + 1
		end
    end

    --Player has lost a stack of Burden of Sin
    if (core.type == "SPELL_AURA_REMOVED_DOSE" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 326699 then
        if core.destName ~= nil then
            local name = destName
            if string.find(name, "-") then
                name = strsplit("-", name)
            end
            burdernOfSinStackPlayers[name] = burdernOfSinStackPlayers[name] - 1
            if burdernOfSinStackPlayers[name] == 0 then
                InfoFrame_SetPlayerCompleteWithMessage(name, burdernOfSinStackPlayers[name])
            else
                InfoFrame_SetPlayerFailedWithMessage(name, burdernOfSinStackPlayers[name])
            end
        end
    end

    --March of the Penitent cast
    if core.type == "SPELL_CAST_START" and core.spellId == 328117 then
        --Check if all players are at 0 stacks of Burden of Sin
        local AchievementFailed = false
        for player,stacks in pairs(burdernOfSinStackPlayers) do
            if stacks > 0 then
                AchievementFailed = true
            end
        end

        C_Timer.After(2, function()
            if core:getBlizzardTrackingStatus(14610, 1) == true and AchievementFailed == false then
                core:getAchievementSuccess()
            elseif core:getBlizzardTrackingStatus(14610, 1) == false and AchievementFailed == true then
                core:getAchievementFailed()
            end
        end)
    end
end

function core._2296:ClearVariables()
    ------------------------------------------------------
    ---- Sire Denathrius
    ------------------------------------------------------
    burdenOfSinCounter = 0
    initialSetup = false
    burdernOfSinStackPlayers = {}

    ------------------------------------------------------
    ---- Huntsman Altimor
    ------------------------------------------------------
    MargoreCompleted = false
    HecutisCompleted = false
    BargastCompleted = false
    KennelsCompleted = 0

    ------------------------------------------------------
    ---- Artificer Xy'mox
    ------------------------------------------------------
    MaldraxxusReturned = false
    ArdenwealdReturned = false
    MawReturned = false
    AnimaReturned = 0

    ------------------------------------------------------
    ---- Stone Legion Generals
    ------------------------------------------------------
    BloomingFlowersCounter = 0
    initialStoneLegionSetup = false
    playersWiltedRoseStacks = {}
    playersBloomingRose = {}
end