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

------------------------------------------------------
---- The Bloodbound Horror
------------------------------------------------------
local slimedCounter = 0
local slimedUID = {}
local bloodboundHorrorKilled = false
local volatileOozeFound = false

------------------------------------------------------
---- Queen Ansurek
------------------------------------------------------
local frothingGluttonyActive = false
local abyssalConduitCounter = 0
local abyssalConduitUID = {}

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
    if riposteCounter == core.groupSize and core:getBlizzardTrackingStatus(40255,1) == true then
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

    --Player has gained Affectionate
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 452911 or core.spellId == 452931) then
        if core.destName ~= nil and riposteUID[core.spawn_uid_dest_Player] == nil then
            affectionateCounter = affectionateCounter + 1
            affectionateUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(452911) .. " (" .. affectionateCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    --Announce success once everyone has had the debuff at some point during the fight
    if affectionateCounter == core.groupSize and core:getBlizzardTrackingStatus(40263,1) == true then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core._2657:SilkenCourt()
    --Defeat the Silken Court after Anub'arash and Takazj have gained the Bond of Friendship in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=458791/bond-of-friendship

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 458791 and core:getBlizzardTrackingStatus(40730,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2657:QueenAnsurek()
    --Defeat Queen Ansurek after all players use Abyssal Conduits to travel underneath her during Frothing Gluttony in Nerub-ar Palace on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],rollingAcidCounter,core.groupSize)

    --https://www.wowhead.com/spell=445422/frothing-gluttony?dd=14&ddsize=30

    --Detect the start of Frothing Gluttony
    --If they use Abyssal conduits before finished, the mark as complete
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 445422 then
        frothingGluttonyActive = true
        C_Timer.After(15, function()
            frothingGluttonyActive = false;
        end)
    end

    --TODO: Not sure how to detect when a player has gone into conduit?

    --TODO: InfoFrame to keep track of which players use Conduit during Frothing Gluttony
    --TODO: https://www.wowhead.com/spell=443915/abyssal-conduit?dd=14&ddsize=30
end

function core._2657:NexusPrincessKyveza()
    --Defeat Nexus-Princess Ky'veza while she has an active Kill Streak in Nerub-ar Palace on Normal difficulty or higher.

    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 445943 or core.spellId == 462139) and core:getBlizzardTrackingStatus(40264,1) == true then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end

    if core.type == "SPELL_AURA_REMOVED" and (core.spellId == 445943 or core.spellId == 462139) then
        core:getAchievementFailed()
        core.achievementsCompleted[1] = false
    end

    --https://www.wowhead.com/spell=445943/kill-streak
    --https://www.wowhead.com/spell=462139/kill-streak
    --Announce when boss can be killed and if then falls off announce "do not kill boss"
end

function core._2657:Rashanan()
    --Defeat Rasha'nan after all players ride a single wave per cast of Rolling Acid in Nerub-ar Palace on Normal difficulty or higher.

    --TODO: InfoFrame lists all players incomplete
    --TODO: Reset between each wave and announce who didn't ride wave
    --TODO: https://www.wowhead.com/spell=439789/rolling-acid Track using the movement speed debuff? as says "touches a wave"

    --SPELL_CAST_SUCCESS,Creature-0-2085-2657-25250-214504-00006C9315,"Rasha'nan",0x10a48,0x0,0000000000000000,nil,0x80000000,0x80000000,439789,"Rolling Acid",0x8,Creature-0-2085-2657-25250-214504-00006C9315,0000000000000000,3561245057,7137212500,0,0,42857,0,3,57,100,0,-3058.26,-58.32,2292,5.4978,83
    --SPELL_AURA_APPLIED,Creature-0-2085-2657-25250-214504-00006C96EB,"Rasha'nan",0x10a48,0x0,Player-4184-007B9FA7,"Yccdk-TheseGoToEleven",0x514,0x20,439786,"Rolling Acid",0x8,DEBUFF

    -- InfoFrame_UpdatePlayersOnInfoFrame()
    -- InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],rollingAcidCounter,core.groupSize)

    -- --Boss casts Rolling Acid
    -- if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 439789 then
    --     --Reset the rolling acid counter and announce which players did not get hit
    --     rollingAcidTrackingNow = true
    --     C_Timer.After(10, function()
    --         rollingAcidTrackingNow = false
    --         rollingAcidCounter = 0
    --         rollingAcidUID = {}

    --         local playersNotHit = ""

    --         --Set all InfoFrames back to red ready for next wave
    --         for player, status in pairs(core.InfoFrame_PlayersTable) do
    --             InfoFrame_SetPlayerFailed(player)
    --         end

    --         --Announce which players did not get hit by wave

    --     end)
    -- end

    -- --Player has got hit by the Rolling Acid wave as they have the movement speed reduced debuff
    -- if core.type == "SPELL_AURA_APPLIED" and core.spellId == 439786 then
    --     --Can we track which wave they get hit by? Probably not! So if all players of raid have got hit, we need to make sure tracker has gone white

    --     rollingAcidCounter = rollingAcidCounter + 1
    --     rollingAcidUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
    --     InfoFrame_SetPlayerComplete(core.destName)
    -- end

    if core:getBlizzardTrackingStatus(40262,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2657:TheBloodboundHorror()
    --Defeat The Bloodbound Horror after all players are Slimed! and then defeat a Volatile Ooze in Nerub-ar Palace on Normal difficulty or higher.

    --https://www.wowhead.com/spell=453254/slimed
    --https://www.wowhead.com/spell=433068/slimed
    --https://www.wowhead.com/npc=225423/volatile-ooze

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],slimedCounter,core.groupSize)

	if core.type == "UNIT_DIED" and core.destID == "214502" then
        bloodboundHorrorKilled = true
    end

    if bloodboundHorrorKilled == false then
        --Player has gained Slimed!
        if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 433068 or core.spellId == 453254) then
			if core.destName ~= nil and slimedUID[core.spawn_uid_dest_Player] == nil then
				slimedCounter = slimedCounter + 1
				slimedUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
				core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(433068) .. " (" .. slimedCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerComplete(core.destName)
			end
        end

        --Player has lost Slimed!
        if core.type == "SPELL_AURA_REMOVED" and (core.spellId == 433068 or core.spellId == 453254) then
			if core.destName ~= nil and slimedUID[core.spawn_uid_dest_Player] ~= nil then
				slimedCounter = slimedCounter - 1
				slimedUID[core.spawn_uid_dest_Player] = nil
				core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. C_Spell.GetSpellLink(433068) .. " (" .. slimedCounter .. "/" .. core.groupSize .. ")",true)
				InfoFrame_SetPlayerFailed(core.destName)
			end
		end
    end

    --Volatile Ooze spawned
    if core.destID == "225423" and volatileOozeFound == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(225423)),true)
        volatileOozeFound = true
    end

    --Achievement tracker white
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

    ------------------------------------------------------
    ---- Rasha'nan
    ------------------------------------------------------
    initialSetup = false
    rollingAcidCounter = 0
    rollingAcidUID = {}
    rollingAcidTrackingNow = false

    ------------------------------------------------------
    ---- The Bloodbound Horror
    ------------------------------------------------------
    slimedCounter = 0
    slimedUID = {}
    bloodboundHorrorKilled = false
    volatileOozeFound = false

    ------------------------------------------------------
    ---- Queen Ansurek
    ------------------------------------------------------
    frothingGluttonyActive = false
    abyssalConduitCounter = 0
    abyssalConduitUID = {}
end