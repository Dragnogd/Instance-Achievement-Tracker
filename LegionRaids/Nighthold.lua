--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Nighthold Bosses
------------------------------------------------------
core._1530 = {}

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
local slamCounter = 0
local timerStarted = false

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
        core:sendMessage(core:getAchievement() .. " Toxic Slice Counter " .. toxicSliceCounter)
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
                C_Timer.After(2000, function() 
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
	end
end

function core._1864:TrackAdditional()
    
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
        --Detect when boss is killed
        if core.type == "UNIT_DIED" and core.destID == "104528" then
            highBotanistTelarnKilled = true
        end

        if highBotanistTelarnKilled == false then
            print("HERE")
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

            --Detect when player dies and whether or not they had the mysterious fruit debuff or not.
            if core.type == "UNIT_DIED" and core.destID ~= nil then
                local name, realm = strsplit("-", core.destID)
                if UnitIsPlayer(name) then
                    --If the player was holding a mysterious fruit then reduce counter by 1
                    if mysteriousFruitPlayers[core.spawn_uid_dest_Player] ~= nil then
                        mysteriousFruitCounter = mysteriousFruitCounter - 1
                        mysteriousFruitPlayers[core.spawn_uid_dest_Player] = nil

                        if core.groupSize >= 10 then
                            core:sendMessage(UnitName(unit) .. " has lost the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/" .. core.groupSize .. ")")
                        else
                            core:sendMessage(UnitName(unit) .. " has lost the Mysterious Fruit debuff (" .. mysteriousFruitCounter .. "/10)")
                        end
        
                        --If achievement had already completed then fail it
                        if core.achievementsCompleted[1] == true then
                            core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died) DO NOT KILL BOSS!")
                            core.achievementsCompleted[1] = false
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
        burningEmbersUID[core.spawn_uid] = core.spawn_uid
    elseif core.destID == "104262" and burningEmbersUID[core.spawn_uid_dest] == nil then
        burningEmbersUID[core.spawn_uid_dest] = core.spawn_uid_dest
    end

    --Burning Ember Killed
    if core.type == "UNIT_DIED" and core.destID == "104262" then
        if burningEmbersUID[core.spawn_uid_dest] ~= nil then
            burningEmbersUID[core.spawn_uid_dest] = nil
        end
        if burningEmbersUIDBridgeBreak[core.spawn_uid_dest] ~= nil then
            burningEmbersUIDBridgeBreak[core.spawn_uid_dest] = nil
        end
    end

    --Slam Counter
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 205862 then
        slamCounter = slamCounter + 1
    end

    --Bridge Break Detected
    if slamCounter % 3 == 0 then
        --The bridge has broken. Wait 5 seconds to see which adds have died
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(5, function() 
                if core.inCombat == true then
                    --Compare differences between the 2 tables to see which burning embers where killed during the bridge break
                    for i = 1, #burningEmbersUID do
                        if core:has_value(burningEmbersUIDBridgeBreak, burningEmbersUID[i]) == false then
                            burningEmbersKilled = burningEmbersKilled + 1
                            burningEmbersUID[i] = nil
                            core:sendMessage(core:getAchievement() .. " Burning Embers Quenced (" .. burningEmbersKilled .. "/" .. "15)")
                        end
                    end
                    burningEmbersUIDBridgeBreak = {}

                    if burningEmbersKilled >= 15 then
                        core:getAchievementSuccess()
                    end
                end
            end)
        end
    end

    --Burning Ember Detected After Bridge Break
    if timerStarted == true then
        --See which Burning Embers are still alive
        if core.sourceID == "104262" and burningEmbersUIDBridgeBreak[core.spawn_uid] == nil then
            burningEmbersUIDBridgeBreak[core.spawn_uid] = core.spawn_uid
        elseif core.destID == "104262" and burningEmbersUIDBridgeBreak[core.spawn_uid_dest] == nil then
            burningEmbersUIDBridgeBreak[core.spawn_uid_dest] = core.spawn_uid_dest
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
    slamCounter = 0
    timerStarted = false

    ------------------------------------------------------
    ---- Gul'dan
    ------------------------------------------------------
    eyeOfGuldanKilled = 0
    timerStarted = false
    eyeTarget = false

    ------------------------------------------------------
    ---- High Botanist Tel'arn
    ------------------------------------------------------
    mysteriousFruitCounter = 0
    mysteriousFruitPlayers = {}
end