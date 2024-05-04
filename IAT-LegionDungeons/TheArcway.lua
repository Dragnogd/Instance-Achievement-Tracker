--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Arcway Bosses
------------------------------------------------------
core._1516 = {}

------------------------------------------------------
---- Advisor Vandros
------------------------------------------------------
local advisorVandrosKilled = false

function core._1516:Ivanyr()
    if core.type == "SPELL_DAMAGE" and core.spellId == 220581 then
        core:getAchievementFailedPersonal()
    end
end

function core._1516:AdvisorVandros()
    --Check if boss is dead
    if core.type == "UNIT_DIED" and core.destID == "98208" then
        advisorVandrosKilled = true
    end

    --Timeless Wraith killed
    if core.type == "UNIT_DIED" and core.destID == "103130" and advisorVandrosKilled == false then
        core:getAchievementFailed()
    end
end

function core._1516:ClearVariables()
end