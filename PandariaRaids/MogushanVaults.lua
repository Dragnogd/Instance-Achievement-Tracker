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
---- Elegon
------------------------------------------------------
local empyrealFocusesDeactivated = 0
local energyChargeKilled = false

------------------------------------------------------
---- Will of The Emperor
------------------------------------------------------
local playerExecutedStrike = 0
local playersFailCounter = {}
local timerStarted = false

function core._1008:TheStoneGuard()
	--Defeat the Stone Guard in Mogu'shan Vaults on Normal or Heroic difficulty while every member of your raid is accompanied by a canine companion pet.

	--Lets show an InfoFrame which updates when a player hovers over pets in the raid or summons a pet
	InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
end

function core._1008:FengTheAccursed()
	if core.type == "SPELL_AURA_APPLIED" then
		if core.spellId == 116936 and EpicenterReversed == false then
			EpicenterReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Epicenter Reversed (" .. itemsReversed .. "/5)")
		elseif core.spellId == 118307 and WildfireSparkReversed == false then
			WildfireSparkReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("WildfireSpark Reversed (" .. itemsReversed .. "/5)")
		elseif core.spellId == 118194 and ArcaneResonanceReversed == false then
			ArcaneResonanceReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Arcane Resonance Reversed (" .. itemsReversed .. "/5)")
		elseif core.spellId == 115730 and LightningFistsReversed == false then
			LightningFistsReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Lightning Fists Reversed (" .. itemsReversed .. "/5)")
		end
	elseif core.type == "SPELL_CAST_SUCCESS" then
		if core.spellId == 116938 and ArcaneVelocityReversed == false then
			ArcaneVelocityReversed = true
			itemsReversed = itemsReversed + 1
			core:sendMessage("Arcane Velocity Reversed (" .. itemsReversed .. "/5)")
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
					core:getAchievementFailedWithMessageAfter("(" .. empyrealFocusesDeactivated .. "/" .. ") Empyreal Focuses Deactivated in time")
				end
			end)
		else
			if empyrealFocusesDeactivated == 6 then
				core:getAchievementSuccess()
			end
		end
	end
end

function _1008_TheSpiritKings()
	--If boss has cast pillage start timer
	--If user dances and timer has started add to array and user is not already in the array
	--If player gets pillaged add to another array
	--Compare 2 arrays once timer has finished. If they dance at the correct time and got hit by pillaged at the end they executed the move at the correct time
	--Announce in chat who did not dance in time.
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
	playerExecutedStrike = 0
	timerStarted = false
end

function core._1008:InstanceCleanup()
    core._1008.Events:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
    core._1008.Events:UnregisterEvent("ZONE_CHANGED")
	core._1008.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEDDED")

	------------------------------------------------------
	---- The Stone Guard
	------------------------------------------------------
	mustLoveDogsActive = false
	mustLoveDogsCounter = 0
end

core._1008.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1008:InitialSetup()
    core._1008.Events:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	core._1008.Events:RegisterEvent("ZONE_CHANGED")
	core._1008.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	
	if C_Map.GetBestMapForUnit("Player") == 471 then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(6823))
		infoFrameShown = true
		mustLoveDogsActive = true
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWithPet"],mustLoveDogsCounter,core.groupSize)
    end
end

function core._1008.Events:ZONE_CHANGED()
    if C_Map.GetBestMapForUnit("Player") == 471 then
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(6823))
		infoFrameShown = true
		mustLoveDogsActive = true
		InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWithPet"],mustLoveDogsCounter,core.groupSize)
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
		else
			failed = InfoFrame_SetPlayerFailedWithMessage(UnitName(unit), "?")
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
		if UnitGUID("mouseover") ~= nil then
			local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID("mouseover"))
			local petName = UnitName("mouseover")
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
	--Hit by Devestating Arc
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 116835 then
		if playersFailCounter[core.destName] == nil then
			playersFailCounter[core.destName] = 1
		else
			playersFailCounter[core.destName] = playersFailCounter[core.destName] + 1
		end
		core:sendMessage(core.destName .. " hit by Devestating Arc (" .. playersFailCounter[core.destName] .. ")")
	end

	--Hit by Stomp
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 116969 then
		if playersFailCounter[core.destName] == nil then
			playersFailCounter[core.destName] = 1
		else
			playersFailCounter[core.destName] = playersFailCounter[core.destName] + 1
		end
		core:sendMessage(core.destName .. " hit by Stomp (" .. playersFailCounter[core.destName] .. ")")
	end

	--Executed opportunistic strike
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 116809 then
		playerExecutedStrike = playerExecutedStrike + 1
		if timerStarted == false then
			timerStarted = true

			C_Timer.After(10, function() 
				if playerExecutedStrike == core.maxPlayers then
					--core:sendMessage(core:getAchievement() .. " (" .. playerExecutedStrike .. "/" .. core.maxPlayers .. ") Opportunistic Strikes executed in time")					
					core:getAchievementSuccess()
				else
					core:sendMessage(core:getAchievement() .. " (" .. playerExecutedStrike .. "/" .. core.maxPlayers .. ") Opportunistic Strikes executed in time")
				end
	
				playerExecutedStrike = 0
				timerStarted = false
			end)
		else
			if playerExecutedStrike == core.maxPlayers then					
				core:getAchievementSuccess()
			end			
		end
	end
end