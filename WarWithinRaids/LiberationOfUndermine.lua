--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Liberation of Undermine
------------------------------------------------------
core._2769 = {}
core._2769.Events = CreateFrame("Frame")

------------------------------------------------------
---- Vexie and the Geargrinders
------------------------------------------------------
local dumpsterCompleted = false
local trashPileCompleted = false
local tireStackCompleted = false
local toolRackCompleted = false
local storageCrateCompleted = false
local objectsCompleted = 0

------------------------------------------------------
---- Sprocketmonger Lockenstock
------------------------------------------------------
local playersWhoHaveNotFailed = 0
local initialSetup = false

------------------------------------------------------
---- Mug'Zee, Heads of Security
------------------------------------------------------
local sleptWithTheFishesUID = {}
local sleptWithTheFishesCounter = 0

------------------------------------------------------
---- Cauldron of Carnage
------------------------------------------------------
local hubrisCounter = 0

------------------------------------------------------
---- Stix Bunkjunker
------------------------------------------------------
local electromagneticSortingFirstCast = true
local electromagneticSortingCompleted = false
local electromagneticSortingFailed = false

function core._2769:VexieAndTheGeargrinders()
    --Defeat Vexie and the Geargrinders after crashing a bike into the following objects in the Liberation of Undermine on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(41208, 1) == true and dumpsterCompleted == false then
        --Dumpster
        dumpsterCompleted = true
        objectsCompleted = objectsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(41208,1) .. " " .. L["Shared_Completed"] .. " (" .. objectsCompleted .. "/5)",true)
    end
    if core:getBlizzardTrackingStatus(41208, 2) == true and trashPileCompleted == false then
        --Trash Pile
        trashPileCompleted = true
        objectsCompleted = objectsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(41208,2) .. " " .. L["Shared_Completed"] .. " (" .. objectsCompleted .. "/5)",true)
    end
    if core:getBlizzardTrackingStatus(41208, 3) == true and tireStackCompleted == false then
        --Tire Stack
        tireStackCompleted = true
        objectsCompleted = objectsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(41208,3) .. " " .. L["Shared_Completed"] .. " (" .. objectsCompleted .. "/5)",true)
    end
    if core:getBlizzardTrackingStatus(41208, 4) == true and toolRackCompleted == false then
        --Tool Rack
        toolRackCompleted = true
        objectsCompleted = objectsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(41208,4) .. " " .. L["Shared_Completed"] .. " (" .. objectsCompleted .. "/5)",true)
    end
    if core:getBlizzardTrackingStatus(41208, 5) == true and storageCrateCompleted == false then
        --Storage Crate
        storageCrateCompleted = true
        objectsCompleted = objectsCompleted + 1
        core:sendMessage(GetAchievementCriteriaInfo(41208,5) .. " " .. L["Shared_Completed"] .. " (" .. objectsCompleted .. "/5)",true)
    end

    if objectsCompleted >= 5 then
        core:getAchievementSuccess()
    end
end

function core._2769:CauldronOfCarnage()
    --Defeat the Cauldron of Carnage while suffering from Hubris after drinking "Fireproof" Punch and "Shockproof" Soda in Liberation of Undermine on Normal difficulty or higher.

    --https://www.wowhead.com/ptr-2/spell=1219684/hubris (BUFF)
    --https://www.wowhead.com/ptr-2/item=236412/fireproof-punch
    --https://www.wowhead.com/ptr-2/item=236413/shockproof-soda
    --TODO: Potions cannot be drunk until you are in combat with the boss
    --TODO: Infoframe for all players who need achievement as says "Survived your own hurbris" so presume personal
    --TODO: Track both potions to see when players have applied them as they have a minute cooldown

    InfoFrame_UpdatePlayersOnInfoFramePersonal()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],hubrisCounter,#core.currentBosses[1].players)

	--When players gains Hubris buff mark player as complete
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1219684 and InfoFrame_GetPlayerComplete(core.destName) == false then
		hubrisCounter = hubrisCounter + 1
		InfoFrame_SetPlayerComplete(core.destName)
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1219684) .. " (" .. hubrisCounter .. "/" .. #core.currentBosses[1].players .. ")",true)
	end

    --When players loose Hubris buff make player as failed
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 1219684 and InfoFrame_GetPlayerFailed(core.destName) == false then
		hubrisCounter = hubrisCounter - 1
		InfoFrame_SetPlayerFailed(core.destName)
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1219684) .. " (" .. hubrisCounter .. "/" .. #core.currentBosses[1].players .. ")",true)
	end

    if hubrisCounter == #core.currentBosses[1].players then
        core:getAchievementSuccess(41554)
    end
end

function core._2769:SprocketmongerLockenstock()
    --Defeat Sprocketmonger Lockenstock without being struck by Blazing Beam, Rocket Barrage, Mega Magnetize, Jumbo Void Beam, or Void Barrage on Normal difficulty or higher.

    --Personal achievement
    InfoFrame_UpdatePlayersOnInfoFramePersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersWhoHaveNotFailed,#core.currentBosses[1].players)

    if initialSetup == false then
        --Set every player to complete on pulling the boss
        initialSetup = true
        for player,status in pairs(core.InfoFrame_PlayersTable) do
            playersWhoHaveNotFailed = playersWhoHaveNotFailed + 1
            InfoFrame_SetPlayerComplete(player)
        end
    end

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss7"].players, name) == true then
            --Blazing Beam (Line of fire, stand in to get periodic damage)
            --SPELL_PERIODIC_DAMAGE,Creature-0-5770-2769-2977-230358-000013F63B,"Beam Turret",0xa48,0x0,Player-5764-003F6606,"Quin-Fyrakk-TR",0x512,0x0,1216415,"Blazing Beam",0x4,Player-5764-003F6606,0000000000000000,3231481,9952588,7117,84492,31576,0,0,0,0,2500000,2500000,0,-411.82,876.79,2428,1.6994,644,3440482,4192540,-1,4,0,0,382275,nil,nil,nil,ST
            --https://www.wowhead.com/ptr-2/spell=1216414/blazing-beam
            --https://www.wowhead.com/ptr-2/spell=1216415/blazing-beam
            if core.type == "SPELL_PERIODIC_DAMAGE" and core.spellId == 1216415 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(1216415))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end

            --Rocket Barrage (Do not get hit by rocket)
            --SPELL_DAMAGE,Creature-0-5770-2769-3273-230360-00000AAEFD,"Rocket Launcher",0xa48,0x0,Player-5764-003EB485,"?????????-Fyrakk-TR",0x514,0x0,1216661,"Rocket Barrage",0x4,Player-5764-003EB485,0000000000000000,3306269,6712882,24830,69265,66315,1686,300,0,0,2341418,2500000,0,-422.39,890.33,2428,4.1454,631,2548914,3147250,-1,4,0,0,0,nil,nil,nil,ST
            --https://www.wowhead.com/ptr-2/spell=1216661/rocket-barrage
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 1216661 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(1216661))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end

            --Mega Magnetize (Don't get stunned?)
            --SPELL_AURA_APPLIED,Creature-0-5770-2769-3273-236256-00000AB03E,"Mega Magnet",0xa48,0x0,Player-5764-003F3896,"??????-Fyrakk-TR",0x514,0x0,1216503,"Mega Magnetize",0x1,DEBUFF
            --https://www.wowhead.com/ptr-2/spell=1216503/mega-magnetize
            if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1216503 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(1216503))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end

            --Jumbo Void Beam (Don't got into effect on floor)
            --Spell Damage (not in combat log?)
            --https://www.wowhead.com/ptr-2/spell=1216679/jumbo-void-beam
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 1216679 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(1216679))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end

            --Void Barrage
            --SPELL_DAMAGE,Creature-0-5770-2769-3273-231903-00000AB01C,"Void Cannon",0xa48,0x0,Player-5764-00092BFC,"???????????????-Fyrakk-TR",0x10514,0x0,1216706,"Void Barrage",0x20,Player-5764-00092BFC,0000000000000000,4677352,7465840,84620,12360,59078,787,200,0,1,633,1300,0,-444.51,901.70,2428,3.8573,631,2089934,2517800,-1,32,0,0,0,nil,nil,nil,ST
            --https://www.wowhead.com/ptr-2/spell=1216706/void-barrage
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 1216706 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(1216706))),true)
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end
        end
    end
end

function core._2769:MugZeeHeadsOfSecurity()
    --Defeat Mug'Zee, Heads of Security while all players have slept with the fishes in Liberation of Undermine on Normal difficulty or higher.

    --TODO: Track all players have following debuff
    --https://www.wowhead.com/ptr-2/spell=1216669/slept-with-the-fishes

    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],sleptWithTheFishesCounter,core.groupSize)

    --Player has gained Slept With the Fishes
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 1216669 then
        if core.destName ~= nil and sleptWithTheFishesUID[core.spawn_uid_dest_Player] == nil then
            sleptWithTheFishesCounter = sleptWithTheFishesCounter + 1
            sleptWithTheFishesUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(1216669) .. " (" .. sleptWithTheFishesCounter .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    --Announce success once everyone has had the debuff at some point during the fight
    if sleptWithTheFishesCounter == core.groupSize and core:getBlizzardTrackingStatus(41337,1) == true then
        core:getAchievementSuccess(41337)
    end
end

function core._2769:OneArmedBandit()
    --Defeat the One-Armed Bandit after activating one Chip Defense Machine in Liberation of Undermine on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(41119) == true then
        core:getAchievementSuccess(41119)
    end
end

function core._2769:RikReverb()
    --Defeat Rik Reverb after activating both D.I.S.C.O.s during Hype Hustle in the Liberation of Undermine on Normal difficulty or higher.

    --https://www.wowhead.com/ptr-2/spell=1218446/d-i-s-c-o
    --https://www.wowhead.com/ptr-2/spell=1218440/d-i-s-c-o

    if core:getBlizzardTrackingStatus(41338, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2769:StixBunkjunker()
    --Defeat Stix Bunkjunker after absorbing or incinerating every Garbage Pile created by Electromagnetic Sorting before the next cast of Electromagnetic Sorting in Liberation of Undermine on Normal difficulty or higher.

    --Goes red & white with every cast & clear
    --SPELL_CAST_SUCCESS,Vehicle-0-3771-2769-22301-230322-000048BAF0,"Stix Bunkjunker",0x10a48,0x0,0000000000000000,nil,0x80000000,0x80000000,464399,"Electromagnetic Sorting",0x1,0000000000000000,0000000000000000,0,0,0,0,0,0,0,0,-1,0,0,0,0.00,0.00,2406,0.0000,0

    -- Electromagnetic Sorting
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 464399 then
        if electromagneticSortingFirstCast == true then
            -- On the first cast the tracker will be red as the boss needs to cast this in order for playing to start collecting garbage the first time round
            electromagneticSortingFirstCast = false
        else
            -- A new electromagic sorting was cast. Check if we completed in time
            if electromagneticSortingCompleted == false then
                -- Not completed in time
                electromagneticSortingFailed = true
            end
        end

        core:sendMessage(L["Shared_WaitForSuccess"],true)

        -- Delay checking for achievement success/failure as tracker is slow to update
        -- This will prevent announcing success as soon as electromagic sorting has started to cast again
        C_Timer.After(5, function()
            -- Reset tracking success
            core.achievementsCompleted[1] = false
            electromagneticSortingCompleted = false
        end)
    end

    -- Announce fail if sorting was not completed in time
    if core:getBlizzardTrackingStatus(41596, 1) == false and electromagneticSortingFailed == true then
        core:getAchievementFailed()
    end

    -- Achievement completed for the latest electromagnetic sorting
    if core:getBlizzardTrackingStatus(41596, 1) == true and electromagneticSortingCompleted == false then
        electromagneticSortingCompleted = true
        core:getAchievementSuccess()
    end
end

function core._2769:ChromeKingGallywix()
    --Defeat Chrome King Gallywix after Giga Bomb Detonation-ing 3 Giga Controls during a single Giga Coils in Liberation of Undermine on Normal difficulty or higher.

    --TODO: Not sure. Combat logs inconclusive

    if core:getBlizzardTrackingStatus(41347, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2769:ClearVariables()
    ------------------------------------------------------
    ---- Vexie and the Geargrinders
    ------------------------------------------------------
    dumpsterCompleted = false
    trashPileCompleted = false
    tireStackCompleted = false
    toolRackCompleted = false
    storageCrateCompleted = false
    objectsCompleted = 0

    ------------------------------------------------------
    ---- Sprocketmonger Lockenstock
    ------------------------------------------------------
    playersWhoHaveNotFailed = 0
    initialSetup = false

    ------------------------------------------------------
    ---- Mug'Zee, Heads of Security
    ------------------------------------------------------
    sleptWithTheFishesUID = {}
    sleptWithTheFishesCounter = 0

    ------------------------------------------------------
    ---- Cauldron of Carnage
    ------------------------------------------------------
    hubrisCounter = 0

    ------------------------------------------------------
    ---- Stix Bunkjunker
    ------------------------------------------------------
    electromagneticSortingFirstCast = true
    electromagneticSortingCompleted = false
    electromagneticSortingFailed = false
end