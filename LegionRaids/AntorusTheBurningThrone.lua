--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Antorus The Burning Throne Bosses
------------------------------------------------------
core._1712 = {}
core._1712.Events = CreateFrame("Frame")

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
local felhoundsKilled = false

------------------------------------------------------
---- Antoran High Command
------------------------------------------------------
local felshieldEmitterCounter = 3

------------------------------------------------------
---- Argus
------------------------------------------------------
local highestEnergy = 0
local starDustCompleted = false
local energyTooHighAnnounced = false

function core._1712:GarothiWorldbreaker()
    if core:getBlizzardTrackingStatus(11930, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._1712:FelhoundsOfSargeras()
    --Detect boss death
    if core.type == "UNIT_DIED" and (core.destID == "122477" or core.destID == "122135") then
        felhoundsKilled = true
    end

    if felhoundsKilled == false then
        --F'harg
        if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "122477" and core.spellId == 253602 then
            core:sendMessage("F'harg Fel Imbuement Counter (" .. core.amount .. "/5)")

            if core.amount == 5 then
                fhargComplete = true
            end
        elseif core.type == "SPELL_AURA_APPLIED" and core.destID == "122477" and core.spellId == 253602 then
            core:sendMessage("F'harg Fel Imbuement Counter (1/5)")        
        elseif core.type == "SPELL_AURA_REMOVED" and core.destID == "122477" and core.spellId == 253602 then
            core:sendMessage("F'harg Fel Imbuement Counter (0/5)")
            fhargComplete = false
            
            if core.achievementsCompleted[1] == true then
                core:sendMessage(core:getAchievement() .. " FAILED! (F'harg has lost Fel Imbuement stacks)")
                core.achievementsCompleted[1] = false
            end
        end

        --Shatug
        if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "122135" and core.spellId == 253602 then
            core:sendMessage("Shatug Fel Imbuement Counter (" .. core.amount .. "/5)")

            if core.amount == 5 then
                shatugComplete = true
            end
        elseif core.type == "SPELL_AURA_APPLIED" and core.destID == "122135" and core.spellId == 253602 then
            core:sendMessage("Shatug Fel Imbuement Counter (1/5)")        
        elseif core.type == "SPELL_AURA_REMOVED" and core.destID == "122135" and core.spellId == 253602 then
            core:sendMessage("Shatug Fel Imbuement Counter (0/5)")
            shatugComplete = false
            
            if core.achievementsCompleted[1] == true then
                core:sendMessage(core:getAchievement() .. " FAILED! (Shatug has lost Fel Imbuement stacks)")
                core.achievementsCompleted[1] = false
            end
        end

        if fhargComplete == true and shatugComplete == true then
            core:getAchievementSuccess()
        end
    end
end

function core._1712:AntoranHighCommand()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 244902 and core.achievementsFailed[1] == false then
        felshieldEmitterCounter = felshieldEmitterCounter - 1
        core:sendMessage(core:getAchievement() .. " Felshield Emitter Placed. You can only place a maximum of " .. felshieldEmitterCounter .. " more Felshield Emitters")

        if felshieldEmitterCounter < 0 then
            core:getAchievementFailed()
        end
    end
end

function core._1712:PortalKeeperHasabel()
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 246929 or core.spellId == 246925 or core.spellId == 246911) then
        core:getAchievementSuccess()
    end
end

function core._1712:Varimathras()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_ABSORBED") and core.spellId == 243963 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._1712:KinGaroth()
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
        local playerName = core.destName
        C_Timer.After(1, function() 
            diabolicBombCounter = diabolicBombCounter - 1
            core:sendMessage(playerName .. " Absorbed Diabolic Bomb (" .. diabolicBombCounter .. "/9)")
    
            --Achievement Failed (can be completed again during same encounter)
            if core.achievementsCompleted[1] == true and diabolicBombCounter < 9 then
                core:getAchievementFailedWithMessageAfter("Achievement can still be completed by waiting for more diabolic bombs")
                core.achievementsCompleted[1] = false
            end        
        end)
    end

    --Achievement Success
    if diabolicBombCounter >= 9 then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end 
end

function core._1712:Aggramar()
    if core.type == "UNIT_DIED" and core.destName == "Manifestation of Taeshalach" then
        core:getAchievementSuccess()
    end
end

function core._1712:ClearVariables()
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

    ------------------------------------------------------
    ---- Argus
    ------------------------------------------------------
    --Output best attempt to chat
    if highestEnergy > 0 and highestEnergy < 80 then
        core:sendMessage(GetAchievementLink(12257) .. " Best attempt last kill (" .. highestEnergy .. "/80). Khaz'Goroth must gain 80 energy within 5 seconds to complete this achievement")
    else
        --core:sendMessage("Highest Energy is 0")
    end
    highestEnergy = 0
    energyTooHighAnnounced = false
    starDustCompleted = false
end

function core._1712:InstanceCleanup()
    core._1712.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._1712.Events:UnregisterEvent("UNIT_POWER_UPDATE")
    felhoundsKilled = false
end

core._1712.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1712:InitialSetup()
    core._1712.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._1712.Events:RegisterEvent("UNIT_POWER_UPDATE")

    --core:sendDebugMessage("HERE asdasd")
    --print(core._1712.Events:IsEventRegistered("UNIT_POWER_UPDATE"))
end

function core._1712.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss7"].enabled == true then
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

function core._1712.Events:UNIT_POWER_UPDATE(self, unit, powerType)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss11"].enabled == true then
        if UnitGUID(unit) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unit))
            if destID == "125886" and UnitPower(unit) > 0 then
                --print(UnitPower(unit))

                --Save current power locally
                local currentPower = UnitPower(unit)

                --Wait 5 seconds to see if Khaz'Goroth has gained 80 power within 5 seconds
                C_Timer.After(5, function() 
                    local newPower = UnitPower(unit)

                    --Update highest energy if higher than current attempt. This is so we can output at the end of the fight how well the group did
                    if (newPower - currentPower) > highestEnergy and starDustCompleted == false then
                        if highestEnergy >= 0 then
                            highestEnergy = newPower - currentPower
                            core:sendMessage(GetAchievementLink(12257) .. " Best attempt this pull (" .. highestEnergy .. "/80). Khaz'Goroth must gain 80 energy within 5 seconds to complete this achievement")
                        end
                    end

                    --Achievement Completed
                    if (newPower - currentPower) >= 80 then
                        core:getAchievementSuccess()
                        --print("Boss gained: " .. (newPower - currentPower) .. " energy")
                        starDustCompleted = true
                    end

                    --Khaz energy too high so cannot track achievement any more
                    if starDustCompleted == false and energyTooHighAnnounced == false and newPower == 100 then
                        core:sendMessage(GetAchievementLink(12257) .. " Unable to track achievement. Khaz'Goroth energy must be at 20 energy or lower for IAT to track this achievement")
                        energyTooHighAnnounced = true                        
                    end
                end)
            end
        end
    end
end