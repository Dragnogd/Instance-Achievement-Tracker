--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

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
                core:sendDebugMessage(name .. " got hit")
            else
                core:sendDebugMessage(name .. " did not get hit")
            end
        end

        if playerHit == true then
            core:getAchievementFailedWithMessageAfter("Players Hit: " .. playersFailed)
        else
            core:sendMessage(core:getAchievement() .. " No players were hit by Shockwave")
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
        core:sendMessage(core:getAchievement() .. " Toxic slice eaten. You can only eat a maximum of " ..  (20 - toxicSliceCounter) .. " more toxic slices")
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
                C_Timer.After(3, function() 
                    core:sendMessage(core:getAchievement() .. " Kill the Well-Traveled Nether Elemental now")
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
	if mysteriousFruitCounter == core.groupSize and core.groupSize >= 10 then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    else
        core:getAchievementFailed()
	end
end

function core._1530:SpellbladeAluriel()
    if core:getBlizzardTrackingStatus(10817, 1) == true then
        core:getAchievementSuccessWithCustomMessage("'The Shal'dorei Terrace part of'", "will be completed once boss is killed")
    end
    if core:getBlizzardTrackingStatus(10817, 2) == true then
        core:getAchievementSuccessWithCustomMessage("'Shattered Walkway part of'", "will be completed once boss is killed")
    end
    if core:getBlizzardTrackingStatus(10817, 3) == true then
        core:getAchievementSuccessWithCustomMessage("'Astomancers Rise part of'", "will be completed once boss is killed")
    end
end

function core._1530:InitialSetup()
    core._1530.Events:RegisterEvent("UNIT_AURA")
    core._1530.Events:RegisterEvent("UNIT_TARGETABLE_CHANGED")
end

function core._1530:InstanceCleanup()
    core._1530.Events:UnregisterEvent("UNIT_AURA")
    core._1530.Events:UnregisterEvent("UNIT_TARGETABLE_CHANGED")
end

function core._1530.Events:UNIT_AURA(self, unitID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
        if highBotanistTelarnKilled == false then
            --Detect when players get the mysterious fruit debuff
            if core.groupSize > 1 then
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
                    end
                    
                    if unit ~= nil then
                        local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
                            if spellId == 220114 and mysteriousFruitPlayers[spawn_uid_dest] == nil then
                                mysteriousFruitCounter = mysteriousFruitCounter + 1
                                mysteriousFruitPlayers[spawn_uid_dest] = spawn_uid_dest
                                print(spawn_uid_dest)
                                print(mysteriousFruitPlayers[spawn_uid_dest])
                                --Achievement requires atleast 10 players in the group to complete so make sure we do not suggest the achievement is completed with groups less than 10
                                if core.groupSize >= 10 then
                                    core:sendMessage(UnitName(unit) .. " has got the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/" .. core.groupSize .. ")")
                                else
                                    core:sendMessage(UnitName(unit) .. " has got the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/10)")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function core._1530.Events:UNIT_TARGETABLE_CHANGED(self, unitID, ...)
    print(unitID)
end

function core._1530:TrackAdditional()
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
        --Detect when boss is killed
        if core.type == "UNIT_DIED" and core.destID == "104528" then
            print("High Bot Killed")
            highBotanistTelarnKilled = true
        end

        if highBotanistTelarnKilled == false then
            --Detect when player dies and whether or not they had the mysterious fruit debuff or not.
            if core.type == "UNIT_DIED" and core.destName ~= nil then
                --print("Player Died")
                local name, realm = strsplit("-", core.destName)
                --print(name)
                if UnitIsPlayer(name) then
                    --print("Unit is player")
                    --If the player was holding a mysterious fruit then reduce counter by 1
                    --print(core.spawn_uid_dest_Player)
                    if mysteriousFruitPlayers[core.spawn_uid_dest_Player] ~= nil then
                        mysteriousFruitCounter = mysteriousFruitCounter - 1
                        mysteriousFruitPlayers[core.spawn_uid_dest_Player] = nil

                        --print("Player had debuff so remove")

                        if core.groupSize >= 10 then
                            core:sendMessage(core.destName .. " has lost the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/" .. core.groupSize .. ")")
                        else
                            core:sendMessage(core.destName .. " has lost the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/10)")
                        end
        
                        --If achievement had already completed then fail it
                        if core.achievementsCompleted[1] == true then
                            core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died) DO NOT KILL BOSS!")
                            core.achievementsCompleted[1] = false
                        end
                    end
                end
            end

            --Detect when players get the mysterious fruit debuff
            if core.groupSize > 1 then
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
                    end
                    
                    if unit ~= nil then
                        local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
                            if spellId == 220114 and mysteriousFruitPlayers[spawn_uid_dest] == nil then
                                mysteriousFruitCounter = mysteriousFruitCounter + 1
                                mysteriousFruitPlayers[spawn_uid_dest] = spawn_uid_dest
                                print(spawn_uid_dest)
                                print(mysteriousFruitPlayers[spawn_uid_dest])
                                --Achievement requires atleast 10 players in the group to complete so make sure we do not suggest the achievement is completed with groups less than 10
                                if core.groupSize >= 10 then
                                    core:sendMessage(UnitName(unit) .. " has got the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/" .. core.groupSize .. ")")
                                else
                                    core:sendMessage(UnitName(unit) .. " has got the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/10)")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function core._1530:Krosus()
    if core:getBlizzardTrackingStatus(10575) == true then
        core:getAchievementSuccess()
    end

    --Keep a collection of all detected Burning Embers
    --If a burning ember dies than remove from collection
    --When bridge breaks, start a 5 second countdown and store all burning embers which do damage in this time
    --After 5 seconds compare new collection with original collection to see which burning embers where killed from the bridge break

    --Burning Ember Detected Overall
    if core.sourceID == "104262" and burningEmbersUID[core.spawn_uid] == nil then
        --print("Adding: " .. core.spawn_uid)
        burningEmbersUIDCounter = burningEmbersUIDCounter + 1
        burningEmbersUID[core.spawn_uid] = "alive"
        --print("BurningEmbersUIDCounter: " .. burningEmbersUIDCounter)
    elseif core.destID == "104262" and burningEmbersUID[core.spawn_uid_dest] == nil then
        --print("Adding: " .. core.spawn_uid_dest)
        burningEmbersUIDCounter = burningEmbersUIDCounter + 1
        burningEmbersUID[core.spawn_uid_dest] = "alive"
        --print("BurningEmbersUIDCounter: " .. burningEmbersUIDCounter)
    end

    --Burning Ember Killed
    if core.type == "UNIT_DIED" and core.destID == "104262" then
        if burningEmbersUID[core.spawn_uid_dest] ~= nil then
            burningEmbersUIDCounter = burningEmbersUIDCounter - 1
            burningEmbersUID[core.spawn_uid_dest] = "dead"
            --print(core.spawn_uid_dest .. " has been killed. Removing from burningEmbersUID")
            --print("BurningEmbersUIDCounter: " .. burningEmbersUIDCounter)
            if core.destName ~= nil and core.spellName ~= nil then
                core:sendMessage("Burning Ember Killed by " .. core.destName .. " (" .. core.spellName .. ")")
            end
        end
        if burningEmbersUIDBridgeBreak[core.spawn_uid_dest] ~= nil then
            --print(core.spawn_uid_dest .. " killed by player")
            burningEmbersUIDBridgeBreakCounter = burningEmbersUIDBridgeBreakCounter - 1
            burningEmbersUIDBridgeBreak[core.spawn_uid_dest] = "dead"
            --print(core.spawn_uid_dest .. " has been killed. Removing from burningEmbersUIDBridgeBreak")
            --print("BurningEmbersUIDBridgeBreakCounter: " .. burningEmbersUIDBridgeBreakCounter)
        end
    end

    --Slam Counter
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 205862 then
        slamCounter = slamCounter + 1
        --print("Detected Slam: " .. slamCounter)
    end

    --Bridge Break Detected
    if slamCounter % 3 == 0 and slamCounter ~= 0 then
        if timerStarted2 == false then
            timerStarted2 = true
            C_Timer.After(3, function() --This gives time for the adds to fall into the water
                --The bridge has broken. Wait 5 seconds to see which adds have died
                if timerStarted == false then
                    --print("Timer Started Waiting For Bridge Break")
                    timerStarted = true
                    C_Timer.After(3, function() --Time to recount the adds
                        --print("Bridge Broken. Check which adds have died")
                        if core.inCombat == true then

                            --print(burningEmbersUIDCounter)
                            --print(burningEmbersUIDBridgeBreakCounter)
                            burningEmbersKilled = burningEmbersKilled + (burningEmbersUIDCounter - burningEmbersUIDBridgeBreakCounter)
                            core:sendMessage(core:getAchievement() .. " Burning Embers Quenced (" .. burningEmbersKilled .. "/" .. "15)")
    
                            slamCounter = 0
                            burningEmbersUIDBridgeBreak = {}
                            burningEmbersUIDBridgeBreakCounter = 0
                            burningEmbersUID = {}
                            burningEmbersUIDCounter = 0
                            timerStarted = false
                            timerStarted2 = false
    
                            if burningEmbersKilled >= 15 then
                                if core:getBlizzardTrackingStatus(10575) == true then
                                    core:getAchievementSuccess()
                                else
                                    core:sendMessage("ERROR! Blizzard tracker has not gone white. Do not kill boss yet.")
                                end
                            end
                        end
                    end)
                end        
            end)
        end
    end

    --Burning Ember Detected After Bridge Break
    if timerStarted == true then
        --See which Burning Embers are still alive
        if core.sourceID == "104262" and core.spellId == 209017 and burningEmbersUIDBridgeBreak[core.spawn_uid] == nil and burningEmbersUID[core.spawn_uid] ~= "dead" then
            --print(core.spawn_uid .. " is still alive " .. core.spellName)
            burningEmbersUIDBridgeBreakCounter = burningEmbersUIDBridgeBreakCounter + 1
            burningEmbersUIDBridgeBreak[core.spawn_uid] = "alive"
            --print("burningEmbersUIDBridgeBreakCounter: " .. burningEmbersUIDBridgeBreakCounter)
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
    core:trackMob("105630", "Eye of Gul'dan", 16, "16 Eye of Gul'dan have spawned", 1, nil, nil)

    --Enough eyes have spawn so track next kill
    if core.mobCounter >= 16 then
        eyeTarget = true
    end

    if core.type == "UNIT_DIED" and core.destID == "105630" and eyeTarget == true then
        eyeOfGuldanKilled = eyeOfGuldanKilled + 1
        if timerStarted == false then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. " Timer Started! 3 seconds remaining")
            C_Timer.After(3, function()
                if core.inCombat == true then
                    if eyeOfGuldanKilled >= 16 then
                        --print("EYES Killed: " .. eyeOfGuldanKilled)
                        core:getAchievementSuccess()
                    else
                        --print("EYES Killed: " .. eyeOfGuldanKilled)
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