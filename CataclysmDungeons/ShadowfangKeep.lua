--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Shadowfang Keep Bosses
------------------------------------------------------
core.ShadowfangKeep = {}

------------------------------------------------------
---- Lord Godfrey
------------------------------------------------------
local bloodthirstyGhoulCounter = 0

function core.ShadowfangKeep:BaronAshbury()
    if core.type == "SPELL_HEAL" and core.spellId == 93706 then
        core:getAchievementFailed()
    end
end

function core.ShadowfangKeep:CommanderSpringvale()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 93844 and core.destID == "4278" then
        core:getAchievementFailed()
    end
end

function core.ShadowfangKeep:LordGodfrey()
    if core.type == "SPELL_DAMAGE" and core.spellId == 93564 and core.overkill > 0 then
        bloodthirstyGhoulCounter = bloodthirstyGhoulCounter + 1
    end

    if bloodthirstyGhoulCounter == 12 then
        core:getAchievementSuccess()
    end
end

function core.ShadowfangKeep:ClearVariables()

end