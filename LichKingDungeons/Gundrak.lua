--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Gundrak Bosses
------------------------------------------------------
core.Gundrak = {}

------------------------------------------------------
---- Gal'darah
------------------------------------------------------
local playersImpaled = {}
local impaleCounter = 0

function core.Gundrak:Sladran()
    --Boss does not fire Encounter Start
    core:getAchievementToTrack()

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 55126 then
        core:getAchievementFailed()
    end
end

function core.Gundrak:Moorabi()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 55098 then
        core:getAchievementFailed()
    end
end

function core.Gundrak:Galdarah()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 59827 and core:has_value(playersImpaled, core.destName) == false then
        table.insert(playersImpaled, core.destName)
        impaleCounter = impaleCounter + 1
        core:sendMessage(core:getAchievement() .. core.destName .. " Impaled (" .. impaleCounter .. "/5)")
    end

    if impaleCounter == 5 then
        core:getAchievementSuccess()
    end
end

function core.Gundrak:ClearVariables()
    ------------------------------------------------------
    ---- Gal'darah
    ------------------------------------------------------
    playersImpaled = {}
    impaleCounter = 0
end