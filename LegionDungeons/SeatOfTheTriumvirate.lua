--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Seat of the Triumvirate Bosses
------------------------------------------------------
core.SeatOfTheTriumvirate = {}

function core.SeatOfTheTriumvirate:ZuraalTheAscended()
    if core.type == "UNIT_DIED" and core.destID == "126283" then
        core:getAchievementSuccess()
    end
end

function core.SeatOfTheTriumvirate:ClearVariables()
end