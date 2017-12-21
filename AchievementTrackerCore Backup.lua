--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

local events = CreateFrame("Frame")

local events = CreateFrame("Frame", "AchievementTracker2", UIParent, "UIPanelDialogTemplate")
events:SetSize(800, 500)
events:SetPoint("CENTER") --Center of the screen

local playersToScanFontstring = events:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
playersToScanFontstring:SetPoint("TOPLEFT",12,-30)
playersToScanFontstring:SetText("Test 123")
playersToScanFontstring:SetWidth(500)

local playersScannedFontString = events:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
playersScannedFontString:SetPoint("TOPLEFT",12,-200)
playersScannedFontString:SetText("Test 1234")
playersScannedFontString:SetWidth(500)

local playersWaitingToScanFontstring = events:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
playersWaitingToScanFontstring:SetPoint("TOPLEFT",12,-300)
playersWaitingToScanFontstring:SetText("Test 12345")
playersWaitingToScanFontstring:SetWidth(500)

events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("INSPECT_ACHIEVEMENT_READY")
events:RegisterEvent("GROUP_ROSTER_UPDATE")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("PLAYER_REGEN_DISABLED")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

events:SetScript("OnEvent", function(self, event, ...)
   -- Automatically call the method for this event, if it exists
   -- Note: This allows the event argument to be called from seperate functions to make the code cleaner
   return self[event] and self[event](self, event, ...)
end)

--------------------------------------
-- Achievement Scanning Variables
--------------------------------------
local playersToScan = {}
local playersScanned = {}
local playersWaitingToScan = {}
local scanInProgress = false
local playerCurrentlyScanning
local instanceName = nil
local rescanNeeded = false
local playerScanInProgress = false

--------------------------------------
-- Main Variables
--------------------------------------
core.currentZoneID = nil
core.playerCount = 0
core.inCombat = false
core.achievementFailed = false
core.achievementFailed2 = false
core.achievementFailed3 = false
core.achievementFailed4 = false
core.achievementFailed5 = false
core.achievementCompleted = false
core.chatType = nil
core.partialTrack = false
core.displayTracked = false
core.displayTracked2 = false
core.displayTracked3 = false
core.displayTracked4 = false

local waitToDisplay = false
local updateStill = false

--------------------------------------
-- Achievement Functions
--------------------------------------
function updateDebugTable()
	--Slow down updating
	if waitToDisplay == false then
		waitToDisplay = true
		C_Timer.After(1, function()
			--DEBUG START
			local tmpPlayersToScanOutput = "ToScan: "
			if #playersToScan > 0 then
				for i = 1, #playersToScan do
					tmpPlayersToScanOutput = tmpPlayersToScanOutput .. playersToScan[i] .. ", "
					
				end
				playersToScanFontstring:SetText(tmpPlayersToScanOutput)
			end

			local tmpPlayersScannedOutput = "Scanned: "
			if #playersScanned > 0 then
				for i = 1, #playersScanned do
					tmpPlayersScannedOutput = tmpPlayersScannedOutput .. playersScanned[i] .. ", "
					
				end
				playersScannedFontString:SetText(tmpPlayersScannedOutput)
			end

			local tmpPlayersWaitingToScanOutput = "WaitingToScan: "
			if #playersWaitingToScan > 1 then
				for i = 1, #playersWaitingToScan do
					tmpPlayersWaitingToScanOutput = tmpPlayersWaitingToScanOutput .. playersWaitingToScan[i] .. ", "	
				end
				playersWaitingToScanFontstring:SetText(tmpPlayersWaitingToScanOutput)
			end
			--DEBUG END	

			waitToDisplay = false

			if updateStill == true then
				updateStill = false
				updateDebugTable()
			end	
		end)
	else
		updateStill = true
	end


end

function getPlayersInGroup()
	updateDebugTable()
	if playerScanInProgress == false then
		playerScanInProgress = true
		print("Starting Player Achievement Scan...")
		local currentGroup = {}
		if GetNumGroupMembers() > 0 then
			--We are in a group
			local currentUnit
			core:detectGroupType()
			for i = 1, GetNumGroupMembers() do
				if core.chatType == "PARTY" then
					if i < GetNumGroupMembers() then
						currentUnit = "party" .. i
					else
						currentUnit = "player"				
					end
				elseif core.chatType == "RAID" then
					currentUnit = "raid" .. i
				end

				local name, realm = UnitName(currentUnit)
				if core:has_value(playersScanned, name) == false and core:has_value(playersToScan, name) == false and core:has_value(playersWaitingToScan, name) == false and name ~= "Unknown" then
					table.insert(playersToScan, name)
					----print("Adding: " .. name)
				end

				--Add to the current scan group
				if name ~= "Unknown" then
					table.insert(currentGroup, name)
				end	
			end
		else
			--Reset variables since user may have left the group
			playersToScan = {}
			playersScanned = {}
			playersWaitingToScan = {}
			scanInProgress = false
			playerCurrentlyScanning = nil
			rescanNeeded = false
			playerScanInProgress = false

			currentUnit = "player"
			local name, realm = UnitName(currentUnit)
			table.insert(playersToScan, name)
			table.insert(currentGroup, name)
		end

		--Check if anyone in the group has left that has already been scanned
		--In playersToScan
		if #playersToScan > 0 then
			for i = #playersToScan, 1, -1 do
				if core:has_value(currentGroup, playersToScan[i]) == false then
					----print("Removing: " .. playersToScan[i])
					table.remove(playersToScan, i)
				end	
			end
		end

		--In playersScanned
		if #playersScanned > 0 then
			for i = #playersScanned, 1, -1 do
				if core:has_value(currentGroup, playersScanned[i]) == false then
					----print("Removing: " .. playersScanned[i])
					table.remove(playersScanned, i)
				end	
			end
		end

		--In playersWaitingToScan
		if #playersWaitingToScan > 0 then
			for i = #playersWaitingToScan, 1, -1 do
				if core:has_value(currentGroup, playersWaitingToScan[i]) == false then
					----print("Removing: " .. playersWaitingToScan[i])
					table.remove(playersWaitingToScan, i)
				end	
			end
		end

		rescanNeeded = false
		playerScanInProgress = false
		----print("Size of group: " .. (#playersToScan + #playersScanned + #playersWaitingToScan))
		
		updateDebugTable()

		--Start the player scanning
		if #playersToScan > 0 then
			--print("Calling getInstanceAchievements from getPlayersInGroup since scanning of players has finished")
			getInstanceAchievements()
		end
	end		
end

function getInstanceAchievements()
	updateDebugTable()
	if scanInProgress == false and playersToScan[1] ~= nil and rescanNeeded == false then
		scanInProgress  = true
		ClearAchievementComparisonUnit()
		--Make sure the player we are about to scan is still in the group
		if UnitName(playersToScan[1]) ~= nil then
			----print("Scanning " .. UnitName(playersToScan[1]))
			playerCurrentlyScanning = playersToScan[1]
			SetAchievementComparisonUnit(playersToScan[1])

			--If the INSPECT_ACHIEVEMENT_READY event is not called after 5 seconds then we can assume the user was out of scanning range or has left the group
			C_Timer.After(5, function()
				--Make sure the player we are about to scan is still in the group
				if UnitName(playerCurrentlyScanning) ~= nil then
					if playerCurrentlyScanning == playersToScan[1] then
						--Player cannot be scanned at the moment so add them to a playersWaitingToScan
						----print("Cannot Scan: " .. UnitName(playerCurrentlyScanning))
						local name, _ = UnitName(playerCurrentlyScanning)
						table.insert(playersWaitingToScan, name)			
						table.remove(playersToScan, 1)
						scanInProgress = false

						if #playersToScan == 0 then
							--print("Achievement Scanning Finished")
							updateDebugTable()

							--If players are still waiting to be scanned. Wait 1 minute then try again
							if #playersWaitingToScan > 0 then
								--print("Players still need scanning. Waiting 60 seconds then trying again")
								C_Timer.After(20, function()
									--Move players from waiting to scan back into to playersToScan
									for i = 1, #playersWaitingToScan do
										table.insert(playersToScan, playersWaitingToScan[i])
									end
									playersWaitingToScan = {}
									--print("Calling GetPlayersInGroup From getInstanceAchievements after waiting 20 seconds to rescan players")
									getPlayersInGroup()
								end)
							end
						else
							--Players still need scanning
							--print("Calling getInstanceAchievements after failing to scan last player so waited 5 seconds")
							getInstanceAchievements()
						end
					end	
				else
					--The player must have left the group so remove than from the array and recall the function
					--print("Calling GetPlayersInGroup From getInstanceAchievements since player has left the group after waiting 5 seconds for insepect to return")
					getPlayersInGroup()							
				end
			end)
		else
			--The player must have left the group so remove than from the array and recall the function
			--print("Calling GetPlayersInGroup From getInstanceAchievements since player has left the group before starting scan on that player")
			getPlayersInGroup()
		end
	else
		--Group size has changed so update list of players in table
		--print("Calling GetPlayersInGroup From getInstanceAchievements since the size of the group has changed")
		getPlayersInGroup()
	end
end

--------------------------------------
-- Events
--------------------------------------
function events:ADDON_LOADED(event, name)
	if name ~= "AchievementTracker" then return end

	SLASH_MENU1 = "/at"
	SlashCmdList.MENU = core.Config.Toggle

	----print(name .. " loaded")
end

function events:GROUP_ROSTER_UPDATE()
	--When player enters the world in an instance start the achievement scanner
	if core.currentZoneID == 1448 then
		scanPlayers()
	elseif core.currentZoneID == 996 then
		scanPlayers()
	end
end

function scanPlayers()
	if scanInProgress == true then
		----print("Group Size Changed: Requesting Rescan")
		rescanNeeded = true
	else
		----print("Group Size Changed: Searching for players in group")
		--print("Calling GetPlayersInGroup From scanPlayers since there is no scan currently in progress")
		getPlayersInGroup()
	end
end

function events:INSPECT_ACHIEVEMENT_READY()
	--Find the achievements for the raid the user has entered
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
				if instance == instanceName then
					for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
						if boss ~= "name" then
							local completed, month, day, year = GetAchievementComparisonInfo(core.Instances[expansion][instanceType][instance][boss].achievement)
							----print(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " completed: " .. tostring(completed))

							--If the player has not completed the achievement then add them to the players string to display in the GUI
							--Temp: will show completed achievements in GUI since I've already completed all the achievements
							if completed ~= true then
								local name, _ = UnitName(playersToScan[1])
								table.insert(core.Instances[expansion][instanceType][instance][boss].players, name)
							end
						end
					end
				end
			end
		end
	end

	--print("Scanned " .. UnitName(playersToScan[1]))
	table.insert(playersScanned, playersToScan[1])
	table.remove(playersToScan, 1)

	C_Timer.After(0.5, function()
		scanInProgress = false
		
		if #playersToScan == 0 then
			--print("Achievement Scanning Finished")
			updateDebugTable()

			--If players are still waiting to be scanned. Wait 1 minute then try again
			if #playersWaitingToScan > 0 then
				--print("Players still need scanning. Waiting 60 seconds then trying again")
				C_Timer.After(20, function()
					--Move players from waiting to scan back into to playersToScan
					for i = 1, #playersWaitingToScan do
						table.insert(playersToScan, playersWaitingToScan[i])
					end
					playersWaitingToScan = {}
					--print("Calling GetPlayersInGroup From INSPECT_ACHIEVEMENT_READY after 20 seconds since players still need scanning")
					getPlayersInGroup()
				end)
			end
		else
			--Players still need scanning
			--print("Calling getInstanceAchievements from Inspect_achievement_Ready since players still need scanning")
			getInstanceAchievements()
		end	
	end)

end

function events:PLAYER_ENTERING_WORLD()
	local _, _, difficultyID, _, maxPlayers, _, _, mapID, _ = GetInstanceInfo()
	playerCount = maxPlayers
	core.currentZoneID = mapID
	----print(currentZoneID)

	if(difficultyID == 5 or difficultyID == 6) then
		mode = "heroic"
	else
		mode = "normal"
	end

	--When player enters the world in an instance start the achievement scanner
	core.currentZoneID = 1448
	if core.currentZoneID == 1448 then
		----print("Hellfire Citadel")
		instanceName = "HellfireCitadel"
		--print("Calling GetPlayersInGroup From Player Entering World (Hellfire Citadel)")
		getPlayersInGroup()
	elseif core.currentZoneID == 996 then
		instanceName = "TerraceOfEndlessSpring"
		--print("Calling GetPlayersInGroup From Player Entering World (Terrace of Endless Spring)")
		getPlayersInGroup()
	end
end

function events:ZONE_CHANGED_NEW_AREA()
	--When player enters the world in an instance start the achievement scanner
	if core.currentZoneID == 1448 then
		----print("Hellfire Citadel")
		instanceName = "HellfireCitadel"
		--print("Calling GetPlayersInGroup from zone_changed_new_area for hellfire citadel")
		getPlayersInGroup()
	elseif core.currentZoneID == 996 then
		instanceName = "TerraceOfEndlessSpring"
		--print("Calling GetPlayersInGroup from zone_changed_new_area for terrace of endless spring")
		getPlayersInGroup()
	end
end

function events:PLAYER_REGEN_DISABLED()
	clearVariables()
 	core.inCombat = true
 	core:detectGroupType()

	--DEBUG
 	----print(UnitGUID("Boss1"))
 	----print(UnitGUID("Boss2"))		
end

function events:PLAYER_REGEN_ENABLED()
	clearVariables()
end

local tempStore = {}

function events:COMBAT_LOG_EVENT_UNFILTERED(self, ...)
	if core.inCombat == true then
		--If the current boss is nil then get the type of group the user is in and the boss they are currently attacking
		core:detectGroupType()
		detectBoss()

		
		core.timeStamp, core.type, core.hideCaster, core.sourceGUID, core.sourceName, core.sourceFlags, core.sourceRaidFlags, core.destGUID, core.destName, core.destFlags, core.destRaidFlags, core.spellId, core.spellName, core.spellSchool, core.amount, core.overkill, core.school, core.resisted, core.blocked, core.absorbed, core.critical, core.glancing, core.crushing = ...

		--For a Creature
		core.unitTypeSrc, _, _, _, _, core.sourceID, core.spawn_uid = strsplit("-", core.sourceGUID);
		core.unitType, _, _, _, _, core.destID, core.spawn_uid_dest = strsplit("-", core.destGUID);

		--For a Player
		core.unitTypePlayer, core.destIDPlayer, core.spawn_uid_dest_Player = strsplit("-", core.destGUID);		

		-- if tempStore[core.sourceID] == nil and core.sourceID ~= nil then
		-- 	--print(core.sourceID)
		-- 	tempStore[core.sourceID] = core.sourceID
		-- end

		-- if tempStore[core.type] == nil and core.type ~= nil then
		-- 	--print(core.type)
		-- 	tempStore[core.type] = core.type
		-- end

		--If the boss has been found then we can load the tracker for that particular boss
		if currentBoss ~= nil then
			--core.type, _, core.sourceGUID, core.sourceName, _, _, core.destGUID, core.destName, _, _, core.spellId, core.spellName, core.spellSchool, core.amount, core.overkill, core.school, core.resisted, core.blocked, core.absorbed, core.critical, core.glancing, core.crushing = ...
			
			--Start tracking the particular boss if the user has not disabled tracking for that boss
			if currentBoss.enabled then
				currentBoss.track()
			end
		end
	end
end

------------------------------------------------------
---- Core Functions
------------------------------------------------------
function core:detectGroupType()
	--Detect type of group the user is in
	if UnitInRaid("player") then
		core.chatType = "RAID"
	elseif UnitInParty("player") then
		core.chatType = "PARTY"
	else
		core.chatType = "SAY"
	end

	--Debug to stop message going out to other people by accident
	--core.chatType = "OFFICER"
end

function detectBoss()
	for expansion,_ in pairs(core.Instances) do
		for instanceType,_ in pairs(core.Instances[expansion]) do
			for instance,_ in pairs(core.Instances[expansion][instanceType]) do
                for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
					if core.Instances[expansion][instanceType][instance][boss].bossIDs ~= nil then
						for i = 1, #core.Instances[expansion][instanceType][instance][boss].bossIDs do
							local bossID = core.Instances[expansion][instanceType][instance][boss].bossIDs[i]
							for j = 1, 5 do
								if UnitGUID("boss" .. j) ~= nil then
									if string.find(UnitGUID("boss" .. j), bossID) then
										currentBoss = core.Instances[expansion][instanceType][instance][boss]
									end
								end
							end

							--If boss does not have a nameplate then check the GUID for the id of the attacking unit
							if core.sourceID ~= nil then
								if string.find(core.sourceID, bossID) then
									currentBoss = core.Instances[expansion][instanceType][instance][boss]
								end
							end
						end
					end					
                end
			end
		end
	end	
end

function core:getAchievementsToTrackWrath(id25,id10)
	if displayTracked == false then
		if(core.playerCount == 25) then
			SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id25),core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			displayTracked = true
		elseif core.playerCount == 10 then
			SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id10),core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			displayTracked = true
		end	
	end
end

function core:getAchievementsToTrackWrathNew(id25,id10,tracker)
	if(core.playerCount == 25) then
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id25),core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		tracker = true
	elseif core.playerCount == 10 then
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id10),core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		tracker = true
	end	
end

function core:getAchievementFailedWrath(id25,id10,player)
	if(core.playerCount == 25) then
		if player == nil then
			SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		else
			SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " FAILED! (" .. player .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
		displayTracked = true
	elseif core.playerCount == 10 then
		if player == nil then
			SendChatMessage("[WIP] " .. GetAchievementLink(id10) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		else
			SendChatMessage("[WIP] "  .. GetAchievementLink(id10) .. " FAILED! (" .. player .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end	
		displayTracked = true
	end	
end

function core:getAchievementSuccessWrath(id25,id10)
	if(core.playerCount == 25) then
		SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	elseif core.playerCount == 10 then
		SendChatMessage("[WIP] " .. GetAchievementLink(id10) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	end
end

function core:getAchievementSuccessWrathPersonal(id25,id10,name)
	if(core.playerCount == 25) then
		SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " has completed the personal achievement!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	elseif core.playerCount == 10 then
		SendChatMessage("[WIP] " .. GetAchievementLink(id10) .. " has completed the personal achievement!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	end
end

function clearVariables()
	------------------------------------------------------
	---- Reset Variables
	------------------------------------------------------
	core.inCombat = false
	currentBoss = nil
	core.achievementFailed = false
	core.achievementFailed2 = false
	core.achievementFailed3 = false
	core.achievementFailed4 = false
	core.achievementFailed5 = false
	core.achievementCompleted = false
	core.displayTracked = false
	core.displayTracked2 = false
	core.displayTracked3 = false
	core.displayTracked4 = false
	core.partialTrack = false
	displayTracked = false
	if core.currentZoneID == 631 then		
		Icecrown_ClearVariables()
	elseif core.currentZoneID == 603 then
		Ulduar_ClearVariables()
	elseif core.currentZoneID == 1098 then
		ThroneOfThunder_ClearVariables()
	elseif core.currentZoneID == 1136 then
		SiegeOfOrgrimmar_ClearVariables()
	elseif core.currentZoneID == 1205 then
		BlackrockFoundary_ClearVariables()
	elseif core.currentZoneID == 1448 then
		HellfireCitadel_ClearVariables()
	elseif core.currentZoneID == 967 then
		DragonSoul_ClearVariables()
	elseif core.currentZoneID == 669 then
		BlackwingDescent_ClearVariables()
	elseif core.currentZoneID == 671 then
		BastionOfTwilight_ClearVariables()
	elseif core.currentZoneID == 720 then
		Firelands_ClearVariables()
	elseif core.currentZoneID == 996 then
		TerraceOfEndlessSpring_ClearVariables()
	elseif core.currentZoneID == 1009 then
		HeartOfFear_ClearVariables()
	elseif core.currentZoneID == 1008 then
		MogushanVaults_ClearVariables()
	end

	StormstoutBrewery_ClearVariables()
end

function core:displayAchievementsToTrackCurrent(id)
	if displayTracked == false then
		displayTracked = true
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id),core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end
end

function core:displayAchievementsToTrackCurrentPartial(id)
	if displayTracked == false then
		displayTracked = true
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id) .. " (Partial)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end
end

function core:achievementFailed(id)
	SendChatMessage("[WIP] "  .. GetAchievementLink(id) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	displayTracked = true	
end

function core:getAchievementSuccess(id)
	SendChatMessage("[WIP] "  .. GetAchievementLink(id) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	core.achievementCompleted = true
end

function core:has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end