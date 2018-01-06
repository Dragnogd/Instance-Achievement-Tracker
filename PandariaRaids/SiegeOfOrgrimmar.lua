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
	if core.type == "UNIT_DIED" and core.destName == "Tears of the Vale" and tearsOfTheValeKilled < 10 then
		tearsOfTheValeKilled = tearsOfTheValeKilled + 1
		core:sendMessage("Tears of the Vale Killed ("  .. tearsOfTheValeKilled .. "/10)")
	end

	if tearsOfTheValeKilled == 10 then
		core:getAchievementSuccess()
	end
end

function core.SiegeOfOrgrimmar:TheFallenProtectors()
	--Don't count the mark for the the first person that has recieved it
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 143840 then
		table.insert(playersRecievedMark, core.spawn_uid_dest_Player)
	end

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 143842 and core:has_value(playersRecievedMark, core.spawn_uid_dest_Player) == false and core.achievementsCompleted[1] == false then
		table.insert(playersRecievedMark, core.spawn_uid_dest_Player)
		playersRecievedMarkCounter = playersRecievedMarkCounter + 1
		core:sendMessage("Unique Players Recieved Mark of Anguish ("  .. playersRecievedMarkCounter .. "/5)")
	end

	if playersRecievedMarkCounter == 5 then
		core:getAchievementSuccessWithCustomMessage(GetAchievementLink(core.achievementIDs[1]) .. " '5 unique players recieved Mark of Anguish' part of the achievement complete. Make sure 200yards have also been covered before killing boss'")
	end
end

function core.SiegeOfOrgrimmar:AmalgamOfCorruption()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 145132 then
		core:getAchievementFailed()
	end
end

function core.SiegeOfOrgrimmar:ShaOfPride()
	--Mocking Blast
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 144379 then
		core:getAchievementFailedWithMessageAfter("(Mocking Blast has to be interrupted)")
	end

	--Last Word
	if core.type == "UNIT_DIED" and core.destID == "71946" and core.achievementsFailed[1] == false then
		core:sendMessage("WARNING: Manifestation of Pride has died. If the closest 2 players to the add did not have " .. GetSpellLink(146595) .. " then the achievement has FAILED")
	end
end

function core.SiegeOfOrgrimmar:Galakras()
	f:SetScript("OnEvent", function(self, event, unitID)
		if event == "UNIT_HEALTH" and UnitName(unitID) == "Alliance Vanguard" then
			if UnitHealth(unitID) == 0 then
				core:getAchievementFailed()
			end
		end
	end)
end

function core.SiegeOfOrgrimmar:IronJuggernaut()
	--Crawler Mine Blast
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 144766 then
		if superheatedCrawlerMines[core.spawn_uid_dest] ~= nil then
			superheatedCrawlerMinesTemp = superheatedCrawlerMinesTemp - 1
		end
	end

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 144718 and detonationStarted == false then
		detonationStarted = true
		C_Timer.After(20, function()
			detonationStarted = false
			if superheatedCrawlerMinesTemp > 0 then
				superheatedCrawlerMinesSquashed = superheatedCrawlerMinesSquashed + superheatedCrawlerMinesTemp
				core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " (" .. superheatedCrawlerMinesSquashed .. "/6) Superheated Crawler Mines Stomped")		
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
					superheatedCrawlerMines[spawn_uid_dest] = spawn_uid_dest
					superheatedCrawlerMinesTemp = superheatedCrawlerMinesTemp + 1
				end
			end
		end
	end)

	if superheatedCrawlerMinesSquashed >= 6 then
		core:getAchievementSuccess()
	end
end

function core.SiegeOfOrgrimmar:GeneralNazgrim()
	if core.type == "UNIT_DIED" and core.destID == "72192" then
		getAchievementFailed()
	end
end

function core.SiegeOfOrgrimmar:Malkorok()
	if core.type == "SPELL_AURA_APPLIED" and core.destID == "72983" and core.spellId == 142848 then
		core:getAchievementSuccess()
	end

	--Corrupted Skullsplitter/Amalgamation Killed
	if core.type == "UNIT_DIED" and core.destID == "72983" then
		core:getAchievementFailedWithMessageAfter("Do not kill boss (This achievement can be repeated)")						
	end
end

function core.SiegeOfOrgrimmar:SecuredStockpileOfPandarenSpoils()
	local unitTypeSrc, sourceID, spawn_uid = strsplit("-",core.sourceGUID);

	if core.type == "SWING_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" then
		if core.overkill > 0 then
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
					if playersSide[spawn_uid] ~= "Mantrid" then
						core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ")")
					end
				elseif core:has_value(moguMobs, core.destID) then
					if playersSide[spawn_uid] ~= "Mogu" then
						core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ")")
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
	--Deactivated Missile Turret
	if core.type == "UNIT_DIED" and core.destID == "71606" and deactivatedMissileTurret == false then
		deactivatedMissileTurret = true
		core:getAchievementFailedWithMessageBefore("'Deactivated Missile Turret' part of")
	end

	--Deactivated Laser Turret
	if core.type == "UNIT_DIED" and core.destID == "71751" and deactivatedLaserTurretKilled == false then
		deactivatedLaserTurretKilled = true
		core:getAchievementFailedWithMessageBefore("'Deactivated Laser Turret' part of")
	end

	--Deactivated Electromagnet
	if core.type == "UNIT_DIED" and core.destID == "71694" and deactivatedElectromagnet == false then
		deactivatedElectromagnet = true
		core:getAchievementFailedWithMessageBefore("'Deactivated Electromagnet' part of")
	end

	--Disassembled Crawler Mines
	if core.type == "UNIT_DIED" and core.destID == "71790" and disassembledCrawlerMines == false then
		disassembledCrawlerMines = true
		core:getAchievementFailedWithMessageBefore("'Disassembled Crawler Mines' part of")
	end
end

function core.SiegeOfOrgrimmar:Paragons()
	--Alert the user when they assume the power of one of the parargons
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 141857 then
		core:sendMessage(core.destName .. " has gained powers from Rik'kal the Dissector")		
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141851 then
		core:sendMessage(core.destName .. " has gained powers from Skeer the Bloodseeker")				
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141854 then
		core:sendMessage(core.destName .. " has gained powers from Korven the Prime")						
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141852 then
		core:sendMessage(core.destName .. " has gained powers from Hisek the Swarmkeeper")								
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141856 then
		core:sendMessage(core.destName .. " has gained powers from Xaril the Poisoned Mind")										
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 148653 then
		core:sendMessage(core.destName .. " has gained powers from Iyyokuk the Lucid")											
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 148648 then
		core:sendMessage(core.destName .. " has gained powers from Kaz'tik the Manipulator")													
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141853 then
		core:sendMessage(core.destName .. " has gained powers from Ka'roz the Locust")															
	elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 141859 then
		core:sendMessage(core.destName .. " has gained powers from Kil'ruk the Wind-Reaver")																	
	end
end

function core.SiegeOfOrgrimmar:GarroshHellscream()
	if core.achievementsCompleted[1] == false then
		if (core.type == "SWING_DAMAGE" or core.type == "SWING_MISSED") and core.sourceID == "71979" then
			if warbringersIds[core.spawn_uid] == nil then
				warbringersIds[core.spawn_uid] = core.spawn_uid
				warbringersCounter = warbringersCounter + 1
				core:sendMessage("Kor'kron Warbringer (" .. warbringersCounter .. "/18)")
			end
		end

		if warbringersCounter == 18 and step1Complete == false then
			core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " 18 Kor'kron Warbringers Alive. They can now be killed with a single Iron Star")
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
		if core.type == "SPELL_DAMAGE" and core.destID == "71979" and core.spellId == 144653 and core.overkill > 0 and core.achievementsCompleted[1] == false then
			if warbringersKilledIds[core.spawn_uid_dest] == 1 then
				warbringersKilled = warbringersKilled + 1
				warbringersIds[core.spawn_uid_dest] = nil
				warbringersCounter = warbringersCounter - 1
				if timerStarted == false then
					timerStarted = true
					core:sendMessage("Timer Started! 10 seconds remaining")
					C_Timer.After(10, function()
						if warbringersKilled < 18 then
							core:getAchievementFailedWithMessageAfter("(" .. warbringersKilled .. "/18) killed in time (This achievement can be repeated)")
							step1Complete = false
							timerStarted = false
							warbringersKilled = 0
							warbringersKilledIds = {}
						elseif warbringersKilled >= 18 then
							core:getAchievementSuccess()										
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
			core:sendMessage("Kor'kron Warbringer DIED (" .. warbringersCounter .. "/18)")
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

function core.SiegeOfOrgrimmar:ClearVariables()
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