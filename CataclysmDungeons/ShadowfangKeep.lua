--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Shadowfang Keep Bosses
------------------------------------------------------
core._33 = {}

------------------------------------------------------
---- Lord Godfrey
------------------------------------------------------
local bloodthirstyGhoulCounter = 0

function core._33:BaronAshbury()
    if core.type == "SPELL_HEAL" and core.spellId == 93706 then
        core:getAchievementFailed()
    end
end

function core._33:CommanderSpringvale()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 93844 and core.destID == "4278" then
        core:getAchievementFailed()
    end
end

function core._33:LordGodfrey()
    if core.type == "SPELL_DAMAGE" and core.spellId == 93564 and core.overkill > 0 then
        bloodthirstyGhoulCounter = bloodthirstyGhoulCounter + 1
    end

    if bloodthirstyGhoulCounter == 12 then
        core:getAchievementSuccess()
    end
end

function core._33:ClearVariables()
end