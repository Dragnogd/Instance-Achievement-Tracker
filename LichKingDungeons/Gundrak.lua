--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _604 Bosses
------------------------------------------------------
core._604 = {}

------------------------------------------------------
---- Gal'darah
------------------------------------------------------
local playersImpaled = {}
local impaleCounter = 0

function core._604:Sladran()
    --Boss does not fire Encounter Start
    core:getAchievementToTrack()

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 55126 then
        core:getAchievementFailed()
    end
end

function core._604:Moorabi()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 55098 then
        core:getAchievementFailed()
    end
end

function core._604:Galdarah()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 59827 and core:has_value(playersImpaled, core.destName) == false then
        table.insert(playersImpaled, core.destName)
        impaleCounter = impaleCounter + 1
        core:sendMessage(core:getAchievement() .. core.destName .. " Impaled (" .. impaleCounter .. "/5)")
    end

    if impaleCounter == 5 then
        core:getAchievementSuccess()
    end
end

function core._604:ClearVariables()
    ------------------------------------------------------
    ---- Gal'darah
    ------------------------------------------------------
    playersImpaled = {}
    impaleCounter = 0
end