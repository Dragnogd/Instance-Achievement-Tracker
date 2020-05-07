--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Nighthold Bosses
------------------------------------------------------
core._1530 = {}
core._1530.Events = CreateFrame("Frame")

------------------------------------------------------
---- Skorpyron
------------------------------------------------------
playersBrokenShard = {}
playersBrokenShardCounter = 0

------------------------------------------------------
---- Trilliax
------------------------------------------------------
local toxicSliceCounter = 0

------------------------------------------------------
---- Star Augur Etraeus
------------------------------------------------------
local healthPercentageReached = false
local wellTraveledNetherElementalFound = false

------------------------------------------------------
---- Krosus
------------------------------------------------------
local burningEmbersKilled = 0
local burningEmbersUID = {}
local burningEmbersUIDBridgeBreak = {}
local burningEmbersUIDCounter = 0
local burningEmbersUIDBridgeBreakCounter = 0
local burningEmbersKilledDuringTimer = 0
local slamCounter = 0
local timerStarted = false
local timerStarted2 = false
local burningEmbersKilledByPlayersUID = {}

------------------------------------------------------
---- Gul'dan
------------------------------------------------------
local eyeOfGuldanKilled = 0
local timerStarted = false
local eyeTarget = false

------------------------------------------------------
---- High Botanist Tel'arn
------------------------------------------------------
local mysteriousFruitCounter = 0
local mysteriousFruitPlayers = {}
local highBotanistTelarnKilled = false
local showBotanistInfoFrame = false

function core._1530:Skorpyron()

    if core:getBlizzardTrackingStatus(10678, 1) == false then
        core:getAchievementFailed()
    end

    --Shockwave cast
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 204316 then
        --Loop through all players in the group and make a list of all players that got hit by the shockwave
        local playersFailed = ""
        local playerHit = false
        for i = 1, core.groupSize do
            local unit = nil
            if core.chatType == "PARTY" then
                if i < core.groupSize then
                    unit = "party" .. i
                else
                    unit = "player"
                end
            elseif core.chatType == "RAID" then
                unit = "raid" .. i
            elseif core.chatType == "SAY" then
                unit = "player"
            end
        
            local name, _ = UnitName(unit)
            --local realm = GetRealmName(unit)
            --local nameStr = name .. "-" .. realm
            if playersBrokenShard[name] == nil then
                playerHit = true
                playersFailed = playersFailed .. name .. ", "
                core:sendDebugMessage(name .. " " .. L["Shared_GotHit"])
            else
                core:sendDebugMessage(name .. " " .. L["Shared_NotHit"])
            end
        end

        if playerHit == true then
            core:getAchievementFailedWithMessageAfter(L["Shared_PlayersHit"] .. " " .. playersFailed)
        else
            core:sendMessage(core:getAchievement() .. " " .. L["TheNighthold_Skorpyron_NoPlayersHit"])
        end
    end

    --Player has gained Broken Shard buff
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 204284 then
        local name, realm = strsplit("-", core.destName)
        if playersBrokenShard[name] == nil then
            playersBrokenShardCounter = playersBrokenShardCounter + 1
            playersBrokenShard[name] = name
            --core:sendDebugMessage(name .. " Gained Broken Shard")
        end
    end

    --Player has lost Broken Shard buff
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 204284 then
        local name, realm = strsplit("-", core.destName)
        if playersBrokenShard[name] ~= nil then
            playersBrokenShardCounter = playersBrokenShardCounter - 1
            playersBrokenShard[name] = nil
           --core:sendDebugMessage(name .. " Lost Broken Shard")   
        end
    end
end

function core._1530:Trilliax()
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 206798 then
        toxicSliceCounter = toxicSliceCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. L["TheNighthold_Trilliax_ToxicSlices1"] ..  (20 - toxicSliceCounter) .. " " .. L["TheNighthold_Trilliax_ToxicSlices2"])
    end			

    if toxicSliceCounter >= 20 then
        core:getAchievementFailed()
    end
end

function core._1530:StarAugurEtraeus()
    --Check if add is in combat with boss
    if core.sourceID == "111587" or core.destID == "111587" then
        wellTraveledNetherElementalFound = true
    end

    --Check if boss has reached phase 3
    for i = 1, 5 do
        if UnitGUID("boss" .. i) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID("boss" .. i))
            if destID == "103758" and core:getHealthPercent("boss" .. i) <= 30 and healthPercentageReached == false and wellTraveledNetherElementalFound == true then
                healthPercentageReached = true
                C_Timer.After(5, function() 
                    core:sendMessage(core:getAchievement() .. " " .. L["TheNighthold_StarAugur_KillAdd"])
                end)
            end
        end
    end

    --Add has died
    if core.type == "UNIT_DIED" and core.destID == "111587" then
        if healthPercentageReached == true then
            core:getAchievementSuccess()
        else
            core:getAchievementFailed()
        end
    end
end

function core._1530:HighBotanistTelarn()
    --Detect when boss is killed
    if core.type == "UNIT_DIED" and core.destID == "104528" then
        highBotanistTelarnKilled = true
        showBotanistInfoFrame = false
		if core.IATInfoFrame:IsVisible() then
			core.IATInfoFrame:Reset()
		end
    end

	if mysteriousFruitCounter == core.groupSize and core.groupSize >= 10 then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    else
        core:getAchievementFailed()
        core.achievementsCompleted[1] = false
	end
end

function core._1530:SpellbladeAluriel()
    if core:getBlizzardTrackingStatus(10817, 1) == true then
        core:getAchievementSuccessWithCustomMessage(L["TheNighthold_Spellblade_Location1"], L["Shared_CompletedBossKill"])
    end
    if core:getBlizzardTrackingStatus(10817, 2) == true then
        core:getAchievementSuccessWithCustomMessage(L["TheNighthold_Spellblade_Location2"], L["Shared_CompletedBossKill"])
    end
    if core:getBlizzardTrackingStatus(10817, 3) == true then
        --Wait for 20 seconds for this one as you need to pass through this room to reach another location
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(20, function()
                if core:getBlizzardTrackingStatus(10817, 3) == true then
                    core:getAchievementSuccessWithCustomMessage(L["TheNighthold_Spellblade_Location3"], L["Shared_CompletedBossKill"])            
                end
            end)
        end
    end
end

function core._1530:InitialSetup()
    core._1530.Events:RegisterEvent("UNIT_AURA")
    core._1530.Events:RegisterEvent("UNIT_TARGETABLE_CHANGED")
    core._1530.Events:RegisterEvent("ZONE_CHANGED_INDOORS")
    core._1530.Events:RegisterEvent("ZONE_CHANGED")

	if C_Map.GetBestMapForUnit("Player") == 767 and C_EncounterJournal.IsEncounterComplete(1761) == false then
		showBotanistInfoFrame = true
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(10754))   
        InfoFrame_UpdatePlayersOnInfoFrame()
	else
		showBotanistInfoFrame = false
    end
end

function core._1530:IATInstanceCleanup()
    core._1530.Events:UnregisterEvent("UNIT_AURA")
    core._1530.Events:UnregisterEvent("UNIT_TARGETABLE_CHANGED")
    core._1530.Events:UnregisterEvent("ZONE_CHANGED_INDOORS")
    core._1530.Events:UnregisterEvent("ZONE_CHANGED")
    burningEmbersKilledByPlayersUID = {}
end

core._1530.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1530.Events:ZONE_CHANGED_INDOORS()
    if C_Map.GetBestMapForUnit("Player") == 767 and C_EncounterJournal.IsEncounterComplete(1761) == false then
		showBotanistInfoFrame = true
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(10754))      
        InfoFrame_UpdatePlayersOnInfoFrame()
	else
		showBotanistInfoFrame = false
		if core.IATInfoFrame:IsVisible() then
			core.IATInfoFrame:Reset()
		end
    end
end

function core._1530.Events:ZONE_CHANGED()
    if C_Map.GetBestMapForUnit("Player") == 767 and C_EncounterJournal.IsEncounterComplete(1761) == false then
		showBotanistInfoFrame = true
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(10754))   
        InfoFrame_UpdatePlayersOnInfoFrame()
	else
		showBotanistInfoFrame = false
		if core.IATInfoFrame:IsVisible() then
			core.IATInfoFrame:Reset()
		end
    end
end

function core._1530.Events:UNIT_AURA(self, unitID, ...)
    if showBotanistInfoFrame == true then
        if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
            if highBotanistTelarnKilled == false then

                local name, realm = UnitName(unitID)

                if mysteriousFruitPlayers[UnitName(unitID)] ~= nil then
                    --Check if player still has the mysterious fruits debuff
                    local debuffFound = false
                    for i=1,40 do
                        local name, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
                        if spellId == 220114 then
                            --We have found the debuff so no action needs to be  taken
                            debuffFound = true
                        end
                    end
                    if debuffFound == false then
                        --Check if player has lost the mysterious fruits debuff
                        InfoFrame_SetPlayerFailed(UnitName(unitID))
                        C_Timer.After(5, function() 
                            if highBotanistTelarnKilled == false then
                                --Make sure player still doesnt have the debuff
                                if core.InfoFrame_PlayersTable[UnitName(unitID)] == 3 and mysteriousFruitPlayers[UnitName(unitID)] ~= nil then
                                    mysteriousFruitPlayers[UnitName(unitID)] = nil
                                    mysteriousFruitCounter = mysteriousFruitCounter - 1
                                    if core.groupSize >= 10 then
                                        core:sendMessage(UnitName(unitID) .. " " .. L["TheNighthold_Botanist_LostBuff"] .. " (" .. mysteriousFruitCounter .. "/" .. core.groupSize .. ")")
                                        InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],mysteriousFruitCounter,core.groupSize)
                                    else
                                        core:sendMessage(UnitName(unitID) .. " " .. L["TheNighthold_Botanist_LostBuff"] .. " (" .. mysteriousFruitCounter .. "/10)")
                                        InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],mysteriousFruitCounter,10)
                                    end                                  
                                end
                            end
                        end)
                    end
                elseif mysteriousFruitPlayers[UnitName(unitID)] == nil then
                    --Check if player has picked up the mysterious fruit debuff
                    for i=1,40 do
                        local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
                        if spellId == 220114 then
                            --We have found the debuff so add player to the table
                            mysteriousFruitPlayers[UnitName(unitID)] = UnitName(unitID)
                            mysteriousFruitCounter = mysteriousFruitCounter + 1
                            if core.groupSize >= 10 then
                                core:sendMessage(UnitName(unitID) .. " " .. L["TheNighthold_Botanist_GainedBuff"] .. " (" .. mysteriousFruitCounter .. "/" .. core.groupSize .. ")")
                                InfoFrame_SetPlayerComplete(UnitName(unitID))
                                InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],mysteriousFruitCounter,core.groupSize)
                            else
                                core:sendMessage(UnitName(unitID) .. " " .. L["TheNighthold_Botanist_GainedBuff"] .. " (" .. mysteriousFruitCounter .. "/10)")
                                InfoFrame_SetPlayerComplete(UnitName(unitID))
                                InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],mysteriousFruitCounter,10)
                            end
                        end
                    end
                end
            end
        end

        InfoFrame_UpdatePlayersOnInfoFrame()
    end
end

function core._1530:Krosus()
    InfoFrame_SetHeaderCounter(getNPCName(104262) .. " " .. L["Core_Counter"],burningEmbersKilled,15)
    if core:getBlizzardTrackingStatus(10575) == true then
        core:getAchievementSuccess()
    end

    local burningEmbersUIDTemp = {}
    --If Burning Ember Killed by player then remove from list
        
    if (core.destID == "104262" and core.overkill > 0 and burningEmbersUID[core.spawn_uid_dest] ~= "killed") or (core.destID == "104262" and core.type == "UNIT_DIED" and burningEmbersUID[core.spawn_uid_dest] ~= "killed") then
        if core:getBlizzardTrackingStatus(10575) == false then
            if burningEmbersKilledByPlayersUID[core.sourceName] == nil then
                burningEmbersKilledByPlayersUID[core.sourceName] = 1
            else
                burningEmbersKilledByPlayersUID[core.sourceName] = burningEmbersKilledByPlayersUID[core.sourceName] + 1
            end
            --core:sendMessage(core.sourceName .. " " .. L["TheNighthold_Krosus_AddKilled"] " (" .. burningEmbersKilledByPlayersUID[core.sourceName] .. ")")
        end
        burningEmbersUID[core.spawn_uid_dest] = "killed" 
    elseif core.sourceID == "104262" and burningEmbersUID[core.spawn_uid_dest] ~= "killed" and burningEmbersUID[core.spawn_uid] ~= "killed" then
        if burningEmbersUID[core.spawn_uid] == nil and core.spawn_uid ~= nil then
            core:sendDebugMessage("ADDED: " .. core.spawn_uid)
        end
        --Reset counter to current time in seconds since add has been detected again
        burningEmbersUID[core.spawn_uid] = GetTime()
        burningEmbersUIDTemp[core.spawn_uid] = core.spawn_uid

        --If add is detected after we thought it was killed then remove from counter
        if burningEmbersUID[k] == "missing" then
            burningEmbersKilled = burningEmbersKilled - 1
            --core:sendMessage(core:getAchievement() .. " " .. L["TheNighthold_Krosus_AddKilledTotal"] .. " (" .. burningEmbersKilled .. "/14)")
        end
    end

    --Compare the two arrays to see if any have been killed
    for k, v in pairs(burningEmbersUID) do
        if v ~= "killed" and v ~= "missing" then
            if core:has_value2(burningEmbersUIDTemp, k) == false then
                if (GetTime() - burningEmbersUID[k]) > 5 then
                    if core.encounterStarted == true and UnitName("boss1") ~= nil then
                        --This add was killed by the water so increment counter
                        burningEmbersKilled = burningEmbersKilled + 1
                        --core:sendMessage(core:getAchievement() .. " " .. L["TheNighthold_Krosus_AddKilledTotal"] .. " (" .. burningEmbersKilled .. "/14)")
                        core:sendDebugMessage(k .. " has been killed")
                        burningEmbersUID[k] = "missing"
                    end                    
                end
            end
        end
    end
end

function core._1530:Elisande()
    if core.type == "UNIT_DIED" and core.destID == "108802" then
        core:getAchievementSuccess()
    end
end

function core._1530:Tichondrius()
    if core.type == "SPELL_DAMAGE" and core.spellId == 213534 then
        core:getAchievementFailedPersonal()
    end
end

function core._1530:Guldan()
    core:trackMob("105630", L["TheNighthold_Guldan_Eyes"] , 16, L["TheNighthold_Guldan_EyesTotal"] , 1, nil, nil)

    --Enough eyes have spawn so track next kill
    if core.mobCounter >= 16 then
        eyeTarget = true
    end

    if core.type == "UNIT_DIED" and core.destID == "105630" and eyeTarget == true then
        eyeOfGuldanKilled = eyeOfGuldanKilled + 1
        if timerStarted == false then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. L["Shared_Timer3"])
            C_Timer.After(3, function()
                if core.inCombat == true then
                    if eyeOfGuldanKilled >= 16 then
                        core:getAchievementSuccess()
                    else
                        --core:sendMessage(core:getAchievement() .. "(" .. eyeOfGuldanKilled .. "/16) Eyes of Gul'dan Killed in time")
                        timerStarted = false
                        eyeOfGuldanKilled = 0
                        eyeTarget = false
                    end
                end
            end)
        end
    end

    if core:getBlizzardTrackingStatus(10696) == true then
        core:getAchievementSuccess()
    end
end

function core._1530:InstanceCleanup()
    highBotanistTelarnKilled = false
    mysteriousFruitCounter = 0
    mysteriousFruitPlayers = {}
end

function core._1530:ClearVariables()
    ------------------------------------------------------
    ---- Trilliax
    ------------------------------------------------------
    toxicSliceCounter = 0

    ------------------------------------------------------
    ---- Star Augur Etraeus
    ------------------------------------------------------
    healthPercentageReached = false
    wellTraveledNetherElementalFound = false

    ------------------------------------------------------
    ---- Krosus
    ------------------------------------------------------
    burningEmbersKilled = 0
    burningEmbersUID = {}
    burningEmbersUIDBridgeBreak = {}
    burningEmbersUIDCounter = 0
    burningEmbersUIDBridgeBreakCounter = 0
    burningEmbersKilledDuringTimer = 0
    slamCounter = 0
    timerStarted = false
    timerStarted2 = false

    ------------------------------------------------------
    ---- Gul'dan
    ------------------------------------------------------
    eyeOfGuldanKilled = 0
    timerStarted = false
    eyeTarget = false
end