--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Arcway Bosses
------------------------------------------------------
core.TheArcway = {}

function core.TheArcway:Ivanyr()
    if core.type == "SPELL_DAMAGE" and core.spellId == 220581 then
        core:getAchievementFailedPersonal()
    end
end

function core.TheArcway:Corstilax()

end

function core.TheArcway:AdvisorVandros()
    
end

function core.TheArcway:ClearVariables()
end