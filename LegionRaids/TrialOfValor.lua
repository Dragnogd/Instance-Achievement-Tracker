--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

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
    --Detect when any player gets runic mastery buff to complete achievement.
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 229684 then
        core:getAchievementSuccess()
    end
    
    --Detetct when player looses buff and fail as personal achievement
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 229684 then
        C_Timer.After(1, function() 
            if core.encounterStarted == true then
                core:getAchievementFailedPersonal()  
            end      
        end)
    end
end

function core._1648:Helya()
    if core.groupSize > 1 then
        InfoFrame_UpdatePlayersOnInfoFrame()
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],fetidcount,core.groupSize - 1)
    else
        InfoFrame_UpdatePlayersOnInfoFrame()
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],fetidcount,0)
    end

    --Gained Debuff
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 193367 then
        if core.groupSize == 1 and InfoFrame_GetPlayerFailed(core.destName) == false then
            core:getAchievementFailed()
            core.achievementsCompleted[1] = false
            InfoFrame_SetPlayerFailed(core.destName)
            fetidcount = fetidcount + 1
        elseif core.groupSize > 1 and InfoFrame_GetPlayerComplete(core.destName) == false then
            InfoFrame_SetPlayerComplete(core.destName)
            fetidcount = fetidcount + 1
        end
    end

    --Lost Debuff
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 193367 then
        if core.groupSize == 1 and InfoFrame_GetPlayerFailed(core.destName) == true then
            core:getAchievementSuccess()
            InfoFrame_SetPlayerIncomplete(core.destName)
            fetidcount = fetidcount - 1
        elseif core.groupSize > 1 and InfoFrame_GetPlayerComplete(core.destName) == true then
            if core.achievementsCompleted[1] == true then
                core:getAchievementFailed()
                core.achievementsCompleted[1] = false
            end
            InfoFrame_SetPlayerIncomplete(core.destName)
            fetidcount = fetidcount - 1
        end
    end
    
    --Check achievement criteria
    if ((core.groupSize - 1) == fetidcount) or (core.groupSize == 1 and fetidcount == 0) then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
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
            local spellName, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
            if spellId == 231846 or spellId == 235900 then
                chewToyFound = true
            elseif spellId == 227539 or spellId == 232777 or spellId == 228758 then
                fieryPhelgmFound = true
            elseif spellId == 227566 or spellId == 232798 or spellId == 228768 then
                saltySpittleFound = true
            elseif spellId == 227570 or spellId == 232800 or spellId == 228769 then
                darkDischargeFound = true
            end

            if chewToyFound == true and fieryPhelgmFound == true and fieryPhelgmComplete == false then
                fieryPhelgmComplete = true
                breathCounter= breathCounter + 1
                core:sendMessage(L["TrialOfValor_Guarm_Part1"] .. " " .. core:getAchievement() .. L["Completed"] .. " (" .. breathCounter .. "/3)")
            elseif chewToyFound == true and saltySpittleFound == true and saltySpittleComplete == false then
                saltySpittleComplete = true
                breathCounter= breathCounter + 1
                core:sendMessage(L["TrialOfValor_Guarm_Part2"] .. " " .. core:getAchievement() .. L["Completed"] .. " (" .. breathCounter .. "/3)")
            elseif chewToyFound == true and darkDischargeFound == true and darkDischargeComplete == false then
                darkDischargeComplete = true
                breathCounter= breathCounter + 1
                core:sendMessage(L["TrialOfValor_Guarm_Part3"] .. " " .. core:getAchievement() .. L["Completed"] .. " (" .. breathCounter .. "/3)")
            end
        end

        if breathCounter == 3 then
            core:getAchievementSuccess()
        end  
    end
end