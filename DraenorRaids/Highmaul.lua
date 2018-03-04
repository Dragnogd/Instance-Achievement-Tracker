--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Highmaul Bosses
------------------------------------------------------
core.Highmaul = {}
core.Highmaul.Events = CreateFrame("Frame")

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

function core.Highmaul:KargathBladefist()
    if core.type == "SPELL_AURA_REMOVED" and core.destID == "78757" and core.spellId == 159202 then
        core:getAchievementFailed()
    end
end

function core.Highmaul:TheButcher()
    if core.type == "UNIT_DIED" and core.destID == "80728" and maggotCounter < 6 then
        maggotCounter = maggotCounter + 1
        core:sendMessage(core:getAchievement() .. " Maggot Counter (" .. maggotCounter .. "/6)")
    end

    if maggotCounter >= 6 then
        core:getAchievementSuccess()
    end
end

function core.Highmaul:Brackenspore()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 165223 and core.amount == 15 then
        core:getAchievementSuccess()
    end
end

function core.Highmaul:Koragh()
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

function core.Highmaul:ClearVariables()
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

function core.Highmaul:InitialSetup()
	core.Highmaul.Events:RegisterEvent("UNIT_HEALTH")
	core.Highmaul.Events:RegisterEvent("UNIT_POWER")
end

core.Highmaul.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.Highmaul.Events:UNIT_HEALTH(self, unitID)
	if core.Instances.WarlordsOfDraenor.Raids.Highmaul.boss3.enabled == true then
		local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
		if destID == "80557" and core.achievementsFailed[1] == false then
            if core:getHealthPercent(unitID) <= 1 and moteOfTectusUID[spawn_uid_dest] == nil then
                moteOfTectusCounter = moteOfTectusCounter + 1
                moteOfTectusUID[spawn_uid_dest] = spawn_uid_dest
                core:sendMessageDelay(core:getAchievement() .. " Mote of Tectus Killed (" .. moteOfTectusCounter .. "/8)", moteOfTectusCounter, 2)
                if timerStarted == false then
                    core:sendMessage(core:getAchievement() .. " Timer Started! 10 seconds remaining")
                    timerStarted = true
                    C_Timer.After(10, function() 
                        if core.inCombat == true then
                            if moteOfTectusCounter == 8 then
                                core:getAchievementSuccess()
                            else
                                core:getAchievementFailedWithMessageAfter("(" .. moteOfTectusCounter .. "/8) Mote Of Tectus Killed in Time")
                            end
                        end
                    end)
                end	
			end
		end
	end
end

function core.Highmaul.Events:UNIT_POWER(self, unit, powerType)
	if core.Instances.WarlordsOfDraenor.Raids.Highmaul.boss5.enabled == true and core.achievementIDs[1] == 8958 then
		if powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 30 then
				core:getAchievementFailed()
			end
		end
	end
end