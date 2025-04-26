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
	--Defeat 20 Frenzied Crocolisks within 10 seconds during the Lockmaw encounter in the Lost City of the Tol'vir on Heroic Difficulty.
	core.MobCounter:Setup(20, 9.9, "43658")
	core.MobCounter:DetectSpawnedMob()
	core.MobCounter:DetectKilledMob()
end

function core._755:HighProphetBarim()
    --Defeat 3 Burning Souls during the High Prophet Barim encounter in Lost City of the Tol'vir on Heroic Difficulty.

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
    --Defeat Siamat, Lord of the South Wind, with 3 stacks of Lightning Charge in Lost City of the Tol'vir on Heroic Difficulty.

    --Met Requirements
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 93959 and core.amount == 3 and lightingChargeUID[core.spawn_uid_dest_Player] == nil then
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