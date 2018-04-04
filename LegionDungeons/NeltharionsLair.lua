--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Neltharions Lair Bosses
------------------------------------------------------
core.NeltharionSLair = {}

function core.NeltharionSLair:Naraxas()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "91005" and core.spellId == 199246 and core.amount == 6 then
        core:getAchievementSuccess()
    end
end

function core.NeltharionSLair:ClearVariables()
end