--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Sanctum of Domination
------------------------------------------------------
core._2450 = {}
core._2450.Events = CreateFrame("Frame")

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
local criteriaPartsMet = 0

------------------------------------------------------
---- The Nine
------------------------------------------------------
local fragmentsOfDestinyCounter = 0

------------------------------------------------------
---- Soulrender Dormazain
------------------------------------------------------
local hellscreamsBurdenCounter = 0
local hellscremBurdenUID = {}
local lastPersonToGetHit = ""

------------------------------------------------------
---- Guardian of the First Ones
------------------------------------------------------
local vazzarenTheSeekerDetected = false

------------------------------------------------------
---- FatescribeRohKalo
------------------------------------------------------
local playersWhoHaveNotFailed = nil
local initialSetup = false

------------------------------------------------------
---- Sylvanas Windrunner
------------------------------------------------------
local KyrianPlayer = ""
local VenthyrPlayer = ""
local NecrolordPlayer = ""
local NightFaePlayer = ""
local KyrianName = nil
local VenthyrName = nil
local NecrolordName = nil
local NightFaeName = nil
local sigilCounter = 0
local sylvanasSetup = false
local prismOrder = 1
local KyrianOrder = ""
local VenthyrOrder = ""
local NecrolordOrder = ""
local NightFaeOrder = ""

function core._2450:TheTarragrue()
    --Defeat The Tarragrue after entering the mists and reuniting Moriaz with Buttons in the Sanctum of Domination on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(14998) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:TheNine()
    --Defeat The Nine after forming a Shard of Destiny from 9 or more Fragments of Destiny in the Sanctum of Domination on Normal difficulty or higher.
    InfoFrame_UpdateDynamicPlayerList()
    InfoFrame_SetHeaderMessage(C_Spell.GetSpellLink(350542) .. " " .. L["Core_Counter"] .. " " .. fragmentsOfDestinyCounter)

    --Fragments of Destiny Spawned
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 350542 and core.destName ~= nil then
        InfoFrame_IncrementDynamicPlayer(core.destName,1)

        fragmentsOfDestinyCounter = InfoFrame_GetHighestDynamicPlayer()
    end

    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 350542 and core.destName ~= nil then
        InfoFrame_SetDynamicPlayer(core.destName,core.amount)

        fragmentsOfDestinyCounter = InfoFrame_GetHighestDynamicPlayer()
    end

    --Fragments of Destiny Despawned
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 350542 and core.destName ~= nil then
        local fragmentStacks = core.InfoFrame_DynamicTable[core.destName][2]

        if fragmentStacks ~= nil then
            InfoFrame_DecrementDynamicPlayer(core.destName, fragmentStacks)
        end

        fragmentsOfDestinyCounter = InfoFrame_GetHighestDynamicPlayer()
    end

    if core.type == "SPELL_AURA_REMOVED_DOSE" and core.spellId == 350542 and core.destName ~= nil then
        InfoFrame_SetDynamicPlayer(core.destName,core.amount)

        fragmentsOfDestinyCounter = InfoFrame_GetHighestDynamicPlayer()
    end

    if core:getBlizzardTrackingStatus(15003) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:EyeOfTheJailer()
    --Defeat the Eye of the Jailer after using the Scavenged S.E.L.F.I.E. Camera to take a picture of the Eye of the Jailer and the entire raid after it has cast Immediate Extermination in the Sanctum of Domination on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_AddNPCToInfoFrame(getNPCName(175725))
    InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(355427) .. " " .. L["Core_Counter"],playerPhotoFlashCounter,(core.groupSize + 1))

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 348974 and immediateExterminationCast == false then
        immediateExterminationCast = true
        core:sendMessage(format(L["Shared_CanNowBeUsed"], C_Spell.GetSpellLink(355379)),true)
    end

    --Player has gained Photoflash!
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 355427 and core.destName ~= nil then
        if core.currentDest == "Player" then
            if playerPhotoFlashUID[core.spawn_uid_dest_Player] == nil then
                playerPhotoFlashCounter = playerPhotoFlashCounter + 1
                playerPhotoFlashUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
                InfoFrame_SetPlayerComplete(core.destName)
            end
        elseif core.currentDest == "Creature" then
            if playerPhotoFlashUID[core.spawn_uid_dest] == nil and core.destID == "175725" then
                playerPhotoFlashCounter = playerPhotoFlashCounter + 1
                playerPhotoFlashUID[core.spawn_uid_dest] = core.spawn_uid_dest
                InfoFrame_SetPlayerComplete(core.destName)
            end
        end
    end

    if core:getBlizzardTrackingStatus(15065, 1) == true and playerPhotoFlashCounter == core.groupSize and allPlayersPhotoFlash == false then
        allPlayersPhotoFlash = true
        criteriaPartsMet = criteriaPartsMet + 1
        core:sendMessage(GetAchievementCriteriaInfo(15065,1) .. " " .. L["Shared_Completed"] .. " (" .. criteriaPartsMet .. "/2)",true)
    end

    if core:getBlizzardTrackingStatus(15065, 2) == true and bossPhotoFlash == false then
        bossPhotoFlash = true
        criteriaPartsMet = criteriaPartsMet + 1
        core:sendMessage(GetAchievementCriteriaInfo(15065,2) .. " " .. L["Shared_Completed"] .. " (" .. criteriaPartsMet .. "/2)",true)
    end

    if allPlayersPhotoFlash == true and bossPhotoFlash == true then
        core:getAchievementSuccess()
    end
end

function core._2450:RemnantOfNerZhul()
    --Defeat the Remnant of Ner'zhul after scoring seven goals in the Sanctum of Domination on Normal difficulty or higher.
    if core:getBlizzardTrackingStatus(15058, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:PainsmithRaznal()
    --Defeat Painsmith Raznal after activating the Burning Gibbets in the Sanctum of Domination on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(15131, 1) == false then
        core:getAchievementFailed()
    else
        core:getAchievementSuccess()
    end
end

function core._2450:GuardianOfTheFirstOnes()
    --Defeat the Guardian of the First Ones after enlightening and defeating Vazzaren the Seeker in the Sanctum of Domination in Normal difficulty or higher.

    if core.destName == "Vazzeran the Enlightened" and vazzarenTheSeekerDetected == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(180690)),true)
        vazzarenTheSeekerDetected = true
    end

    if core:getBlizzardTrackingStatus(15132, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:SoulrenderDormazain()
    --Defeat Soulrender Dormazain after /taunting Garrosh Hellscream before combat begins and avoiding all Torment impacts in the Sanctum of Domination on Normal difficulty or higher.

    --Check who the last player was to pick up an orb
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 350217 and core.destName ~= nil then --353023??
        lastPersonToGetHit = core.destName
    end

    --Blizzard Tracker has gone red so achievement failed
    if core:getBlizzardTrackingStatus(15105, 1) == false then
        core:getAchievementFailedWithMessageAfter("(" .. lastPersonToGetHit .. ")")
    end
end

function core._2450:FatescribeRohKalo()
    --Defeat Fatescribe Roh-Kalo without taking damage from Fate Fragments, Fated Conjunction, or the explosions from Call of Eternity and Echo of Eternity on Normal difficulty or higher.
    if playersWhoHaveNotFailed == nil then
        playersWhoHaveNotFailed = #core.currentBosses[1].players,#core.currentBosses[1]
    end

    InfoFrame_UpdatePlayersOnInfoFramePersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersWhoHaveNotFailed,#core.currentBosses[1].players)

    if initialSetup == false then
        --Set every player to complete on pulling the boss
        initialSetup = true
        for player,status in pairs(core.InfoFrame_PlayersTable) do
            InfoFrame_SetPlayerComplete(player)
		end
    end

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss8"].players, name) == true then
            --Call of Eternity (Explosion)
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 350819 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(350819))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
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
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(353162))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
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
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(350355))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
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
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(350826))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end
        end
    end
end

function core._2450:KelThuzad()
    --Defeat Kel'Thuzad after thawing the Remnant's heart in the Sanctum of Domination on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(15108) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:SylvanasWindrunner()
    --Defeat Sylvanas Windrunner after activating the Focusing Prism in the Sanctum of Domination on Normal difficulty or higher.

    if sylvanasSetup == false then
        sylvanasSetup = true
        --Kyrian
        KyrianName = GetSpellInfo(321076)
        --Venthyr
        VenthyrName = GetSpellInfo(321079)
        --Necrolord
        NecrolordName = GetSpellInfo(321078)
        --Night Fae
        NightFaeName = GetSpellInfo(321077)
    end

    InfoFrame_SetHeaderMessage(getNPCName(180658))

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 358022 and core.destName ~= nil then
        --Kyrian
        KyrianPlayer = core.destName

        if KyrianOrder == "" then
            KyrianOrder = prismOrder
            prismOrder = prismOrder + 1
        end
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 358157 and core.destName ~= nil then
        --Venthyr
        VenthyrPlayer = core.destName

        if VenthyrOrder == "" then
            VenthyrOrder = prismOrder
            prismOrder = prismOrder + 1
        end
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 358150 and core.destName ~= nil then
        --Necrolord
        NecrolordPlayer = core.destName

        if NecrolordOrder == "" then
            NecrolordOrder = prismOrder
            prismOrder = prismOrder + 1
        end
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 358145 and core.destName ~= nil then
        --Night Fae
        NightFaePlayer = core.destName

        if NightFaeOrder == "" then
            NightFaeOrder = prismOrder
            prismOrder = prismOrder + 1
        end
    end

    if KyrianName ~= nil and VenthyrName ~= nil and NecrolordName ~= nil and NightFaeName ~= nil then
	    InfoFrame_SetCustomMessage(KyrianName .. ": " .. KyrianPlayer .. " (" .. KyrianOrder .. ")" .. "\n" .. VenthyrName .. ": " .. VenthyrPlayer .. " (" .. VenthyrOrder .. ")" .. "\n" .. NecrolordName .. ": " .. NecrolordPlayer .. " (" .. NecrolordOrder .. ")" .. "\n" .. NightFaeName .. ": " .. NightFaePlayer .. " (" .. NightFaeOrder .. ")" .. "\n")
    end

    if core:getBlizzardTrackingStatus(15133, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2450:TrackAdditional()
    --Soulrender Dormazain -- Hellscream's Burden
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 356731 then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(15105))
        InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(356731) .. " " .. L["Core_Counter"],hellscreamsBurdenCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrame()

        --Check all players in group for Hellscream's Burden Buff
        for player2, status in pairs(core.InfoFrame_PlayersTable) do
            local buffFound = false
            local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(player2, i)
                if auraData ~= nil and auraData.spellId == 356731 then
                    buffFound = true
                end
            end
            if buffFound == true then
                InfoFrame_SetPlayerComplete(player2)
                if hellscremBurdenUID[player_UID2] == nil then
                    hellscremBurdenUID[player_UID2] = player_UID2
                    hellscreamsBurdenCounter = hellscreamsBurdenCounter + 1
                end
            else
                if core.encounterStarted == true then
                    core:getAchievementFailedWithMessageAfter("(" .. player2 .. ")")
                end

                InfoFrame_SetPlayerFailed(player2)
                if hellscremBurdenUID[player_UID2] ~= nil then
                    hellscremBurdenUID[player_UID2] = nil
                    hellscreamsBurdenCounter = hellscreamsBurdenCounter - 1
                end
            end
        end

        --Update with any changes
        InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(356731) .. " " .. L["Core_Counter"],hellscreamsBurdenCounter,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrame()

        --Hide if no one has the debuff anymore
        if hellscreamsBurdenCounter == 0 then
            core.IATInfoFrame:ToggleOff()
        end
    end

    --Kel'Thuzard - Together Forever
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 356347 and core.destName ~= nil then
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(356347),true)
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
    criteriaPartsMet = 0

    ------------------------------------------------------
    ---- The Nine
    ------------------------------------------------------
    fragmentsOfDestinyCounter = 0

    ------------------------------------------------------
    ---- Soulrender Dormazain
    ------------------------------------------------------
    hellscreamsBurdenCounter = 0
    hellscremBurdenUID = {}
    lastPersonToGetHit = ""

    ------------------------------------------------------
    ---- Guardian of the First Ones
    ------------------------------------------------------
    vazzarenTheSeekerDetected = false

    ------------------------------------------------------
    ---- FatescribeRohKalo
    ------------------------------------------------------
    playersWhoHaveNotFailed = nil
    initialSetup = false

    ------------------------------------------------------
    ---- Sylvanas Windrunner
    ------------------------------------------------------
    KyrianPlayer = ""
    VenthyrPlayer = ""
    NecrolordPlayer = ""
    NightFaePlayer = ""
    KyrianName = nil
    VenthyrName = nil
    NecrolordName = nil
    NightFaeName = nil
    sigilCounter = 0
    sylvanasSetup = false
    prismOrder = 1
    KyrianOrder = ""
    VenthyrOrder = ""
    NecrolordOrder = ""
    NightFaeOrder = ""
end

core._2450.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2450:InstanceCleanup()
    core._2450.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._2450.Events:UnregisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

function core._2450:InitialSetup()
    core._2450.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._2450.Events:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

function core._2450.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
	if spellID == 352832 then
		core:sendMessage(format(L["Shared_HasBeenPickedUp"],getNPCName(178763)),true)
	end
end

function core._2450.Events:CHAT_MSG_MONSTER_EMOTE(self, text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, unused, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons)
    if text == "A goal has been scored." then
        goalCounter = goalCounter + 1
        core:sendMessage(core:getAchievement() .. L["Core_Counter"] .. " (" .. goalCounter .. "/3)",true)
    end
end