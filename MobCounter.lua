--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

core.MobCounter = {}
local events = CreateFrame("Frame")

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
local mobTimestamp = nil
local chatMobsAliveLastMessage = ""
local timestampTimer = nil
local countDownTicker = nil
local blockCountDownReset = false

events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...) 	--Allow event arguments to be called from seperate functions
end)

function events:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate;
    if (self.sinceLastUpdate >= 5) then -- in seconds
        if mobTimestamp == nil and fixedTimerStarted ~= true and (mobsDetected / mobCriteria) * 100 >= 50 then
            local newMessage = format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")"
            if chatMobsAliveLastMessage ~= newMessage then
                if core.achievementsCompleted[1] == false then
                    core:sendMessage(newMessage)
                end
            end
            chatMobsAliveLastMessage = newMessage
        end
        self.sinceLastUpdate = 0
	end
end

function MobCounter:Setup(maxMobs, timeWindow, mobIdentifier)
    if mobCounterSetup == false then
        mobID = mobIdentifier
        mobCounterSetup = true
        mobCriteria = maxMobs
        mobCriteriaTimeWindow = timeWindow + 1
        C_Timer.After(5, function()
            if mobCriteriaTimeWindow == 1 then
                core.IATInfoFrame:SetSubHeading1(L["MobCounter_TimeReamining"] .. ": " .. L["MobCounter_TimerNotApplicable"])
            else
                core.IATInfoFrame:SetSubHeading1(L["MobCounter_TimeReamining"] .. ": " .. L["MobCounter_TimerNotStarted"])
            end
            core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")
        end)

        events:SetScript("OnUpdate",events.onUpdate)
    end
end

function MobCounter:SetupCountdown(time,achievementID,manualReset)
    local timeRemaining = time

    if manualReset == true then
        blockCountDownReset = true
    end

    if mobCounterSetup == false then
        mobCounterSetup = true
        C_Timer.After(5, function()
            core.IATInfoFrame:SetSubHeading1(L["MobCounter_TimeReamining"] .. ": " .. timeRemaining)
        end)

        countDownTicker = C_Timer.NewTicker(1, function()
            timeRemaining = timeRemaining - 1

            core.IATInfoFrame:SetSubHeading1(L["MobCounter_TimeReamining"] .. ": " .. timeRemaining)

            if mobCounterSetup == false then
                countDownTicker:Cancel()
            else
                if timeRemaining == 0 then
                    if achievementID ~= nil then
                        core:sendMessage(GetAchievementLink(achievementID) .. " " .. L["Core_Failed"],true,"failed")
                    else
                        core:getAchievementFailed()
                    end
                end
            end
        end, time)
    end
end

function MobCounter:CancelCountdown()
    if countDownTicker ~= nil then
        blockCountDownReset = false
        countDownTicker:Cancel()
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
    mobTimestamp = nil
    events:SetScript("OnUpdate",nil)
    if timestampTimer ~= nil then
        timestampTimer:Cancel()
        timestampTimer = nil
    end
    if fixedTimer ~= nil then
        fixedTimer:Cancel()
        fixedTimer = nil
    end
    if blockCountDownReset == false then
        if countDownTicker ~= nil then
            countDownTicker:Cancel()
            countDownTicker = nil
        end
    end
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

function MobCounter:DetectSpawnedMobsEchelon()
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "164363" and core.spellId == 319724 then
        if mobsDetectedUID[core.spawn_uid_dest] == nil then
            mobsDetectedUID[core.spawn_uid_dest] = core.spawn_uid_dest
            mobsDetected = mobsDetected + 1
            core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")
        end
    end

    --Adds not stone anymore
    if core.type == "SPELL_AURA_REMOVED" and core.destID == "164363" and core.spellId == 319724 then
        if mobsDetectedUID[core.spawn_uid_dest] ~= nil then
            mobsDetectedUID[core.spawn_uid_dest] = nil
            mobsDetected = mobsDetected - 1
        end
    end
end

function MobCounter:DetectKilledMobEchelon()
    --Detect when a mob has been killed in the combatlog
    if core.type == "SPELL_INSTAKILL" and core.destID == "164363" and core.spellId == 319965 then
        --Start Timers
        if mobsDetected >= mobCriteria then
            core:sendDebugMessage(mobsDetected .. " : " .. mobCriteria)
            core:sendDebugMessage("Starting Fixed Timer")
            MobCounter:StartFixedTimerNoOutput()
        end

        --Increment/Decrement Counters
        if (mobTimestamp ~= nil or fixedTimerStarted == true) and (mobCriteriaTimeWindow > 0 or (mobCriteriaTimeWindow == 0 and core.timestamp == mobTimestamp)) then
            --Timers have started
            core:sendDebugMessage("Timer or Timestamp matched. Incrementing killed counter and decrementing alive counter")
            if core.achievementsCompleted[1] == false then
                if mobsKilledUID[core.spawn_uid_dest] == nil then
                    mobsKilled = mobsKilled + 1
                    mobsKilledUID[core.spawn_uid_dest] = core.spawn_uid_dest
                end
                if mobsDetectedUID[core.spawn_uid_dest] ~= nil then
                    mobsDetected = mobsDetected - 1
                    mobsDetectedUID[core.spawn_uid_dest] = nil
                end
            end
        end
    end

    --Update InfoFrame
    core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")
end

function MobCounter:DetectKilledMob(customType, customSpellID, achievementID)
    --Detect when a mob has been killed in the combatlog
    if customType ~= nil and customSpellID ~= nil then
        --Custom kill detection
        if core.type == customType and core.spellId == customSpellID and core.destID == mobID and core.overkill > 0 then
            core:sendDebugMessage("Detected custom detection")
            --Start Timers
            if mobsDetected >= mobCriteria then
                if mobCriteriaTimeWindow == 1 then
                    core:sendDebugMessage("Starting Timestamp Timer")
                    MobCounter:StartTimestampTimer()
                else
                    core:sendDebugMessage(mobsDetected .. " : " .. mobCriteria)
                    core:sendDebugMessage("Starting Fixed Timer")
                    MobCounter:StartFixedTimer(achievementID)
                end
            end

            --Increment/Decrement Counters
            if (mobTimestamp ~= nil or fixedTimerStarted == true) and (mobCriteriaTimeWindow > 0 or (mobCriteriaTimeWindow == 0 and core.timestamp == mobTimestamp)) then
                --Timers have started
                core:sendDebugMessage("Timer or Timestamp matched. Incrementing killed counter and decrementing alive counter")
                if core.achievementsCompleted[1] == false then
                    if mobsKilledUID[core.spawn_uid_dest] == nil then
                        mobsKilled = mobsKilled + 1
                        mobsKilledUID[core.spawn_uid_dest] = core.spawn_uid_dest
                    end
                end
            elseif mobCriteriaTimeWindow == 1 and core.timestamp ~= mobTimestamp then
                --Timestamp has changed. Check completion
                core:sendDebugMessage("Timestamp does not match. Checking if achievement is complete")
                if timestampTimer ~= nil then
                    timestampTimer:Cancel()
                    timestampTimer = nil
                end
                if core.achievementsCompleted[1] == false then
                    core:sendDebugMessage("Achievement not complete. Resetting counter...")
                    mobsKilled = 0
                    mobsKilledUID = {}
                    mobTimestamp = nil

                    if mobsKilledUID[core.spawn_uid_dest] == nil then
                        mobsKilled = mobsKilled + 1
                        mobsKilledUID[core.spawn_uid_dest] = core.spawn_uid_dest
                    end
                end
            end
        end

        --Update InfoFrame
        core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")
    end

    if core.type == "UNIT_DIED" and core.destID == mobID then
        --Default kill detection
        core:sendDebugMessage("Detected killed mob by UNIT_DIED event")

        --Start Timers
        if customType == nil and core.achievementsCompleted[1] == false then
            if mobsDetected >= mobCriteria then
                if mobCriteriaTimeWindow == 1 then
                    core:sendDebugMessage("Starting Timestamp Timer")
                    MobCounter:StartTimestampTimer()
                else
                    core:sendDebugMessage("Starting Fixed Timer")
                    MobCounter:StartFixedTimer(achievementID)
                end
            end
        end

        --Increment/Decrement Counters
        if (mobTimestamp ~= nil or fixedTimerStarted == true) and (mobCriteriaTimeWindow > 0 or (mobCriteriaTimeWindow == 0 and core.timestamp == mobTimestamp)) then
            --Timers have started
            core:sendDebugMessage("Timer or Timestamp matched. Incrementing killed counter and decrementing alive counter")
            if mobsDetectedUID[core.spawn_uid_dest] ~= nil then
                mobsDetected = mobsDetected - 1
            else
                mobsDetectedUID[core.spawn_uid_dest] = core.spawn_uid_dest
            end

            if customType == nil then
                if mobsKilledUID[core.spawn_uid_dest] == nil then
                    mobsKilled = mobsKilled + 1
                    mobsKilledUID[core.spawn_uid_dest] = core.spawn_uid_dest
                end
            end
        elseif mobCriteriaTimeWindow == 1 and core.timestamp ~= mobTimestamp then
            --Timestamp has changed. Check completion
            core:sendDebugMessage("Timestamp does not match. Checking if achievement is complete")
            if timestampTimer ~= nil then
                timestampTimer:Cancel()
                timestampTimer = nil
            end
            if customType == nil then
                if core.achievementsCompleted[1] == false then
                    core:sendDebugMessage("Achievement not complete. Resetting counter...")
                    mobsKilled = 0
                    mobsKilledUID = {}
                    mobTimestamp = nil

                    if mobsKilledUID[core.spawn_uid_dest] == nil then
                        mobsKilled = mobsKilled + 1
                        mobsKilledUID[core.spawn_uid_dest] = core.spawn_uid_dest
                    end
                end
            end

            if mobsDetectedUID[core.spawn_uid_dest] ~= nil then
                core:sendDebugMessage("Deleted mob from table")
                mobsDetected = mobsDetected - 1
            else
                mobsDetectedUID[core.spawn_uid_dest] = core.spawn_uid_dest
            end
        else
            --Timers have not started
            core:sendDebugMessage("Detected mob but cannot count yet as required number of mobs have not spawned yet")
            if mobsDetectedUID[core.spawn_uid_dest] ~= nil then
                core:sendDebugMessage("Deleted mob from table")
                mobsDetected = mobsDetected - 1
            else
                mobsDetectedUID[core.spawn_uid_dest] = core.spawn_uid_dest
            end
        end

        --Update InfoFrame
        core.IATInfoFrame:SetText1(format(L["MobCounter_MobsAlive"], getNPCName(tonumber(mobID))) .. " (" .. mobsDetected .. "/" .. mobCriteria .. ")\n" .. format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")","GameFontHighlightLarge")
    end
end

function MobCounter:StartTimestampTimer()
    --Count of mobs which have same timestamp as the first mob that died
    if mobTimestamp == nil then
        mobsKilled = 0
        mobsKilledUID = {}
        mobTimestamp = core.timestamp
        core:sendDebugMessage("Setting Timestamp to: " .. mobTimestamp)
        C_Timer.After(1, function()
            core:sendMessage(format(L["MobCounter_MobsKilled"], getNPCName(tonumber(mobID))) .. " (" .. mobsKilled .. "/" .. mobCriteria .. ")")
            mobTimestamp = nil
        end)
    end
end

function MobCounter:StartFixedTimerNoOutput()
    --Start ticker for killing mobs within a certain time period
    if fixedTimerStarted == false and core.achievementsCompleted[1] == false then
        local mobCriteriaTimeWindow = mobCriteriaTimeWindow - 1
        --core:sendDebugMessage("Fixed timer started")
        core:sendMessage(format(L["MobCounter_TimerStarted"], mobCriteriaTimeWindow))
        fixedTimerStarted = true
        mobsKilled = 0
        mobsKilledUID = {}
        core.achievementsFailed[1] = false
        local InititalTime = GetTime()
        local AchievementSuccess = false
        local iterations = (mobCriteriaTimeWindow) * 100
        fixedTimer = C_Timer.NewTicker(0.01, function()
            fixedTimer._remainingIterations = fixedTimer._remainingIterations - 1
            currentTick = fixedTimer._remainingIterations
            if AchievementSuccess == false then
                if mobCriteriaTimeWindow - (GetTime() - InititalTime) >= 0 then
                    --print((GetTime() - InititalTime))
                    core.IATInfoFrame:SetSubHeading1("Time Remaining: " .. core:roundNumber(mobCriteriaTimeWindow - (GetTime() - InititalTime)))
                else
                    core.IATInfoFrame:SetSubHeading1("Time Remaining: " .. 0)
                end
            end
            --core:sendDebugMessage("TRACKING AT TICK: " .. currentTick .. ". Time Elapsed " .. GetTime() - InititalTime)
            if mobsKilled >= mobCriteria and (GetTime() - InititalTime) < mobCriteriaTimeWindow then
                AchievementSuccess = true
            elseif (((GetTime() - InititalTime) >= mobCriteriaTimeWindow) or currentTick == 1) and AchievementSuccess == false then
                --print("STOP",GetTime() - InititalTime,mobCriteriaTimeWindow,currentTick)
                --core:sendDebugMessage("STOP TRACKING AT TICK: " .. currentTick .. ". Time Elapsed " .. GetTime() - InititalTime)
            end

            --Unlock timer at final tick
            if ((GetTime() - InititalTime) >= mobCriteriaTimeWindow) or currentTick == 1 then
                fixedTimerStarted = false
                fixedTimer:Cancel()
            end
        end, iterations)
        fixedTimer._remainingIterations = iterations
    end
end

function MobCounter:StartFixedTimer(achievementID)
    --Start ticker for killing mobs within a certain time period
    if fixedTimerStarted == false and core.achievementsCompleted[1] == false then
        local mobCriteriaTimeWindow = mobCriteriaTimeWindow - 1
        --core:sendDebugMessage("Fixed timer started")
        core:sendMessage(format(L["MobCounter_TimerStarted"], mobCriteriaTimeWindow))
        fixedTimerStarted = true
        mobsKilled = 0
        mobsKilledUID = {}
        core.achievementsFailed[1] = false
        local InititalTime = GetTime()
        local AchievementSuccess = false
        fixedTimer = C_Timer.NewTicker(0.01, function()
            if fixedTimer ~= nil then
                currentTick = fixedTimer._remainingIterations
                if AchievementSuccess == false then
                    if mobCriteriaTimeWindow - (GetTime() - InititalTime) >= 0 then
                        --print((GetTime() - InititalTime))
                        core.IATInfoFrame:SetSubHeading1("Time Remaining: " .. core:roundNumber(mobCriteriaTimeWindow - (GetTime() - InititalTime)))
                    else
                        core.IATInfoFrame:SetSubHeading1("Time Remaining: " .. 0)
                    end
                end
                --core:sendDebugMessage("TRACKING AT TICK: " .. currentTick .. ". Time Elapsed " .. GetTime() - InititalTime)
                if mobsKilled >= mobCriteria and (GetTime() - InititalTime) < mobCriteriaTimeWindow then
                    core:getAchievementSuccess(achievementID)
                    AchievementSuccess = true
                elseif (((GetTime() - InititalTime) >= mobCriteriaTimeWindow) or currentTick == 1) and AchievementSuccess == false then
                    --print("STOP",GetTime() - InititalTime,mobCriteriaTimeWindow,currentTick)
                    --core:sendDebugMessage("STOP TRACKING AT TICK: " .. currentTick .. ". Time Elapsed " .. GetTime() - InititalTime)
                    core:getAchievementFailedWithMessageAfter("(" .. mobsKilled .. "/" .. mobCriteria .. ")", achievementID)
                end

                --Unlock timer at final tick
                if ((GetTime() - InititalTime) >= mobCriteriaTimeWindow) or currentTick == 1 then
                    fixedTimerStarted = false
                    fixedTimer:Cancel()
                end
            end
        end, (mobCriteriaTimeWindow) * 100)
    end
end

function MobCounter:AdjustCriteria()
    --Achievement is complete. Check killed counter matches criteria
    if mobsKilled < mobCriteria then
        core:sendDebugMessage("Adjusting mobs killed counter to match criteria")
        mobsKilled = mobCriteria
    end
end