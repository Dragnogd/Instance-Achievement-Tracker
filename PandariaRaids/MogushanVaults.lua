--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Mogu'shan Vaults
------------------------------------------------------
core._1008 = {}
core._1008.Events = CreateFrame("Frame")

------------------------------------------------------
---- The Stone Guard
------------------------------------------------------
local mustLoveDogsActive = false
local mustLoveDogsCounter = 0
local TheStoneGuardKilled = false

------------------------------------------------------
---- Feng The Accursed
------------------------------------------------------
local EpicenterReversed = false
local WildfireSparkReversed = false
local ArcaneResonanceReversed = false
local LightningFistsReversed = false
local ArcaneVelocityReversed = false
local itemsReversed = 0

------------------------------------------------------
---- The Spirit Kings
------------------------------------------------------
local playersDancing = 0
local GettingHotComplete = false

------------------------------------------------------
---- Elegon
------------------------------------------------------
local empyrealFocusesDeactivated = 0
local energyChargeKilled = false

------------------------------------------------------
---- Will of The Emperor
------------------------------------------------------
local playerExecutedStrikeJanxi = 0
local playerExecutedStrikeQinxi = 0
local playersFailCounter = {}
local playersStrikeFailCounter = {}
local timerStarted = false
local inititalFailSetup = false
local playerExecutedStrikeDisplay = 0
local JanXiPlayers = {}
local QinXiPlayers = {}

function core._1008:TheStoneGuard()
	--Defeat the Stone Guard in Mogu'shan Vaults on Normal or Heroic difficulty while every member of your raid is accompanied by a canine companion pet.

	--Lets show an InfoFrame which updates when a player hovers over pets in the raid or summons a pet
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
end

function core._1008:FengTheAccursed()
	if mustLoveDogsActive == true then
		TheStoneGuardKilled = true
		core.IATInfoFrame:ToggleOff()
		infoFrameShown = false   
		mustLoveDogsActive = false
	end
	
	if core.type == "SPELL_AURA_APPLIED" then
		if core.spellId == 116936 and EpicenterReversed == false then
			EpicenterReversed = true
			itemsReversed = itemsReversed + 1
			C_Timer.After(8, function() 
				core:sendMessage(GetSpellLink(116936) .. " " .. L["Shared_Completed"] .. " (" .. itemsReversed .. "/5)")
			end)
		elseif core.spellId == 118307 and WildfireSparkReversed == false then
			WildfireSparkReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage(GetSpellLink(118307) .. " " .. L["Shared_Completed"] .. " (" .. itemsReversed .. "/5)")			
		elseif core.spellId == 118194 and ArcaneResonanceReversed == false then
			ArcaneResonanceReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage(GetSpellLink(118194) .. " " .. L["Shared_Completed"] .. " (" .. itemsReversed .. "/5)")
		elseif core.spellId == 115730 and LightningFistsReversed == false then
			LightningFistsReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage(GetSpellLink(115730) .. " " .. L["Shared_Completed"] .. " (" .. itemsReversed .. "/5)")
		end
	elseif core.type == "SPELL_CAST_SUCCESS" then
		if core.spellId == 116938 and ArcaneVelocityReversed == false then
			ArcaneVelocityReversed = true
			itemsReversed = itemsReversed + 1
			C_Timer.After(8, function() 
				core:sendMessage(GetSpellLink(116938) .. " " .. L["Shared_Completed"] .. " (" .. itemsReversed .. "/5)")			
			end)
		end
	end

	if itemsReversed == 5 then
		core:getAchievementSuccess()
	end
end

function core._1008:Elegon()
	if core.type == "UNIT_DIED" and core.destID == "60913" then
		energyChargeKilled = true
	end

	if core.type == "SPELL_CAST_SUCCESS" and core.sourceID == "60776" and core.spellId == 116989 and energyChargeKilled == false then
		empyrealFocusesDeactivated = empyrealFocusesDeactivated + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(10, function() 
				if empyrealFocusesDeactivated == 6 then
					core:getAchievementSuccess()
				else
					core:getAchievementFailedWithMessageAfter(format(L["Shared_AddKillCounter"], getNPCName(60776)) .. " (" .. empyrealFocusesDeactivated .. "/6)")
					empyrealFocusesDeactivated = 0
				end
			end)
		else
			if empyrealFocusesDeactivated == 6 then
				core:getAchievementSuccess()
			end
		end
	end
end

function core._1008:TheSpiritKings()
	--If boss has cast pillage start timer
	--If user dances and timer has started add to array and user is not already in the array
	--If player gets pillaged add to another array
	--Compare 2 arrays once timer has finished. If they dance at the correct time and got hit by pillaged at the end they executed the move at the correct time
	--Announce in chat who did not dance in time.
	
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],playersDancing,core.maxPlayers)
	core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
	core.IATInfoFrame:SetText2(L["Shared_PlayersTwentyFiveyards"],200)

	--Pillage started
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 118049 and GettingHotComplete == false then
		--Reset Players
		for player,status in pairs(core.InfoFrame_PlayersTable) do
			core.InfoFrame_PlayersTable[player] = 3
        end
		playersDancing = 0

		C_Timer.After(14, function() 
			--Players have 14 seconds to dance while having the pillage debuff
			if playersDancing == core.maxPlayers then
				core:getAchievementSuccess()
				GettingHotComplete = true
			else
				core:sendMessageSafe(core:getAchievement() .. " (" .. playersDancing .. "/" .. core.maxPlayers .. ") " .. L["MogushanVaults_PlayersWhoDidNotDance"] .. " " .. InfoFrame_GetIncompletePlayers(),true)
			end
		end)
	end

	--Check for message in the sync queue
	for k,sender in ipairs(core.syncMessageQueue) do
		if sender ~= nil then
			core:sendDebugMessage("Found Message:" .. sender)
			--Set player to complete on InfoFrame
			local success = InfoFrame_SetPlayerComplete(sender)
			if success then
				playersDancing = playersDancing + 1								
			end
			core.syncMessageQueue[k] = nil
		end
	end
end

function core._1008:ClearVariables()
	------------------------------------------------------
	---- Feng The Accursed
	------------------------------------------------------
	EpicenterReversed = false
	WildfireSparkReversed = false
	ArcaneResonanceReversed = false
	ArcaneVelocityReversed = false
	LightningFistsReversed = false
	itemsReversed = 0

	------------------------------------------------------
	---- Elegon
	------------------------------------------------------
	empyrealFocusesDeactivated = 0
	energyChargeKilled = false

	------------------------------------------------------
	---- Will of The Emperor
	------------------------------------------------------
	playerExecutedStrikeJanxi = 0
	playerExecutedStrikeQinxi = 0
	playerExecutedStrikeDisplay = 0
	timerStarted = false
	inititalFailSetup = false
	JanXiPlayers = {}
	QinXiPlayers = {}

	------------------------------------------------------
	---- The Spirit Kings
	------------------------------------------------------
	playersDancing = 0
	GettingHotComplete = false
end

function core._1008:InstanceCleanup()
    core._1008.Events:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
    core._1008.Events:UnregisterEvent("ZONE_CHANGED_INDOORS")
	core._1008.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEDDED")
	core._1008.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")

	------------------------------------------------------
	---- The Stone Guard
	------------------------------------------------------
	mustLoveDogsActive = false
	mustLoveDogsCounter = 0
	TheStoneGuardKilled = false

	------------------------------------------------------
	---- Will of The Emperor
	------------------------------------------------------
	playersStrikeFailCounter = {}
end

core._1008.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1008:InitialSetup()
    core._1008.Events:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	core._1008.Events:RegisterEvent("ZONE_CHANGED_INDOORS")
	core._1008.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	core._1008.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
	
	if C_Map.GetBestMapForUnit("Player") == 471 then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(6823))
		infoFrameShown = true
		mustLoveDogsActive = true
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWithPet"],mustLoveDogsCounter,core.groupSize)
    end
end

function core._1008:TrackAdditional()
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
		if core.type == "UNIT_DIED" and (core.destID == "59915" or core.destID == "60051" or core.destID == "60047" or code.destID == "60043") then
			print("Disabling InfoFrame")
			TheStoneGuardKilled = true
			core.IATInfoFrame:ToggleOff()
			infoFrameShown = false   
			mustLoveDogsActive = false
        end
    end
end

function core._1008.Events:ZONE_CHANGED_INDOORS()
    if C_Map.GetBestMapForUnit("Player") == 471 and TheStoneGuardKilled == false then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(6823))
		infoFrameShown = true
		mustLoveDogsActive = true
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWithPet"],mustLoveDogsCounter,core.groupSize)
	elseif C_Map.GetBestMapForUnit("Player") == 472 or C_Map.GetBestMapForUnit("Player") == 473 then
		TheStoneGuardKilled = true
		core.IATInfoFrame:ToggleOff()
		infoFrameShown = false   
		mustLoveDogsActive = false 
    else
        core.IATInfoFrame:ToggleOff()
		infoFrameShown = false   
		mustLoveDogsActive = false 
    end
end

function core._1008.Events:UNIT_SPELLCAST_SUCCEEDED(self, unit, castGUID, spellID)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and mustLoveDogsActive == true then
		--<<<PETS THAT WORK>>>
		--Perky Pug: 70613 (CONFIRMED)
		--Core Hound Pup: 69452 (CONFIRMED)
		--Fox Kit 90637 (CONFIRMED)
		--Worg Carrier 15999 (CONFIRMED)
		--Curious Wolvar Pup 
		--Lucky Quilen Cub
		--Alpine Foxling
		--Arctic Fox Kit
		--Fjord Worg Pup
		local unitFound = false
		local success = false
		local failed = false
		if spellID == 70613 or spellID == 69452 or spellID == 90637 or spellID == 15999 then
			--Make sure InfoFrame has up-to date list of players
			for k,player in pairs(core:getPlayersInGroupForAchievement()) do
				if core.InfoFrame_PlayersTable[player] == nil then
					core.InfoFrame_PlayersTable[player] = {1,""}
				end
			end
		end
		if spellID == 70613 then
			success = InfoFrame_SetPlayerCompleteWithMessage(UnitName(unit), "Perky Pug")
			unitFound = true
		elseif spellID == 69452 then
			success = InfoFrame_SetPlayerCompleteWithMessage(UnitName(unit), "Core Hound Pup")
			unitFound = true
		elseif spellID == 90637 then
			success = InfoFrame_SetPlayerCompleteWithMessage(UnitName(unit), "Fox Kit")
			unitFound = true
		elseif spellID == 15999 then
			success = InfoFrame_SetPlayerCompleteWithMessage(UnitName(unit), "Worg Pup")
			unitFound = true
		end

		if unitFound == true then
			if success then
				mustLoveDogsCounter = mustLoveDogsCounter + 1
			elseif failed then
				mustLoveDogsCounter = mustLoveDogsCounter - 1
			end
			InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
			InfoFrame_SetHeaderCounter(L["Shared_PlayersWithPet"],mustLoveDogsCounter,core.groupSize)
			core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
			core.IATInfoFrame:SetText2(L["MogushanVaults_HoverOverPets"],200)
		end
	end
end

function core._1008.Events:UPDATE_MOUSEOVER_UNIT(self, unit, powerType)
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and mustLoveDogsActive == true then
		--Make sure InfoFrame has up-to date list of players
		for k,player in pairs(core:getPlayersInGroupForAchievement()) do
			if core.InfoFrame_PlayersTable[player] == nil then
				core.InfoFrame_PlayersTable[player] = {1,""}
			end
        end

		if UnitGUID("mouseover") ~= nil then
			local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID("mouseover"))
			local petName = UnitName("mouseover")
			local type, _, _, _, _, _, _ = strsplit("-", UnitGUID("mouseover"))
			--<<<PETS THAT WORK>>>
			--Perky Pug: 37865 (CONFIRMED)
			--Core Hound Pup: 36871 (CONFIRMED)
			--Fox Kit 48641 (CONFIRMED)
			--Worg Carrier 10259 (CONFIRMED)
			--Curious Wolvar Pup 33529
			--Lucky Quilen Cub
			--Alpine Foxling
			--Arctic Fox Kit
			--Fjord Worg Pup

			--Pets that work
			if type ~= "Pet" then
				if destID == "37865" or destID == "36871" or destID == "48641" or destID == "10259" or destID == "33529" then
					--Get Owner of the pet from the Game Tooltip
					local tip = myTooltipFromTemplate or CreateFrame("GAMETOOLTIP", "myTooltipFromTemplate",nil,"GameTooltipTemplate")
					tip:SetOwner(WorldFrame, "ANCHOR_NONE")
					tip:SetUnit("mouseover")
					if tip:NumLines()>0 then
						local name = myTooltipFromTemplateTextLeft2:GetText()
						--We have the pet. Find player in group and set to complete
						for player,status in pairs(core.InfoFrame_PlayersTable) do
							if string.match(name, player) then
								local success = InfoFrame_SetPlayerCompleteWithMessage(player, petName)
								if success then
									mustLoveDogsCounter = mustLoveDogsCounter + 1
								end							
							end
						end
						tip:Hide()
					end
				else
					--Get Owner of the pet from the Game Tooltip
					local tip = myTooltipFromTemplate or CreateFrame("GAMETOOLTIP", "myTooltipFromTemplate",nil,"GameTooltipTemplate")
					tip:SetOwner(WorldFrame, "ANCHOR_NONE")
					tip:SetUnit("mouseover")
					if tip:NumLines()>0 then
						local name = myTooltipFromTemplateTextLeft2:GetText()
						--We have the pet. Find player in group and set to complete
						for player,status in pairs(core.InfoFrame_PlayersTable) do
							if string.match(name, player) then
								local success = InfoFrame_SetPlayerFailedWithMessage(player, petName)
								if success then
									mustLoveDogsCounter = mustLoveDogsCounter - 1
								end									
							end
						end
						tip:Hide()
					end				
				end
			end
		end
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWithPet"],mustLoveDogsCounter,core.groupSize)
		core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
		core.IATInfoFrame:SetText2(L["MogushanVaults_HoverOverPets"],200)
    end
end

--Show Me Your Moves
--When Boss casts first ability, Reset all counters
--If player gets hits then fail achievement
--Track how many times each player has failed achievement
--Check how many players executed opportunistic strike on boss
--If counter equals 10 or 25 then complete achievement

function core._1008:WillOfTheEmperor()
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
	InfoFrame_SetHeaderCounter(GetSpellLink(116809) .. " " .. L["Core_Counter"],playerExecutedStrikeDisplay,core.maxPlayers)

	if inititalFailSetup == false then
		inititalFailSetup = true
		for player,status in pairs(core.InfoFrame_PlayersTable) do
			if playersStrikeFailCounter[player] == nil then
				playersStrikeFailCounter[player] = 0
			end
		end
	end

	--Hit by Devestating Arc
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 116835 then
		if playersFailCounter[core.destName] == nil then
			playersFailCounter[core.destName] = 1
		else
			playersFailCounter[core.destName] = playersFailCounter[core.destName] + 1
		end
		core:sendMessage(core.destName .. " " .. L["Shared_HitBy"] .. " " .. GetSpellLink(116835) .. " (" .. playersFailCounter[core.destName] .. ")")
	end

	--Hit by Stomp
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 116969 then
		if playersFailCounter[core.destName] == nil then
			playersFailCounter[core.destName] = 1
		else
			playersFailCounter[core.destName] = playersFailCounter[core.destName] + 1
		end
		core:sendMessage(core.destName .. " " .. L["Shared_HitBy"] .. " " .. GetSpellLink(116969) .. " (" .. playersFailCounter[core.destName] .. ")")
	end

	--Jan-xi: 60400
	--Qin-xi: 60399

	--Executed opportunistic strike
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 116809 then
		if playerExecutedStrikeJanxi == 0 and playerExecutedStrikeQinxi == 0 then
			core:sendDebugMessage("Resetting Players")
			--Reset Players
			for player,status in pairs(core.InfoFrame_PlayersTable) do
				core.InfoFrame_PlayersTable[player][1] = 3
			end
			playerExecutedStrikeDisplay = 0
		end
		local playerName = core.sourceName
		if string.find(core.sourceName, "-") then
			local name, realm = strsplit("-", core.sourceName)
			playerName = name
		end
		core:sendDebugMessage(playerName)
		core:sendDebugMessage(playersStrikeFailCounter[playerName])
		-- InfoFrame_SetPlayerCompleteWithMessage(playerName, L["Shared_Fails"] .. ": " .. playersStrikeFailCounter[playerName])

		if core.destID == "60400" then
			playerExecutedStrikeJanxi = playerExecutedStrikeJanxi + 1
			table.insert(JanXiPlayers, playerName)
		elseif core.destID == "60399" then
			playerExecutedStrikeQinxi = playerExecutedStrikeQinxi + 1
			table.insert(QinXiPlayers, playerName)
		end
		
		if timerStarted == false then
			timerStarted = true

			C_Timer.After(7, function() 
				if playerExecutedStrikeJanxi == core.maxPlayers or playerExecutedStrikeQinxi == core.maxPlayers then
					--core:sendMessage(core:getAchievement() .. " (" .. playerExecutedStrike .. "/" .. core.maxPlayers .. ") Opportunistic Strikes executed in time")					
					core:getAchievementSuccess()
				else
					if playerExecutedStrikeJanxi >= playerExecutedStrikeQinxi then
						for k, v in pairs(JanXiPlayers) do
							InfoFrame_SetPlayerCompleteWithMessage(v, L["Shared_Fails"] .. ": " .. playersStrikeFailCounter[v])
						end
						playerExecutedStrikeDisplay = playerExecutedStrikeJanxi
						core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(116809) .. " " .. L["Core_Counter"] .. " (" .. playerExecutedStrikeJanxi .. "/" .. core.maxPlayers .. ")")					
					elseif playerExecutedStrikeQinxi > playerExecutedStrikeJanxi then
						for k, v in pairs(QinXiPlayers) do
							InfoFrame_SetPlayerCompleteWithMessage(v, L["Shared_Fails"] .. ": " .. playersStrikeFailCounter[v])
						end
						playerExecutedStrikeDisplay = playerExecutedStrikeQinxi
						core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(116809) .. " " .. L["Core_Counter"] .. " (" .. playerExecutedStrikeQinxi .. "/" .. core.maxPlayers .. ")")					
					end
					core:sendMessageSafe(core:getAchievement() .. " " .. L["Shared_PlayersWhoDidNotUse"] .. " " .. GetSpellLink(116809) .. " " .. InfoFrame_GetIncompletePlayersWithAdditionalInfo(),true)
				
					--Increase Fail Counter for players who did not execute in time
					--Loop through all failed players increase counter by 1
					for player,status in pairs(core.InfoFrame_PlayersTable) do
						if status[1] ~= 2 then
							playersStrikeFailCounter[player] = playersStrikeFailCounter[player] + 1
							InfoFrame_SetPlayerFailedWithMessage(player, L["Shared_Fails"] .. ": " .. playersStrikeFailCounter[player])
						end
					end
				end
	
				playerExecutedStrikeJanxi = 0
				playerExecutedStrikeQinxi = 0
				JanXiPlayers = {}
				QinXiPlayers = {}
				timerStarted = false
			end)
		else
			if playerExecutedStrikeJanxi == core.maxPlayers then
				for k, v in pairs(JanXiPlayers) do
					InfoFrame_SetPlayerCompleteWithMessage(v, L["Shared_Fails"] .. ": " .. playersStrikeFailCounter[v])
				end
				playerExecutedStrikeDisplay = playerExecutedStrikeJanxi
				core:getAchievementSuccess()
			elseif playerExecutedStrikeQinxi == core.maxPlayers then
				for k, v in pairs(QinXiPlayers) do
					InfoFrame_SetPlayerCompleteWithMessage(v, L["Shared_Fails"] .. ": " .. playersStrikeFailCounter[v])
				end
				playerExecutedStrikeDisplay = playerExecutedStrikeQinxi
				core:getAchievementSuccess()
			end			
		end
	end
end

function core._1008.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss4"].enabled == true then
        --Lets get the target they danced with
        if UnitIsPlayer(sender) then
            if sender == UnitName("Player") then
                if string.match(message, L["MogushanVaults_DanceSelf"]) then
                    core:sendDebugMessage("Detected Dance Self")
                    if string.match(message, getNPCName(60710)) then
                        core:sendDebugMessage("Detected Subetai The Swift Self")
                        --They have danced with the correct npc. Check if they have the correct buff
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(sender, i)
                            if spellId == 118048 then
                                core:sendDebugMessage("Found player who danced with Subetai The Swift")
                                core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Set player to complete on InfoFrame
								local success = InfoFrame_SetPlayerComplete(sender)
								if success then
									playersDancing = playersDancing + 1								
								end

								--Send message to other addon users
								C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. sender, "RAID")
                            end
                        end
                    end
                end
            else
                if string.match(message, L["MogushanVaults_DanceOther"]) then
                    core:sendDebugMessage("Detected Praise Other")
                    if string.match(message, getNPCName(60710)) then
                        core:sendDebugMessage("Detected Subetai The Swift in other")
                        --They have danced with the correct npc. Check if they have the correct buff
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(sender, i)
                            if spellId == 118048 then
                                core:sendDebugMessage("Found player who danced with Subetai The Swift")
                                core:sendDebugMessage(sender)
								core:sendDebugMessage(spellId)
								--Set player to complete on InfoFrame
								local success = InfoFrame_SetPlayerComplete(sender)
								if success then
									playersDancing = playersDancing + 1								
								end
                            end
                        end
                    end
                end 
            end
        end
    end
end