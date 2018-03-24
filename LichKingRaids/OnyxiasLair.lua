--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Onyxia's Lair Bosses
------------------------------------------------------
core.OnyxiaSLair = {}
-- core.OnyxiaSLair.Events = CreateFrame("Frame")

------------------------------------------------------
---- Onyxia
------------------------------------------------------
-- local whelpsUID = {}
-- local whelpsCounter = 0
-- local timerStarted = false

function core.OnyxiaSLair:Onyxia()
    --Detect whelps that spawn
        --Start timer if not started
        --After 10 seconds check if 50 whelps have spawned

    -- if core.sourceID == "11262"then
    --     if whelpsUID[core.spawn_uid] == nil then
    --         whelpsUID[core.spawn_uid] = core.spawn_uid
    --         whelpsCounter = whelpsCounter + 1
    --         core:sendMessageDelay(core:getAchievement() .. " Whelps Hatched (" .. whelpsCounter .. "/50)", whelpsCounter, 5)

    --         if timerStarted == false then
    --             timerStarted = true
    --             C_Timer.After(10, function() 
    --                 if whelpsCounter >= 50 then
    --                     core:getAchievementSuccess()
    --                 else
    --                     core:getAchievementFailedWithMessageAfter("(" .. whelpsCounter .. "/50) Whelps killed in time")
    --                 end
    --             end)
    --         end
    --     end
    -- end

    -- if core.destID == "11262"then
    --     if whelpsUID[core.spawn_uid_dest] == nil then
    --         whelpsUID[core.spawn_uid_dest] = core.spawn_uid_dest
    --         whelpsCounter = whelpsCounter + 1
    --         core:sendMessageDelay(core:getAchievement() .. " Whelps Hatched (" .. whelpsCounter .. "50)", whelpsCounter, 5)
    --     end
    -- end
end

function core.OnyxiaSLair:ClearVariables()
    ------------------------------------------------------
    ---- Onyxia
    ------------------------------------------------------
    whelpsUID = {}
    whelpsCounter = 0
    timerStarted = false
end

-- function core.OnyxiaSLair:InitialSetup()
--     core.OnyxiaSLair.Events:RegisterEvent("NAME_PLATE_UNIT_ADDED")
-- end

-- core.OnyxiaSLair.Events:SetScript("OnEvent", function(self, event, ...)
--     return self[event] and self[event](self, event, ...)
-- end)

-- function core.OnyxiaSLair.Events:NAME_PLATE_UNIT_ADDED(self, unitID, ...)
    

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