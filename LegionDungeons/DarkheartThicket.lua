--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Darkheart Thicket Bosses
------------------------------------------------------
core._1466 = {}

------------------------------------------------------
---- Shade of Xavius
------------------------------------------------------
local shadeOfXaviusKilled = false

function core._1466:Dresaron()
    if core.type == "UNIT_DIED" and core.destID == "111008" then
        core:getAchievementSuccess()
    end
end

function core._1466:ShadeOfXavius()
    --Check if boss has died
    if core.type == "UNIT_DIED" and core.destID == "99192" then
        shadeOfXaviusKilled = true
    end

    --Boss has 10 stacks of Apocalyptic Empowerment
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount == 10 and core.spellId == 221315 then
        core.achievementsFailed[1] = false
        core:getAchievementSuccess()
    end

    --Apocalyptic Empowerment fell off boss after requirements have been met
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 221315 and core.achievementsCompleted[1] == true and shadeOfXaviusKilled == false then
        core.achievementsCompleted[1] = false
        C_Timer.After(0.5, function() 
            if shadeOfXaviusKilled == false then
                core:getAchievementFailedWithMessageAfter("Apocalyptic Empowerment stacks fallen off boss")
            end        
        end)
    end
end
    

function core._1466:ClearVariables()
end