--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Arena of Annihilation
------------------------------------------------------
core._1031 = {}

function core._1031:BeatTheHeat()
    if core.type == "SPELL_DAMAGE" and core.spellId == 123967 then  
        core:getAchievementFailed()
    end
end