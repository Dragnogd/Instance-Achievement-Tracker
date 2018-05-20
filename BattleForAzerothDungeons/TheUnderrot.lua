--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Underrot Bosses
------------------------------------------------------
core.TheUnderrot = {}

function core.TheUnderrot:SporecallerZancha()
    if core.type == "UNIT_DIED" and core.destID == "138740" then
        core:getAchievementSuccess()
    end
end

function core.TheUnderrot:ElderLeaxa()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 260685 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core.TheUnderrot:UnboundAbomination()
    if core.type == "UNIT_DIED" and core.destID == "137458" then
        core:getAchievementFailed()
    end
end