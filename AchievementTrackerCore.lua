--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

local events = CreateFrame("Frame")
local UIConfig
local UICreated = false
local addonVersion = 10

-- local events = CreateFrame("Frame", "AchievementTracker2", UIParent, "UIPanelDialogTemplate")
-- events:SetSize(800, 500)
-- events:SetPoint("CENTER") --Center of the screen

-- local playersToScanFontstring = events:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
-- playersToScanFontstring:SetPoint("TOPLEFT",12,-30)
-- playersToScanFontstring:SetText("Test 123")
-- playersToScanFontstring:SetWidth(500)

-- local playersScannedFontString = events:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
-- playersScannedFontString:SetPoint("TOPLEFT",12,-200)
-- playersScannedFontString:SetText("Test 1234")
-- playersScannedFontString:SetWidth(500)

-- local playersWaitingToScanFontstring = events:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
-- playersWaitingToScanFontstring:SetPoint("TOPLEFT",12,-300)
-- playersWaitingToScanFontstring:SetText("Test 12345")
-- playersWaitingToScanFontstring:SetWidth(500)

events:RegisterEvent("ADDON_LOADED")						--Used to setup the slash commands for the addon
events:RegisterEvent("PLAYER_ENTERING_WORLD")				--Used to detect if player is inside an instance when they enter the world
events:RegisterEvent("ZONE_CHANGED_NEW_AREA")				--Used to detect if player is inside an instance when they change zone

events:SetScript("OnEvent", function(self, event, ...)
   return self[event] and self[event](self, event, ...) 	--Allow event arguments to be called from seperate functions
end)

--------------------------------------
-- Achievement Scanning Variables
--------------------------------------
local playersToScan = {}						--List of players that still need to be scanned to see which achievements they are missing for the current instance
local playersScanned = {}						--List of players that have been successfully scanned for the current instance
local instanceName = nil						--The name of the current instance the player is in
local rescanNeeded = false						--Set to true if a rescan is needed during a current scan. This is fired if the group size changes during a scan
local playerCurrentlyScanning = nil				--This is set to the current player that is being scanned
local scanInProgress = false					--Set to true when a scan of the group has started
core.scanFinished = false						--Set to true when everyone in the group has been scanned successfully and no rescan is needed. Part of core so it can be accessed by the GUI

--------------------------------------
-- Main Variables
--------------------------------------
core.masterAddon = false						--The master addon for the group. This stop multiple people with the addon outputting identical messages
core.playerRankInGroup = 0						--The rank of the player is the group. Used to sync multiple addons in the group
core.currentZoneID = nil						--The ID of the current instance the player is in
core.playerCount = 0							--The amount of players the instance lock can hold
core.inCombat = false							--Whether anyone in the current group is in combat with boss/mobs
core.achievementFailed = false					--Set to true when the requirements for a tracked achievement has failed
core.achievementCompleted = false				--Set to true when the requrements for a tracked achievement have been met
core.chatType = nil								--The chat type for the current group (say/party/raid)
core.achievementTrackedMessageShown = false		--Set to true when the message "Tracking {achievement}" is output to the chat so that it only outputs once per fight
core.groupSize = 0								--Amount of players currently in the group
core.currentAchievementID = nil					--The ID for the current boss achievement
core.achievementTrackingEnabled = false			--Whether the user wants to track achievements for the particular instance or not
local currentBoss = nil							--The current boss the player is attacking. Can only be one of the bosses listed in the instances.lua file
local expansion = nil							--Current expansion of the particular instance
local instanceType = nil						--Whether the instance is a dungeon or a raid
local instance = nil							--Name of the instance the player is currently in
local instanceNameSpaces						--Instance name with spaces
local combatTimerStarted = false				--Used to determine if players in the group are still in combat with a boss
local lastMessageSent = ""   					--Stores the last message sent to the chat. This is used to prevent the same message being sent more than once in case of an error and to prevent unwanted spam
local enabledCheckSent = false

--------------------------------------
-- Achievement Functions
--------------------------------------
function updateDebugTable()
	--DEBUG START
	-- local tmpPlayersToScanOutput = "ToScan: "
	-- if #playersToScan > 0 then
	-- 	for i = 1, #playersToScan do
	-- 		tmpPlayersToScanOutput = tmpPlayersToScanOutput .. playersToScan[i] .. ", "
			
	-- 	end
	-- 	playersToScanFontstring:SetText(tmpPlayersToScanOutput)
	-- end

	-- local tmpPlayersScannedOutput = "Scanned: "
	-- if #playersScanned > 0 then
	-- 	for i = 1, #playersScanned do
	-- 		tmpPlayersScannedOutput = tmpPlayersScannedOutput .. playersScanned[i] .. ", "
			
	-- 	end
	-- 	playersScannedFontString:SetText(tmpPlayersScannedOutput)
	-- end

	-- local tmpPlayersWaitingToScanOutput = "WaitingToScan: "
	-- if #playersWaitingToScan > 1 then
	-- 	for i = 1, #playersWaitingToScan do
	-- 		tmpPlayersWaitingToScanOutput = tmpPlayersWaitingToScanOutput .. playersWaitingToScan[i] .. ", "	
	-- 	end
	-- 	playersWaitingToScanFontstring:SetText(tmpPlayersWaitingToScanOutput)
	-- end
	--DEBUG END	
end

function getPlayersInGroup()
	print("Starting Player Achievement Scan for " .. instanceNameSpaces .. "...")
	scanInProgress = true
	core.scanFinished = false
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
			if core:has_value(playersScanned, name) == false and core:has_value(playersToScan, name) == false and name ~= "Unknown" then
				table.insert(playersToScan, name)
			end

			--Add to the current group so we can remove players that have left the group
			if name ~= "Unknown" then
				table.insert(currentGroup, name)
			end
		end
	else
		currentUnit = "player"
		local name, realm = UnitName(currentUnit)
		if core:has_value(playersScanned, name) == false and core:has_value(playersToScan, name) == false and name ~= "Unknown" then
			table.insert(playersToScan, name)
		end
		table.insert(currentGroup, name)
	end

	--Check if anyone in the group has left that has already been scanned
	--In playersToScan
	if #playersToScan > 0 then
		for i = #playersToScan, 1, -1 do
			if core:has_value(currentGroup, playersToScan[i]) == false then
				print("Removing: " .. playersToScan[i])
				table.remove(playersToScan, i)
			end	
		end
	end

	--In playersScanned
	if #playersScanned > 0 then
		for i = #playersScanned, 1, -1 do
			if core:has_value(currentGroup, playersScanned[i]) == false then
				print("Removing: " .. playersScanned[i])
				

				--Remove player from the table that generates the UI for that achievement
				for expansion,_ in pairs(core.Instances) do
					for instanceType,_ in pairs(core.Instances[expansion]) do
						for instance,_ in pairs(core.Instances[expansion][instanceType]) do
							if instance == instanceName then
								for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
									if boss ~= "name" then
										local name, _ = UnitName(playersScanned[i])
										table.remove(core.Instances[expansion][instanceType][instance][boss].players, name)

										--Set the expansion and instance name
										core.Config.currentExpansion = expansion
										core.Config.InstanceName = instanceName
										core.Config.currentTab = expansion
									end
								end
							end
						end
					end
				end

				--Update the GUI
				core.Config:Instance_OnClickAutomatic()

				table.remove(playersScanned, i)
			end	
		end
	end

	rescanNeeded = false
	----print("Size of group: " .. (#playersToScan + #playersScanned + #playersWaitingToScan))
	updateDebugTable()

	--Start the player scanning
	if #playersToScan > 0 then
		--print("Calling getInstanceAchievements from getPlayersInGroup since scanning of players has finished")
		getInstanceAchievements()
	else
		print("Achievment Scanning Finished (" .. #playersScanned .. "/" .. GetNumGroupMembers() .. ")")
		scanInProgress = false
		core.scanFinished = true
	end	
end

function getInstanceAchievements()
	ClearAchievementComparisonUnit()
	--Make sure the player we are about to scan is still in the group
	updateDebugTable()
	if UnitName(playersToScan[1]) ~= nil then
		print("Scanning " .. UnitName(playersToScan[1]))
		playerCurrentlyScanning = playersToScan[1]
		SetAchievementComparisonUnit(playersToScan[1])

		--Wait 2 seconds then check if the achievement information was returned successfully. If playerCurrentlyScanning is nil then we can assume the information was returned successfully
		--If playerCurrentlyScanning still has a value then INSPECT_ACHIEVEMNT_READY event has not run and the information for that player was not fetched
		C_Timer.After(2, function()
			--Make sure the player we are about to scan is still in the group
			if playerCurrentlyScanning == nil then
				--Last player scan was successfully. Check if we need to continue scanning
				if #playersToScan > 0 then
					getInstanceAchievements()
				elseif #playersToScan == 0 and rescanNeeded == false then
					print("Achievment Scanning Finished (" .. #playersScanned .. "/" .. GetNumGroupMembers() .. ")")
					scanInProgress = false
					core.scanFinished = true
					updateDebugTable()
				elseif #playersToScan == 0 and rescanNeeded == true then
					print("Achievement Scanning Finished but some players still need scanning. Waiting 20 seconds then trying again (" .. #playersScanned .. "/" .. GetNumGroupMembers() .. ")")
					C_Timer.After(10, function()
						scanInProgress = true
						getPlayersInGroup()
					end)
				end
			else
				--Last player to scan was not successfull
				rescanNeeded = true
				if playersToScan[1] ~= nil then
					print("Cannot Scan " .. playersToScan[1])	
					table.remove(playersToScan, 1)				
				end			

				if #playersToScan > 0 then
					getInstanceAchievements()
				elseif #playersToScan == 0 and rescanNeeded == true then
					print("Achievement Scanning Finished but some players still need scanning. Waiting 20 seconds then trying again (" .. #playersScanned .. "/" .. GetNumGroupMembers() .. ")")
					C_Timer.After(10, function()
						scanInProgress = true
						getPlayersInGroup()
					end)
				end
			end
			updateDebugTable()
		end)
	else
		rescanNeeded = true
		scanInProgress = true
		getPlayersInGroup()
		updateDebugTable()
	end
end

function events:GROUP_ROSTER_UPDATE()
	--When player enters the world in an instance start the achievement scanner
	if scanInProgress == false then
		print("Scan not in progress. Starting scan...")
		scanInProgress = true
		getPlayersInGroup()
	else
		print("Scan in progress asking for rescan since group size has changed")
		rescanNeeded = true
	end

	--Save the current number of players in group to the namespace
	core.groupSize = GetNumGroupMembers()	
end

function events:INSPECT_ACHIEVEMENT_READY()
	--Find the achievements for the raid the user has entered
	if UnitName(playerCurrentlyScanning) ~= nil then
		for expansion,_ in pairs(core.Instances) do
			for instanceType,_ in pairs(core.Instances[expansion]) do
				for instance,_ in pairs(core.Instances[expansion][instanceType]) do
					if instance == instanceName then
						for boss,_ in pairs(core.Instances[expansion][instanceType][instance]) do
							if boss ~= "name" then
								local completed, month, day, year = GetAchievementComparisonInfo(core.Instances[expansion][instanceType][instance][boss].achievement)
								--print(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " completed: " .. tostring(completed))

								--If the player has not completed the achievement then add them to the players string to display in the GUI
								--Temp: will show completed achievements in GUI since I've already completed all the achievements
								if completed ~= true then
									local name, _ = UnitName(playersToScan[1])
									table.insert(core.Instances[expansion][instanceType][instance][boss].players, name)
								end

								--Set the expansion and instance name
								core.Config.currentExpansion = expansion
								core.Config.InstanceName = instanceName
								core.Config.currentTab = expansion
							end
						end
					end
				end
			end
		end

		print("Scanned " .. UnitName(playersToScan[1]))
		table.insert(playersScanned, playersToScan[1])
		table.remove(playersToScan, 1)

		--Update the GUI
		core.Config:Instance_OnClickAutomatic()

		playerCurrentlyScanning = nil
	else
		rescanNeeded = true
	end

	updateDebugTable()
end

function events:PLAYER_ENTERING_WORLD()
	local name, _, difficultyID, _, maxPlayers, _, _, mapID, _ = GetInstanceInfo()
	playerCount = maxPlayers
	core.currentZoneID = mapID
	----print(currentZoneID)

	if(difficultyID == 5 or difficultyID == 6) then
		mode = "heroic"
	else
		mode = "normal"
	end

	local isInstance, instanceType = IsInInstance()
	if isInstance == true and (instanceType == "party" or instanceType == "raid") then
		local str = string.gsub(" "..name, "%W%l", string.upper):sub(2)
		str = str:gsub("%s+", "")
		core.currentZoneID = 1448 
		instanceName = str
		instanceNameSpaces = name
		
		--Ask the user whether they want to enable Achievement Tracking in the instance
		createEnableAchievementTrackingUI()
	end 
end

function events:ZONE_CHANGED_NEW_AREA()
	local name, _, difficultyID, _, maxPlayers, _, _, mapID, _ = GetInstanceInfo()
	playerCount = maxPlayers
	core.currentZoneID = mapID
	----print(currentZoneID)

	if(difficultyID == 5 or difficultyID == 6) then
		mode = "heroic"
	else
		mode = "normal"
	end

	local isInstance, instanceType = IsInInstance()
	if isInstance == true and (instanceType == "party" or instanceType == "raid") then
		local str = string.gsub(" "..name, "%W%l", string.upper):sub(2)
		str = str:gsub("%s+", "")
		core.currentZoneID = 1448 
		instanceName = str
		
		--Ask the user whether they want to enable Achievement Tracking in the instance
		if UICreated == false then
			createEnableAchievementTrackingUI()
		else
			UIConfig:Show()
		end
	else
		--If user has left the instance then unregister events if they were registered
		events:UnregisterEvent("INSPECT_ACHIEVEMENT_READY") 			
		events:UnregisterEvent("GROUP_ROSTER_UPDATE")					
		events:UnregisterEvent("PLAYER_REGEN_DISABLED")				
		events:UnregisterEvent("PLAYER_REGEN_ENABLED")				
		events:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")	
	end		
end

function createEnableAchievementTrackingUI()
	UICreated = true

	--Create the frame to ask the user whether they want to enable the addon for the particular instance they are in
	UIConfig = CreateFrame("Frame", "AchievementTrackerCheck", UIParent, "UIPanelDialogTemplate", "AchievementTemplate")
	UIConfig:SetSize(200, 200)
	UIConfig:SetPoint("CENTER")

	--Title
	UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	UIConfig.title:SetPoint("CENTER", AchievementTrackerCheckTitleBG, "CENTER", -5, 0);
	UIConfig.title:SetText("Track Achievements?");

	--Content
	UIConfig.content = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	UIConfig.content:SetPoint("TOPLEFT", AchievementTrackerCheckDialogBG, "TOPLEFT", 0, -5);
	UIConfig.content:SetText("Do you want to enable achievement tracking for: " .. instanceNameSpaces);
	UIConfig.content:SetWidth(185)

	UIConfig.btnYes = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
	UIConfig.btnYes:SetPoint("RIGHT", UIConfig.content, "BOTTOM", 0, -20);
	UIConfig.btnYes:SetSize(80, 30);
	UIConfig.btnYes:SetText("Yes");
	UIConfig.btnYes:SetNormalFontObject("GameFontNormal");
	UIConfig.btnYes:SetHighlightFontObject("GameFontHighlight");

	UIConfig.btnNo = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate");
	UIConfig.btnNo:SetPoint("LEFT", UIConfig.btnYes, "RIGHT", 5, 0);
	UIConfig.btnNo:SetSize(80, 30);
	UIConfig.btnNo:SetText("No");
	UIConfig.btnNo:SetNormalFontObject("GameFontNormal");
	UIConfig.btnNo:SetHighlightFontObject("GameFontHighlight");

	UIConfig:SetHeight(UIConfig.content:GetHeight() + UIConfig.btnYes:GetHeight() + UIConfig.title:GetHeight() + 35)
	UIConfig.btnYes:SetScript("OnClick", enableAchievementTracking);
	UIConfig.btnNo:SetScript("OnClick", disableAchievementTracking);
end

function events:CHAT_MSG_ADDON(prefix, message, channel, sender)
	--If this addon sent out the check then scan for replies
	--else sent out the reply

	if enabledCheckSent == true then
		--This Addon sent the message to ask for permission to run
	else
		--Another addon is requesting info and this addon
		--SendAddonMessage("AchievementTracker", core.masterAddon .. "," .. core.playerRankInGroup , "RAID")
		--print(core.masterAddon .. "," .. core.playerRankInGroup)
	end
end

function enableAchievementTracking(self)
	UIConfig:Hide()
	events:RegisterEvent("INSPECT_ACHIEVEMENT_READY") 			--Used for scanning players in the group to see which achievements they are missing
	events:RegisterEvent("GROUP_ROSTER_UPDATE")					--Used to find out when the group size has changed and to therefore initiate an achievement scan of the group
	events:RegisterEvent("PLAYER_REGEN_DISABLED")				--Used to detect when the player has entered combat and to reset tracked variables for bosses
	events:RegisterEvent("PLAYER_REGEN_ENABLED")				--Used to track when the player has left combat
	--events:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")			--Used to get information about the fight and to report information about the tracked achievement
	events:RegisterEvent("CHAT_MSG_ADDON")						--Allows the addon to communicate with other addons in the same party/raid
	getPlayersInGroup()

	--Check if there is already someone else running the addon in the group / whether the priority is higher for the current player than other players running the addon
	if core.groupSize == 0 then
		--Player is not a group so run the addon
		core.masterAddon = true
	else
		--Get the permissions for the current player
		local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(index)
		print("Setting rank to: " .. rank)
		core.playerRankInGroup = rank

		SendAddonMessage("AchievementTracker", "enabledCheck", "RAID")
		enabledCheckSent = true
		--Send out a request to the addon channel asking if anyone else in the group has the addon enabled
			--Wait period of time
				--If player has the addon
					--If player has higher permissions in raid then let them be the leader (RL, Assist, Normal)
					--If you have higher permissions that player, take control
					--If you have same permissions as other players in the raid
						--If someone already has the addon enabled, let them be leader
						--Else take leader 
	end
end

function disableAchievementTracking(self)
	UIConfig:Hide()
end

function events:ADDON_LOADED(event, name)
	if name ~= "AchievementTracker" then return end

	SLASH_MENU1 = "/at"
	SlashCmdList.MENU = core.Config.Toggle

	print(name .. " loaded. Version: " .. addonVersion)
end

function events:PLAYER_REGEN_DISABLED()
 	core.inCombat = true
 	core:detectGroupType()
	print("Entered Combat")

	local isInstance, instanceType = IsInInstance()
	if isInstance == true and (instanceType == "party" or instanceType == "raid") then
		events:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	end

	--DEBUG
 	----print(UnitGUID("Boss1"))
 	----print(UnitGUID("Boss2"))		
end

function events:PLAYER_REGEN_ENABLED()
	--Although the player running the addon has left combat, the boss could still be in combat with other players. Check everyone else in the group to see if anyone is still in combat with the boss
	if getCombatStatus() == false then
		core.inCombat = false
		clearVariables()
		print("Left Combat")
	else
		--Someone in the group is still in combat. Wait 1 second then check again
		combatTimerStarted = true
		C_Timer.After(1, function()
			combatTimerStarted = false
			getCombatStatus()
		end)
	end

	events:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

function getCombatStatus()
	local playerInCombat = false
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
	
			if UnitAffectingCombat(currentUnit) == true then
				playerInCombat = true
			end
		end

		if playerInCombat == false then
			--Everyone in the group has left combat so we can clear the tracking variables
			return false
		else
			--Someone in the group is still in combat
			return true
		end
	else
		--Player is not in a group therefore, they must of left combat so clear variables
		return false
	end
end

function events:COMBAT_LOG_EVENT_UNFILTERED(self, ...)
	--If the current boss is nil then get the type of group the user is in and the boss they are currently attacking
	
	core.timeStamp, core.type, core.hideCaster, core.sourceGUID, core.sourceName, core.sourceFlags, core.sourceRaidFlags, core.destGUID, core.destName, core.destFlags, core.destRaidFlags, core.spellId, core.spellName, core.spellSchool, core.amount, core.overkill, core.school, core.resisted, core.blocked, core.absorbed, core.critical, core.glancing, core.crushing = ...

	--For a Creature
	core.unitTypeSrc, _, _, _, _, core.sourceID, core.spawn_uid = strsplit("-", core.sourceGUID);
	core.unitType, _, _, _, _, core.destID, core.spawn_uid_dest = strsplit("-", core.destGUID);

	--For a Player
	core.unitTypePlayer, core.destIDPlayer, core.spawn_uid_dest_Player = strsplit("-", core.destGUID);		

	--If the boss has been found then we can load the tracker for that particular boss
	if currentBoss ~= nil then			
		--Start tracking the particular boss if the user has not disabled tracking for that boss
		if currentBoss.enabled then
			currentBoss.track()
		end
	else
		detectBoss()
	end
end

------------------------------------------------------
---- Core Functions
------------------------------------------------------

--Detect whether the user is in a party/raid or alone. This is used to output messages to the right chat channel.
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

--Where the player enters combat, check if any of the mobs/bosses need to be tracked or not
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
										core.currentAchievementID = core.Instances[expansion][instanceType][instance][boss].achievement

										--Display tracking achievement for that boss if partial variable is not false
										if core.Instances[expansion][instanceType][instance][boss].partial == false then
											core:getAchievementToTrack()
										end
									end
								end
							end

							--If boss does not have a nameplate then check the GUID for the id of the attacking unit
							if core.sourceID ~= nil then
								if string.find(core.sourceID, bossID) then
									currentBoss = core.Instances[expansion][instanceType][instance][boss]
									core.currentAchievementID = core.Instances[expansion][instanceType][instance][boss].achievement

									--Display tracking achievement for that boss if partial variable is not false
									if core.Instances[expansion][instanceType][instance][boss].partial == false then
										core:getAchievementToTrack()
									end
								end
							end
						end
					end					
                end
			end
		end
	end	
end

--Handle the output of messages to the chat system
function core:sendMessage(message)
	if message ~= lastMessageSent then
		SendChatMessage("[WIP] " .. message,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		lastMessageSent = message
	else
		--DEBUG
		print("Cannot Send Message: " .. message)
	end
end

--Display the "Tracking {achievement} for achievements"
function core:getAchievementToTrack()
	if core.achievementTrackedMessageShown == false then
		core:sendMessage("Tracking: "  .. GetAchievementLink(core.currentAchievementID))
		core.achievementTrackedMessageShown = true
	end
end

--Display the failed achievement message for achievements
function core:getAchievementFailed()
	if core.achievementFailed == false then
		core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED!")
		core.achievementFailed = true
	end
end

--Display the failed achievement message for achievements with message before
function core:getAchievementFailedWithMessageBefore(message)
	if core.achievementFailed == false then
		core:sendMessage(message .. " " .. GetAchievementLink(core.currentAchievementID) .. " FAILED!")
		core.achievementFailed = true
	end
end

--Display the failed achievement message for achievements with message after
function core:getAchievementFailedWithMessageAfter(message)
	if core.achievementFailed == false then
		core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED! " .. message)
		core.achievementFailed = true
	end
end

--Display the failed achievement message for achievements with message before and after
function core:getAchievementFailedWithMessageBeforeAndAfter(messageBefore, messageAfter)
	if core.achievementFailed == false then
		core:sendMessage(messageBefore .. " " .. GetAchievementLink(core.currentAchievementID) .. " FAILED! " .. messageAfter)
		core.achievementFailed = true
	end
end

--Display the requirements completed message for achievements
function core:getAchievementSuccess()
	if core.achievementCompleted == false then
		core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " requirements have been met. Boss can now be killed!")
		core.achievementCompleted = true
	end	
end

--Display the requirements completed message for achievements with message before
function core:getAchievementSuccessWithMessageBefore(message)
	if core.achievementCompleted == false then
		core:sendMessage(message .. " " .. GetAchievementLink(core.currentAchievementID) .. " requirements have been met. Boss can now be killed!")
		core.achievementCompleted = true
	end	
end

--Display the requirements completed message for achievements with message after
function core:getAchievementSuccessWithMessageAfter(message)
	if core.achievementCompleted == false then
		core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " requirements have been met. Boss can now be killed! " .. message)
		core.achievementCompleted = true
	end	
end

--Display the requirements completed message for achievements with message before and after
function core:getAchievementSuccessWithMessageBeforeAndAfter(messageBefore, messageAfter)
	if core.achievementCompleted == false then
		core:sendMessage(messageBefore .. " " .. GetAchievementLink(core.currentAchievementID) .. " requirements have been met. Boss can now be killed!" .. messageAfter)
		core.achievementCompleted = true
	end	
end

--Display the requirements completed message for achievements with custom message
function core:getAchievementSuccessWithCustomMessage(messageBefore, messageAfter)
	if core.achievementCompleted == false then
		core:sendMessage(messageBefore .. " " .. GetAchievementLink(core.currentAchievementID) .. " " .. messageAfter)
		core.achievementCompleted = true
	end	
end

function clearVariables()
	------------------------------------------------------
	---- Reset Variables
	------------------------------------------------------
	print("Resetting Variables")

	core.inCombat = false
	core.achievementFailed = false
	core.achievementCompleted = false
	core.achievementTrackedMessageShown = false
	core.lastMessageSent = nil

	--If a boss was pulled then clear the variables for that raid
	if instances ~= nil then
		core.instance:ClearVariables()
	end

	currentBoss = nil
end

--Check whether a table contains a certain value
function core:has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end