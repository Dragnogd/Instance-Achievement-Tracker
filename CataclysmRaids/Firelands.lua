--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

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
---- Beth'tilac
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


function core._720:Alysrazor()
	--Brushfire
	if core.type == "SPELL_DAMAGE" and core.spellId == 98885 and brushfireFailed == false then
		core:getAchievementFailedWithMessageBeforeAndAfter(core.spellName .. " part of","by (" .. core.destName .. ")")
		brushfireFailed = true
	end

	--Lava Spew
	if core.type == "SPELL_DAMAGE" and core.spellId == 99336 and lavaSpewFailed == false then
		core:getAchievementFailedWithMessageBeforeAndAfter(core.spellName .. " part of","by (" .. core.destName .. ")")
		lavaSpewFailed = true	
	end

	--Increndiary Cloud
	if core.type == "SPELL_DAMAGE" and core.spellId == 99427 and incendiaryCloudFailed == false then
		core:getAchievementFailedWithMessageBeforeAndAfter(core.spellName .. " part of","by (" .. core.destName .. ")")
		incendiaryCloudFailed = true		
	end

	--Fiery Tornado
	if core.type == "SPELL_DAMAGE" and core.spellId == 99816 and fieryTornadoFailed == false then
		core:getAchievementFailedWithMessageBeforeAndAfter(core.spellName .. " part of","by (" .. core.destName .. ")")
		fieryTornadoFailed = true	
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
				core:getAchievementFailedWithMessageAfter("by (" .. core.destName .. ")")
			end
		end
	end
end

function core._720:Ragnaros()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 101088 and core.destID == "53500" and livingMeteorIds[core.spawn_uid_dest] == nil then
		lavaLoggedCounter = lavaLoggedCounter + 1
		livingMeteorIds[core.spawn_uid_dest] = core.spawn_uid_dest
		core:sendMessage(core:getAchievement() .. " Living Meteors ignited by Lava Wave (" .. lavaLoggedCounter .. "/3")
		--print(lavaLoggedCounter)
	end

	if lavaLoggedCounter == 3 then
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
	---- Beth'tilac
	------------------------------------------------------
	tormentStacks = {}

	------------------------------------------------------
	---- Ragnaros
	------------------------------------------------------
	lavaLoggedCounter = 0
	livingMeteorIds = {}
end

function core._720:InstanceCleanup()
    core._720.Events:UnregisterEvent("UNIT_POWER_UPDATE")
    core._720.Events:UnregisterEvent("UNIT_AURA")
end

function core._720:InitialSetup()
	core._720.Events:RegisterEvent("UNIT_POWER_UPDATE")
    core._720.Events:RegisterEvent("UNIT_AURA")	
end

core._720.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._720.Events:UNIT_POWER_UPDATE(self, unit, powerType)
	if core.Instances.Cataclysm.Raids[720].boss2.enabled == true then
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

function core._720.TrackAdditional()
	--Only The Pentient
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
		if onlyThePenitentFailed == false then
			if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 99705 then
				core:sendMessage(GetAchievementLink(5799) .. " FAILED! (" .. core.destName .. ")")
				onlyThePenitentFailed = true
			end
		end
	end
end