--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Gundrak Bosses
------------------------------------------------------
core.Gundrak = {}

function core.Gundrak:Sladran()
    --Boss does not fire Encounter Start
    core:getAchievementToTrack()

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 55126 then
        core:getAchievementFailed()
    end
end

function core.Gundrak:Moorabi()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 55098 then
        core:getAchievementFailed()
    end
end

function core.Gundrak:ClearVariables()

end