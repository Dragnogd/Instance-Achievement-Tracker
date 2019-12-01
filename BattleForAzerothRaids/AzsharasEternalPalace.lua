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
---- Abyssal Commander Sivara Test
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
local announceCatch = false

------------------------------------------------------
---- Za'qul
------------------------------------------------------
local twinklehoofBovineKilled = 0

function core._2164:BlackwaterBehemoth()
	--Defeat the Blackwater Behemoth in The Eternal Palace after collecting 50 samples of sea life from within the Darkest Depths on Normal Difficulty of higher.

	InfoFrame_SetHeaderCounter(L["AzsharasEternalPalace_SamplesCollected"],InfoFrame_GetManualCounterCount(),50)
	InfoFrame_UpdatePlayersOnInfoFrame(false)
	InfoFrame_SetupManualCounter(50)
	core.IATInfoFrame:SetText1(L["Shared_Notes"] .. "\n\n" .. L["Shared_ManualTracking"],"GameFontHighlight",nil,200)
	
	if initialScan == false then
		initialScan = true
		core:sendMessage(L["Shared_ManualTracking"],true)
	end
end

function core._2164:LadyAshvane()
	--Defeat Lady Ashvane in The Eternal Palace after having each cast of Arcing Azerite pass through her on Normal difficulty or higher.

	--Blizzard tracking gone red so fail achievement
	if core:getBlizzardTrackingStatus(13629) == false then
		core:getAchievementFailed()
	end
end

function core._2164:Orgozoa()
	--Defeat Orgozoa in the Hatchery in The Eternal Palace after incubating a baby Zoatroid on Normal Difficulty or higher.

	--If egg not found by time Massive Incubator spellcast is started then fail achievement
	if core.type == "SPELL_CAST_START" and core.spellId == 298548 and eggFound == false then
		core:getAchievementFailed()
	end

	--If egg found by time Massive Incubator spellcast is interrupted then achievement is completed
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 305347 and eggFound == true and core.achievementsFailed[1] == false then
		C_Timer.After(3, function() 
			if eggFound == true and core.achievementsFailed[1] == false then
				core:getAchievementSuccess()
			end
		end)
	end
end

function core._2164:Zaqul() 
    --Defeat Za'qul in the Eternal Palace after killing ten Twinklehoof Bovine on Normal difficulty or higher.

    --Blizzard tracking gone white so complete achievement
	if core:getBlizzardTrackingStatus(13716, 1) == true then
		core:getAchievementSuccess()
	end

	--Twinklehoof Bovine Killed
	if core.type == "UNIT_DIED" and core.destID == "155648" then
		twinklehoofBovineKilled = twinklehoofBovineKilled + 1
		core:sendMessage(core:getAchievement() .. " " .. getNPCName(155648) .. " " .. L["Shared_Killed"] .. " (" .. twinklehoofBovineKilled .. "/10)")
	end

	--Whimsy Realm has worn off. Check if achievement was completed in time or not.
	-- if core.type == "SPELL_AURA_REMOVED" and core.spellId == 303266 and core.destName ~= nil then
	-- 	if UnitIsDead(core.destName) == false and core.achievementsCompleted[1] == false then
	-- 		--Player is alive, lost the debuff and achievement is not completed. Mark achievement as failed
	-- 		core:getAchievementFailed()
	-- 	end
	-- end
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
	if playersCompletedAchievement ~= #core.currentBosses[1].players and core.achievementsCompleted[1] == true and core:getHealthPercent("boss1") > 0 then
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
		core:sendMessage(GetSpellLink(303188) .. " " .. format(L["AzsharasEternalPalace_TargetAndPerformEmote"], getNPCName(152910), L["AzsharasEternalPalace_Salute"]), true)
		C_Timer.After(20, function() 
			saluteAnnounce = false
		end)
	end
	--Repeat Performance - Curtsey
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 304409 and curtseyAnnounce == false then
		curtseyAnnounce = true
		core:sendMessage(GetSpellLink(304409) .. " " .. format(L["AzsharasEternalPalace_TargetAndPerformEmote"], getNPCName(152910), L["AzsharasEternalPalace_Curtsey"]), true)
		C_Timer.After(20, function() 
			curtseyAnnounce = false
		end)
	end
	--Deferred Sentance - Grovel
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 304128 and grovelAnnounce == false then
		grovelAnnounce = true
		core:sendMessage(GetSpellLink(304128) .. " " .. format(L["AzsharasEternalPalace_TargetAndPerformEmote"], getNPCName(152910), L["AzsharasEternalPalace_Grovel"]), true)
		C_Timer.After(20, function() 
			grovelAnnounce = false
		end)
	end
	--Obey or Suffer - Kneel
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 297585 and kneelAnnounce == false then
		kneelAnnounce = true
		core:sendMessage(GetSpellLink(297585) .. " " .. format(L["AzsharasEternalPalace_TargetAndPerformEmote"], getNPCName(152910), L["AzsharasEternalPalace_Kneel"]), true)
		C_Timer.After(20, function() 
			kneelAnnounce = false
		end)
	end
	--Stand Alone - Applause
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 297656 and applauseAnnounce == false then
		applauseAnnounce = true
		core:sendMessage(GetSpellLink(297656) .. " " .. format(L["AzsharasEternalPalace_TargetAndPerformEmote"], getNPCName(152910), L["AzsharasEternalPalace_Applause"]), true)
		C_Timer.After(20, function() 
			applauseAnnounce = false
		end)
	end

	InfoFrame_UpdatePlayersOnInfoFramePersonal()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)

	--Make sure we remove realm info from player before checking name
	local name = nil
	if core.destName ~= nil then
		if string.find(core.destName, "-") then
			local splitName, splitRealm = strsplit("-", core.destName)
			name = splitName
		else
			name = core.destName
		end
	end

	--When players gains Queen Favour debuff mark player as complete
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 302029 and core.InfoFrame_PlayersTable[name] ~= nil then
		playersCompletedAchievement = playersCompletedAchievement + 1
		InfoFrame_SetPlayerComplete(core.destName)
	end

	--If player looses Queen Favour Debuff
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 302029 and core.inCombat == true and core.InfoFrame_PlayersTable[name] ~= nil then
		playersCompletedAchievement = playersCompletedAchievement - 1
		InfoFrame_SetPlayerFailed(core.destName)
	end

	--Achievement Completed
	if playersCompletedAchievement == #core.currentBosses[1].players then
		core:getAchievementSuccess()
		core.achievementsFailed[1] = false
	end

	-- --Achievement Completed but has since failed
	-- if playersCompletedAchievement ~= #core.currentBosses[1].players and core.achievementsCompleted[1] == true and core:getHealthPercent("boss1") > 0 then
	-- 	core:getAchievementFailed()
	-- 	core.achievementsCompleted[1] = false 
	-- end
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
	announceCatch = false

	------------------------------------------------------
	---- Za'qul
	------------------------------------------------------
	twinklehoofBovineKilled = 0
end

function core._2164:InstanceCleanup()
    core._2164.Events:UnregisterEvent("UNIT_AURA")
    core._2164.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2164.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2164:InitialSetup()
    core._2164.Events:RegisterEvent("UNIT_AURA")
    core._2164.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
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
						if playersWithFunRun[name] == nil and core.InfoFrame_PlayersTable[name] ~= nil then
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
					if playersWithFunRun[name] ~= nil and core:getHealthPercent("boss1") > 0 and core.InfoFrame_PlayersTable[name] ~= nil then
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
				-- if spellId == 298306 then
				-- 	--Incubation Fluid
				-- 	if name ~= nil then
				-- 		incubationFluidFound = true
				-- 		incubationFluidPlayer = name

				-- 		--Check requirements have been met
				-- 		if incubationFluidFound == true and incubatingZoatroidFound == true then
				-- 			if incubationFluidPlayer == incubatingZoatroidPlayer then
				-- 				core:getAchievementSuccess()
				-- 			end
				-- 		end
				-- 	end
				if spellId == 305322 then
					--Incubating Zoatroid
					if name ~= nil then
						incubatingZoatroidFound = true
						incubatingZoatroidPlayer = name
						eggFound = true
						eggFoundPlayer = name

						--Check requirements have been met
						if incubatingZoatroidFound == true then
							--Announce player has caught the egg
							if announceCatch == false then
								announceCatch = true
								core:sendMessage(name .. " " .. L["Shared_HasCaught"] .. " " .. GetSpellLink(305322),true)
							end
							-- core:getAchievementSuccess()
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

function core._2164.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
	if spellID == 302005 then
		core:sendDebugMessage("IN UNIT SPELLCAST SUCEDDED")
		core:sendDebugMessage(spellID)
		core:sendDebugMessage(castGUID)
	end
end