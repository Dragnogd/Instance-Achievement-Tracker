--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Blackrock Foundary Bosses
------------------------------------------------------
core.BlackrockFoundary = {}

------------------------------------------------------
---- Blackhand
------------------------------------------------------
local ashCounter = 0

------------------------------------------------------
---- Operator Thogar
------------------------------------------------------
local timerStarted = false

------------------------------------------------------
---- The Iron Maidens
------------------------------------------------------
local bossesDead = 0

------------------------------------------------------
---- Blast Furnace
------------------------------------------------------
local primalElementalistsKilled = 0

------------------------------------------------------
---- Kromog
------------------------------------------------------
local graspingEarthKilled = 0

function core.BlackrockFoundary:BeastlordDarmac()
	------------------------------------------------------
	---- Beastlord Darmac
	------------------------------------------------------
	core:displayAchievementsToTrackCurrent(8981)

	if (core.sourceID == "76884" or core.sourceID == "76874" or core.sourceID == "76945") and (core.achievementCompleted == false) then
		SendChatMessage("[WIP] '" .. core.sourceName .. " Mounted First' part of " .. GetAchievementLink(8981) .. " will be completed once boss is killed",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true		
	end
end

function core.BlackrockFoundary:Blackhand()
	------------------------------------------------------
	---- Blackhand
	------------------------------------------------------
	core:displayAchievementsToTrackCurrent(8952)

	if core.type == "SPELL_AURA_APPLIED" and core.spellName == "Ashes" then
		ashCounter = ashCounter + 1
		print("[WIP] " .. core.destName .. " caught Ashes  (" .. ashCounter .. "/20)")
		SendChatMessage("[WIP] " .. core.destName .. " caught Ashes  (" .. ashCounter .. "/20)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)							
	end

	if ashCounter >= 20 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8952) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end
end

function core.BlackrockFoundary:OperatorThogar()
	------------------------------------------------------
	---- Operator Thogar
	------------------------------------------------------
	core:displayAchievementsToTrackCurrent(8982)

	if timerStarted == false then
		SendChatMessage("[WIP] Note: The Toy Train Set Then Wind-Up Train Wrecker need to placed on the first track 8 seconds after the encounter has started.",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)	
		C_Timer.After(8, function()
			SendChatMessage("[WIP] Place Your Toy Train Set Then Wind-Up Train Wrecker NOW",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)									
		end)
		C_Timer.After(25, function()
			if core.achievementCompleted == false then
				SendChatMessage("[WIP] Your Toy Train Set Then Wind-Up Train Wrecker were not placed in time. Achievement can still be earned but WIP will not tell you when to place it",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end									
		end)
		timerStarted = true
	end

	if core.type == "UNIT_DIED" and core.destID == "33404" and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8982) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end
end

function core.BlackrockFoundary:HansgarFranzok()
	------------------------------------------------------
	---- Hans'gar and Franzok
	------------------------------------------------------
	core:displayAchievementsToTrackCurrent(8980)

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 158140 and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8980) .. " FAILED! by (" .. core.destName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.BlackrockFoundary:FlamebenderKagraz()
	------------------------------------------------------
	---- Flamebender Ka'graz
	------------------------------------------------------
	core:displayAchievementsToTrackCurrent(8929)

	if core.type == "UNIT_DIED" and core.destID == "77337" and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8929) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.BlackrockFoundary:TheIronMaidens()
	------------------------------------------------------
	---- The Iron Maidens
	------------------------------------------------------
	core:displayAchievementsToTrackCurrent(8984)

	if (core.type == "UNIT_DIED") and (core.destID == "77477" or core.destID == "77557" or core.destID == "77231") and timerStarted == false then
		timerStarted = true
		bossesDead = 1
		SendChatMessage("[WIP] Timer started. 10 seconds remaining to kill bosses",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)		
		C_Timer.After(10, function()
			if bossesDead ~= 3 and core.inCombat == true then
				SendChatMessage("[WIP] "  .. GetAchievementLink(8984) .. " FAILED! (" .. bossesDead .. "/3)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true
			end							
		end)
	elseif (core.type == "UNIT_DIED") and (core.destID == "77477" or core.destID == "77557" or core.destID == "77231") then
		bossesDead = bossesDead + 1
	end
end

function core.BlackrockFoundary:BlastFurnace()
	core:displayAchievementsToTrackCurrent(8930)

	if core.type == "UNIT_DIED" and core.destID == "76815" and core.achievementFailed == false and core.achievementCompleted == false then
		primalElementalistsKilled = primalElementalistsKilled + 1
		SendChatMessage("[WIP] Primal Elementalists killed: (" .. primalElementalistsKilled .. "/4)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		if timerStarted == false then
			timerStarted = true
			SendChatMessage("[WIP] Timer Started!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			C_Timer.After(10, function()
				if primalElementalistsKilled == 4 then
					SendChatMessage("[WIP] "  .. GetAchievementLink(8930) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementCompleted = true
				elseif primalElementalistsKilled < 4 then
					SendChatMessage("[WIP] "  .. GetAchievementLink(8930) .. " FAILED! (" .. primalElementalistsKilled .. "/4) Primal Elementalists killed in time",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementFailed = true					
				end
			end)
		end
	end
end

function core.BlackrockFoundary:Kromog()
	core:displayAchievementsToTrackCurrent(8983)

	if core.type == "UNIT_DIED" and core.destID == "77893" and core.achievementFailed == false and core.achievementCompleted == false then
		graspingEarthKilled = graspingEarthKilled + 1
		SendChatMessage("[WIP] Grasping Earth Hands killed: (" .. graspingEarthKilled .. "/10)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		if timerStarted == false then
			timerStarted = true
			SendChatMessage("[WIP] Timer Started!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			C_Timer.After(5, function()
				if graspingEarthKilled >= 10 then
					SendChatMessage("[WIP] "  .. GetAchievementLink(8983) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementCompleted = true
				elseif graspingEarthKilled < 10 then
					SendChatMessage("[WIP] "  .. GetAchievementLink(8983) .. " FAILED! (" .. graspingEarthKilled .. "/10) Grasping Earth Hands killed in time",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					core.achievementFailed = true					
				end
			end)
		end
	end
end

function BlackrockFoundary_ClearVariables()
	------------------------------------------------------
	---- Blackhand
	------------------------------------------------------
	ashCounter = 0

	------------------------------------------------------
	---- Operator Thogar
	------------------------------------------------------
	timerStarted = false

	------------------------------------------------------
	---- The Iron Maidens
	------------------------------------------------------
	bossesDead = 0

	------------------------------------------------------
	---- Blast Furnace
	------------------------------------------------------
	primalElementalistsKilled = 0

	------------------------------------------------------
	---- Kromog
	------------------------------------------------------
	graspingEarthKilled = 0
end
