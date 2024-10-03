--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Nerub-ar Palace
------------------------------------------------------
core._2657 = {}
core._2657.Events = CreateFrame("Frame")

------------------------------------------------------
---- Sikran
------------------------------------------------------
local riposteCounter = 0
local riposteUID = {}

------------------------------------------------------
---- Broodtwister Ovi'nax
------------------------------------------------------
local affectionateCounter = 0
local affectionateUID = {}
local belovedWormFound = false
local belovedWormAnnounced = false

------------------------------------------------------
---- Rasha'nan
------------------------------------------------------
local initialSetup = false
local rollingAcidCounter = 0
local rollingAcidUID = {}
local rollingAcidTrackingNow = false
local cowabungaFailed = false
local cowabungaSuccessAnnounced = false

------------------------------------------------------
---- The Bloodbound Horror
------------------------------------------------------
local slimedCounter = 0
local slimedUID = {}
local bloodboundHorrorKilled = false
local volatileOozeAnnounced = false
local volatileOozeFound = false

------------------------------------------------------
---- Nexus-Princess Ky'veza
------------------------------------------------------
local nexusPrincessKyvezaKilled = false
local killStreakCounter = 0

------------------------------------------------------
---- Queen Ansurek
------------------------------------------------------
local frothingGluttonyActive = false
local abyssalConduitCounter = 0
local abyssalConduitUID = {}

function core._2657:UlgraxTheDevourer()
    --Defeat Ulgrax the Devourer while keeping the Spider Silk Grub alive in Nerub-ar Palace on Normal difficulty or higher.

    --UNIT_DIED,0000000000000000,nil,0x80000000,0x80000000,Creature-0-4237-2657-3303-225880-0000613D5F,"Spider Silk Grub",0xa18,0x20,0

    --Achievement Complete
    --https://www.wowhead.com/npc=225880/spider-silk-grub
    if (core.type == "UNIT_DIED" and core.destID == "225880") or core:getBlizzardTrackingStatus(40261,1) == false then
        core:getAchievementFailed()
    end
end

function core._2657:Sikran()
    --Defeat Sikran after all players are affected by Riposte in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=451759/riposte

    --SPELL_AURA_APPLIED,Creature-0-4237-2657-3303-214503-0000614DB0,"Sikran",0x10a48,0x0,Player-1084-05D23D2C,"A-EU",0x512,0x0,451759,"Riposte",0x1,DEBUFF
    --Flags: 451759 persists through death

    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],riposteCounter,core.groupSize)

    --Player has gained Riposte
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 451759 then
        if core.destName ~= nil and riposteUID[core.spawn_uid_dest_Player] == nil then
            riposteCounter = riposteCounter + 1
            riposteUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(451759) .. " (" .. riposteCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    --Announce success once everyone has had the debuff at some point during the fight
    if riposteCounter == core.groupSize and core:getBlizzardTrackingStatus(40255,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2657:BroodtwisterOvinax()
    --Defeat Broodtwister Ovi'nax after everyone proves their /love to a Disheartened Worm in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=452911/affectionate
    --https://www.wowhead.com/spell=452931/affectionate
    --https://www.wowhead.com/npc=225164/disheartened-worm
    --https://www.wowhead.com/spell=453267/encumbered

    --SPELL_AURA_APPLIED,Creature-0-4237-2657-3303-225164-00006161DD,"Disheartened Worm",0x10a48,0x0,Player-633-0AD19526,"M-ShatteredHand-EU",0x514,0x0,452911,"Affectionate",0x1,DEBUFF

    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],affectionateCounter,core.groupSize)

    --Player has gained Affectionate
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 452911 then
        if core.destName ~= nil and affectionateUID[core.spawn_uid_dest_Player] == nil then
            affectionateCounter = affectionateCounter + 1
            affectionateUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(452911) .. " (" .. affectionateCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    --Announce success once everyone has had the debuff at some point during the fight
    if affectionateCounter == core.groupSize then
        --Wait for Beloved Worm to spawn
        if belovedWormAnnounced == false then
            belovedWormAnnounced = true
            core:sendMessage(format(L["Shared_WaitForAddToSpawn"], getNPCName(225376)),true)
        end

        if (core.sourceID == "225376" or core.destID == "225376") and belovedWormFound == false then
            belovedWormFound = true
            core:getAchievementSuccess()
        end
    end
end

function core._2657:SilkenCourt()
    --Defeat the Silken Court after Anub'arash and Takazj have gained the Bond of Friendship in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=458791/bond-of-friendship

    if core:getBlizzardTrackingStatus(40730,1) == true then
        core:getAchievementSuccess()
    else
        core:getAchievementFailed()
    end
end

function core._2657:QueenAnsurek()
    --Defeat Queen Ansurek after all players use Abyssal Conduits to travel underneath her during Frothing Gluttony in Nerub-ar Palace on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],rollingAcidCounter,core.groupSize)

    --https://www.wowhead.com/spell=445422/frothing-gluttony?dd=14&ddsize=30
    --SPELL_DAMAGE,0000000000000000,nil,0xa48,0x0,Player-1084-092D79FD,"T-TarrenMill-EU",0x514,0x0,444456,"Abyssal Conduit",0x20,Player-1084-092D79FD,0000000000000000,4617465,5065042,56777,14907,28428,0,2,100,100,0,-3681.75,564.25,2296,2.2696,589,313957,331026,-1,32,0,0,0,nil,nil,nil

    --Detect the start of Frothing Gluttony
    --If they use Abyssal conduits before finished, the mark as complete
    -- if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 445422 then
    --     frothingGluttonyActive = true
    --     C_Timer.After(15, function()
    --         frothingGluttonyActive = false;
    --     end)
    -- end

    --TODO: Not sure how to detect when a player has gone into conduit?

    --TODO: InfoFrame to keep track of which players use Conduit during Frothing Gluttony
    --TODO: https://www.wowhead.com/spell=443915/abyssal-conduit?dd=14&ddsize=30

    if core:getBlizzardTrackingStatus(40266,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2657:NexusPrincessKyveza()
    --Defeat Nexus-Princess Ky'veza while she has an active Kill Streak in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=445943/kill-streak
    --https://www.wowhead.com/spell=462139/kill-streak

    --SPELL_AURA_REFRESH,Creature-0-4237-2657-3303-217748-000061675A,"Nexus-Princess Ky'veza",0x10a48,0x0,Creature-0-4237-2657-3303-217748-000061675A,"Nexus-Princess Ky'veza",0x10a48,0x0,462139,"Kill Streak"
    --SPELL_AURA_APPLIED_DOSE,Creature-0-4237-2657-3303-217748-000061675A,"Nexus-Princess Ky'veza",0x10a48,0x0,Creature-0-4237-2657-3303-217748-000061675A,"Nexus-Princess Ky'veza",0x10a48,0x0,462139,"Kill Streak",0x1,BUFF,7

    if core.type == "UNIT_DIED" and core.destID == "217748" then
        nexusPrincessKyvezaKilled = true
    end

    if core.type == ("SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 462139 then
        killStreakCounter = killStreakCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. L["Core_Counter"] .. " (" .. killStreakCounter .. ")",true)
    end

    if nexusPrincessKyvezaKilled == false then
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 462139 then
            core:getAchievementFailed()
        end

        if core:getBlizzardTrackingStatus(40264,1) == false then
            core:getAchievementFailed()
        end
    end
end

function core._2657:Rashanan()
    --Defeat Rasha'nan after all players ride a single wave per cast of Rolling Acid in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=439786/rolling-acid Track using the movement speed debuff? as says "touches a wave"

    --It doesn't appear to be possible to track the initial two players who get targetted by wave (439790) as it's marked as a private aura.

    --SPELL_CAST_SUCCESS,Creature-0-2085-2657-25250-214504-00006C9315,"Rasha'nan",0x10a48,0x0,0000000000000000,nil,0x80000000,0x80000000,439789,"Rolling Acid",0x8,Creature-0-2085-2657-25250-214504-00006C9315,0000000000000000,3561245057,7137212500,0,0,42857,0,3,57,100,0,-3058.26,-58.32,2292,5.4978,83
    --SPELL_AURA_APPLIED,Creature-0-2085-2657-25250-214504-00006C96EB,"Rasha'nan",0x10a48,0x0,Player-4184-007B9FA7,"Yccdk-TheseGoToEleven",0x514,0x20,439786,"Rolling Acid",0x8,DEBUFF
    --SPELL_AURA_APPLIED,Creature-0-4237-2657-3303-219669-0000E155BB,"Nerubian",0xa48,0x0,Player-633-0AD19526,"Magru-ShatteredHand-EU",0x514,0x0,439790,"Rolling Acid",0x8,DEBUFF

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],rollingAcidCounter,core.groupSize)

    --Player has got hit by a wave
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 439786 or core.spellId == 439790) and rollingAcidUID[core.spawn_uid_dest_Player] == nil and cowabungaFailed == false then
        --Reset the rolling acid counter and announce which players did not get hit

        --Mark them as complete
        rollingAcidCounter = rollingAcidCounter + 1
        rollingAcidUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
        --core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(439786) .. " (" .. rollingAcidCounter .. "/" .. core.groupSize .. ")",true)
        InfoFrame_SetPlayerComplete(core.destName)

        --Start a timer to reset InfoFrame once the wave cast has finished as if not all players complete acheievement we need to track for next wave
        if rollingAcidTrackingNow == false then
            rollingAcidTrackingNow = true

            --Reset InfoFrame upon next wave starting rather than end of last wave
            for player, status in pairs(core.InfoFrame_PlayersTable) do
                InfoFrame_SetPlayerNeutral(player)
            end
            InfoFrame_SetPlayerComplete(core.destName)
            rollingAcidCounter = 1
            core.achievementsCompleted[1] = false

            --Announce tracking status in 6 seconds so do not kill boss yet
            core:sendMessage(L["Shared_WaitForSuccess"],true)

            C_Timer.After(6, function()
                --Announce which players did not get hit by wave
                if core:getBlizzardTrackingStatus(40262,1) == true then
                    core:getAchievementSuccess()
                    cowabungaSuccessAnnounced = true

                    --Game is reporting success. Make sure our InfoFrame reflects then by
                    --Setting all players to green
                    for player,status in pairs(core.InfoFrame_PlayersTable) do
                        InfoFrame_SetPlayerComplete(player)
                    end
                    rollingAcidCounter = core.groupSize
                elseif core:getBlizzardTrackingStatus(40262,1) == false then
                    cowabungaFailed = true
                    if string.len(InfoFrame_GetIncompletePlayers()) > 0 then
                        --1: A player did not get hit. Announce players to chat
                        core:getAchievementFailed()
                        core:sendMessageSafe(InfoFrame_GetIncompletePlayers(),false,true)

                        --Set any players who failed to red on the InfoFrame
                        for player,status in pairs(core.InfoFrame_PlayersTable) do
                            if core.InfoFrame_PlayersTable[player] == 1 then
                                InfoFrame_SetPlayerFailed(player)
                            end
                        end
                    else
                        --2: A player got hit by both waves. This is not possible to track af far as i'm aware so just announce a fail
                        core:getAchievementFailedWithMessageAfter("(" .. L["Cowabunga_BothWaves"] .. ")")
                    end
                end

                --Set all InfoFrames back to red ready for next wave as every wave had to be done to not fail achievement
                --even if currently white
                if cowabungaFailed == false then
                    --Reset ready for next wave
                    rollingAcidTrackingNow = false
                    rollingAcidUID = {}
                end
            end)
        end
    end
end

function core._2657:TheBloodboundHorror()
    --Defeat The Bloodbound Horror after all players are Slimed! and then defeat a Volatile Ooze in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=453254/slimed
    --https://www.wowhead.com/spell=433068/slimed
    --https://www.wowhead.com/npc=225423/volatile-ooze

    --SPELL_AURA_APPLIED,Player-1084-05D23D2C,"A-TarrenMill-EU",0x514,0x0,Player-1084-05D23D2C,"A-TarrenMill-EU",0x514,0x0,453254,"Slimed!",0x1,DEBUFF
    --SPELL_AURA_REMOVED,Player-1403-054D2E54,"N-Draenor-EU",0x514,0x0,Player-1403-054D2E54,"N-Draenor-EU",0x514,0x0,453254,"Slimed!",0x1,DEBUFF
    --Creature-0-4237-2657-3303-214502-0000613D60,"The Bloodbound Horror",
    --Creature-0-4237-2657-3303-225423-0000614ABF,"Volatile Ooze"

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],slimedCounter,core.groupSize)

	if core.type == "UNIT_DIED" and core.destID == "214502" then
        bloodboundHorrorKilled = true
    end

    if bloodboundHorrorKilled == false then
        --Player has gained Slimed!
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 453254 then
			if core.destName ~= nil and slimedUID[core.spawn_uid_dest_Player] == nil then
				slimedCounter = slimedCounter + 1
				slimedUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
				core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(453254) .. " (" .. slimedCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerComplete(core.destName)
			end
        end
    end

    --Volatile Ooze wait for spawn
    if slimedCounter == core.groupSize and volatileOozeAnnounced == false then
        core:sendMessage(format(L["Shared_WaitForAddToSpawn"], getNPCName(225423)),true)
        volatileOozeAnnounced = true
    end

    --Volatile Ooze spawned
    if (core.sourceID == "225423" or core.destID == "225423") and volatileOozeFound == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(225423)),true)
        volatileOozeFound = true
    end

    --Volatile Ooze killed so tracker will turn white
    if core:getBlizzardTrackingStatus(40260,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2657:ClearVariables()
    ------------------------------------------------------
    ---- Sikran
    ------------------------------------------------------
    riposteCounter = 0
    riposteUID = {}

    ------------------------------------------------------
    ---- Broodtwister Ovi'nax
    ------------------------------------------------------
    affectionateCounter = 0
    affectionateUID = {}
    belovedWormFound = false
    belovedWormAnnounced = false

    ------------------------------------------------------
    ---- Rasha'nan
    ------------------------------------------------------
    initialSetup = false
    rollingAcidCounter = 0
    rollingAcidUID = {}
    rollingAcidTrackingNow = false
    cowabungaFailed = false
    cowabungaSuccessAnnounced = false

    ------------------------------------------------------
    ---- The Bloodbound Horror
    ------------------------------------------------------
    slimedCounter = 0
    slimedUID = {}
    bloodboundHorrorKilled = false
    volatileOozeAnnounced = false
    volatileOozeFound = false

    ------------------------------------------------------
    ---- Nexus-Princess Ky'veza
    ------------------------------------------------------
    nexusPrincessKyvezaKilled = false
    killStreakCounter = 0

    ------------------------------------------------------
    ---- Queen Ansurek
    ------------------------------------------------------
    frothingGluttonyActive = false
    abyssalConduitCounter = 0
    abyssalConduitUID = {}
end