--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- _720 Bosses
------------------------------------------------------
core._720 = {}
core._720.Events = CreateFrame("Frame")

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
---- Baleroc
------------------------------------------------------
local tormentStacks = {}

------------------------------------------------------
---- Majordomo Staghelm
------------------------------------------------------
local onlyThePenitentFailed = false

------------------------------------------------------
---- Ragnaros
------------------------------------------------------
local lavaLoggedCounter = 0
local livingMeteorIds = {}

------------------------------------------------------
---- Shannox
------------------------------------------------------
local placesVisited = 0
local location1 = false
local location2 = false
local location3 = false
local location4 = false
local location5 = false


function core._720:Alysrazor()
	--Brushfire
	if core.type == "SPELL_DAMAGE" and core.spellId == 98885 and brushfireFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") (" .. L["Core_Reason"] .. ": " .. core.spellName)
		brushfireFailed = true
	end

	--Lava Spew
	if core.type == "SPELL_DAMAGE" and core.spellId == 99336 and lavaSpewFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") (" .. L["Core_Reason"] .. ": " .. core.spellName)
		lavaSpewFailed = true	
	end

	--Increndiary Cloud
	if core.type == "SPELL_DAMAGE" and core.spellId == 99427 and incendiaryCloudFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") (" .. L["Core_Reason"] .. ": " .. core.spellName)
		incendiaryCloudFailed = true		
	end

	--Fiery Tornado
	if core.type == "SPELL_DAMAGE" and core.spellId == 99816 and fieryTornadoFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ") (" .. L["Core_Reason"] .. ": " .. core.spellName)
		fieryTornadoFailed = true	
	end
end

function core._720:Shannox()
	--During a single engagement, bring Shannox to each of the following locations in the Firelands before dispatching him:
	if core:getBlizzardTrackingStatus(5829, 1) and location1 == false then
		location1 = true
		placesVisited = placesVisited + 1
		local location = GetAchievementCriteriaInfo(5829, 1);
		core:sendMessage(core:getAchievement() .. " " .. location .. " " .. L["Shared_Completed"] .. " (" .. placesVisited .. "/5)")
	elseif core:getBlizzardTrackingStatus(5829, 2) and location2 == false then
		location2 = true
		placesVisited = placesVisited + 1
		local location = GetAchievementCriteriaInfo(5829, 2);
		core:sendMessage(core:getAchievement() .. " " .. location .. " " .. L["Shared_Completed"] .. " (" .. placesVisited .. "/5)")
	elseif core:getBlizzardTrackingStatus(5829, 3) and location3 == false then
		location3 = true
		placesVisited = placesVisited + 1
		local location = GetAchievementCriteriaInfo(5829, 3);
		core:sendMessage(core:getAchievement() .. " " .. location .. " " .. L["Shared_Completed"] .. " (" .. placesVisited .. "/5)")
	elseif core:getBlizzardTrackingStatus(5829, 4) and location4 == false then
		location4 = true
		placesVisited = placesVisited + 1
		local location = GetAchievementCriteriaInfo(5829, 4);
		core:sendMessage(core:getAchievement() .. " " .. location .. " " .. L["Shared_Completed"] .. " (" .. placesVisited .. "/5)")
	elseif core:getBlizzardTrackingStatus(5829, 5) and location5 == false then
		location5 = true
		placesVisited = placesVisited + 1
		local location = GetAchievementCriteriaInfo(5829, 5);
		core:sendMessage(core:getAchievement() .. " " .. location .. " " .. L["Shared_Completed"] .. " (" .. placesVisited .. "/5)")
	end

	if placesVisited == 5 then
		core:getAchievementSuccess()
	end
end 

function core._720:Bethtilac()
	--Loop through all the unit auras currently active
	--If mob is Cinderweb Drone and has the aura to say they are ontop of the web add to saveToKillArray
	--If a cinderweb drone is killed and is not in this array then fail the achievement
	if core.type == "UNIT_DIED" and core.destID == "52581" and cinderwebDroneList[core.spawn_uid_dest] == nil then
		core:getAchievementFailed()
	end 	
end

function core._720:Baleroc()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 99256 then
		if tormentStacks[core.destName] == nil then
			tormentStacks[core.destName] = 1
		else
			tormentStacks[core.destName] = tormentStacks[core.destName] + 1
			
			if tormentStacks[core.destName] == 3 then
				core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
			end
		end
	end
end

function core._720:Ragnaros()
	--Defeat Ragnaros while three Living Meteors are ignited by Lava Wave.

	--Blizzard Tracker has gone white so achievement completed
	if core:getBlizzardTrackingStatus(5855) == true then
		core:getAchievementSuccess()
	end
end

function core._720:ClearVariables()
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
	---- Baleroc
	------------------------------------------------------
	tormentStacks = {}

	------------------------------------------------------
	---- Ragnaros
	------------------------------------------------------
	lavaLoggedCounter = 0
	livingMeteorIds = {}

	------------------------------------------------------
	---- Shannox
	------------------------------------------------------
	placesVisited = 0
	location1 = false
	location2 = false
	location3 = false
	location4 = false
	location5 = false
end

function core._720:InstanceCleanup()
    core._720.Events:UnregisterEvent("UNIT_POWER_UPDATE")
	core._720.Events:UnregisterEvent("UNIT_AURA")
	
	onlyThePenitentFailed = false
end

function core._720:InitialSetup()
	core._720.Events:RegisterEvent("UNIT_POWER_UPDATE")
    core._720.Events:RegisterEvent("UNIT_AURA")	
end

core._720.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._720.Events:UNIT_POWER_UPDATE(self, unit, powerType)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
		if powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) == 0 then
				core:getAchievementFailed()
			end
		end
	end
end

function core._720.Events:UNIT_AURA(self, unitID)
	for i=1,40 do
		local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
		if spellId == 100048 then
			--Add the mob to an array to say that it is currently ontop of the nest
			if spellID2 ~= nil then
				local unitType, _, _, _, _, destID2, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
				if spawn_uid_dest ~= nil then
					cinderwebDroneList[spawn_uid_dest] = spawn_uid_dest
				end
			end
		end
	end
end

function core._720:TrackAdditional()
	--Only The Pentient
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
		if onlyThePenitentFailed == false then
			if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 99705 then
				core:sendMessage(GetAchievementLink(5799) .. " " .. L["Core_Failed"] .. " (" .. core.destName .. ")",true)
				onlyThePenitentFailed = true
			end
		end
	end
end