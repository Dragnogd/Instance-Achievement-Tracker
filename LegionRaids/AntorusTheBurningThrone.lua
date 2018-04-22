--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Antorus The Burning Throne Bosses
------------------------------------------------------
core.AntorusTheBurningThrone = {}
core.AntorusTheBurningThrone.Events = CreateFrame("Frame")

------------------------------------------------------
---- Kin-garoth
------------------------------------------------------
local diabolicBombCounter = 0
local diabolicBombSpawn = 0
local timerStarted = false

------------------------------------------------------
---- Felhounds of Sargeras
------------------------------------------------------
local fhargComplete = false
local shatugComplete = false

------------------------------------------------------
---- Garothi Worldbreaker
------------------------------------------------------
local blightscaleWormsKilled = 0

------------------------------------------------------
---- Antoran High Command
------------------------------------------------------
local felshieldEmitterCounter = 3

function core.AntorusTheBurningThrone:GarothiWorldbreaker()
    if core.type == "UNIT_DIED" and core.destID == "124436" then
        blightscaleWormsKilled = blightscaleWormsKilled + 1
        core:sendMessageDelay("Blightscale Worms Killed (" .. blightscaleWormsKilled .. "/16)", blightscaleWormsKilled, 4)
    end
end

function core.AntorusTheBurningThrone:AntoranHighCommand()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 244902 then
        felshieldEmitterCounter = felshieldEmitterCounter - 1
        core:sendMessage("Felshield Emitter Placed. " .. felshieldEmitterCounter .. " more Felshield Emitters can be placed before achievement fails")
    end

    if felshieldEmitterCounter == 0 then
        core:getAchievementFailed()
    end
end

function core.AntorusTheBurningThrone:FelhoundsOfSargeras()
    --F'harg
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "126916" and core.spellId == 253602 and core.amount == 5 then
        fhargComplete = true
        --print("Fharg Complete")
    end

    --Shatug
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "126915" and core.destID == "126916" and core.spellId == 253602 and core.amount == 5 then
        shatugComplete = true
        --print("Shatug Complete")
    end

    if fhargComplete == true and shatugComplete == true then
        core:getAchievementSuccess()
    end
end

function core.AntorusTheBurningThrone:Varimathras()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED") and core.spellId == 243963 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core.AntorusTheBurningThrone:KinGaroth()
    --Check difficulty of the encounter to determine the number of bombs that spawn
    if core.difficultyID == 14 or core.difficultyID == 17 then
        --Normal/LFR Mode (for testing)
        diabolicBombSpawn = 2
    else
        --Heroic Mode
        diabolicBombSpawn = 3
    end

    --Detect when a bomb is destroyed
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REFRESH") and core.spellId == 181089 then
        diabolicBombCounter = diabolicBombCounter - 1
        core:sendMessage(core.destName .. " Absorbed Diabolic Bomb (" .. diabolicBombCounter .. "/9)")

        --Achievement Failed (can be completed again during same encounter)
        if core.achievementsCompleted[1] == true then
            core:getAchievementFailedWithMessageAfter("Achievement can still be completed by waiting for more diabolic bombs")
            core.achievementsCompleted[1] = false
        end
    end

    --Achievement Success
    if diabolicBombCounter >= 9 then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end 
end

function core.AntorusTheBurningThrone:Aggramar()
    if core.type == "UNIT_DIED" and core.destName == "Manifestation of Taeshalach" then
        core:getAchievementSuccess()
    end
end

function core.AntorusTheBurningThrone:ClearVariables()
    ------------------------------------------------------
    ---- Kin-garoth
    ------------------------------------------------------
    diabolicBombCounter = 0

    ------------------------------------------------------
    ---- Felhounds of Sargeras
    ------------------------------------------------------
    fhargComplete = false
    shatugComplete = false

    ------------------------------------------------------
    ---- Garothi Worldbreaker
    ------------------------------------------------------
    blightscaleWormsKilled = 0

    ------------------------------------------------------
    ---- Antoran High Command
    ------------------------------------------------------
    felshieldEmitterCounter = 3
end

core.AntorusTheBurningThrone.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.AntorusTheBurningThrone:InitialSetup()
    core.AntorusTheBurningThrone.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core.AntorusTheBurningThrone.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, spell, rank, lineID, spellID, ...)
    if core.Instances.Legion.Raids.AntorusTheBurningThrone.boss7.enabled == true then
        if spellID == 248214 and timerStarted == false then
            --Diabolic Bomb Spawned
            timerStarted = true
            diabolicBombCounter = diabolicBombCounter + diabolicBombSpawn
            core:sendMessage("Diabolic Bomb Gained (" .. diabolicBombCounter .. "/9)")
            C_Timer.After(2, function() 
                timerStarted = false
            end)
        end
    end
end