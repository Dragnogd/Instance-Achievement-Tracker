--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- WaycrestManor Bosses
------------------------------------------------------
core._1862 = {}

function core._1862:SoulboundGoliath()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 260512 and core.amount >= 12 then 
        core:getAchievementFailed()
    end
end