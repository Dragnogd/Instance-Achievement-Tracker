--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Hour of Twilight Bosses
------------------------------------------------------
core.HourOfTwilight = {}

------------------------------------------------------
---- Archbishop Benedictus
------------------------------------------------------
local twilightSparksCounter = 0

function core.HourOfTwilight:ArchbishopBenedictus()
    if (core.type == "SPELL_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE") and core.destID == "55466" and core.overkill > 0 then
        twilightSparksCounter = twilightSparksCounter + 1
    elseif core.type == "SWING_DAMAGE" and core.destID == "55466" and core.swingOverkill > 0 then
        twilightSparksCounter = twilightSparksCounter + 1
    end

    if twilightSparksCounter == 10 then
        core:getAchievementSuccess()
    end
end

function core.HourOfTwilight:ClearVariables()
    ------------------------------------------------------
    ---- Archbishop Benedictus
    ------------------------------------------------------
    twilightSparksCounter = 0
end