--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Azshara's Eternal Palace
------------------------------------------------------
core._2164 = {}
core._2164.Events = CreateFrame("Frame")

------------------------------------------------------
---- Abyssal Commander Sivara
------------------------------------------------------
local garvalTheVanquisherFound = false
local tideshaperKorvessFound = false
local gorjeshTheSmasherFound = false

------------------------------------------------------
---- Blackwater Behemoth
------------------------------------------------------
local collectSampleUID = {}
local samplesCollected = 0
local initialScan = false
local playersWithTracking = 0

------------------------------------------------------
---- Radiance of Azshara
------------------------------------------------------
local playersCompletedAchievement = 0
local playersWithFunRun = {}

------------------------------------------------------
---- The Queen's Court
------------------------------------------------------
local playersWithQueenFavour = {}
local saluteAnnounce = false
local curtseyAnnounce = false
local grovelAnnounce = false
local kneelAnnounce = false
local applauseAnnounce = false

------------------------------------------------------
---- Orgozoa
------------------------------------------------------
local eggFound = false
local eggFoundPlayer = nil

function core._2164:AbyssalCommanderSivara()
	--Defeat Abyssal Commander Sivara in The Eternal Palace while all three of her lieutenants are alive and engaged in the fight on Normal difficulty or higher.
	
	if core.type == "SWING_DAMAGE" and core.sourceID == "155277" then
		gorjeshTheSmasherFound = true
	end

	if core.type == "SWING_DAMAGE" and core.sourceID == "155275" then
		tideshaperKorvessFound = true
	end

	if core.type == "SWING_DAMAGE" and core.sourceID == "155273" then
		garvalTheVanquisherFound = true
	end

	if gorjeshTheSmasherFound == true and tideshaperKorvessFound == true and garvalTheVanquisherFound == true then
		core:getAchievementSuccess()
	end

    --Blizzard tracking gone red so fail achievement
	if core:getBlizzardTrackingStatus(13684) == false then
		core:getAchievementFailed()
	end
end

function core._2164:BlackwaterBehemoth()
	--Defeat the Blackwater Behemoth in The Eternal Palace after collecting 50 samples of sea life from within the Darkest Depths on Normal Difficulty of higher.

	InfoFrame_SetHeaderCounter(L["Shared_TrackingStatus"],playersWithTracking,core.groupSize)
	InfoFrame_UpdatePlayersOnInfoFrame(false)
	
	--Request which players are currently tracking this achievement
	--Sync Message, Major Version, Minor Version, update Infoframe
	if initialScan == false then
		core:sendMessage(L["Shared_PlayersRunningAddon2"],true)
		core.IATInfoFrame:SetText1(L["AzsharasEternalPalace_SamplesCollected"] .. " " .. samplesCollected,"GameFontHighlightLarge")
		core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
		core.IATInfoFrame:SetText2(L["Shared_PlayersRunningAddon2"],200)
		initialScan = true
		--Set all players to fail initially as we have not determined yet if they have the addon installed
		for player,status in ipairs(core.InfoFrame_PlayersTable) do
			InfoFrame_SetPlayerFailed(player)
		end
		C_Timer.After(3, function()
			--Ask all other addons in the group to see if they are running the addon and tracking this achievement
			C_ChatInfo.SendAddonMessage("Whizzey", "reqIAT,2,38,true", "RAID")		

			--Wait 1 second for a response from other addon in the group
			C_Timer.After(2, function() 
				local playersStr = L["Shared_TrackingAchievementFor"] .. ": "
				for player, status in pairs(core.InfoFrame_PlayersTable) do
					--For all players that have the addon running, increment the counter by 1
					core:sendDebugMessage(status) 
					if status == 2 then
						playersStr = playersStr .. player .. ", "
						playersWithTracking = playersWithTracking + 1
					end
				end
				--core:sendMessageSafe(playersStr,true)
			end)
		end)
	end	

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 302005 and collectSampleUID[core.spawn_uid_dest] == nil then
		collectSampleUID[core.spawn_uid_dest] = core.spawn_uid_dest
		samplesCollected = samplesCollected + 1
		core:sendMessage(core:getAchievement() .. samplesCollected .. " " .. L["AzsharasEternalPalace_SamplesCollected"])
		
		--Send message to other addon users
		local messageStr = core.type .. "," .. core.spellId .. "," .. core.spawn_uid_dest
		C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. messageStr, "RAID")
	end

	--Check for message in the sync queue
	for k,message in ipairs(core.syncMessageQueue) do
		if message ~= nil then
			core:sendDebugMessage("Found Message:" .. message)
			local spellType, spellid, spawnUIDDest = strsplit(",", message)
			if spellType == "SPELL_CAST_SUCCESS" and spellid == "302005" and collectSampleUID[spawnUIDDest] == nil then
				--Recieved sample from another addon user. Increment counter
				collectSampleUID[spawnUIDDest] = spawnUIDDest
				samplesCollected = samplesCollected + 1
				core:sendMessage(core:getAchievement() .. samplesCollected .. " " .. L["AzsharasEternalPalace_SamplesCollected"])
			end
			core.syncMessageQueue[k] = nil
		end
	end

	if samplesCollected >= 50 then
		core:getAchievementSuccess()
	end
end

function core._2164:LadyAshvane()
	--Defeat Lady Ashvane in The Eternal Palace after having each cast of Arcing Azerite pass through her on Normal difficulty or higher.

	--Blizzard tracking gone red so fail achievement
	if core:getBlizzardTrackingStatus(13629) == false then
		core:getAchievementFailed()
	end
end

function core._2164:Zaqul() 
    --Defeat Za'qul in the Eternal Palace after killing ten Twinklehoof Bovine on Normal difficulty or higher.

    --Blizzard tracking gone white so complete achievement
	if core:getBlizzardTrackingStatus(13716, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2164:QueenAzshara()
	--Defeat Queen Azshara in The Eternal Palace with one player still alive who is currently affected by Essence of Azeroth on Normal difficulty or higher.

	if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 300866) or (core.type == "UNIT_DIED" and core.currentDest == "Player") then
		--Loop through all players in the group and check if just 1 player is alive
		local playersAlive = 0
		local lastPlayerAliveUnit = nil
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
        
			if UnitIsDead(unit) == false then
				playersAlive = playersAlive + 1
				lastPlayerAliveUnit = unit
			end
		end
		
		if playersAlive == 1 and lastPlayerAliveUnit ~= nil then
			for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(lastPlayerAliveUnit, i)
				if spellId == 300866 then
					core:getAchievementSuccess()
				end
			end
		end
	end
end

function core._2164:RadianceOfAzshara()
	--Defeat Radiance of Azshara in The Eternal Palace after running 6 consecutive complete laps around her arena without falling into the water on Normal difficulty on higher.

	InfoFrame_UpdatePlayersOnInfoFramePersonal()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)
	
	--Achievement Completed
	if playersCompletedAchievement == #core.currentBosses[1].players then
		core:getAchievementSuccess()
		core.achievementsFailed[1] = false
	end

	--Achievement Completed but has since failed
	if playersCompletedAchievement ~= #core.currentBosses[1].players and core.achievementsCompleted[1] == true then
		core:getAchievementFailed()
		core.achievementsCompleted[1] = false 
	end
end

function core._2164:TheQueensCourt()
	--Perform various emotes to earn Queen Azshara's Favor in the Eternal Palace, then defeat The Queen's Court on Normal Difficulty or higher.

	--Announce when players should do each of the emotes
	--Form Ranks - Salute
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 303188 and saluteAnnounce == false then
		saluteAnnounce = true
		core:sendMessage(GetSpellLink(303188) .. " /" .. L["AzsharasEternalPalace_Salute"] .. " " .. L["Shared_NOW"], true)
		C_Timer.After(20, function() 
			saluteAnnounce = false
		end)
	end
	--Repeat Performance - Curtsey
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 304409 and curtseyAnnounce == false then
		curtseyAnnounce = true
		core:sendMessage(GetSpellLink(304409) .. " /" .. L["AzsharasEternalPalace_Curtsey"] .. " " .. L["Shared_NOW"], true)
		C_Timer.After(20, function() 
			curtseyAnnounce = false
		end)
	end
	--Deferred Sentance - Grovel
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 304128 and grovelAnnounce == false then
		grovelAnnounce = true
		core:sendMessage(GetSpellLink(304128) .. " /" .. L["AzsharasEternalPalace_Grovel"] .. " " .. L["Shared_NOW"], true)
		C_Timer.After(20, function() 
			grovelAnnounce = false
		end)
	end
	--Obey or Suffer - Kneel
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 297585 and kneelAnnounce == false then
		kneelAnnounce = true
		core:sendMessage(GetSpellLink(297585) .. " /" .. L["AzsharasEternalPalace_Kneel"] .. " " .. L["Shared_NOW"], true)
		C_Timer.After(20, function() 
			kneelAnnounce = false
		end)
	end
	--Stand Alone - Applause
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 297656 and applauseAnnounce == false then
		applauseAnnounce = true
		core:sendMessage(GetSpellLink(297656) .. " /" .. L["AzsharasEternalPalace_Applause"] .. " " .. L["Shared_NOW"], true)
		C_Timer.After(20, function() 
			applauseAnnounce = false
		end)
	end

	InfoFrame_UpdatePlayersOnInfoFramePersonal()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)

	--When players gains Queen Favour debuff mark player as complete
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 302029 then
		playersCompletedAchievement = playersCompletedAchievement + 1
		InfoFrame_SetPlayerComplete(core.destName)
	end

	--If player looses Queen Favour Debuff
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 302029 and core.inCombat == true then
		playersCompletedAchievement = playersCompletedAchievement - 1
		InfoFrame_SetPlayerFailed(core.destName)
	end

	--Achievement Completed
	if playersCompletedAchievement == #core.currentBosses[1].players then
		core:getAchievementSuccess()
		core.achievementsFailed[1] = false
	end

	--Achievement Completed but has since failed
	if playersCompletedAchievement ~= #core.currentBosses[1].players and core.achievementsCompleted[1] == true and core:getHealthPercent("boss1") > 0 then
		core:getAchievementFailed()
		core.achievementsCompleted[1] = false 
	end
end

function core._2164:ClearVariables()
	------------------------------------------------------
	---- Radiance of Azshara
	------------------------------------------------------
	playersCompletedAchievement = 0
	playersWithFunRun = {}
	
	------------------------------------------------------
	---- Blackwater Behemoth
	------------------------------------------------------
	collectSampleUID = {}
	samplesCollected = 0
	initialScan = false
	playersWithTracking = 0

	------------------------------------------------------
	---- The Queen's Court
	------------------------------------------------------
	playersWithQueenFavour = {}
	saluteAnnounce = false
	curtseyAnnounce = false
	grovelAnnounce = false
	kneelAnnounce = false
	applauseAnnounce = false

	------------------------------------------------------
	---- Orgozoa
	------------------------------------------------------
	eggFound = false
	eggFoundPlayer = nil
end

function core._2164:InstanceCleanup()
    core._2164.Events:UnregisterEvent("UNIT_AURA")
end

core._2164.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2164:InitialSetup()
    core._2164.Events:RegisterEvent("UNIT_AURA")
end

function core._2164.Events:UNIT_AURA(self, unitID)
	if next(core.currentBosses) ~= nil then
		if core.currentBosses[1].encounterID == 2305 then
			--Fun Run
			local foundFunRunDebuff = false
			local name, realm = UnitName(unitID)
			for i=1,40 do
				local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
				if spellId == 305173 then
					foundFunRunDebuff = true
					if name ~= nil then
						if playersWithFunRun[name] == nil then
							playersWithFunRun[name] = name
							InfoFrame_SetPlayerComplete(name)
							playersCompletedAchievement = playersCompletedAchievement + 1
							core:sendMessage(core:getAchievement() .. " " .. name .. " " .. L["Shared_HasCompleted"] .. " " .. GetSpellLink(305173) .. " " .. L["Core_Counter"] .. " (" .. playersCompletedAchievement .. "/" .. #core.currentBosses[1].players .. ")",true)
						end
					end
				end
			end

			--Check if player has completed the achievement already and if so do they still have the debuff or not
			if core.InfoFrame_PlayersTable[name] ~= nil and foundFunRunDebuff == false then
				if core.InfoFrame_PlayersTable[name] == 2 then
					if playersWithFunRun[name] ~= nil then
						--Player has lost debuff. Update InfoFrame
						InfoFrame_SetPlayerFailed(name)
						playersWithFunRun[name] = nil
						playersCompletedAchievement = playersCompletedAchievement - 1
						core:sendMessage(core:getAchievement() .. " " .. name .. " " .. L["Shared_HasFailed"] .. " " .. GetSpellLink(305173) .. " " .. L["Core_Counter"] .. " (" .. playersCompletedAchievement .. "/" .. #core.currentBosses[1].players .. ")",true)
					end
				end
			end
		elseif core.currentBosses[1].encounterID == 2303 then
			--A Smack of Jellyfish
			--Incubation Fluid: 298306
			--Incubating Zoatroid: 305322
			local incubationFluidFound = false
			local incubatingZoatroidFound = false
			local incubationFluidPlayer = ""
			local incubatingZoatroidPlayer = ""
			local name, realm = UnitName(unitID)
			for i=1,40 do
				local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
				if spellId == 298306 then
					--Incubation Fluid
					if name ~= nil then
						incubationFluidFound = true
						incubationFluidPlayer = name

						--Check requirements have been met
						if incubationFluidFound == true and incubatingZoatroidFound == true then
							if incubationFluidPlayer == incubatingZoatroidPlayer then
								core:getAchievementSuccess()
							end
						end
					end
				elseif spellId == 305322 then
					--Incubating Zoatroid
					if name ~= nil then
						incubatingZoatroidFound = true
						incubatingZoatroidPlayer = name
						eggFound = true
						eggFoundPlayer = name

						--Check requirements have been met
						if incubationFluidFound == true and incubatingZoatroidFound == true then
							if incubationFluidPlayer == incubatingZoatroidPlayer then
								core:getAchievementSuccess()
							end
						end
					end
				end
			end

			--Check if player has dropped the egg or not
			if eggFound == true and incubatingZoatroidFound == false and eggFoundPlayer == name and core.inCombat and core:getHealthPercent("boss1") > 0 then
				core:getAchievementFailed()
			end
		end
	end	
end