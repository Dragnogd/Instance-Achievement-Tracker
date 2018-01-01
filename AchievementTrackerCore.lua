--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

local events = CreateFrame("Frame")
local UIConfig
local UICreated = false
local addonVersion = 1

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
events:RegisterEvent("CHAT_MSG_ADDON")						--Allows the addon to communicate with other addons in the same party/raid
RegisterAddonMessagePrefix("Whizzey")						--Register events to listen out for client-client communication

--DEBUG
events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
events:RegisterEvent("UNIT_HEALTH")


local temp2 = {}

events:SetScript("OnEvent", function(self, event, ...)
	if event == "aaaUNIT_HEALTH" then
		print(UnitName(...) .. " : " .. UnitHealth(...))
	end
	if event == "aaaUNIT_SPELLCAST_SUCCEEDED" then

		local unitID, spell, rank, lineID, spellID = ...

		if core:has_value(temp2, spellID) == false then
			print(...)
			table.insert(temp2, spellID)
		end			

	end
    return self[event] and self[event](self, event, ...) 	--Allow event arguments to be called from seperate functions
end)

function events:onUpdate(sinceLastUpdate)
	self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate;
	if ( self.sinceLastUpdate >= 1 ) then -- in seconds
		-- do stuff here
		self.sinceLastUpdate = 0;
		local combatStatus = getCombatStatus()
		if combatStatus == false then
			clearVariables()
			print("Left Combat")
			events:SetScript("OnUpdate",nil)
		end
	end
end

--------------------------------------
-- Achievement Scanning Variables
--------------------------------------
local playersToScan = {}						--List of players that still need to be scanned to see which achievements they are missing for the current instance
local playersScanned = {}						--List of players that have been successfully scanned for the current instance
local rescanNeeded = false						--Set to true if a rescan is needed during a current scan. This is fired if the group size changes during a scan
local playerCurrentlyScanning = nil				--This is set to the current player that is being scanned
local scanInProgress = false					--Set to true when a scan of the group has started
local scanFinished = false						--Set to true when everyone in the group has been scanned successfully and no rescan is needed. Part of core so it can be accessed by the GUI
local scanAnnounced = false						--Whether the achievement scanning has been announced to the chat

--------------------------------------
-- Main Variables
--------------------------------------
core.masterAddon = false						--The master addon for the group. This stop multiple people with the addon outputting identical messages
core.playerRankInGroup = -1						--The rank of the player is the group. Used to sync multiple addons in the group
core.currentZoneID = nil						--The ID of the current instance the player is in
core.playerCount = 0							--The amount of players the instance lock can hold
core.inCombat = false							--Whether anyone in the current group is in combat with boss/mobs
core.achievementFailed = false					--Set to true when the requirements for a tracked achievement has failed
core.achievementCompleted = false				--Set to true when the requrements for a tracked achievement have been met
core.chatType = nil								--The chat type for the current group (say/party/raid)
core.achievementTrackedMessageShown = false		--Set to true when the message "Tracking {achievement}" is output to the chat so that it only outputs once per fight
core.groupSize = 1								--Amount of players currently in the group. Set to 1 by default
core.achievementIDs = {}						--Stores a list of the achievements to track for the current boss
core.achievementTrackingEnabled = false			--Whether the user wants to track achievements for the particular instance or not
local combatTimerStarted = false				--Used to determine if players in the group are still in combat with a boss
local lastMessageSent = ""   					--Stores the last message sent to the chat. This is used to prevent the same message being sent more than once in case of an error and to prevent unwanted spam
local enabledCheckSent = false					--Store whether the current addon sent the request to enable itself or not for achievement tracking


--------------------------------------
-- Current Instance Variables
--------------------------------------
core.inInstance = false
core.expansion = nil							--Current expansion of the particular instance
core.instanceType = nil							--Whether the instance is a dungeon or a raid
core.instance = nil								--Name of the instance the player is currently in
core.instanceNameSpaces = nil					--Instance name with spaces
core.foundBoss = false							--Whether or not a boss has been found to track or not
core.currentBosses = {}							--Stores a list of the bosses the player is currently attacking. (Can be mutliple if one boss has multiple achievements)
core.mobCache = {}								--Stores a list of mobs that have been checked to see whether or not they need to be tracked or not

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

function core:getGroupSize()
	local size = GetNumGroupMembers()

	if size == 0 then
		--If the size is 0 then player is not in a group. However we need to still set it to 1 since 0 players doesn't make sense
		core.groupSize = 1
	else
		core.groupSize = size
	end
end

function getPlayersInGroup()
	if scanAnnounced == false then
		core:printMessage("Starting Achievement Scan For " .. core.instanceNameSpaces .. " (This may lag your game for a few seconds)")
		scanAnnounced = true
	end
	core:getGroupSize()
	scanInProgress = true
	scanFinished = false
	local currentGroup = {}

	--instanceName = "BlackrockFoundary"

	print(core.currentZoneID)

	if core.groupSize > 1 then
		--We are in a group
		local currentUnit
		core:detectGroupType()
		for i = 1, core.groupSize do
			if core.chatType == "PARTY" then
				if i < core.groupSize then
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
				table.remove(playersToScan, i)
			end	
		end
	end

	--In playersScanned
	if #playersScanned > 0 then
		for i = #playersScanned, 1, -1 do
			if core:has_value(currentGroup, playersScanned[i]) == false then
				--Remove player from the table that generates the UI for that achievement
				for boss,_ in pairs(core.Instances[core.expansion][core.instanceType][core.instance]) do
					if boss ~= "name" then
						local name, _ = UnitName(playersScanned[i])
						table.remove(core.Instances[core.expansion][core.instanceType][core.instance][boss].players, name)
					end
				end

				--Update the GUI
				core.Config:Instance_OnClickAutomatic()

				table.remove(playersScanned, i)
			end	
		end
	end

	rescanNeeded = false
	updateDebugTable()

	--Start the player scanning
	if #playersToScan > 0 then
		getInstanceAchievements()
	else
		core:printMessage("Achievment Scanning Finished (" .. #playersScanned .. "/" .. core.groupSize .. ")")
		scanInProgress = false
		scanFinished = true
	end	
end

function getInstanceAchievements()
	ClearAchievementComparisonUnit()
	--Make sure the player we are about to scan is still in the group
	updateDebugTable()
	if UnitName(playersToScan[1]) ~= nil then
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
					core:printMessage("Achievment Scanning Finished (" .. #playersScanned .. "/" .. core.groupSize .. ")")
					scanInProgress = false
					scanFinished = true
					updateDebugTable()
				elseif #playersToScan == 0 and rescanNeeded == true then
					--print("Achievement Scanning Finished but some players still need scanning. Waiting 20 seconds then trying again (" .. #playersScanned .. "/" .. core.groupSize .. ")")
					C_Timer.After(10, function()
						scanInProgress = true
						getPlayersInGroup()
					end)
				end
			else
				--Last player to scan was not successfull
				rescanNeeded = true
				if playersToScan[1] ~= nil then
					--print("Cannot Scan " .. playersToScan[1])	
					table.remove(playersToScan, 1)				
				end			

				if #playersToScan > 0 then
					getInstanceAchievements()
				elseif #playersToScan == 0 and rescanNeeded == true then
					--print("Achievement Scanning Finished but some players still need scanning. Waiting 20 seconds then trying again (" .. #playersScanned .. "/" .. core.groupSize .. ")")
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
	--When player enters the world in an instance start the achievement scanner. Only start the scanner if the raid size has changed
	if GetNumGroupMembers() ~= core.groupSize then
		if scanInProgress == false then
			--print("Scan not in progress. Starting scan...")
			scanInProgress = true
			getPlayersInGroup()
		else
			--print("Scan in progress asking for rescan since group size has changed")
			rescanNeeded = true
		end
	end

	--Update the group size whenever the composition of the group changes
	core:getGroupSize()
end

function events:INSPECT_ACHIEVEMENT_READY()
	--Find the achievements for the raid the user has entered
	if UnitName(playerCurrentlyScanning) ~= nil then
		for boss,_ in pairs(core.Instances[core.expansion][core.instanceType][core.instance]) do
			if boss ~= "name" then
				local completed, month, day, year = GetAchievementComparisonInfo(core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
				--print(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " completed: " .. tostring(completed))

				--If the player has not completed the achievement then add them to the players string to display in the GUI
				--Temp: will show completed achievements in GUI since I've already completed all the achievements
				if completed ~= false then
					local name, _ = UnitName(playersToScan[1])
					table.insert(core.Instances[core.expansion][core.instanceType][core.instance][boss].players, name)
				end
			end
		end

		--print("Scanned " .. UnitName(playersToScan[1]))
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

function getInstanceInfomation()
	if IsInInstance() then
		print("Player is in an instance")
		local instanceCompatible = false
		core.inInstance = true
		core.instanceNameSpaces, _, core.difficultyID, _, core.maxPlayers, _, _, core.currentZoneID, _ = GetInstanceInfo()



		--Used to find correct table in the core.instances table
		local str = string.gsub(" " .. core.instanceNameSpaces, "%W%l", string.upper):sub(2)
		str = str:gsub("%s+", "")
		str = str:gsub("%-", "")
		str = str:gsub("%'", "")
		core.instance = str

		--Find the instance in the core.instances table so we can cache the value to be used later
		for expansion,_ in pairs(core.Instances) do
			for instanceType,_ in pairs(core.Instances[expansion]) do
				for instance,_ in pairs(core.Instances[expansion][instanceType]) do
					if instance == core.instance then
						core.expansion = expansion
						core.instanceType = instanceType
						core.instance = instance

						print("Expansion: " .. core.expansion)
						print("Instance Type: " .. core.instanceType)
						print("Instance: " .. core.instance)
					end
				end
			end
		end	
		
		--Check whether achievements can be earned for the instance the player has entered
		print("DifficultyID: " .. core.difficultyID)
		if core.difficultyID == 2 then
			--WOTLK/Cata/Mop/Wod heroic dungeons
			if core.expansion == "WrathOfTheLichKing" or core.expansion == "Cataclysm" or core.expansion == "MistsOfPandaria" or core.expansion == "WarlordsOfDraenor" then
				instanceCompatible = true
			end
		elseif core.difficultyID == 23 then
			if core.expansion == "Legion" then
				instanceCompatible = true
			end
		elseif core.difficultyID == 3 or core.difficultyID == 5 then
			--legacy10
			instanceCompatible = true
		elseif core.difficultyID == 4 or core.difficultyID == 6 then
			--legacy25
			instanceCompatible = true
		elseif core.difficultyID == 11 or core.difficultyID == 12 then
			--scenerios"
			if core.expansion == "MistsOfPandaria" then
				instanceCompatible = true
			end
		elseif core.difficultyID == 13 or core.difficultyID == 14 or core.difficultyID == 15 then
			--current
			instanceCompatible = true
		end		

		if instanceCompatible == true then
			--Ask the user whether they want to enable Achievement Tracking in the instance
			if UICreated == false then
				createEnableAchievementTrackingUI()
			else
				UIConfig:Show()
			end
		else
			print("You are not on the correct mode to earn achievements for this instance")
		end
	else
		core.inInstance = false
	end
end

function events:PLAYER_ENTERING_WORLD()
	getInstanceInfomation()
end

function events:ZONE_CHANGED_NEW_AREA()
	if UIConfig ~= nil then
		UIConfig:Hide()
	end

	getInstanceInfomation()
	
	if core.inInstance == false then
		--If user has left the instance then unregister events if they were registered
		print("Player has left instance. Unregestering events and resetting variables")
		events:UnregisterEvent("INSPECT_ACHIEVEMENT_READY") 			
		events:UnregisterEvent("GROUP_ROSTER_UPDATE")					
		events:UnregisterEvent("PLAYER_REGEN_DISABLED")				
		events:UnregisterEvent("PLAYER_REGEN_ENABLED")
		events:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		
		--Reset Instance Variables
		core.expansion = nil							
		core.instanceType = nil							
		core.instance = nil								
		core.instanceNameSpaces = nil					
		core.currentBosses = {}
		core.foundBoss = false							
		core.mobCache = {}
		
		--Reset Achievement Variabless
		playersToScan = {}						
		playersScanned = {}						
		rescanNeeded = false						
		playerCurrentlyScanning = nil				
		scanInProgress = false					
		scanFinished = false						
		scanAnnounced = false						
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
	UIConfig.content:SetText("Do you want to enable achievement tracking for: " .. core.instanceNameSpaces);
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

function events:CHAT_MSG_ADDON(self, prefix, message, channel, sender)	
	--Addon is checking who should be leader
	local name, realm = UnitName("Player")
	local nameSend, realmSend = strsplit("-", sender)
	if message == "enabledCheck" then
		if enabledCheckSent == true then
			--This Addon sent the message to ask for permission to run
			enabledCheckSent = false
		else
			--Another addon is requesting info about the addon
			SendAddonMessage("Whizzey", tostring(core.masterAddon) .. "," .. core.playerRankInGroup .. "," .. tostring(addonVersion), "RAID")
		end
	elseif string.match(message, "demote") then
		local nameFetched, realmFetched, message = strsplit("-", message)
		
		if nameFetched == name then
			--Demote this player
			--print("Demoting Myself...")
			core.masterAddon = false
		end
	elseif nameSend ~= name then
		--Other addons have returned the requested info

		--If the rank of other player is lower and they have addon enabled then let them to continue to run the addon
		local trackingEnabled, playerRank, adddonVersionOtherPlayer = strsplit(",", message);
		--(addonVersion ..  " : " .. adddonVersionOtherPlayer)
		if trackingEnabled == "true" and tonumber(playerRank) > core.playerRankInGroup and addonVersion<= tonumber(adddonVersionOtherPlayer) then
			--Player rank is lower than other players so not master addon and there addon version is higher or the same as yours
			print("Not enabling tracking output since a player running the addon has a higher rank than you")
			core.masterAddon = false
		elseif trackingEnabled == "true" and tonumber(playerRank) > core.playerRankInGroup and addonVersion> tonumber(adddonVersionOtherPlayer) then
			--PLayer rank is lower than other players so not master addon but the addon version of your addon is higher so take control
			print("Although rank is lower, you have a more updated version of the addon so promote yourself")
			core.masterAddon = true

			--Tell the user that was originally the leader they are no longer the leader
			print("Asking " .. sender .. " to demote themselves")
			SendAddonMessage("Whizzey", sender .. "-demote", "RAID")			
		elseif trackingEnabled == "true" and tonumber(playerRank) < core.playerRankInGroup and addonVersion>= tonumber(adddonVersionOtherPlayer) then
			--Player rank is higher than other players so set it the master addon and your addon version is higher or the same as theirs
			print("Setting master addon since player has highest rank so far in group")
			core.masterAddon = true

			--Tell the user that was originally the leader they are no longer the leader
			print("Asking " .. sender .. " to demote themselves")
			SendAddonMessage("Whizzey", sender .. "-demote", "RAID")
		elseif trackingEnabled == "true" and tonumber(playerRank) < core.playerRankInGroup and addonVersion< tonumber(adddonVersionOtherPlayer) then
			--PLayer rank is lower than other players so not master addon but the addon version is lower than the other player so do not take control
			print("Although rank is higher, player is running an older version of the addon so not not promote")
			core.masterAddon = false
		elseif trackingEnabled == "true" and tonumber(playerRank) == core.playerRankInGroup and addonVersion<= tonumber(adddonVersionOtherPlayer) then
			--Player rank is equal but other player is already running addon so let them run it instead and their addon version is higher or the same as yours
			print("Another player with the same rank is already running the addon: (" .. playerRank .. " : " .. core.playerRankInGroup .. ") " .. sender)
			core.masterAddon = false
		elseif trackingEnabled == "true" and tonumber(playerRank) == core.playerRankInGroup and addonVersion> tonumber(adddonVersionOtherPlayer) then
			--Player rank is equal but other player is already running addon but your addon version is higher so take control
			print("Although another player with the same rank is already running the addon. You have a higher addon version number so take control")
			core.masterAddon = true

			--Tell the user that was originally the leader they are no longer the leader
			--print("Asking " .. sender .. " to demote themselves")
			SendAddonMessage("Whizzey", sender .. "-demote", "RAID")			
		elseif trackingEnabled == "false" then
			--No one else is currently running the addon so take control
			print("Setting master addon since no one else is running the addon")
			core.masterAddon = true
		end
	end
end

function enableAchievementTracking(self)
	UIConfig:Hide()
	events:RegisterEvent("INSPECT_ACHIEVEMENT_READY") 			--Used for scanning players in the group to see which achievements they are missing
	events:RegisterEvent("GROUP_ROSTER_UPDATE")					--Used to find out when the group size has changed and to therefore initiate an achievement scan of the group
	events:RegisterEvent("PLAYER_REGEN_DISABLED")				--Used to detect when the player has entered combat and to reset tracked variables for bosses
	events:RegisterEvent("PLAYER_REGEN_ENABLED")				--Used to track when the player has left combat
	events:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	getPlayersInGroup()

	--Check if there is already someone else running the addon in the group / whether the priority is higher for the current player than other players running the addon
	if core.groupSize == 1 then
		--Player is not a group so run the addon
		core.masterAddon = true
		--print(UnitName("Player") .. " is the master addon")
	else
		--Get the permissions for the current player
		for i = 1, core.groupSize do
			local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
			if name == UnitName("Player") then
				--print("Found: " .. name)

				--print("Setting rank to: " .. rank)
				core.playerRankInGroup = rank
				
				--print("Sending Addon Message")
				SendAddonMessage("Whizzey", "enabledCheck", "RAID")
				enabledCheckSent = true
			end
		end
	end
end

function disableAchievementTracking(self)
	UIConfig:Hide()
end

function events:ADDON_LOADED(event, name)
	if name ~= "AchievementTracker" then return end

	SLASH_MENU1 = "/at"
	SlashCmdList.MENU = core.Config.Toggle

	core:printMessage("loaded. Version: " .. tonumber(addonVersion))
end

function events:PLAYER_REGEN_DISABLED()
 	core.inCombat = true
 	core:detectGroupType()
	print("Entered Combat")

	local isInstance, instanceType = IsInInstance()
	-- if isInstance == true and (instanceType == "party" or instanceType == "raid") and core.masterAddon == true then
		
	-- end

	--DEBUG
 	----print(UnitGUID("Boss1"))
 	----print(UnitGUID("Boss2"))		
end

function events:PLAYER_REGEN_ENABLED()
	--Although the player running the addon has left combat, the boss could still be in combat with other players. Check everyone else in the group to see if anyone is still in combat with the boss
	if getCombatStatus() == false then
		clearVariables()
		print("Left Combat")
		events:SetScript("OnUpdate",nil)
	else
		--Someone in the group is still in combat. Wait 1 second then check again
		events:SetScript("OnUpdate",events.onUpdate)
	end
end

function getCombatStatus()
	local playerInCombat = false
	if core.groupSize > 1 then
		--We are in a group
		local currentUnit
		core:detectGroupType()
		for i = 1, core.groupSize do
			if core.chatType == "PARTY" then
				if i < core.groupSize then
					currentUnit = "party" .. i
				else
					currentUnit = "player"				
				end
			elseif core.chatType == "RAID" then
				currentUnit = "raid" .. i
			end
			
			if currentUnit ~= nil then
				if UnitAffectingCombat(currentUnit) == true then
					playerInCombat = true
				end
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
	--All Events
	core.timeStamp, core.type, core.hideCaster, core.sourceGUID, core.sourceName, core.sourceFlags, core.sourceRaidFlags, core.destGUID, core.destName, core.destFlags, core.destRaidFlags = ...
	
	if string.match(core.type, "RANGE_") or string.match(core.type, "SPELL_") or string.match(core.type, "SPELL_PERIODIC_") or string.match(core.type, "SPELL_BUILDING_") then
		core.spellId, core.spellName, core.spellSchool = select(12, ...)

		if string.match(core.type, "_DAMAGE") then
			core.amount, core.overkill, core.school, core.resisted, core.blocked, core.absorbed, core.critical, core.glancing, core.crushing = select(15, ...)
		elseif string.match(core.type, "_MISSED") then
			core.missType, core.isOffHand, core.amountMissed = select(15, ...)
		elseif string.match(core.type, "_HEAL") then
			core.amount, core.overhealing, core.absorbed, core.critical = select(15, ...)
		elseif string.match(core.type, "_ENERGIZE") then
			core.amount, core.powerType = select(15, ...)
		elseif string.match(core.type, "_DRAIN") or string.match(core.type, "_LEECH") then
			core.amount, core.powerType, core.extraAmount = select(15, ...)
		elseif string.match(core.type, "_INTERRUPT") or string.match(core.type, "_DISPEL_FAILED") then
			core.extraSpellId, core.extraSpellName,	core.extraSchool = select(15, ...)
		elseif string.match(core.type, "_DISPEL") or string.match(core.type, "_STOLEN") then
			core.extraSpellId, core.extraSpellName, core.extraSchool, core.auraType = select(15, ...)
		elseif string.match(core.type, "_EXTRA_ATTACKS") then
			core.amount = select(15, ...)
		elseif string.match(core.type, "_AURA_APPLIED") or string.match(core.type, "_AURA_REMOVED") or string.match(core.type, "_AURA_APPLIED_DOSE") or string.match(core.type, "_AURA_REMOVED_DOSE") or string.match(core.type, "_AURA_REFRESH") then
			core.auraType, core.amount = select(15, ...)
		elseif string.match(core.type, "_AURA_BROKEN") then
			core.auraType = select(15, ...)
		elseif string.match(core.type, "_AURA_BROKEN_SPELL") then
			core.extraSpellId, core.extraSpellName, core.extraSchool, core.auraType = select(15, ...)
		elseif string.match(core.type, "_CAST_FAILED") then
			core.failedType = select(15, ...)
		end
	elseif string.match(core.type, "SWING_") then
		if string.match(core.type, "_DAMAGE") then
			core.amount, core.overkill, core.school, core.resisted, core.blocked, core.absorbed, core.critical, core.glancing, core.crushing = select(12, ...)
		elseif string.match(core.type, "_MISSED") then
			core.missType, core.isOffHand, core.amountMissed = select(12, ...)
		elseif string.match(core.type, "_HEAL") then
			core.amount, core.overhealing, core.absorbed, core.critical = select(12, ...)
		elseif string.match(core.type, "_ENERGIZE") then
			core.amount, core.powerType = select(12, ...)
		elseif string.match(core.type, "_DRAIN") or string.match(core.type, "_LEECH") then
			core.amount, core.powerType, core.extraAmount = select(12, ...)
		elseif string.match(core.type, "_INTERRUPT") or string.match(core.type, "_DISPEL_FAILED") then
			core.extraSpellId, core.extraSpellName,	core.extraSchool = select(12, ...)
		elseif string.match(core.type, "_DISPEL") or string.match(core.type, "_STOLEN") then
			core.extraSpellId, core.extraSpellName, core.extraSchool, core.auraType = select(12, ...)
		elseif string.match(core.type, "_EXTRA_ATTACKS") then
			core.amount = select(12, ...)
		elseif string.match(core.type, "_AURA_APPLIED") or string.match(core.type, "_AURA_REMOVED") or string.match(core.type, "_AURA_APPLIED_DOSE") or string.match(core.type, "_AURA_REMOVED_DOSE") or string.match(core.type, "_AURA_REFRESH") then
			core.auraType, core.amount = select(12, ...)
		elseif string.match(core.type, "_AURA_BROKEN") then
			core.auraType = select(12, ...)
		elseif string.match(core.type, "_AURA_BROKEN_SPELL") then
			core.extraSpellId, core.extraSpellName, core.extraSchool, core.auraType = select(12, ...)
		elseif string.match(core.type, "_CAST_FAILED") then
			core.failedType = select(12, ...)
		end		
	elseif string.match(core.type, "ENVIRONMENTAL_") then
		core.environmentalType = select(12, ...)

		if string.match(core.type, "_DAMAGE") then
			core.amount, core.overkill, core.school, core.resisted, core.blocked, core.absorbed, core.critical, core.glancing, core.crushing = select(13, ...)
		elseif string.match(core.type, "_MISSED") then
			core.missType, core.isOffHand, core.amountMissed = select(13, ...)
		elseif string.match(core.type, "_HEAL") then
			core.amount, core.overhealing, core.absorbed, core.critical = select(13, ...)
		elseif string.match(core.type, "_ENERGIZE") then
			core.amount, core.powerType = select(13, ...)
		elseif string.match(core.type, "_DRAIN") or string.match(core.type, "_LEECH") then
			core.amount, core.powerType, core.extraAmount = select(13, ...)
		elseif string.match(core.type, "_INTERRUPT") or string.match(core.type, "_DISPEL_FAILED") then
			core.extraSpellId, core.extraSpellName,	core.extraSchool = select(13, ...)
		elseif string.match(core.type, "_DISPEL") or string.match(core.type, "_STOLEN") then
			core.extraSpellId, core.extraSpellName, core.extraSchool, core.auraType = select(13, ...)
		elseif string.match(core.type, "_EXTRA_ATTACKS") then
			core.amount = select(13, ...)
		elseif string.match(core.type, "_AURA_APPLIED") or string.match(core.type, "_AURA_REMOVED") or string.match(core.type, "_AURA_APPLIED_DOSE") or string.match(core.type, "_AURA_REMOVED_DOSE") or string.match(core.type, "_AURA_REFRESH") then
			core.auraType, core.amount = select(13, ...)
		elseif string.match(core.type, "_AURA_BROKEN") then
			core.auraType = select(13, ...)
		elseif string.match(core.type, "_AURA_BROKEN_SPELL") then
			core.extraSpellId, core.extraSpellName, core.extraSchool, core.auraType = select(13, ...)
		elseif string.match(core.type, "_CAST_FAILED") then
			core.failedType = select(13, ...)
		end
	end

	if string.match(core.sourceGUID, "Creature") or string.match(core.destGUID, "Creature") then
		--GUID for a creature
		core.unitTypeSrc, _, _, _, _, core.sourceID, core.spawn_uid = strsplit("-", core.sourceGUID)
		core.unitType, _, _, _, _, core.destID, core.spawn_uid_dest = strsplit("-", core.destGUID)	
	elseif 	string.match(core.sourceGUID, "Player") or string.match(core.destGUID, "Player") then
		--GUID for a player
		core.unitTypeSrcPlayer, _, _, _, _, core.sourceIDPlayer, core.spawn_uidPlayer = strsplit("-", core.sourceGUID)
		core.unitTypePlayer, core.destIDPlayer, core.spawn_uid_dest_Player = strsplit("-", core.destGUID)
	end

	--Boss Detection!
	if core.foundBoss == true then			
		--Start tracking the particular boss if the user has not disabled tracking for that boss
		if core.currentBoss[].enabled then
			currentBoss.track()
		end

		--TODO loop through each boss here aswell to run tracking
	else
		--Check if any of the 5 nameplates have caches boss ID and whether source and dest GUID have been stored or not
		for i = 1, 5 do
			if UnitGUID("boss" .. i) ~= nil then
				local _, _, _, _, _, bossID, _ = strsplit("-", UnitGUID("boss" .. i))
				if bossID ~= nil then
					if core:has_value(core.mobCache, bossID) == false then
						detectBoss()
					end
				end
			end
		end

		if core.sourceID ~= nil then
			--print(core.sourceID)
			if core:has_value(core.mobCache, core.sourceID) == false then
				detectBoss()
			end
		end	
		
		if core.destID ~= nil then
			--print(core.destID)
			if core:has_value(core.mobCache, core.destID) == false then
				detectBoss()
			end
		end

		--If boss was found then track the boss
		if currentBoss ~= nil then
			if currentBoss.enabled then			
				currentBoss.track()
			end
		end
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
	for boss,_ in pairs(core.Instances[core.expansion][core.instanceType][core.instance]) do
		if core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs ~= nil then
			for i = 1, #core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs do
				local bossID = core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs[i]
				for j = 1, 5 do
					if UnitGUID("boss" .. j) ~= nil then
						print(UnitGUID("boss" .. j))
						if string.find(UnitGUID("boss" .. j), bossID) then
							table.insert(core.currentBosses, core.Instances[core.expansion][core.instanceType][core.instance][boss])
							table.insert(core.achievementIDs, core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
							core.foundBoss = true
							print("Found Boss: ")
							print(core.Instances[core.expansion][core.instanceType][core.instance][boss])
						else
							--This boss does not have tracking so add to mob cache
							local _, _, _, _, _, bossID2, _ = strsplit("-", UnitGUID("boss" .. j))
							table.insert(core.mobCache, bossID2)
							print("Adding to cache: " .. bossID2)
						end
					end
				end

				--If boss does not have a nameplate then check the GUID for the id of the attacking unit
				if core.foundBoss == false then
					if core.sourceID ~= nil then
						if string.find(core.sourceID, bossID) then
							table.insert(core.currentBosses, core.Instances[core.expansion][core.instanceType][core.instance][boss])
							table.insert(core.achievementIDs, core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
							core.foundBoss = true
							print("Found Boss:")
						else
							--This boss does not have tracking so add to mob cache
							table.insert(core.mobCache, core.sourceID)
							print("Adding to cache: " .. core.sourceID)
						end
					elseif core.destID ~= nil then
						if string.find(core.destID, bossID) then
							table.insert(core.currentBosses, core.Instances[core.expansion][core.instanceType][core.instance][boss])
							table.insert(core.achievementIDs, core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
							core.foundBoss = true
							print("Found Boss:")
						else
							--This mob does not have tracking so add to mob cache
							table.insert(core.mobCache, core.destID)
							print("Adding to cache: " .. core.destID)
						end							
					end				
				end
			end
		end					
	end
	
	if core.foundBoss == true then
		--Display tracking achievement for that boss if partial variable is not false and boss was found and tracking is enabled
		core:getAchievementToTrack()
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

function core:printMessage(message)
	print("|cff00ccffAchievement Tracker: |cffffffff" .. message)
end

--Display the "Tracking {achievement} for achievements"
function core:getAchievementToTrack()
	if core.achievementTrackedMessageShown == false then
		print("Length of array: " .. #core.currentBosses)
		for i = 1, #core.currentBosses do
			print(core.currentBosses[i].partial)
			if core.currentBosses[i].partial == false and core.currentBosses[i].enabled == true then
				core:sendMessage("Tracking: "  .. GetAchievementLink(core.achievementIDs[i]))
				core.achievementTrackedMessageShown = true
			end
		end
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
	print(core.instance)
	if core.instance ~= nil then
		core[core.instance]:ClearVariables()
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