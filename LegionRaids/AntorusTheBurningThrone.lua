--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

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
local fhargCounter = 0
local shatugCounter = 0

------------------------------------------------------
---- Antoran High Command
------------------------------------------------------
local felshieldEmitterCounter = 3

------------------------------------------------------
---- Coven of Shivarra
------------------------------------------------------
local norgannonUID = {}
local norgannonCounter = 0
local khazgorothUID = {}
local khazgorothCounter = 0
local amanthulUID = {}
local amanthulCounter = 0
local golgannethUID = {}
local golgannethCounter = 0
local covenKilled = false
local khazgorothAnnounced = false
local norgannonAnnounced = false
local amanthulAnnounced = false
local golgannethAnnounced = false

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
            --core:sendMessage("F'harg Fel Imbuement Counter (" .. core.amount .. "/5)")
            fhargCounter = core.amount
            core:sendMessage("F'harg Fel " .. L["Core_Counter"] .. " (" .. fhargCounter .. "/5) Shatug " .. L["Core_Counter"] .. " (" .. shatugCounter .. "/5)")

            if core.amount == 5 then
                fhargComplete = true
            end
        elseif core.type == "SPELL_AURA_APPLIED" and core.destID == "122477" and core.spellId == 253602 then
            --core:sendMessage("F'harg Fel Imbuement Counter (1/5)")        
            fhargCounter = 1
            core:sendMessage("F'harg Fel " .. L["Core_Counter"] .. " (" .. fhargCounter .. "/5) Shatug " .. L["Core_Counter"] .. " (" .. shatugCounter .. "/5)")
        elseif core.type == "SPELL_AURA_REMOVED" and core.destID == "122477" and core.spellId == 253602 then
            --core:sendMessage("F'harg Fel Imbuement Counter (0/5)")
            fhargCounter = 0
            core:sendMessage("F'harg Fel " .. L["Core_Counter"] .. " (" .. fhargCounter .. "/5) Shatug " .. L["Core_Counter"] .. " (" .. shatugCounter .. "/5)")
            fhargComplete = false
            
            if core.achievementsCompleted[1] == true then
                core:sendMessage(core:getAchievement() .. " FAILED! (F'harg has lost Fel Imbuement stacks)")
                core.achievementsCompleted[1] = false
            end
        end

        --Shatug
        if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "122135" and core.spellId == 253602 then
            --core:sendMessage("Shatug Fel Imbuement Counter (" .. core.amount .. "/5)")
            shatugCounter = core.amount
            core:sendMessage("F'harg Fel " .. L["Core_Counter"] .. " (" .. fhargCounter .. "/5) Shatug " .. L["Core_Counter"] .. " (" .. shatugCounter .. "/5)")

            if core.amount == 5 then
                shatugComplete = true
            end
        elseif core.type == "SPELL_AURA_APPLIED" and core.destID == "122135" and core.spellId == 253602 then
            --core:sendMessage("Shatug Fel Imbuement Counter (1/5)")  
            shatugCounter = 1
            core:sendMessage("F'harg Fel " .. L["Core_Counter"] .. " (" .. fhargCounter .. "/5) Shatug " .. L["Core_Counter"] .. " (" .. shatugCounter .. "/5)")
        elseif core.type == "SPELL_AURA_REMOVED" and core.destID == "122135" and core.spellId == 253602 then
            --core:sendMessage("Shatug Fel Imbuement Counter (0/5)")
            shatugCounter = 0
            core:sendMessage("F'harg Fel " .. L["Core_Counter"] .. " (" .. fhargCounter .. "/5) Shatug " .. L["Core_Counter"] .. " (" .. shatugCounter .. "/5)")
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

    if core:getBlizzardTrackingStatus(11928) == true then
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

function core._1712:CovenOfShivarra()
    --Coven Killed
    if core.type == "UNIT_DIED" and (core.destID == "122467" or core.destID == "122469" or core.destID == "122468") then
        covenKilled = true
    end

    -- Torment of Khaz'goroth
    --Spawned
    if core.type == "SPELL_CAST_START" and core.sourceID == "124166" and core.spellId == 245671 then
        if khazgorothUID[core.spawn_uid] == nil then
            khazgorothUID[core.spawn_uid] = core.spawn_uid
            khazgorothCounter = khazgorothCounter + 1
        end
    end

    --Killed
    if core.type == "SPELL_AURA_REMOVED" and core.sourceID == "124166" and core.spellId == 245671 then
        if khazgorothUID[core.spawn_uid] ~= nil then
            khazgorothUID[core.spawn_uid] = nil
            khazgorothCounter = khazgorothCounter - 1
        end
    elseif (core.destID == "124166" and core.overkill > 0) or (core.type == "UNIT_DIED" and core.destID == "124166") then
        if khazgorothUID[core.spawn_uid_dest] ~= nil then
            khazgorothUID[core.spawn_uid_dest] = nil
            khazgorothCounter = khazgorothCounter - 1
        end
    end

    -- Torment of Norgannon
    --Spawned
    if core.type == "SPELL_AURA_APPLIED" and core.sourceID == "123503" and core.spellId == 249863 then
        if norgannonUID[core.spawn_uid] == nil then
            norgannonUID[core.spawn_uid] = core.spawn_uid
            norgannonCounter = norgannonCounter + 1
        end
    end

    --Killed
    if core.type == "UNIT_DIED" and core.destID == "123503" then
        if norgannonUID[core.spawn_uid_dest] ~= nil then
            norgannonUID[core.spawn_uid_dest] = nil
            norgannonCounter = norgannonCounter - 1
        end
    elseif core.destID == "123503" and core.overkill > 0 and string.find(core.type, "_MISSED") == nil then
        if norgannonUID[core.spawn_uid_dest] ~= nil then
            norgannonUID[core.spawn_uid_dest] = nil
            norgannonCounter = norgannonCounter - 1
        end
    end
    
    -- Torment of Golganneth
    --Spawned
    if core.type == "SPELL_CAST_START" and core.sourceID == "124164" and core.spellId == 246739 then
        if golgannethUID[core.spawn_uid] == nil then
            golgannethUID[core.spawn_uid] = core.spawn_uid
            golgannethCounter = golgannethCounter + 1
        end
    end

    --Killed
    if (core.type == "SPELL_AURA_REMOVED" and core.sourceID == "124164" and core.spellId == 246739) then
        if golgannethUID[core.spawn_uid] ~= nil then
            golgannethUID[core.spawn_uid] = nil
            golgannethCounter = golgannethCounter - 1
        end
    elseif (core.destID == "124164" and core.overkill > 0) or (core.type == "UNIT_DIED" and core.destID == "124164") then
        if golgannethUID[core.spawn_uid_dest] ~= nil then
            golgannethUID[core.spawn_uid_dest] = nil
            golgannethCounter = golgannethCounter - 1
        end
    end
    
    -- Torment of Aman'Thul
    --Spawned
    if (core.type == "SPELL_CAST_SUCCESS" and core.sourceID == "125837" and core.spellId == 250097) or (core.sourceID == "125837") then
        if amanthulUID[core.spawn_uid] == nil then
            amanthulUID[core.spawn_uid] = core.spawn_uid
            amanthulCounter = amanthulCounter + 1
        end
    elseif core.destID == "125837" then
        if amanthulUID[core.spawn_uid_dest] == nil then
            amanthulUID[core.spawn_uid_dest] = core.spawn_uid_dest
            amanthulCounter = amanthulCounter + 1
        end     
    end

    --Killed
    if (core.type == "SPELL_AURA_REMOVED" and core.sourceID == "125837" and core.spellId == 250097) then
        if amanthulUID[core.spawn_uid] ~= nil then
            amanthulUID[core.spawn_uid] = nil
            amanthulCounter = amanthulCounter - 1
        end
    elseif (core.destID == "125837" and core.overkill > 0) or (core.type == "UNIT_DIED" and core.destID == "125837") then
        if amanthulUID[core.spawn_uid_dest] ~= nil then
            amanthulUID[core.spawn_uid_dest] = nil
            amanthulCounter = amanthulCounter - 1
        end
    end

    --Get text colours
    local khazgorothColour, norgannonColour, golgannethColour, amanthulColour

    local tormentsCounter = 0
    if khazgorothCounter >= 1 then
        tormentsCounter = tormentsCounter + 1
        khazgorothColour = "|cff59FF00"
    else
        khazgorothColour = "|cffFF0000"
    end
    if norgannonCounter >= 1 then
        tormentsCounter = tormentsCounter + 1
        norgannonColour = "|cff59FF00"
    else
        norgannonColour = "|cffFF0000"
    end
    if golgannethCounter >= 1 then
        tormentsCounter = tormentsCounter + 1
        golgannethColour = "|cff59FF00"
    else
        golgannethColour = "|cffFF0000"
    end
    if amanthulCounter >= 1 then
        tormentsCounter = tormentsCounter + 1
        amanthulColour = "|cff59FF00"
    else
        amanthulColour = "|cffFF0000"
    end
    core.IATInfoFrame:SetSubHeading1("Torments Found (" .. tormentsCounter .. "/4)")

    if khazgorothCounter >= 1 then
        if khazgorothAnnounced == false then
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(124166) .. " " .. L["Shared_Found"] .. " (" .. tormentsCounter .. "/4)")
            khazgorothAnnounced = true
        end
    end
    if norgannonCounter >= 1 then
        if norgannonAnnounced == false then
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(123503) .. " " .. L["Shared_Found"] .. " (" .. tormentsCounter .. "/4)")
            norgannonAnnounced = true
        end
    end
    if golgannethCounter >= 1 then
        if golgannethAnnounced == false then
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(124164) .. " " .. L["Shared_Found"] .. " (" .. tormentsCounter .. "/4)")
            golgannethAnnounced = true
        end
    end
    if amanthulCounter >= 1 then
        if amanthulAnnounced == false then
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(125837) .. " " .. L["Shared_Found"] .. " (" .. tormentsCounter .. "/4)")
            amanthulAnnounced = true
        end
    end

    local messageStr = khazgorothColour .. getNPCName(124166) .. " " .. khazgorothCounter .. "|r\n" .. norgannonColour .. getNPCName(123503) .. " " .. norgannonCounter .. "|r\n" .. golgannethColour .. getNPCName(124164) .. " " .. golgannethCounter .. "|r\n" .. amanthulColour .. getNPCName(125837) .. " " .. amanthulCounter .. "|r"
    core.IATInfoFrame:SetText1(messageStr)
    
    --Achievement Completed
    if khazgorothCounter >= 1 and norgannonCounter >= 1 and golgannethCounter >= 1 and amanthulCounter >= 1 then
        core:getAchievementSuccess()

        --If achievement had already failed then set back to not failed
        if core.achievementsFailed[1] == true then
            core.achievementsFailed[1] = false
        end
    end


    --Achievement Failed
    if core.achievementsCompleted[1] == true and (khazgorothCounter == 0 or norgannonCounter == 0 or golgannethCounter == 0 or amanthulCounter == 0) then
        local addKilled = ""
        if khazgorothCounter == 0 then
            addKilled = getNPCName(124166)
            khazgorothAnnounced = false
        elseif norgannonCounter == 0 then
            addKilled = getNPCName(123503)
            norgannonAnnounced = false
        elseif golgannethCounter == 0 then
            addKilled = getNPCName(124164)
            golgannethAnnounced = false
        elseif amanthulCounter == 0 then
            addKilled = getNPCName(125837)
            amanthulAnnounced = false
        end

        C_Timer.After(1, function() 
            if covenKilled == false then
                core:getAchievementFailedWithMessageAfter(L["Core_Reason"] .. " " .. addKilled .. " " .. L["Shared_WasKilled"])            
            end
        end)

        --If achievement had already completed then set back to not completed
        if core.achievementsCompleted[1] == true then
            core.achievementsCompleted[1] = false
        end
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
        --core:sendMessage(GetAchievementLink(12257) .. " Best attempt last kill (" .. highestEnergy .. "/80). Khaz'Goroth must gain 80 energy within 5 seconds to complete this achievement")
        core:sendMessage(GetAchievementLink(12257) .. " Best attempt this pull: (" .. floor(highestEnergy / 4) .. "/20) Orbs Collected")
    else
        --core:sendMessage("Highest Energy is 0")
    end
    highestEnergy = 0
    energyTooHighAnnounced = false
    starDustCompleted = false

    ------------------------------------------------------
    ---- Coven of Shivarra
    ------------------------------------------------------
    norgannonUID = {}
    norgannonCounter = 0
    khazgorothUID = {}
    khazgorothCounter = 0
    amanthulUID = {}
    amanthulCounter = 0
    golgannethUID = {}
    golgannethCounter = 0
    khazgorothAnnounced = false
    norgannonAnnounced = false
    amanthulAnnounced = false
    golgannethAnnounced = false
end

function core._1712:InstanceCleanup()
    core._1712.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._1712.Events:UnregisterEvent("UNIT_POWER_UPDATE")
    felhoundsKilled = false
    covenKilled = false
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
                            --core:sendMessage(GetAchievementLink(12257) .. " Best attempt this pull (" .. highestEnergy .. "/80). Khaz'Goroth must gain 80 energy within 5 seconds to complete this achievement")
                            core:sendMessage(GetAchievementLink(12257) .. " Best attempt this pull: (" .. floor(highestEnergy / 4) .. "/20) Orbs Collected")
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

                    --Reset energy too high message since khaz energy has got to 20 or below
                    if starDustCompleted == false and energyTooHighAnnounced == true and newPower <= 20 then
                        energyTooHighAnnounced = false
                    end
                end)
            end
        end
    end
end