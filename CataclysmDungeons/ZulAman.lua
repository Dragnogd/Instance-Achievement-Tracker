--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Zul'Aman Bosses
------------------------------------------------------
core.ZulAman = {}

function core.ZulAman:Halazzi()
    if core.type == "PARTY_KILL" and (core.destID == "52755" or core.destID == "24224") then
        core:getAchievementFailed()
    end
end

function core.ZulAman:ClearVariables()
end