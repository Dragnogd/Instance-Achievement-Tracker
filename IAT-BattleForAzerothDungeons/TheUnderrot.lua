--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Underrot Bosses
------------------------------------------------------
core._1841 = {}

function core._1841:SporecallerZancha()
    if core:getBlizzardTrackingStatus(12549, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._1841:ElderLeaxa()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 260685 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._1841:UnboundAbomination()
    if core.type == "UNIT_DIED" and core.destID == "137458" then
        core:getAchievementFailed()
    end
end