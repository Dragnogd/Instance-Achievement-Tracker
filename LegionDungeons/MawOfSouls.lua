--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Maw of Souls Bosses
------------------------------------------------------
core._1492 = {}

------------------------------------------------------
---- Ymiron
------------------------------------------------------
local risenWarriorsKilled = 0
local defiantStrikeActive = false

function core._1492:Ymiron()
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "97200" and core.spellId == 195031 then
        defiantStrikeActive = true
    end

    if core.type == "SPELL_AURA_REMOVED" and core.destID == "97200" and core.spellId == 195031 then
        defiantStrikeActive = false
        risenWarriorsKilled = 0
    end

    --Only count UNIT_DIED kills when defiant strike is active
    if defiantStrikeActive == true and core.achievementsCompleted[1] == false then
        if core.type == "UNIT_DIED" and core.destID == "98246" and core.destFlags == 0xa48 then
            risenWarriorsKilled = risenWarriorsKilled + 1
            core:sendMessage(core:getAchievement() .. " Risen Warriors Killed (" .. risenWarriorsKilled .. "/6)")
        end
    
        if risenWarriorsKilled >= 6 then
            core:getAchievementSuccess()
        end      
    end
end

function core._1492:ClearVariables()
    ------------------------------------------------------
    ---- Ymiron
    ------------------------------------------------------
    risenWarriorsKilled = 0
    defiantStrikeActive = false
end