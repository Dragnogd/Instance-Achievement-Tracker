--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Blackwing Descent Bosses
------------------------------------------------------
core.BlackwingDescent = {}

local f = CreateFrame ("Frame")

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

function core.BlackwingDescent:Magmaw()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 78941 then
		core:getAchievementFailedWithMessageAfter("by (" .. core.destName .. ")")
	end
end

function core.BlackwingDescent:OminitronDefenseSystem()
	--Arcane Annihilator
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 79710 and arcaneAnnihilatorFailed == false then
		core:sendMessage(core.spellName .. " part of " .. GetAchievementLink(core.currentAchievementID) .. " FAILED! by (" .. core.destName .. ")")
		arcaneAnnihilatorFailed = true
	end

	--Static Shock
	if (core.type == "SPELL_ABSORBED" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 79912 and staticShockFailed == false then
		core:sendMessage(core.spellName .. " part of " .. GetAchievementLink(core.currentAchievementID) .. " FAILED! by (" .. core.destName .. ")")
		staticShockFailed = true
	end

	--Poison Bomb
	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 80092 and poisonBombFailed == false then
		core:sendMessage(core.spellName .. " part of " .. GetAchievementLink(core.currentAchievementID) .. " FAILED! by (" .. core.destName .. ")")
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
				core:sendMessage(core.spellName .. " part of " .. GetAchievementLink(core.currentAchievementID) .. " FAILED! by (" .. core.destName .. ")")
				flameThrowerFailed = true
			end
		end	
	end
end

function core.BlackwingDescent:Maloriak()
    if core.destID == "41440" and core.type == "UNIT_DIED" then
        aberrationsList[core.spawn_uid_dest] = nil
        aberrationsCounter = aberrationsCounter - 1
        if timerStarted == false then
            SendChatMessage("[WIP] Aberrations: " .. aberrationsCounter,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        end
        aberrationsCounterKilled = aberrationsCounterKilled + 1

        if startTimer == true and timerStarted == false then
			--Check that the adds were killed in time
			core:sendMessage("Timer Started! 10 Seconds Remaining")
            timerStarted = true
            C_Timer.After(10, function()
				if aberrationsCounterKilled >= 12 then
					core:getAchievementSuccess()
				else
					core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED! Aberrations were not killed in time (" .. aberrationsCounterKilled .. "/12)")
                    aberrationsCounterKilled = 0
                    timerStarted = false
                end
            end)
        end
    end

    if core.sourceID == "41440" and core.achievementCompleted == false then
        if aberrationsList[core.spawn_uid] == nil then
            aberrationsList[core.spawn_uid] = spawn_uid
			aberrationsCounter = aberrationsCounter + 1            
        end
    end

	if aberrationsCounter == 12 and startTimer == false then
		core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " requirements have been met. Adds can now be killed!")
		startTimer = true
    end	
end

function core.BlackwingDescent:Chimaeron()
	if core.type == "UNIT_DIED" and core.unitType == "Player" then
		playersDead = playersDead + 1
	end

	if playersDead == 3 then
		core:getAchievementFailed()
	end
end

function core.BlackwingDescent:Atramedes()
	if f:IsEventRegistered("UNIT_POWER") == nil then
		f:RegisterEvent("UNIT_POWER")
	end
	f:SetScript("OnEvent", function(self, event, unit, powerType)
		if event == "UNIT_POWER" and powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 50 then
				core:getAchievementFailedWithMessageAfter("by (" .. UnitName(unit) .. ")")
			end
		end
	end)
end

function core.BlackwingDescent:Nefarian()
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

	if nefarianPercentage ~= nil and core.achievementFailed == false then
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

		--Step 4: When landed kill Nefarian
		f:SetScript("OnEvent", function(self, event, message, sender)
			if event == "CHAT_MSG_MONSTER_YELL" and step3Complete == true and step4Complete == false then
				if string.find(message, "I have tried to be an accommodating host, but you simply will not die! Time to throw all pretense aside and just... KILL YOU ALL!") then
					C_Timer.After(3, function()
						core:sendMessage("Step 4: Complete")
						core:getAchievementSuccess()							
					end)
					step4Complete = true
				end
			end
		end)
		
	end
end

function core.BlackwingDescent:ClearVariables()
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

	if f:IsEventRegistered("UNIT_POWER") == true then
		f:UnregisterEvent("UNIT_POWER")
	end
	
	if f:IsEventRegistered("CHAT_MSG_MONSTER_YELL") == true then
		f:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
	end
end