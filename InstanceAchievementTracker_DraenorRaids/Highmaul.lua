--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _1228 Bosses
------------------------------------------------------
core._1228 = {}
core._1228.Events = CreateFrame("Frame")

------------------------------------------------------
---- The Butcher
------------------------------------------------------
local maggotCounter = 0

------------------------------------------------------
---- Tectus
------------------------------------------------------
local moteOfTectusCounter = 0
local moteOfTectusUID = {}
local timerStarted = false

------------------------------------------------------
---- Ko'ragh
------------------------------------------------------
local orbCounter = 15

function core._1228:KargathBladefist()
    if core.type == "SPELL_AURA_REMOVED" and core.destID == "78757" and core.spellId == 159202 then
        core:getAchievementFailed()
    end
end

function core._1228:TheButcher()
    if core.type == "UNIT_DIED" and core.destID == "80728" and maggotCounter < 6 then
        maggotCounter = maggotCounter + 1
        core:sendMessage(core:getAchievement() .. " Maggot Counter (" .. maggotCounter .. "/6)")
    end

    if maggotCounter >= 6 then
        core:getAchievementSuccess()
    end
end

function core._1228:Brackenspore()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 165223 and core.amount == 15 then
        core:getAchievementSuccess()
    end
end

function core._1228:Koragh()
    if core.type == "SPELL_DAMAGE" and (core.spellId == 161576 or core.spellId == 161612) and orbCounter > 0 then
        orbCounter = orbCounter - 1
        core:sendMessage(core:getAchievement() .. " Overflowing Energy Orb Counter Missed. " .. orbCounter .. " more before fail")
    elseif core.type == "SPELL_ABSORBED" and core.spellId == 161576 and core.addSpellId ~= 163134 and orbCounter > 0 then
        orbCounter = orbCounter - 1
        core:sendMessage(core:getAchievement() .. " Overflowing Energy Orb Counter Missed. " .. orbCounter .. " more before fail")
    end

    if orbCounter == 0 then
        core:getAchievementFailed()
    end
end

function core._1228:ImperatorMargok()
    --Blizzard Tracker has gone white so achievement is complete
    if core:getBlizzardTrackingStatus(8977) == true then
        core:getAchievementSuccess()
    end
end

function core._1228:ClearVariables()
    ------------------------------------------------------
    ---- The Butcher
    ------------------------------------------------------
    maggotCounter = 0

    ------------------------------------------------------
    ---- Tectus
    ------------------------------------------------------
    moteOfTectusCounter = 0
    moteOfTectusUID = {}
    timerStarted = false

    ------------------------------------------------------
    ---- Ko'ragh
    ------------------------------------------------------
    orbCounter = 15
end

function core._1228:InstanceCleanup()
    core._1228.Events:UnregisterEvent("UNIT_HEALTH")
    core._1228.Events:UnregisterEvent("UNIT_POWER_UPDATE")
end

function core._1228:InitialSetup()
	core._1228.Events:RegisterEvent("UNIT_HEALTH")
	core._1228.Events:RegisterEvent("UNIT_POWER_UPDATE")
end

core._1228.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1228.Events:UNIT_HEALTH(self, unitID)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].enabled == true then
		-- local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
		-- if destID == "80557" and core.achievementsFailed[1] == false then
        --     if core:getHealthPercent(unitID) <= 1 and moteOfTectusUID[spawn_uid_dest] == nil then
        --         moteOfTectusCounter = moteOfTectusCounter + 1
        --         moteOfTectusUID[spawn_uid_dest] = spawn_uid_dest
        --         core:sendMessageDelay(core:getAchievement() .. " Mote of Tectus Killed (" .. moteOfTectusCounter .. "/8)", moteOfTectusCounter, 2)
        --         if timerStarted == false then
        --             core:sendMessage(core:getAchievement() .. " Timer Started! 10 seconds remaining")
        --             timerStarted = true
        --             C_Timer.After(10, function() 
        --                 if core.inCombat == true then
        --                     if moteOfTectusCounter == 8 then
        --                         core:getAchievementSuccess()
        --                     else
        --                         core:getAchievementFailedWithMessageAfter("(" .. moteOfTectusCounter .. "/8) Mote Of Tectus Killed in Time")
        --                     end
        --                 end
        --             end)
        --         end	
		-- 	end
		-- end
	end
end

function core._1228.Events:UNIT_POWER_UPDATE(self, unit, powerType)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss5"].enabled == true and core.achievementIDs[1] == 8958 then
		if powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 30 then
				core:getAchievementFailed()
			end
		end
	end
end