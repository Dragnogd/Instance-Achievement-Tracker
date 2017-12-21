--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Siege Of Orgrimmar Bosses
------------------------------------------------------
core.SiegeOfOrgrimmar = {}

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_HEALTH")
f:RegisterEvent("UNIT_AURA")
f:RegisterEvent("ZONE_CHANGED")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")

------------------------------------------------------
---- Immerseus
------------------------------------------------------
local tearsOfTheValeKilled = 0
local mobSpawnIDs = {}

------------------------------------------------------
---- TheFallenProtectors
------------------------------------------------------
local playersRecievedMark = {}
local playersRecievedMarkCounter = 0

------------------------------------------------------
---- Iron Juggernaut
------------------------------------------------------
local detonationStarted = false
local superheatedCrawlerMinesSquashed = 0
local superheatedCrawlerMines = {}
local superheatedCrawlerMinesTemp = 0

------------------------------------------------------
---- Kor'kron Dark Shaman
------------------------------------------------------
local subzone = nil
local unitsSaved = 0
local theramoreCitizenKilled = false
local orcsKilled = false
local citizensSaved = false
local prisonersRescued = false

------------------------------------------------------
---- Malkorok
------------------------------------------------------
local corruptedSkullsplitterPulled = false

------------------------------------------------------
---- Secured Stockpile Of PandarenSpoils
------------------------------------------------------
local mantridMobs = {"71385", "71398", "71383", "71397", "71405", "73951", "71409", "71388", "73948", "73949"}
local moguMobs = {"71380", "72535", "71392", "71433", "71378", "71395", "71393", "71408", "73723", "73724", "73725"}
local playersSide = {}

------------------------------------------------------
---- Siegecrafter Blackfuse
------------------------------------------------------
local deactivatedLaserTurretKilled = false
local deactivatedMissileTurret = false
local deactivatedElectromagnet = false
local disassembledCrawlerMines = false

------------------------------------------------------
---- Garrosh Hellscream
------------------------------------------------------
local warbringersIds = {}
local warbringersCounter = 0
local step1Complete = false
local timerStarted = false
local warbringersKilled = 0
local warbringersKilledIds = {}

function core.SiegeOfOrgrimmar:Immerseus()
	core:displayAchievementsToTrackCurrent(8536)

	if core.type == "UNIT_DIED" and core.destName == "Tears of the Vale" and core.achievementCompleted == false then
		tearsOfTheValeKilled = tearsOfTheValeKilled + 1
		SendChatMessage("[WIP] Tears of the Vale Killed ("  .. tearsOfTheValeKilled .. "/10)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	if tearsOfTheValeKilled == 10 and core.achievementCompleted == false then
		core:getAchievementSuccess(8536)
		core.achievementCompleted = true
	end
end

function core.SiegeOfOrgrimmar:TheFallenProtectors()
	--core:displayAchievementsToTrackCurrent(8528)

	--Don't count the mark for the the first person that has recieved it
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 143840 then
		table.insert(playersRecievedMark, core.spawn_uid_dest_Player)
	end

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 143842 and core:has_value(playersRecievedMark, core.spawn_uid_dest_Player) == false and core.achievementCompleted == false then
		table.insert(playersRecievedMark, core.spawn_uid_dest_Player)
		playersRecievedMarkCounter = playersRecievedMarkCounter + 1
		SendChatMessage("[WIP] Unique Players Recieved Mark of Anguish ("  .. playersRecievedMarkCounter .. "/5)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	if playersRecievedMarkCounter == 5 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8528) .. " '5 unique players recieved Mark of Anguish' part of the achievement complete. Make sure 200yards have also been covered before killing boss'",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end
end

function core.SiegeOfOrgrimmar:AmalgamOfCorruption()
	core:displayAchievementsToTrackCurrent(8532)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 145132 and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8532) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true		
	end
end

function core.SiegeOfOrgrimmar:ShaOfPride()
	--core:displayAchievementsToTrackCurrentPartial(8521)

	--Mocking Blast
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 144379 and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8532) .. " FAILED (Mocking Blast has to be interrupted)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end

	--Last Word
	if core.type == "UNIT_DIED" and core.destID == "71946" and core.achievementFailed == false then
		SendChatMessage("[WIP] WARNING: Manifestation of Pride has died. If the closest 2 players to the add did not have " .. GetSpellLink(146595) .. " then the achievement has FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true
	end
end

function core.SiegeOfOrgrimmar:Galakras()
	--Cannot track this one reliabily. Do not announce to group!
	--core:displayAchievementsToTrackCurrent(8530)

	f:SetScript("OnEvent", function(self, event, unitID)
		if event == "UNIT_HEALTH" and UnitName(unitID) == "Alliance Vanguard" and core.achievementFailed == false then
			--print(UnitName(unitID) .. " " .. UnitHealth(unitID) .. UnitGUID(unitID))
			if UnitHealth(unitID) == 0 then
				SendChatMessage("[WIP] "  .. GetAchievementLink(8530) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true
			end
		end
	end)
end

function core.SiegeOfOrgrimmar:IronJuggernaut()
	core:displayAchievementsToTrackCurrent(8520)

	--Crawler Mine Blast
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 144766 then
		--print("Found: " .. spawn_uid_dest)
		if superheatedCrawlerMines[core.spawn_uid_dest] ~= nil then
			--print("Removing: " .. spawn_uid_dest)
			superheatedCrawlerMinesTemp = superheatedCrawlerMinesTemp - 1
		end
	end

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 144718 and detonationStarted == false then
		detonationStarted = true
		--print("Detonation Started")
		C_Timer.After(20, function()
			--print("Detonation Finished")
			detonationStarted = false
			if superheatedCrawlerMinesTemp > 0 then
				superheatedCrawlerMinesSquashed = superheatedCrawlerMinesSquashed + superheatedCrawlerMinesTemp
				SendChatMessage("[WIP] " .. GetAchievementLink(8520) .. " (" .. superheatedCrawlerMinesSquashed .. "/6) Superheated Crawler Mines Stomped",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)			
				superheatedCrawlerMinesTemp = 0
				superheatedCrawlerMines = {}
			end
		end)
	end

	f:SetScript("OnEvent", function(self, event, unitID)
		if event == "UNIT_AURA" then
			local name, realm = UnitName(unitID)
			if name == "Superheated Crawler Mine" and detonationStarted == true then
				local _, _, _, _, _, _, spawn_uid_dest = strsplit("-", UnitGUID(unitID));
				if superheatedCrawlerMines[spawn_uid_dest] == nil then
					--print("Adding: " .. spawn_uid_dest)
					superheatedCrawlerMines[spawn_uid_dest] = spawn_uid_dest
					superheatedCrawlerMinesTemp = superheatedCrawlerMinesTemp + 1
				end
			end
		end
	end)

	if superheatedCrawlerMinesSquashed >= 6 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8520) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true
	end
end

function SiegeOfOrgrimmar_ClearVariables()
	------------------------------------------------------
	---- Immerseus
	------------------------------------------------------
	tearsOfTheValeKilled = 0
	mobSpawnIDs = {}

	------------------------------------------------------
	---- TheFallenProtectors
	------------------------------------------------------
	playersRecievedMark = {}
	playersRecievedMarkCounter = 0

	------------------------------------------------------
	---- Iron Juggernaut
	------------------------------------------------------
	detonationStarted = false
	superheatedCrawlerMinesSquashed = 0
	superheatedCrawlerMines = {}
	superheatedCrawlerMinesTemp = 0

	------------------------------------------------------
	---- Secured Stockpile Of PandarenSpoils
	------------------------------------------------------
	playersSide = {}

	------------------------------------------------------
	---- Siegecrafter Blackfuse
	------------------------------------------------------
	deactivatedLaserTurretKilled = false
	deactivatedMissileTurret = false
	deactivatedElectromagnet = false
	disassembledCrawlerMines = false

	------------------------------------------------------
	---- Garrosh Hellscream
	------------------------------------------------------
	warbringersIds = {}
	warbringersCounter = 0
	step1Complete = false
	timerStarted = false
	warbringersKilled = 0
end

function core.SiegeOfOrgrimmar:GeneralNazgrim()
	core:displayAchievementsToTrackCurrent(8448)
	
	if core.type == "UNIT_DIED" and core.destID == "72192" and core.achievementFailed == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8448) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true		
	end
end

function core.SiegeOfOrgrimmar:Malkorok()
	core:displayAchievementsToTrackCurrent(8538)

	if core.type == "SPELL_AURA_APPLIED" and core.destID == "72983" and core.spellId == 142848 and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8538) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementCompleted = true	
	end

	--Corrupted Skullsplitter/Amalgamation Killed
	if core.type == "UNIT_DIED" and core.destID == "72983" and core.achievementFailed == false and core.achievementCompleted == false then
		SendChatMessage("[WIP] "  .. GetAchievementLink(8538) .. " FAILED. Do not kill boss (This achievement can be repeated)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		core.achievementFailed = true							
	end
end

function core.SiegeOfOrgrimmar:SecuredStockpileOfPandarenSpoils()
	core:displayAchievementsToTrackCurrent(8529)
	
	local unitTypeSrc, sourceID, spawn_uid = strsplit("-",core.sourceGUID);
	local overkillTemp = overkill

	if core.type == "SWING_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" then
		
		if core.type == "SWING_DAMAGE" then
			--TODO: Overkill value not working on swing damage
			overkillTemp = core.spellSchool
		end

		if overkillTemp > 0 then
			if playersSide[spawn_uid] == nil then
				if core:has_value(mantridMobs, core.destID) then
					print("Adding " .. core.sourceName .. " to Mantrid")
					playersSide[spawn_uid] = "Mantrid"
				elseif core:has_value(moguMobs, core.destID) then
					print("Adding " .. core.sourceName .. " to Mogu")
					playersSide[spawn_uid] = "Mogu"
				end
			elseif playersSide[spawn_uid] ~= nil then
				if core:has_value(mantridMobs, core.destID) then
					if playersSide[spawn_uid] ~= "Mantrid" and core.achievementFailed == false then
						SendChatMessage("[WIP] "  .. GetAchievementLink(8529) .. " FAILED! (" .. core.sourceName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
						core.achievementFailed = true
					end
				elseif core:has_value(moguMobs, core.destID) then
					if playersSide[spawn_uid] ~= "Mogu" and core.achievementFailed == false then
						SendChatMessage("[WIP] "  .. GetAchievementLink(8529) .. " FAILED! (" .. core.sourceName .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
						core.achievementFailed = true
					end					
				end
			end
		end
	end
end

function core.SiegeOfOrgrimmar:ThokTheBloodthirsty()
	--core:displayAchievementsToTrackCurrent(8527)

	--If raid size is 25man set bloodiedMaxCounter to 10
	--If raid size is 10man set bloodiedMaxCounter to 5

	--Step 1: Lower Health to 50%
		--Once 5 unique players have the bloodied debuff
	
	--Step 2: Detect player who has skseleton key debuff and tell them to open cage
		--Detect open cage Spell_Cast Succedded ???
		--Do this 3 times

	--Step 3: Once snail released you can kill boss
end

function core.SiegeOfOrgrimmar:SiegecrafterBlackfuse()
	core:displayAchievementsToTrackCurrent(8543)

	--Deactivated Missile Turret
	if core.type == "UNIT_DIED" and core.destID == "71606" and deactivatedMissileTurret == false then
		deactivatedMissileTurret = true
		SendChatMessage("[WIP] 'Deactivated Missile Turret' part of "  .. GetAchievementLink(8453) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	--Deactivated Laser Turret
	if core.type == "UNIT_DIED" and core.destID == "71751" and deactivatedLaserTurretKilled == false then
		deactivatedLaserTurretKilled = true
		SendChatMessage("[WIP] 'Deactivated Laser Turret' part of "  .. GetAchievementLink(8453) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	--Deactivated Electromagnet
	if core.type == "UNIT_DIED" and core.destID == "71694" and deactivatedElectromagnet == false then
		deactivatedElectromagnet = true
		SendChatMessage("[WIP] 'Deactivated Electromagnet' part of "  .. GetAchievementLink(8453) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end

	--Disassembled Crawler Mines
	if core.type == "UNIT_DIED" and core.destID == "71790" and disassembledCrawlerMines == false then
		disassembledCrawlerMines = true
		SendChatMessage("[WIP] 'Disassembled Crawler Mines' part of "  .. GetAchievementLink(8453) .. " FAILED!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	end
end

function core.SiegeOfOrgrimmar:Paragons()
	core:displayAchievementsToTrackCurrent(8531)

	--Alert group who can use which power when each paragon dies
	-- if type == "UNIT_DIED" and core.destID == "71158" then
	-- 	SendChatMessage("[WIP] Rik'kal the Dissector Killed. This power can be used by ANYONE",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	-- elseif type == "UNIT_DIED" and core.destID == "71152" then
	-- 	SendChatMessage("[WIP] Skeer the Bloodseeker Killed. This power can be used by DPS",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	-- elseif type == "UNIT_DIED" and core.destID == "71155" then
	-- 	SendChatMessage("[WIP] Korven the Prime Killed. This power can be used by TANKS",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)		
	-- elseif type == "UNIT_DIED" and core.destID == "71153" then
	-- 	SendChatMessage("[WIP] Hisek the Swarmkeeper Killed. This power can be used by DPS",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)				
	-- elseif type == "UNIT_DIED" and core.destID == "71157" then
	-- 	SendChatMessage("[WIP] Xaril the Poisoned Mind Killed. This power can be used by HEALERS",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)						
	-- elseif type == "UNIT_DIED" and core.destID == "71160" then
	-- 	SendChatMessage("[WIP] Iyyokuk the Lucid Killed. This power can be used by ANYONE",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)								
	-- elseif type == "UNIT_DIED" and core.destID == "71156" then
	-- 	SendChatMessage("[WIP] Kaz'tik the Manipulator Killed. This power can be used by ANYONE",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)									
	-- elseif type == "UNIT_DIED" and core.destID == "71154" then
	-- 	SendChatMessage("[WIP] Ka'roz the Locust Killed. This power can be used by DPS",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)											
	-- elseif type == "UNIT_DIED" and core.destID == "71161" then
	-- 	SendChatMessage("[WIP] Kil'ruk the Wind-Reaver Killed. This power can be used by DPS",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)													
	-- end

	--Alert the user when they assume the power of one of the parargons
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 141857 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Rik'kal the Dissector",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)		
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141851 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Skeer the Bloodseeker",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)				
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141854 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Korven the Prime",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)						
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141852 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Hisek the Swarmkeeper",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)								
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141856 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Xaril the Poisoned Mind",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)										
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 148653 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Iyyokuk the Lucid",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)											
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 148648 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Kaz'tik the Manipulator",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)													
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141853 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Ka'roz the Locust",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)															
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141859 then
		SendChatMessage("[WIP] " .. core.destName .. " has gained powers from Kil'ruk the Wind-Reaver",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)																	
	end
end

function core.SiegeOfOrgrimmar:GarroshHellscream()
	core:displayAchievementsToTrackCurrent(8537)

	if core.achievementCompleted == false then
		if (core.type == "SWING_DAMAGE" or core.type == "SWING_MISSED") and core.sourceID == "71979" then
			if warbringersIds[core.spawn_uid] == nil then
				warbringersIds[core.spawn_uid] = core.spawn_uid
				warbringersCounter = warbringersCounter + 1
				SendChatMessage("[WIP] Kor'kron Warbringer (" .. warbringersCounter .. "/18)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end
		end

		if warbringersCounter == 18 and step1Complete == false then
			SendChatMessage("[WIP] "  .. GetAchievementLink(8537) .. " 18 Kor'kron Warbringers Alive. They can now be killed with a single Iron Star",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			step1Complete = true		
		end

		--Make sure a Warbringer is not hit by multiple Iron Stars
		if core.type == "SPELL_DAMAGE" and core.destID == "71979" and core.spellId == 144653 then
			if warbringersKilledIds[core.spawn_uid_dest] == nil then
				warbringersKilledIds[core.spawn_uid_dest] = 1
			else
				warbringersKilledIds[core.spawn_uid_dest] = 2
			end
		end

		--If a Warbringer was killed by an iron star impact
		if core.type == "SPELL_DAMAGE" and core.destID == "71979" and core.spellId == 144653 and core.overkill > 0 and core.achievementCompleted == false then
			if warbringersKilledIds[core.spawn_uid_dest] == 1 then
				warbringersKilled = warbringersKilled + 1
				warbringersIds[core.spawn_uid_dest] = nil
				warbringersCounter = warbringersCounter - 1
				if timerStarted == false then
					timerStarted = true
					SendChatMessage("[WIP] Timer Started! ",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
					C_Timer.After(10, function()
						if warbringersKilled < 18 then
							SendChatMessage("[WIP] "  .. GetAchievementLink(8537) .. " FAILED!. (" .. warbringersKilled .. "/18) killed in time (This achievement can be repeated)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
							step1Complete = false
							timerStarted = false
							warbringersKilled = 0
							warbringersKilledIds = {}
						elseif warbringersKilled >= 18 then
							SendChatMessage("[WIP] "  .. GetAchievementLink(8537) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
							core.achievementCompleted = true										
						end
					end)			
				end
			else
				warbringersIds[core.spawn_uid_dest] = nil
				warbringersCounter = warbringersCounter - 1
			end
		end

		if core.type == "UNIT_DIED" and core.destID == "71979" and timerStarted == false then
			warbringersIds[core.spawn_uid_dest] = nil
			warbringersCounter = warbringersCounter - 1
			SendChatMessage("[WIP] Kor'kron Warbringer DIED (" .. warbringersCounter .. "/18)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
	end
end

--Only Run this script when in Siege of Orgrimmar
local _, _, difficultyID, _, maxPlayers, _, _, mapID, _ = GetInstanceInfo()
local currentZoneID = mapID

f:SetScript("OnEvent", function(self, event, ...)
	--TODO: Does not work inside buildings since subzone changes
	if event == "ZONE_CHANGED" then
		subzone = GetSubZoneText()
		if subzone == "Gates of Orgrimmar" or subzone == "Valley of Strength" then
			core:displayAchievementsToTrackCurrent(8453)
		elseif subzone == "The Drag" then
			core:displayAchievementsToTrackCurrent(8448)
		elseif subzone == "Kor'kron Barracks" then
			core:displayAchievementsToTrackCurrent(8538)
		end
	end

	if event == "PLAYER_ENTERING_WORLD" then
		subzone = GetSubZoneText()
		if subzone == "Gates of Orgrimmar" or subzone == "Valley of Strength" then
			core:displayAchievementsToTrackCurrent(8453)
		elseif subzone == "The Drag" then
			core:displayAchievementsToTrackCurrent(8448)
		elseif subzone == "Kor'kron Barracks" then
			core:displayAchievementsToTrackCurrent(8538)
		end		
	end

	if subzone == "Gates of Orgrimmar" or subzone == "Valley of Strength" then
		local timestamp, type, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _ = ...
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = select(12, ...)
			local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-",destGUID);

			if destName ~= nil and destID ~= nil then
				--print(type .. " " .. destName .. " " .. destID)
			end

			--Ji Firepaw died
			if type == "UNIT_DIED" and destID == "62445" and core.achievementFailed == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(8453) .. " FAILED Reason: (Ji Firepaw has died)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true		
			end

			--Ji Firepaw saved
			if type == "UNIT_DIED" and destID == "72455" and core.achievementFailed == false then
				unitsSaved = unitsSaved + 1
				SendChatMessage("[WIP] Save Ji Firepaw part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end

			--Mokvar the Treasurer Killed
			if type == "UNIT_DIED" and destID == "72433" then
				SendChatMessage("[WIP] Mokvar the Treasurer Killed. Use the key to rescue a set of caged prisoners",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end

			---Alliance---

			--Overseer Thathung Killed
			if type == "UNIT_DIED" and destID == "72496" then
				C_Timer.After(3, function()
					if theramoreCitizenKilled == false and citizensSaved == false then
						unitsSaved = unitsSaved + 1
						citizensSaved = true
						SendChatMessage("[WIP] Save 'A group of unwilling combat participants' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)				
					end
				end)
			end

			--Theramore Citizens Killed
			if type == "UNIT_DIED" and destID == "72498" and theramoreCitizenKilled == false then
				theramoreCitizenKilled = true
				SendChatMessage("[WIP] "  .. GetAchievementLink(8453) .. " FAILED Reason: (Theramore Citizens killed)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end

			---Horde---

			---Overseer Mojka---
			if type == "UNIT_DIED" and destID == "72490" then
				C_Timer.After(3, function()
					if orcsKilled == false and citizensSaved == false then
						unitsSaved = unitsSaved + 1
						citizensSaved = true
						SendChatMessage("[WIP] Save 'A group of unwilling combat participants' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)				
					end
				end)		
			end

			--Orcs Killed---
			if type == "UNIT_DIED" and (destID == "72492" or destID == "72493" or destID == "72484" or destID == "72485" or destID == "72483") and orcsKilled == false then
				orcsKilled = true
				SendChatMessage("[WIP] "  .. GetAchievementLink(8453) .. " FAILED Reason: (Orcs killed)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end

			if unitsSaved == 3 and core.achievementCompleted == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(8453) .. " requirements have been met. Boss can now be killed!",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementCompleted = true
			end
		end

		-- if event == "UNIT_SPELLCAST_SUCCEEDED" then
		-- 	local unitID, spell, rank, lineID, core.spellId = select(1,...)
		-- 	--print(UnitName(unitID) .. " " .. spell)
		-- 	if spell == "Unlocking" then
		-- 		unitsSaved = unitsSaved + 1
		-- 		SendChatMessage("[WIP] 'Rescue a set of caged prisoners,' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		-- 	end
		-- end

		if UnitAura("Player", "Resistance Totem") and prisonersRescued == false then
			prisonersRescued = true
			unitsSaved = unitsSaved + 1
			SendChatMessage("[WIP] 'Rescue a set of caged prisoners,' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		end
	elseif subzone == "The Drag" then
		--TODO: Stop this sending message twice
		if event == "UNIT_SPELLCAST_SUCCEEDED" then
			local unitID, spell, rank, lineID, spellId = select(1,...)
			--print(UnitName(unitID) .. " " .. spell)
			if spell == "Unlock Chains" then
				SendChatMessage("[WIP] Gamon Freed!. Wait for him to reach boss before pulling",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end
		end
	elseif subzone == "Kor'kron Barracks" then
		local timestamp, type, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _ = ...
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = select(12, ...)
			local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-",destGUID);
			
			--Corrupted Skullsplitter Pulled
			if destID == "73033" and corruptedSkullsplitterPulled == false then
				corruptedSkullsplitterPulled = true
				SendChatMessage("[WIP] Corrupted Skullsplitter Pulled",chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end

			--Corrupted Skullsplitter Killed
			if type == "UNIT_DIED" and destID == "73033" and core.achievementFailed == false then
				SendChatMessage("[WIP] "  .. GetAchievementLink(8538) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
				core.achievementFailed = true							
			end

		end
	end
end)

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end