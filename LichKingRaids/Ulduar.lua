--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Ulduar Bosses
------------------------------------------------------
core.Ulduar = {}
core.Ulduar.Events = CreateFrame("Frame")
local timerStarted = false
local timerStarted2 = false

------------------------------------------------------
---- Dwarfageddon
------------------------------------------------------
local steelforgedDefenderUID = {}
local steelforgedDefenderCounter = 0
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

function core.Ulduar:Dwarfageddon()
    --Add killed
    if core.type == "UNIT_DIED" then
        steelforgedDefenderUID[core.spawn_uid_dest] = nil
        steelforgedDefenderCounter = steelforgedDefenderCounter - 1

        --Only start the timer if enough adds have been collected.
        if steelforgedDefenderAnnounced == true then
            steelforgedDefenderKilled = steelforgedDefenderKilled + 1
            if timerStarted == false then
                timerStarted = true
                core:sendMessage("Timer Started! 10 seconds remaining" ,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
                C_Timer.After(10, function()
                    if steelforgedDefenderKilled >= 100 then
                        core:sendMessage(core:getAchievement() .. " COMPLETED! Steelforged Defenders were killed in time (" .. steelforgedDefenderKilled .. "/100)") 
                    else
                        core:sendMessage(core.getAchievement() .. " FAILED! Steelforged Defenders were not killed in time (" .. steelforgedDefenderKilled .. "/100). This achievement can be attempted again.")
                        steelforgedDefenderKilled = 0
                        timerStarted = false
                        steelforgedDefenderAnnounced = false
                    end
                end)
            end
        end
    end

    --Add detected
    if core.sourceID == "33572" and steelforgedDefenderCounter <= 100 and steelforgedDefenderAnnounced == false then
        if steelforgedDefenderUID[core.spawn_uid] == nil then
            steelforgedDefenderUID[core.spawn_uid] = core.spawn_uid
            steelforgedDefenderCounter = steelforgedDefenderCounter + 1
            core:sendMessageDelay("Steelforged Defender Counter (" .. steelforgedDefenderCounter .. "/100)",steelforgedDefenderCounter,10)
        end
    end
    if core.destID == "33572" and steelforgedDefenderCounter <= 100 and steelforgedDefenderAnnounced == false then
        if steelforgedDefenderUID[core.spawn_uid_dest] == nil then
            steelforgedDefenderUID[core.spawn_uid_dest] = core.spawn_uid_dest
            steelforgedDefenderCounter = steelforgedDefenderCounter + 1
            core:sendMessageDelay("Steelforged Defender Counter (" .. steelforgedDefenderCounter .. "/100)",steelforgedDefenderCounter,10)
        end
    end

    --Requirements Met
    if steelforgedDefenderCounter >= 100 and steelforgedDefenderAnnounced == false then
        steelforgedDefenderAnnounced = true
        if core.difficultyID == 4 then
            core:sendMessage("[WIP] "  .. core:getAchievement() .. " requirements have been met. Adds can now be killed!")
        elseif core.difficultyID == 3 then
            core:sendMessage("[WIP] " .. core:getAchievement() .. " requirements have been met. Adds can now be killed!")
        end
    end
end

function core.Ulduar:FlameLeviathanTakeOutThoseTurrets()
    if core.type == "PARTY_KILL" and core.destID == 33142 then
        core:getAchievementSuccessPersonal()
    end
end

function core.Ulduar:FlameLeviathanShutout()
    if core.type == "SPELL_AURA_APPLIED" and core.spellID == 62475 then
        core:getAchievementFailed(2)
    end
end

function core.Ulduar:RazorscaleIronDwarfMediumRare()
    if core.type == "UNIT_DIED" and core.spellId == 63317 and core.destID == "33388" then
        darkRuneGuardianKilled = darkRuneGuardianKilled + 1
        print(darkRuneGuardianKilled)
        core:sendMessageDelay("Dark Rune Guardian Killed (" .. darkRuneGuardianKilled .. "/25)",darkRuneGuardianKilled,5)
    end

    core:trackMob("33388", "Dark Rune Guardian", 25, "25 Dark Rune Guardian have spawned!",5)

    if darkRuneGuardianKilled >= 25 then
        core:getAchievementSuccess()
    end
end

function core.Ulduar:RazorscaleAQuickShave()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 62666 and (UnitHealth("boss1") / UnitHealthMax("boss1") * 100) > 50 then
        takeOff = takeOff + 1
        print(takeOff)
    end

    if takeOff == 2 then
        core:getAchievementFailed()
    end
end

function core.Ulduar:IgnisTheFurnaceMasterShattered()
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

function core.Ulduar:IgnisTheFurnaceMasterStokinTheFurnace()
    if timerStarted2 == false then
        timerStarted2 = true
        timer = C_Timer.NewTimer(240, function() 
            core:getAchievementFailed(2)
        end)
    end
    
end

function core.Ulduar:XT002DeconstructorNerfEngineering()
    if core.type == "SPELL_INSTAKILL" and core.spellId == 62834 then
        core:getAchievementFailed()
    end
end

function core.Ulduar:XT002DeconstructorHeartbreaker()
    if core.type == "PARTY_KILL" and core.destID == "33329" then
        core:getAchievementSuccess(5)
        print("Success")
        print()
    end
end

function core.Ulduar:ClearVariables()
    timerStarted = false
    timerStarted2 = false

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
end

function core.Ulduar:InitialSetup()
    core.Ulduar.Events:RegisterEvent("UNIT_AURA")
end

core.Ulduar.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.Ulduar.Events:UNIT_AURA(self, unitID, ...)
    if UnitBuff(unitID, GetSpellInfo(62705)) ~= nil and repairedAnnounced == false then
        core:sendMessage(GetAchievementLink(2905) .. " FAILED! A player has repaired their vechile")
        repairedAnnounced = true
    end
end