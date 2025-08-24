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
local holdingMouseUID = {}
local intermissionStarted = false
local miceSpawnedCounter = 0
local miceSpawnedUID = {}
local collectedMiceDuringIntermissionCounter = 0
local announceMiceSpawned = false

------------------------------------------------------
---- Loomithar
------------------------------------------------------
local votedCounter = 0
local votedUID = {}

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

------------------------------------------------------
---- Fractillus
------------------------------------------------------
local columACounter = 0
local columBCounter = 0
local columCCounter = 0
local columDCounter = 0
local columECounter = 0
local columFCounter = 0
local wallSpawnUID = {}
local wallBreakUID = {}
local wallBrokenUID = {}
local playerLanes = {}
local fourthWallsBroken = 0

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
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],holdingMouseCounter,core.groupSize)

    -- Detect start of intermission (Protocol: Purge) and announce to pickup mice
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 1220618 or core.spellId == 1220981 or core.spellId == 1220982) then
        if intermissionStarted == false then
            intermissionStarted = true
            core:sendMessage(format(L["Shared_CollectNow"], getNPCName(243803)),true)
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

    -- Player as collected a mouse
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1233449 then
        if core.destName ~= nil and holdingMouseUID[core.spawn_uid_dest_Player] == nil then
            holdingMouseCounter = holdingMouseCounter + 1
            collectedMiceDuringIntermissionCounter = collectedMiceDuringIntermissionCounter + 1
            holdingMouseUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1233449) .. " " .. L["Shared_Intermission"] .. " (" .. collectedMiceDuringIntermissionCounter .. "/" .. miceSpawnedCounter .. ") " .. L["Shared_Total"] .. " (" .. holdingMouseCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    -- Detect end of intermission and and check if all mice have been picked up in time
    -- If they have not then announce fail
    if core.type == "SPELL_AURA_REMOVED" and (core.spellId == 1220618 or core.spellId == 1220981 or core.spellId == 1220982) then
        -- If not all mice have been collected then fail the achievement
        if collectedMiceDuringIntermissionCounter < miceSpawnedCounter then
            core:getAchievementFailedWithMessageAfter("(" .. L["Shared_Intermission"] .. " " .. collectedMiceDuringIntermissionCounter .. "/" .. miceSpawnedCounter .. ")" )
        end

        -- Reset intermission variables reading for next intermission
        intermissionStarted = false
        miceSpawnedCounter = 0
        miceSpawnedUID = {}
        collectedMiceDuringIntermissionCounter = 0
    end

    --Announce success once everyone is holding a mouse at some point throughout the fight
    if holdingMouseCounter == core.groupSize and core:getBlizzardTrackingStatus(42118, 1) == true then
        core:getAchievementSuccess()
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

    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderMessage("A: " .. columACounter .. " B: " .. columBCounter .. " C: " .. columCCounter .. " D: " .. columDCounter .. " E: " .. columECounter .. " F: " .. columFCounter .. "\n")

    -- Player is going to spawn a wall
    -- https://www.wowhead.com/spell=1233411/crystalline-shockwave
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1233411 then
        if core.destName ~= nil and wallSpawnUID[core.spawn_uid_dest_Player] == nil then
            wallSpawnUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendDebugMessage("Wall spawn detected for " .. core.destName)

            -- Mark player on infoframe as spawning
            InfoFrame_SetPlayerCompleteWithMessage(core.destName, L["Shared_Spawn"])
        end
    end

    -- Player is going to break a wall
    -- https://www.wowhead.com/spell=1227373/shattershell
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1227373 then
        if core.destName ~= nil and wallBreakUID[core.spawn_uid_dest_Player] == nil then
            wallBreakUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendDebugMessage("Wall break detected for " .. core.destName)

            -- Mark player on infoframe as breaking
            InfoFrame_SetPlayerCompleteWithMessage(core.destName, L["Shared_Break"])
        end
    end

    -- Player has broken a wall
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 1233416 then --SPELL_CAST_SUCCESS
        -- A wall has been broken so we need to mark this as pending so when the next wall aura is detected we know its for a break
        if core.destName ~= nil and wallBrokenUID[core.spawn_uid_dest_Player] == nil then
            wallBrokenUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            wallBreakUID[core.spawn_uid_dest_Player] = nil
            core:sendDebugMessage("Wall broken detected for " .. core.destName)
        end
    end


    if core:getBlizzardTrackingStatus(41617) == true then
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

function core._2810:TrackAdditional()
    -- Loom'ithar - Voted
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 1246718 then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(41613))
        InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(1246718) .. " " .. L["Core_Counter"],votedCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrame()

        --Check all players in group for Voted debuff
        for player2, status in pairs(core.InfoFrame_PlayersTable) do
            local buffFound = false
            local _, _, player_UID2 = strsplit("-", UnitGUID(player2))

            local spellInfo = C_Spell.GetSpellInfo(1246718)
            if spellInfo ~= nil then
                local aura = C_UnitAuras.GetAuraDataBySpellName(player2, spellInfo.name)
                if aura then
                    buffFound = true
                end
            end

            if buffFound == true then
                InfoFrame_SetPlayerComplete(player2)
                if votedUID[player_UID2] == nil then
                    votedUID[player_UID2] = player_UID2
                    votedCounter = votedCounter + 1
                end
            end
        end

        --Update with any changes
        InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(1246718) .. " " .. L["Core_Counter"],votedCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrame()

        --Hide if no one has the debuff anymore
        if votedCounter == 0 then
            core.IATInfoFrame:ToggleOff()
        end
    end
end

function core._2810:InstanceCleanup()
    core._2810.Events:UnregisterEvent("UNIT_AURA")
    core._2810.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._2810.Events:UnregisterEvent("UNIT_SPELLCAST_START")
end

core._2810.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2810:InitialSetup()
    core._2810.Events:RegisterEvent("UNIT_AURA")
    core._2810.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._2810.Events:RegisterEvent("UNIT_SPELLCAST_START")
end

function core._2810.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
	--"<13.04 21:01:51> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{秋怜} -Column A Aura- [[raid5:Cast-3-5773-2810-3675-1223483-0030716DAF:1223483]]",
    --"<32.63 21:02:10> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{季夜} -Column B Aura- [[party2:Cast-3-5773-2810-3675-1223484-0062F16DC2:1223484]]",
    --"<34.71 21:02:13> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Snowfive} -Column C Aura- [[raid8:Cast-3-5773-2810-3675-1223485-0052F16DC4:1223485]]",
    --"<37.72 21:02:16> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Gigitti} -Column D Aura- [[raid2:Cast-3-5773-2810-3675-1223486-0064716DC7:1223486]]",
    --"<43.54 21:02:21> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Gigitti} -Column E Aura- [[raid2:Cast-3-5773-2810-3675-1223489-0058F16DCD:1223489]]",
    --"<47.41 21:02:25> [UNIT_SPELLCAST_SUCCEEDED] PLAYER_SPELL{Mal} -Column F Aura- [[raid6:Cast-3-5773-2810-3675-1223493-003B716DD1:1223493]]",

    -- When we receive a spell cast success for one of the column auras we need to get the guid of the player then check which UID table they are in
    if spellID == 1223483 or spellID == 1223484 or spellID == 1223485 or spellID == 1223486 or spellID == 1223489 or spellID == 1223493 then
        -- Get player guid
        local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unitTarget))
        local name, realm = UnitName(unitTarget)

        core:sendDebugMessage("Wall aura detected for " .. unitTarget .. " with spellID " .. spellID .. " and UID " .. spawn_uid_dest)

        -- If the player is in the spawn table
        if wallSpawnUID[spawn_uid_dest] ~= nil then
            if spellID == 1223483 then
                columACounter = columACounter + 1
                core:sendDebugMessage("Wall spawned for " .. unitTarget .. " in column A" .. columACounter)
            elseif spellID == 1223484 then
                columBCounter = columBCounter + 1
                core:sendDebugMessage("Wall spawned for " .. unitTarget .. " in column B" .. columBCounter)
            elseif spellID == 1223485 then
                columCCounter = columCCounter + 1
                core:sendDebugMessage("Wall spawned for " .. unitTarget .. " in column C" .. columCCounter)
            elseif spellID == 1223486 then
                columDCounter = columDCounter + 1
                core:sendDebugMessage("Wall spawned for " .. unitTarget .. " in column D" .. columDCounter)
            elseif spellID == 1223489 then
                columECounter = columECounter + 1
                core:sendDebugMessage("Wall spawned for " .. unitTarget .. " in column E" .. columECounter)
            elseif spellID == 1223493 then
                columFCounter = columFCounter + 1
                core:sendDebugMessage("Wall spawned for " .. unitTarget .. " in column F" .. columFCounter)
            end

            -- Clear them from the spawn table as they have now spawned a
            core:sendDebugMessage("Clearing " .. unitTarget .. " from spawn table")
            wallSpawnUID[spawn_uid_dest] = nil

            -- Clear infoframe for player
            InfoFrame_SetPlayerNeutralWithMessage(name, "")
        elseif wallBrokenUID[spawn_uid_dest] ~= nil then
            -- If the player is in the break table
            -- Check player survived the break
            C_Timer.After(0.2, function()
                if UnitIsDead(unitTarget) == true then
                    core:sendDebugMessage(unitTarget .. " died when breaking wall so not counting")
                else
                    core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column with spellID " .. spellID)
                    if spellID == 1223483 then
                        if columACounter >= 4  then
                            fourthWallsBroken = fourthWallsBroken + 1
                            core:sendMessage(L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)", true)
                        end
                        core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column A" .. columACounter)
                        columACounter = columACounter - 1
                    elseif spellID == 1223484 then
                        if columBCounter >= 4 then
                            fourthWallsBroken = fourthWallsBroken + 1
                            core:sendMessage(L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)", true)
                        end
                        core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column B" .. columBCounter)
                        columBCounter = columBCounter - 1
                    elseif spellID == 1223485 then
                        if columCCounter >= 4 then
                            fourthWallsBroken = fourthWallsBroken + 1
                            core:sendMessage(L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)", true)
                        end
                        core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column C" .. columCCounter)
                        columCCounter = columCCounter - 1
                    elseif spellID == 1223486 then
                        if columDCounter >= 4 then
                            fourthWallsBroken = fourthWallsBroken + 1
                            core:sendMessage(L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)", true)
                        end
                        core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column D" .. columDCounter)
                        columDCounter = columDCounter - 1
                    elseif spellID == 1223489 then
                        if columECounter >= 4 then
                            fourthWallsBroken = fourthWallsBroken + 1
                            core:sendMessage(L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)", true)
                        end
                        core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column E" .. columECounter)
                        columECounter = columECounter - 1
                    elseif spellID == 1223493 then
                        if columFCounter >= 4 then
                            fourthWallsBroken = fourthWallsBroken + 1
                            core:sendMessage(L["Shared_WallBroken"] .. " (" .. fourthWallsBroken .. "/18)", true)
                        end
                        core:sendDebugMessage("Wall broken for " .. unitTarget .. " in column F" .. columFCounter)
                        columFCounter = columFCounter - 1
                    end
                end

                -- Clear them from the break table as they have now broken a wall
                core:sendDebugMessage("Clearing " .. unitTarget .. " from break table")
                wallBrokenUID[spawn_uid_dest] = nil

                -- Clear infoframe for player
                InfoFrame_SetPlayerNeutralWithMessage(name, "")
            end)
        end

        -- Update info frame
        core:sendDebugMessage("Column A: " .. columACounter .. " Column B: " .. columBCounter .. " Column C: " .. columCCounter .. " Column D: " .. columDCounter .. " Column E: " .. columECounter .. " Column F: " .. columFCounter)
    end
end

function core._2810.Events:UNIT_SPELLCAST_START(self, unitTarget, castGUID, spellID)
    if spellID == 1231871 then
        -- Tank is going to be spawn a wall
        local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unitTarget))
        local name, realm = UnitName(unitTarget)
        core:sendDebugMessage("Wall spawn detected for " .. unitTarget .. " with spellID " .. spellID .. " and UID " .. spawn_uid_dest)
        if name ~= nil and wallSpawnUID[spawn_uid_dest] == nil then
            wallSpawnUID[spawn_uid_dest] = spawn_uid_dest
            core:sendDebugMessage("Wall spawn started for " .. unitTarget)

            -- Mark player on infoframe as spawning
            InfoFrame_SetPlayerCompleteWithMessage(name, L["Shared_Spawn"])
        end
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
end

function core._2810:ClearVariables()
    ------------------------------------------------------
    ---- Plexus Sentinel
    ------------------------------------------------------
    holdingMouseCounter = 0
    holdingMouseUID = {}
    intermissionStarted = false
    miceSpawnedCounter = 0
    miceSpawnedUID = {}
    collectedMiceDuringIntermissionCounter = 0
    announceMiceSpawned = false

    ------------------------------------------------------
    ---- Loomithar
    ------------------------------------------------------
    votedCounter = 0
    votedUID = {}

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
    wallSpawnUID = {}
    wallBreakUID = {}
    wallBrokenUID = {}
    fourthWallsBroken = 0
end