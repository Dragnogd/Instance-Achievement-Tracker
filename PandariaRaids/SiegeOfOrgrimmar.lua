--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Siege Of Orgrimmar Bosses
------------------------------------------------------
core.SiegeOfOrgrimmar = {}
core.SiegeOfOrgrimmar.Events = CreateFrame("Frame")

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
local rescueRaidersFailed = false
local rescueRaidersCompleted = false
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

------------------------------------------------------
---- Rescue Raiders
------------------------------------------------------
local jiFirepawComplete = false

------------------------------------------------------
---- General Nazgrim
------------------------------------------------------
local gamonDead = false

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
	--Gamon Died
	if core.type == "UNIT_DIED" and core.destID == "72192" then
		core:getAchievementFailed()
		gamonDead = true
	end

	--Gamon Found
	if (core.sourceID == "72192" or core.destID == "72192") and gamonDead == false then
		core:getAchievementSuccess()
	end
end

function core.SiegeOfOrgrimmar:Malkorok()
	if core.type == "SPELL_AURA_APPLIED" and core.destID == "72983" and core.spellId == 142848 then
		core:getAchievementSuccess()
	end

	--Corrupted Skullsplitter/Amalgamation Killed
	if core.type == "UNIT_DIED" and core.destID == "72983" and core.achievementsCompleted[1] == false then
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

function core.SiegeOfOrgrimmar:TrackAdditional()
	------------------------------------------------------
	---- Rescue Raiders
	------------------------------------------------------

	--Ji Firepaw died
	if core.type == "UNIT_DIED" and core.destID == "62445" and rescueRaidersFailed == false and jiFirepawComplete == false then
		core:sendMessage(GetAchievementLink(8453) .. " FAILED Reason: (Ji Firepaw has died")
		jiFirepawComplete = true
	end

	--Ji Firepaw saved
	if core.type == "UNIT_DIED" and core.destID == "72455" and rescueRaidersFailed == false and jiFirepawComplete == false then
		unitsSaved = unitsSaved + 1
		jiFirepawComplete = true
		core:sendMessage("Save Ji Firepaw part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)")
	end

	--Mokvar the Treasurer Killed
	if core.type == "UNIT_DIED" and core.destID == "72433" then
		core:sendMessage("Mokvar the Treasurer Killed. Use the key to rescue a set of caged prisoners")
	end

	---Alliance---

	--Overseer Thathung Killed
	if core.type == "UNIT_DIED" and core.destID == "72496" then
		C_Timer.After(3, function()
			if theramoreCitizenKilled == false and citizensSaved == false then
				unitsSaved = unitsSaved + 1
				citizensSaved = true
				core:sendMessage("Save 'A group of unwilling combat participants' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)")				
			end
		end)
	end

	--Theramore Citizens Killed
	if core.type == "UNIT_DIED" and core.destID == "72498" and theramoreCitizenKilled == false then
		theramoreCitizenKilled = true
		core:sendMessage(GetAchievementLink(8453) .. " FAILED Reason: (Theramore Citizens killed)")
	end

	---Horde---

	---Overseer Mojka---
	if core.type == "UNIT_DIED" and core.destID == "72490" then
		C_Timer.After(3, function()
			if orcsKilled == false and citizensSaved == false then
				unitsSaved = unitsSaved + 1
				citizensSaved = true
				core:sendMessage("Save 'A group of unwilling combat participants' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)")				
			end
		end)		
	end

	--Orcs Killed---
	if core.type == "UNIT_DIED" and (core.destID == "72492" or core.destID == "72493" or core.destID == "72484" or core.destID == "72485" or core.destID == "72483") and orcsKilled == false then
		orcsKilled = true
		core:sendMessage(GetAchievementLink(8453) .. " FAILED Reason: (Orcs killed)")
	end

	--Requirements Met
	if unitsSaved == 3 and rescueRaidersCompleted == false then
		rescueRaidersCompleted = true
		core:sendMessage(GetAchievementLink(8453) .. " requirements have been met. Boss can now be killed!")
	end
end

function core.SiegeOfOrgrimmar:InitialSetup()
    core.SiegeOfOrgrimmar.Events:RegisterEvent("UNIT_AURA")
end

core.SiegeOfOrgrimmar.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.SiegeOfOrgrimmar.Events:UNIT_AURA(self, unitID, ...)
	if UnitAura("Player", "Resistance Totem") and prisonersRescued == false then
		prisonersRescued = true
		unitsSaved = unitsSaved + 1
		core:sendMessage("'Rescue a set of caged prisoners,' part of "  .. GetAchievementLink(8453) .. " Completed (" .. unitsSaved .. "/3)")
	
		--Requirements Met
		if unitsSaved == 3 and rescueRaidersCompleted == false then
			rescueRaidersCompleted = true
			core:sendMessage(GetAchievementLink(8453) .. " requirements have been met. Boss can now be killed!")
		end
	end
end

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

	------------------------------------------------------
	---- General Nazgrim
	------------------------------------------------------
	gamonDead = false
end

-- elseif subzone == "Kor'kron Barracks" then
-- 	local timestamp, type, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _ = ...
-- 	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
-- 		local spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = select(12, ...)
-- 		local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-",destGUID);
		
-- 		--Corrupted Skullsplitter Pulled
-- 		if destID == "73033" and corruptedSkullsplitterPulled == false then
-- 			corruptedSkullsplitterPulled = true
-- 			SendChatMessage("[WIP] Corrupted Skullsplitter Pulled",chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
-- 		end

-- 		--Corrupted Skullsplitter Killed
-- 		if type == "UNIT_DIED" and destID == "73033" and core.achievementFailed == false then
-- 			SendChatMessage("[WIP] "  .. GetAchievementLink(8538) .. " FAILED",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
-- 			core.achievementFailed = true							
-- 		end

-- 	end
-- end