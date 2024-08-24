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

------------------------------------------------------
---- Rasha'nan
------------------------------------------------------
local initialSetup = false
local rollingAcidCounter = 0
local rollingAcidUID = {}
local rollingAcidTrackingNow = false

function core._2657:UlgraxTheDevourer()
    --Defeat Ulgrax the Devourer while keeping the Spider Silk Grub alive in Nerub-ar Palace on Normal difficulty or higher.

    --Achievement Complete
    --https://www.wowhead.com/npc=225880/spider-silk-grub
    if core.type == "UNIT_DIED" and core.destID == "225880" then
        core:getAchievementFailed()
    end
end

function core._2657:Sikran()
    --Defeat Sikran after all players are affected by Riposte in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=451759/riposte

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
    if riposteCounter == core.groupSize then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core._2657:BroodtwisterOvinax()
    --Defeat Broodtwister Ovi'nax after everyone proves their /love to a Disheartened Worm in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=452911/affectionate
    --https://www.wowhead.com/spell=452931/affectionate
    --https://www.wowhead.com/npc=225164/disheartened-worm

    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],affectionateCounter,core.groupSize)

    --Player has gained Riposte
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 452911 or core.spellId == 452931) then
        if core.destName ~= nil and riposteUID[core.spawn_uid_dest_Player] == nil then
            affectionateCounter = affectionateCounter + 1
            affectionateUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(452911) .. " (" .. affectionateCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    --Announce success once everyone has had the debuff at some point during the fight
    if affectionateCounter == core.groupSize then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core._2657:SilkenCourt()
    --Defeat the Silken Court after Anub'arash and Takazj have gained the Bond of Friendship in Nerub-ar Palace on Normal difficulty or higher.

    --TODO: https://www.wowhead.com/spell=458791/bond-of-friendship
end

function core._2657:QueenAnsurek()
    --Defeat Queen Ansurek after all players use Abyssal Conduits to travel underneath her during Frothing Gluttony in Nerub-ar Palace on Normal difficulty or higher.

    --TODO: InfoFrame to keep track of which players use Conduit during Frothing Gluttony
    --TODO: https://www.wowhead.com/spell=443915/abyssal-conduit?dd=14&ddsize=30
end

function core._2657:NexusPrincessKyveza()
    --Defeat Nexus-Princess Ky'veza while she has an active Kill Streak in Nerub-ar Palace on Normal difficulty or higher.

    --TODO: https://www.wowhead.com/spell=445943/kill-streak
    --TODO: https://www.wowhead.com/spell=462139/kill-streak
    --TODO: Announce when boss can be killed and if then falls off announce "do not kill boss"
end

function core._2657:Rashanan()
    --Defeat Rasha'nan after all players ride a single wave per cast of Rolling Acid in Nerub-ar Palace on Normal difficulty or higher.

    --TODO: InfoFrame lists all players incomplete
    --TODO: Reset between each wave and announce who didn't ride wave
    --TODO: https://www.wowhead.com/spell=439789/rolling-acid Track using the movement speed debuff? as says "touches a wave"

    --SPELL_CAST_SUCCESS,Creature-0-2085-2657-25250-214504-00006C9315,"Rasha'nan",0x10a48,0x0,0000000000000000,nil,0x80000000,0x80000000,439789,"Rolling Acid",0x8,Creature-0-2085-2657-25250-214504-00006C9315,0000000000000000,3561245057,7137212500,0,0,42857,0,3,57,100,0,-3058.26,-58.32,2292,5.4978,83
    --SPELL_AURA_APPLIED,Creature-0-2085-2657-25250-214504-00006C96EB,"Rasha'nan",0x10a48,0x0,Player-4184-007B9FA7,"Yccdk-TheseGoToEleven",0x514,0x20,439786,"Rolling Acid",0x8,DEBUFF

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],rollingAcidCounter,core.groupSize)

    --Boss casts Rolling Acid
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 439789 then
        --Reset the rolling acid counter and announce which players did not get hit
        rollingAcidTrackingNow = true
        C_Timer.After(10, function()
            rollingAcidTrackingNow = false
            rollingAcidCounter = 0
            rollingAcidUID = {}

            local playersNotHit = ""

            --Set all InfoFrames back to red ready for next wave
            for player, status in pairs(core.InfoFrame_PlayersTable) do
                InfoFrame_SetPlayerFailed(player)
            end

            --Announce which players did not get hit by wave

        end)
    end

    --Player has got hit by the Rolling Acid wave as they have the movement speed reduced debuff
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 439786 then
        --Can we track which wave they get hit by? Probably not! So if all players of raid have got hit, we need to make sure tracker has gone white

        rollingAcidCounter = rollingAcidCounter + 1
        rollingAcidUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
        InfoFrame_SetPlayerComplete(core.destName)
    end
end

function core._2657:TheBloodboundHorror()
    --Defeat The Bloodbound Horror after all players are Slimed! and then defeat a Volatile Ooze in Nerub-ar Palace on Normal difficulty or higher.

    --TODO: InfoFrame lists all players incomplete
    --TODO: https://www.wowhead.com/spell=453254/slimed
    --TODO: https://www.wowhead.com/spell=433068/slimed
    --TODO: https://www.wowhead.com/npc=225423/volatile-ooze
end