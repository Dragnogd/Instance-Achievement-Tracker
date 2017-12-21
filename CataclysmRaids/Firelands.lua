--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Firelands Bosses
------------------------------------------------------
core.Firelands = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_POWER")
f:RegisterEvent("UNIT_AURA")
f:RegisterEvent("ZONE_CHANGED_INDOORS")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

-- local onlyThePenitentFailed = false
-- --Only The Pentient
-- f:SetScript("OnEvent", function(self, event, ...)
-- 	local timestamp, type, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _ = ...

-- 	if event == "COMBAT_LOG_EVENT_UNFILTERED" and onlyThePenitentFailed == false then
-- 		local spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = select(12, ...)
-- 		if type == "SPELL_DAMAGE" or type == "SPELL_MISSED" and spellId == 99705 then
-- 			SendChatMessage("[WIP] "  .. GetAchievementLink(5799) .. " FAILED! (" .. destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
-- 			onlyThePenitentFailed = true
-- 		end
-- 	end
-- end)

------------------------------------------------------
---- Alysrazor
------------------------------------------------------
local brushfireFailed = false
local lavaSpewFailed = false
local incendiaryCloudFailed = false
local fieryTornadoFailed = false

------------------------------------------------------
---- Beth'tilac
------------------------------------------------------
local cinderwebDroneList = {}

------------------------------------------------------
---- Beth'tilac
------------------------------------------------------
local tormentStacks = {}

function core.Firelands:LordRhyolith()
	core:displayAchievementsToTrackCurrent(5810)

	f:SetScript("OnEvent", function(self, event, unit, powerType)
		if event == "UNIT_POWER" and powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) == 0 and core.achievementFailed == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(5810) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true
			end
		end
	end)
end

function core.Firelands:Alysrazor()
	core:displayAchievementsToTrackCurrent(5813)

	--Brushfire
	if core.type == "SPELL_DAMAGE" and core.spellId == 98885 and brushfireFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5813) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		brushfireFailed = true
	end

	--Lava Spew
	if core.type == "SPELL_DAMAGE" and core.spellId == 99336 and lavaSpewFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5813) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		lavaSpewFailed = true	
	end

	--Increndiary Cloud
	if core.type == "SPELL_DAMAGE" and core.spellId == 99427 and incendiaryCloudFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5813) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		incendiaryCloudFailed = true		
	end

	--Fiery Tornado
	if core.type == "SPELL_DAMAGE" and core.spellId == 99816 and fieryTornadoFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5813) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		fieryTornadoFailed = true	
	end

end

function core.Firelands:Bethtilac()
	core:displayAchievementsToTrackCurrent(5821)
	--Loop through all the unit auras currently active
	--If mob is Cinderweb Drone and has the aura to say they are ontop of the web add to saveToKillArray
	--If a cinderweb drone is killed and is not in this array then fail the achievement

	f:SetScript("OnEvent", function(self, event, unitID)
		if event == "UNIT_AURA" then
			--print(UnitAura(unitID, 1))

			local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellID2, canApplyAura, isBossDebuff, _, nameplateShowAll, timeMod, value1, value2, value3 = UnitDebuff(unitID, "Fiery Web Silk")
			
			
			--Add the mob to an array to say that it is currently ontop of the nest
			if spellID2 ~= nil then
				local unitType, _, _, _, _, destID2, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
				if spawn_uid_dest ~= nil then
					cinderwebDroneList[spawn_uid_dest] = spawn_uid_dest
				end
			end

			-- if UnitAura(unitID, 100048) and core.achievementFailed == false then
			-- 	--SendChatMessage("[WIP] "  .. GetAchievementLink(5308) .. " FAILED! by (" .. UnitName(unit) .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			-- 	--core.achievementFailed = true
			-- 	--print(UnitGUID(unitID))
			-- end
		end
	end)

	
	if core.type == "UNIT_DIED" and core.destID == "52581" and cinderwebDroneList[core.spawn_uid_dest] == nil and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(5821) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end 	
end

function core.Firelands:Baleroc()
	core:displayAchievementsToTrackCurrent(5830)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 99256 and core.achievementFailed == false then
		if tormentStacks[core.destName] == nil then
			tormentStacks[core.destName] = 1
		else
			tormentStacks[core.destName] = tormentStacks[core.destName] + 1
			
			if tormentStacks[core.destName] == 3 then
				SendChatMessage("[WIP] "  .. GetAchievementLink(5830) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true
			end
		end
	end
end

function core.Firelands:Shannox()
	--core:displayAchievementsToTrackCurrent(5829)

	f:SetScript("OnEvent", function(self, event, ...)
		if event == "ZONE_CHANGED_INDOORS" then
			local subzone = GetSubZoneText()
			currentSubZone = subzone
			print("Current Subzone is: " .. subzone)

			if subzone == "Beth'tilac's Lair" then
				SendChatMessage("[WIP] "  .. UnitName("Player") .. " is in " .. subzone .. ". Make sure the boss is also in this subzone",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			elseif subzone == "Path of Corruption" then
				SendChatMessage("[WIP] "  .. UnitName("Player") .. " is in " .. subzone .. ". Make sure the boss is also in this subzone",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			elseif subzone == "Shatterstone" then
				SendChatMessage("[WIP] "  .. UnitName("Player") .. " is in " .. subzone .. ". Make sure the boss is also in this subzone",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			elseif subzone == "Flamebreach" then
				SendChatMessage("[WIP] "  .. UnitName("Player") .. " is in " .. subzone .. ". Make sure the boss is also in this subzone",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			elseif subzone == "The Ridge of Ancient Flame" then
				SendChatMessage("[WIP] "  .. UnitName("Player") .. " is in " .. subzone .. ". Make sure the boss is also in this subzone",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end
		end
	end)
end

function Firelands_ClearVariables()
	------------------------------------------------------
	---- Alysrazor
	------------------------------------------------------
	brushfireFailed = false
	lavaSpewFailed = false
	incendiaryCloudFailed = false
	fieryTornadoFailed = false

	------------------------------------------------------
	---- Beth'tilac
	------------------------------------------------------
	cinderwebDroneList = {}

	------------------------------------------------------
	---- Beth'tilac
	------------------------------------------------------
	tormentStacks = {}
end