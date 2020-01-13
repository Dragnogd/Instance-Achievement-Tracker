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
local playerMovingStartTimestamp = nil
local playerStoppedMovingTimestamp = nil
local giftOfNzothActive = false
local phase1Complete = false
local phase2Complete = false
local phaseChangeInProgress = false
local playerMovingDebug = false
local bossatthirtyeightannounce = false

function core._2096:TheRestlessCabal()
    --Defeat the Restless Cabal in Crucible of Storms after having at least 10 Void Crashes active simultaneously in Normal Difficulty or higher.

    --Blizzard Tracker has gone white so achievement failed
    if core:getBlizzardTrackingStatus(13501) == true then
        core:getAchievementSuccess()
    end
end

function core._2096:UunatHarbingerOfTheVoid()
    --Defeat Uu'nat, Harbinger of the Void in Crucible of Storms without allowing N'Zoth to see your movement in Normal Difficulty or higher.
    
    --Eye opens after successfull cast of Gift of N'zoth abilities
    --Eye closes at 38 energy after Gift of N'zoth cast
    --If boss is in a phase transition 13506 (void shield) then eye will stay open unless in middle of Gift of N'zoth cast
    --If boss is in middle of Gift of N'zoth cast during phase transition and energy is going up from 0. Eye will open again at 38 energy

    --Tracking
    -- 1.) When boss starts casting 285638, 285685 or 285453 (Gift of N'zoth) or 286310 (Void Shield) Warn players to stop moving
    -- 2.) When cast of 285638, 285685 or 285453 (Gift of N'zoth) or 286310 (Void Shield) mark movement as not allowed
    -- 3.A) If boss reaches 38 energy or more then mark movement as allowed and tell players they can move again
    -- 3.B) If boss finishes cast of (Void Shield) then mark movement as allowed and tell players they can move again
    -- 4.) If players moved during a period of non movement then announce fail
    -- 5.) If PLAYER_STARTED_MOVING and PLAYER_STOPPED_MOVING happened at same time we can assume this is caused by spellcast rather than player actually moving

	if core:has_value(core.currentBosses[1].players, L["GUI_NoPlayersNeedAchievement"]) == false then
		InfoFrame_SetHeaderCounter(L["Shared_TrackingStatus"],playersWithTracking,#core.currentBosses[1].players)
		InfoFrame_UpdatePlayersOnInfoFrame(false)
		
	    --Request which players are currently tracking this achievement
	    --Sync Message, Major Version, Minor Version, update Infoframe
		if initialScan == false then
			core.IATInfoFrame:SetText1("|cff59FF00" .. L["CrucibleOfStorms_StartMoving"] .. "|r","GameFontHighlightLarge")
			core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"])
            core.IATInfoFrame:SetText2(L["Shared_PlayersRunningAddon"],200)
			 initialScan = true
			 --Set all players to fail initially as we have not determined yet if they have the addon installed
	 		for k,player in ipairs(core.currentBosses[1].players) do
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
					 core:sendMessageSafe(playersStr,true)
	 			end)
	 		end)
	 	end	
    else
	    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersWithTracking,0)
	    core.IATInfoFrame:SetText1(L["GUI_NoPlayersNeedAchievement"],"GameFontHighlightLarge")
	end

    --When boss starts casting Gift of N'Zoth tell players to stop moving
	if core.type == "SPELL_CAST_START" and (core.spellId == 285638 or core.spellId == 285685 or core.spellId == 285453) then
        core:sendDebugMessage("Stop Moving: Gift of N'Zoth (SPELL_CAST_START) SAFE TO MOVE")
        giftOfNzothActive = true
        bossatthirtyeightannounce = false
        if stopMovingAnnounced == false then
            stopMovingAnnounced = true
            core:sendMessage(core:getAchievement() .. " " .. L["CrucibleOfStorms_StopMoving"],true)
            core.IATInfoFrame:SetText1("|cffFF0000" .. L["CrucibleOfStorms_StopMoving"] .. "|r","GameFontHighlightLarge")
        end
	end
	
	--When boss has finished casting Gift of N'Zoth players are no longer allowed to move
	if core.type == "SPELL_CAST_SUCCESS" and (core.spellId == 285638 or core.spellId == 285685 or core.spellId == 285453) then
		core:sendDebugMessage("Stop Moving: Gift of N'Zoth (SPELL_CAST_SUCCESS) NOT SAFE TO MOVE")
		safeToMove = false
		if playerCurrentlyMoving == true then
            core:getAchievementFailedPersonalIndependent(UnitName("Player"))
		end
	end

    --When boss is changing phase then player must stop moving
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 286310 then
        phaseChangeInProgress = true
        core:sendDebugMessage("Stop Moving: Phase Change (SPELL_AURA_APPLIED) NOT SAFE TO MOVE")
        safeToMove = false
        if stopMovingAnnounced == false then
            stopMovingAnnounced = true
            core:sendMessage(core:getAchievement() .. " " .. L["CrucibleOfStorms_StopMoving"],true)
			core.IATInfoFrame:SetText1("|cffFF0000" .. L["CrucibleOfStorms_StopMoving"] .. "|r","GameFontHighlightLarge")
			if playerCurrentlyMoving == true then
				core:getAchievementFailedPersonalIndependent(UnitName("Player"))
			end
        end
    end

    --Boss has finished changing phases so players can move again aslong as Gift of N'zoth is not active
    --We believe that Gift of N'zoth currently takes precedence over phase change but need more data to confirm
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 286310 then
        phaseChangeInProgress = false
		core:sendDebugMessage("START Moving: Phase Change Finished (SPELL_AURA_REMOVED) SAFE TO MOVE")		
        if stopMovingAnnounced == true then
            stopMovingAnnounced = false
            safeToMove = true
            core:sendMessage(core:getAchievement() .. " " .. L["CrucibleOfStorms_StartMoving"],true)
            core.IATInfoFrame:SetText1("|cff59FF00" .. L["CrucibleOfStorms_StartMoving"] .. "|r","GameFontHighlightLarge")

            --If boss transitioned early then set phase transition to true
            if phase1Complete == false then
                core:sendDebugMessage("Phase 1 transition happened early. Setting to true")
                phase1Complete = true
            elseif phase2Complete == false and core:getHealthPercent("boss1") < 60 then
                core:sendDebugMessage("Phase 2 transition happened early. Setting to true")
                phase2Complete = true
            end
        end
    end

	--If boss is at 70% or 45% health then warn players to stop moving
	if UnitName("boss1") ~= nil then
		if core:getHealthPercent("boss1") <= 71 and phase1Complete == false then
			phase1Complete = true
			core:sendDebugMessage("Stop Moving: Boss about to change phase 71% SAFE TO MOVE")
			if stopMovingAnnounced == false then
				stopMovingAnnounced = true
				core:sendMessage(core:getAchievement() .. " " .. L["CrucibleOfStorms_StopMoving"],true)
				core.IATInfoFrame:SetText1("|cffFF0000" .. L["CrucibleOfStorms_StopMoving"] .. "|r","GameFontHighlightLarge")
			end  
		elseif core:getHealthPercent("boss1") <= 46 and phase2Complete == false then
			phase2Complete = true
			core:sendDebugMessage("Stop Moving: Boss about to change phase 46% SAFE TO MOVE")
			if stopMovingAnnounced == false then
				stopMovingAnnounced = true
				core:sendMessage(core:getAchievement() .. " " .. L["CrucibleOfStorms_StopMoving"],true)
				core.IATInfoFrame:SetText1("|cffFF0000" .. L["CrucibleOfStorms_StopMoving"] .. "|r","GameFontHighlightLarge")
			end  
		end
    end
    
    --If players dies then fail achievement for that player
    if core.type == "UNIT_DIED" and core.currentDest == "Player" and core.destName ~= nil then
        core:getAchievementFailedPersonal()
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
    playerMovingStartTimestamp = nil
    playerStoppedMovingTimestamp = nil
	giftOfNzothActive = false
	phase1Complete = false
    phase2Complete = false
    phaseChangeInProgress = false
    playerMovingDebug = false
    bossatthirtyeightannounce = false
end

function core._2096:InstanceCleanup()
    core._2096.Events:UnregisterEvent("UNIT_POWER_UPDATE")
end

core._2096.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

local function playerMoving(...)
    if core.encounterStarted == true then
        if IsPlayerMoving() == true and UnitIsDead("Player") == false then
            if playerMovingDebug == false then
                playerMovingDebug = true
                local name, realm = UnitName("Player")
                C_ChatInfo.SendAddonMessage("Whizzey", "moveIAT,true," .. name, core.chatType)	
            end

            -- core:sendDebugMessage(GetTime() .. " Player is moving")
            playerCurrentlyMoving = true
            if safeToMove == false then
                core:sendDebugMessage("Set Failed after start moving called")
                core:getAchievementFailedPersonalIndependent(UnitName("Player"))
            end
        end
    end
end

local function playerMovingMouse(...)
    if core.encounterStarted == true then
        if IsPlayerMoving() == true and UnitIsDead("Player") == false and IsMouseButtonDown("LeftButton") then
            if playerMovingDebug == false then
                playerMovingDebug = true
                local name, realm = UnitName("Player")
                C_ChatInfo.SendAddonMessage("Whizzey", "moveIAT,true," .. name, core.chatType)	
            end
        
            -- core:sendDebugMessage(GetTime() .. " Player is moving")
            playerCurrentlyMoving = true
            if safeToMove == false then
                core:sendDebugMessage("Set Failed after start moving called mouse")
                core:getAchievementFailedPersonalIndependent(UnitName("Player"))
            end
        end
    end
end

local function playerStoppedMoving(...)
    if core.encounterStarted == true then
        if IsPlayerMoving() == false and UnitIsDead("Player") == false then
            if playerMovingDebug == true then
                playerMovingDebug = false
                local name, realm = UnitName("Player")
                C_ChatInfo.SendAddonMessage("Whizzey", "moveIAT,false," .. name, core.chatType)	
            end
            -- core:sendDebugMessage(GetTime() .. " Player stopped moving")
            playerCurrentlyMoving = false

            if safeToMove == false then
                core:sendDebugMessage("Set Failed after stop moving called")
                core:getAchievementFailedPersonalIndependent(UnitName("Player"))
            end
        end
    end
end

function core._2096:InitialSetup()
    core._2096.Events:RegisterEvent("UNIT_POWER_UPDATE")

    --Player Moving
    hooksecurefunc("MoveForwardStart", playerMoving)
    hooksecurefunc("MoveBackwardStart", playerMoving)
    hooksecurefunc("StrafeLeftStart", playerMoving)
    hooksecurefunc("StrafeRightStart", playerMoving)
    hooksecurefunc("JumpOrAscendStart", playerMoving)
    hooksecurefunc("TurnOrActionStart", playerMovingMouse)
    hooksecurefunc("ToggleAutoRun", playerMoving)
    hooksecurefunc("ToggleRun", playerMoving)
    hooksecurefunc("StartAutoRun", playerMoving)
    hooksecurefunc("MoveAndSteerStart", playerMoving)
    hooksecurefunc("CameraOrSelectOrMoveStart",playerMoving)

    --Player Stopped Moving
    hooksecurefunc("MoveForwardStop", playerStoppedMoving)
    hooksecurefunc("MoveBackwardStop", playerStoppedMoving)
    hooksecurefunc("StrafeLeftStop", playerStoppedMoving)
    hooksecurefunc("StrafeRightStop", playerStoppedMoving)
    hooksecurefunc("TurnOrActionStop", playerStoppedMoving)
    hooksecurefunc("ToggleAutoRun", playerStoppedMoving)
    hooksecurefunc("ToggleRun", playerStoppedMoving)
    hooksecurefunc("StopAutoRun", playerStoppedMoving)
    hooksecurefunc("MoveAndSteerStop", playerStoppedMoving)
    hooksecurefunc("CameraOrSelectOrMoveStop",playerStoppedMoving)
end

function core._2096.Events:UNIT_POWER_UPDATE(self, unit, powerType)
    --Defeat Uu'nat, Harbinger of the Void in Crucible of Storms without allowing N'Zoth to see your movement in Normal Difficulty or higher.
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        if UnitGUID(unit) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unit))
            if destID == "145371" then
                --If power is between 38 and 50 then announce safe to move again and we are not currently changes phases
                --Player can move during phase transition if eye is open?????
                if UnitPower(unit) >= 38 and giftOfNzothActive == true and stopMovingAnnounced == true then
                    --If Gift of N'zoth is active wait till boss reaches 38 or more energy then players can move again
			        core:sendDebugMessage("Boss reached 38 energy. SAFE TO MOVE")
                    stopMovingAnnounced = false
                    safeToMove = true
                    giftOfNzothActive = false
                    core:sendMessage(core:getAchievement() .. " " .. L["CrucibleOfStorms_StartMoving"],true)
                    core.IATInfoFrame:SetText1("|cff59FF00" .. L["CrucibleOfStorms_StartMoving"] .. "|r","GameFontHighlightLarge")
                    if bossatthirtyeightannounce == false and phaseChangeInProgress == true then
                        core:sendDebugMessage("Boss reached 38 energy but we are in phase transition. PROBABLY SAFE TO MOVE")
                        bossatthirtyeightannounce = true
                    end
                end
            end
        end
    end
end
