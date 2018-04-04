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

function core.TheEmeraldNightmare:Nythendra()
    -- if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 208119 then
    --     bugsSquished = bugsSquished + 1
    --     core:sendMessageDelay(core:getAchievement() .. " Glow Bugs Sqished (" .. bugsSquished .. "/15)", bugsSquished, 1)
    --     print(bugsSquished)
    -- end

    if bugsSquished >= 15 then
        core:getAchievementSuccess()
    end
end

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

function core.TheEmeraldNightmare:Ursoc()
    if core.type == "UNIT_DIED" and core.destID == "111263" then
        core:getAchievementFailed()
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
            print(bugsSquished)
        end
    end
end