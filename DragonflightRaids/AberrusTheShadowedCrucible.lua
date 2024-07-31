--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Aberrus, the Shadowed Crucible Bosses
------------------------------------------------------
core._2569 = {}
core._2569.Events = CreateFrame("Frame")

------------------------------------------------------
---- Kazzara, the Hellforged
------------------------------------------------------
local hellSteelPlatingCounter = 0
local hellSteelPlatingUID = {}
local shatteredHellsteelCounter = 0
local shatteredHellsteelUID = {}
local initialSetup = false

------------------------------------------------------
---- Shadowflame Amalgamation
------------------------------------------------------
local shadowflameRemnantSpawned = false

------------------------------------------------------
---- The Forgotten Experiments
------------------------------------------------------
local rendedCounter = 0
local slimedCounter = 0
local singedCounter = 0

------------------------------------------------------
---- Assault of the Zaqali
------------------------------------------------------
local emberMouseCompleted = false
local siegeMammothCompleted = false
local rockSnailCompleted = false
local zaqaliBoltthrowerCompleted = false
local magmaSlugCompleted = false
local caveBeetleCompleted = false
local creaturesHit = 0

------------------------------------------------------
---- Magmorax
------------------------------------------------------
local spicyLavaSnailsCounter = 0
local spicyLavaPlayers = {}
local playersHoldingSnailCounter = 0
local escargorgedFound = false
local magmoraxFailed = false

------------------------------------------------------
---- Echo of Neltharion
------------------------------------------------------
local partsCompleted = 0
local expiredExperimentCompleted = false
local stackOfScrollsCompleted = false
local neverburningEbonCandleCompleted = false
local portableEbonAnvilCompleted = false

------------------------------------------------------
---- Scalecommander Sarkareth
------------------------------------------------------
local lumpOfFleshUID = {}
local lumpOfFleshCounter = 0
local initialSetup2 = false
local tearOffUID = {}
local tearOfCounter = 0

function core._2569:KazzaraTheHellforged()
    --Defeat Kazzara, the Hellforged after shattering your own Hellsteel Plating in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFramePersonal2("boss1")
    InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],shatteredHellsteelCounter,#core.currentBosses[1].players)

    if initialSetup == false then
        --Set every player to white on pulling the boss that collected the Hellsteel Plating before starting the encounter
        --Players that didn't collect will stay red and announce fail for those players on pull
        initialSetup = true

        for player2, status in pairs(core.InfoFrame_PlayersTable) do
            local buffFound = false
            local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(player2, i)
                if auraData ~= nil and auraData.spellId == 411919 then
                    buffFound = true
                end
            end
            if buffFound == true then
                InfoFrame_SetPlayerNeutral(player2)
            else
                InfoFrame_SetPlayerFailed(player2)
                core:getAchievementFailedPersonalWithName(1,player2,true)
            end
        end
    end

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players, name) == true then
            --Gained Shattered Hellsteel
            if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 411921) then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerComplete(core.destName) == false then
                            InfoFrame_SetPlayerComplete(core.destName)
                            shatteredHellsteelCounter = shatteredHellsteelCounter + 1
                            shatteredHellsteelUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
                            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(411921) .. " (" .. shatteredHellsteelCounter .. "/" .. #core.currentBosses[1].players .. ")",true)
                        end
                    end
                end
            end

            --Lost Hellsteel plating but did not gain Shattered Hellsteel
            if (core.type == "SPELL_AURA_REMOVED" and core.spellId == 411919) then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        local player = core.destName
                        local playerUID = core.spawn_uid_dest_Player
                        C_Timer.After(3, function()
                            if InfoFrame_GetPlayerComplete(player) == false and shatteredHellsteelUID[playerUID] == nil then
                                hellSteelPlatingCounter = hellSteelPlatingCounter - 1
                                InfoFrame_SetPlayerFailed(player)
                                core:getAchievementFailedPersonalWithName(1,player,true)
                            end
                        end)
                    end
                end
            end
        end
    end

    if shatteredHellsteelCounter == #core.currentBosses[1].players then
        core:getAchievementSuccess()
    end

    --Applied before boss pull
    --5/10 09:05:45.523  SPELL_AURA_APPLIED,Player-1084-05D23D2C,"*",0x514,0x0,Player-1084-05D23D2C,"*",0x514,0x0,411919,"Hellsteel Plating",0x1,DEBUFF

    --Removed during fight
    --5/10 09:13:00.692  SPELL_AURA_REMOVED,Player-1084-0A88FF72,"*",0x40512,0x2,Player-1084-0A88FF72,"*",0x40512,0x2,411919,"Hellsteel Plating",0x1,DEBUFF

    --Shattered Hellsteel applied during fight after loosing Hellsteel plating
    --5/10 09:13:00.698  SPELL_AURA_APPLIED,Creature-0-4237-2569-306-201261-00005B4389,"Kazzara, the Hellforged",0x10a48,0x0,Player-1596-0A8280E9,"*",0x512,0x0,411921,"Shattered Hellsteel",0x1,DEBUFF
end

function core._2569:ShadowflameAmalgamation()
    --Defeat the Shadowflame Amalgamation after using Umbral Detonation, Fiery Meteor and Blistering Twilight on a Forgotten Specimen Tank to create and extinguish a Shadowflame Remnant in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    --Forgotten Specimen Tank
    --Nothing in combat log for this?

	--Detect when Shadowflame Remnant Spawns
    --5/10 10:48:49.112  SPELL_CAST_SUCCESS,Player-1403-0538EBCC,"Flowreen-Draenor",0x514,0x0,Creature-0-4237-2569-570-205378-00005B5A6F,"Shadowflame Remnant",0x10a48,0x0,8921,"Moonfire",0x40,Player-1403-0538EBCC,0000000000000000,416440,417715,11090,10663,7387,0,8,380,1000,0,2663.19,2791.12,2167,3.3285,420
	if (core.destID == "205378" or core.sourceID == "205378") and shadowflameRemnantSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(205378)),true)
        shadowflameRemnantSpawned = true
    end

    if core:getBlizzardTrackingStatus(18168, 1) == true then
		core:getAchievementSuccess()
	end

end

function core._2569:TheForgottenExperiments()
    --Defeat The Forgotten Experiments after Nutraal is hit 3 times by Rending Charge, Volatile Spew, and Deep Breath in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    --Need 3 of each of the below

    --Rended
    --5/10 11:00:07.498  SPELL_AURA_APPLIED_DOSE,Creature-0-4237-2569-570-205352-00005B4EDD,"Nutraal",0xa18,0x20,Creature-0-4237-2569-570-205352-00005B4EDD,"Nutraal",0xa18,0x20,411116,"Rended",0x1,BUFF,2
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.destID == "205352" and core.spellId == 411116 and rendedCounter < 3 then
        rendedCounter = rendedCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(411116) .. " " .. L["Core_Counter"] .. " (" .. rendedCounter .. "/3)",true)
    end

    --Slimed
    --5/10 11:01:20.187  SPELL_AURA_APPLIED_DOSE,Creature-0-4237-2569-570-205352-00005B4EDD,"Nutraal",0xa18,0x20,Creature-0-4237-2569-570-205352-00005B4EDD,"Nutraal",0xa18,0x20,411117,"Slimed",0x1,BUFF,2
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.destID == "205352" and core.spellId == 411117 and slimedCounter < 3 then
        slimedCounter = slimedCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(411117) .. " " .. L["Core_Counter"] .. " (" .. slimedCounter .. "/3)",true)
    end

    --Singed
    --5/10 11:03:46.969  SPELL_AURA_APPLIED_DOSE,Creature-0-4237-2569-570-205352-00005B4EDD,"Nutraal",0xa18,0x20,Creature-0-4237-2569-570-205352-00005B4EDD,"Nutraal",0xa18,0x20,411118,"Singed",0x1,BUFF,2
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.destID == "205352" and core.spellId == 411118 and singedCounter < 3 then
        singedCounter = singedCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(411118) .. " " .. L["Core_Counter"] .. " (" .. singedCounter .. "/3)",true)
    end

    if rendedCounter == 3 and slimedCounter == 3 and singedCounter == 3 then
        if core:getBlizzardTrackingStatus(18173, 1) == true and core:getBlizzardTrackingStatus(18173, 2) == true and core:getBlizzardTrackingStatus(18173, 3) == true then
            core:getAchievementSuccess()
        end
    end
end

function core._2569:AssaultOfTheZaqali()
    --Defeat the Assault of the Zaqali after hitting the following creatures with a Cave Pebble in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(18228, 1) == true and emberMouseCompleted == false then
        --Ember Mouse
        emberMouseCompleted = true
        creaturesHit = creaturesHit + 1
        core:sendMessage(GetAchievementCriteriaInfo(18228,1) .. " " .. L["Shared_Completed"] .. " (" .. creaturesHit .. "/6)",true)
    end
    if core:getBlizzardTrackingStatus(18228, 2) == true and siegeMammothCompleted == false then
        --Siege Mammoth
        siegeMammothCompleted = true
        creaturesHit = creaturesHit + 1
        core:sendMessage(GetAchievementCriteriaInfo(18228,2) .. " " .. L["Shared_Completed"] .. " (" .. creaturesHit .. "/6)",true)
    end
    if core:getBlizzardTrackingStatus(18228, 3) == true and rockSnailCompleted == false then
        --Rock Snail
        rockSnailCompleted = true
        creaturesHit = creaturesHit + 1
        core:sendMessage(GetAchievementCriteriaInfo(18228,3) .. " " .. L["Shared_Completed"] .. " (" .. creaturesHit .. "/6)",true)
    end
    if core:getBlizzardTrackingStatus(18228, 4) == true and zaqaliBoltthrowerCompleted == false then
        --Zaqali Boltthrower
        zaqaliBoltthrowerCompleted = true
        creaturesHit = creaturesHit + 1
        core:sendMessage(GetAchievementCriteriaInfo(18228,4) .. " " .. L["Shared_Completed"] .. " (" .. creaturesHit .. "/6)",true)
    end
    if core:getBlizzardTrackingStatus(18228, 5) == true and magmaSlugCompleted == false then
        --Magma Slug
        magmaSlugCompleted = true
        creaturesHit = creaturesHit + 1
        core:sendMessage(GetAchievementCriteriaInfo(18228,5) .. " " .. L["Shared_Completed"] .. " (" .. creaturesHit .. "/6)",true)
    end
    if core:getBlizzardTrackingStatus(18228, 6) == true and caveBeetleCompleted == false then
        --Magma Slug
        caveBeetleCompleted = true
        creaturesHit = creaturesHit + 1
        core:sendMessage(GetAchievementCriteriaInfo(18228,6) .. " " .. L["Shared_Completed"] .. " (" .. creaturesHit .. "/6)",true)
    end

    if creaturesHit >= 6 then
        core:getAchievementSuccess()
    end
end

function core._2569:RashokTheElder()
    --Defeat Rashok, the Elder after hitting the Lost Lunker with Searing Slam 5 times in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(18230, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2569:TheVigilantStewardZskarn()
    --Defeat The Vigilant Steward, Zskarn while a member of your raid is carrying the Delicate Experimental Egg in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    --Caught Egg
    --5/10 11:16:03.372  SPELL_AURA_APPLIED,Player-3391-0B84FFCA,"Gollemfell-Silvermoon",0x514,0x0,Player-3674-0B23A7AF,"Âshix-TwistingNether",0x514,0x0,411635,"Panic!",0x1,DEBUFF
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 411635 then
		core:sendMessage(core.destName .. " " .. L["Shared_HasCaught"] .. " " .. L["AberrusTheShadowedCrucible_DelicateExperimentalEgg"],true)
    end

    --Lost Egg
    --5/10 11:11:24.260  SPELL_AURA_REMOVED,Player-1596-0A8280E9,"Maraa-Deathwing",0x514,0x0,Player-1403-054D7508,"Karnatron-Draenor",0x514,0x0,411635,"Panic!",0x1,DEBUFF
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 411635 then
		core:sendMessage(format(L["Shared_CatchNow"], L["AberrusTheShadowedCrucible_DelicateExperimentalEgg"]),true)
    end

    --Achievement failed
    if core:getBlizzardTrackingStatus(18193, 1) == false then
		core:getAchievementFailed()
	end

    --Cannot carry egg
    --5/10 11:11:24.260  SPELL_AURA_APPLIED,Player-1403-054D7508,"Karnatron-Draenor",0x514,0x0,Player-1403-054D7508,"Karnatron-Draenor",0x514,0x0,412323,"Clumsy",0x1,DEBUFF
end

function core._2569:Magmorax()
    --Defeat Magmorax after feeding him 20 Spicy Lava Snails in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(411367) .. " " .. L["Core_Counter"],playersHoldingSnailCounter,20)

    --Picked up snail (Handled in UNIT_AURA due to room size)
    --5/10 12:22:40.763  SPELL_AURA_APPLIED,0000000000000000,nil,0x514,0x0,Player-1084-05D22E7D,"Ouaa-TarrenMill",0x514,0x0,411367,"Spicy Lava Snail",0x4,DEBUFF

    --Thrown snail to boss (Handled in UNIT_SPELLCAST_SUCCEEDED as not firing from combat log)
    --5/12 21:42:10.215  SPELL_CAST_SUCCESS,Player-78-0C23A3B4,"Ceasarsalad-Magtheridon",0x514,0x0,Creature-0-4227-2569-26620-201579-00005EEA67,"Magmorax",0x10a48,0x0,411368,"Feed Magmorax",0x1,Player-78-0C23A3B4,0000000000000000,515853,551670,915,10443,2076,2197,0,249022,250000,0,2676.52,2438.99,2166,1.7284,423

    --Player died when holding snail
    if core.type == "UNIT_DIED" and core.currentDest == "Player" and core.destName ~= nil then
        if InfoFrame_GetPlayerComplete(core.destName) then
            --Player has died while holding snail. As there are only 20 snails and don't respawn, this is a fail
            InfoFrame_SetPlayerFailed(core.destName)
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
            magmoraxFailed = true
        end
    end

    --Track stacks
    --5/10 12:22:51.293  SPELL_AURA_APPLIED_DOSE,0000000000000000,nil,0x514,0x0,Creature-0-4237-2569-570-201579-00005B4EDD,"Magmorax",0x10a48,0x0,411573,"Magmosnax",0x1,BUFF,2
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 411573 and magmoraxFailed == false then
        spicyLavaSnailsCounter = spicyLavaSnailsCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(411573) .. " " .. L["Core_Counter"] .. " (" .. spicyLavaSnailsCounter .. "/20)",true)
    end

    --Achievement complete
    --5/10 12:55:36.952  SPELL_AURA_APPLIED,0000000000000000,nil,0x10a48,0x0,Creature-0-4237-2569-570-201579-00005B76BA,"Magmorax",0x10a48,0x0,411581,"Escargorged",0x1,BUFF
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "201579" and core.spellId == 411581 and escargorgedFound == false and magmoraxFailed == false then
        spicyLavaSnailsCounter = spicyLavaSnailsCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(411573) .. " " .. L["Core_Counter"] .. " (" .. spicyLavaSnailsCounter .. "/20)",true)
        escargorgedFound = true
    end

    if core:getBlizzardTrackingStatus(18172, 1) == true and spicyLavaSnailsCounter >= 19 and escargorgedFound == true then
		core:getAchievementSuccess()
	end
end

function core._2569:EchoOfNeltharion()
    --Defeat the Echo of Neltharion after players smash through walls of Twisted Earth while carrying the Expired Experiment, the Stack of Scrolls, the Neverburning Ebon Candle, and the "Portable" Ebon Anvil in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    --Expired Experiment
    --5/12 22:03:47.971  SPELL_AURA_APPLIED,Creature-0-4227-2569-26620-205340-00005EEF66,"Expired Experiment",0xa18,0x4,Player-1171-07E6056A,"Jurvichious-WyrmrestAccord",0x512,0x0,411101,"Artifact Shards",0x1,DEBUFF
    if core.type == "SPELL_AURA_APPLIED" and core.sourceID == "205340" and core.spellId == 411101 and expiredExperimentCompleted == false then
         expiredExperimentCompleted = true
         partsCompleted = partsCompleted + 1
         core:sendMessage(core:getAchievement() .. " " .. getNPCName(205340) .. " " .. L["Shared_Completed"] .. " (" .. partsCompleted .. "/4)",true)
    end

    --Stack of Scrolls
    --5/12 22:00:04.930  SPELL_AURA_APPLIED,Creature-0-4227-2569-26620-205341-00005EEDFA,"Stack of Scrolls",0xa18,0x0,Player-57-0B46A027,"Koakumá-Illidan",0x514,0x0,411101,"Artifact Shards",0x1,DEBUFF
    if core.type == "SPELL_AURA_APPLIED" and core.sourceID == "205341" and core.spellId == 411101 and stackOfScrollsCompleted == false then
        stackOfScrollsCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(205341) .. " " .. L["Shared_Completed"] .. " (" .. partsCompleted .. "/4)",true)
    end

    --Neverburning Ebon Candle
    --5/12 22:10:50.205  SPELL_AURA_APPLIED,Creature-0-4227-2569-26620-205342-00005EF0EB,"Neverburning Ebon Candle",0xa18,0x0,Player-3684-0E1F272B,"Sadpandaa-Mal'Ganis",0x514,0x0,411101,"Artifact Shards",0x1,DEBUFF
    if core.type == "SPELL_AURA_APPLIED" and core.sourceID == "205342" and core.spellId == 411101 and neverburningEbonCandleCompleted == false then
        neverburningEbonCandleCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(205342) .. " " .. L["Shared_Completed"] .. " (" .. partsCompleted .. "/4)",true)
    end

    --"Portable" Ebon Anvil
    --5/12 22:13:28.331  SPELL_AURA_APPLIED,Creature-0-4227-2569-26620-205343-00005EF1EE,"\"Portable\" Ebon Anvil",0xa18,0x0,Player-57-0D710C93,"Idontwipe-Illidan",0x514,0x0,411101,"Artifact Shards",0x1,DEBUFF
    if core.type == "SPELL_AURA_APPLIED" and core.sourceID == "205343" and core.spellId == 411101 and portableEbonAnvilCompleted == false then
        portableEbonAnvilCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(205343) .. " " .. L["Shared_Completed"] .. " (" .. partsCompleted .. "/4)",true)
    end

    if core:getBlizzardTrackingStatus(18149, 1) == true and partsCompleted == 4 then
        core:getAchievementSuccess()
    end
end

function core._2569:ScalecommanderSarkareth()
    --Defeat Scalecommander Sarkareth after cultivating a Lump of Flesh and hurling it into the Emptiness Between Stars in Aberrus, the Shadowed Crucible on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFramePersonal2("boss9")
    InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],tearOfCounter,#core.currentBosses[1].players)

    if initialSetup2 == false then
        --Set every player to white on pulling the boss that collected the Hellsteel Plating before starting the encounter
        --Players that didn't collect will stay red and announce fail for those players on pull
        initialSetup2 = true

        --Check all players in group for Lump of Flesh Debuff
        for player2, status in pairs(core.InfoFrame_PlayersTable) do
            local buffFound = false
            local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(player2, i)
                if auraData ~= nil and auraData.spellId == 410277 then
                    buffFound = true
                end
            end
            if buffFound == true then
                InfoFrame_SetPlayerNeutral(player2)
            else
                InfoFrame_SetPlayerFailed(player2)
                core:getAchievementFailedPersonalWithName(1,player2,true)
            end
        end
    end

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss9"].players, name) == true then
            --Gained Tear Off
            if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 410287) then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerComplete(core.destName) == false then
                            InfoFrame_SetPlayerComplete(core.destName)
                            tearOfCounter = tearOfCounter + 1
                            tearOffUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
                            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(410287) .. " (" .. tearOfCounter .. "/" .. #core.currentBosses[1].players .. ")",true)
                        end
                    end
                end
            end

            --Lost Lump of Flesh
            if (core.type == "SPELL_AURA_REMOVED" and core.spellId == 410277) then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        local player = core.destName
                        local playerUID = core.spawn_uid_dest_Player
                        C_Timer.After(3, function()
                            if InfoFrame_GetPlayerComplete(player) == false and tearOffUID[playerUID] == nil then
                                lumpOfFleshCounter = lumpOfFleshCounter - 1
                                InfoFrame_SetPlayerFailed(player)
                                core:getAchievementFailedPersonalWithName(1,player,true)
                            end
                        end)
                    end
                end
            end
        end
    end

    if tearOfCounter == #core.currentBosses[1].players then
        core:getAchievementSuccess()
    end

    --Personal achievement
    --Get Lump of Flesh before pulling boss so InfoFrame before starting boss

    --Gained Lump of Flesh
    --5/10 14:27:33.384  SPELL_AURA_APPLIED,Player-3391-0B84FFCA,"Gollemfell-Silvermoon",0x514,0x0,Player-3391-0B84FFCA,"Gollemfell-Silvermoon",0x514,0x0,410277,"Lump of Flesh",0x20,DEBUFF

    --Threw lump into Emptiness Between Stars
    --5/10 14:33:20.401  SPELL_AURA_APPLIED,Player-1403-054D7508,"Karnatron-Draenor",0x514,0x0,Player-1403-054D7508,"Karnatron-Draenor",0x514,0x0,410287,"Tear Off",0x1,BUFF
end

function core._2569:TrackAdditional()
    --Kazzara (Hellsteel plating)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
        if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 411919 and core.encounterStarted == false then
            local players = #core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players
            core.IATInfoFrame:ToggleOn()
            core.IATInfoFrame:SetHeading(GetAchievementLink(18229))
            InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(411919) .. " " .. L["Core_Counter"],hellSteelPlatingCounter,players)
            InfoFrame_UpdatePlayersOnInfoFramePersonal2("boss1", true)

            --Check all players in group for Hellsteel Plating Debuff
            for player2, status in pairs(core.InfoFrame_PlayersTable) do
                local buffFound = false
                local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
                for i=1,40 do
                    local auraData = C_UnitAuras.GetDebuffDataByIndex(player2, i)
                    if auraData ~= nil and auraData.spellId == 411919 then
                        buffFound = true
                    end
                end
                if buffFound == true then
                    InfoFrame_SetPlayerComplete(player2)
                    if hellSteelPlatingUID[player_UID2] == nil then
                        hellSteelPlatingUID[player_UID2] = player_UID2
                        hellSteelPlatingCounter = hellSteelPlatingCounter + 1
                    end
                else
                    InfoFrame_SetPlayerFailed(player2)
                    if hellSteelPlatingUID[player_UID2] ~= nil then
                        hellSteelPlatingUID[player_UID2] = nil
                        hellSteelPlatingCounter = hellSteelPlatingCounter - 1
                    end
                end
            end

            --Update with any changes
            InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(411919) .. " " .. L["Core_Counter"],hellSteelPlatingCounter,players)
            InfoFrame_UpdatePlayersOnInfoFramePersonal2("boss1", true)
        end
    end

    --Scalecommander Sarkareth Lump of Flesh
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss9"].enabled == true then
        if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 410277 and core.encounterStarted == false then
            local players = #core.Instances[core.expansion][core.instanceType][core.instance]["boss9"].players
            core.IATInfoFrame:ToggleOn()
            core.IATInfoFrame:SetHeading(GetAchievementLink(17877))
            InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(410277) .. " " .. L["Core_Counter"],lumpOfFleshCounter,players)
            InfoFrame_UpdatePlayersOnInfoFramePersonal2("boss9", true)

            --Check all players in group for Lump of Flesh Debuff
            for player2, status in pairs(core.InfoFrame_PlayersTable) do
                local buffFound = false
                local _, _, player_UID2 = strsplit("-", UnitGUID(player2))
                for i=1,40 do
                    local auraData = C_UnitAuras.GetDebuffDataByIndex(player2, i)
                    if auraData ~= nil and auraData.spellId == 410277 then
                        buffFound = true
                    end
                end
                if buffFound == true then
                    InfoFrame_SetPlayerComplete(player2)
                    if lumpOfFleshUID[player_UID2] == nil then
                        lumpOfFleshUID[player_UID2] = player_UID2
                        lumpOfFleshCounter = lumpOfFleshCounter + 1
                    end
                else
                    InfoFrame_SetPlayerFailed(player2)
                    if lumpOfFleshUID[player_UID2] ~= nil then
                        lumpOfFleshUID[player_UID2] = nil
                        lumpOfFleshCounter = lumpOfFleshCounter - 1
                    end
                end
            end

            --Update with any changes
            InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(410277) .. " " .. L["Core_Counter"],lumpOfFleshCounter,players)
            InfoFrame_UpdatePlayersOnInfoFramePersonal2("boss9", true)
        end
    end
end

function core._2569:InstanceCleanup()
    core._2569.Events:UnregisterEvent("UNIT_AURA")
    core._2569.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2569.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2569:InitialSetup()
    core._2569.Events:RegisterEvent("UNIT_AURA")
    core._2569.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2569.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss8"].enabled then
        local name, realm = UnitName(unitID)

        --Echo of Neltharion (Carrying Artifact)
        if spellID == 411075 then
            core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(411075),true)
        end

        --Magmorax (Feed Magmorax)
        if spellID == 411368 then
            if InfoFrame_GetPlayerComplete(name) then
                --Player has successfully tossed the snail to the boss
                InfoFrame_SetPlayerNeutral(name)

                --Wait 1 second before unlocking spicy lava snail so not re-applied immediately
                local spicyName = name
                C_Timer.After(1, function()
                    spicyLavaPlayers[spicyName] = nil
                end)
            end
        end
    end
end

function core._2569.Events:UNIT_AURA(self, unitID)
    --Magmorax (Spicy Lava Snail)
    if next(core.currentBosses) ~= nil then
        if core.currentBosses[1].encounterID == 2683 then
            local name, realm = UnitName(unitID)
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(unitID, i)
                if name ~= nil then
                    if auraData ~= nil and auraData.spellId == 411367 and spicyLavaPlayers[name] == nil then
                        --Spicy Lava Snail
                        InfoFrame_SetPlayerComplete(name)
                        spicyLavaPlayers[name] = true
                        playersHoldingSnailCounter = playersHoldingSnailCounter + 1
                    end
                end
            end
        end
    end
end

function core._2569:ClearVariables()
    ------------------------------------------------------
    ---- Kazzara, the Hellforged
    ------------------------------------------------------
    hellSteelPlatingCounter = 0
    hellSteelPlatingUID = {}
    shatteredHellsteelCounter = 0
    shatteredHellsteelUID = {}
    initialSetup = false

    ------------------------------------------------------
    ---- Shadowflame Amalgamation
    ------------------------------------------------------
    shadowflameRemnantSpawned = false

    ------------------------------------------------------
    ---- The Forgotten Experiments
    ------------------------------------------------------
    rendedCounter = 0
    slimedCounter = 0
    singedCounter = 0

    ------------------------------------------------------
    ---- Assault of the Zaqali
    ------------------------------------------------------
    emberMouseCompleted = false
    siegeMammothCompleted = false
    rockSnailCompleted = false
    zaqaliBoltthrowerCompleted = false
    magmaSlugCompleted = false
    caveBeetleCompleted = false
    creaturesHit = 0

    ------------------------------------------------------
    ---- Magmorax
    ------------------------------------------------------
    spicyLavaSnailsCounter = 0
    spicyLavaPlayers = {}
    playersHoldingSnailCounter = 0
    escargorgedFound = false
    magmoraxFailed = false

    ------------------------------------------------------
    ---- Echo of Neltharion
    ------------------------------------------------------
    partsCompleted = 0
    expiredExperimentCompleted = false
    stackOfScrollsCompleted = false
    neverburningEbonCandleCompleted = false
    portableEbonAnvilCompleted = false

    ------------------------------------------------------
    ---- Scalecommander Sarkareth
    ------------------------------------------------------
    lumpOfFleshUID = {}
    lumpOfFleshCounter = 0
    initialSetup2 = false
    tearOffUID = {}
    tearOfCounter = 0
end