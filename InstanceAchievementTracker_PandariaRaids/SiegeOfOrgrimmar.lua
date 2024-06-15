--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Siege Of Orgrimmar Bosses
------------------------------------------------------
core._1136 = {}
core._1136.Events = CreateFrame("Frame")

------------------------------------------------------
---- Immerseus
------------------------------------------------------
local tearsOfTheValeKilled = 0
local mobSpawnIDs = {}
local safeToKillTears = false --Achievement bugs out if the mob are killed too fast.
local bossReformed = false

------------------------------------------------------
---- TheFallenProtectors
------------------------------------------------------
local playersRecievedMark = {}
local playersRecievedMarkCounter = 0

------------------------------------------------------
---- Iron Juggernaut
------------------------------------------------------
local superheatedCrawlerMinesSquashed = 0
local superheatedCrawlerMinesUID = {}

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
local ironStarIds = {}

------------------------------------------------------
---- Rescue Raiders
------------------------------------------------------
local jiFirepawComplete = false

------------------------------------------------------
---- General Nazgrim
------------------------------------------------------
local gamonDead = false

------------------------------------------------------
---- Garrosh Hellscream
------------------------------------------------------
local warbringersIds = {}
local warbringersCounter = 0
local step1Complete = false
local warbringersKilled = 0
local killedTimestamp = nil

local garroshStarted = false
local garroshTimerStarted = false
local garroshCompleted = false
local garroshMessageQueue = nil

local temp123 = {}

function core._1136:Immerseus()
	-- if (core.type == "SWING_DAMAGE_LANDED" or core.type == "SWING_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and bossReformed == true and core.sourceID == "71543" then
	-- 	if timerStarted == false then
	-- 		timerStarted = true
	-- 		C_Timer.After(3, function()
	-- 			if core.inCombat == true then 
	-- 				core:sendMessage("Kill the Tears of the Vale Now")
	-- 				safeToKillTears = true
	-- 				timerStarted = false
	-- 				bossReformed = false
	-- 			end
	-- 		end)
	-- 	end
	-- end

	-- if core.type == "UNIT_DIED" and core.destName == "Tears of the Vale" and tearsOfTheValeKilled < 10 and safeToKillTears == true then
	-- 	tearsOfTheValeKilled = tearsOfTheValeKilled + 1
	-- 	core:sendMessage("Tears of the Vale Killed ("  .. tearsOfTheValeKilled .. "/10)")
	-- end

	-- if tearsOfTheValeKilled == 10 then
	-- 	core:getAchievementSuccess()
	-- end

	--Blizzard Tracker has gone white so achievement is completed
	if core:getBlizzardTrackingStatus(8536) == true then
		core:getAchievementSuccess()
	end
end

function core._1136:TheFallenProtectors()
	--Don't count the mark for the the first person that has recieved it
	-- if core.type == "SPELL_AURA_APPLIED" and core.spellId == 143840 then
	-- 	table.insert(playersRecievedMark, core.spawn_uid_dest_Player)
	-- end

	-- if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 143842 and core:has_value(playersRecievedMark, core.spawn_uid_dest_Player) == false and core.achievementsCompleted[1] == false then
	-- 	table.insert(playersRecievedMark, core.spawn_uid_dest_Player)
	-- 	playersRecievedMarkCounter = playersRecievedMarkCounter + 1
	-- 	core:sendMessage("Unique Players Recieved Mark of Anguish ("  .. playersRecievedMarkCounter .. "/5)")
	-- end

	-- if playersRecievedMarkCounter == 5 then
	-- 	core:getAchievementSuccessWithCustomMessage(GetAchievementLink(core.achievementIDs[1]) .. " '5 unique players recieved Mark of Anguish' part of the achievement complete. Make sure 200yards have also been covered before killing boss'")
	-- end

	--Blizzard Tracker has gone white so achievement has been completed
	if core:getBlizzardTrackingStatus(8528) == true then
		core:getAchievementSuccess()
	end
end

function core._1136:AmalgamOfCorruption()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 145132 then
		core:getAchievementFailed()
	end
end

function core._1136:ShaOfPride()
	--Mocking Blast
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 144379 then
		core:getAchievementFailedWithMessageAfter("(Mocking Blast has to be interrupted)")
	end

	--Last Word
	if core.type == "UNIT_DIED" and core.destID == "71946" and core.achievementsFailed[1] == false then
		core:sendMessage("WARNING: Manifestation of Pride has died. If the closest 2 players to the add did not have " .. GetSpellLink(146595) .. " then the achievement has FAILED")
	end
end

function core._1136:GeneralNazgrim()
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

function core._1136:Malkorok()
	if core.type == "SPELL_AURA_APPLIED" and core.destID == "72983" and core.spellId == 142848 then
		core:getAchievementSuccess()
	end

	--Corrupted Skullsplitter/Amalgamation Killed
	if core.type == "UNIT_DIED" and core.destID == "72983" and core.achievementsCompleted[1] == false then
		core:getAchievementFailedWithMessageAfter("Do not kill boss (This achievement can be repeated)")						
	end
end

function core._1136:SecuredStockpileOfPandarenSpoils()
	-- local unitTypeSrc, sourceID, spawn_uid = strsplit("-",core.sourceGUID)
	-- if core.type == "SWING_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" then
	-- 	if playersSide[spawn_uid] == nil then
	-- 		if core:has_value(mantridMobs, core.destID) then
	-- 			--print("Adding " .. core.sourceName .. " to Mantrid")
	-- 			playersSide[spawn_uid] = "Mantrid"
	-- 		elseif core:has_value(moguMobs, core.destID) then
	-- 			--print("Adding " .. core.sourceName .. " to Mogu")
	-- 			playersSide[spawn_uid] = "Mogu"
	-- 		end
	-- 	elseif playersSide[spawn_uid] ~= nil then
	-- 		if core:has_value(mantridMobs, core.destID) then
	-- 			if playersSide[spawn_uid] ~= "Mantrid" then
	-- 				core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ")")
	-- 			end
	-- 		elseif core:has_value(moguMobs, core.destID) then
	-- 			if playersSide[spawn_uid] ~= "Mogu" then
	-- 				core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ")")
	-- 			end					
	-- 		end
	-- 	end
	-- end
end

function core._1136:ThokTheBloodthirsty()
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

function core._1136:SiegecrafterBlackfuse()
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

function core._1136:Paragons()
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

function core._1136:GarroshHellscream()
	core.MobCounter:Setup(18, 0, "71979", false)
	core.MobCounter:DetectSpawnedMob()
	core.MobCounter:DetectKilledMob("SPELL_DAMAGE", 144653)
	
	--Blizzard Tracker has gone white so achievement completed
	if core:getBlizzardTrackingStatus(8537) == true then
		core:getAchievementSuccess()
		core.MobCounter:AdjustCriteria()
	end
end

function core._1136:TrackAdditional()
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss7"].enabled == true then
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
end

function core._1136:InstanceCleanup()
    core._1136.Events:UnregisterEvent("UNIT_TARGET")
    core._1136.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._1136.Events:UnregisterEvent("UNIT_AURA")
    core._1136.Events:UnregisterEvent("UNIT_HEALTH")
end

function core._1136:InitialSetup()
    core._1136.Events:RegisterEvent("UNIT_TARGET")
    core._1136.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._1136.Events:RegisterEvent("UNIT_AURA")
    core._1136.Events:RegisterEvent("UNIT_HEALTH")
end

core._1136.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1136.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true and core:has_value(core.achievementIDs, 8520) then
		if UnitName(unitID) == L["Superheated Crawler Mine"] and spellID == 144781 then
			local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID))
			if superheatedCrawlerMinesUID[spawn_uid_dest] == nil then
				superheatedCrawlerMinesUID[spawn_uid_dest] = spawn_uid_dest
				superheatedCrawlerMinesSquashed = superheatedCrawlerMinesSquashed + 1
				core:sendMessage(core:getAchievement() .. " Superheated Crawler Mines Stomped (" .. superheatedCrawlerMinesSquashed .. "/6)")
	
				if superheatedCrawlerMinesSquashed == 6 then
					core:getAchievementSuccess()
				end
			end
		end
	end

end

function core._1136.Events:UNIT_AURA(self, unitID, ...)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss7"].enabled == true then
		for i=1,40 do
			local _, _, _, _, _, _, _, _, _, spellId = UnitAura("Player", i)
			if (spellId == 145730 or spellId == 145729 or spellId == 145732) and prisonersRescued == false then
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
	end
end

function core._1136.Events:UNIT_HEALTH(self, unitID, ...)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss14"].enabled == true and core:has_value(core.achievementIDs, 8537) then
		--If Warbringer health is at 15% or less than mark it as ready
		-- local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unitID))
		-- if core:getHealthPercent(unitID) <= 15 and destID == "71979" then
		-- 	if warbringersIds[spawn_uid_dest] == nil and warbringersIds[spawn_uid_dest] ~= "dead" then
		-- 		warbringersIds[spawn_uid_dest] = "fifteen"
		-- 		warbringersCounter = warbringersCounter + 1
		-- 		core:sendDebugMessage("PERCENT: " .. spawn_uid_dest)
		-- 		core:sendDebugMessage("Kor'kron Warbringer at <= 15% health (" .. warbringersCounter .. "/18)", warbringersCounter, 1)
		-- 		garroshMessageQueue = "Kor'kron Warbringer at <= 15% health (" .. warbringersCounter .. "/18)"
		-- 	end
		-- elseif core:getHealthPercent(unitID) > 15 and destID == "71979" then
		-- 	--If mob was healed then we need to subtract 1 from the counter
		-- 	if warbringersIds[spawn_uid_dest] == "fifteen" then
		-- 		warbringersIds[spawn_uid_dest] = nil
		-- 		warbringersCounter = warbringersCounter - 1
		-- 		core:sendDebugMessage("HEALED: " .. spawn_uid_dest)
		-- 		core:sendDebugMessage("Kor'kron Warbringer at <= 15% health (" .. warbringersCounter .. "/18)", warbringersCounter, 1)
		-- 		garroshMessageQueue = "Kor'kron Warbringer at <= 15% health (" .. warbringersCounter .. "/18)"				
		-- 	end
		-- end	
	end
end

function core._1136:ClearVariables()
	------------------------------------------------------
	---- Immerseus
	------------------------------------------------------
	tearsOfTheValeKilled = 0
	mobSpawnIDs = {}
	safeToKillTears = false
	bossReformed = false

	------------------------------------------------------
	---- TheFallenProtectors
	------------------------------------------------------
	playersRecievedMark = {}
	playersRecievedMarkCounter = 0

	------------------------------------------------------
	---- Iron Juggernaut
	------------------------------------------------------
	superheatedCrawlerMinesSquashed = 0
	superheatedCrawlerMinesUID = {}

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

	------------------------------------------------------
	---- Garrosh Hellscream
	------------------------------------------------------
	warbringersIds = {}
	warbringersCounter = 0
	step1Complete = false
	warbringersKilled = 0
	killedTimestamp = nil

	garroshStarted = false
	garroshTimerStarted = false
	garroshCompleted = false
	garroshMessageQueue = false
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