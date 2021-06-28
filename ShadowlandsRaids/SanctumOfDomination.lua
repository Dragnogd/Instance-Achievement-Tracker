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

    InfoFrame_UpdatePlayersOnInfoFramePersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],#core.currentBosses[1].players,#core.currentBosses[1].players)

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, name) == true then --TODO: Fix BossID
            --Fate Fragment
            if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 350217 or core.spellId == 353023) then --TODO: Possibly wrong IDS ???
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(350217))),true)
                        end
                    end
                end
            end
        end
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
end