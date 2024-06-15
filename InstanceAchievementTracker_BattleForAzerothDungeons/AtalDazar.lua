--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Atal'Dazar Bosses
------------------------------------------------------
core._1763 = {}

------------------------------------------------------
---- Priestess Alunza
------------------------------------------------------
local taintedBloodCounter = 0

------------------------------------------------------
---- Bringing Hexy Back
------------------------------------------------------
local playerHexed = false

function core._1763:PriestessAlunza()
    if core.destID == "131009" and (core.type == "SPELL_AURA_APPLIED_DOSE" or core.type == "SPELL_AURA_APPLIED") and core.spellId == 255558 then
        core:sendDebugMessage("Spirit of Gold " .. core.amount)
    end

    --Spirit of gold has 8 stacks of Tainted Blood
    if core.groupSize > 1 then
        --If player is in a group
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
			end
			
			if unit ~= nil then
                local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
                for i=1,40 do
                    local _, _, count, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
                    if spellId == 255558 and destID == "131009" then
                        core:sendDebugMessage("Count: " .. count)
                    end
                    if spellId == 255558 and destID == "131009" and count == 8 then
                        core:sendMessage(core:getAchievement() .. format(L["Shared_KillTheAddNow"], getNPCName(131009)))
					end
				end
			end
		end
	else
		--Player is not in a group
        local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
        for i=1,40 do
            local _, _, count, _, _, _, _, _, _, spellId = UnitDebuff("Player", i)
            if spellId == 255558 and destID == "131009" and count >= 8 then
                core:sendMessage(core:getAchievement() .. format(L["Shared_KillTheAddNow"], getNPCName(131009)))
            end
        end
	end

    --Achievment Complete
    if core.type == "UNIT_DIED" and core.destID == "131140" then
        core:getAchievementSuccess()
    end
end

function core._1763:BringingHexyBack()
    --If any of the four bosses die then we need to call the clear global variables manually since the group will constantly be in combat otherwise with the add
    --And the necessary end of boss functions will never be called

    if core.type == "UNIT_DIED" and (core.destID == "122965" or core.destID == "122963" or core.destID == "122967" or core.destID == "122968") then
        core:clearInstanceVariables()
        core:clearVariables()
    end

    --1 Player in group must be hexed at each boss on kill.
    if UnitGUID("boss1") ~= nil then
        local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID("boss1"))
        
        if destID == "122965" or destID == "122963" or destID == "122967" or destID == "122968" then
            if core.type == "SPELL_AURA_APPLIED" and core.spellId == 252781 then
                core:sendDebugMessage(core.destName .. " Hexed")
            end
        
            --Check if boss is less than 50% health to give people a chance to cc adds / reduce spam
            if core:getHealthPercent("boss1") <= 50 then
                 --If player is hexed, complete the achievement.
                if core.type == "SPELL_AURA_APPLIED" and core.spellId == 252781 then
                    if playerHexed == false then
                        playerHexed = true
                        core.achievementsFailed[1] = false
                        if destID == "122967" then
                            core:getAchievementSuccess(2) --Take into account gold fever tracking too
                        else
                            core:getAchievementSuccess()
                        end
                    end
                end
        
                --If player hex is removed, wait 2 second. If no one else is hexed fail achievement
                if core.type == "SPELL_AURA_REMOVED" and core.spellId == 252781 then
                    playerHexed = false
                    C_Timer.After(2000, function()
                        if playerHexed == false then
                            core.achievementsCompleted[1] = false
                            core:getAchievementFailedWithMessageAfter(L["AtalDazar_BringingHexyBack_Hex"])
                        end
                    end)
                end
            end 
        end
    end
end

function core._1763:ClearVariables()
    ------------------------------------------------------
    ---- Bringing Hexy Back
    ------------------------------------------------------
    playerHexed = false

    ------------------------------------------------------
    ---- Priestess Alunza
    ------------------------------------------------------
    taintedBloodCounter = 0
end