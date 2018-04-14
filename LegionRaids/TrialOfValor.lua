--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Trial of Valor Bosses
------------------------------------------------------
core.TrialOfValor = {}

------------------------------------------------------
---- Odyn
------------------------------------------------------
local odynKilled = false

------------------------------------------------------
---- Helya
------------------------------------------------------
local fetidNames = {}
local fetidcount = 0

function core.TrialOfValor:Odyn()
    if core.type == "UNIT_DIED" and core.destID == "114263" then
        odynKilled = true
    end

    if odynKilled == false then
        --Detect when any player gets runic mastery buff to complete achievement.
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 229684 then
            core:getAchievementSuccess()
        end
        
        --Detetct when player looses buff and fail as personal achievement
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 229684 then
            core:getAchievementFailedPersonal()
        end
    end
end

function core.TrialOfValor:Helya()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 193367 then
        if fetidNames[core.destName] == nil then
            fetidNames[core.destName] = core.destName
            fetidcount = fetidcount + 1
            --core:sendMessage(core.destName .. " Gained Fetid Rot (" .. fetidcount .. "/" .. core.groupSize .. ")")
        end
    end

    if core.groupSize == (fetidcount - 1) then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 193367 then
        if fetidNames[core.destName] ~= nil then
            fetidNames[core.destName] = nil
            fetidcount = fetidcount - 1
            --core:sendMessage(core.destName .. " Lost Fetid Rot (" .. fetidcount .. "/" .. core.groupSize .. ")")
        
            --Fail achievement if compelted already
            if core.achievementsCompleted[1] == true then
                core:getAchievementFailed()
                core.achievementsCompleted[1] = false
            end
        end
    end  
end

function core.TrialOfValor:InitialSetup()
    odynKilled = false
end

function core.TrialOfValor:ClearVariables()
    ------------------------------------------------------
    ---- Helya
    ------------------------------------------------------
    fetidNames = {}
    fetidcount = 0
end