--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Bastion of Twilight Bosses
------------------------------------------------------
core.BastionOfTwilight = {}

local f = CreateFrame ("Frame")

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
			core:sendMessage("Timer Started! 10 Seconds Remaining")
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

function core.BastionOfTwilight:Chogall()
	if f:IsEventRegistered("UNIT_POWER") == nil then
		f:RegisterEvent("UNIT_POWER")
	end
	f:SetScript("OnEvent", function(self, event, unit, powerType)
		if event == "UNIT_POWER" and powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 30 then
				core:getAchievementFailedWithMessageAfter("by (" .. UnitName(unit) .. ")")
			end
		end
	end)	
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

	if f:IsEventRegistered("UNIT_POWER") == true then
		f:UnregisterEvent("UNIT_POWER")
	end
end