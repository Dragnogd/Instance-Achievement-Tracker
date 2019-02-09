--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

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
        core:getAchievementSuccess()
    end
end

function core._1520:Ursoc()
    if core.type == "UNIT_DIED" and core.destID == "111263" then
        core:getAchievementFailed()
    end
end

function core._1520:Ilgynoth()
    --Track 20 Nightmare Explosion are alive
    core:trackMob("105721", L["TheEmeraldNightmare_NightmareIchors"], 20, L["TheEmeraldNightmare_IllgynothComplete"], 1, nil, nil)

    if core.mobCounter >= 20 and nightmareExplosionTrackKills == false then
        nightmareExplosionTrackKills = true
    end

    --Only track kills once we have reached the correct number of mobs alive
    if core.type == "SPELL_DAMAGE" and core.destID == "105906" and core.spellId == 210048 and nightmareExplosionTrackKills == true then
        nightmareKilled = nightmareKilled + 1
        if timerStarted == false then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. " " .. L["Shared_Timer10"])
            C_Timer.After(10, function() 
                if nightmareKilled >= 20 then
                    core:getAchievementSuccess()
                else
                    core:sendMessage(core:getAchievement() .. " " .. L["TheEmeraldNightmare_NightmareIchorsKilled"] .. nightmareKilled)
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
    if core:getBlizzardTrackingStatus(10771) == true then
        core:getAchievementSuccess()
    end
end

function core._1520:Xavius()
    if (core.type == "RANGE_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" or core.type == "SWING_DAMAGE") and core.destID == "110732" and core.overkill ~= nil then
        if core.overkill > 0 then
            if creatureOfMadnessUID[core.spawn_uid_dest] == nil then
                creatureOfMadnessUID[core.spawn_uid_dest] = core.spawn_uid_dest
                creatureOfMadnessKilled = creatureOfMadnessKilled + 1
                core:sendMessage(core:getAchievement() .. " " .. L["TheEmeraldNightmare_Xavius_CreaturesKilled"] .. " (" .. creatureOfMadnessKilled .. "/3)")
            end
        end
    end

    if creatureOfMadnessKilled == 3 then
        core:getAchievementSuccess()
    end
end

function core._1520:DragonsOfNightmare()
    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],playersBuffCounter,core.groupSize)
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
    core._1520.Events:UnregisterEvent("UNIT_AURA")
    dragonsKilled = false
end

function core._1520:InitialSetup()
	core._1520.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	core._1520.Events:RegisterEvent("UNIT_AURA")
end

core._1520.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1520.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled then
        if spellID == 208116 and bugsUID[lineID] == nil then
            bugsUID[lineID] = lineID
            bugsSquished = bugsSquished + 1
            core:sendMessageDelay(core:getAchievement() .. " " .. L["TheEmeraldNightmare_Nythendra_BugsSquished"] .. " (" .. bugsSquished .. "/15)", bugsSquished, 1)
        end
    end
end

function core._1520.Events:UNIT_AURA(self, unitID, ...)
    if initialWait == true then
        if core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].enabled == true then
            if UnitIsPlayer(unitID) ~= nil then
                local name, realm = UnitName(unitID)
                local fullName = name
                local unitTypePlayer, destIDPlayer, spawn_uid_dest = strsplit("-", UnitGUID(unitID))

                if playersUID[spawn_uid_dest] == nil then
                    local buff1Found = false
                    local buff2Found = false
                    local buff3Found = false
                    local buff4Found = false
                    for i=1,40 do
                        local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unitID, i)
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
                        core:sendMessage(core:getAchievement() .. " " .. UnitName(unitID) .. " has all 4 buffs (" .. playersBuffCounter .. "/" .. core.groupSize .. ")")
                        playersUID[spawn_uid_dest] = spawn_uid_dest
                        InfoFrame_SetPlayerComplete(UnitName(unitID))
                    end
                end
            end
        end
    
        if playersBuffCounter == core.groupSize then
            core:getAchievementSuccess()
        end
    elseif core.encounterStarted == true then
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(5, function() 
                initialWait = true
            end)
        end
    end
end