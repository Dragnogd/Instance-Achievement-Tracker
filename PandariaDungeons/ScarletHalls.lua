--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Scarlet Halls Bosses
------------------------------------------------------
core._1001 = {}

------------------------------------------------------
---- Houndmaster Braun
------------------------------------------------------
local dogsKilled = false

------------------------------------------------------
---- Armsmaster Harlan
------------------------------------------------------
local bladesOfLightCounter = 0

function core._1001:HoundmasterBraun()
    if core.type == "UNIT_DIED" and (core.destID == "58876" or core.destID == "58674" or core.destID == "59309") and dogsKilled == false and C_EncounterJournal.IsEncounterComplete(660) == false then
        core:sendMessage(GetAchievementLink(6684) .. " " .. L["Core_Failed"],true,"failed")
        dogsKilled = true
    end
end

function core._1001:ArmsmasterHarlan()
    if core.type == "SPELL_AURA_APPLIED" and core.destID ~= "58632" and core.spellId == 112955 then
        bladesOfLightCounter = bladesOfLightCounter + 1
        print(bladesOfLightCounter)
    elseif core.type == "SPELL_AURA_REMOVED" and core.destID ~= "58632" and core.spellId == 112955 then
        bladesOfLightCounter = bladesOfLightCounter - 1
        print(bladesOfLightCounter)
    end

    if bladesOfLightCounter >= 8 then
        core:getAchievementSuccess()
    end
end

function core._1001:ClearVariables()
    ------------------------------------------------------
    ---- Armsmaster Harlan
    ------------------------------------------------------
    bladesOfLightCounter = 0
end

function core._1001:InstanceCleanup()
    dogsKilled = false
end