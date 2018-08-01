--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Halls of Valor Bosses
------------------------------------------------------
core._1477 = {}

function core._1477:StagParty()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.destID == "99891" and core.spellId == 207753 then
        core:sendMessage(core:getAchievement() .. " Killing Blows Stacks (" .. core.amount .. "/10)")
    
        if core.amount == 10 then
            core:getAchievementSuccess()
        end
    end
end

function core._1477:Odyn()
    if core.type == "SPELL_CAST_SUCCESS" and core.spelld == 198750 then
        core:getAchievementFailed()
    end
end

function core._1477:ClearVariables()
end