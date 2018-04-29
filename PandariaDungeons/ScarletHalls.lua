--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Scarlet Halls Bosses
------------------------------------------------------
core.ScarletHalls = {}

------------------------------------------------------
---- Houndmaster Braun
------------------------------------------------------
local dogsKilled = false

------------------------------------------------------
---- Armsmaster Harlan
------------------------------------------------------
local bladesOfLightCounter = 0

function core.ScarletHalls:HoundmasterBraun()
    if core.type == "UNIT_DIED" and (core.destID == "58876" or core.destID == "58674" or core.destID == "59309") and dogsKilled == false then
        core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED!. Reset the instance to attempt this achievement again")
        dogsKilled = true
    end
end

function core.ScarletHalls:ArmsmasterHarlan()
    if core.type == "SPELL_AURA_APPLIED" and core.destID ~= "58632" and core.spellId == 112955 then
        bladesOfLightCounter = bladesOfLightCounter + 1
        --print(bladesOfLightCounter)
    elseif core.type == "SPELL_AURA_REMOVED" and core.destID ~= "58632" and core.spellId == 112955 then
        bladesOfLightCounter = bladesOfLightCounter - 1
        --print(bladesOfLightCounter)
    end

    if bladesOfLightCounter >= 8 then
        core:getAchievementSuccess()
    end
end

function core.ScarletHalls:ClearVariables()
    ------------------------------------------------------
    ---- Armsmaster Harlan
    ------------------------------------------------------
    bladesOfLightCounter = 0
end