--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Tol Dagor Bosses
------------------------------------------------------
core.TolDagor = {}

function core.TolDagor:KnightCaptainValyri()
    if core.spellId == 256710 then
        core:getAchievementFailed()
    end
end