--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

--------------------------------------
-- Terrace Of Endless Spring Bosses --
--------------------------------------
core._996 = {}

-------------------------------
-- Protectors Of The Endless --
-------------------------------
local elderAsaniKilled = false
local protectorKaolanKilled = false
local elderRegailKilled = false

------------------------------------------------------
---- Lei Shi
------------------------------------------------------
local parasiticClutchCounter = 0

function core._996:ProtectorsOfTheEndless()
	if core.type == "UNIT_DIED" and core.destID == "60586" then
		elderAsaniKilled = true
	elseif core.type == "UNIT_DIED" and core.destID == "60583" then
		protectorKaolanKilled = true
	elseif core.type == "UNIT_DIED" and core.destID == "60585" then
		elderRegailKilled = true
	end
	
	if elderAsaniKilled == true and protectorKaolanKilled == true then
		core:getAchievementSuccessWithCustomMessage("'Elder Regail Defeated Last' part of", "will be completed once boss is killed")
	elseif elderAsaniKilled == true and elderRegailKilled == true then
		core:getAchievementSuccessWithCustomMessage("'Protector Kaolan Defeated Last' part of", "will be completed once boss is killed")
	elseif protectorKaolanKilled == true and elderRegailKilled == true then
		core:getAchievementSuccessWithCustomMessage("'Elder Asani Defeated Last' part of", "will be completed once boss is killed")
	end
end

function core._996:Tsulong()
	if core.type == "SPELL_DAMAGE" and core.destID == "64443" and core.overkill > 0 then
		core:getAchievementFailed()  		
	end
end

function core._996:LeiShi()
	if core.encounterStarted == true then
		InfoFrame_UpdatePlayersOnInfoFrame()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],parasiticClutchCounter,core.groupSize)
		
		if core.type == "SPELL_AURA_APPLIED" and core.spellId == 125652 then
			parasiticClutchCounter = parasiticClutchCounter + 1
			core:sendMessage(core.destName .. " Inflicted with Parasitic Clutch (" .. parasiticClutchCounter .. "/" .. core.groupSize .. ")")
			InfoFrame_SetPlayerComplete(core.destName)
		end
	
		if core.type == "SPELL_AURA_REMOVED" and core.spellId == 125652 then
			parasiticClutchCounter = parasiticClutchCounter - 1
			core:sendMessage(core.destName .. " LOST Parasitic Clutch (" .. parasiticClutchCounter .. "/" .. core.groupSize .. ")")
			InfoFrame_SetPlayerFailed(core.destName)	
			
			--If the achievement was already completed then alert the user not to kill the boss
			if core.achievementsCompleted[1] == true then
				core:sendMessage("DO NOT KILL BOSS. (Wait for " .. core.destName .. " to collect another Parasitic Clutch)")
				core.achievementsCompleted[1] = false
			end
		end
	
		if parasiticClutchCounter == core.groupSize then
			core:getAchievementSuccess()		
		end
	end
end

function core._996:ShaOfFear()
	--Spray of Breath
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 125786 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " got feared by Spray of Breath)")
	end

	--Dread Spray
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 119985 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " got feared by Dread Spray)")		
	end
end

function core._996:ClearVariables()
	-------------------------------
	-- Protectors Of The Endless --
	-------------------------------
	elderAsaniKilled = false
	protectorKaolanKilled = false
	elderRegailKilled = false

	------------------------------------------------------
	---- Lei Shi
	------------------------------------------------------
	parasiticClutchCounter = 0
end