--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Bastion of Twilight Bosses
------------------------------------------------------
core.BastionOfTwilight = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_POWER")

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
	core:displayAchievementsToTrackCurrent(5300)

	if core.type == "UNIT_DIED" and core.destID == "44650" or core.destID == "44797" or core.destID == "44645" or core.destID == "44652" then
		if timerStarted == false and (core.achievementCompleted == false or core.achievementFailed == false) then
			SendChatMessage("[WIP] Timer Started! 10 Seconds Remaining" ,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
			timerStarted = true
            C_Timer.After(10, function()
				if secondAddKilled == true then
					SendChatMessage("[WIP] "  .. GetAchievementLink(5300) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementCompleted = true
				else
					SendChatMessage("[WIP] "  .. GetAchievementLink(5300) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementFailed = true						
				end
            end)
		else
			secondAddKilled = true			
		end
	end
end

function core.BastionOfTwilight_ValionaAndTheralion()
	core:displayAchievementsToTrackCurrent(4852)

	if core.type == "UNIT_DIED" and core.destID == "49864" then
		TwilightFiendsKilled = TwilightFiendsKilled + 1
		SendChatMessage("[WIP] (" .. TwilightFiendsKilled .. " /6) Twilight Fiends Killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	if TwilightFiendsKilled == 6 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(4852) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true		
	end
end

function core.BastionOfTwilight:Chogall()
	core:displayAchievementsToTrackCurrent(5312)
	
	f:SetScript("OnEvent", function(self, event, unit, powerType)
		if event == "UNIT_POWER" and powerType == "ALTERNATE" then
			if UnitPower(unit, ALTERNATE_POWER_INDEX) > 30 and core.achievementFailed == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(5312) .. " FAILED! by (" .. UnitName(unit) .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true
			end
		end
	end)	
end

function BastionOfTwilight_ClearVariables(type, destID)
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