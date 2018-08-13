--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Tol Dagor Bosses
------------------------------------------------------
core._1771 = {}

function core._1771:KnightCaptainValyri()
    if core.spellId == 256710 then
        core:getAchievementFailed()
    end
end

function core._1771:ClearVariables()
end