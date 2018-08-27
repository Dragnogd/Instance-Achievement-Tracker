--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

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
local steelforgedDefenderKilled = 0
local steelforgedDefenderAnnounced = false

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
local feralDefenderCounter = 9

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

function core._603:Dwarfageddon()
    core:trackMob("33572", "Steelforged Defender", 100, "100 Steelforged Defenders have spawned. AOE them now!", 10, nil, nil)

    if core.mobCounter >= 100 and steelforgedDefenderAnnounced == false then
        steelforgedDefenderAnnounced = true
    end

    --Add killed
    if core.type == "UNIT_DIED" and steelforgedDefenderAnnounced == true then
        --Only start the timer if enough adds have been collected.
        steelforgedDefenderKilled = steelforgedDefenderKilled + 1
        if timerStarted == false then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. " Timer Started! 10 seconds remaining")
            C_Timer.After(10, function()
                if steelforgedDefenderKilled >= 100 then
                    if dwarfageddonComplete == false then
                        core:sendMessage(core:getAchievement() .. " COMPLETED! Steelforged Defenders were killed in time (" .. steelforgedDefenderKilled .. "/100)")
                        dwarfageddonComplete = true
                    end
                else
                    core:sendMessage(core.getAchievement() .. " FAILED! Steelforged Defenders were not killed in time (" .. steelforgedDefenderKilled .. "/100). This achievement can be attempted again.")
                    steelforgedDefenderKilled = 0
                    timerStarted = false
                    steelforgedDefenderAnnounced = false
                end
            end)
        else
            if steelforgedDefenderKilled >= 100 then
                if dwarfageddonComplete == false then
                    core:sendMessage(core:getAchievement() .. " COMPLETED! Steelforged Defenders were killed in time (" .. steelforgedDefenderKilled .. "/100)")
                    dwarfageddonComplete = true
                end
            end
        end
    end
end

function core._603:FlameLeviathanTakeOutThoseTurrets()
    if core.type == "PARTY_KILL" and core.destID == 33142 then
        core:getAchievementSuccessPersonal()
    end
end

function core._603:FlameLeviathanShutout()
    if core.type == "SPELL_AURA_APPLIED" and core.spellID == 62475 then
        core:getAchievementFailed(2)
    end
end

function core._603:RazorscaleIronDwarfMediumRare()
    if core.type == "UNIT_DIED" and core.spellId == 63317 and core.destID == "33388" then
        darkRuneGuardianKilled = darkRuneGuardianKilled + 1
        --print(darkRuneGuardianKilled)
        core:sendMessageDelay("Dark Rune Guardian Killed (" .. darkRuneGuardianKilled .. "/25)",darkRuneGuardianKilled,5)
    end

    core:trackMob("33388", "Dark Rune Guardian", 25, "25 Dark Rune Guardian have spawned!",5)

    if darkRuneGuardianKilled >= 25 then
        core:getAchievementSuccess()
    end
end

function core._603:RazorscaleAQuickShave()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 62666 and (UnitHealth("boss1") / UnitHealthMax("boss1") * 100) > 50 then
        takeOff = takeOff + 1
        --print(takeOff)
    end

    if takeOff == 2 then
        core:getAchievementFailed()
    end
end

function core._603:IgnisTheFurnaceMasterShattered()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 62383 then
        brittleTargetsKilled = brittleTargetsKilled + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(5, function()
                if brittleTargetsKilled >= 2 then
                    core:getAchievementSuccess()
                else
                    core:sendMessage(core:getAchievement() .. "(" .. brittleTargetsKilled .. "/2) Brittle Targets killed in time")
                    brittleTargetsKilled = 0
                    timerStarted = false
                end
            end)
        end
    end
end

function core._603:IgnisTheFurnaceMasterStokinTheFurnace()
    if timerStarted2 == false then
        timerStarted2 = true
        timer = C_Timer.NewTimer(240, function() 
            core:getAchievementFailed(2)
        end)
    end  
end

function core._603:XT002DeconstructorNerfEngineering()
    if core.type == "SPELL_INSTAKILL" and core.spellId == 62834 then
        core:getAchievementFailed(4)
    end
end

function core._603:XT002DeconstructorHeartbreaker()
    if core.type == "PARTY_KILL" and core.destID == "33329" then
        core:getAchievementSuccess(3)
    end
end

function core._603:XT002DeconstructorMustDeconstructFaster()
    if timerStarted3 == false then
        timerStarted3 = true
        timer2 = C_Timer.NewTimer(205, function() 
            core:getAchievementFailed(1)
        end)
    end  
end

function core._603:XT002DeconstructorNerfGravityBombs()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE") and core.spellId == 63024 and core.overkill > 0 then
        core:getAchievementFailed(2)
    end
end

function core._603:XT002DeconstructorNerfScrapbots()
    core:trackMob("33343", "XS-013 Scrapbot", 20, "20 XS-013 Scrapbots have spawned!",5)

    if core.type == "SPELL_DAMAGE" and core.destID == "33343" and core.spellId == 62834 and core.overkill > 0 then
        scrapbotsKilled = scrapbotsKilled + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(12, function() 
                if scrapbotsKilled >= 20 then
                    core:getAchievementSuccess(5)
                else
                    core:sendMessage(core:getAchievement(5) .. " (" .. scrapbotsKilled .. "/20) Scrapbots killed in time")
                    timerStarted = false
                    scrapbotsKilled = 0
                end
            end)
        end
    end
end

function core._603:KologarnIfLooksCouldKill()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and (core.spellId == 63346 or core.spellId == 63976) then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._603:KologarnRubbleAndRoll()
    core:trackMob("33768", "Rubble", 25, "25 Rubble have spawned!",5,true,3)
end

function core._603:KologarnWithOpenArms()
    if core.type == "UNIT_DIED" and (core.destID == "32934" or core.destID == "32933") then
        core:getAchievementFailed(2)
    end
end

function core._603:AuriayaNineLives()
    if core.type == "UNIT_DIED" and core.destID == "34035" and timerStarted == false then
        timerStarted = true
        feralDefenderCounter = feralDefenderCounter - 1
        core:sendMessage(core:getAchievement(1) .. " Feral Defender Lives Remaining: " .. feralDefenderCounter)
        C_Timer.After(5, function() 
            timerStarted = false
        end)
    end

    if feralDefenderCounter == 0 then
        core:getAchievementSuccess(1)
    end
end

function core._603:AuriayaCrazyCatLady()
    if core.type == "UNIT_DIED" and core.destID == "34014" then
        core:getAchievementFailed(2)
    end
end

function core._603:MimironSetUpUsTheBomb()
    --Proximity Mine
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 63009 and proximityMineFailed == false then
        proximityMineFailed = true
        core:sendMessage("Proximity Mine part of " .. core:getAchievement(1) .. " FAILED")
    end

    --Rocket Strike
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 63041 and rocketstrikeFailed ~= true then
        rocketstrikeFailed = true
        core:sendMessage("Rocket Strike part of " .. core:getAchievement(1) .. " FAILED")       
    end
    
    --Bomb Bot
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 63801 and bombBotFailed == false then
        bombBotFailed = true
        core:sendMessage("Bomb Bot part of " .. core:getAchievement(1) .. " FAILED")           
    end
end

function core._603:MimironNotSoFriendlyFire()
    if core.type == "SPELL_DAMAGE" and core.spellId == 63041 and core.destID == "34057" then
        core:getAchievementSuccess(3)
    end
end

function core._603:AssemblyOfIronIChooseYouSteelbreaker()
    --4
    if core.type == "UNIT_DIED" and core.destID == "32867" then
        steelbreakerKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32927" then
        runemasterMolgeimKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32857" then
        stormcallerBrundirKilled = true
    end

    if runemasterMolgeimKilled == true and stormcallerBrundirKilled == true and messageAnnounced == false then
        messageAnnounced = true
        core:getAchievementSuccess(4)
    end
end

function core._603:AssemblyOfIronIChooseYouStormcallerBrundir()
    --3
    if core.type == "UNIT_DIED" and core.destID == "32867" then
        steelbreakerKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32927" then
        runemasterMolgeimKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32857" then
        stormcallerBrundirKilled = true
    end

    if runemasterMolgeimKilled == true and steelbreakerKilled == true and messageAnnounced == false then
        messageAnnounced = true
        core:getAchievementSuccess(3)
    end
end

function core._603:AssemblyOfIronIChooseYouRunemasterMolgeim()
    --2
    if core.type == "UNIT_DIED" and core.destID == "32867" then
        steelbreakerKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32927" then
        runemasterMolgeimKilled = true
    elseif core.type == "UNIT_DIED" and core.destID == "32857" then
        stormcallerBrundirKilled = true
    end

    if stormcallerBrundirKilled == true and steelbreakerKilled == true and messageAnnounced == false then
        messageAnnounced = true
        core:getAchievementSuccess(2)
    end
end

function core._603:AssemblyOfIronCantDoThatWhileStunned()
    --1
    if core.type == "SPELL_DAMAGE" and core.spellId == 63479 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")",1)
    end
end

function core._603:HodirCheeseTheFreeze()
    --4
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 61969 and core.currentUnit == "Player" then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")",4)
    end
end

function core._603:HodirIHaveTheCoolestFriends()
    --1
    if core.type == "UNIT_DIED" and core.unitType == "Creature" and core.destID ~= "32845" then
        core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died)",1)
    end
end

function core._603:HodirGettingColdInHere()
    --2
    if core:trackAura(62039, 3, "debuff") == true then
        core:getAchievementFailed(2)
    end
end

function core._603:HodirICouldSayThatThisCacheWasRare()
    --3
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(120, function() 
            core:getAchievementFailed(3)
        end)
    end 
end

function core._603:FreyaConSpeedAtory()
    --1
    local freyaTrashIDs = {"33430", "33431", "33528", "33527", "33526", "33525", "32914", "32913", "33354", "33355", "32915"}
    if core.type == "UNIT_DIED" and timerStarted == false and freyaTrashedStarted == false and core:has_value(freyaTrashIDs, core.destID) == true then
        if timerStartedFreya == false then
            timerStartedFreya = true
            freyaTrashedStarted = true
            core:sendMessage("Tracking: " .. core:getAchievement() .. " 20 Minutes Remaining")
            timerFreya = C_Timer.NewTimer(1200, function() 
                core:sendMessage(GetAchievementLink(12361) .. " FAILED!")
            end)
        end  
    end

    --Freya has died so stop the timer
    if core.type == "UNIT_DIED" and core.destID == "32906" then
        if timerFreya ~= nil then
            core:sendMessage("Cancelling Freya Timer")
            timerFreya:Cancel()
        end
    end
end

function core._603:FreyaLumberjacked()
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
                core:sendMessage(GetAchievementLink(12360) .. " Critera Met")
            elseif bossesKilled < 3 then
                core:sendMessage(GetAchievementLink(12360) .. " FAILED!")
            end
        end)
    end
end

function core._603:FreyaGettingBackToNature()
    --3
    if core.type == "SPELL_AURA_REMOVED_DOSE" and core.amount < 25 then
        --print("Getting back to nature failed")
        core:getAchievementFailed(3)
    end
end

function core._603:FreyaDeforestation()
    --2
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

function core._603:ThorimDontStandInTheLightning()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 62466 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._603:ThorimWhoNeedsBloodlust()

end

function core._603:Shadowdodger()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 63277 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", 2)
    end
end 

function core._603:ILoveTheSmellOfSaroniteInTheMorning()
    if core.type == "UNIT_DIED" and core.destID == "33524" then
        core:getAchievementSuccess(1)
    end
end

function core._603:DriveMeCrazy()
    --3
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 63050 then
        C_Timer.After(1, function() 
            if core.inCombat == true then
                core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", 3)            
            end
        end)
    end
end

function core._603:KissAndMakeUp()
    --4
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 65301 and kissAndMakeUpAnnounced == false then
        core:sendMessage(core:getAchievement(4) .. " /kiss Sara Now!")
        kissAndMakeUpAnnounced = true
    end
end

function core._603:HesNotGettingAnyOlder()
    --2
    if timerStarted3 == false then
        timerStarted3 = true
        timer3 = C_Timer.NewTimer(410, function() 
            core:getAchievementFailed(2)
        end)
    end  
end

function core._603:TheyreComingOutOfTheWalls()
    --1
    core:trackMob("33136", "Guardian of Yogg-Saron", 9, " 9 Guardian of Yogg-Saron have spawned. Group them up then AOE them down", 1, nil, nil)

    if core.mobCounter >= 9 and guardianOfYoggSaronAnnounced == false then
        guardianOfYoggSaronAnnounced = true
    end

    --Add killed
    if core.type == "UNIT_DIED" and core.destID == "33136" and guardianOfYoggSaronAnnounced == true then
        --Only start the timer if enough adds have been collected.
        guardianOfYoggSaronKilled = guardianOfYoggSaronKilled + 1
        if timerStarted2 == false then
            timerStarted2 = true
            core:sendMessage(core:getAchievement() .. " Timer Started! 12 seconds remaining")
            C_Timer.After(12, function()
                if guardianOfYoggSaronKilled >= 9 then
                    core:getAchievementSuccess(1)
                else
                    core:getAchievementFailedWithMessageAfter("Guardians of Yogg-Saron killed (" .. guardianOfYoggSaronKilled .. "/9)", 1)
                    guardianOfYoggSaronKilled = 0
                    timerStarted2 = false
                    guardianOfYoggSaronAnnounced = false
                end
            end)
        else
            if guardianOfYoggSaronKilled >= 9 then
                core:getAchievementSuccess(1)
            end
        end
    end
end

function core._603:ClearVariables()
    timerStarted = false
    timerStarted2 = false
    timerStarted3 = false

    if timer3 ~= nil then
        timer3:Cancel()
    end

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
    feralDefenderCounter = 9

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
            local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unitID, i)
            if spellId == 62705 and repairedAnnounced == false then
                core:sendMessage(GetAchievementLink(2905) .. " FAILED! A player has repaired their vehicle")
                repairedAnnounced = true
            end
        end
    end
end

function core._603.Events:CHAT_MSG_MONSTER_YELL(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss50"].enabled == true then
        if message == "Now, why would you go and do something like that? Didn't you see the sign that said, \"DO NOT PUSH THIS BUTTON!\"? How will we finish testing with the self-destruct mechanism active?" then
            core:getAchievementSuccess(2)
        end   
    end
end

function core._603.TrackAdditional()

end