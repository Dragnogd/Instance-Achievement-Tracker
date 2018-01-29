--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Nighthold Bosses
------------------------------------------------------
core.Nighthold = {}

------------------------------------------------------
---- Trilliax
------------------------------------------------------
local toxicSliceCounter = 0

function core.Nighthold:Trilliax()
    if core.type == "SPELL_AURA_APPLIED" and core.spellName == "Toxic Slice" then
        toxicSliceCounter = toxicSliceCounter + 1
    end			

    if toxicSliceCounter >= 20 then
        core:getAchievementFailed()
    end
end

function core.Nighthold:Tichondrius()
    if core.type == "SPELL_DAMAGE" and core.spellName == "Echoes of the Void" then
        core:getAchievementFailedPersonal()
    end
end

function core.Nighthold:ClearVariables()
    ------------------------------------------------------
    ---- Trilliax
    ------------------------------------------------------
    toxicSliceCounter = 0
end