--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- _1007 Bosses
------------------------------------------------------
core._1007 = {}

------------------------------------------------------
---- Sanguinarian
------------------------------------------------------
local BoilingBloodThirstStacks = 0

function core._1007:Rattlegore()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount > 5 and core.spellId == 113765 then
        core:getAchievementFailed()
    end
end

function core._1007:Sanguinarian()
    -- if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount <= 99 and core.spellId == 114141 then
    --     if core.amount > BoilingBloodThirstStacks then
    --         BoilingBloodThirstStacks = core.amount
    --         core:sendMessage(GetAchievementLink(6396) .. " " .. GetSpellLink(114141) .. " " .. L["Core_Counter"] .. " (" .. BoilingBloodThirstStacks .. "/99)")
    --     end
    -- end

    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount == 99 and core.spellId == 114141 then
        core:getAchievementSuccess()
    end
end

function core._1007:ClearVariables()
end