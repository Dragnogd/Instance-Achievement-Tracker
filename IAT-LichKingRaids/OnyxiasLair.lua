--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Onyxia's Lair Bosses
------------------------------------------------------
core._249 = {}
-- core._249.Events = CreateFrame("Frame")

------------------------------------------------------
---- Onyxia
------------------------------------------------------
local timerStarted = false
local timer
-- local whelpsUID = {}
-- local whelpsCounter = 0


function core._249:Onyxia1()
    if core.type == "SPELL_DAMAGE" and core.spellName == "Breath" then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")", 2)
    end
end

function core._249:Onyxia2()
    if timerStarted == false then
        timerStarted = true
        timer = C_Timer.NewTimer(300, function() 
            core:getAchievementFailed(1)
        end)
    end 
end

function core._249:ClearVariables()
    ------------------------------------------------------
    ---- Onyxia
    ------------------------------------------------------
    --whelpsUID = {}
    --whelpsCounter = 0
    timerStarted = false
    
    if timer ~= nil then
        timer:Cancel()
    end
end

-- function core._249:InitialSetup()
--     core._249.Events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
-- end

-- core._249.Events:SetScript("OnEvent", function(self, event, ...)
--     return self[event] and self[event](self, event, ...)
-- end)

-- function core._249.Events:NAME_PLATE_UNIT_ADDED(self, unitID, ...)
    

--     local unitType, _, _, _, _, unitIDCreature, unitUID = strsplit("-", UnitGUID(unitID))

--     --print(unitType)
    
--     if unitType == "Creature" and unitIDCreature == "11262" then
--         --print("HERE")
--         if whelpsUID[unitUID] == nil then
--             whelpsUID[unitUID] = unitUID
--             whelpsCounter = whelpsCounter + 1
--             core:sendMessageDelay(core:getAchievement() .. " Whelps Hatched (" .. whelpsCounter .. "/50)", whelpsCounter, 5)

--             if timerStarted == false then
--                 timerStarted = true
--                 core:sendMessage("Timer Started! 10 seconds remaining")

--                 C_Timer.After(10, function() 
--                     if whelpsCounter >= 50 then
--                         core:getAchievementSuccess()
--                     else
--                         core:getAchievementFailedWithMessageAfter("(" .. whelpsCounter .. "/50) Whelps killed in time")
--                     end
--                 end)
--             end
--         end
--     end
-- end