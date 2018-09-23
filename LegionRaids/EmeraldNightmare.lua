--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Emerald Nightmare Bosses
------------------------------------------------------
core._1520 = {}
core._1520.Events = CreateFrame("Frame")

------------------------------------------------------
---- Nythendra
------------------------------------------------------
local bugsSquished = 0
local bugsUID = {}

------------------------------------------------------
---- Dragons of Nightmare
------------------------------------------------------
local playersUID = {}
local playersBuffCounter = 0
local initialWait = false

------------------------------------------------------
---- Il'gynoth
------------------------------------------------------
local nightmareKilled = 0
local nightmareExplosionTrackKills = false
local timerStarted = false

------------------------------------------------------
---- Xavius
------------------------------------------------------
local creatureOfMadnessKilled = 0
local creatureOfMadnessUID = {}

function core._1520:Nythendra()
    if bugsSquished >= 15 then
        core:getAchievementSuccessWithMessageAfter("(You may wish to get a few extra bugs in case multiple players clicked on the same bug)")
    end
end

function core._1520:Ursoc()
    if core.type == "UNIT_DIED" and core.destID == "111263" then
        core:getAchievementFailed()
    end
end

function core._1520:Ilgynoth()
    --Track 20 Nightmare Explosion are alive
    core:trackMob("105721", "Nightmare Ichors", 20, "20 Nightmare Ichors have spawned. They can now be killed at the eye", 4, nil, nil)

    if core.mobCounter >= 20 and nightmareExplosionTrackKills == false then
        nightmareExplosionTrackKills = true
    end

    --Only track kills once we have reached the correct number of mobs alive
    if core.type == "SPELL_DAMAGE" and core.destID == "105906" and core.spellId == 210048 and nightmareExplosionTrackKills == true then
        nightmareKilled = nightmareKilled + 1
        if timerStarted == false then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. " Timer Started!. 10 seconds remaining")
            C_Timer.After(10, function() 
                if nightmareKilled >= 20 then
                    core:getAchievementSuccess()
                else
                    core:sendMessage(core:getAchievement() .. " Nightmare Ichors Killed: " .. nightmareKilled)
                end
                nightmareKilled = 0
                nightmareExplosionTrackKills = false
                timerStarted = false
            end)
        else
            if nightmareKilled >= 20 then
                core:getAchievementSuccess()
            end            
        end
    end
end

function core._1520:EleretheRenferal()
    if core:getBlizzardTrackingStatus(10817) == true then
        core:getAchievementSuccess(10771)
    end
end

function core._1520:DragonsOfNightmare()
    if initialWait == true then
        --Loop through every player in the group. Once each player has got all 4 buffs. Increment count by 1. Once counter equals group size then complete achievement
        if core.groupSize > 1 then
            for i = 1, core.groupSize do
                local unit = nil
                if core.chatType == "PARTY" then
                    if i < core.groupSize then
                        unit = "party" .. i
                    else
                        unit = "player"
                end
                elseif core.chatType == "RAID" then
                    unit = "raid" .. i
                end
                
                if unit ~= nil then
                    local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
                    local buff1Found = false
                    local buff2Found = false
                    local buff3Found = false
                    local buff4Found = false
                    for i=1,40 do
                        local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unit, i)
                        if spellId == 214588 then
                            buff1Found = true
                        elseif spellId == 214601 then
                            buff2Found = true
                        elseif spellId == 214604  then
                            buff3Found = true
                        elseif spellId == 214610 then
                            buff4Found = true
                        end
                    end
                    if buff1Found == true and buff2Found == true and buff3Found == true and buff4Found == true and playersUID[spawn_uid_dest] == nil then
                        playersBuffCounter = playersBuffCounter + 1
                        core:sendMessage(core:getAchievement() .. " " .. UnitName(unit) .. " has all 4 buffs (" .. playersBuffCounter .. "/" .. core.groupSize .. ")")
                        playersUID[spawn_uid_dest] = spawn_uid_dest
                    end
                end
            end
        else
            --Player is not in a group
            local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
            local buff1Found = false
            local buff2Found = false
            local buff3Found = false
            local buff4Found = false
            for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitBuff("Player", i)
                if spellId == 214588 then
                    buff1Found = true
                elseif spellId == 214601 then
                    buff2Found = true
                elseif spellId == 214604  then
                    buff3Found = true
                elseif spellId == 214610 then
                    buff4Found = true
                end
            end
            if buff1Found == true and buff2Found == true and buff3Found == true and buff4Found == true and playersUID[spawn_uid_dest] == nil then
                playersBuffCounter = playersBuffCounter + 1
                core:sendMessage(core:getAchievement() " Players with all 4 buffs (" .. playersBuffCounter .. "/" .. core.groupSize .. ")")
                playersUID[spawn_uid_dest] = spawn_uid_dest
            end
        end
        
        if playersBuffCounter == core.groupSize then
            core:getAchievementSuccess()
        end
    else
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(5, function() 
                initialWait = true
            end)
        end
    end
end

function core._1520:Xavius()
    if (core.type == "RANGE_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" or core.type == "SWING_DAMAGE") and core.destID == "110732" and core.overkill ~= nil then
        if core.overkill > 0 then
            if creatureOfMadnessUID[core.spawn_uid_dest] == nil then
                creatureOfMadnessUID[core.spawn_uid_dest] = core.spawn_uid_dest
                creatureOfMadnessKilled = creatureOfMadnessKilled + 1
                core:sendMessage(core:getAchievement() .. " Creature of Madness Killed (" .. creatureOfMadnessKilled .. "/3)")
            end
        end
    end

    if creatureOfMadnessKilled == 3 then
        core:getAchievementSuccess()
    end
end

function core._1520:ClearVariables()
    ------------------------------------------------------
    ---- Nythendra
    ------------------------------------------------------
    bugsSquished = 0
    bugsUID = {}

    ------------------------------------------------------
    ---- Dragons of Nightmare
    ------------------------------------------------------
    playersUID = {}
    playersBuffCounter = 0
    initialWait = false

    ------------------------------------------------------
    ---- Xavius
    ------------------------------------------------------
    creatureOfMadnessKilled = 0
    creatureOfMadnessUID = {}

    ------------------------------------------------------
    ---- Il'gynoth
    ------------------------------------------------------
    nightmareKilled = 0
    nightmareExplosionTrackKills = false
    timerStarted = false
end

function core._1520:InstanceCleanup()
    core._1520.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    dragonsKilled = false
end

function core._1520:InitialSetup()
	core._1520.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._1520.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1520.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled then
        if spellID == 208116 and bugsUID[lineID] == nil then
            bugsUID[lineID] = lineID
            bugsSquished = bugsSquished + 1
            core:sendMessageDelay(core:getAchievement() .. " Glow Bugs Sqished (" .. bugsSquished .. "/15)", bugsSquished, 1)
        end
    end
end