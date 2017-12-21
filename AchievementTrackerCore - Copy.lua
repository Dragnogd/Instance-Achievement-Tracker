--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

--local events = CreateFrame("Frame")

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

events:SetScript("OnEvent", function(self, event, ...)
   -- Automatically call the method for this event, if it exists
   -- Note: This allows the event argument to be called from seperate functions to make the code cleaner
   return self[event] and self[event](self, event, ...)
end)

--------------------------------------
-- Main Variables
--------------------------------------
local currentZoneID

--------------------------------------
-- Achievement Scanning Variables
--------------------------------------
local playersToScan = {}
local playersScanned = {}
local playersWaitingToScan = {}
local scanInProgress = false
local playerCurrentlyScanning
local instanceName
local rescanNeeded = false
local playerScanInProgress = false

function updateDebugTable()
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
end

function getPlayersInGroup()
	instanceName = "HellfireCitadel"
	updateDebugTable()
	if playerScanInProgress == false then
		playerScanInProgress = true
		--print("Starting Player Achievement Scan...")
		local currentGroup = {}
		if GetNumGroupMembers() > 0 then
			--We are in a group
			local currentUnit
			AchievementTracker_detectGroupType()
			for i = 1, GetNumGroupMembers() do
				if AchievementTracker_chatType == "PARTY" then
					if i < GetNumGroupMembers() then
						currentUnit = "party" .. i
					else
						currentUnit = "player"				
					end
				elseif AchievementTracker_chatType == "RAID" then
					currentUnit = "raid" .. i
				end

				local name, realm = UnitName(currentUnit)
				if has_value(playersScanned, name) == false and has_value(playersToScan, name) == false and has_value(playersWaitingToScan, name) == false and name ~= "Unknown" then
					table.insert(playersToScan, name)
					--print("Adding: " .. name)
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
			instanceName = nil
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
				if has_value(currentGroup, playersToScan[i]) == false then
					--print("Removing: " .. playersToScan[i])
					table.remove(playersToScan, i)
				end	
			end
		end

		--In playersScanned
		if #playersScanned > 0 then
			for i = #playersScanned, 1, -1 do
				if has_value(currentGroup, playersScanned[i]) == false then
					--print("Removing: " .. playersScanned[i])
					table.remove(playersScanned, i)
				end	
			end
		end

		--In playersWaitingToScan
		if #playersWaitingToScan > 0 then
			for i = #playersWaitingToScan, 1, -1 do
				if has_value(currentGroup, playersWaitingToScan[i]) == false then
					--print("Removing: " .. playersWaitingToScan[i])
					table.remove(playersWaitingToScan, i)
				end	
			end
		end

		rescanNeeded = false
		playerScanInProgress = false
		--print("Size of group: " .. (#playersToScan + #playersScanned + #playersWaitingToScan))
		
		updateDebugTable()

		--Start the player scanning
		if #playersToScan > 0 then
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
			--print("Scanning " .. UnitName(playersToScan[1]))
			playerCurrentlyScanning = playersToScan[1]
			SetAchievementComparisonUnit(playersToScan[1])

			--If the INSPECT_ACHIEVEMENT_READY event is not called after 5 seconds then we can assume the user was out of scanning range or has left the group
			C_Timer.After(5, function()
				--Make sure the player we are about to scan is still in the group
				if UnitName(playerCurrentlyScanning) ~= nil then
					if playerCurrentlyScanning == playersToScan[1] then
						--Player cannot be scanned at the moment so add them to a playersWaitingToScan
						--print("Cannot Scan: " .. UnitName(playerCurrentlyScanning))
						local name, _ = UnitName(playerCurrentlyScanning)
						table.insert(playersWaitingToScan, name)			
						table.remove(playersToScan, 1)
						scanInProgress = false

						if #playersToScan == 0 then
							print("Achievement Scanning Finished")
							updateDebugTable()

							--If players are still waiting to be scanned. Wait 1 minute then try again
							if #playersWaitingToScan > 0 then
								print("Players still need scanning. Waiting 60 seconds then trying again")
								C_Timer.After(20, function()
									--Move players from waiting to scan back into to playersToScan
									for i = 1, #playersWaitingToScan do
										table.insert(playersToScan, playersWaitingToScan[i])
									end
									playersWaitingToScan = {}
									getPlayersInGroup()
								end)
							end
						else
							--Players still need scanning
							getInstanceAchievements()
						end
					end	
				else
					--The player must have left the group so remove than from the array and recall the function
					getPlayersInGroup()							
				end
			end)
		else
			--The player must have left the group so remove than from the array and recall the function
			getPlayersInGroup()
		end
	else
		--Group size has changed so update list of players in table
		getPlayersInGroup()
	end
end

--Run this code once when the addon has finished loading
function events:ADDON_LOADED(event, name)
	if name ~= "AchievementTracker" then return end

	SLASH_MENU1 = "/at"
	SlashCmdList.MENU = core.Config.Toggle

	--print(name .. " loaded")
end

--When the group size changes, restart the scan to add/remove players from the achievements lists
function events:GROUP_ROSTER_UPDATE()
	if scanInProgress == true then
		--print("Group Size Changed: Requesting Rescan")
		rescanNeeded = true
	else
		--print("Group Size Changed: Searching for players in group")
		getPlayersInGroup()
	end
end

--Run this code once the comparison unit has been initalized successfully
function events:INSPECT_ACHIEVEMENT_READY()
	if true then
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
								if completed == true then
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
		scanInProgress = false
		
		if #playersToScan == 0 then
			print("Achievement Scanning Finished")
			updateDebugTable()

			--If players are still waiting to be scanned. Wait 1 minute then try again
			if #playersWaitingToScan > 0 then
				print("Players still need scanning. Waiting 60 seconds then trying again")
				C_Timer.After(20, function()
					--Move players from waiting to scan back into to playersToScan
					for i = 1, #playersWaitingToScan do
						table.insert(playersToScan, playersWaitingToScan[i])
					end
					playersWaitingToScan = {}
					getPlayersInGroup()
				end)
			end
		else
			--Players still need scanning
			getInstanceAchievements()
		end
	else
		--The player must have left the group so remove than from the array and recall the function
		getPlayersInGroup()
	end
end

function events:PLAYER_ENTERING_WORLD()
	local _, _, difficultyID, _, maxPlayers, _, _, mapID, _ = GetInstanceInfo()
	currentZoneID = mapID
	--print(currentZoneID)

	--When player enters the world in an instance start the achievement scanner
	if currentZoneID == 1448 then
		--print("Hellfire Citadel")
		instanceName = "HellfireCitadel"
		getPlayersInGroup()
	end
	
end

function events:ZONE_CHANGED_NEW_AREA()
	--When player enters the world in an instance start the achievement scanner
	resetInstanceAchievements()
	if currentZoneID == 1448 then
		--print("Hellfire Citadel")
		getPlayersInGroup()
	end
end


------------------------------------------------------
---- Global Variables
------------------------------------------------------
AchievementTracker_achievementFailed = false
AchievementTracker_achievementFailed2 = false
AchievementTracker_achievementFailed3 = false
AchievementTracker_achievementFailed4 = false
AchievementTracker_achievementFailed5 = false
AchievementTracker_achievementCompleted = false
AchievementTracker_chatType = nil
AchievementTracker_partialTrack = false
AchievementTracker_playerCount = 0
AchievementTracker_displayTracked = false
AchievementTracker_displayTracked2 = false
AchievementTracker_displayTracked3 = false
AchievementTracker_displayTracked4 = false
AchievementTracker_inCombat = false
AchievementTracker_currentZoneID = nil

------------------------------------------------------
---- Local Variables
------------------------------------------------------

local bosses = {36612, 36855, 37215, 37813, 36789, 36853, 36626, 36627, 36678, 37970, 37955, 36597, 33113, 68036, 71543, 69712, 77325, 76865, 76906, 76973, 76974, 76814, 77477, 77557, 77231, 95068, 52558, 41570, 42178, 42179, 42180, 42166, 41378, 43296, 41442, 41270, 41376, 44600, 45992, 45993, 43324, 52530, 52498, 53494, 53691, 53619, 55308, 55312, 55294, 56598, 53879, 56173, 60583, 60586, 60585, 62442, 71543, 71475, 71479, 71480, 72276, 71734, 72311, 71466, 71515, 71454, 73720, 71512, 71529, 71504, 62983, 60999, 71158, 71152, 71155, 71153, 71157, 71160, 71156, 71154, 71161, 71865, 68476, 67977, 69017, 68078, 68905, 68904, 62980, 62164, 63053, 62837, 60009, 90018, 90284, 92144, 92146, 92142, 90378, 90435, 90199, 90316, 89890, 93068, 90296, 76806, 77692, 93439, 91349}
local mode
local displayTracked = false
local displayTracked3 = false
local displayTracked4 = false


local currentSubZone = nil
local total = 0 -- OnUpdate Timer

local tmpStop = false

local ashCount = 0
local tmpName = nil;

local countert = 0

local ashPlayers = {}

------------------------------------------------------
---- EVENTS
------------------------------------------------------
events:RegisterEvent("PLAYER_REGEN_DISABLED")
events:RegisterEvent("PLAYER_REGEN_ENABLED")
events:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("ZONE_CHANGED_INDOORS")
events:RegisterEvent("INSPECT_ACHIEVEMENT_READY")
events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
events:RegisterEvent("CHAT_MSG_PARTY")
events:RegisterEvent("CHAT_MSG_PARTY_LEADER")
events:RegisterEvent("CHAT_MSG_RAID")
events:RegisterEvent("CHAT_MSG_RAID_LEADER")
events:RegisterEvent("CHAT_MSG_SAY")
events:RegisterEvent("CHAT_MSG_WHISPER")
events:RegisterEvent("UNIT_AURA")

events:RegisterEvent("UNIT_HEALTH")

-- events:SetScript("OnUpdate", function(self, elapsed)
-- 	if AchievementTracker_currentZoneID == 631 then --Icecrown Citadel
-- 		if currentBoss == 36789 then --Valithria Dreamwalker
-- 			Icecrown_ValithriaDreamwalker(false)
-- 		end
-- 	elseif AchievementTracker_currentZoneID == 603 then --Ulduar
-- 		local subzone = GetSubZoneText()
-- 		if subzone == "Iron Concourse" and currentBoss == nil then
-- 			currentBoss = "FlameLeviathanTrash"
-- 		end
-- 	end
-- end)

-- events:SetScript("OnEvent", function(self, event, ...)

-- 	if event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_PARTY_LEADER" or event == "CHAT_MSG_RAID" or type == "CHAT_MSG_RAID_LEADER" or type == "CHAT_MSG_SAY" or "CHAT_MSG_WHISPER" then
-- 		local message, sender = select(1,...)
-- 		Icecrown_BloodQueenLanathel(false,true,message,sender)
-- 	end
	
-- 	if event == "PLAYER_ENTERING_WORLD" then
-- 		local _, _, difficultyID, _, maxPlayers, _, _, mapID, _ = GetInstanceInfo()
-- 		AchievementTracker_playerCount = maxPlayers
-- 		if(difficultyID == 5 or difficultyID == 6) then
-- 			mode = "heroic"
-- 		else
-- 			mode = "normal"
-- 		end
-- 		--print(mapID)
-- 		AchievementTracker_currentZoneID = mapID

-- 		if GetPlayerMapPosition("Player") == nil then
-- 			--print("In A Restricted Area")
-- 		end
-- 	end

-- 	if event == "PLAYER_REGEN_DISABLED" then
-- 		--print("You have entered combat")
-- 		clearVariables()
-- 		AchievementTracker_inCombat = true
-- 		AchievementTracker_detectGroupType()

-- 		--DEBUG
-- 		--print(UnitGUID("Boss1"))
-- 		----print(UnitGUID("Boss2"))		
-- 	end

-- 	if event == "PLAYER_REGEN_ENABLED" then
-- 		--print("You have left combat")
-- 		clearVariables()
-- 	end

-- 	if event == "ZONE_CHANGED_INDOORS" then
-- 		local zone = GetZoneText()
-- 		local subzone = GetSubZoneText()
-- 		currentZone = GetZoneText()
-- 		currentSubZone = subzone
-- 		--print("Current Zone is: " .. zone)
-- 		--print("Current Subzone is: " .. subzone)

-- 		AchievementTracker_detectGroupType()
-- 		if subzone == "The Sanctum of Blood" then
-- 			Icecrown_BloodQueenLanathel(true, false,nil,nil)
-- 		end
-- 	end

-- 	if event == "CHAT_MSG_MONSTER_YELL" then
-- 		local message, sender = select(1,...)
-- 		AchievementTracker_detectGroupType()
		
-- 		if string.find(message, "I have opened a portal into the Dream") then
-- 			AchievementTracker_portalsSpawned = true
-- 		end
-- 	end

-- 	-- if event == "UNIT_HEALTH" then
-- 	-- 	local unitID = select(1,...)
-- 	-- 	local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
-- 	-- 	----print((UnitHealth(unitID) / 10832000) * 100 .. "% : " .. UnitName(unitID) .. " : " .. spawn_uid_dest)

-- 	-- 	if AchievementTracker_currentZoneID == 1136 then --Siege Of Orgrimmar
-- 	-- 		if currentBoss == 71543 then --Immerseus
-- 	-- 			SiegeOfOrgrimmar_Immerseus(spawn_uid_dest, unitID, destID)
-- 	-- 		end
-- 	-- 	elseif AchievementTracker_currentZoneID == 1448 then --Hellfire Citadel		
-- 	-- 		if currentBoss == 95068 then --Hellfire Assualt (Siegemaster Mar'tak)
-- 	-- 			HellfireCitadel_HellfireAssualt(unitID)
-- 	-- 		end
-- 	-- 	end
-- 	-- end

-- 	------------------------------------------------------
-- 	---- COMBAT LOG EVENTS
-- 	------------------------------------------------------
-- 	local timestamp, type, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _ = ...

-- 	if (event == "COMBAT_LOG_EVENT_UNFILTERED") and AchievementTracker_inCombat == true then
-- 		--If the current boss is nil then get the type of group the user is in and the boss they are currently attacking

-- 		AchievementTracker_detectGroupType()
-- 		detectBoss()

-- 		--If the boss has been found then we can load the tracker for that particular boss
-- 		if currentBoss ~= nil then
-- 			local spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = select(12, ...)
			
-- 			--For a Creature
-- 			local unitTypeSrc, _, _, _, _, sourceID, spawn_uid = strsplit("-",sourceGUID);
-- 			local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-",destGUID);

-- 			--For a Player
-- 			local unitTypePlayer, destIDPlayer, spawn_uid_dest_Player = strsplit("-",destGUID);
			
-- 			if AchievementTracker_currentZoneID == 631 then --Icecrown Citadel
-- 				if currentBoss == 36612 then --Lord Marrowgar
-- 					Icecrown_LordMarrowgar(spellId, type, destName)
-- 				elseif currentBoss == 36855 then --Lady Deathwhisper
-- 					Icecrown_LadyDeathwhisper(type, overkill, sourceName, destName)
-- 				elseif currentBoss == 37215 then --The Skybreaker(Gunship Battle)
-- 					Icecrown_GunshipBattle(type, sourceName, spellId, timestamp)
-- 				elseif currentBoss == 37813 then --Deathbringer Saurfang
-- 					Icecrown_DeathbringerSaurfang(type,spellId)
-- 				elseif currentBoss == 36789 then --Valithria Dreamwalker
-- 					if AchievementTracker_portalsSpawned == true then
-- 						Icecrown_ValithriaDreamwalker(true)
-- 					else
-- 						Icecrown_ValithriaDreamwalker(false)
-- 					end
-- 				elseif currentBoss == 36853 then --Sindragosa
-- 					local spellId, spellName, spellSchool, auraType, amount = select(12, ...)
-- 					Icecrown_Sindragosa(type, spellId, amount, destName, unitType)
-- 				elseif currentBoss == 36626 then --Festergut
-- 					local spellId, spellName, spellSchool, auraType, amount = select(12, ...)
-- 					Icecrown_Festergut(type, spellId, amount, destName, unitType)
-- 				elseif currentBoss == 36627 then --Rotface
-- 					Icecrown_Rotface(type, spellId)
-- 				elseif currentBoss == 36678 then --Professor Putricide
-- 					Icecrown_ProfessorPutricide(type, spellId)
-- 				elseif currentBoss == 37970 then --Blood Prince Council
-- 					--Swing Damage
-- 					local swingAmount = select(12, ...)
-- 					Icecrown_BloodPrinceCouncil(type, unitType, amount, destName, swingAmount)
-- 				elseif currentBoss == 37955 then --Blood-Queen Lana'thel
-- 					Icecrown_BloodQueenLanathel(false, false,nil,nil,type,spellId,destName)
-- 				elseif currentBoss == 36597 then --Lich King
-- 					Icecrown_LichKing()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 603 then --Ulduar
-- 				if currentBoss == 33113 then --Flame Leviathan
-- 					local spellId, spellName, spellSchool, auraType, amount = select(12, ...)
-- 					Ulduar_FlameLeviathan(type, spellId, destID, sourceName)
-- 				elseif currentBoss == "FlameLeviathanTrash" then
-- 					Ulduar_FlameLeviathanTrash(spawn_uid, sourceID, type, spawn_uid_dest)
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 1098 then --Throne of Thunder
-- 				if currentBoss == 68476 then --Horridon
-- 					ThroneOfThunder_Horridon(type, destID)
-- 				elseif currentBoss == 67977 then --Tortos
-- 					ThroneOfThunder_Tortos(type, spellId, destID)
-- 				elseif currentBoss == 69712 then --Ji-Kun
-- 					ThroneOfThunder_JiKun(type, spellId, destName)
-- 				elseif currentBoss == 68036 then --Durumu The Fotgotten
-- 					ThroneOfThunder_DurumuTheForgotten(type, destName)
-- 				elseif currentBoss == 69017 then --Primordius
-- 					ThroneOfThunder_Primordius(type, spellId, destName)
-- 				elseif currentBoss == 68078 then --Iron Qon
-- 					ThroneOfThunder_IronQon(type, spellId, destName)
-- 				elseif currentBoss == 68905 or currentBoss == 68904 then
-- 					--ThroneOfThunder_TwinConsorts()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 1136 then --Siege Of Orgrimmar
-- 				if currentBoss == 71543 then --Immerseus
-- 					SiegeOfOrgrimmar_Immerseus(type, destName)
-- 				elseif currentBoss == 71475 or currentBoss == 71479 or currentBoss == 71480 then --The Fallen Protectors
-- 					SiegeOfOrgrimmar_TheFallenProtectors(type, spellId, destGUID)
-- 				elseif currentBoss == 72276 then --Amalgam of Corruption
-- 					SiegeOfOrgrimmar_AmalgamOfCorruption(type, spellId)
-- 				elseif currentBoss == 71734 then --Sha of Pride
-- 					SiegeOfOrgrimmar_ShaOfPride(type, spellId, destID)
-- 				elseif currentBoss == 72311 then --Galakras
-- 					SiegeOfOrgrimmar_Galakras()
-- 				elseif currentBoss == 71466 then --Iron Juggernaut
-- 					SiegeOfOrgrimmar_IronJuggernaut(type, spellId, sourceName, spawn_uid_dest)
-- 				elseif currentBoss == 71515 then --General Nazgrim
-- 					SiegeOfOrgrimmar_GeneralNazgrim(type, destID)
-- 				elseif currentBoss == 71454 then --Malkorok
-- 					SiegeOfOrgrimmar_Malkorok(type, destID, spellId)
-- 				elseif currentBoss == 73720 or currentBoss == 71512 then --Secured Stockpile of Pandaren Spoils
-- 					SiegeOfOrgrimmar_SecuredStockpileOfPandarenSpoils(type, overkill, sourceGUID, destID, sourceName, spellSchool)
-- 				elseif currentBoss == 71529 then --Thok the Bloodthirsty
-- 					SiegeOfOrgrimmar_ThokTheBloodthirsty()
-- 				elseif currentBoss == 71504 then --Siegecrafter Blackfuse
-- 					SiegeOfOrgrimmar_SiegecrafterBlackfuse(type, destID)
-- 				elseif currentBoss == 71158 or currentBoss == 71152 or currentBoss == 71155 or currentBoss == 71153 or currentBoss == 71157 or currentBoss == 71160 or currentBoss == 71156 or currentBoss == 71154 or currentBoss == 71161 then --Paragons
-- 					SiegeOfOrgrimmar_Paragons(type, destID, spellId, destName)
-- 				elseif currentBoss == 71865 then --Garrosh Hellscream
-- 					SiegeOfOrgrimmar_GarroshHellscream(type, spawn_uid, sourceID, destID, spawn_uid_dest, spellId, overkill)
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 669 then --Blackwing Descent
-- 				if currentBoss == 41570 then --Magmaw
-- 					BlackwingDescent_Magmaw(type, spellId, destName)
-- 				elseif currentBoss == 42178 or currentBoss == 42179 or currentBoss == 42180 or currentBoss == 42166 then --Ominitron Defense System
-- 					BlackwingDescent_OminitronDefenseSystem(type, spellId, destName, spellName)
-- 				elseif currentBoss == 41378 then --Maloriak
-- 					BlackwingDescent_Maloriak(type, sourceID, spawn_uid, spawn_uid_dest, destID)
-- 				elseif currentBoss == 43296 then --Chimaeron
-- 					BlackwingDescent_Chimaeron(type, unitType)
-- 				elseif currentBoss == 41442 then --Atramedes
-- 					BlackwingDescent_Atramedes(type)
-- 				elseif currentBoss == 41270 or currentBoss == 41376 then --Nefarian
-- 					BlackwingDescent_Nefarian()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 671 then --Bastion Of Twilight
-- 				if currentBoss == 44600 then --Halfus Wyrmbreaker
-- 					BastionOfTwilight_HalfusWyrmbreaker(type, destID)
-- 				elseif currentBoss == 45992 or currentBoss == 45993 then --Valiona And Theralion
-- 					BastionOfTwilight_ValionaAndTheralion(type, destID)
-- 				elseif currentBoss == 43324 then --Cho'gall
-- 					BastionOfTwilight_Chogall()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 1205 then --Blackrock Foundary
-- 				if currentBoss == 76865 then --Beastlord Darmac
-- 					BlackrockFoundary_BeastlordDarmac(sourceID, sourceName)
-- 				elseif currentBoss == 76906 then --Operator Thogar
-- 					BlackrockFoundary_OperatorThogar(type, destID)
-- 				elseif currentBoss == 77325 then --Blackhand
-- 					BlackrockFoundary_Blackhand(type, spellName, destName)
-- 				elseif currentBoss == 76973 or currentBoss == 76974 then --Hans'gar and Franzok
-- 					BlackrockFoundary_HansgarFranzok(type, spellId, destName)
-- 				elseif currentBoss == 76814 then --Flamebender Ka'graz
-- 					BlackrockFoundary_FlamebenderKagraz(type, destID)
-- 				elseif currentBoss == 77477 or currentBoss == 77557 or currentBoss == 77231 then --The Iron Maidens
-- 					BlackrockFoundary_TheIronMaidens(type, destID)
-- 				elseif currentBoss == 76806 then --Blast Furnace
-- 					BlackrockFoundary_BlastFurnace(type, destID)
-- 				elseif currentBoss == 77692 then--Kromog
-- 					BlackrockFoundary_Kromog(type, destID)
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 720 then --Firelands
-- 				if currentBoss == 52558 then --Lord Rhyolith
-- 					Firelands_LordRhyolith()
-- 				elseif currentBoss == 52530 then --Alysrazor
-- 					Firelands_Alysrazor(type, spellId, destName, spellName)
-- 				elseif currentBoss == 52498 then --Beth'tilac
-- 					Firelands_Bethtilac(type, destID, spawn_uid_dest)
-- 				elseif currentBoss == 53494 then --Baleroc
-- 					Firelands_Baleroc(type, spellId, destName)
-- 				elseif currentBoss == 53691 then --Shannox
-- 					--Firelands_Shannox()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 967 then --Dragon Soul
-- 				if currentBoss == 55308 then --Warlord Zon'ozz
-- 					DragonSoul_WarlordZonozz(type, spellId)
-- 				elseif currentBoss == 55312 then --Yor'sahj the Unsleeping
-- 					DragonSoul_YorsahjTheUnsleeping(type, spellId, destID)
-- 				elseif currentBoss == 55294 then --Ultraxion
-- 					DragonSoul_Ultraxion(type, spellId, spawn_uid_dest, destName)
-- 				elseif currentBoss == 56598 then --Skyfire
-- 					DragonSoul_Skyfire(type, spellId, destID)
-- 				elseif currentBoss == 53879 then --Sping Of Deathwing
-- 					DragonSoul_SpineOfDeathwing()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 996 then --Terrace of Endless Spring
-- 				if currentBoss == 60583 or currentBoss == 60586 or currentBoss == 60585 then --Protectors of the Endless
-- 					TerraceOfEndlessSpring_ProtectorsOfTheEndless(type, destID) 
-- 				elseif currentBoss == 62442 then --Tsulong
-- 					TerraceOfEndlessSpring_Tsulong(type, destID, spellId, overkill)
-- 				elseif currentBoss == 62983 then --Lei Shi
-- 					TerraceOfEndlessSpring_LeiShi(type, spellId, destName)
-- 				elseif currentBoss == 60999 then --Sha of Fear
-- 					TerraceOfEndlessSpring_ShaOfFear(type, spellId, destName)
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 1009 then --Heart of Fear
-- 				if currentBoss == 62980 then --Imperial Vizier Zor'lok
-- 					HeartOfFear_ImperialVizierZorlok(type, unitTypePlayer, destName, spawn_uid_dest_Player)
-- 				elseif currentBoss == 62164 or currentBoss == 63053 then --Garalon
-- 					HeartOfFear_Garalon(type, spellId)
-- 				elseif currentBoss == 62837 then --Grand Empress Shek'zeer
-- 					HeartOfFear_GrandEmpressShekzeer(type, destID)
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 1008 then --Mogu'shan Vaults
-- 				if currentBoss == 60009 then
-- 					MogushanVaults_FengTheAccursed(type, spellId)
-- 				elseif currentBoss == 60709 then --The Spirit Kings
-- 					--MogushanVaults_TheSpiritKings()
-- 				end
-- 			elseif AchievementTracker_currentZoneID == 1448 then --Hellfire Citadel
-- 				if currentBoss == 95068 or currentBoss == 90018 then --Hellfire Assualt
-- 					HellfireCitadel_HellfireAssualt()
-- 				elseif currentBoss == 90284 then --Iron Reaver
-- 					HellfireCitadel_IronReaver(type, destID)
-- 				elseif currentBoss == 92144 or currentBoss == 92146 or currentBoss == 92142 then --Hellfire High Council
-- 					HellfireCitadel_HellfireHighCouncil(type, destID)
-- 				elseif currentBoss == 90378 then --Kilrogg Deadeye
-- 					HellfireCitadel_KilroggDeadeye(type, destID)
-- 				elseif currentBoss == 90435 then --Kormrok
-- 					HellfireCitadel_Kormrok(type, spellId, spawn_uid_dest_Player, destName)
-- 				elseif currentBoss == 90199 then --Gorefiend
-- 					HellfireCitadel_Gorefiend(type, destID)
-- 				elseif currentBoss == 90316 then --Shadow-Lord Iskar
-- 					HellfireCitadel_ShadowLordIskar(type, spellId, destName)
-- 				elseif currentBoss == 89890 then --Fel Lord Zakuun
-- 					HellfireCitadel_FelLordZakuun(type, spellId, destName)
-- 				elseif currentBoss == 93068 then --Xhul'horac
-- 					HellfireCitadel_Xhulhorac(type, spellId, destName)
-- 				elseif currentBoss == 90296 then --Socrethar the Eternal
-- 					HellfireCitadel_SocretharTheEternal(type, destID)
-- 				elseif currentBoss == 93439 then --Tyrant Velhari
-- 					HellfireCitadel_TyrantVelhari(type, destID)
-- 				elseif currentBoss == 91349 then --Mannoroth
-- 					HellfireCitadel_Mannoroth(type, spellId, destID, overkill)
-- 				end
-- 			end
-- 		end
-- 	end
-- end);

function AchievementTracker_detectGroupType()
	--Detect type of group the user is in
	if UnitInRaid("player") then
		AchievementTracker_chatType = "RAID"
	elseif UnitInParty("player") then
		AchievementTracker_chatType = "PARTY"
	else
		AchievementTracker_chatType = "SAY"
	end

	--Debug to stop message going out to other people by accident
	--AchievementTracker_chatType = "OFFICER"
end

function AchievementTracker_GetCurrentMap()

end

function detectBoss()
	for bossCount = 1, #bosses do
		for i = 1,5 do
			if UnitGUID("boss" .. i) ~= nil then
				if string.find(UnitGUID("boss" .. i), bosses[bossCount]) then
					currentBoss = bosses[bossCount]
				end
			end
		end
	end
end

function AchievementTracker_getAchievementsToTrackWrath(id25,id10)
	if displayTracked == false then
		if(AchievementTracker_playerCount == 25) then
			SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id25),AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			displayTracked = true
		elseif AchievementTracker_playerCount == 10 then
			SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id10),AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			displayTracked = true
		end	
	end
end

function AchievementTracker_getAchievementsToTrackWrathNew(id25,id10,tracker)
	if(AchievementTracker_playerCount == 25) then
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id25),AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		tracker = true
	elseif AchievementTracker_playerCount == 10 then
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id10),AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		tracker = true
	end	
end

function AchievementTracker_getAchievementFailedWrath(id25,id10,player)
	if(AchievementTracker_playerCount == 25) then
		if player == nil then
			SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " FAILED!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		else
			SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " FAILED! (" .. player .. ")",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
		displayTracked = true
	elseif AchievementTracker_playerCount == 10 then
		if player == nil then
			SendChatMessage("[WIP] " .. GetAchievementLink(id10) .. " FAILED!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		else
			SendChatMessage("[WIP] "  .. GetAchievementLink(id10) .. " FAILED! (" .. player .. ")",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end	
		displayTracked = true
	end	
end

function AchievementTracker_getAchievementSuccessWrath(id25,id10)
	if(AchievementTracker_playerCount == 25) then
		SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " requirements have been met. Boss can now be killed!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	elseif AchievementTracker_playerCount == 10 then
		SendChatMessage("[WIP] " .. GetAchievementLink(id10) .. " requirements have been met. Boss can now be killed!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	end
end

function AchievementTracker_getAchievementSuccessWrathPersonal(id25,id10,name)
	if(AchievementTracker_playerCount == 25) then
		SendChatMessage("[WIP] "  .. GetAchievementLink(id25) .. " has completed the personal achievement!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	elseif AchievementTracker_playerCount == 10 then
		SendChatMessage("[WIP] " .. GetAchievementLink(id10) .. " has completed the personal achievement!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		achievementCompleted = true
	end
end

function clearVariables()
	------------------------------------------------------
	---- Reset Variables
	------------------------------------------------------
	AchievementTracker_inCombat = false
	currentBoss = nil
	AchievementTracker_achievementFailed = false
	AchievementTracker_achievementFailed2 = false
	AchievementTracker_achievementFailed3 = false
	AchievementTracker_achievementFailed4 = false
	AchievementTracker_achievementFailed5 = false
	AchievementTracker_achievementCompleted = false
	AchievementTracker_displayTracked = false
	AchievementTracker_displayTracked2 = false
	AchievementTracker_displayTracked3 = false
	AchievementTracker_displayTracked4 = false
	AchievementTracker_partialTrack = false
	displayTracked = false
	if AchievementTracker_currentZoneID == 631 then		
		Icecrown_ClearVariables()
	elseif AchievementTracker_currentZoneID == 603 then
		Ulduar_ClearVariables()
	elseif AchievementTracker_currentZoneID == 1098 then
		ThroneOfThunder_ClearVariables()
	elseif AchievementTracker_currentZoneID == 1136 then
		SiegeOfOrgrimmar_ClearVariables()
	elseif AchievementTracker_currentZoneID == 1205 then
		BlackrockFoundary_ClearVariables()
	elseif AchievementTracker_currentZoneID == 1448 then
		HellfireCitadel_ClearVariables()
	elseif AchievementTracker_currentZoneID == 967 then
		DragonSoul_ClearVariables()
	elseif AchievementTracker_currentZoneID == 669 then
		BlackwingDescent_ClearVariables()
	elseif AchievementTracker_currentZoneID == 671 then
		BastionOfTwilight_ClearVariables()
	elseif AchievementTracker_currentZoneID == 720 then
		Firelands_ClearVariables()
	elseif AchievementTracker_currentZoneID == 996 then
		TerraceOfEndlessSpring_ClearVariables()
	elseif AchievementTracker_currentZoneID == 1009 then
		HeartOfFear_ClearVariables()
	elseif AchievementTracker_currentZoneID == 1008 then
		MogushanVaults_ClearVariables()
	end
end

function AchievementTracker_displayAchievementsToTrackCurrent(id)
	if displayTracked == false then
		displayTracked = true
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id),AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end
end

function AchievementTracker_displayAchievementsToTrackCurrentPartial(id)
	if displayTracked == false then
		displayTracked = true
		SendChatMessage("[WIP] Tracking: "  .. GetAchievementLink(id) .. " (Partial)",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end
end

function getAchievementTracker_achievementFailed(id)
	SendChatMessage("[WIP] "  .. GetAchievementLink(id) .. " FAILED!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	displayTracked = true	
end

function AchievementTracker_getAchievementSuccess(id)
	SendChatMessage("[WIP] "  .. GetAchievementLink(id) .. " requirements have been met. Boss can now be killed!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	AchievementTracker_achievementCompleted = true
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end