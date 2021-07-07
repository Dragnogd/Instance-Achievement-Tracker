--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Sanctum of Domination
------------------------------------------------------
core._2450 = {}

------------------------------------------------------
---- Remnant of Ner'zhul
------------------------------------------------------
local goalCounter = 0

------------------------------------------------------
---- Eye of the Jailer
------------------------------------------------------
local allPlayersPhotoFlash = false
local bossPhotoFlash = false
local immediateExterminationCast = false
local playerPhotoFlashCounter = 0
local playerPhotoFlashUID = {}

------------------------------------------------------
---- The Nine
------------------------------------------------------
local fragmentsOfDestinyCounter = 0

------------------------------------------------------
---- Soulrender Dormazain
------------------------------------------------------
local hellscreamsBurdenCounter = 0
local hellscremBurdenUID = {}

function core._2450:TheNine()
    --Defeat The Nine after forming a Shard of Destiny from 9 or more Fragments of Destiny in the Sanctum of Domination on Normal difficulty or higher.
    InfoFrame_UpdateDynamicPlayerList()
    InfoFrame_SetHeaderCounter(GetSpellLink(350542) .. " " .. L["Core_Counter"],fragmentsOfDestinyCounter,9)

    --1. Count how many Fragments of Destiny are currently spawned (SPELL_AURA_APPLIED, SPELL_AURA_REMOVED 350542)

    --Fragments of Destiny Spawned
    if core.type == "SPELL_AURA_APPLIED"  and core.spellId == 350542 and core.destName ~= nil then
        fragmentsOfDestinyCounter = fragmentsOfDestinyCounter + 1
        InfoFrame_IncrementDynamicPlayer(core.destName,1)
        --core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(350542) .. " (" .. fragmentsOfDestinyCounter .. "/9)",true)
    end

    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 350542 and core.destName ~= nil then
        fragmentsOfDestinyCounter = fragmentsOfDestinyCounter + 1
        InfoFrame_IncrementDynamicPlayer(core.destName,core.amount)
        --core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(350542) .. " (" .. fragmentsOfDestinyCounter .. "/9)",true)
    end

    --Fragments of Destiny Despawned
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 350542 and core.destName ~= nil then
        fragmentsOfDestinyCounter = fragmentsOfDestinyCounter - 1
        InfoFrame_DecrementDynamicPlayer(core.destName,1)
        --core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(350542) .. " (" .. fragmentsOfDestinyCounter .. "/9)",true)
    end

    if core.type == "SPELL_AURA_REMOVED_DOSE" and core.spellId == 350542 and core.destName ~= nil then
        fragmentsOfDestinyCounter = fragmentsOfDestinyCounter - 1
        InfoFrame_DecrementDynamicPlayer(core.destName,core.amount)
        --core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(350542) .. " (" .. fragmentsOfDestinyCounter .. "/9)",true)
    end

    if core:getBlizzardTrackingStatus(15003) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:EyeOfTheJailer()
    --Defeat the Eye of the Jailer after using the Scavenged S.E.L.F.I.E. Camera to take a picture of the Eye of the Jailer and the entire raid after it has cast Immediate Extermination in the Sanctum of Domination on Normal difficulty or higher.

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 348974 then
        --TODO: Announce that SELFIE camera can now be used
        immediateExterminationCast = true
    end

    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],playerPhotoFlashCounter,core.groupSize)

	--Player has gained Photoflash!
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 355427 and playerPhotoFlashUID[core.spawn_uid_dest_Player] == nil then
		playerPhotoFlashCounter = playerPhotoFlashCounter + 1
		playerPhotoFlashUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
		--core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(355427) .. " (" .. playerPhotoFlashCounter .. "/" .. core.groupSize .. ")",true)
		InfoFrame_SetPlayerComplete(core.destName)
    end

    if core:getBlizzardTrackingStatus(15058, 1) == true and playerPhotoFlashCounter == core.groupSize then
        allPlayersPhotoFlash = true
    end

    if core:getBlizzardTrackingStatus(15058, 2) == true then
        bossPhotoFlash = true
    end

    if allPlayersPhotoFlash == true and bossPhotoFlash == true then
        core:getAchievementSuccess()
    end
end

function core._2450:RemnantOfNerZhul()
    --Defeat the Remnant of Ner'zhul after scoring seven goals in the Sanctum of Domination on Normal difficulty or higher.

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 350424 then
        goalCounter = goalCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. L["Core_Counter"] .. " " .. " (" .. goalCounter .. "/7)",true)
    end

    if core:getBlizzardTrackingStatus(15058, 1) == true and goalCounter >= 7 then
        core:getAchievementSuccess()
    end
end

function core._2450:SoulrenderDormazain()
    --Defeat Soulrender Dormazain after /taunting Garrosh Hellscream before combat begins and avoiding all Torment impacts in the Sanctum of Domination on Normal difficulty or higher.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 350217 and core.destName ~= nil then --353023??
        local tmpPlayer = core.destName
        C_Timer.After(1, function()
            if core:getBlizzardTrackingStatus(15105, 1) == false then
                core:getAchievementFailedWithMessageAfter("(" .. tmpPlayer .. ")")
            end
        end)
    end
end

function core._2450:FatescribeRohKalo()
    --Defeat Fatescribe Roh-Kalo without taking damage from Fate Fragments, Fated Conjunction, or the explosions from Call of Eternity and Echo of Eternity on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFramePersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],#core.currentBosses[1].players,#core.currentBosses[1].players)

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, name) == true then --TODO: Fix BossID
            --Call of Eternity (Explosion)
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 350819 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(350819))),true)
                        end
                    end
                end
            end

            --Fate Fragment
            if core.type == "SPELL_AURA_APPLIED" and core.spellId == 353162 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(353162))),true)
                        end
                    end
                end
            end

            --Fated Conjunction
            if core.type == "SPELL_AURA_APPLIED" and core.spellId == 350355 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(350355))),true)
                        end
                    end
                end
            end

            --Echo of Eternity (Explosion)
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 350826 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(350826))),true)
                        end
                    end
                end
            end
        end
    end
end

function core._2296:TrackAdditional()
    --Soulrender Dormazain -- Hellscream's Burden
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 356731 then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(15105))
        InfoFrame_SetHeaderCounter(GetSpellLink(356731) .. " " .. L["Core_Counter"],hellscreamsBurdenCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrame()

        --Check all players in group for Hellscream's Burden Buff
        for player2, status in pairs(core.InfoFrame_PlayersTable) do
            local buffFound = false
            local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
            for i=1,40 do
                local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(player2, i)
                if spellId == 356731 then
                    buffFound = true
                end
            end
            if buffFound == true then
                InfoFrame_SetPlayerComplete(player2)
                if hellscremBurdenUID[player_UID2] == nil then
                    hellscremBurdenUID[player_UID2] = player_UID2
                    hellscreamsBurdenCounter = hellscreamsBurdenCounter + 1
                    core:sendDebugMessage("InfoFrame set green for wilted Rose (Unit Scanning): " .. player2)
                end
            else
                InfoFrame_SetPlayerFailed(player2)
                if hellscremBurdenUID[player_UID2] ~= nil then
                    hellscremBurdenUID[player_UID2] = nil
                    hellscreamsBurdenCounter = hellscreamsBurdenCounter - 1
                    core:sendDebugMessage("InfoFrame set failed for wilted Rose (Unit Scanning): " .. player2)
                end
            end
        end

        --Update with any changes
        InfoFrame_SetHeaderCounterWithAdditionalMessage(L["Shared_PlayersMetCriteria"],WiltingFlowersCounter,core.groupSize,L["CastleNathria_OrbTimer"] .. ": " .. wiltedMasterTimer .. " (" .. wiltedMasterPlayer .. ")\n" .. L["CastleNathria_KillTimer"] .. ": " .. bloomingMasterTimer)
        InfoFrame_UpdatePlayersOnInfoFrame()
    end
end

function core._2450:ClearVariables()
    ------------------------------------------------------
    ---- Remnant of Ner'zhul
    ------------------------------------------------------
    goalCounter = 0

    ------------------------------------------------------
    ---- Eye of the Jailer
    ------------------------------------------------------
    allPlayersPhotoFlash = false
    bossPhotoFlash = false
    immediateExterminationCast = false
    playerPhotoFlashCounter = 0
    playerPhotoFlashUID = {}

    ------------------------------------------------------
    ---- The Nine
    ------------------------------------------------------
    fragmentsOfDestinyCounter = 0

    ------------------------------------------------------
    ---- Soulrender Dormazain
    ------------------------------------------------------
    hellscreamsBurdenCounter = 0
end