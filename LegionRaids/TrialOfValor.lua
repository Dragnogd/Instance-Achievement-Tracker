--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Trial of Valor Bosses
------------------------------------------------------
core._1648 = {}
core._1648.Events = CreateFrame("Frame")

------------------------------------------------------
---- Odyn
------------------------------------------------------
local odynKilled = false

------------------------------------------------------
---- Guarm
------------------------------------------------------
local fieryPhelgmComplete = false
local saltySpittleComplete = false
local darkDischargeComplete = false
local breathCounter = 0

------------------------------------------------------
---- Helya
------------------------------------------------------
local fetidNames = {}
local fetidcount = 0

function core._1648:Odyn()
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

function core._1648:Helya()
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

function core._1648:InstanceCleanup()
    core._1648.Events:UnregisterEvent("UNIT_AURA")
    odynKilled = false
end

function core._1648:InitialSetup()
    odynKilled = false
    core._1648.Events:RegisterEvent("UNIT_AURA")
end

function core._1648:ClearVariables()
    ------------------------------------------------------
    ---- Helya
    ------------------------------------------------------
    fetidNames = {}
    fetidcount = 0

    ------------------------------------------------------
    ---- Guarm
    ------------------------------------------------------
    fieryPhelgmComplete = false
    saltySpittleComplete = false
    darkDischargeComplete = false
    breathCounter = 0
end

core._1648.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1648.Events:UNIT_AURA(self, unitID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled then
        --Player gained Fiery Phlegm
        local chewToyFound = false
        local fieryPhelgmFound = false
        local saltySpittleFound = false
        local darkDischargeFound = false
        for i=1,40 do
            local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unitID, i)
            if spellId == 231846 then
                chewToyFound = true
            elseif spellId == 227539 then
                fieryPhelgmFound = true
            elseif spellId == 227566 then
                saltySpittleFound = true
            elseif spellId == 227570 then
                darkDischargeFound = true
            end

            if chewToyFound == true and fieryPhelgmFound == true and fieryPhelgmComplete == false then
                fieryPhelgmComplete = true
                breathCounter= breathCounter + 1
                core:sendMessage("Fiery Phelgm (Orange) part of " .. core:getAchievement() .. " Completed (" .. breathCounter .. "/3)")
            elseif chewToyFound == true and saltySpittleFound == true and saltySpittleComplete == false then
                saltySpittleComplete = true
                breathCounter= breathCounter + 1
                core:sendMessage("Salty Spittle (Green) part of " .. core:getAchievement() .. " Completed (" .. breathCounter .. "/3)")
            elseif chewToyFound == true and darkDischargeFound == true and darkDischargeComplete == false then
                darkDischargeComplete = true
                breathCounter= breathCounter + 1
                core:sendMessage("Dark Discharge (Purple) part of " .. core:getAchievement() .. " Completed (" .. breathCounter .. "/3)")
            end
        end

        if breathCounter == 3 then
            core:getAchievementSuccess()
        end  
    end
end