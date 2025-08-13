--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- _603 Bosses
------------------------------------------------------
core._603 = {}
core._603.Events = CreateFrame("Frame")
local timerStarted = false
local timerStarted2 = false
local timerStarted3 = false

------------------------------------------------------
---- Dwarfageddon
------------------------------------------------------
local dwarfageddonComplete = false
local dwarfageddonSetup = false

------------------------------------------------------
---- Unbroken
------------------------------------------------------
local repairedAnnounced = false

------------------------------------------------------
---- Iron Dwarf, Medium Rare
------------------------------------------------------
local darkRuneGuardianKilled = 0

------------------------------------------------------
---- A Quick Shave
------------------------------------------------------
local takeOff = 0

------------------------------------------------------
---- Shattered
------------------------------------------------------
local brittleTargets = 0
local brittleTargetsKilled = 0

------------------------------------------------------
---- Stokin' the Furnace
------------------------------------------------------
local timer

------------------------------------------------------
---- Hot Pocket
------------------------------------------------------
local hotPocketPlayersUID = {}
local hotPocketCounter = 0

------------------------------------------------------
---- Must Deconstruct Faster
------------------------------------------------------
local timer2

------------------------------------------------------
---- Nerf Scrapbots
------------------------------------------------------
local scrapbotsKilled = 0

------------------------------------------------------
---- Kologarn Rubble And Roll
------------------------------------------------------
local rubbleCounter = 0

------------------------------------------------------
---- Nine Lives
------------------------------------------------------
local feralDefenderCounter = 0

------------------------------------------------------
---- Set Up Us The Bomb
------------------------------------------------------
local proximityMineFailed = false
local rocketStrikeFailed = false
local bombBotFailed = false

------------------------------------------------------
---- I Choose You...
------------------------------------------------------
local steelbreakerKilled = false
local stormcallerBrundirKilled = false
local runemasterMolgeimKilled = false
local messageAnnounced = false

------------------------------------------------------
---- Con-speed-atory
------------------------------------------------------
local freyaTrashedStarted = false
local timerFreya
local timerStartedFreya = false

------------------------------------------------------
---- Lumberjacked
------------------------------------------------------
local bossesKilled = 0
local bossKilled = false

------------------------------------------------------
---- Deforestation
------------------------------------------------------
local ancientWaterSpiritsKilled = 0
local stormLashersKilled = 0
local snaplashersKilled = 0

------------------------------------------------------
---- They're Coming Out of the Walls
------------------------------------------------------
local guardianOfYoggSaronAnnounced = false
local guardianOfYoggSaronKilled = 0

------------------------------------------------------
---- They're Coming Out of the Walls
------------------------------------------------------
local kissAndMakeUpAnnounced = false

function core._603:Dwarfageddon(id)
    --Destroy 100 Steelforged Defenders in 10 seconds in the Iron Concourse at the entrance to Ulduar.
    if dwarfageddonSetup == false then
        dwarfageddonSetup = true
        core.achievementsCompleted[1] = false
    end

    --Only run tracking for this achievement when not complete and we have not pulled any other bosses
    if dwarfageddonComplete == false and core.currentBosses[1].achievement and #core.currentBosses == 1 then
        core.MobCounter:Setup(100, 10, "33572")
	    core.MobCounter:DetectSpawnedMob()
	    core.MobCounter:DetectKilledMob(nil, nil, id)

        if core.achievementsCompleted[1] == true then
            dwarfageddonComplete = true

            --Hide InfoFrame as we have pulled boss
            C_Timer.After(10, function()
                core.IATInfoFrame:ToggleOff()
            end)
        end
    else
        --Hide InfoFrame as we have pulled boss
        core.IATInfoFrame:ToggleOff()
    end
end

function core._603:FlameLeviathanTakeOutThoseTurrets(id)
    --Destroy a Flame Leviathan Defense Turret

    --TODO: Party_kill doesn't work in a raid as you will only see events for people in your party

    if core.type == "PARTY_KILL" and core.destID == 33142 then
        core:getAchievementSuccessPersonal()
    end
end

function core._603:FlameLeviathanShutout(id)
    --Defeat Flame Leviathan in Ulduar without causing a System Shutdown.

    if core.type == "SPELL_AURA_APPLIED" and core.spellID == 62475 then
        core:getAchievementFailed(id)
    end
end

function core._603:RazorscaleIronDwarfMediumRare(id)
    --Defeat 25 Dark Rune Guardian Dwarves with Razorscale's Flame Breath

    --TODO: Localise

    core:trackMob("33388", getNPCName(33388), 25, "25 Dark Rune Guardian have spawned!",5)

    if core.type == "UNIT_DIED" and core.spellId == 63317 and core.destID == "33388" then
        darkRuneGuardianKilled = darkRuneGuardianKilled + 1
        core:sendMessage(GetAchievementLink(id) .. " " .. getNPCName(33388) .. " " .. L["Shared_Killed"] .. " (" .. darkRuneGuardianKilled .. "/25)",true)
    end

    if darkRuneGuardianKilled >= 25 then
        core:getAchievementSuccess(nil, id)
    end
end

function core._603:RazorscaleAQuickShave(id)
    --Defeat Razorscale in Ulduar without allowing her to fly into the air more than once

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 62666 and (UnitHealth("boss1") / UnitHealthMax("boss1") * 100) > 50 then
        takeOff = takeOff + 1
    end

    if takeOff == 2 then
        core:getAchievementFailed(id)
    end
end

function core._603:IgnisTheFurnaceMasterShattered(id)
    --Defeat Ignis the Furnace Master in Ulduar after shattering 2 Iron Constructs within 5 seconds

    --TODO: Below
    -- core.MobCounter:Setup(100, 10, "33572")
    -- core.MobCounter:DetectSpawnedMob()
    -- core.MobCounter:DetectKilledMob(nil, nil, true)

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 62383 then
        brittleTargetsKilled = brittleTargetsKilled + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(5, function()
                if brittleTargetsKilled >= 2 then
                    core:getAchievementSuccess()
                else
                    core:sendMessage(core:getAchievement(id) .. "(" .. brittleTargetsKilled .. "/2) Brittle Targets killed in time")
                    brittleTargetsKilled = 0
                    timerStarted = false
                end
            end)
        end
    end
end

function core._603:IgnisTheFurnaceMasterStokinTheFurnace(id)
    --Defeat Ignis the Furnace Master in Ulduar in under 4 minutes

    if timerStarted2 == false then
        timerStarted2 = true
        timer = C_Timer.NewTimer(240, function()
            core:getAchievementFailed(id)
        end)
    end
end

function core._603:IgnisTheFurnaceMasterHotPocket(id)
    --Survive being thrown into Ignis the Furnace Master's Slag Pot in Ulduar.

    for i = 1, #core.currentBosses do
        if core.currentBosses[i].achievement == id then
            InfoFrame_UpdatePlayersOnInfoFramePersonal()
            InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],hotPocketCounter,#core.currentBosses[i].players)

            --Player has been thrown into the Slag Pot
            local slagPotIDs = {65723, 62717, 65722, 65720, 65723}
            if core.type == "SPELL_AURA_APPLIED" and core:has_value(slagPotIDs, core.spellId) and core.destName ~= nil then
                local name, realm = UnitName(core.destName)
                if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss13"].players, name) == true then
                    if hotPocketPlayersUID[core.destName] == nil then
                        hotPocketCounter = hotPocketCounter + 1
                        hotPocketPlayersUID[core.destName] = core.destName
                        if core.gameVersionMajor > 4 then
                            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(65723) .. " (" .. hotPocketCounter .. "/" .. #core.currentBosses[1].players .. ")",true)
                        else
                            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(65723) .. " (" .. hotPocketCounter .. "/" .. #core.currentBosses[1].players .. ")",true)
                        end
                        InfoFrame_SetPlayerComplete(core.destName)
                    end
                end
            end

            --Achievement Completed
            if hotPocketPlayersUID == #core.currentBosses[i].players then
                core:getAchievementSuccess()
                core.achievementsFailed[1] = false
            end
        end
    end
end

function core._603:XT002DeconstructorNerfEngineering(id)
    --Defeat XT-002 Deconstructor in Ulduar without allowing him to recover any health from XS-013 Scrapbots.

    if core.type == "SPELL_INSTAKILL" and core.spellId == 62834 then
        core:getAchievementFailed(id)
    end
end

function core._603:XT002DeconstructorHeartbreaker(id)
    --Defeat XT-002 Deconstructor in Ulduar after destroying his heart

    --TODO: Party_kill wont work in raid properly

    if core.type == "PARTY_KILL" and core.destID == "33329" then
        core:getAchievementSuccess(id)
    end
end

function core._603:XT002DeconstructorMustDeconstructFaster(id)
    --Defeat XT-002 Deconstructor in Ulduar in under 205 seconds

    if timerStarted3 == false then
        timerStarted3 = true
        timer2 = C_Timer.NewTimer(205, function()
            core:getAchievementFailed(id)
        end)
    end
end

function core._603:XT002DeconstructorNerfGravityBombs(id)
    --Defeat XT-002 Deconstructor in Ulduar without any raid member dying from a Gravity Bomb

    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE") and core.spellId == 63024 and core.overkill > 0 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
    end
end

function core._603:XT002DeconstructorNerfScrapbots(id)
    --While facing XT-002 Deconstructor in Ulduar, using XE-321 Boombots to defeat 20 XS-013 Scrapbots within 12 seconds

    core.MobCounter:Setup(20, 12, "33343")
    core.MobCounter:DetectSpawnedMob()
    core.MobCounter:DetectKilledMob(nil, nil, id)
end

function core._603:KologarnIfLooksCouldKill(id)
    --Defeat Kologarn in Ulduar without any raid member being hit by Focused Eyebeams

    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and (core.spellId == 63346 or core.spellId == 63976) then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
    end
end

function core._603:KologarnRubbleAndRoll(id)
    --Defeat Kologarn in Ulduar after causing at least 25 Rubble creatures to spawn

    core:trackMob("33768", "Rubble", 25, "25 Rubble have spawned!",5,true,3)
end

function core._603:KologarnWithOpenArms(id)
    --Defeat Kologarn in Ulduar without destroying either of his arms

    if core.type == "UNIT_DIED" and (core.destID == "32934" or core.destID == "32933") then
        core:getAchievementFailed(id)
    end
end

function core._603:AuriayaNineLives(id)
    --Defeat the Feral Defender and then defeat Auriaya in Ulduar

    --TODO: Localise

    if core.type == "UNIT_DIED" and core.destID == "34035" and timerStarted == false then
        timerStarted = true
        feralDefenderCounter = feralDefenderCounter + 1
        core:sendMessage(core:getAchievement(id) .. " " .. getNPCName(34035) .. " " .. L["Core_Counter"] .. " (" .. feralDefenderCounter .. "/9)",true)
        C_Timer.After(5, function()
            timerStarted = false
        end)
    end

    if feralDefenderCounter == 9 then
        core:getAchievementSuccess(id)
    end
end

function core._603:AuriayaCrazyCatLady(id)
    --Defeat Auriaya in Ulduar without destroying her Sanctum Sentries

    if core.type == "UNIT_DIED" and core.destID == "34014" then
        core:getAchievementFailed(id)
    end
end

function core._603:MimironSetUpUsTheBomb(id)
    --Defeat Mimiron in Ulduar without anyone in the raid being hit by the following

    --Proximity Mine
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 63009 and proximityMineFailed == false then
        proximityMineFailed = true
        if core.gameVersionMajor > 4 then
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") " .. format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(63009)), id)
        else
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") " .. format(L["Shared_DamageFromAbility"], GetSpellLink(63009)), id)
        end
    end

    --Rocket Strike
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 63041 and rocketstrikeFailed ~= true then
        rocketstrikeFailed = true
        if core.gameVersionMajor > 4 then
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") " .. format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(63041)), id)
        else
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") " .. format(L["Shared_DamageFromAbility"], GetSpellLink(63041)), id)
        end
    end

    --Bomb Bot
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 63801 and bombBotFailed == false then
        bombBotFailed = true
        if core.gameVersionMajor > 4 then
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") " .. format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(63801)), id)
        else
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") " .. format(L["Shared_DamageFromAbility"], GetSpellLink(63801)), id)
        end
    end
end

function core._603:MimironNotSoFriendlyFire(id)
    --While fighting Mimiron in Ulduar, cause him to kill an Assault Bot with a Rocket Strike

    if core.type == "SPELL_DAMAGE" and core.spellId == 63041 and core.destID == "34057" then
        core:getAchievementSuccess(id)
    end
end

function core._603:AssemblyOfIronIChooseYouSteelbreaker(id)
    --Defeat the Assembly of Iron in Ulduar with Steelbreaker as the last member alive.

    if core.type == "UNIT_DIED" and core.destID == "32867" then
        steelbreakerKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32927" then
        runemasterMolgeimKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32857" then
        stormcallerBrundirKilled = true
    end

    if runemasterMolgeimKilled == true and stormcallerBrundirKilled == true and messageAnnounced == false then
        messageAnnounced = true
        core:getAchievementSuccess(id)
    end
end

function core._603:AssemblyOfIronIChooseYouStormcallerBrundir(id)
    --Defeat the Assembly of Iron in Ulduar with Stormcaller Brundir as the last member alive.

    if core.type == "UNIT_DIED" and core.destID == "32867" then
        steelbreakerKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32927" then
        runemasterMolgeimKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32857" then
        stormcallerBrundirKilled = true
    end

    if runemasterMolgeimKilled == true and steelbreakerKilled == true and messageAnnounced == false then
        messageAnnounced = true
        core:getAchievementSuccess(id)
    end
end

function core._603:AssemblyOfIronIChooseYouRunemasterMolgeim(id)
    --Defeat the Assembly of Iron in Ulduar with Runemaster Molgeim as the last member alive.

    if core.type == "UNIT_DIED" and core.destID == "32867" then
        steelbreakerKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32927" then
        runemasterMolgeimKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32857" then
        stormcallerBrundirKilled = true
    end

    if stormcallerBrundirKilled == true and steelbreakerKilled == true and messageAnnounced == false then
        messageAnnounced = true
        core:getAchievementSuccess(id)
    end
end

function core._603:AssemblyOfIronCantDoThatWhileStunned(id)
    --Defeat the Assembly of Iron in Ulduar without allowing Stormcaller Brundir to damage anyone with Chain Lightning or Lightning Whirl.

    if core.type == "SPELL_DAMAGE" and core.spellId == 63479 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
    end
end

function core._603:HodirCheeseTheFreeze(id)
    --Defeat Hodir in Ulduar without any raid member being hit by Flash Freeze.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 61969 and core.currentUnit == "Player" then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
    end
end

function core._603:HodirIHaveTheCoolestFriends(id)
    --Defeat Hodir in Ulduar without letting any of the frozen adventurers perish.

    if core.type == "UNIT_DIED" and core.unitType == "Creature" and core.destID ~= "32845" then
        core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died)", id)
    end
end

function core._603:HodirGettingColdInHere(id)
    --Defeat Hodir in Ulduar without any raid member ever gaining more than 2 stacks of Biting Cold.

    if core:trackAura(62039, 3, "debuff") == true then
        core:getAchievementFailed(id)
    end
end

function core._603:HodirICouldSayThatThisCacheWasRare(id)
    --Defeat Hodir in Ulduar before he shatters his Rare Cache of Winter.

    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(120, function()
            core:getAchievementFailed(id)
        end)
    end
end

function core._603:FreyaConSpeedAtory(id)
    --Defeat Freya in Ulduar within 20 minutes of the first creature killed in the Conservatory of Life.

    local freyaTrashIDs = {"33430", "33431", "33528", "33527", "33526", "33525", "32914", "32913", "33354", "33355", "32915"}
    if core.type == "UNIT_DIED" and timerStarted == false and freyaTrashedStarted == false and core:has_value(freyaTrashIDs, core.destID) == true then
        if timerStartedFreya == false then
            timerStartedFreya = true
            freyaTrashedStarted = true
            core:sendMessage("Tracking: " .. core:getAchievement() .. " 20 Minutes Remaining")
            timerFreya = C_Timer.NewTimer(1200, function()
                core:sendMessage(GetAchievementLink(id) .. " FAILED!")
            end)
        end
    end

    --Freya has died so stop the timer
    if core.type == "UNIT_DIED" and core.destID == "32906" then
        if timerFreya ~= nil then
            timerFreya:Cancel()
        end
    end
end

function core._603:FreyaLumberjacked(id)
    --Defeat Elder Brightleaf, Elder Ironbranch, and Elder Stonebark in Ulduar within 15 seconds of each other.

    --Elder Stonebark
    if core.type == "UNIT_DIED" and core.destID == "32914" then
        bossesKilled = bossesKilled + 1
    end

    --Elder Ironbranch
    if core.type == "UNIT_DIED" and core.destID == "32913" then
        bossesKilled = bossesKilled + 1
    end

    --Elder Brightleaf
    if core.type == "UNIT_DIED" and core.destID == "32915" then
        bossesKilled = bossesKilled + 1
    end

    if bossesKilled > 0 and timerStarted2 == false and bossKilled == false then
        timerStarted2 = true
        bossKilled = true
        C_Timer.After(15, function()
            if bossesKilled == 3 then
                core:getAchievementSuccess(id)
            elseif bossesKilled < 3 then
                core:getAchievementFailed(id)
            end
        end)
    end
end

function core._603:FreyaGettingBackToNature(id)
    --Defeat Freya in Ulduar while she is affected by at least 25 stacks of Attuned to Nature.

    if core.type == "SPELL_AURA_REMOVED_DOSE" and core.amount < 25 then
        core:getAchievementFailed(id)
    end
end

function core._603:FreyaDeforestation()
    --While fighting Freya in Ulduar, defeat 2 Ancient Water Spirits, 2 Storm Lashers, and 2 Snaplashers within 10 seconds.

    --Ancient Water Spirit
    if core.type == "UNIT_DIED" and core.destID == "33202" then
        ancientWaterSpiritsKilled = ancientWaterSpiritsKilled + 1
    end

    --Storm Lashers
    if core.type == "UNIT_DIED" and core.destID == "32919" then
        stormLashersKilled = stormLashersKilled + 1
    end

    --Snaplashers
    if core.type == "UNIT_DIED" and core.destID == "32916" then
        snaplashersKilled = snaplashersKilled + 1
    end

    if core.type == "UNIT_DIED" and (core.destID == "33202" or core.destID == "32919" or core.destID == "32916") and timerStarted3 == false then
        timerStarted3 = true
        C_Timer.After(10, function()
            if ancientWaterSpiritsKilled >= 2 and stormLashersKilled >= 2 and snaplashersKilled >= 2 then
                core:getAchievementSuccess(2)
            else
                core:sendMessage(core:getAchievement(2) .. " FAILED! Ancient Water Spirits (" .. ancientWaterSpiritsKilled .. "/2) Storm Lashers (" .. stormLashersKilled .. "/2) Snaplashers (" .. snaplashersKilled .. "/2)")
                ancientWaterSpiritsKilled = 0
                stormLashersKilled = 0
                snaplashersKilled = 0
                timerStarted3 = false
            end
        end)
    end
end

function core._603:ThorimDontStandInTheLightning(id)
    --Defeat Thorim in Ulduar without any raid member being struck by Lightning Charge.

    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 62466 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
    end
end

function core._603:ThorimWhoNeedsBloodlust(id)
    --Defeat Thorim in Ulduar while under the effect of Aura of Celerity.
end

function core._603:Shadowdodger(id)
    --Defeat General Vezax in Ulduar without any raid member being hit by Shadow Crash.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 63277 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
    end
end

function core._603:ILoveTheSmellOfSaroniteInTheMorning(id)
    --Defeat General Vezax in Ulduar after defeating the Saronite Animus.

    if core.type == "UNIT_DIED" and core.destID == "33524" then
        core:getAchievementSuccess(id)
    end
end

function core._603:DriveMeCrazy(id)
    --Defeat Yogg-Saron in Ulduar without any raid member going insane.

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 63050 then
        C_Timer.After(1, function()
            if core.inCombat == true then
                core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", id)
            end
        end)
    end
end

function core._603:KissAndMakeUp(id)
    --/Kiss Sara in Ulduar while she is angry with you.

    --TODO: Infoframe for players who need this

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 65301 and kissAndMakeUpAnnounced == false then
        core:sendMessage(core:getAchievement(4) .. " /kiss Sara Now!")
        kissAndMakeUpAnnounced = true
    end
end

function core._603:HesNotGettingAnyOlder(id)
    --Defeat Yogg-Saron in Ulduar within 7 minutes.

    if timerStarted3 == false then
        timerStarted3 = true
        timer3 = C_Timer.NewTimer(410, function()
            core:getAchievementFailed(id)
        end)
    end
end

function core._603:TheyreComingOutOfTheWalls(id)
    --While rescuing Sara from Yogg-Saron in Ulduar, defeat 9 Guardians of Yogg-Saron within 12 seconds.

    core.MobCounter:Setup(9, 12, "33136")
    core.MobCounter:DetectSpawnedMob()
    core.MobCounter:DetectKilledMob()
end

function core._603:ClearVariables()
    timerStarted = false
    timerStarted2 = false
    timerStarted3 = false

    if timer3 ~= nil then
        timer3:Cancel()
    end

    ------------------------------------------------------
    ---- Dwarfageddon
    ------------------------------------------------------
    dwarfageddonSetup = false

    ------------------------------------------------------
    ---- Iron Dwarf, Medium Rare
    ------------------------------------------------------
    darkRuneGuardianKilled = 0

    ------------------------------------------------------
    ---- A Quick Shave
    ------------------------------------------------------
    takeOff = 0

    ------------------------------------------------------
    ---- Shattered
    ------------------------------------------------------
    brittleTargets = 0
    moltenTargets = 0

    ------------------------------------------------------
    ---- Stokin' the Furnace
    ------------------------------------------------------
    if timer ~= nil then
        timer:Cancel()
    end

    ------------------------------------------------------
    ---- Hot Pocket
    ------------------------------------------------------
    hotPocketPlayersUID = {}
    hotPocketCounter = 0

    ------------------------------------------------------
    ---- Must Deconstruct Faster
    ------------------------------------------------------
    if timer2 ~= nil then
        timer2:Cancel()
    end

    ------------------------------------------------------
    ---- Nerf Scrapbots
    ------------------------------------------------------
    scrapbotsKilled = 0

    ------------------------------------------------------
    ---- Kologarn Rubble And Roll
    ------------------------------------------------------
    rubbleCounter = 0

    ------------------------------------------------------
    ---- Nine Lives
    ------------------------------------------------------
    feralDefenderCounter = 0

    ------------------------------------------------------
    ---- Set Up Us The Bomb
    ------------------------------------------------------
    proximityMineFailed = false
    rocketStrikeFailed = false
    bombBotFailed = false

    ------------------------------------------------------
    ---- I Choose You...
    ------------------------------------------------------
    steelbreakerKilled = false
    stormcallerBrundirKilled = false
    runemasterMolgeimKilled = false
    messageAnnounced = false

    ------------------------------------------------------
    ---- Con-speed-atory
    ------------------------------------------------------
    freyaTrashedStarted = false

    ------------------------------------------------------
    ---- Deforestation
    ------------------------------------------------------
    ancientWaterSpiritsKilled = 0
    stormLashersKilled = 0
    snaplashersKilled = 0

    ------------------------------------------------------
    ---- They're Coming Out of the Walls
    ------------------------------------------------------
    guardianOfYoggSaronAnnounced = false
    guardianOfYoggSaronKilled = 0

    ------------------------------------------------------
    ---- They're Coming Out of the Walls
    ------------------------------------------------------
    kissAndMakeUpAnnounced = false
end

function core._603:InstanceCleanup()
    core._603.Events:UnregisterEvent("UNIT_AURA")
    core._603.Events:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
    dwarfageddonComplete = false
    repairedAnnounced = false
end

function core._603:InitialSetup()
    core._603.Events:RegisterEvent("UNIT_AURA")
    core._603.Events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

core._603.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._603.Events:UNIT_AURA(self, unitID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        for i=1,40 do
            local auraData = C_UnitAuras.GetBuffDataByIndex(unitID, i)
            if auraData ~= nil and auraData.spellId == 62705 and repairedAnnounced == false then
                core:sendMessage(GetAchievementLink(core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].achievement) .. " " .. L["Core_Failed"],true,"failed")
                repairedAnnounced = true
            end
        end
    end
end

function core._603.Events:CHAT_MSG_MONSTER_YELL(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss50"].enabled == true then
        if message == "Now, why would you go and do something like that? Didn't you see the sign that said, \"DO NOT PUSH THIS BUTTON!\"? How will we finish testing with the self-destruct mechanism active?" then
            --core:getAchievementSuccess(2)
        end
    end
end