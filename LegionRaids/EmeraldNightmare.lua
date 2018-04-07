--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Emerald Nightmare Bosses
------------------------------------------------------
core.TheEmeraldNightmare = {}
core.TheEmeraldNightmare.Events = CreateFrame("Frame")

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

function core.TheEmeraldNightmare:Nythendra()
    if bugsSquished >= 15 then
        core:getAchievementSuccess()
    end
end

function core.TheEmeraldNightmare:Ursoc()
    if core.type == "UNIT_DIED" and core.destID == "111263" then
        core:getAchievementFailed()
    end
end

function core.TheEmeraldNightmare:Ilgynoth()
    --Track 20 Nightmare Explosion are alive
    core:trackMob(209471, "Nightmare Explosion", 20, 1, false, nil)

    if core.mobCounter >= 20 and nightmareExplosionTrackKills == false then
        core:sendMessage("20 Nightmare Explosion have spawned. They can now be killed at the eye")
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

-- function core.TheEmeraldNightmare:Ele()
--     if core.type == "SPELL_DAMAGE" and core.spellId == 215503 and core.sourceID == "112078" then
--         pulsingEggCounter = pulsingEggCounter + 1
--         print(pulsingEggCounter .. " Pulsing Egg Counter")
--     end
-- end

function core.TheEmeraldNightmare:DragonsOfNightmare()
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
				if UnitBuff(unit, GetSpellInfo(214588)) and UnitBuff(unit, GetSpellInfo(214601)) and UnitBuff(unit, GetSpellInfo(214604)) and UnitBuff(unit, GetSpellInfo(214610)) and playersUID[spawn_uid_dest] == nil then
					playersBuffCounter = playersBuffCounter + 1
					core:sendMessage(core:getAchievement() .. " Players with all 4 buffs (" .. playersBuffCounter .. "/" .. core.groupSize .. ")")
					playersUID[spawn_uid_dest] = spawn_uid_dest
				end
			end
		end
	else
		--Player is not in a group
		local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
		if UnitBuff("Player", GetSpellInfo(214588)) and UnitBuff("Player", GetSpellInfo(214601)) and UnitBuff("Player", GetSpellInfo(214604)) and UnitBuff("Player", GetSpellInfo(214610)) and playersUID[spawn_uid_dest] == nil then
			playersBuffCounter = playersBuffCounter + 1
			core:sendMessage(core:getAchievement() " Players with all 4 buffs (" .. playersBuffCounter .. "/" .. core.groupSize .. ")")
			playersUID[spawn_uid_dest] = spawn_uid_dest
		end
    end
    
    if playersBuffCounter == core.groupSize then
        core:getAchievementSuccess()
    end
end

function core.TheEmeraldNightmare:Xavius()
    if core.type == "PARTY_KILL" and core.destID == "110732" then
        creatureOfMadnessKilled = creatureOfMadnessKilled + 1
        core:sendMessage(core:getAchievement() .. " Creature of Madness Killed (" .. creatureOfMadnessKilled .. "/3)")
    end
end

function core.TheEmeraldNightmare:ClearVariables()
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

    ------------------------------------------------------
    ---- Xavius
    ------------------------------------------------------
    creatureOfMadnessKilled = 0

    ------------------------------------------------------
    ---- Il'gynoth
    ------------------------------------------------------
    nightmareKilled = 0
    nightmareExplosionTrackKills = false
    timerStarted = false
end

function core.TheEmeraldNightmare:InitialSetup()
	core.TheEmeraldNightmare.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core.TheEmeraldNightmare.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.TheEmeraldNightmare.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, spell, rank, lineID, spellID)
    if core.Instances.Legion.Raids.TheEmeraldNightmare.boss1.enabled then
        if spellID == 208116 and bugsUID[lineID] == nil then
            bugsUID[lineID] = lineID
            bugsSquished = bugsSquished + 1
            core:sendMessageDelay(core:getAchievement() .. " Glow Bugs Sqished (" .. bugsSquished .. "/15)", bugsSquished, 1)
        end
    end
end