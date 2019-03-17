--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

--------------------------------------
-- Terrace Of Endless Spring Bosses --
--------------------------------------
core._996 = {}
core._996.Events = CreateFrame("Frame")

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
local parasiticClutchUID = {}

function core._996:ProtectorsOfTheEndless()
	if core.type == "UNIT_DIED" and core.destID == "60586" then
		elderAsaniKilled = true
	elseif core.type == "UNIT_DIED" and core.destID == "60583" then
		protectorKaolanKilled = true
	elseif core.type == "UNIT_DIED" and core.destID == "60585" then
		elderRegailKilled = true
	end
	
	if elderAsaniKilled == true and protectorKaolanKilled == true then
		core:getAchievementSuccessWithCustomMessage(format(L["TerraceOfEndlessSpring_DefeatedLast"], getNPCName(60585)), L["Shared_CompletedBossKill"])
	elseif elderAsaniKilled == true and elderRegailKilled == true then
		core:getAchievementSuccessWithCustomMessage(format(L["TerraceOfEndlessSpring_DefeatedLast"], getNPCName(60583)), L["Shared_CompletedBossKill"])
	elseif protectorKaolanKilled == true and elderRegailKilled == true then
		core:getAchievementSuccessWithCustomMessage(format(L["TerraceOfEndlessSpring_DefeatedLast"], getNPCName(60586)), L["Shared_CompletedBossKill"])
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
		
		if core.type == "SPELL_AURA_APPLIED" and core.spellId == 125652 and parasiticClutchUID[core.spawn_uid_dest_Player] == nil then
			parasiticClutchCounter = parasiticClutchCounter + 1
			parasiticClutchUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
			core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(125652) .. " (" .. parasiticClutchCounter .. "/" .. core.groupSize .. ")")
			InfoFrame_SetPlayerComplete(core.destName)
		end
	
		if core.type == "SPELL_AURA_REMOVED" and core.spellId == 125652 and parasiticClutchUID[core.spawn_uid_dest_Player] ~= nil then
			parasiticClutchCounter = parasiticClutchCounter - 1
			parasiticClutchUID[core.spawn_uid_dest_Player] = nil
			core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(125652) .. " (" .. parasiticClutchCounter .. "/" .. core.groupSize .. ")")
			InfoFrame_SetPlayerFailed(core.destName)	
			
			--If the achievement was already completed then alert the user not to kill the boss
			if core.achievementsCompleted[1] == true then
				core:getAchievementFailedWithMessageAfter("(" .. format(L["Shared_WaitForAnother"], core.destName, GetSpellLink(125652)) .. ")")
				core.achievementsCompleted[1] = false
			end
		end
	
		if parasiticClutchCounter == core.groupSize then
			core:getAchievementSuccess()
			core.achievementsFailed[1] = false		
		end
	end
end

function core._996:ShaOfFear()
	--Spray of Breath
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 125786 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " " .. L["Core_Reason"] .. ": " .. GetSpellLink(125786) .. ")")
	end

	--Dread Spray
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 119985 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " " .. L["Core_Reason"] .. ": " .. GetSpellLink(119985) .. ")")		
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
	parasiticClutchUID = {}
end