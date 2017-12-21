--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Blackwing Descent Bosses
------------------------------------------------------
core.BlackwingDescent = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_POWER")
f:RegisterEvent("CHAT_MSG_MONSTER_YELL")

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
	core:displayAchievementsToTrackCurrent(5306)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 78941 and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(5306) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.BlackwingDescent:OminitronDefenseSystem()
	core:displayAchievementsToTrackCurrent(5307)

	--Arcane Annihilator
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 79710 and arcaneAnnihilatorFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5307) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		arcaneAnnihilatorFailed = true
	end

	--Static Shock
	if (core.type == "SPELL_ABSORBED" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 79912 and staticShockFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5307) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		staticShockFailed = true
	end

	--Poison Bomb
	if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 80092 and poisonBombFailed == false then
		SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5307) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
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
				SendChatMessage("[WIP] " .. core.spellName .. " part of " .. GetAchievementLink(5307) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				flameThrowerFailed = true
			end
		end	
	end
end

function core.BlackwingDescent:Maloriak()
	core:displayAchievementsToTrackCurrent(5310)

    if core.destID == "41440" and core.type == "UNIT_DIED" then
        aberrationsList[core.spawn_uid_dest] = nil
        aberrationsCounter = aberrationsCounter - 1
        if timerStarted == false then
            SendChatMessage("[WIP] Aberrations: " .. aberrationsCounter,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        end
        aberrationsCounterKilled = aberrationsCounterKilled + 1

        if core.achievementCompleted == true and timerStarted == false then
            --Check that the adds were killed in time
            SendChatMessage("[WIP] Timer Started! 10 Seconds Remaining" ,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
            timerStarted = true
            C_Timer.After(10, function()
                if aberrationsCounterKilled >= 12 then
                    SendChatMessage("[WIP] COMPLETED! Aberrations were killed in time (" .. aberrationsCounterKilled .. "/12)" ,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
                else
                    SendChatMessage("[WIP] FAILED! Aberrations were not killed in time (" .. aberrationsCounterKilled .. "/12)" ,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
                    aberrationsCounterKilled = 0
                    core.achievementCompleted = false
                    timerStarted = false
                end
            end)
        end
    end

    if core.sourceID == "41440" and core.achievementCompleted == false then
        if aberrationsList[core.spawn_uid] == nil then
            aberrationsList[core.spawn_uid] = spawn_uid
            aberrationsCounter = aberrationsCounter + 1
            SendChatMessage("[WIP] Aberrations: " .. aberrationsCounter,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)            
        end
    end

    if aberrationsCounter == 12 and core.achievementCompleted == false then
        SendChatMessage("[WIP] "  .. GetAchievementLink(5310) .. " requirements have been met. Adds can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        core.achievementCompleted = true
    end	
end

function core.BlackwingDescent:Chimaeron()
	core:displayAchievementsToTrackCurrent(5309)

	if core.type == "UNIT_DIED" and core.unitType == "Player" then
		playersDead = playersDead + 1
	end

	if playersDead == 3 and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(5309) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true	
	end
end

function core.BlackwingDescent:Atramedes()
	core:displayAchievementsToTrackCurrent(5308)

	f:SetScript("OnEvent", function(self, event, unit, powerType)
		if event == "UNIT_POWER" and powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 50 and core.achievementFailed == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(5308) .. " FAILED! by (" .. UnitName(unit) .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true
			end
		end
	end)
end

function core.BlackwingDescent:Nefarian()
	core:displayAchievementsToTrackCurrent(4849)

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
		SendChatMessage("[WIP] Step 1: Damage Nefarian to below 65% but higher than 50%. Do not damge Onyxia",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		step1Announced = true
	end

	if nefarianPercentage ~= nil and core.achievementFailed == false then
		--Step 1: Damage Nefarian to atleast 60% but not lower than 50%
		if nefarianPercentage > 50 and nefarianPercentage < 65 and onyxiaPercentage > 0 and step1Complete == false then
			SendChatMessage("[WIP] Step 1: Complete",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			step1Complete = true
			SendChatMessage("[WIP] Step 2: Kill Onyxia",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		elseif nefarianPercentage > 65 and onyxiaPercentage == 0 and step1Complete == false then
			--If onyxia is killed before nefarian reaches step1 threshold then fail achievement
			SendChatMessage("[WIP] "  .. GetAchievementLink(4849) .. " FAILED! Do not kill onyxia yet",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementFailed = true		
		end 
		
		--Step 2: Kill Onyxia
		if step1Complete == true and onyxiaPercentage == 0 and nefarianPercentage > 50 and step2Complete == false then
			SendChatMessage("[WIP] Step 2: Complete",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			step2Complete = true
			SendChatMessage("[WIP] Step 3: Damage Nefarian to below 50% once on platform but do not kill him",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		elseif nefarianPercentage < 50 and step2Complete == false then
			SendChatMessage("[WIP] "  .. GetAchievementLink(4849) .. " FAILED! do not damage Nefrian below 50%",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			core.achievementFailed = true			
		end

		--Step 3: Damage Nefarian to below 50% once on platforms
		if step2Complete == true and nefarianPercentage < 50 and step3Complete == false then
			SendChatMessage("[WIP] Step 3: Complete",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			step3Complete = true
			SendChatMessage("[WIP] Step 4: When Nefarian has landed kill him",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)			
		end

		--Step 4: When landed kill Nefarian
		f:SetScript("OnEvent", function(self, event, message, sender)
			if event == "CHAT_MSG_MONSTER_YELL" and step3Complete == true and step4Complete == false then
				if string.find(message, "I have tried to be an accommodating host, but you simply will not die! Time to throw all pretense aside and just... KILL YOU ALL!") then
					C_Timer.After(3, function()
						SendChatMessage("[WIP] Step 4: Complete",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
						SendChatMessage("[WIP] "  .. GetAchievementLink(4849) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)							
					end)
					step4Complete = true
				end
			end
		end)
		
	end
end

function BlackwingDescent_ClearVariables()
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
end