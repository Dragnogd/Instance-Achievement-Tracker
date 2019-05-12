--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Heart Of Fear
------------------------------------------------------
core._1009 = {}
core._1009.Events = CreateFrame("Frame")

------------------------------------------------------
---- Imperial Vizier Zor'lok
------------------------------------------------------
local parasitePlayers = {}
local parasiteCounter = 0

------------------------------------------------------
---- Grand Empress Shek'zeer
------------------------------------------------------
local timerStarted = false
local reaversKilled = 0

function core._1009:ImperialVizierZorlok()
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],parasiteCounter,core.groupSize)

	if parasiteCounter == core.groupSize then
		core:getAchievementSuccess()
		core.achievementsFailed[1] = false
	end
end

function core._1009:Garalon()
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 122786 then
		core:getAchievementFailed()		
	end
end

function core._1009:GrandEmpressShekzeer()
	if core.type == "UNIT_DIED" and core.destID == "63591" then
		reaversKilled = reaversKilled + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(10, function()
				if core.inCombat == true then
					if reaversKilled == 2 then
						core:getAchievementSuccess()
					else
						core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " FAILED! (" .. reaversKilled .. "/2) reavers killed in time.")
						reaversKilled = 0
						timerStarted = false					
					end		
				end
			end)
		else
			if reaversKilled == 2 then
				core:getAchievementSuccess()
			end
		end
	end
end

function core._1009:AmberShaperUnsok()
	if core:getBlizzardTrackingStatus(6518) == true then
		core:getAchievementSuccess()
	end
end

function core._1009:ClearVariables()
	------------------------------------------------------
	---- Imperial Vizier Zor'lok
	------------------------------------------------------
	parasitePlayers = {}
	parasiteCounter = 0

	------------------------------------------------------
	---- Grand Empress Shek'zeer
	------------------------------------------------------
	timerStarted = false
	reaversKilled = 0
end

function core._1009:IATInstanceCleanup()
    core._1520.Events:UnregisterEvent("UNIT_AURA")
end

function core._1009:InitialSetup()
	core._1009.Events:RegisterEvent("UNIT_AURA")
end

core._1009.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1009.Events:UNIT_AURA(self, unitID, ...)
	if core.instance ~= nil then
		if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and core.encounterStarted == true then
			if UnitIsPlayer(unitID) ~= nil then
				local name, realm = UnitName(unitID)
				local unitTypePlayer, destIDPlayer, spawn_uid_dest = strsplit("-", UnitGUID(unitID))
	
				if parasitePlayers[spawn_uid_dest] == nil then
					--Check to see if player has gained debuff
					for i=1,40 do
						local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
						if spellId == 125785 then
							parasiteCounter = parasiteCounter + 1
							core:sendMessage(UnitName(unitID) .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(125785) .. " (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
							parasitePlayers[spawn_uid_dest] = spawn_uid_dest
							InfoFrame_SetPlayerComplete(UnitName(unitID))
						end
					end
				elseif parasitePlayers[spawn_uid_dest] ~= nil then
					--Check to see if player has not lost debuff
					local debuffFound = false
					for i=1,40 do
						local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
						if spellId == 125785 then
							debuffFound = true
						end
					end
					if debuffFound == false then
						--Player has lost debuff
						parasiteCounter = parasiteCounter - 1
						parasitePlayers[spawn_uid_dest] = nil
						InfoFrame_SetPlayerFailed(UnitName(unitID))	
			
						--If achievement had already completed then fail it
						if core.achievementsCompleted[1] == true then
							core:getAchievementFailedWithMessageAfter("(" .. L["Core_Reason"] .. ": " .. UnitName(unitID) .. " " .. L["Shared_HasDied"] .. ") " .. L["Shared_DoNotKillBoss"])
							core.achievementsCompleted[1] = false
						end
					end
				end
			end
		end
	end
end