--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Nighthold Bosses
------------------------------------------------------
core.TheNighthold = {}

------------------------------------------------------
---- Trilliax
------------------------------------------------------
local toxicSliceCounter = 0

function core.TheNighthold:Trilliax()
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 206798 then
        toxicSliceCounter = toxicSliceCounter + 1
        print(toxicSliceCounter)
    end			

    if toxicSliceCounter >= 20 then
        core:getAchievementFailed()
    end
end

function core.TheNighthold:Tichondrius()
    if core.type == "SPELL_DAMAGE" and core.spellId == 213534 then
        core:getAchievementFailedPersonal()
    end
end

function core.TheNighthold:ClearVariables()
    ------------------------------------------------------
    ---- Trilliax
    ------------------------------------------------------
    toxicSliceCounter = 0
end