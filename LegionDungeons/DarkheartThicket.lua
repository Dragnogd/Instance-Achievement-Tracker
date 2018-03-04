--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Darkheart Thicket Bosses
------------------------------------------------------
core.DarkheartThicket = {}

function core.DarkheartThicket:Dresaron()
    if core.type == "UNIT_DIED" and core.destID == "111008" then
        core:getAchievementSuccess()
    end
end

function core.DarkheartThicket:ShadeOfXavius()
    --Boss has 10 stacks of Apocalyptic Empowerment
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.amount == 10 and core.spellId == 221315 then
        core.achievementsFailed[1] = false
        core:getAchievementSuccess()
    end

    --Apocalyptic Empowerment fell off boss after requirements have been met
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 221315 and core.achievementsCompleted[1] == true then
        core.achievementsCompleted[1] = false
        core:getAchievementFailedWithMessageAfter("Apocalyptic Empowerment stacks fallen off boss")
    end
end
    

function core.DarkheartThicket:ClearVariables()

end