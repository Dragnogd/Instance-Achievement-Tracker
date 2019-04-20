--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle of Dazar'alor Bosses
------------------------------------------------------
core._2096 = {}
core._2096.Events = CreateFrame("Frame")

------------------------------------------------------
---- The Restless Cabal
------------------------------------------------------
local voidCrashesActive = 0

------------------------------------------------------
---- Uu'nat, Harbinger of the Void
------------------------------------------------------
local stopMovingAnnounced = false
local safeToMove = true
local playerCurrentlyMoving = false
local playersWithTracking = 0
local initialScan = false

function core._2096:TheRestlessCabal()
    --Defeat the Restless Cabal in Crucible of Storms after having at least 10 Void Crashes active simultaneously in Normal Difficulty or higher.

    --Blizzard Tracker has gone white so achievement failed
    if core:getBlizzardTrackingStatus(13501) == true then
        core:getAchievementSuccess()
    end
end

function core._2096:UunatHarbingerOfTheVoid()
	--Defeat Uu'nat, Harbinger of the Void in Crucible of Storms without allowing N'Zoth to see your movement in Normal Difficulty or higher.

	if core:has_value(core.currentBosses[1].players, L["GUI_NoPlayersNeedAchievement"]) == false then
		InfoFrame_UpdatePlayersOnInfoFramePersonal()
		InfoFrame_SetHeaderCounter(L["Shared_TrackingStatus"],playersWithTracking,#core.currentBosses[1].players)
		core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
		core.IATInfoFrame:SetText2(L["Shared_PlayersRunningAddon"],200)
		
		--Request which players are currently tracking this achievement
		--Sync Message, Major Version, Minor Version, update Infoframe
		if initialScan == false then
			initialScan = true
			for k,player in ipairs(core.currentBosses[1].players) do
				InfoFrame_SetPlayerFailed(player)
			end
			C_Timer.After(3, function()
				--Set everyone to red inititally then alter to green afterwards if addon found
				C_ChatInfo.SendAddonMessage("Whizzey", "reqIAT,2,38,true", "RAID")		

				C_Timer.After(1, function() 
					for player, status in pairs(core.InfoFrame_PlayersTable) do
						core:sendDebugMessage(status)
						if status == 2 then
							playersWithTracking = playersWithTracking + 1
						end
					end
				end)
			end)
		end	
	else
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersWithTracking,0)
		core.IATInfoFrame:SetText1(L["GUI_NoPlayersNeedAchievement"])
	end

    --When boss starts casing Gift of N'Zoth get the original ranges of all players in the raid
	if core.type == "SPELL_CAST_START" and (core.spellId == 285638 or core.spellId == 285685 or core.spellId == 285453) then
		core:sendDebugMessage("Stop Moving")
		safeToMove = false
		
		if playerCurrentlyMoving == true then
			core:getAchievementFailedPersonalIndependent(UnitName("Player"))
		end
    end

    --When boss has finished casting Gift of N'Zoth
	if core.type == "SPELL_CAST_SUCCESS" and (core.spellId == 285638 or core.spellId == 285685 or core.spellId == 285453) then
		core:sendDebugMessage("Start Moving")
        safeToMove = true
    end
end

function core._2096:ClearVariables()
    ------------------------------------------------------
    ---- The Restless Cabal
    ------------------------------------------------------
    voidCrashesActive = 0

    ------------------------------------------------------
    ---- Uu'nat, Harbinger of the Void
    ------------------------------------------------------
    stopMovingAnnounced = false
	safeToMove = true
	playersWithTracking = 0
	initialScan = false
end

function core._2096:InstanceCleanup()
    core._2096.Events:UnregisterEvent("UNIT_POWER_UPDATE")
    core._2096.Events:UnregisterEvent("PLAYER_STARTED_MOVING")
    core._2096.Events:UnregisterEvent("PLAYER_STOPPED_MOVING")
end

core._2096.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2096:InitialSetup()
    core._2096.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._2096.Events:RegisterEvent("PLAYER_STARTED_MOVING")
    core._2096.Events:RegisterEvent("PLAYER_STOPPED_MOVING")
end

function core._2096.Events:UNIT_POWER_UPDATE(self, unit, powerType)
    --Defeat Uu'nat, Harbinger of the Void in Crucible of Storms without allowing N'Zoth to see your movement in Normal Difficulty or higher.
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        if UnitGUID(unit) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unit))
            if destID == "145371" then
                --If power is 95 or higher than warn player to stop moving
                if UnitPower(unit) >= 95 and stopMovingAnnounced == false then
                    stopMovingAnnounced = true
                    core:sendMessage(GetAchievementLink(13506) .. L["CrucibleOfStorms_StopMoving"],true)
                end

                --If power is 0 or message announced is still locked then reset
                if UnitPower(unit) >= 0 and stopMovingAnnounced == true then
                    stopMovingAnnounced = false
                    core:sendMessage(GetAchievementLink(13506) .. L["CrucibleOfStorms_StartMoving"],true)
                end
            end
        end
    end
end

function core._2096.Events:PLAYER_STARTED_MOVING(self)
	core:sendDebugMessage("Player is moving")
	playerCurrentlyMoving = true
    if safeToMove == false then
        core:getAchievementFailedPersonalIndependent(UnitName("Player"))
    end
end

function core._2096.Events:PLAYER_STOPPED_MOVING(self)
	playerCurrentlyMoving = false
	core:sendDebugMessage("Player stopped moving")
end