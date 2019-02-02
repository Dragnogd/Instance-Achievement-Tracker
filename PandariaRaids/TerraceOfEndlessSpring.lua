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

------------------------------------------------------
---- Opulence  
------------------------------------------------------
local playersCompletedAchievement = 0

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

	if core:has_value(core.currentBosses[1].players, "Whizzey") == false then
		table.insert(core.currentBosses[1].players, "Whizzey")
	end

	InfoFrame_UpdatePlayersOnInfoFramePersonal()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)
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
				core:getAchievementFailedWithMessageAfter("(Wait for " .. core.destName .. " to collect another Parasitic Clutch)")
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

	playersCompletedAchievement = 0
end















function core._996:InstanceCleanup()
    core._996.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
end

core._996.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._996:InitialSetup()
    core._996.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
end

function core._996.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
        --Lets get the target they praised
        if UnitIsPlayer(sender) then
            if sender == UnitName("Player") then
                if string.match(message, L["BattleOfDazzarlor_PraiseSelf"]) then
                    if string.match(message, getNPCName(51090)) then
                        --They have praised the correct npc. Check if they have the correct buff
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitAura(sender, i)
                            if spellId == 774 then
                                --Check if the player actually needs the achievement since it is personal
                                core:sendDebugMessage("Found player who hugged singing sunflower")
								core:sendDebugMessage(sender)
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									InfoFrame_SetPlayerComplete(sender)
									playersCompletedAchievement = playersCompletedAchievement + 1
									core:getAchievementSuccessPersonalWithName(1, sender)
								end
                            end
                        end
                    end
                end
            else
                if string.match(message, L["BattleOfDazzarlor_PraiseOther"]) then
                    if string.match(message, getNPCName(51090)) then
                        --They have praised the correct npc. Check if they have the correct buff
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitAura(sender, i)
                            if spellId == 774 then
                                --Check if the player actually needs the achievement since it is personal
                                core:sendDebugMessage("Found player who hugged singing sunflower")
								core:sendDebugMessage(sender)
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									InfoFrame_SetPlayerComplete(sender)
									playersCompletedAchievement = playersCompletedAchievement + 1
									core:getAchievementSuccessPersonalWithName(1, sender)									
								end
                            end
                        end
                    end
                end 
            end
        end
    end
end