--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Theramore's Fall (Alliance)
------------------------------------------------------
core._1000 = {}

function core._1000:Gashnul()
    --Defeat Gash'nul without destroying any of his totems.
    if (core.type == "PARTY_KILL" or core.type == "UNIT_DIED") and core.destID == "64956" then    
        core:getAchievementFailed()
    end 
end

function core._1000:Gatecrusher()
    --Destroy Gatecrusher without anyone being hit by its ram or stone-thrower.
    if (core.type == "SWING_MISSED" or core.type == "SWING_DAMAGE") and UnitIsPlayer(core.destName) then
        core:getAchievementFailed()
    end
end
    