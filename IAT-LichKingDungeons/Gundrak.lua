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
    --Defeat Slad'ran in Gundrak on Heroic Difficulty without getting snake wrapped.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 55126 then
        core:getAchievementFailed()
    end
end

function core._604:Moorabi()
    --Defeat Moorabi in Gundrak on Heroic Difficulty while preventing him from transforming into a mammoth at any point during the encounter.

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 55098 then
        core:getAchievementFailed()
    end
end

function core._604:Galdarah()
    --Defeat Gal'darah in Gundrak on Heroic Difficulty and have 5 unique party members get impaled throughout the fight.

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