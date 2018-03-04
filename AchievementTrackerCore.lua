--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

local events = CreateFrame("Frame")
local UIConfig
local UICreated = false
local debugMode = true

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

-- local events = CreateFrame("Frame", "AchievementTracker2", UIParent, "OptionsFrameListTemplate")
-- events:SetSize(800, 500)
-- events:SetPoint("CENTER") --Center of the screen

events:RegisterEvent("ADDON_LOADED")						--Used to setup the slash commands for the addon
events:RegisterEvent("PLAYER_ENTERING_WORLD")				--Used to detect if player is inside an instance when they enter the world
events:RegisterEvent("ZONE_CHANGED_NEW_AREA")				--Used to detect if player is inside an instance when they change zone
events:RegisterEvent("CHAT_MSG_ADDON")						--Allows the addon to communicate with other addons in the same party/raid
RegisterAddonMessagePrefix("Whizzey")						--Register events to listen out for client-client communication

--DEBUG
events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
events:RegisterEvent("UNIT_HEALTH")
events:RegisterEvent("UNIT_AURA")


local temp2 = {}
TargetLogData = {}

events:SetScript("OnEvent", function(self, event, ...)
	if event == "aaaUNIT_HEALTH" then
		print(UnitName(...) .. " : " .. UnitHealth(...))
	end
	if event == "UNIT_SPELLCAST_SUCCEEDED" then

		local unitID, spell, rank, lineID, spellID = ...

		--print(spellID)

		if core:has_value(temp2, spellID) == false then
			--print(...)
			table.insert(temp2, spellID)
			table.insert(TargetLogData, spell .. " : " .. spellID)
		end

		if spellID == 208116 then
			print(...)
		end

		
	end
	if event == "aaaUNIT_AURA" then

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
			clearInstanceVariables()
			clearVariables()
			core:sendDebugMessage("Left Combat")
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
core.scanFinished = false						--Set to true when everyone in the group has been scanned successfully and no rescan is needed. Part of core so it can be accessed by the GUI
local scanAnnounced = false						--Whether the achievement scanning has been announced to the chat

--------------------------------------
-- Main Variables
--------------------------------------
core.currentZoneID = nil						--The ID of the current instance the player is in
core.playerCount = 0							--The amount of players the instance lock can hold
core.inCombat = false							--Whether anyone in the current group is in combat with boss/mobs
core.achievementsFailed = {}					--Set to true when the requirements for a tracked achievement has failed
core.achievementsCompleted = {}					--Set to true when the requrements for a tracked achievement have been met
core.chatType = nil								--The chat type for the current group (say/party/raid)
core.achievementTrackedMessageShown = false		--Set to true when the message "Tracking {achievement}" is output to the chat so that it only outputs once per fight
core.groupSize = 1								--Amount of players currently in the group. Set to 1 by default
core.achievementIDs = {}						--Stores a list of the achievements to track for the current boss
core.achievementTrackingEnabled = false			--Whether the user wants to track achievements for the particular instance or not
core.playersFailedPersonal = {}					--List of players that have failed a personal achievement. Resets when you exit combat
core.playersSuccessPersonal = {}
local combatTimerStarted = false				--Used to determine if players in the group are still in combat with a boss
local lastMessageSent = ""   					--Stores the last message sent to the chat. This is used to prevent the same message being sent more than once in case of an error and to prevent unwanted spam
local requestToRun = false					--Store whether the current addon sent the request to enable itself or not for achievement tracking
local enableDisplayAchievement = true
local currentBossNums = {}

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
core.instanceVariablesReset = true				--Whether the instance variables have reset after leaving an instance

--------------------------------------
-- Boss functions
--------------------------------------
core.mobCounter = 0								--Used in the trackMob function to see how many of a certain type of mob have currently spawned
core.mobUID = {}								--Used in the trackMob function to store the unique UID of each mob of a certain type that has spawned
core.thresholdAnnounced = false					--Used to check whether the trackMob funciton has announced the requirements have been met
core.encounterStarted = false
core.displayAchievements = false

--------------------------------------
-- Addon Syncing V1.0.1a
--------------------------------------
local majorVersion = 0						--Addon with a higher major version change have priority over a lower major version
local minorVersion = 3						--Addon with a minor version change have prioirty over a lower minor version
local revisionVersion = 0					--Addon with a revision change have the same priorty as a lower revision verison
local masterAddon = false					--The master addon for the group. This stop multiple people with the addon outputting identical messages. Reset at the end of every fight
local playerRank = -1						--The rank of the player is the group. Players with higher rank get priorty over outputting messages unless they have an outdated addon
local addonID = 0


--OLD used to create a seperate table for tracking current table values
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

--Get the current size of the group
function core:getGroupSize()
	local size = GetNumGroupMembers()

	if size == 0 then
		--If the size is 0 then player is not in a group. However we need to still set it to 1 since 0 players doesn't make sense
		core.groupSize = 1
	else
		core.groupSize = size
	end
end

------------------------------------------------------
---- Players Achievements Functions
------------------------------------------------------

--Get a list of all the players currently in the group. This is used so we can scan all the players in the group to see which achievements they need
--This is run everytime the composition of the group changes so we always have an up to date list of players who need a certain achievement
function getPlayersInGroup()
	if scanAnnounced == false then
		core:printMessage("Starting Achievement Scan For " .. core.instanceNameSpaces .. " (This may lag your game for a few seconds)")
		scanAnnounced = true
	end
	core:getGroupSize()
	scanInProgress = true
	core.scanFinished = false
	local currentGroup = {}

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
		core.scanFinished = true
	end
end

--Used to fetch achievement information for each player in the group. This is used so players can see and output which players in the group are missing which achievements
--TODO: have a limit on the amount of times a certain player is scanned. This is needed so we are not constantly scanning players that are offline or players who never enter the instance
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
					core.scanFinished = true
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

------------------------------------------------------
---- Achievement Tracking Setup
------------------------------------------------------

--Run when the player initially enters an instance to setup variables such as instanceName, expansion etc so we can track the correct bosses
function getInstanceInfomation()
	if IsInInstance() and core.inInstance == false then
		core:sendDebugMessage("Player has entered instance")
		local instanceCompatible = false --Check whether player is on correct difficulty to earn achievements
		core.inInstance = true
		core.instanceVariablesReset = false
		core.instanceNameSpaces, _, core.difficultyID, _, core.maxPlayers, _, _, core.currentZoneID, _ = GetInstanceInfo()

		--Used to find correct table in the core.instances table
		local str = string.gsub(" " .. core.instanceNameSpaces, "%W%l", string.upper):sub(2)
		str = str:gsub("%s+", "")
		str = str:gsub("%-", "")
		str = str:gsub("%'", "")
		str = str:gsub("%:", "")
		str = str:gsub("%,", "")

		core.instance = str --Instance name without any puntuation
		core.instanceClear = core.instance --Instance name with puntuation

		core:sendDebugMessage("Offical Instance Name: " .. core.instance .. " " .. core.instanceClear)

		--If the raid is in the lich king expansion then detect whether player is on the 10man or 25man difficulty
		--This is only needed for raids that have seperate achievements for 10man and 25man. Happens for the majority of WOTLK raids
		if core.instance == "TrialOfTheCrusader" or core.instance == "Naxxramas" then
			if core.difficultyID == 3 then
				--10 Man
				core.instance = core.instance .. "10Man"
			elseif core.difficultyID == 4 then
				--25 Man
				core.instance = core.instance .. "25Man"
			end
		end

		--Find the instance in the core.instances table so we can cache the value to be used later
		for expansion,_ in pairs(core.Instances) do
			for instanceType,_ in pairs(core.Instances[expansion]) do
				for instance,_ in pairs(core.Instances[expansion][instanceType]) do
					if instance == core.instance then
						core.expansion = expansion
						core.instanceType = instanceType
						core.instance = instance

						core:sendDebugMessage("Expansion: " .. core.expansion)
						core:sendDebugMessage("Instance Type: " .. core.instanceType)
						core:sendDebugMessage("Instance: " .. core.instance)
					end
				end
			end
		end

		--Check whether achievements can be earned for the instance the player has entered
		core:sendDebugMessage("DifficultyID: " .. core.difficultyID)
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
		elseif core.difficultyID == 7 or core.difficultyID == 17 and debugMode == true then
			instanceCompatible = true
		end

		if instanceCompatible == true then
			--Check if the instance has any achievements to actually track
			local foundTracking = false
			for boss,_ in pairs(core.Instances[core.expansion][core.instanceType][core.instance]) do
				if core.Instances[core.expansion][core.instanceType][core.instance][boss].track ~= nil then
					foundTracking = true
				end
			end

			--Ask the user whether they want to enable Achievement Tracking in the instance. Only do this if there is any achievements to track for the particular instance
			if foundTracking == true then
				core:sendDebugMessage("Asking user whether they want to track this instance")
				if UICreated == false then
					core:sendDebugMessage("Creating Tracking UI")
					createEnableAchievementTrackingUI()
				else
					core:sendDebugMessage("Displaying Tracking UI since it was already created")
					UIConfig:Show()
				end
			else
				core:sendDebugMessage("No Achievements to track for this instance")
			end
		else
			core:sendDebugMessage("Achievements cannot be earned for the following difficulty " .. core.difficultyID)
		end
	elseif IsInInstance() == false and core.inInstance == true then
		core.inInstance = false
	end
end

--Run if we need to setup additional events/variables for a certain instance. For example if we need to track additional events such as messages from bosses
function initialInstanceSetup()
	--Used to start certain events for some instances so we don't have to run them when they are not needed
	if pcall(function() core[core.instanceClear]:InitialSetup() end) == true then
		core[core.instanceClear]:InitialSetup()
	end
end

--Create the achievement tracking UI if it is not already been created
--This will ask the user if they want to enable acheivement tracking for the current instance the player has entered
--It will only show in instances where there are achievements to be tracked and they are on the correct difficulty to earn acheivements
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

--Players wants to track achievements for this instance
function enableAchievementTracking(self)
	core.achievementTrackingEnabled = true
	UIConfig:Hide()

	--Register Events
	events:RegisterEvent("INSPECT_ACHIEVEMENT_READY") 			--Used for scanning players in the group to see which achievements they are missing
	events:RegisterEvent("GROUP_ROSTER_UPDATE")					--Used to find out when the group size has changed and to therefore initiate an achievement scan of the group
	events:RegisterEvent("PLAYER_REGEN_DISABLED")				--Used to detect when the player has entered combat and to reset tracked variables for bosses
	events:RegisterEvent("PLAYER_REGEN_ENABLED")				--Used to track when the player has left combat
	events:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")			--Used to track the completion/failiure of achievements
	events:RegisterEvent("ENCOUNTER_START")						--Used to detect the start of a boss fight
	events:RegisterEvent("ENCOUNTER_END")						--Used to detect the end of a boss fight

	--Start the achievement scan
	getPlayersInGroup()

	--Addon Syncing Priority:
	--1.) Highest Version Number of addon
	--2.) Raid Leader / Party Leader
	--3.) Raid Assistant
	--4.) Member

	--Setup the instance events if required
	initialInstanceSetup()

	--Get a random ID between 1 and 100,000
	addonID = random(1,100000)

	--Check if there is already someone else running the addon in the group / whether the priority is higher for the current player than other players running the addon
	if core.groupSize == 1 then
		--Player is not a group so set the player to the master addon
		core.masterAddon = true
		core:printMessage("Achievement Tracking Enabled for " .. core.instanceNameSpaces)
	else
		--Get the rank for the current player
		for i = 1, core.groupSize do
			local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
			if name == UnitName("Player") then
				--Send out message so other adds can add new player to their arrays
				playerRank = rank
			end
		end
	end
end

--Hide the achievment tracking UI once the player has left the instance
function disableAchievementTracking(self)
	UIConfig:Hide()
end

--Used to detect when everyone in the group has left combat so we can reset global and instance variables
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

------------------------------------------------------
---- Events
------------------------------------------------------

--Setup Slash Commands
function events:ADDON_LOADED(event, name)
	if name ~= "InstanceAchievementTracker" then return end

	SLASH_MENU1 = "/at"
	SlashCmdList.MENU = core.Config.Toggle

	SLASH_MENU2 = "/debug"
	SlashCmdList.DEBUG = function()
		if debugMode == true then
			core:printMessage("Debugging Disabled")
			debugmode = false
		else
			core:printMessage("Debugging Enabled")
			debugMode = true
		end
	end

	core:printMessage("loaded. Version: V" .. majorVersion .. "." .. minorVersion .. "." .. revisionVersion)

	if debugMode == true then
		core:sendMessage("Debugging Enabled")
	end

	--------------------------------------
	-- Minimap Icon
	--------------------------------------
	local ATButton = LibStub("LibDBIcon-1.0")
	local profile

	-- LDB
	if not LibStub:GetLibrary("LibDataBroker-1.1", true) then return end

	--Make an LDB object
	local MiniMapLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("InstanceAchievementTracker", {
		type = "launcher",
		text = "InstanceAchievementTracker",
		icon = "Interface\\Icons\\ACHIEVEMENT_GUILDPERK_MRPOPULARITY",
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("|cff00FF00" .. "Instance Achievement Tracker" .. "|r");
		end,
		OnClick = function(self, button)
			core.Config.Toggle()
		end,
	})

	--Register Minimap Icon
	ATButton:Register("InstanceAchievementTracker", MiniMapLDB, nil);

	--Show Minimap Icon
	ATButton:Show("InstanceAchievementTracker")
end

--Fired whenever the composition of the group changes.
--Used to alter size of group variables and which player in group is running the master addon
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

	--Update the rank of the current player incase it has changed
	for i = 1, core.groupSize do
		local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
		if name == UnitName("Player") then
			--Send out message so other adds can add new player to their arrays
			playerRank = rank
			core:sendDebugMessage("Setting rank to: " .. rank)
		end
	end
end

--Fired when a user engages a boss. Used to output to chat which achievement is currently being tracked
--Does not fire for all bosses or sometimes fires too late into the fight so some fight manually call the achievement tracking functions
--Does not get called for achievements which are not part of a boss fight so achievement tracking is calling manually once per session for those achievements
function events:ENCOUNTER_START()
	core:sendDebugMessage("---Encounter Started---")
	table.insert(TargetLogData, "---Encounter Started---")
	core.encounterStarted = true

	if core.displayAchievements == true then
		core:getAchievementToTrack()
		core.disableAchievementTracking = false
	end
end

--Fired when a users has finished engaging a boss. This is used to make sure achievement tracking is not fired when the player is not attacking a boss
function events:ENCOUNTER_END()
	core:sendDebugMessage("---Encounter Ended---")
	table.insert(TargetLogData, "---Encounter Ended---")
	core.encounterStarted = false
end

--This event is used to scan players in the group to see which achievements they are currently missing
function events:INSPECT_ACHIEVEMENT_READY()
	--Find the achievements for the raid the user has entered
	if UnitName(playerCurrentlyScanning) ~= nil then
		for boss,_ in pairs(core.Instances[core.expansion][core.instanceType][core.instance]) do
			if boss ~= "name" then
				local completed, month, day, year = GetAchievementComparisonInfo(core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
				--print(GetAchievementLink(core.Instances[expansion][instanceType][instance][boss].achievement) .. " completed: " .. tostring(completed))

				--If the player has not completed the achievement then add them to the players string to display in the GUI
				--Temp: will show completed achievements in GUI since I've already completed all the achievements
				if completed ~= true then
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

--Fired when the players has finished loading in the world.
--Used to detect whether the player is in an instance and if so it will setup the instance variables for that instance
--This is done so we know which achievements we need to be tracking and so we know which achievements to scan the players in the group for
function events:PLAYER_ENTERING_WORLD()
	getInstanceInfomation()
end

--Fired when the player enters a new zone.
--Used to detect whether the player is in an instance and if so it will setup the instance variables for that instance
--This is done so we know which achievements we need to be tracking and so we know which achievements to scan the players in the group for
--It is also used to disable tracking for a instance once the player has left that particular instance
function events:ZONE_CHANGED_NEW_AREA()
	if UIConfig ~= nil and core.inInstance == false then
		core:sendDebugMessage("Hiding Tracking UI")
		UIConfig:Hide()
	end

	getInstanceInfomation()

	if core.inInstance == false and core.instanceVariablesReset == false then
		--If user has left the instance then unregister events if they were registered
		core:sendDebugMessage("Player has left instance. Unregestering events and resetting variables")
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
		core.instanceVariablesReset = true --This is done so we only reset instance variables once, rather than everytime the player changes zone

		--Reset Achievement Variabless
		playersToScan = {}
		playersScanned = {}
		rescanNeeded = false
		playerCurrentlyScanning = nil
		scanInProgress = false
		core.scanFinished = false
		scanAnnounced = false
	end
end

--Used to communicate between everyone in the group using the addon to decide which addon is the master addon
--The master addon is detected at the start of every fight so we don't have to worry about if a player is in the instance/offline etc
function events:CHAT_MSG_ADDON(self, prefix, message, channel, sender)
	--Addon is checking who should be leader
	local name, realm = UnitName("Player")
	local nameSend, realmSend = strsplit("-", sender)

	if string.match(message, "demote") then
		--Another addon has requested that this adodn demotes itself
		local nameFetched, realmFetched, message = strsplit("-", message)

		if nameFetched == name then
			--Demote this player
			core:sendDebugMessage("Demoting Myself...")
			core.masterAddon = false
		end
	elseif string.match(message, "info") then
		--Other addons have returned the requested info
		local info, addonIDRecieved, nameRecieved, masterAddonRecieved, playerRankRecieved, majorVersionRecieved, minorVersionRecieved = strsplit(",", message)
		local demotionRequired = false

		if nameRecieved ~= name then
			if masterAddonRecieved ~= nil then
				core:sendDebugMessage("------------NEW REQUEST------------")
				core:sendDebugMessage("Recieved Info From: " .. sender)
				core:sendDebugMessage("AddonID: " .. addonIDRecieved .. " : " .. tostring(addonID))
				core:sendDebugMessage("Master Addon: " .. masterAddonRecieved .. " : " .. tostring(masterAddon))
				core:sendDebugMessage("Player Rank: " .. playerRankRecieved .. " : " .. tostring(playerRank))
				core:sendDebugMessage("Major Version: " .. majorVersionRecieved .. " : " .. tostring(majorVersion))
				core:sendDebugMessage("Minor Version: " .. minorVersionRecieved .. " : " .. tostring(minorVersion))
			end

			if masterAddonRecieved == "true" then
				if tonumber(majorVersionRecieved) < majorVersion then
					--Major version recieved from other player is lower so set this addon to the master addon
					core:sendDebugMessage("1: " .. sender .. " has a lower major version. Setting this addon to master")
					masterAddon = true
					demotionRequired = true
				elseif tonumber(majorVersionRecieved) == majorVersion and tonumber(minorVersionRecieved) < minorVersion then
					--Major version recieved from other player is the same but other player has lower minor version so set this addon to the master addon
					core:sendDebugMessage("2: " .. sender .. " has a lower minor version. Setting this addon to master")
					masterAddon = true
					demotionRequired = true
				elseif tonumber(majorVersionRecieved) == majorVersion and tonumber(minorVersionRecieved) == minorVersion and tonumber(playerRankRecieved) < playerRank then
					core:sendDebugMessage("3: " .. sender .. " has a lower rank. Setting this addon to master")
					--Other player has same major and minor version but has lower rank than this addon so set this addon to the master addon
					masterAddon = true
					demotionRequired = true
				elseif tonumber(majorVersionRecieved) == majorVersion and tonumber(minorVersionRecieved) == minorVersion and tonumber(playerRankRecieved) == playerRank and tonumber(addonIDRecieved) < addonID then
					--Other player has exact same requirements but has lower addonID so set this addon to the master addon
					core:sendDebugMessage("3: " .. sender .. " has a lower Addon ID. Setting this addon to master")
					masterAddon = true
					demotionRequired = true
				elseif tonumber(majorVersionRecieved) == majorVersion and tonumber(minorVersionRecieved) == minorVersion and tonumber(playerRankRecieved) == playerRank and tonumber(addonIDRecieved) == addonID then
					--Everything about the 2 addons are completely identical. Keep rolling for a random new addonID number until it's different from the one recieved
					core:sendDebugMessage("5: " .. sender .. " Both addon have the same requirements. Rolling random Addon ID number until a difference is found")
					while addonIDRecieved == addonID do
						addonID = random(1,100000)

						if addonIDRecieved < addonID then
							masterAddon = true
							demotionRequired = true
						else
							masterAddon = false
						end
					end
				else
					core:sendDebugMessage("4: " .. sender .. " has better requirements. Not setting this addon to master")
					--Other addon has the better requirements so this addon should not be the master addon
					masterAddon = false
				end
			elseif masterAddonRecieved == "false" then
				--Other player addon is not master addon so set this addon to the master addon
				core:sendDebugMessage("5: " .. sender .. " is not the master addon. Setting this addon to master")
				masterAddon = true
			end
		end

		--Other addon has lower requirements so ask them to demote themself
		if demotionRequired == true then
			core:sendDebugMessage("Asking " .. sender .. " to demote themselves")
			SendAddonMessage("Whizzey", sender .. "-demote", "RAID")
		end
	end
end

--Fired when a player has entered combat. Used to detect bosses and when we need to reset variables between boss fights
function events:PLAYER_REGEN_DISABLED()
	core.inCombat = true
	core:detectGroupType()
   	core:sendDebugMessage("Entered Combat")

   --DEBUG
	----core:sendDebugMessage(UnitGUID("Boss1"))
	----core:sendDebugMessage(UnitGUID("Boss2"))
end

--Fired when a player has left combat. Used to reset variables between boss fights
function events:PLAYER_REGEN_ENABLED()
   --Although the player running the addon has left combat, the boss could still be in combat with other players. Check everyone else in the group to see if anyone is still in combat with the boss
   if getCombatStatus() == false then
	   clearInstanceVariables()
	   clearVariables()
	   core:sendDebugMessage("Left Combat")
	   events:SetScript("OnUpdate",nil)
   else
	   --Someone in the group is still in combat. Wait 1 second then check again
	   events:SetScript("OnUpdate",events.onUpdate)
   end
end

--Used to monitor the combat log so we can track achievements. The variables change depending on the information being recieved from the combat log
function events:COMBAT_LOG_EVENT_UNFILTERED(self, ...)
	--All Events
	core.timeStamp, core.type, core.hideCaster, core.sourceGUID, core.sourceName, core.sourceFlags, core.sourceRaidFlags, core.destGUID, core.destName, core.destFlags, core.destRaidFlags = ...

	--core:sendDebugMessage(core.type .. " " .. core.sourceName .. " " .. core.destName)

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

	if string.match(core.sourceGUID, "Creature") or string.match(core.destGUID, "Creature") or string.match(core.sourceGUID, "Vehicle") or string.match(core.destGUID, "Vehicle") then
		--GUID for a creature
		core.unitTypeSrc, _, _, _, _, core.sourceID, core.spawn_uid = strsplit("-", core.sourceGUID)
		core.unitType, _, _, _, _, core.destID, core.spawn_uid_dest = strsplit("-", core.destGUID)
		core.currentUnit = "Creature"
	end

	if string.match(core.sourceGUID, "Player") or string.match(core.destGUID, "Player") then
		--GUID for a player
		core.unitTypeSrcPlayer, _, _, _, _, core.sourceIDPlayer, core.spawn_uidPlayer = strsplit("-", core.sourceGUID)
		core.unitTypePlayer, core.destIDPlayer, core.spawn_uid_dest_Player = strsplit("-", core.destGUID)
		core.currentUnit = "Player"
	end

	--Boss Detection!
	if core.foundBoss == true then
		--Start tracking the particular boss if the user has not disabled tracking for that boss
		for i = 1, #core.currentBosses do
			if core.currentBosses[i].enabled == true then
				core.currentBosses[i].track()
			end
		end
	else
		--Check if any of the 5 nameplates have caches boss ID and whether source and dest GUID have been stored or not
		local doNotTrack = false
		for i = 1, 5 do
			if UnitGUID("boss" .. i) ~= nil and UnitIsDead("boss" .. i) == false and UnitIsEnemy("Player", "boss" .. i) == true then
				local _, _, _, _, _, bossID, _ = strsplit("-", UnitGUID("boss" .. i))
				if bossID ~= nil then
					if core:has_value(core.mobCache, bossID) == false then
						core:sendDebugMessage("Calling Detect Boss 1: " .. bossID)
						detectBoss(bossID)
					end
				end
			elseif UnitIsDead("boss" .. i) == true then
				doNotTrack = true
			end
		end

		if core.sourceID ~= nil and doNotTrack == false and core.currentUnit == "Creature" then
			--core:sendDebugMessage(core.sourceID)
			if core:has_value(core.mobCache, core.sourceID) ~= true then
				core:sendDebugMessage("Calling Detect Boss 2: " .. core.sourceID)
				--print(...)
				detectBoss(core.sourceID)
			end
		end

		if core.destID ~= nil and doNotTrack == false and core.currentUnit == "Creature" then
			--core:sendDebugMessage(core.destID)

			if core:has_value(core.mobCache, core.destID) == false then
				core:sendDebugMessage("Calling Detect Boss 3: " .. core.destID)
				--print(...)
				detectBoss(core.destID)
			end
		end

		--Start tracking the particular boss if the user has not disabled tracking for that boss
		for i = 1, #core.currentBosses do
			if core.currentBosses[i].enabled == true then
				core.currentBosses[i].track()
			end
		end

		--Track additional variables for the instance if they are not tied to a boss/encounter
		if pcall(function() core[core.instanceClear]:TrackAdditional() end) == true then
			core[core.instanceClear]:TrackAdditional()
		end
	end
end

------------------------------------------------------
---- Detection Function
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
function detectBoss(id)
	core:sendDebugMessage("Found the following boss ID: " .. id)
	for boss,_ in pairs(core.Instances[core.expansion][core.instanceType][core.instance]) do
		if core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs ~= nil then
			if #core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs > 0 then
				--core:sendDebugMessage(#core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs)
				for i = 1, #core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs do
					local bossID = core.Instances[core.expansion][core.instanceType][core.instance][boss].bossIDs[i]
					if string.find(id, bossID) then
						if core:has_value(currentBossNums, boss) == false then
							core:sendDebugMessage("Adding the following boss: " .. boss)
							table.insert(core.currentBosses, core.Instances[core.expansion][core.instanceType][core.instance][boss])
							table.insert(currentBossNums, boss)
						end
						if core:has_value(core.achievementIDs, core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement) == false then
							core:sendDebugMessage("Adding the following achievement ID beacuse it doesn't exist: " .. core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
							table.insert(core.achievementIDs, core.Instances[core.expansion][core.instanceType][core.instance][boss].achievement)
						end
						core.foundBoss = true
					end
				end
			end
		end
	end

	if core.foundBoss == true then
		--Display tracking achievement for that boss if partial variable is not false and boss was found and tracking is enabled and encounter has started
		if core.encounterStarted == true then
			core:getAchievementToTrack()
		else
			core.displayAchievements = true
		end
	else
		--core:sendDebugMessage("ID not found. Need to add to cache")
		--This boss does not have tracking so add to mob cache
		if core:has_value(core.mobCache, id) ~= true then
			table.insert(core.mobCache, id)
			--core:sendDebugMessage("Adding to cache: " .. id)
		end
	end
end

--Display the "Tracking {achievement} for achievements"
--TODO: concatenate multiple achievements to print out in 1 message / split up to reduce amount of messages being sent
function core:getAchievementToTrack()
	if core.achievementTrackedMessageShown == false then
		core:sendDebugMessage("Length of array: " .. #core.currentBosses)
		for i = 1, #core.currentBosses do
			core:sendDebugMessage("Achievement: " .. core.currentBosses[i].achievement)
			if core.currentBosses[i].partial == false and core.currentBosses[i].enabled == true then
				core:printMessage("Tracking: "  .. GetAchievementLink(core.currentBosses[i].achievement))
				core.achievementTrackedMessageShown = true
			end

			--Setup failed and completed achievements table
			table.insert(core.achievementsFailed, false)
			table.insert(core.achievementsCompleted, false)
		end
	end
end

------------------------------------------------------
---- Messaging Functions
------------------------------------------------------

--Output messages to the chat. All messages get sent this function for easy management
function core:sendMessage(message)
	if message ~= lastMessageSent then
		if debugMode == false then
			if masterAddon == true then
				SendChatMessage("[IAT] " .. message,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			else
				if requestToRun == false then
					requestToRun = true

					--Broadcast addon info to decide whether it should be the master addon or not
					masterAddon = true
					local name, realm = UnitName("Player")
					SendAddonMessage("Whizzey", "info," .. tostring(addonID) .. "," .. name .. "," .. tostring(masterAddon) .. "," .. tostring(playerRank) .. "," .. tostring(majorVersion) .. "," .. tostring(minorVersion), "RAID")

					C_Timer.After(3, function()
						if masterAddon == true then
							core:printMessage("This addon is in charge of outputting messages")
							SendChatMessage("[IAT] " .. message,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
						else
							core:printMessage("Another addon is currently in charge of outputting messages for this fight")
						end
					end)
				end
			end
		elseif debugMode == true then
			core:sendDebugMessage("[DEBUG] " .. message)
		end
		lastMessageSent = message
	else
		--DEBUG
		core:sendDebugMessage("Cannot Send Message: " .. message)
	end

	--When a chat message needs to be sent, If the addon is not the master addon then request if there is currently a master addon in the group for the particular fight
	--The master addon check will be reset after every boss fight so we don't have to worry about players out of range/offline players etc
end

function core:sendMessage2(message)
	if debugMode == false then
		SendChatMessage("[IAT] " .. message,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	else
		print("[DEBUG] " .. message)
	end
end

--Output messages depending on a counter and the specified interval
function core:sendMessageDelay(message, counter, interval)
	if counter - math.floor(counter/interval)*interval == 0 then
		core:sendMessage(message)
	end
end

--Output debug messages to the chat for testing purposes
function core:sendDebugMessage(message)
	if debugMode == true then
		print("[DEBUG] " .. message)
	end
end

--TODO: tidy this up so it can print out any colour
function core:printMessage(message)
	print("|cff00ccffAchievement Tracker: |cffffffff" .. message)
end

--Get the current achievement being tracked for custom output messages
function core:getAchievement(index)
	local value = index
	if index == nil then
		value = 1
	end
	return GetAchievementLink(core.achievementIDs[value])
end

------------------------------------------------------
---- Failed Achievment Functions
------------------------------------------------------

--Display the failed achievement message for achievements
function core:getAchievementFailed(index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsFailed[value] == false then
		core:sendMessage(GetAchievementLink(core.achievementIDs[value]) .. " FAILED!")
		core.achievementsFailed[value] = true
	end
end

--Display the failed achievement message for achievements with message before
function core:getAchievementFailedWithMessageBefore(message, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsFailed[value] == false then

		core:sendMessage(message .. " " .. GetAchievementLink(core.achievementIDs[value]) .. " FAILED!")
		core.achievementsFailed[value] = true
	end
end

--Display the failed achievement message for achievements with message after
function core:getAchievementFailedWithMessageAfter(message, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsFailed[value] == false then
		core:sendMessage(GetAchievementLink(core.achievementIDs[value]) .. " FAILED! " .. message)
		core.achievementsFailed[value] = true
	end
end

--Display the failed achievement message for achievements with message before and after
function core:getAchievementFailedWithMessageBeforeAndAfter(messageBefore, messageAfter, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsFailed[value] == false then
		core:sendMessage(messageBefore .. " " .. GetAchievementLink(core.achievementIDs[value]) .. " FAILED! " .. messageAfter)
		core.achievementsFailed[value] = true
	end
end

--Display the failed achievement message for personal achievements
function core:getAchievementFailedPersonal(index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.playersFailedPersonal[core.destName] == nil then
		--Players has not been hit already
		--Check if the player actually needs the achievement
		if core:has_value(core.currentBosses[value].players, core.destName) then
			--Player needs achievement but has failed it
			core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.achievementIDs[value]) .. " (Personal Achievement)")
		end
		core.playersFailedPersonal[core.destName] = true
	end
end

--Display the failed achievement message for personal achievements with reason
function core:getAchievementFailedPersonalWithReason(reason, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.playersFailedPersonal[core.destName] == nil then
		--Players has not been hit already
		--Check if the player actually needs the achievement
		if core:has_value(core.currentBosses[value].players, core.destName) then
			--Player needs achievement but has failed it
			core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.achievementIDs[value]) .. " (Personal Achievement) (Reason: " .. reason .. ")")
		end
		core.playersFailedPersonal[core.destName] = true
	end
end

------------------------------------------------------
---- Completed Achievment Functions
------------------------------------------------------

--Display the requirements completed message for achievements
function core:getAchievementSuccess(index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsCompleted[value] == false then
		core:sendMessage(GetAchievementLink(core.achievementIDs[value]) .. " requirements have been met. Boss can now be killed!")
		core.achievementsCompleted[value] = true
	end
end

--Display the requirements completed message for achievements with message before
function core:getAchievementSuccessWithMessageBefore(message, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsCompleted[value] == false then
		core:sendMessage(message .. " " .. GetAchievementLink(core.achievementIDs[value]) .. " requirements have been met. Boss can now be killed!")
		core.achievementsCompleted[value] = true
	end
end

--Display the requirements completed message for achievements with message after
function core:getAchievementSuccessWithMessageAfter(message, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsCompleted[value] == false then
		core:sendMessage(GetAchievementLink(core.achievementIDs[value]) .. " requirements have been met. Boss can now be killed! " .. message)
		core.achievementsCompleted[value] = true
	end
end

--Display the requirements completed message for achievements with message before and after
function core:getAchievementSuccessWithMessageBeforeAndAfter(messageBefore, messageAfter, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsCompleted[value] == false then
		core:sendMessage(messageBefore .. " " .. GetAchievementLink(core.achievementIDs[value]) .. " requirements have been met. Boss can now be killed!" .. messageAfter)
		core.achievementsCompleted[value] = true
	end
end

--Display the requirements completed message for achievements with custom message
function core:getAchievementSuccessWithCustomMessage(messageBefore, messageAfter, index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.achievementsCompleted[value] == false then
		core:sendMessage(messageBefore .. " " .. GetAchievementLink(core.achievementIDs[value]) .. " " .. messageAfter)
		core.achievementsCompleted[value] = true
	end
end

--Display the failed achievement message for personal achievements
function core:getAchievementSuccessPersonal(index)
	local value = index
	if index == nil then
		value = 1
	end
	if core.playersSuccessPersonal[core.destName] == nil then
		--Players has not been hit already
		--Check if the player actually needs the achievement
		if core:has_value(core.currentBosses[value].players, core.destName) then
			--Player needs achievement but has failed it
			core:sendMessage(core.destName .. " has completed " .. GetAchievementLink(core.achievementIDs[value]) .. " (Personal Achievement)")
		end
		core.playersSuccessPersonal[core.destName] = true
	end
end

------------------------------------------------------
---- Tracking certain achievement objectives
------------------------------------------------------

function core:trackMob(mobID, mobName, threshold, message, interval, trackAchiev, id)
    --Add detected
    if core.sourceID == mobID and core.mobCounter <= threshold and core.thresholdAnnounced == false then
        if core.mobUID[core.spawn_uid] == nil and core.mobUID[core.spawn_uid] ~= "Dead" then
            core.mobUID[core.spawn_uid] = core.spawn_uid
            core.mobCounter = core.mobCounter + 1
			core:sendMessageDelay(mobName ..  " Counter (" .. core.mobCounter .. "/" .. threshold .. ")",core.mobCounter,interval)
			--core:sendDebugMessage(core.mobCounter)
        end
    end
    if core.destID == mobID and core.mobCounter <= threshold and core.thresholdAnnounced == false then
        if core.mobUID[core.spawn_uid_dest] == nil and core.mobUID[core.spawn_uid_dest] ~= "Dead" then
            core.mobUID[core.spawn_uid_dest] = core.spawn_uid_dest
            core.mobCounter = core.mobCounter + 1
			core:sendMessageDelay(mobName .. " Counter (" .. core.mobCounter .. "/" .. threshold ..")",core.mobCounter,interval)
			--core:sendDebugMessage(core.mobCounter)
        end
	end

	--Unit Died
	if core.type == "UNIT_DIED" and core.destID == mobID and core.mobCounter > 0 then
        core.mobUID[core.spawn_uid_dest] = "Dead"
		core.mobCounter = core.mobCounter - 1
		--core:sendDebugMessage(core.mobCounter)
	end

	--Requirements Met
	if core.mobCounter >= threshold and core.thresholdAnnounced == false and trackAchiev == nil then
		core.thresholdAnnounced = true
		core:sendMessage(core:getAchievement() .. message)
	elseif core.mobCounter >= threshold and core.thresholdAnnounced == false and trackAchiev ~= nil then
		core:getAchievementSuccess(id)
	end
end

function core:trackAura(auraID, maxCount, type)
	core:detectGroupType()
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
		elseif core.chatType == "SAY" then
			unit = "player"
		end

		local count = 0
		local name, rank, icon, castingTime, minRange, maxRange, spellID = GetSpellInfo(auraID)
		if type == "debuff" then
			if unit ~= nil then
				_, _, _, count, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ = UnitDebuff(unit, name)
			end
		end

		if count ~= nil then
			if count >= maxCount then
				return true
			end
		end
	end
end

------------------------------------------------------
---- Resetting variables between fights
------------------------------------------------------

--Clears global variables between fights such as the current boss/achievement being tracked
function clearVariables()
	------------------------------------------------------
	---- Reset Variables
	------------------------------------------------------
	core:sendDebugMessage("Resetting Global Variables")

	core.inCombat = false
	core.achievementsFailed = {}
	core.achievementsCompleted = {}
	core.achievementTrackedMessageShown = false
	core.foundBoss = false
	core.playersFailedPersonal = {}
	lastMessageSent = nil

	core.mobCounter = 0
	core.mobUID = {}
	core.thresholdAnnounced = false
	core.displayAchievements = false

	core.currentBosses = {}
	core.achievementIDs = {}
	currentBossNums = {}

	currentBoss = nil

	--Addon Syncing variables
	masterAddon = false
	requestToRun = false
end

--Clears variables for the current instance the player is in
function clearInstanceVariables()
	--If a boss was pulled then clear the variables for that raid
	if core.instance ~= nil then
		core[core.instanceClear]:ClearVariables()
	end
end

------------------------------------------------------
---- Utility Functions
------------------------------------------------------

--Check whether a table contains a certain value
function core:has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function core:getHealthPercent(boss)
	return (UnitHealth(boss) / UnitHealthMax(boss)) * 100
end