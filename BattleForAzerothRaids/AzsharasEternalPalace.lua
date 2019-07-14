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
---- Blackwater Behemoth
------------------------------------------------------
local collectSampleUID = {}
local samplesCollected = 0

------------------------------------------------------
---- Radiance of Azshara
------------------------------------------------------
local playersCompletedAchievement = 0

function core._2164:AbyssalCommanderSivara()
    --Defeat Abyssal Commander Sivara in The Eternal Palace while all three of her lieutenants are alive and engaged in the fight on Normal difficulty or higher.

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
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,core.groupSize)
	
	if playersCompletedAchievement == core.groupSize then
		core:getAchievementSuccess()
	end
end

function core._2164:ClearVariables()
	------------------------------------------------------
	---- Radiance of Azshara
	------------------------------------------------------
	playersCompletedAchievement = 0
	
	------------------------------------------------------
	---- Blackwater Behemoth
	------------------------------------------------------
	collectSampleUID = {}
	samplesCollected = 0
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
			for i=1,40 do
				local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
				if spellId == 305173 then
					local name, realm = UnitName(unitID)
					if name ~= nil then
						InfoFrame_SetPlayerComplete(name)
						playersCompletedAchievement = playersCompletedAchievement + 1
						core:getAchievementSuccessPersonalWithName(1, sender)
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