--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Manaforge Omega
------------------------------------------------------
core._2810 = {}
core._2810.Events = CreateFrame("Frame")

------------------------------------------------------
---- Plexus Sentinel
------------------------------------------------------
local holdingMouseCounter = 0
local totalMouseCounter = 0
local intermissionStarted = false
local miceSpawnedCounter = 0
local miceSpawnedUID = {}
local collectedMiceDuringIntermissionCounter = 0
local announceMiceSpawned = false
local announceUnknownFail = false
local holdingMouseUID = {}
local intermissionCounter = 0
local multipleMousePlayers = {}
local immunityPlayers = {}
local playersRessedAfterDeath = {}
local achievementCompletedAnnounced = false

------------------------------------------------------
---- Loomithar
------------------------------------------------------

------------------------------------------------------
---- Soulbinder Naazindhri
------------------------------------------------------
local littleUnboundSouls = 0
local littleUnboundSoulsUID = {}

------------------------------------------------------
---- The Soul Hunters
------------------------------------------------------
local blindfoldData = {}
local blindfoldTicker
local blindfoldCounter = 0
local blindfoldUID = {}
local blindFoldPickupCounter = 0
local blindFoldPickupUID = {}
local initialSoulHunterSetup = false

------------------------------------------------------
---- Fractillus
------------------------------------------------------
local columACounter = 0
local columBCounter = 0
local columCCounter = 0
local columDCounter = 0
local columECounter = 0
local columFCounter = 0
local playerLanes = {}
local playersInAnyLane = {}
local fourthWallsBroken = 0
local initialMessageAnnounced = false
local playersSpawnUID = {}
local playersbreakUID = {}
local fourthWallCompleteCheck = false
local pendingWallBreaks = {}
local wallbreakLocked = false
local fractillusDead = false

------------------------------------------------------
---- Dimensius The All Devouring
------------------------------------------------------
local reverseGravityCounter = 0
local reverseGravityUID = {}

function core._2810:PlexusSentinel()
    -- Defeat the Plexus Sentinel after saving all mice from atomization in Manaforge Omega on Normal difficuty or higher.

    -- https://www.wowhead.com/spell=1233449/holding-a-mouse
    -- SPELL_AURA_APPLIED,Creature-0-1631-2810-18952-233814-00001D8D51,"Plexus Sentinel",0x10a48,0x80000000,Player-3674-09C540DB,"Carmentta-TwistingNether-EU",0x514,0x80000000,1220610,"Protocol: Purge",0x1,DEBUFF
    -- SPELL_SUMMON,Creature-0-1631-2810-18952-233814-00001D8D51,"Plexus Sentinel",0x10a48,0x80000000,Creature-0-1631-2810-18952-243803-00001D8DD0,"Sieve Mouse",0xa28,0x80000000,1233439,"Summon Mice",0x1
    -- SPELL_AURA_REMOVED,Creature-0-1631-2810-18952-233814-00001D8D51,"Plexus Sentinel",0x10a48,0x80000000,Creature-0-1631-2810-18952-163366-00001D8DCC,"Magus of the Dead",0x2114,0x80000000,1220610,"Protocol: Purge",0x1,DEBUFF

    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersWithBuff"],holdingMouseCounter,core.groupSize,L["Shared_Total"] .. " " .. totalMouseCounter)

    -- Detect start of intermission (Protocol: Purge) and announce to pickup mice
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 1220618 or core.spellId == 1220981 or core.spellId == 1220982) then
        if intermissionStarted == false then
            intermissionStarted = true
        end
    end

    -- Detect how many mice have spawned
    if core.type == "SPELL_SUMMON" and core.spellId == 1233439 then
        if core.destName ~= nil and miceSpawnedUID[core.spawn_uid_dest] == nil then
            miceSpawnedCounter = miceSpawnedCounter + 1
            miceSpawnedUID[core.spawn_uid_dest] = core.spawn_uid_dest

            -- Start a time then after 2 seconds announce how many mice have spawned
            if announceMiceSpawned == false then
                announceMiceSpawned = true
                C_Timer.After(2, function()
                    core:sendMessage(format(L["Shared_HasSpawned2"], miceSpawnedCounter .. " " .. getNPCName(243803)), true)
                    announceMiceSpawned = false
                end)
            end
        end
    end

    -- Player has collected a mouse
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1233449 then
        if core.destName ~= nil and holdingMouseUID[core.spawn_uid_dest_Player] == nil then
            -- The achievement somtimes bugs and allows players to collect multiple mice so don't limit 1 per player
            holdingMouseCounter = holdingMouseCounter + 1
            totalMouseCounter = totalMouseCounter + 1
            holdingMouseUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            collectedMiceDuringIntermissionCounter = collectedMiceDuringIntermissionCounter + 1
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1233449) .. " " .. L["Shared_Intermission"] .. " (" .. collectedMiceDuringIntermissionCounter .. "/" .. miceSpawnedCounter .. ") ",true)
            InfoFrame_SetPlayerComplete(core.destName)
        elseif core.destName ~= nil and holdingMouseUID[core.spawn_uid_dest_Player] ~= nil then
            -- Player has picked up another mouse when they should only be able to pick up 1
            --core:sendMessage(core.destName .. " " .. L["ManaforgeOmega_CollectedMultipleMice"], true)
            -- Still count for intermission as technically they have picked up a mouse
            collectedMiceDuringIntermissionCounter = collectedMiceDuringIntermissionCounter + 1
            totalMouseCounter = totalMouseCounter + 1
            table.insert(multipleMousePlayers, core.destName)
        end
    end

    -- Player has lost the mouse
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 1233449 and core.encounterStarted == true then
        local playerLostMouse = core.destName
        local playerLostMouseGUID = core.destGUID
        C_Timer.After(0.5, function()
            if playerLostMouse ~= nil then
                if UnitIsDeadOrGhost(UnitTokenFromGUID(playerLostMouseGUID)) == false then
                    holdingMouseCounter = holdingMouseCounter - 1
                    InfoFrame_SetPlayerIncomplete(playerLostMouse)
                    --core:sendMessage(playerLostMouse .. " " .. L["ManaforgeOmega_UsedImmunity"],true)
                    table.insert(immunityPlayers, playerLostMouse)
                end
            end
        end)
    end

    -- Player died before collecting a mouse
    if core.type == "UNIT_DIED" and core.destName ~= nil and core.currentUnit == "Player" then
        if InfoFrame_GetPlayerComplete(core.destName) == false then
            InfoFrame_SetPlayerIncomplete(core.destName)

            --core:sendMessage(core.destName .. " " .. L["Shared_DiedWithoutBuff"],true)
        end
    end

    -- Mouse has been killed by barrier
    if core.type == "UNIT_DIED" and core.destID == "243803" then
        core:getAchievementFailedWithMessageAfter(core.destName .. " " .. L["Shared_HasBeenKilled"])
    end

    -- Player was ressed after collecting a mouse
    if core.type == "SPELL_RESURRECT" and core.destName ~= nil and holdingMouseUID[core.spawn_uid_dest_Player] ~= nil then
        -- Check if the player has collected a mouse already via infoframe
            if InfoFrame_GetPlayerComplete(core.destName) == true then
            -- Spell Resurrect only confirms that a res has been started. We need to wait a moment to see if the player actually accepted the ress
            -- Loop a ticker that keeps checking if the player is dead or not
            local currentName = core.destName
            C_Timer.NewTicker(1, function(ticker)
                if UnitIsDeadOrGhost(currentName) == false then
                    -- Player has accepted the ress
                    holdingMouseCounter = holdingMouseCounter - 1
                    InfoFrame_SetPlayerIncomplete(currentName)
                    --core:sendMessage(currentName .. " " .. L["ManaforgeOmega_RessedAfterCollectingMice"],true)
                    table.insert(playersRessedAfterDeath, currentName)
                    ticker:Cancel()
                end

                -- if the encounter has reset then stop ticker
                if holdingMouseCounter == 0 then
                    ticker:Cancel()
                end
            end, 60) -- Check up to 20 seconds
        end
    end

    -- Detect end of intermission and and check if all mice have been picked up in time
    -- If they have not then announce fail
    if core.type == "SPELL_AURA_REMOVED" and (core.spellId == 1220618 or core.spellId == 1220981 or core.spellId == 1220982) then
        -- If not all mice have been collected then fail the achievement
        intermissionCounter = intermissionCounter + 1

        -- Fail if not all mie were collected during the intermission
        if collectedMiceDuringIntermissionCounter < miceSpawnedCounter then
            core:getAchievementFailedWithMessageAfter("(" .. L["Shared_Intermission"] .. " " .. collectedMiceDuringIntermissionCounter .. "/" .. miceSpawnedCounter .. ")" )
        end

        -- If tracker is not white after the 3rd intermission then something has gone wrong
        if intermissionCounter == 3 and core:getBlizzardTrackingStatus(42118, 1) == false then
            core:getAchievementFailed()

            local failMessages = {}

            -- 1. A player has picked up multiple mice
            for _, player in ipairs(multipleMousePlayers) do
                table.insert(failMessages, player .. " (" .. L["ManaforgeOmega_FailedMultipleMice"] .. ")")
            end

            -- 2. A player lost the debuff from an immunity
            for _, player in ipairs(immunityPlayers) do
                table.insert(failMessages, player .. " (" .. L["ManaforgeOmega_FailedImmunity"] .. ")")
            end

            -- 3. A player was ressed after dying and already having picked up a mouse
            for _, player in ipairs(playersRessedAfterDeath) do
                table.insert(failMessages, player .. " (" .. L["ManaforgeOmega_FailedRessed"] .. ")")
            end

            if #failMessages > 0 then
                core:sendMessageSafe(table.concat(failMessages, ", "), false, true)
            end
        end

        -- Reset intermission variables reading for next intermission
        intermissionStarted = false
        miceSpawnedCounter = 0
        miceSpawnedUID = {}
        collectedMiceDuringIntermissionCounter = 0
    end

    -- If the tracker has not gone white then we need to inform group
    if holdingMouseCounter == core.groupSize and announceUnknownFail == false then
        announceUnknownFail = true
        -- Wait 1 second then check blizzard tracker
        C_Timer.After(2, function()
            if core:getBlizzardTrackingStatus(42118, 1) == false then
                core:sendMessage(L["Shared_BlizzardTrackerNotWhite"])
            end
        end)
    end

    --Announce success once everyone is holding a mouse at some point throughout the fight
    if core:getBlizzardTrackingStatus(42118, 1) == true then
        core:getAchievementSuccess()
        achievementCompletedAnnounced = true
    end

    -- Failed after success
    if achievementCompletedAnnounced == true and core:getBlizzardTrackingStatus(42118, 1) == false then
        core:getAchievementFailed()
    end
end

function core._2810:Loomithar()
    -- Defeat Loom'ithar after everyone decides whether they would rather /cower from it or /cuddle it before starting the battle in Manaforge Omega on Normal difficulty or higher.

    -- https://www.wowhead.com/spell=1246713/adored
    -- https://www.wowhead.com/spell=1246718/voted
    -- https://www.wowhead.com/spell=1246711/feared
    -- https://www.wowhead.com/spell=1247129/scary
    -- https://www.wowhead.com/spell=1247128/cute

    if core:getBlizzardTrackingStatus(41613, 1) == true then
        core:getAchievementSuccess()
    else
        core:getAchievementFailed()
    end
end

function core._2810:SoulbinderNaazindhri()
    -- Defeat Soulbinder Naazindhri after defeating all Little Unbound Souls in Manaforge Omega on Normal difficulty or higher.

    -- Detect when all 4 Little Unbound Souls are defeated
    if core.type == "UNIT_DIED" and core.destID == "248707" then
        if littleUnboundSoulsUID[core.spawn_uid_dest] == nil then
            littleUnboundSoulsUID[core.spawn_uid_dest] = core.spawn_uid_dest
            littleUnboundSouls = littleUnboundSouls + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(248707) .. " " .. L["Shared_Killed"] .. " (" .. littleUnboundSouls .. "/4)",true)
        end
    end

    if core:getBlizzardTrackingStatus(41614, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2810:ForgeweaverAraz()
    -- Defeat Forgeweaver Araz after destroying a Void Forged Echo in Manaforge Omega on Normal difficulty or higher.

    -- https://www.wowhead.com/spell=1244502/forged-echo
    -- https://www.wowhead.com/spell=1248816/void-forged-echo

    --SPELL_AURA_APPLIED,Creature-0-1631-2810-18952-241923-00001DA34E,"Arcane Echo",0xa48,0x80000000,Creature-0-1631-2810-18952-241923-00001DA34E,"Arcane Echo",0xa48,0x80000000,1248816,"Void Forged Echo",0x20,BUFF

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1248816 then
        core:sendMessage(format(L["Shared_KillTheAddNow"], C_Spell.GetSpellInfo(1248816).name),true)
    end

    if core:getBlizzardTrackingStatus(41615, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2810:SoulHunters()
    -- Defeat the Soul Hunters after all players have worn Adarus' spare blindfold at least 1 time in Manaforge Omega on Normal difficulty or higher.

    -- Update header each tick
    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"], blindfoldCounter, core.groupSize)

    if initialSoulHunterSetup == false then
        initialSoulHunterSetup = true
		for player,status in pairs(core.InfoFrame_PlayersTable) do
            InfoFrame_SetPlayerNeutralWithMessage(player, "")
		end
    end

    -- Blindfold applied or refreshed
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REFRESH") and core.spellId == 1246980 then
        local uid = core.spawn_uid_dest_Player
        if core.destName then
            -- Always reset tracking info on refresh
            blindfoldData[uid] = {
                startTime = GetTime(),
                duration = 59, -- full duration in seconds
                destName = core.destName,
                uid = core.spawn_uid_dest_Player,
            }

            if blindfoldUID[uid] == nil then
                -- Update frame immediately to reset countdown
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, 59)
            end

            -- Start single global ticker if not running
            if not blindfoldTicker then
                blindfoldTicker = C_Timer.NewTicker(1, function()
                    local now = GetTime()
                    for puid, data in pairs(blindfoldData) do
                        if not data.completed then
                            local elapsed = now - data.startTime
                            local remaining = math.ceil(data.duration - elapsed)

                            if remaining >= 0 and blindfoldUID[data.uid] == nil then
                                -- Update info frame with remaining time
                                InfoFrame_SetPlayerNeutralWithMessage(data.destName, remaining)
                            end
                        end
                    end
                end)
            end
        end
    end

    -- Achievement complete check
    if core:getBlizzardTrackingStatus(41616, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2810:Fractillus()
    -- Defeat Fractillus after destroying a fourth wall 18 times in Manaforge Omega on Normal difficulty or higher.

    if initialMessageAnnounced == false then
        local playersNotInLane = L["ManaforgeOmega_PlayersNotInLane"] .. ": "
        local playerFound = false
        for k,player in pairs(core:getPlayersInGroupForAchievement()) do
            if playersInAnyLane[player] == nil then
                playersNotInLane = playersNotInLane .. player .. ", "
                playerFound = true
            end
        end

        if playerFound == true then
            core:sendMessageSafe(playersNotInLane,true)
        end

        core:sendMessage(L["ManaforgeOmega_AccurateTracking"],true)

        initialMessageAnnounced = true
    end

    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderMessage(
        InfoFrame_GetIcon(1) .. ":" .. columFCounter .. " " ..
        InfoFrame_GetIcon(2) .. ":" .. columECounter .. " " ..
        InfoFrame_GetIcon(3) .. ":" .. columDCounter .. " " ..
        InfoFrame_GetIcon(4) .. ":" .. columCCounter .. " " ..
        InfoFrame_GetIcon(7) .. ":" .. columBCounter .. " " ..
        InfoFrame_GetIcon(6) .. ":" .. columACounter .. "\n"
    )
    core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
    core.IATInfoFrame:SetText2(L["ManaforgeOmega_TrackingLanes"] .."\n\n", 200)

    -- Wall spawning

    -- Player (SPELL_AURA_APPLIED) or Tank (SPELL_CAST_START) is marked to spawn a wall
    -- https://www.wowhead.com/spell=1233411/crystalline-shockwave
    if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 1233411) or (core.type == "SPELL_CAST_START" and core.spellId == 1231871) then
        if core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] ~= nil then
            --core:sendDebugMessage("Wall spawn soon detected for " .. core.destName)

            -- Mark player on infoframe as spawning
            -- If they are spawning into a row with too many walls already then mark them as failed
            if playerLanes[core.spawn_uid_dest_Player] == "A" then
                if columACounter == 5 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(6) .. " " .. L["Shared_Spawn"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(6) .. " " .. L["Shared_Spawn"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "B" then
                if columBCounter == 5 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(7) .. " " .. L["Shared_Spawn"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(7) .. " " .. L["Shared_Spawn"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "C" then
                if columCCounter == 5 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(4) .. " " .. L["Shared_Spawn"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(4) .. " " .. L["Shared_Spawn"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "D"  then
                if columDCounter == 5 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(3) .. " " .. L["Shared_Spawn"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(3) .. " " .. L["Shared_Spawn"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "E" then
                if columECounter == 5 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(2) .. " " .. L["Shared_Spawn"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(2) .. " " .. L["Shared_Spawn"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "F" then
                if columFCounter == 5 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(1) .. " " .. L["Shared_Spawn"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(1) .. " " .. L["Shared_Spawn"])
                end
            end

            -- Add to spawn table
            playersSpawnUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
        elseif core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] == nil then
            -- Warn tracking will not be accurate
            core:sendMessage(L["ManaforgeOmega_CannotDetectWallLocation"] .. " " .. core.destName,true)
        end
    end

    -- Player has spawned a wall
    if (core.type == "SPELL_AURA_REMOVED" and core.spellId == 1233411) or (core.type == "SPELL_CAST_SUCCESS" and core.spellId == 1231871) then
        --core:sendDebugMessage("Wall spawn detected event for " .. core.destName .. core.type .. " " .. core.spellId)
        -- A wall has been spawned. We need to increment the counter for the lane the player is in
        if core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] ~= nil then
            if playerLanes[core.spawn_uid_dest_Player] == "A" then
                columACounter = columACounter + 1
                --core:sendDebugMessage("Column A counter is now " .. columACounter .. " after wall spawned by " .. core.destName)
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, InfoFrame_GetIcon(6))
            elseif playerLanes[core.spawn_uid_dest_Player] == "B" then
                columBCounter = columBCounter + 1
                --core:sendDebugMessage("Column B counter is now " .. columBCounter .. " after wall spawned by " .. core.destName)
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, InfoFrame_GetIcon(7))
            elseif playerLanes[core.spawn_uid_dest_Player] == "C" then
                columCCounter = columCCounter + 1
                --core:sendDebugMessage("Column C counter is now " .. columCCounter .. " after wall spawned by " .. core.destName)
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, InfoFrame_GetIcon(4))
            elseif playerLanes[core.spawn_uid_dest_Player] == "D" then
                columDCounter = columDCounter + 1
                --core:sendDebugMessage("Column D counter is now " .. columDCounter .. " after wall spawned by " .. core.destName)
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, InfoFrame_GetIcon(3))
            elseif playerLanes[core.spawn_uid_dest_Player] == "E" then
                columECounter = columECounter + 1
                --core:sendDebugMessage("Column E counter is now " .. columECounter .. " after wall spawned by " .. core.destName)
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, InfoFrame_GetIcon(2))
            elseif playerLanes[core.spawn_uid_dest_Player] == "F" then
                columFCounter = columFCounter + 1
                --core:sendDebugMessage("Column F counter is now " .. columFCounter .. " after wall spawned by " .. core.destName)
                InfoFrame_SetPlayerNeutralWithMessage(core.destName, InfoFrame_GetIcon(1))
            end

            -- Remove from spawn table
            if playersSpawnUID[core.spawn_uid_dest_Player] ~= nil then
                playersSpawnUID[core.spawn_uid_dest_Player] = nil
            end
        elseif core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] == nil then
            -- Warn tracking will not be accurate
            core:sendMessage(L["ManaforgeOmega_CannotDetectWallLocation"] .. " " .. core.destName,true)
        end
    end

    -- Wall breaking

    -- Player is going to break a wall
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1227373 then
        if core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] ~= nil then
            --core:sendDebugMessage("Wall break soon detected for " .. core.destName)

            -- Mark Infoframe failed if player are breaking a lane that does have 4 walls
            if playerLanes[core.spawn_uid_dest_Player] == "A" then
                if columACounter ~= 4 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(6) .. " " .. L["Shared_Break"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(6) .. " " .. L["Shared_Break"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "B" then
                if columBCounter ~= 4 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(7) .. " " .. L["Shared_Break"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(7) .. " " .. L["Shared_Break"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "C" then
                if columCCounter ~= 4 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(4) .. " " .. L["Shared_Break"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(4) .. " " .. L["Shared_Break"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "D" then
                if columDCounter ~= 4 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(3) .. " " .. L["Shared_Break"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(3) .. " " .. L["Shared_Break"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "E" then
                if columECounter ~= 4 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(2) .. " " .. L["Shared_Break"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(2) .. " " .. L["Shared_Break"])
                end
            elseif playerLanes[core.spawn_uid_dest_Player] == "F" then
                if columFCounter ~= 4 then
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, InfoFrame_GetIcon(1) .. " " .. L["Shared_Break"])
                else
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, InfoFrame_GetIcon(1) .. " " .. L["Shared_Break"])
                end
            end

            -- Add to break table
            playersbreakUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
        elseif core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] == nil then
            -- Warn tracking will not be accurate
            core:sendMessage(L["ManaforgeOmega_CannotDetectWallLocation"] .. " " .. core.destName,true)
        end
    end

    -- Player has broken a wall
    -- https://www.wowhead.com/spell=1227373/shattershell
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 1227373 then
        -- A wall has been spawned. We need to increment the counter for the lane the player is in
        if core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] ~= nil then
            local currentName = core.destName
            local currentSpawnUIDDestPlayer = core.spawn_uid_dest_Player
            -- We need to wait a moment to see if the player is dead or not
            C_Timer.After(0.5, function()
                if UnitIsDeadOrGhost(currentName) == false then
                    -- Increment pendingWallbreaks for lane
                    table.insert(pendingWallBreaks, playerLanes[currentSpawnUIDDestPlayer])

                    if playerLanes[currentSpawnUIDDestPlayer] == "A" then
                        if columACounter > 0 then
                            columACounter = columACounter - 1
                        end
                        --core:sendDebugMessage("Column A counter is now " .. columACounter .. " after wall broken by " .. currentName)
                        InfoFrame_SetPlayerNeutralWithMessage(currentName, InfoFrame_GetIcon(6))
                    elseif playerLanes[currentSpawnUIDDestPlayer] == "B" then
                        if columBCounter > 0 then
                            columBCounter = columBCounter - 1
                        end
                        --core:sendDebugMessage("Column B counter is now " .. columBCounter .. " after wall broken by " .. currentName)
                        InfoFrame_SetPlayerNeutralWithMessage(currentName, InfoFrame_GetIcon(7))
                    elseif playerLanes[currentSpawnUIDDestPlayer] == "C" then
                        if columCCounter > 0 then
                            columCCounter = columCCounter - 1
                        end
                        --core:sendDebugMessage("Column C counter is now " .. columCCounter .. " after wall broken by " .. currentName)
                        InfoFrame_SetPlayerNeutralWithMessage(currentName, InfoFrame_GetIcon(4))
                    elseif playerLanes[currentSpawnUIDDestPlayer] == "D" then
                        if columDCounter > 0 then
                            columDCounter = columDCounter - 1
                        end
                        --core:sendDebugMessage("Column D counter is now " .. columDCounter .. " after wall broken by " .. currentName)
                        InfoFrame_SetPlayerNeutralWithMessage(currentName, InfoFrame_GetIcon(3))
                    elseif playerLanes[currentSpawnUIDDestPlayer] == "E" then
                        if columECounter > 0 then
                            columECounter = columECounter - 1
                        end
                        --core:sendDebugMessage("Column E counter is now " .. columECounter .. " after wall broken by " .. currentName)
                        InfoFrame_SetPlayerNeutralWithMessage(currentName, InfoFrame_GetIcon(2))
                    elseif playerLanes[currentSpawnUIDDestPlayer] == "F" then
                        if columFCounter > 0 then
                            columFCounter = columFCounter - 1
                        end
                        --core:sendDebugMessage("Column F counter is now " .. columFCounter .. " after wall broken by " .. currentName)
                        InfoFrame_SetPlayerNeutralWithMessage(currentName, InfoFrame_GetIcon(1))
                    end
                else
                    -- If the player died then set them back to neutral on Infoframe
                    InfoFrame_SetPlayerNeutralWithMessage(currentName, "")
                end

                -- Remove from break table
                if playersbreakUID[currentSpawnUIDDestPlayer] ~= nil then
                    playersbreakUID[currentSpawnUIDDestPlayer] = nil
                end
            end)
        elseif core.destName ~= nil and playerLanes[core.spawn_uid_dest_Player] == nil then
            core:sendMessage(L["ManaforgeOmega_CannotDetectWallLocation"] .. " " .. core.destName,true)
        end

        if wallbreakLocked == false then
            core:sendDebugMessage("Running wall break check. Locked")
            wallbreakLocked = true
            -- Wait a moment to see if any other walls are being broken at the same time
            C_Timer.After(3, function()
                core:sendDebugMessage("Checking for additional wall breaks")
                local aTemp = columACounter
                local bTemp = columBCounter
                local cTemp = columCCounter
                local dTemp = columDCounter
                local eTemp = columECounter
                local fTemp = columFCounter
                core:sendDebugMessage("Wall break check results: A=" .. aTemp .. ", B=" .. bTemp .. ", C=" .. cTemp .. ", D=" .. dTemp .. ", E=" .. eTemp .. ", F=" .. fTemp)
                for i, lane in ipairs(pendingWallBreaks) do
                    -- if the lane has walls broken greater than 0
                    -- Add 1 to the temp counter for current lane
                    core:sendDebugMessage("Wall break detected in lane " .. lane)
                    if lane == "A" then
                        aTemp = aTemp + 1
                    elseif lane == "B" then
                        bTemp = bTemp + 1
                    elseif lane == "C" then
                        cTemp = cTemp + 1
                    elseif lane == "D" then
                        dTemp = dTemp + 1
                    elseif lane == "E" then
                        eTemp = eTemp + 1
                    elseif lane == "F" then
                        fTemp = fTemp + 1
                    end

                    -- Now check if it meets four for the current lane
                    local wallFound = false
                    if lane == "A" and aTemp == 4 then
                        wallFound = true
                    elseif lane == "B" and bTemp == 4 then
                        wallFound = true
                    elseif lane == "C" and cTemp == 4 then
                        wallFound = true
                    elseif lane == "D" and dTemp == 4 then
                        wallFound = true
                    elseif lane == "E" and eTemp == 4 then
                        wallFound = true
                    elseif lane == "F" and fTemp == 4 then
                        wallFound = true
                    end
                    core:sendDebugMessage("Wall break lane " .. lane .. " check is " .. tostring(wallFound) .. " (A=" .. aTemp .. ", B=" .. bTemp .. ", C=" .. cTemp .. ", D=" .. dTemp .. ", E=" .. eTemp .. ", F=" .. fTemp .. ")")

                    if wallFound == true then
                        core:sendDebugMessage("Fourth wall broken in lane " .. lane)
                        fourthWallsBroken = fourthWallsBroken + 1

                        -- If the fourth wall is the 18th to break, then check blizzard tracker is white before announcing as
                        -- Players always seem to just kill the boss regardless of warning them of a tracker error, so if we don't
                        -- announce the 18th wall broken unless 100% sure, this should stop people killing the boss by mistake
                        -- The blizzard tracker might not be instant, so we will check initially, then again after 3 seconds
                        if fourthWallsBroken >= 18 then
                            -- Do initial announce
                            C_Timer.After(1, function()
                                if core:getBlizzardTrackingStatus(41617) == true then
                                    core:sendMessage(core:getAchievement() .. " " .. L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)",true)
                                end
                            end)
                        else
                            -- Not an 18th wall so just announce
                            core:sendMessage(core:getAchievement() .. " " .. L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)",true)
                        end
                    end
                end

                -- Clear table
                pendingWallBreaks = {}

                core:sendDebugMessage("Wall break check complete. Unlocked")
                wallbreakLocked = false
            end)
        end
    end

    -- Check if Fractllius is dead
    if core.type == "UNIT_DIED" and core.destID == "237861" then
        fractillusDead = true
    end

    -- If the fourth wall counte equals 18, and the blizzard tracker is not complete we need to warn players not to kill boss as something has gone wrong
    -- if fourthWallsBroken == 18 and fourthWallCompleteCheck == false then
    --     fourthWallCompleteCheck = true
    --     -- Wait 1 second then check blizzard tracker
    --     C_Timer.After(1, function()
    --         if core:getBlizzardTrackingStatus(41617) == false then
    --             core:sendMessage(L["Core_WaitForTrackerToConfirm"],true)
    --         end
    --     end)
    -- end

    if core:getBlizzardTrackingStatus(41617) == true then
        -- If our fourth wall broken counter is less than 18 then announce achievement is successfull but our tracker has encounted an error
        core:getAchievementSuccess()
    end
end

function core._2810:NexusKingSalhadaar()
    -- Defeat Nexus-King Salhadaar alongside a hidden assassin in Manaforge Omega on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(41618 , 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2810:DimensiusTheAllDevouring()
    -- Defeat Dimensius, the All-Devouring after allowing every member of your raid to be hit by Reverse Gravity at least once in Manaforge Omega on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],reverseGravityCounter,core.groupSize)

    -- Player hit by Reverse Gravity
    if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 1243577) or ((core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED") and core.spellId == 1243581) then
        if core.destName ~= nil and reverseGravityUID[core.spawn_uid_dest_Player] == nil then
            reverseGravityCounter = reverseGravityCounter + 1
            reverseGravityUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1243577) .. " (" .. reverseGravityCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    if core:getBlizzardTrackingStatus(41619, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2810:InstanceCleanup()
    core._2810.Events:UnregisterEvent("UNIT_AURA")
    core._2810.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")

    fractillusDead = false
end

core._2810.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2810:InitialSetup()
    core._2810.Events:RegisterEvent("UNIT_AURA")
    core._2810.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2810.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
	if core:issecret(unitTarget) or core:issecret(castGUID) or core:issecret(spellID) then return end
    --"<13.04 21:01:51> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{秋怜} -Column A Aura- [[raid5:Cast-3-5773-2810-3675-1223483-0030716DAF:1223483]]",
    --"<32.63 21:02:10> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{季夜} -Column B Aura- [[party2:Cast-3-5773-2810-3675-1223484-0062F16DC2:1223484]]",
    --"<34.71 21:02:13> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Snowfive} -Column C Aura- [[raid8:Cast-3-5773-2810-3675-1223485-0052F16DC4:1223485]]",
    --"<37.72 21:02:16> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Gigitti} -Column D Aura- [[raid2:Cast-3-5773-2810-3675-1223486-0064716DC7:1223486]]",
    --"<43.54 21:02:21> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Gigitti} -Column E Aura- [[raid2:Cast-3-5773-2810-3675-1223489-0058F16DCD:1223489]]",
    --"<47.41 21:02:25> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Mal} -Column F Aura- [[raid6:Cast-3-5773-2810-3675-1223493-003B716DD1:1223493]]",

    -- When we receive a spell cast success for one of the column auras we need to get the guid of the player then check which UID table they are in
    if fractillusDead == false and (spellID == 1223483 or spellID == 1223484 or spellID == 1223485 or spellID == 1223486 or spellID == 1223489 or spellID == 1223493) then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(41617))
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()

       InfoFrame_SetHeaderMessage(
            InfoFrame_GetIcon(1) .. ":" .. columFCounter .. " " ..
            InfoFrame_GetIcon(2) .. ":" .. columECounter .. " " ..
            InfoFrame_GetIcon(3) .. ":" .. columDCounter .. " " ..
            InfoFrame_GetIcon(4) .. ":" .. columCCounter .. " " ..
            InfoFrame_GetIcon(7) .. ":" .. columBCounter .. " " ..
            InfoFrame_GetIcon(6) .. ":" .. columACounter .. "\n"
        )
        core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
        core.IATInfoFrame:SetText2(L["ManaforgeOmega_TrackingLanes"] .."\n\n", 200)

        -- Get player guid
        local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unitTarget))
        local name, realm = UnitName(unitTarget)

        -- Mark sure they are on InfoFrame if they join late as InfoFrame does not reset properly here due to always being shown for boss
        if core.InfoFrame_PlayersTable[name] == nil then
            core.InfoFrame_PlayersTable[name] = {1,""}
        end

        --core:sendDebugMessage("Wall aura detected for " .. unitTarget .. " with spellID " .. spellID .. " and UID " .. spawn_uid_dest)

        -- Store which lane the player is in
        if spellID == 1223483 then
            playerLanes[spawn_uid_dest] = "A"
            --core:sendDebugMessage("Player " .. unitTarget .. " is in lane A")
            core._2810:UpdatePlayerLane(name, 6, "A", spawn_uid_dest)
        elseif spellID == 1223484 then
            playerLanes[spawn_uid_dest] = "B"
            --core:sendDebugMessage("Player " .. unitTarget .. " is in lane B")
            core._2810:UpdatePlayerLane(name, 7, "B", spawn_uid_dest)
        elseif spellID == 1223485 then
            playerLanes[spawn_uid_dest] = "C"
            --core:sendDebugMessage("Player " .. unitTarget .. " is in lane C")
            core._2810:UpdatePlayerLane(name, 4, "C", spawn_uid_dest)
        elseif spellID == 1223486 then
            playerLanes[spawn_uid_dest] = "D"
            --core:sendDebugMessage("Player " .. unitTarget .. " is in lane D")
            core._2810:UpdatePlayerLane(name, 3, "D", spawn_uid_dest)
        elseif spellID == 1223489 then
            playerLanes[spawn_uid_dest] = "E"
            --core:sendDebugMessage("Player " .. unitTarget .. " is in lane E")
            core._2810:UpdatePlayerLane(name, 2, "E", spawn_uid_dest)
        elseif spellID == 1223493 then
            playerLanes[spawn_uid_dest] = "F"
            --core:sendDebugMessage("Player " .. unitTarget .. " is in lane F")
            core._2810:UpdatePlayerLane(name, 1, "F", spawn_uid_dest)
        end

        playersInAnyLane[name] = name
    end
end

function core._2810:UpdatePlayerLane(name, icon, lane, spawn_uid_dest)
    local currentStatus = InfoFrame_GetPlayerStatusWithMessage(name)

    if currentStatus == 2 or currentStatus == 3 then
        -- Green or Red

        -- Check which table they are in and update accordingly
        if playersSpawnUID[spawn_uid_dest] ~= nil then
            -- Check if the lane they are in has 5 walls already spawned
            if lane == "A" and columACounter == 5 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            elseif lane == "B" and columBCounter == 5 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            elseif lane == "C" and columCCounter == 5 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            elseif lane == "D" and columDCounter == 5 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            elseif lane == "E" and columECounter == 5 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            elseif lane == "F" and columFCounter == 5 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            else
                InfoFrame_SetPlayerCompleteWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Spawn"])
            end
        elseif playersbreakUID[spawn_uid_dest] ~= nil then
            -- Check if the lane they are has 4 walls spawned
            if lane == "A" and columACounter ~= 4 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            elseif lane == "B" and columBCounter ~= 4 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            elseif lane == "C" and columCCounter ~= 4 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            elseif lane == "D" and columDCounter ~= 4 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            elseif lane == "E" and columECounter ~= 4 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            elseif lane == "F" and columFCounter ~= 4 then
                InfoFrame_SetPlayerFailedWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            else
                InfoFrame_SetPlayerCompleteWithMessage(name, InfoFrame_GetIcon(icon) .. " " .. L["Shared_Break"])
            end
        else
            InfoFrame_SetPlayerCompleteWithMessage(name, InfoFrame_GetIcon(icon))
        end
    else
        -- Neutral
        InfoFrame_SetPlayerNeutralWithMessage(name, InfoFrame_GetIcon(icon))
    end
end

function core._2810:TrackAdditional()
    --Soulrender Dormazain -- Hellscream's Burden
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1247724 and core.destName ~= nil and core.encounterStarted == false then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(41616))
        InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(1247724) .. " " .. L["Core_Counter"],blindFoldPickupCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()

        if blindFoldPickupUID[core.spawn_uid_dest_Player] == nil then
            blindFoldPickupUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            blindFoldPickupCounter = blindFoldPickupCounter + 1
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1247724) .. " (" .. blindFoldPickupCounter .. "/" .. core.groupSize .. ")", true)
            InfoFrame_SetPlayerCompleteWithMessage(core.destName, "")
        end

        --Update with any changes
        InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(1247724) .. " " .. L["Core_Counter"],blindFoldPickupCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    end
end

function core._2810.Events:UNIT_AURA(self, unitID)
	if next(core.currentBosses) ~= nil then
        if core.currentBosses[1].encounterID == 3122 then
			-- I See... Absolutely Nothing
			local name, realm = UnitName(unitID)
            local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unitID));

            local spellInfo = C_Spell.GetSpellInfo(1247671)

            if spellInfo ~= nil then
                local aura = C_UnitAuras.GetAuraDataBySpellName(unitID, spellInfo.name)
                if aura then
                    if name ~= nil then
                        if blindfoldUID[spawn_uid_dest] == nil then
                            blindfoldUID[spawn_uid_dest] = spawn_uid_dest
                            blindfoldCounter = blindfoldCounter + 1
                            core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1247671) .. " (" .. blindfoldCounter .. "/" .. core.groupSize .. ")", true)
                            InfoFrame_SetPlayerCompleteWithMessage(name, "")
                        end
                    end
                end
            end
		end
    end

    -- Loom'ithar - Voted
    -- if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 1246718 then
    --     core.IATInfoFrame:ToggleOn()
    --     core.IATInfoFrame:SetHeading(GetAchievementLink(41613))
    --     InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(1246718) .. " " .. L["Core_Counter"],votedCounter,core.groupSize)
    --     InfoFrame_UpdatePlayersOnInfoFrame()

    --     local name, realm = UnitName(unitID)
    --     local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unitID));

    --     local spellInfo = C_Spell.GetSpellInfo(1246718)

    --     if spellInfo ~= nil then
    --         local aura = C_UnitAuras.GetAuraDataBySpellName(unitID, spellInfo.name)
    --         if aura then
    --             if name ~= nil then
    --                 if votedUID[spawn_uid_dest] == nil then
    --                     votedUID[spawn_uid_dest] = spawn_uid_dest
    --                     votedCounter = votedCounter + 1
    --                     core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1246718) .. " (" .. votedCounter .. "/" .. core.groupSize .. ")", true)
    --                     InfoFrame_SetPlayerComplete(name)
    --                 end
    --             end
    --         end

    --         -- If aura is not found
    --         if aura == nil then
    --             if name ~= nil then
    --                 if votedUID[spawn_uid_dest] ~= nil then
    --                     votedUID[spawn_uid_dest] = nil
    --                     if votedCounter > 0 then
    --                         votedCounter = votedCounter - 1
    --                     end
    --                     InfoFrame_SetPlayerNeutral(name)
    --                 end
    --             end
    --         end
    --     end

    --     --Update with any changes
    --     InfoFrame_UpdatePlayersOnInfoFrame()

    --     --Hide if no one has the debuff anymore
    --     if votedCounter == 0 then
    --         core.IATInfoFrame:ToggleOff()
    --     end
    -- end
end

function core._2810:ClearVariables()
    ------------------------------------------------------
    ---- Plexus Sentinel
    ------------------------------------------------------
    holdingMouseCounter = 0
    totalMouseCounter = 0
    intermissionStarted = false
    miceSpawnedCounter = 0
    miceSpawnedUID = {}
    collectedMiceDuringIntermissionCounter = 0
    announceMiceSpawned = false
    announceUnknownFail = false
    holdingMouseUID = {}
    intermissionCounter = 0
    multipleMousePlayers = {}
    immunityPlayers = {}
    playersRessedAfterDeath = {}
    achievementCompletedAnnounced = false

    ------------------------------------------------------
    ---- Loomithar
    ------------------------------------------------------

    ------------------------------------------------------
    ---- Soulbinder Naazindhri
    ------------------------------------------------------
    littleUnboundSouls = 0
    littleUnboundSoulsUID = {}

    ------------------------------------------------------
    ---- The Soul Hunters
    ------------------------------------------------------
    blindfoldData = {}
    if blindfoldTicker then
        blindfoldTicker:Cancel()
        blindfoldTicker = nil
    end
    blindfoldCounter = 0
    blindfoldUID = {}
    blindFoldPickupCounter = 0
    blindFoldPickupUID = {}
    initialSoulHunterSetup = false

    ------------------------------------------------------
    ---- Dimensius The All Devouring
    ------------------------------------------------------
    reverseGravityCounter = 0
    reverseGravityUID = {}

    ------------------------------------------------------
    ---- Fractillus
    ------------------------------------------------------
    columACounter = 0
    columBCounter = 0
    columCCounter = 0
    columDCounter = 0
    columECounter = 0
    columFCounter = 0
    fourthWallsBroken = 0
    initialMessageAnnounced = false
    playersSpawnUID = {}
    playersbreakUID = {}
    fourthWallCompleteCheck = false
    pendingWallBreaks = {}
    wallbreakLocked = false
end