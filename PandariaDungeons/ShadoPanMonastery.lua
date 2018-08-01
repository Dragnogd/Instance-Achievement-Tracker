--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Shado-Pan Monastery Bosses
------------------------------------------------------
core._959 = {}

------------------------------------------------------
---- Sha of Violence
------------------------------------------------------
local destroyingShaCounter = 0
local shaManifestationCounter = 0
local volatileEnergyCounter = 0

------------------------------------------------------
---- Taran Zhu
------------------------------------------------------
local hazeOfHateCounter = 0

function core._959:ShaOfViolence()
    if core.type == "UNIT_DIED" and core.destID == "56765" then
        destroyingShaCounter = destroyingShaCounter + 1
        --print("Destroying Sha: " .. destroyingShaCounter)
    elseif core.type == "UNIT_DIED" and core.destID == "58201" then
        shaManifestationCounter = shaManifestationCounter + 1
        --print("Sha Manifestation: " .. shaManifestationCounter)
    elseif core.type == "UNIT_DIED" and core.destID == "56766" then
        volatileEnergyCounter = volatileEnergyCounter + 1
        --print("Volatile Energy: " .. volatileEnergyCounter)
    end

    if destroyingShaCounter == 2 and shaManifestationCounter == 1 and volatileEnergyCounter == 5 then
        core:getAchievementSuccess()
    end
end

function core._959:TaranZhu()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 107087 then
        hazeOfHateCounter = hazeOfHateCounter + 1
        core:sendMessage(core.destName .. " is at maximum hatred (" .. hazeOfHateCounter .. "/" .. core.groupSize .. ")")
    elseif core.type == "SPELL_AURA_REMOVED" and core.spellId == 107087 then
        hazeOfHateCounter = hazeOfHateCounter - 1
        core:sendMessage(core.destName .. " is not longer at maximum hatred. DO NOT KILL BOSS! (" .. hazeOfHateCounter .. "/" .. core.groupSize .. ")")
        core.achievementCompleted = false
    end

    if hazeOfHateCounter == core.groupSize then
        core:getAchievementSuccess()
    end
end

function core._959:ClearVariables()
    ------------------------------------------------------
    ---- Sha of Violence
    ------------------------------------------------------
    destroyingShaCounter = 0
    shaManifestationCounter = 0
    volatileEnergyCounter = 0

    ------------------------------------------------------
    ---- Taran Zhu
    ------------------------------------------------------
    hazeOfHateCounter = 0
end