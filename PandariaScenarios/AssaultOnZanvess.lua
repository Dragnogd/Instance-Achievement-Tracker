--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Assault on Zan'vess
------------------------------------------------------
core._1050 = {}

function core._1050:CommanderTelvrak()
    --Defeat Commander Tel'vrak without killing any Zan'thik Swarmers in the Assault on Zan'vess scenario.
    if core.type == "UNIT_DIED" and core.destID == "67887" then
        core:getAchievementFailed()
    end
end