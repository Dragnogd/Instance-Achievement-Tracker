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

------------------------------------------------------
---- Radiance of Azshara
------------------------------------------------------
local playersCompletedAchievement = 0
local playersWithFunRun = {}

------------------------------------------------------
---- The Queen's Court
------------------------------------------------------
local playersWithQueenFavour = {}
local salutePlayers = {}
local curtseyPlayers = {}
local grovelPlayers = {}
local kneelPlayers = {}
local applausePlayers = {}
local queenInititalSetup = false

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

	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 302005 and collectSampleUID[core.spawn_uid_dest] == nil then
		collectSampleUID[core.spawn_uid_dest] = core.spawn_uid_dest
		samplesCollected = samplesCollected + 1
		core:sendMessage(core:getAchievement() .. " " .. L["AzsharasEternalPalace_SamplesCollected"])
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

	if core.type == "UNIT_DIED" and core.currentDest == "Player" then
		--Loop through all players in the group and check if just 1 player is alive
		local playersAlive = 0
		local lastPlayerAlive = nil
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
				local name = UnitName(unit)
				lastPlayerAlive = name
			end
		end
		
		if playersAlive == 1 then
			for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(unit, i)
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
	
	if playersCompletedAchievement == #core.currentBosses[1].players then
		core:getAchievementSuccess()
	end
end

function core._2164:TheQueensCourt()
	--Perform various emotes to earn Queen Azshara's Favor in the Eternal Palace, then defeat The Queen's Court on Normal Difficulty or higher.

	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)

	--Initital Setup
	if queenInititalSetup == false then
		queenInititalSetup = true
		--Set emotes for all players
		local messageStr = ""
		local colourWhite = "|cffFFFFFF"
		for player, status in pairs(core.InfoFrame_PlayersTable) do
			InfoFrame_SetPlayerNeutralWithMessage(player,L["AzsharasEternalPalace_Salute"] .. ", " .. L["AzsharasEternalPalace_Curtsey"] .. ", " ..  L["AzsharasEternalPalace_Applause"] .. ", " ..  L["AzsharasEternalPalace_Grovel"] .. ", " .. L["AzsharasEternalPalace_Kneel"])
		end
	end
	
	--When players gains Queen Favour debuff mark player as complete
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 302029 then
		InfoFrame_SetPlayerCompleteWithMessage(core.destName, "")
		core:getAchievementSuccessPersonalWithName(1, core.destName)

		--Reset failed variable
		core.playersFailedPersonal[core:getNameOnly(core.destName)] = nil
	end

	--If player looses Queen Favour Debuff
	if core.type == "SPELL_AURA_REMOVED" and core.spellId == 302029 then
		local name = core.destName
		C_Timer.After(1, function() 
			if core.inCombat == true then
				InfoFrame_SetPlayerFailedWithMessage(name, L["AzsharasEternalPalace_Salute"] .. ", " .. L["AzsharasEternalPalace_Curtsey"] .. ", " ..  L["AzsharasEternalPalace_Applause"] .. ", " ..  L["AzsharasEternalPalace_Grovel"] .. ", " .. L["AzsharasEternalPalace_Kneel"])

				--Reset tables
				kneelPlayers[core:getNameOnly(name)] = nil
				grovelPlayers[core:getNameOnly(name)] = nil
				applausePlayers[core:getNameOnly(name)] = nil
				salutePlayers[core:getNameOnly(name)] = nil
				curtseyPlayers[core:getNameOnly(name)] = nil
		
				--Announce fail and reset complete
				core:getAchievementFailedPersonalWithName(1, name)
				core.playersSuccessPersonal[core:getNameOnly(name)] = nil
			end
		end)
	end

	--If player dies reset counters
	if core.type == "UNIT_DIED" and UnitIsPlayer(core.destName) then
		--Reset tables
		kneelPlayers[core:getNameOnly(name)] = nil
		grovelPlayers[core:getNameOnly(name)] = nil
		applausePlayers[core:getNameOnly(name)] = nil
		salutePlayers[core:getNameOnly(name)] = nil
		curtseyPlayers[core:getNameOnly(name)] = nil

		InfoFrame_SetPlayerNeutralWithMessage(core.destName, L["AzsharasEternalPalace_Salute"] .. ", " .. L["AzsharasEternalPalace_Curtsey"] .. ", " ..  L["AzsharasEternalPalace_Applause"] .. ", " ..  L["AzsharasEternalPalace_Grovel"] .. ", " .. L["AzsharasEternalPalace_Kneel"])
	end

	if playersCompletedAchievement == #core.currentBosses[1].players then
		core:getAchievementSuccess()
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

	------------------------------------------------------
	---- The Queen's Court
	------------------------------------------------------
	playersWithQueenFavour = {}
	salutePlayers = {}
	curtseyPlayers = {}
	grovelPlayers = {}
	kneelPlayers = {}
	applausePlayers = {}
	queenInititalSetup = false
end

function core._2164:InstanceCleanup()
    core._2164.Events:UnregisterEvent("UNIT_AURA")
    core._2164.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
end

core._2164.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2164:InitialSetup()
    core._2164.Events:RegisterEvent("UNIT_AURA")
    core._2164.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
end

function core._2164.Events:UNIT_AURA(self, unitID)
	if next(core.currentBosses) ~= nil then
		if core.currentBosses[1].encounterID == 2305 then
			--Fun Run
			for i=1,40 do
				local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
				if spellId == 305173 then
					local name, realm = UnitName(unitID)
					if name ~= nil then
						if playersWithFunRun[name] == nil then
							playersWithFunRun[name] = name
							InfoFrame_SetPlayerComplete(name)
							playersCompletedAchievement = playersCompletedAchievement + 1
							core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(305173) .. " " .. L["Core_Counter"] .. " (" .. playersCompletedAchievement .. "/" .. core.groupSize .. ")")
						end
						-- core:getAchievementSuccessPersonalWithName(1, sender)
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
			for i=1,40 do
				local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
				if spellId == 298306 then
					--Incubation Fluid
					local name, realm = UnitName(unitID)
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
					local name, realm = UnitName(unitID)
					if name ~= nil then
						incubatingZoatroidFound = true
						incubatingZoatroidPlayer = name

						--Check requirements have been met
						if incubationFluidFound == true and incubatingZoatroidFound == true then
							if incubationFluidPlayer == incubatingZoatroidPlayer then
								core:getAchievementSuccess()
							end
						end
					end
				end
			end
		end
	end	
end

function core._2164.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
	if next(core.currentBosses) ~= nil then
		if core.currentBosses[1].encounterID == 2311 then
			--Form Ranks - Salute
			--Repeat Performance - Curtsey
			--Deferred Sentance - Grovel
			--Obey or Suffer - Kneel
			--Stand Alone - Applause

			sender = core:getNameOnly(sender)

			if UnitIsPlayer(sender) then
				if string.match(message, format(L["AzsharasEternalPalace_SaluteSelf"], getNPCName(152910))) or string.match(message, L["AzsharasEternalPalace_CurtseySelf"]) or string.match(message, L["AzsharasEternalPalace_GrovelSelf"]) or string.match(message, L["AzsharasEternalPalace_KneelSelf"]) or string.match(message, L["AzsharasEternalPalace_ApplauseSelf"]) or string.match(message, L["AzsharasEternalPalace_SaluteSelf"]) or string.match(message, L["AzsharasEternalPalace_CurtseyOther"]) or string.match(message, L["AzsharasEternalPalace_GrovelOther"]) or string.match(message, L["AzsharasEternalPalace_KneelOther"]) or string.match(message, L["AzsharasEternalPalace_ApplauseOther"]) then
					core:sendDebugMessage("Detected compatible emote")
					if string.match(message, getNPCName(152910)) and core.playersSuccessPersonal[sender] == nil then
						core:sendDebugMessage("Detected Queen Azshara")
						--They have praised the correct npc. Check if they have the correct buff
						local updateInfoFrameForPlayer = false
						for i=1,40 do
							local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(sender, i)
							
							--Form Ranks (In Formation) 303188
							if spellId == 303188 and salutePlayers[sender] == nil then
								--Check if the player actually needs the achievement since it is personal
								core:sendDebugMessage("Found player who Salute Queen with In Formation")
								core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Add player to appropriate table and update InfoFrame
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									core:sendDebugMessage("Updating personal achievement on InfoFrame for: " .. sender)
									updateInfoFrameForPlayer = true
								end
								salutePlayers[sender] = true
							end

							--Repeat Performance 304409
							if spellId == 304409 and curtseyPlayers[sender] == nil then
								--Check if the player actually needs the achievement since it is personal
								core:sendDebugMessage("Found player who Curtsey Queen with Repeat Perforamance")
								core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Add player to appropriate table and update InfoFrame
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									core:sendDebugMessage("Updating personal achievement on InfoFrame for: " .. sender)
									updateInfoFrameForPlayer = true
								end
								curtseyPlayers[sender] = true
							end

							--Deferred Sentence 304128
							if spellId == 304128 and grovelPlayers[sender] == nil then
								--Check if the player actually needs the achievement since it is personal
								core:sendDebugMessage("Found player who grovel Queen with Deferred Sentence")
								core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Add player to appropriate table and update InfoFrame
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									core:sendDebugMessage("Updating personal achievement on InfoFrame for: " .. sender)
									updateInfoFrameForPlayer = true
								end
								grovelPlayers[sender] = true
							end

							--Obey or Suffer 297585
							if spellId == 297585 and kneelPlayers[sender] == nil then
								--Check if the player actually needs the achievement since it is personal
								core:sendDebugMessage("Found player who kneel Queen with Obey or Suffer")
								core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Add player to appropriate table and update InfoFrame
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									core:sendDebugMessage("Updating personal achievement on InfoFrame for: " .. sender)
									updateInfoFrameForPlayer = true
								end
								kneelPlayers[sender] = true
							end

							--Stand Alone 297656
							if spellId == 297656 and applausePlayers[sender] == nil then
								--Check if the player actually needs the achievement since it is personal
								core:sendDebugMessage("Found player who applause Queen with Stand Alone")
								core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Add player to appropriate table and update InfoFrame
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									core:sendDebugMessage("Updating personal achievement on InfoFrame for: " .. sender)
									updateInfoFrameForPlayer = true
								end
								applausePlayers[sender] = true
							end
						end

						if updateInfoFrameForPlayer == true then		
							--Update InfoFrame to show missing emotes
							local emoteStr = ""
							if salutePlayers[sender] ~= true then
								emoteStr = emoteStr ..  L["AzsharasEternalPalace_Salute"] .. ", "
							end
							if curtseyPlayers[sender] ~= true then
								emoteStr = emoteStr ..  L["AzsharasEternalPalace_Curtsey"] .. ", "
							end
							if applausePlayers[sender] ~= true then
								emoteStr = emoteStr ..  L["AzsharasEternalPalace_Applause"] .. ", "
							end
							if grovelPlayers[sender] ~= true then
								emoteStr = emoteStr ..  L["AzsharasEternalPalace_Grovel"] .. ", "
							end
							if kneelPlayers[sender] ~= true then
								emoteStr = emoteStr ..  L["AzsharasEternalPalace_Kneel"]
							end
							InfoFrame_SetPlayerNeutralWithMessage(sender,emoteStr)

							--Send message to other addon users
							--C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. sender, "RAID")
						end
					end
				end
			end
		end
	end
end

