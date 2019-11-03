--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

core.MobCounter = {}

local MobCounter = core.MobCounter

local mobID = nil
local mobCriteria = 0
local mobCriteriaTimeWindow = 0
local mobsDetected = 0
local mobsDetectedUID = {}
local mobsKilled = 0
local mobsKilledUID = {}
local fixedTimerStarted = false
local mobCounterSetup = false
local currentTick = 0
local fixedTimer = nil

function MobCounter:Setup(maxMobs, timeWindow, mobIdentifier)
    if mobCounterSetup == false then
        mobID = mobIdentifier
        mobCounterSetup = true
        mobCriteria = maxMobs
        mobCriteriaTimeWindow = timeWindow + 1
        C_Timer.After(5, function() 
            core.IATInfoFrame:SetSubHeading1(L["MobCounter_TimeReamining"] .. ": " .. L["MobCounter_TimerNotStarted"])
            core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")        
        end)
    end
end

function MobCounter:Reset()
    mobID = nil
    mobCriteria = 0
    mobsDetected = 0
    mobsDetectedUID = {}
    mobsKilled = 0
    mobsKilledUID = {}
    fixedTimerStarted = false
    mobCounterSetup = false
    mobCriteriaTimeWindow = 0
    ticks = 0
    currentTick = 0
    fixedTimer = nil
end

function MobCounter:DetectSpawnedMob()
    --Detect if any mobs with specified ID have appeared in the combatlog
    if core.sourceID == mobID and mobsDetectedUID[core.spawn_uid] == nil then
        mobsDetected = mobsDetected + 1
        mobsDetectedUID[core.spawn_uid] = core.spawn_uid
    end
    if core.destID == mobID and mobsDetectedUID[core.spawn_uid_dest] == nil then
        mobsDetected = mobsDetected + 1
        mobsDetectedUID[core.spawn_uid_dest] = core.spawn_uid_dest
    end
    core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")      
end

function MobCounter:DetectKilledMob()
    --Detect when a mob has been killed in the combatlog
    if core.type == "UNIT_DIED" and core.destID == mobID then
        if mobsDetected >= mobCriteria then
            MobCounter:StartFixedTimer()
        end
        if mobsDetectedUID[core.spawn_uid_dest] ~= nil then
           mobsDetected = mobsDetected - 1
           mobsDetectedUID[core.spawn_uid_dest] = nil 
        end
        if mobsKilledUID[core.spawn_uid_dest] == nil then
            mobsKilled = mobsKilled + 1
            mobsKilledUID[core.spawn_uid_dest] = core.spawn_uid_dest
        end
        core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")         
    end
end

function MobCounter:StartFixedTimer()
    --Start ticker for killing mobs within a certain time period
    if fixedTimerStarted == false and core.achievementsCompleted[1] == false then
        core:sendMessage(format(L["MobCounter_TimerStarted"], mobCriteriaTimeWindow - 1))
        fixedTimerStarted = true
        mobsKilled = 0
        mobsKilledUID = {}
        fixedTimer = C_Timer.NewTicker(1, function() 
            currentTick = fixedTimer._remainingIterations
            core.IATInfoFrame:SetSubHeading1("Time Remaining: " .. currentTick - 1)
            if mobsKilled >= mobCriteria then
                core:getAchievementSuccess()
            elseif currentTick == 1 then
                core:getAchievementFailed()                
            end
        end, mobCriteriaTimeWindow)
    end
end