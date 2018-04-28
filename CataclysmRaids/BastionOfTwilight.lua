--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Bastion of Twilight Bosses
------------------------------------------------------
core.BastionOfTwilight = {}
core.BastionOfTwilight.Events = CreateFrame("Frame")

------------------------------------------------------
---- Halfus Wyrmbreaker
------------------------------------------------------
local timerStarted = false
local secondAddKilled = false

------------------------------------------------------
---- Valiona And Theralion
------------------------------------------------------
local TwilightFiendsKilled = 0

function core.BastionOfTwilight:HalfusWyrmbreaker()
	if core.type == "UNIT_DIED" and core.destID == "44650" or core.destID == "44797" or core.destID == "44645" or core.destID == "44652" then
		if timerStarted == false then
			core:sendMessage(core:getAchievement() .." Timer Started! 10 Seconds Remaining")
			timerStarted = true
            C_Timer.After(10, function()
				if secondAddKilled == true then
					core:getAchievementSuccess()
				else
					core:getAchievementFailed()					
				end
            end)
		else
			secondAddKilled = true			
		end
	end
end

function core.BastionOfTwilight_ValionaAndTheralion()
	if core.type == "UNIT_DIED" and core.destID == "49864" then
		TwilightFiendsKilled = TwilightFiendsKilled + 1
		core:sendMessage("(" .. TwilightFiendsKilled .. " /6) Twilight Fiends Killed")
	end

	if TwilightFiendsKilled == 6 then
		core:getAchievementSuccess()
	end
end

function core.BastionOfTwilight:InstanceCleanup()
    core.BastionOfTwilight.Events:UnregisterEvent("UNIT_POWER")
end

function core.BastionOfTwilight:InitialSetup()
    core.BastionOfTwilight.Events:RegisterEvent("UNIT_POWER")
end

core.BastionOfTwilight.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.BastionOfTwilight.Events:UNIT_POWER(self, unit, powerType)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss4"].enabled == true then
		if powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 30 then
				core:getAchievementFailedWithMessageAfter("by (" .. UnitName(unit) .. ")")
			end
		end
    end
end

function core.BastionOfTwilight:ClearVariables()
	------------------------------------------------------
	---- Halfus Wyrmbreaker
	------------------------------------------------------
	timerStarted = false
	secondAddKilled = false

	------------------------------------------------------
	---- Valiona And Theralion
	------------------------------------------------------
	TwilightFiendsKilled = 0
end