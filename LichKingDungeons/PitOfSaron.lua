--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Pit of Saron Bosses
------------------------------------------------------
core._658 = {}

------------------------------------------------------
---- Don't Look up
------------------------------------------------------
local achievementFailed = false

function core._658:ForgemasterGarfrost()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 68786 and core.amount >= 11 then
        core:getAchievementFailed()
    end
end

function core._658:TrackAdditional()
    --Don't Look up
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        if core.type == "SPELL_DAMAGE" and core.spellId == 69425 and achievementFailed == false then
            achievementFailed = true
            core:sendMessage(GetAchievementLink(4525) .. " FAILED! (" .. core.destName .. ")")
        end
    end
end

function core._658:ClearVariables() 
end


