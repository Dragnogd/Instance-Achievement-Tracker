--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Vault of the Wardens Bosses
------------------------------------------------------
core.VaultOfTheWardens = {}

function core.VaultOfTheWardens:Cordana()
    if core.type == "SPELL_DAMAGE" and core.core.spellId == 197506 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core.VaultOfTheWardens:ClearVariables()
end