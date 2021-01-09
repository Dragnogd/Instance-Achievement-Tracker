--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Castle Nathria
------------------------------------------------------
core._2296 = {}
core._2296.Events = CreateFrame("Frame")

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
local ArdenwealdAnimaFound = false
local MawAnimaFound = false
local MaldraxxusAnimaFound = false
local ArdenwealdAnimaLostTimestamp = nil
local MawAnimaLostTimestamp = nil
local MaldraxxusAnimaLostTimestamp = nil
local CurrentAnima = nil
local initialArtificerSetup = false
local overwhelingAnimaCollected1 = false
local overwhelingAnimaCollected2 = false
local overwhelingAnimaCollected3 = false

------------------------------------------------------
---- Stone Legion Generals
------------------------------------------------------
local BloomingFlowersCounter = 0
local WiltingFlowersCounter = 0
local WiltingFlowersUID = {}
local initialStoneLegionSetup = false
local playersWiltedRoseStacks = {}
local playersBloomingRose = {}
local stoneTimerStarted = false
local stoneTimeRemaining = 600
local stoneTimer = nil
local stoneLegionGeneralKaaelKilled = false
local stoneLegionGeneralGeneralGrashaalKilled = false

------------------------------------------------------
---- LadyInervaDarkvein
------------------------------------------------------
local darkAnimusTimer = nil
local announceDarkAnimus = false

------------------------------------------------------
---- Council of Blood
------------------------------------------------------
local councilOfBloodTimer = nil

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
        core:sendMessage(GetAchievementCriteriaInfo(14523,1) .. " " .. L["Shared_Completed"] .. " (" .. KennelsCompleted .. "/3)",true)
    end
    if core:getBlizzardTrackingStatus(14523, 2) == true and HecutisCompleted == false then
        HecutisCompleted = true
        KennelsCompleted = KennelsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(14523,2) .. " " .. L["Shared_Completed"] .. " (" .. KennelsCompleted .. "/3)",true)
    end
    if core:getBlizzardTrackingStatus(14523, 3) == true and BargastCompleted == false then
        BargastCompleted = true
        KennelsCompleted = KennelsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(14523,3) .. " " .. L["Shared_Completed"] .. " (" .. KennelsCompleted .. "/3)",true)
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

    --Check if all 3 Anima have been found at start of fight
    if initialArtificerSetup == false then
        initialArtificerSetup = true
        for k,player in pairs(core:getPlayersInGroupForAchievement()) do
            for i=1,40 do
                local _, _, count2, _, _, _, _, _, _, spellId = UnitBuff(player, i)
                if spellId == 341186 then
                    --Anima of Ardenweald
                    ArdenwealdAnimaFound = player
                elseif spellId == 341135 then
                    --Anima of Maldraxxus
                    MaldraxxusAnimaFound = player
                elseif spellId == 341253 then
                    --Anima of the Maw
                    MawAnimaFound = player
                end
            end
        end

        if ArdenwealdAnimaFound == false or MaldraxxusAnimaFound == false or MawAnimaFound == false then
            core:getAchievementFailed()
        end
    end

    --Achievement Requirements Met
    if core:getBlizzardTrackingStatus(14617, 1) == true and MaldraxxusReturned == false then
        MaldraxxusReturned = true
        AnimaReturned = AnimaReturned + 1
        core:sendMessage(GetAchievementCriteriaInfo(14617,1) .. " " .. L["Shared_Completed"] .. " (" .. AnimaReturned .. "/3)",true)
        CurrentAnima = nil
    end
    if core:getBlizzardTrackingStatus(14617, 2) == true and MawReturned == false then
        MawReturned = true
        AnimaReturned = AnimaReturned + 1
        core:sendMessage(GetAchievementCriteriaInfo(14617,2) .. " " .. L["Shared_Completed"] .. " (" .. AnimaReturned .. "/3)",true)
        CurrentAnima = nil
    end
    if core:getBlizzardTrackingStatus(14617, 3) == true and ArdenwealdReturned == false then
        ArdenwealdReturned = true
        AnimaReturned = AnimaReturned + 1
        core:sendMessage(GetAchievementCriteriaInfo(14617,3) .. " " .. L["Shared_Completed"] .. " (" .. AnimaReturned .. "/3)",true)
        CurrentAnima = nil
    end

    if core:getBlizzardTrackingStatus(14617, 1) == true and core:getBlizzardTrackingStatus(14617, 2) == true and core:getBlizzardTrackingStatus(14617, 3) == true then
        core:getAchievementSuccess()
    end

    --Anima Attunement Lost
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 341186 then
        ArdenwealdAnimaLostTimestamp = core.timestamp
    elseif core.type == "SPELL_AURA_REMOVED" and core.spellId == 341135 then
        MaldraxxusAnimaLostTimestamp = core.timestamp
    elseif core.type == "SPELL_AURA_REMOVED" and core.spellId == 341253 then
        MawAnimaLostTimestamp = core.timestamp
    end

    if core.type == "UNIT_DIED" and core.destName ~= nil then
        if UnitIsPlayer(core.destName) then
            local player = core.destName
            if string.find(player, "-") then
				local name, realm = strsplit("-", player)
                player = name
            end

            --Anima Attunement Lost
            if player == ArdenwealdAnimaFound then
                if ArdenwealdAnimaLostTimestamp == core.timestamp then
                    core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
                end
            elseif player == MaldraxxusAnimaFound then
                if MaldraxxusAnimaLostTimestamp == core.timestamp then
                    core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
                end
            elseif player == MawAnimaFound then
                if MawAnimaLostTimestamp == core.timestamp then
                    core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
                end
            end

            --Overwhelming Anima Lost
            if CurrentAnima ~= nil then
                local animaFoundOrCompleted = false
                for k,player2 in pairs(core:getPlayersInGroupForAchievement()) do
                    for i=1,40 do
                        local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(player2, i)
                        if CurrentAnima == "Ardenweald" then
                            --Ardenweald Anima
                            if spellId == 341209 or core:getBlizzardTrackingStatus(14617, 3) == true then
                                animaFoundOrCompleted = true
                            end
                        elseif CurrentAnima == "Maldraxxus" then
                            --Maldraxxus Anima
                            if spellId == 341142 or core:getBlizzardTrackingStatus(14617, 1) == true then
                                animaFoundOrCompleted = true
                            end
                        elseif CurrentAnima == "Maw" then
                            --Maw Anima
                            if spellId == 341262 or core:getBlizzardTrackingStatus(14617, 2) == true then
                                animaFoundOrCompleted = true
                            end
                        end
                    end
                end

                if animaFoundOrCompleted == false then
                    core:getAchievementFailed()
                end
            end
        end
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

    --Announce when Dark Animus is spawning
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "69820" and core.spellId == 339276 then
        local darkAnimusCounter = 236
        darkAnimusTimer = C_Timer.NewTicker(1, function()
            if darkAnimusCounter == 236 then
                core:sendMessage(format(L["Shared_MobSpawningInXMinutes"], getNPCName(173430), "4"),true)
            elseif darkAnimusCounter == 180 then
                core:sendMessage(format(L["Shared_MobSpawningInXMinutes"], getNPCName(173430), "3"),true)
            elseif darkAnimusCounter == 120 then
                core:sendMessage(format(L["Shared_MobSpawningInXMinutes"], getNPCName(173430), "2"),true)
            elseif darkAnimusCounter == 60 then
                core:sendMessage(format(L["Shared_MobSpawningInXMinutes"], getNPCName(173430), "1"),true)
            elseif darkAnimusCounter < 11 then
                core:sendMessage(format(L["Shared_MobSpawningInXSeconds"], getNPCName(173430), darkAnimusCounter),true)
            end
            core:sendDebugMessage(darkAnimusCounter)
            darkAnimusCounter = darkAnimusCounter - 1
        end, 236)
    end

    --Announce when Dark Animus has spawned
    if (core.sourceID == "173430" or core.destID == "173430") and announceDarkAnimus == false then
        announceDarkAnimus = true
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(173430)),true)
    end

    if core:getBlizzardTrackingStatus(14524, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2296:CouncilOfBlood()
    --Defeat the Council of Blood after throwing four bottles of wine in Castle Nathria on Normal difficulty or higher.
    --Announce when Belligerent Waiters spawn
    if core:getBlizzardTrackingStatus(14619, 1) == false and councilOfBloodTimer == nil then
        local councilOfBloodTick = 0
        local belligerentWaiterCounter = 0
        councilOfBloodTimer = C_Timer.NewTicker(1, function()
            if councilOfBloodTick == 60 then
                if core:getBlizzardTrackingStatus(14619, 1) == false then
                    belligerentWaiterCounter = belligerentWaiterCounter + 1
                    core:sendMessage(format(L["Shared_HasSpawned"], getNPCName(175474), belligerentWaiterCounter),true)
                end
                councilOfBloodTick = 0
            end
            core:sendDebugMessage(councilOfBloodTick)
            councilOfBloodTick = councilOfBloodTick + 1
        end, 600)
    end

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
    InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],BloomingFlowersCounter,core.groupSize,L["MobCounter_TimeReamining"] .. ": " .. stoneTimeRemaining)

    if core.type == "UNIT_DIED" and core.destID == "168113" then
        stoneLegionGeneralGeneralGrashaalKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "168112" then
        stoneLegionGeneralKaaelKilled = true
    end

    if initialStoneLegionSetup == false then
        initialStoneLegionSetup = true
        local playersWithoutBuff = ""
        local playersFailed = false
		for player,status in pairs(core.InfoFrame_PlayersTable) do
			if playersWiltedRoseStacks[player] == nil then

                --Check if player has the Wilted Rose Buff
                local buffFound = false
                for i=1,40 do
                    local _, _, count2, _, _, _, _, _, _, spellId = UnitBuff(player, i)
                    if spellId == 339565 then
                        buffFound = true
                    end
                end
                if buffFound == true then
                    InfoFrame_SetPlayerNeutralWithMessage(player, "1")
                    playersWiltedRoseStacks[player] = 1
                else
                    InfoFrame_SetPlayerFailedWithMessage(player, "")
                    playersWiltedRoseStacks[player] = 0
                    playersWithoutBuff = playersWithoutBuff .. player .. ", "
                    playersFailed = true
                end
            end
        end

        if playersFailed == true then
            core:sendDebugMessage("FAILED")
            C_Timer.After(6, function()
                core:getAchievementFailed()
                core:sendMessageSafe(playersWithoutBuff,nil,true)
            end)
        end
    end

    --Wilting Sanguine Rose (Gained Stack)
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 339565 then --339565
        if core.destName ~= nil then
			local player = core.destName
			if string.find(player, "-") then
				local name, realm = strsplit("-", player)
                player = name
            end
            if playersWiltedRoseStacks[player] ~= nil then
                playersWiltedRoseStacks[player] = playersWiltedRoseStacks[player] + 1
                InfoFrame_SetPlayerNeutralWithMessage(player, playersWiltedRoseStacks[player])
			end
		end
    end

    --Wilting Sanguine Rose (Lost)
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 339565 then --339565
        if core.destName ~= nil then
            local playerTmp = core.destName
            C_Timer.After(1, function()
                if playersBloomingRose[playerTmp] == nil then
                    core:getAchievementFailedWithMessageAfter("(" .. playerTmp .. ")")
                    InfoFrame_SetPlayerFailedWithMessage(playerTmp, "")
                end
            end)
        end
    end

    --Blooming Roses (Gained)
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 339574 then --339574
        if core.destName ~= nil then
            if playersBloomingRose[core.destName] == nil then
                BloomingFlowersCounter = BloomingFlowersCounter + 1
                playersBloomingRose[core.destName] = core.destName
                core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(339574) .. " (" .. BloomingFlowersCounter .. "/" .. core.groupSize .. ")",true)
            end
            InfoFrame_SetPlayerCompleteWithMessage(core.destName, "")
        end
    end

    --Blooming Roses (Lost)
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 339574 then --339574
        if core.destName ~= nil then
            if playersBloomingRose[core.destName] ~= nil then
                InfoFrame_SetPlayerFailedWithMessage(core.destName, "")
                if stoneLegionGeneralKaaelKilled == false and stoneLegionGeneralGeneralGrashaalKilled == false then
                    core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
                end
                BloomingFlowersCounter = BloomingFlowersCounter - 1
                playersBloomingRose[core.destName] = nil
                core:sendDebugMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(339574) .. " (" .. BloomingFlowersCounter .. "/" .. core.groupSize .. ")")
                --core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(339574) .. " (" .. BloomingFlowersCounter .. "/" .. core.groupSize .. ")",true)
            end
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
            InfoFrame_SetPlayerFailedWithMessage(player, burdernOfSinStackPlayers[player])
		end
    end

    --Player has lost a stack of Burden of Sin
    if (core.type == "SPELL_AURA_REMOVED_DOSE" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 326699 then
        if core.destName ~= nil then
            local name = core.destName
            if string.find(name, "-") then
                name = strsplit("-", name)
            end
            burdernOfSinStackPlayers[name] = burdernOfSinStackPlayers[name] - 1
            if burdernOfSinStackPlayers[name] == 0 then
                InfoFrame_SetPlayerCompleteWithMessage(name, burdernOfSinStackPlayers[name])
                burdenOfSinCounter = burdenOfSinCounter + 1
                core:sendMessage(core.destName .. " " .. L["Shared_HasCompleted"] .. " " .. core:getAchievement() .. " (" .. burdenOfSinCounter .. "/" .. core.groupSize .. ")",true)
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

function core._2296:TrackAdditional()
    --Stone Legion Generals Wilting Sanguine Rose (Gained)
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 339565 then --339565
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(14525))
        InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],WiltingFlowersCounter,core.groupSize,L["MobCounter_TimeReamining"] .. ": " .. stoneTimeRemaining)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
        if core.destName ~= nil then
            local player, realm = UnitName(core.destName)
            local _, _, player_UID = strsplit("-", UnitGUID(core.destName))
            if WiltingFlowersUID[player_UID] == nil then
                WiltingFlowersUID[player_UID] = player_UID
                WiltingFlowersCounter = WiltingFlowersCounter + 1
                if initialStoneLegionSetup == false then
                    InfoFrame_SetPlayerCompleteWithMessage(player, "")
                    core:sendDebugMessage("InfoFrame set green for wilted Rose (Combat Log): " .. player)
                    --core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(339565) .. " (" .. WiltingFlowersCounter .. "/" .. core.groupSize .. ")",true)

                    --Check all other players in group for Wilted Roses buff
                    for player2,status in pairs(core.InfoFrame_PlayersTable) do
                        --Check if player has the Wilted Rose Buff
                        local buffFound = false
                        local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
                        for i=1,40 do
                            local _, _, count2, _, _, _, _, _, _, spellId = UnitBuff(player2, i)
                            if spellId == 339565 then
                                buffFound = true
                            end
                        end
                        if buffFound == true then
                            InfoFrame_SetPlayerCompleteWithMessage(player2, "")
                            if WiltingFlowersUID[player_UID2] == nil then
                                WiltingFlowersUID[player_UID2] = player_UID2
                                WiltingFlowersCounter = WiltingFlowersCounter + 1
                                core:sendDebugMessage("InfoFrame set green for wilted Rose (Unit Scanning): " .. player)
                            end
                        else
                            InfoFrame_SetPlayerFailedWithMessage(player2, "")
                            if WiltingFlowersUID[player_UID2] ~= nil then
                                WiltingFlowersUID[player_UID2] = nil
                                WiltingFlowersCounter = WiltingFlowersCounter - 1
                                core:sendDebugMessage("InfoFrame set failed for wilted Rose (Unit Scanning): " .. player)
                            end
                        end
                    end

                    if WiltingFlowersCounter == 0 then
                        if stoneTimer ~= nil then
                            stoneTimer:Cancel()
                            core:sendDebugMessage("Cancelling timer in SPELL_AURA_APPLIED")
                        end
                        stoneTimerStarted = false
                        stoneTimeRemaining = 600
                    end
                end

                --Start Timer when first person picks up the Wilted Flower
                if WiltingFlowersCounter == 1 then
                    if stoneTimerStarted == false then
                        core:sendDebugMessage("Starting Timer in SPELL_AURA_APPLIED")
                        stoneTimerStarted = true
                        stoneTimer = C_Timer.NewTicker(1, function()
                            core:sendDebugMessage(stoneTimeRemaining)
                            stoneTimeRemaining = stoneTimeRemaining - 1
                            if initialStoneLegionSetup == false then
                                core:sendDebugMessage("StoneLegionSetup is false")
                                InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],WiltingFlowersCounter,core.groupSize,L["MobCounter_TimeReamining"] .. ": " .. stoneTimeRemaining)
                            elseif initialStoneLegionSetup == true then
                                core:sendDebugMessage("StoneLegionSetup is true")
                                InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],BloomingFlowersCounter,core.groupSize,L["MobCounter_TimeReamining"] .. ": " .. stoneTimeRemaining)
                            end
                        end, 600)
                    end
                end
            end
        end
        InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],WiltingFlowersCounter,core.groupSize,L["MobCounter_TimeReamining"] .. ": " .. stoneTimeRemaining)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    end

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 339565 then --339565
        if core.destName ~= nil then
            local player, realm = UnitName(core.destName)
            local _, _, player_UID = UnitGUID(core.destName)
            if WiltingFlowersUID[player_UID] ~= nil then
                WiltingFlowersUID[player_UID] = nil
                WiltingFlowersCounter = WiltingFlowersCounter - 1
                if initialStoneLegionSetup == false then
                    InfoFrame_SetPlayerFailedWithMessage(player, "")
                    core:sendDebugMessage("InfoFrame set red for wilted Rose: (Combat Log)" .. player)
                    --core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(339565) .. " (" .. WiltingFlowersCounter .. "/" .. core.groupSize .. ")",true)
                    InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],WiltingFlowersCounter,core.groupSize,L["MobCounter_TimeReamining"] .. ": " .. stoneTimeRemaining)
                    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
                end

                if WiltingFlowersCounter == 0 then
                    if stoneTimer ~= nil then
                        core:sendDebugMessage("Timer cancelled (SPELL_AURA_REMOVED)")
                        stoneTimer:Cancel()
                    end
                    stoneTimerStarted = false
                    stoneTimeRemaining = 600
                end
            end
        end
    end

    --Player has picked up Anima Attunement
    --Ardenweald Anima
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 341186 and overwhelingAnimaCollected1 == false then
        overwhelingAnimaCollected1 = true
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(341186),true)
    end

    --Maw Anima
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 341253 and overwhelingAnimaCollected2 == false then
        overwhelingAnimaCollected2 = true
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(341253),true)
    end

    --Maldraxxus Anima
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 341135 and overwhelingAnimaCollected3 == false then
        overwhelingAnimaCollected3 = true
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(341135),true)
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
    ArdenwealdAnimaFound = false
    MawAnimaFound = false
    MaldraxxusAnimaFound = false
    ArdenwealdAnimaLostTimestamp = nil
    MawAnimaLostTimestamp = nil
    MaldraxxusAnimaLostTimestamp = nil
    CurrentAnima = nil
    initialArtificerSetup = false
    overwhelingAnimaCollected1 = false
    overwhelingAnimaCollected2 = false
    overwhelingAnimaCollected3 = false

    ------------------------------------------------------
    ---- Stone Legion Generals
    ------------------------------------------------------
    BloomingFlowersCounter = 0
    initialStoneLegionSetup = false
    playersWiltedRoseStacks = {}
    playersBloomingRose = {}
    stoneTimerStarted = false
    stoneTimeRemaining = 600
    if stoneTimer ~= nil then
        stoneTimer:Cancel()
    end
    WiltingFlowersUID = {}
    WiltingFlowersCounter = 0

    ------------------------------------------------------
    ---- LadyInervaDarkvein
    ------------------------------------------------------
    announceDarkAnimus = false
    if darkAnimusTimer ~= nil then
        darkAnimusTimer:Cancel()
    end

    ------------------------------------------------------
    ---- Council of Blood
    ------------------------------------------------------
    if councilOfBloodTimer ~= nil then
        councilOfBloodTimer:Cancel()
    end
    councilOfBloodTimer = nil
end

function core._2296:InstanceCleanup()
    core._2296.Events:UnregisterEvent("UNIT_AURA")
    stoneLegionGeneralKaaelKilled = false
    stoneLegionGeneralGeneralGrashaalKilled = false
end

core._2296.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2296:InitialSetup()
    core._2296.Events:RegisterEvent("UNIT_AURA")
end

function core._2296.Events:UNIT_AURA(self, unitID)
    local name, realm = UnitName(unitID)
    for i=1,40 do
        local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
        if name ~= nil then
            if spellId == 341209 then
                --Anima of Ardenweald
                core:sendMessage(name .. L["Shared_HasGained"] .. " " .. GetSpellLink(341209),true)
                CurrentAnima = "Ardenweald"
            elseif spellId == 341142 then
                --Anima of Maldraxxus
                core:sendMessage(name .. L["Shared_HasGained"] .. " " .. GetSpellLink(341142),true)
                CurrentAnima = "Maldraxxus"
            elseif spellId == 341262 then
                --Anima of the Maw
                core:sendMessage(name .. L["Shared_HasGained"] .. " " .. GetSpellLink(341262),true)
                CurrentAnima = "Maw"
            end
        end
    end
end