--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Shrine of the Storm Bosses
------------------------------------------------------
core._1864 = {}
local L = core.L

------------------------------------------------------
---- Vol'zith the Whisperer
------------------------------------------------------
local maddeningDreamCount = 0
local maddeningDreamPlayersUID = {}
local volzithKilled = false

function core._1864:TrackAdditional()
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        if core.type == "UNIT_DIED" and core.destID == "134069" then
            volzithKilled = true
        end
    
        if volzithKilled == false then
            --Player gains Maddening Dreams
            if core.type == "SPELL_AURA_APPLIED" and core.spellId == 275690 then
                if maddeningDreamPlayersUID[core.destName] == nil then
                    maddeningDreamCount = maddeningDreamCount + 1
                    maddeningDreamPlayersUID[core.destName] = core.destName
                    core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(275690) .. " (" .. maddeningDreamCount .. "/" .. core.groupSize .. ")")
                end
            end
    
            --Player looses Maddening Dreams
            if core.type == "SPELL_AURA_REMOVED" and core.spellId == 275690 then
                if maddeningDreamPlayersUID[core.destName] ~= nil then
                    maddeningDreamCount = maddeningDreamCount - 1
                    maddeningDreamPlayersUID[core.destName] = nil
                    core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " ..  GetSpellLink(275690) .. " (" .. maddeningDreamCount .. "/" .. core.groupSize .. ")")
    
                    --If achievement was already completed then fail it
                    if core.achievementsCompleted[1] == true then
                        core:getAchievementFailed()
                        core.achievementsCompleted[1] = false
                    end
                end
            end
        end
    end
end

function core._1864:VolzithTheWhisperer()
    --Defeat Vol'zith the Whisperer while all party members are afflicted with Maddening Dreams in Shrine of the Storm on Mythic difficulty.
    --Check if all players have Maddening Dreams
    if maddeningDreamCount == core.groupSize then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core._1864:LordStormsong()
	--Defeat Lord Stormsong without coming into contact with any Awoken Void in Shrine of the Storm on Mythic difficulty.
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 269104 then
		core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
	end
end

function core._1864:ClearVariables()
end