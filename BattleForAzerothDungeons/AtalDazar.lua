--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Atal'Dazar Bosses
------------------------------------------------------
core._1763 = {}

function core._1763:PriestessAlunza()
    if core.destID == "131009" and core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 255558 then
        print("Spirit of Gold " .. core.amount)
    end

    --Spirit of gold has 8 stacks of Tainted Blood
    if core.destID == "131009" and core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 255558 and core.amount == 8 then
        core:sendMessage("Kill the Spirit of Gold NOW!")
    end

    --Achievment Complete
    if core.type == "UNIT_DIED" and core.destID == "131140" then
        core:getAchievementSuccess()
    end
end