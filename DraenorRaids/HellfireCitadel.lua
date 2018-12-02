--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Hellfire Citadel Bosses
------------------------------------------------------
core._1448 = {}
core._1448.Events = CreateFrame("Frame")

------------------------------------------------------
---- Iron Reaver
------------------------------------------------------
local hellfireGuardianKilled = 0

------------------------------------------------------
---- Hellfire High Council
------------------------------------------------------
local timerStarted = false
local unitsKilled = 0

------------------------------------------------------
---- Shadow-Lord Iskar
------------------------------------------------------
local eyeOfAnzuPlayer = nil
local firstPickup = false

------------------------------------------------------
---- Socrethar the Eternal
------------------------------------------------------
local hauntingSoulsKilled = 0
local hauntingSoulsTrackKills = false

------------------------------------------------------
---- Mannoroth
------------------------------------------------------
local felSummonersKilled = 0

------------------------------------------------------
---- Archimonde
------------------------------------------------------
local doomfireSpawned = false

function core._1448:IronReaver()
	if core.type == "SPELL_INSTAKILL" and core.destID == "94985" and hellfireGuardianKilled < 10 then
		hellfireGuardianKilled = hellfireGuardianKilled + 1
		core:sendMessage(core:getAchievement() .. " Hellfire Guardians Killed (" .. hellfireGuardianKilled .. "/10)")
	end

	if hellfireGuardianKilled == 10 then
		core:getAchievementSuccess()		
	end
end

function core._1448:HellfireHighCouncil()
	if core.type == "UNIT_DIED" and (core.destID == "92142" or core.destID == "92146" or core.destID == "92144") then
		unitsKilled = unitsKilled + 1
		if timerStarted == false then
			core:sendMessage(core:getAchievement() .. " Timer Started! 10 seconds remaining to kill bosses")
			timerStarted = true
			C_Timer.After(10, function()
				if unitsKilled ~= 3 and core.inCombat == true then
					core:getAchievementFailedWithMessageAfter("(" .. unitsKilled .. "/3) Killed in time")						
				end
			end)
		end
	end
end

function core._1448:Kormrok()
	--If player gets hit by one of the abilities and has not already been hit then fail the achievement for the player
	if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 185521 or core.spellId == 185519 or core.spellId == 180270) then
		core:getAchievementFailedPersonal()
	end
end

function core._1448:Gorefiend()
	if core.type == "UNIT_DIED" and core.destID == "93145" then
		core:getAchievementSuccess()			
	end
end

function core._1448:ShadowLordIskar()
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 179202 and core.achievementsFailed[1] == false then
		eyeOfAnzuPlayer = nil
	end

	--If player has had the Eye of Anzu for more than 5 seconds then fail the achievement
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 179202 and core.achievementsFailed[1] == false then
		eyeOfAnzuPlayer = core.destName
		firstPickup = true
		C_Timer.After(5, function()
			if eyeOfAnzuPlayer == core.destName then
				core:getAchievementFailedWithMessageAfter("by " .. core.destName)			
			end
		end)				
	end

	if firstPickup == false then
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

				for i=1,40 do
					local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unit, i)
					if spellId == 179202 then
						eyeOfAnzuPlayer = core.destName
						firstPickup = true
						C_Timer.After(5, function()
							if eyeOfAnzuPlayer == core.destName then
								core:getAchievementFailedWithMessageAfter("by " .. core.destName)			
							end
						end)
					end
				end
			end
		else
			for i=1,40 do
				local _, _, _, _, _, _, _, _, _, spellId = UnitBuff("Player", i)
				if spellId == 179202 then
					eyeOfAnzuPlayer = core.destName
					firstPickup = true
					C_Timer.After(5, function()
						if eyeOfAnzuPlayer == core.destName then
							core:getAchievementFailedWithMessageAfter("by " .. core.destName)		
						end
					end)	
				end
			end		
		end
	end
end

function core._1448:FelLordZakuun()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 179428 then	
		C_Timer.After(6, function()
			if core.inCombat == true then
				core:getAchievementFailedWithMessageAfter("by " .. core.destName)
			end
		end)		
	end
end

function core._1448:Xhulhorac()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 185656 then
		core:getAchievementFailedWithMessageAfter("by " .. core.destName)
	end
end

function core._1448:SocretharTheEternal()
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 182925 and core.mobUID[core.spawn_uid] ~= "Dead" then
		--Decrease haunting soul counter by 1 if player walks into one of the mobs
		if core.mobUID[core.spawn_uid] ~= nil then
			core.mobCounter = core.mobCounter - 1
			core:sendDebugMessage(core.mobCounter)
		end
		core.mobUID[core.spawn_uid] = "Dead"
	elseif core.type == "SPELL_DAMAGE" and core.spellId == 188500 and core.mobUID[core.spawn_uid] ~= "Dead" then
		--Decrease haunting soul counter by 1 if robot absorbs one of the mobs
		if core.mobUID[core.spawn_uid] ~= nil then
			core.mobCounter = core.mobCounter - 1
			core:sendDebugMessage(core.mobCounter)
		end
		core.mobUID[core.spawn_uid] = "Dead"
	end

	core:trackMob("91938", "Haunting Soul", 20, " 20 Haunting Souls have spawned. They can now be AOE'd down", 3, nil, nil)

	if core.mobCounter >= 20 and hauntingSoulsTrackKills == false then
        hauntingSoulsTrackKills = true
	end
	
	if core.type == "UNIT_DIED" and core.destID == "91938" and hauntingSoulsTrackKills == true then
        hauntingSoulsKilled = hauntingSoulsKilled + 1
        if timerStarted == false then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. " Timer Started!. 10 seconds remaining")
            C_Timer.After(10, function() 
                if hauntingSoulsKilled >= 20 then
                    core:getAchievementSuccess()
                else
                    core:sendMessage(core:getAchievement() .. " Haunting Souls Killed (" .. hauntingSoulsKilled .. "/20)")
                end
                hauntingSoulsKilled = 0
                hauntingSoulsTrackKills = false
                timerStarted = false
            end)
        else
            if hauntingSoulsKilled >= 20 then
                core:getAchievementSuccess()
            end            
        end
    end
end

function core._1448:TyrantVelhari()
	if core.type == "UNIT_DIED" and core.destID == "90270" then
		core:getAchievementFailed()	
	end
end

function core._1448:Mannoroth()
	-- core:trackMob("91241", "Doom Lord", 1, " Doom Lord has spawned. DPS it down to ~5% health", 1, nil, nil)

	--Achievement Successfull
	if core.type == "SPELL_DAMAGE" and (core.spellId == 182076 or core.spellId == 182077 or core.spellId == 182040) and core.destID == "91241" and core.overkill > 0 then
		core:getAchievementSuccess()			
	end

	-- --Achievement Failed
	-- if core.type == "UNIT_DIED" and core.destID == "91241" and core.achievementsCompleted[1] == false and felSummonersKilled == 3 then
	-- 	core:getAchievementFailed()
	-- elseif core.type == "UNIT_DIED" and core.destID == "91241" and core.achievementsCompleted[1] == false then
	-- 	core:sendMessage("Doom Lord Killed. If Red summoner is still alive wait for another Doom Lord to spawn before killing it")
	-- elseif core.type == "UNIT_DIED" and core.destID == "91305" then
	-- 	felSummonersKilled = felSummonersKilled + 1
	-- end
end

function core._1448:Archimonde()
	if core.type == "SPELL_SUMMON" and core.destID == "92208" then
		doomfireSpawned = true
		core:getAchievementSuccess()

		--Cancel the timer if started
		if timer ~= nil then
			core:sendMessage(core:getAchievement() .. " Timer paused. Doomfire has spawned")
			timer:Cancel()
			timerStarted = false
		end
	end

	if core.destID == "92208" and core.overkill > 0 then
		--Cancel the timer if has already started
		if timerStarted == false then
			timerStarted = true
			core:sendMessage(core:getAchievement() .. " Timer Started 120 seconds to kill boss. (Timer will restart if another Doomfire spawns)")
			timer = C_Timer.NewTimer(120, function()
				--If boss health is above 40% then wait for another Doomfire to spawn
				if core:getHealthPercent("boss1") > 40 then
					core:sendMessage(core:getAchievement() .. " FAILED!. Wait for another Doomfire to spawn before taking boss below 40% health")
				else
					core:getAchievementFailed()
				end 
			end)
		end
	end

	--If boss health is below 40% and no Doomfire has spawned then fail the achievement
	for i = 1, 5 do
        if UnitGUID("boss" .. i) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID("boss" .. i))
            if destID == "91331" and core:getHealthPercent("boss" .. i) < 40 and doomfireSpawned == false then
				core:getAchievementFailed()
            end
        end
    end
end

function core._1448:ClearVariables()
	------------------------------------------------------
	---- Iron Reaver
	------------------------------------------------------
	hellfireGuardianKilled = 0

	------------------------------------------------------
	---- Hellfire High Council
	------------------------------------------------------
	timerStarted = false
	unitsKilled = 0	

	------------------------------------------------------
	---- Shadow-Lord Iskar
	------------------------------------------------------
	eyeOfAnzuPlayer = nil
	firstPickup = false

	------------------------------------------------------
	---- Socrethar the Eternal
	------------------------------------------------------
	hauntingSoulsKilled = 0
	hauntingSoulsTrackKills = false

	------------------------------------------------------
	---- Mannoroth
	------------------------------------------------------
	felSummonersKilled = 0

	------------------------------------------------------
	---- Archimonde
	------------------------------------------------------
	doomfireSpawned = false
	if timer ~= nil then
        timer:Cancel()
    end
end

function core._1448:InstanceCleanup()
    core._1448.Events:UnregisterEvent("UNIT_HEALTH")
    core._1448.Events:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
end

function core._1448:InitialSetup()
	core._1448.Events:RegisterEvent("UNIT_HEALTH")
	core._1448.Events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

core._1448.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1448.Events:UNIT_HEALTH(self, unitID)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
		local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
		if destID == "90018" then
			--If health is less than 90% then fail the achievement
			if core:getHealthPercent(unitID) < 90 then
				core:getAchievementFailed()			
			end
		end
	end
end

function core._1448.Events:CHAT_MSG_MONSTER_YELL(self, message, sender)
	if message == "GHHAAAaaa!!!" then
		core:getAchievementFailed()				
	end
end