--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Sanguine Depths
------------------------------------------------------
core._2284 = {}

------------------------------------------------------
---- Executor Tarvold
------------------------------------------------------
local forlornCaptivesKilled = 0

------------------------------------------------------
---- General Kaal
------------------------------------------------------
local generalKaalKilled = false
local shadowBallCount = 0
local shadowBallUID = {}
local slammedCount = 0
local slammedUID = {}

function core._2284:ExecutorTarvold()
    --Defeat Executor Tarvold after slaying 8 Forlorn Captives with the effects of Residue in Sanguine Depths on Mythic difficulty.

    if core.type == "UNIT_DIED" and core.destID == "165073" then
        forlornCaptivesKilled = forlornCaptivesKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(165073) .. " " .. L["Shared_Killed"] .. " (" .. ghostlyContenderCounter .. "/8)",true)
    end

    if core:getBlizzardTrackingStatus(14286, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2284:GeneralKaal()
    --Defeat General Kaal while affected by Slammed! in the Sanguine Depths on Mythic difficulty.
    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],slammedCount,core.groupSize)

    --Player gained Slammed!
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 330055 then
        if slammedUID[core.destName] == nil then
            slammedCount = slammedCount + 1
            slammedUID[core.destName] = core.destName
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(330055) .. " (" .. slammedCount .. "/" .. core.groupSize .. ")",true)
            InfoFrame_SetPlayerComplete(core.destName)
        end
    end

    --Everyone in the group has completed the achievement
    if slammedCount == core.groupSize then
        core:getAchievementSuccess()
    end
end

function core._2284:TrackAdditional()
    if core.type == "UNIT_DIED" and core.destID == "165318" then
        generalKaalKilled = true
    end

    --Player gained Shadow Ball
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 330004 then
        if shadowBallUID[core.destName] == nil then
            shadowBallCount = shadowBallCount + 1
            shadowBallUID[core.destName] = core.destName
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(330004) .. " (" .. shadowBallCount .. "/" .. core.groupSize .. ")",true)
        end
    end

    --Player looses Shadow Ball
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 330004 then
        if shadowBallUID[core.destName] ~= nil then
            shadowBallCount = shadowBallCount - 1
            shadowBallUID[core.destName] = nil

            local playerCheck = core.destName

            --Check if player has SLAMMED! buff
            C_Timer.After(10, function()
                --Player lost Shadow Ball but did not gain Slammed! so fail achievement
                if slammedUID[playerCheck] == nil and generalKaalKilled == false then
                    core:sendMessage(GetAchievementLink(14289) .. " " .. L["Core_Failed"] .. " (" .. playerCheck .. ")",true,"failed")
                end
            end)
        end
    end
end

function core._2284:ClearVariables()
    ------------------------------------------------------
    ---- Executor Tarvold
    ------------------------------------------------------
    forlornCaptivesKilled = 0

    ------------------------------------------------------
    ---- General Kaal
    ------------------------------------------------------
    slammedCount = 0
    slammedUID = {}
end

function core._2284:InstanceCleanup()
    ------------------------------------------------------
    ---- General Kaal
    ------------------------------------------------------
    generalKaalKilled = false
end