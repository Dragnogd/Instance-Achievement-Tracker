--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Utgarde Keep Bosses
------------------------------------------------------
core.UtgardeKeep = {}

function core.UtgardeKeep:PrinceKeleseth()
    if core.destID == "23965" and core.overkill ~= nil then
        if core.overkill > 0 then
            core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ")")
        end
    end
end

function core.UtgardeKeep:ClearVariables()
    
end