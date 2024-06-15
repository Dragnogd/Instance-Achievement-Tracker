--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Zul'Aman Bosses
------------------------------------------------------
core._568 = {}

function core._568:Halazzi()
    if core.type == "PARTY_KILL" and (core.destID == "52755" or core.destID == "24224") then
        core:getAchievementFailed()
    end
end

function core._568:ClearVariables()
end