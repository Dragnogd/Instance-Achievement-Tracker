--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Blackwing Descent Bosses
------------------------------------------------------
core._669 = {}
core._669.Events = CreateFrame("Frame")

------------------------------------------------------
---- Ominitron Defense System
------------------------------------------------------
local staticShockFailed = false
local poisonBombFailed = false
local arcaneAnnihilatorFailed = false
local flameThrowerFailed = false
local flameThrowerPlayer = nil
local flameThrowerActive = false

------------------------------------------------------
---- Maloriak
------------------------------------------------------
local aberrationsList = {}
local aberrationsCounter = 0
local aberrationsCounterKilled = 0
local timerStarted = false
local startTimer = false
local timerTime = 10
local ticker = nil

------------------------------------------------------
---- Chimaeron
------------------------------------------------------
local playersDead = 0

------------------------------------------------------
---- Nefarion
------------------------------------------------------
local step1Announced = false
local step1Complete = false
local step2Complete = false
local step3Complete = false
local step4Complete = false

function core._669:Magmaw()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 78941 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
	end
end

function core._669:OminitronDefenseSystem()
	--Arcane Annihilator
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 79710 and arcaneAnnihilatorFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. L["Core_Reason"] .. ": " .. core.spellName)
		arcaneAnnihilatorFailed = true
	end

	--Static Shock
	if (core.type == "SPELL_ABSORBED" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 79912 and staticShockFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. L["Core_Reason"] .. ": " .. core.spellName)
		staticShockFailed = true
	end

	--Poison Bomb
	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 80092 and poisonBombFailed == false then
		core:getAchievementFailedWithMessageAfter("(" .. L["Core_Reason"] .. ": " .. core.spellName)
		poisonBombFailed = true
	end

	--Flamethrower
	if core.type == "SPELL_DAMAGE" and core.spellId == 79504 and flameThrowerFailed == false then
		if flameThrowerActive == false then
			flameThrowerPlayer = core.destName
			flameThrowerActive = true
			C_Timer.After(6, function()
				--Cast takes about 5 seconds to complete
				flameThrowerPlayer = nil
				flameThrowerActive = false							
			end)
		else
			if core.destName ~= flameThrowerPlayer then
				--More than one person has got hit by the flamethrower
				core:getAchievementFailedWithMessageAfter("(" .. L["Core_Reason"] .. ": " .. core.spellName)
				flameThrowerFailed = true
			end
		end	
	end
end

function core._669:Maloriak()
	core.MobCounter:Setup(12, 10, "41440")
	core.MobCounter:DetectSpawnedMob()
	core.MobCounter:DetectKilledMob()
end

function core._669:Chimaeron()
	if core.type == "UNIT_DIED" and core.unitType == "Player" then
		playersDead = playersDead + 1
	end

	if playersDead == 3 then
		core:getAchievementFailed()
	end
end

function core._669:Nefarian()
	if f:IsEventRegistered("CHAT_MSG_MONSTER_YELL") == nil then
		f:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	end
	--Get percentage of onyxia and nefarian health
	local onyxiaPercentage = nil
	local nefarianPercentage = nil

	--Find Nefarian
	for i = 1, 4 do
		if UnitName("boss" .. i) == "Nefarian" then
			nefarianPercentage = (UnitHealth("boss" .. i) / UnitHealthMax("boss" .. i)) * 100
		end 
	end

	--Find Onyxia
	if UnitHealth("boss1") ~= nil then
		onyxiaPercentage = (UnitHealth("boss1") / UnitHealthMax("boss" .. i)) * 100
	end

	if step1Announced == false then
		core:sendMessage("Step 1: Damage Nefarian to below 65% but higher than 50%. Do not damge Onyxia")
		step1Announced = true
	end

	if nefarianPercentage ~= nil and core.achievementsFailed[1] == false then
		--Step 1: Damage Nefarian to atleast 60% but not lower than 50%
		if nefarianPercentage > 50 and nefarianPercentage < 65 and onyxiaPercentage > 0 and step1Complete == false then
			core:sendMessage("Step 1: Complete")
			step1Complete = true
			core:sendMessage("Step 2: Kill Onyxia")
		elseif nefarianPercentage > 65 and onyxiaPercentage == 0 and step1Complete == false then
			--If onyxia is killed before nefarian reaches step1 threshold then fail achievement
			core:getAchievementFailedWithMessageAfter("Do not kill onyxia yet")	
		end 
		
		--Step 2: Kill Onyxia
		if step1Complete == true and onyxiaPercentage == 0 and nefarianPercentage > 50 and step2Complete == false then
			core:sendMessage("Step 2: Complete")
			step2Complete = true
			core:sendMessage("Step 3: Damage Nefarian to below 50% once on platform but do not kill him")
		elseif nefarianPercentage < 50 and step2Complete == false then
			core:getAchievementFailedWithMessageAfter("do not damage Nefrian below 50%")			
		end

		--Step 3: Damage Nefarian to below 50% once on platforms
		if step2Complete == true and nefarianPercentage < 50 and step3Complete == false then
			core:sendMessage("Step 3: Complete")
			step3Complete = true
			core:sendMessage("Step 4: When Nefarian has landed kill him")			
		end
	end
end

function core._669:ClearVariables()
	------------------------------------------------------
	---- Ominitron Defense System
	------------------------------------------------------
	staticShockFailed = false
	poisonBombFailed = false
	arcaneAnnihilatorFailed = false
	flameThrowerFailed = false

	------------------------------------------------------
	---- Maloriak
	------------------------------------------------------
	aberrationsList = {}
	aberrationsCounter = 0
	aberrationsCounterKilled = 0
	timerStarted = false
	timerTime = 10
	ticker = nil

	------------------------------------------------------
	---- Chimaeron
	------------------------------------------------------
	playersDead = 0

	------------------------------------------------------
	---- Nefarion
	------------------------------------------------------
	step1Announced = false
	step1Complete = false
	step2Complete = false
	step3Complete = false
	step4Complete = false
end

function core._669:InstanceCleanup()
	core._669.Events:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
	core._669.Events:UnregisterEvent("UNIT_POWER_UPDATE")
end

function core._669:InitialSetup()
    core._669.Events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
    core._669.Events:RegisterEvent("UNIT_POWER_UPDATE")
end

core._669.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._669.Events:CHAT_MSG_MONSTER_YELL(self, message, sender)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
		if step3Complete == true and step4Complete == false then
			if string.find(message, "I have tried to be an accommodating host, but you simply will not die! Time to throw all pretense aside and just... KILL YOU ALL!") then
				C_Timer.After(3, function()
					core:sendMessage("Step 4: Complete")
					core:getAchievementSuccess()							
				end)
				step4Complete = true
			end
		end
    end
end

function core._669.Events:UNIT_POWER_UPDATE(self, unit, powerType)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss4"].enabled == true then
		if powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 50 then
				core:getAchievementFailedWithMessageAfter("(" .. UnitName(unit) .. ")")
			end
		end
    end
end