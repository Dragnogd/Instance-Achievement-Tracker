--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Lost City of Tol'vir Bosses
------------------------------------------------------
core._755 = {}

------------------------------------------------------
---- Lockmaw
------------------------------------------------------
local frenziedCrocoliskUID = {}
local frenziedCrocoliskCounter = 0
local frenziedCrocoliskAnnounced = false
local frenziedCrocoliskKilled = 0
local timerStarted = false

------------------------------------------------------
---- High Prophet Barim
------------------------------------------------------
local burningSoulCounter = 0
local buringSoulAuraUID = {}

------------------------------------------------------
---- Siamat
------------------------------------------------------
local lightningChargeCounter = 0
local lightingChargeUID = {}

function core._755:Lockmaw()
    if core.sourceID == "43658" then
        if frenziedCrocoliskUID[core.spawn_uid] == nil then
            frenziedCrocoliskUID[core.spawn_uid] = core.spawn_uid
            frenziedCrocoliskCounter = frenziedCrocoliskCounter + 1
            --print(frenziedCrocoliskCounter)
            if frenziedCrocoliskCounter - math.floor(frenziedCrocoliskCounter/5)*5 == 0 and frenziedCrocoliskCounter <= 20 then
                core:sendMessage(L["LostCityOfTheTolVir_FrenziedCrocodileCounter"] .. " (" .. frenziedCrocoliskCounter .. "/20)")
            end
        end        
    elseif core.destID == "43658" then
        if frenziedCrocoliskUID[core.spawn_uid_dest] == nil then
            frenziedCrocoliskUID[core.spawn_uid_dest] = core.spawn_uid_dest
            frenziedCrocoliskCounter = frenziedCrocoliskCounter + 1
            --print(frenziedCrocoliskCounter)
            if frenziedCrocoliskCounter - math.floor(frenziedCrocoliskCounter/5)*5 == 0 and frenziedCrocoliskCounter <= 20 then
                core:sendMessage(L["LostCityOfTheTolVir_FrenziedCrocodileCounter"] .. " (" .. frenziedCrocoliskCounter .. "/20)")
            end
        end        
    end

    if core.type == "UNIT_DIED" and core.destID == "43658" then
        frenziedCrocoliskCounter = frenziedCrocoliskCounter - 1
        frenziedCrocoliskUID[core.spawn_uid_dest] = nil
        --print(frenziedCrocoliskCounter)

        if frenziedCrocoliskAnnounced == true then
            frenziedCrocoliskKilled = frenziedCrocoliskKilled + 1
            if timerStarted == false then
                timerStarted = true
                C_Timer.After(10, function() 
                    if frenziedCrocoliskKilled >= 20 then
                        core:getAchievementSuccess()
                    elseif frenziedCrocoliskKilled < 20 and core.inCombat == true then
                        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " " .. frenziedCrocoliskKilled .. "/20 " .. L["LostCityOfTheTolVir_FrenziedCrocodileKilled"])
                        frenziedCrocoliskKilled = 0
                        timerStarted = false
                        frenziedCrocoliskAnnounced = false
                    end
                end)
            end
        end
    end

    if frenziedCrocoliskCounter == 20 and frenziedCrocoliskAnnounced == false then
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " " .. frenziedCrocoliskCounter .. "/20 " .. L["LostCityOfTheTolVir_FrenziedCrocodileKilled"])
        frenziedCrocoliskAnnounced = true
    end
end

function core._755:HighProphetBarim()
    --When a spell aura is applied to a buring soul add to table
    --Remove spell aura when removed
    --If burning soul is killed and spell aura is active than add 1 to counter
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 91277 then
        if buringSoulAuraUID[core.spawn_uid_dest] == nil then
            buringSoulAuraUID[core.spawn_uid_dest] = core.spawn_uid_dest
        end
    end

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 91277 then
        if buringSoulAuraUID[core.spawn_uid_dest] ~= nil then
            buringSoulAuraUID[core.spawn_uid_dest] = nil
        end
    end

    if core.type == "UNIT_DIED" and core.destID == "43934" and buringSoulAuraUID[core.spawn_uid_dest] ~= nil then
        burningSoulCounter = burningSoulCounter + 1
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " " .. burningSoulCounter .. "/3 " .. L["LostCityOfTheTolVir_BurningSoulsKilled"])
    end

    if burningSoulCounter == 3 then
        core:getAchievementSuccess()
    end
end

function core._755:Siamat()
    --Met Requirements
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 93959 and core.amount == 2 and lightingChargeUID[core.spawn_uid_dest_Player] == nil then
        lightningChargeCounter = lightningChargeCounter + 1
        core:sendMessage(core.destName .. " " .. L["Shared_MeetsCritera"] .. " " .. GetAchievementLink(core.achievementIDs[1]) .. " (" .. lightningChargeCounter .. "/" .. core.groupSize .. ")")
        lightingChargeUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
        
    end

    --Failed Requirements
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 93959 and lightingChargeUID[core.spawn_uid_dest_Player] ~= nil then
        lightningChargeCounter = lightningChargeCounter - 1
        core:sendMessage(core.destName .. " " .. L["Shared_DoesNotMeetCritera"] .. " " .. GetAchievementLink(core.achievementIDs[1]) .. " (" .. lightningChargeCounter .. "/" .. core.groupSize .. ")")
        lightingChargeUID[core.spawn_uid_dest_Player] = nil
        core.achievementsCompleted[1] = false
    end

    if lightningChargeCounter == core.groupSize then
        core:getAchievementSuccess()
    end
end

function core._755:ClearVariables()
    ------------------------------------------------------
    ---- Lockmaw
    ------------------------------------------------------
    frenziedCrocoliskUID = {}
    frenziedCrocoliskCounter = 0
    frenziedCrocoliskAnnounced = false
    frenziedCrocoliskKilled = 0
    timerStarted = false

    ------------------------------------------------------
    ---- High Prophet Barim
    ------------------------------------------------------
    burningSoulCounter = 0
    buringSoulAuraUID = {}

    ------------------------------------------------------
    ---- Siamat
    ------------------------------------------------------
    lightningChargeCounter = 0
    lightingChargeUID = {}
end