--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _1007 Bosses
------------------------------------------------------
core._1007 = {}

function core._1007:Rattlegore()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.doseAmount > 5 and core.spellId == 113765 then
        core:getAchievementFailed()
    end
end

function core._1007:Sanguinarian()
    -- if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 114141 then
    --     print(core.doseAmount)
    -- end
    
    --TODO: need to test if this actually works
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.doseAmount == 99 and core.spellId == 114141 then
        core:getAchievementFailed()
    end
end

function core._1007:ClearVariables()
end