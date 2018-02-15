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
        print("Fharg Complete")
    end

    --Shatug
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "126915" and core.destID == "126916" and core.spellId == 253602 and core.amount == 5 then
        shatugComplete = true
        print("Shatug Complete")
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
        if spellID == 248214 then
            diabolicBombCounter = diabolicBombCounter + 1
            print(diabolicBombCounter)
        elseif spellID == 246779 then
            diabolicBombCounter = diabolicBombCounter - 1
            print(diabolicBombCounter)
    
            --If achievemnt has already been completed then announce achievement is no longer complete
            core:getAchievementFailedWithMessageAfter("Achievement can still be completed by waiting for more diabolic bombs")
            core.achievementsCompleted[1] = false
        end
    
        if diabolicBombCounter >= 9 then
            core:getAchievementSuccess()
            core.achievementsFailed[1] = false
        end      
    end
end