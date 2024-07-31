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
local initialSetup = false

function core._2284:ExecutorTarvold()
    --Defeat Executor Tarvold after slaying 8 Forlorn Captives with the effects of Residue in Sanguine Depths on Mythic difficulty.

    if core.type == "UNIT_DIED" and core.destID == "165073" then
        forlornCaptivesKilled = forlornCaptivesKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(165073) .. " " .. L["Shared_Killed"] .. " (" .. forlornCaptivesKilled .. "/8)",true)
    end

    if core:getBlizzardTrackingStatus(14286, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2284:GeneralKaal()
    --Defeat General Kaal while affected by Slammed! in the Sanguine Depths on Mythic difficulty.
    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)

        --Player gained Slammed!
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 330055 then --330055
            if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, name) == true then
                if slammedUID[core.destName] == nil then
                    slammedCount = slammedCount + 1
                    slammedUID[core.destName] = core.destName
                    core:sendMessage(core.destName .. " " .. L["Shared_HasCompleted"] .. " " .. GetAchievementLink(14289) .. " (" .. L["Core_PersonalAchievement"] .. ") (" .. slammedCount .. "/" .. #core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players .. ")",true)
                    InfoFrame_SetPlayerCompleteWithMessage(core.destName, C_Spell.GetSpellLink(330055))
                    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],slammedCount,#core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players)
                    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"])
                end
            end
        end

        --Player lost Slammed!
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 330055 then --330055
            if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, name) == true then
                if slammedUID[core.destName] ~= nil then
                    slammedCount = slammedCount - 1
                    slammedUID[core.destName] = nil
                    core:sendMessage(name .. " " .. L["Shared_HasFailed"] .. " " .. GetAchievementLink(14289) .. " (" .. L["Core_PersonalAchievement"] .. ")",true,"failed")
                    InfoFrame_SetPlayerFailedWithMessage(core.destName, "")
                    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],slammedCount,#core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players)
                    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"])
                end
            end
        end
    end

    --Everyone in the group has completed the achievement
    if slammedCount == #core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players then
        core:getAchievementSuccess()
    end
end

function core._2284:TrackAdditional()
    if core.type == "UNIT_DIED" and core.destID == "165318" then
        generalKaalKilled = true
        core:sendDebugMessage("General Kaal Killed")
        core.infoFrameLock = false
    end

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)

        --Player gained Shadow Ball
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 330004 then --330004
            core:sendDebugMessage("Player has gained Shadow Ball")

            if initialSetup == false then
                core:sendDebugMessage("Turning InfoFrame on")
                core.IATInfoFrame:SetHeading(GetAchievementLink(14289))
                InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],slammedCount,#core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players)
                InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"])
                core.IATInfoFrame:ToggleOn()
                initialSetup = true
                core.infoFrameShown = true
                core.infoFrameLock = true
            end

            if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, name) == true then
                if shadowBallUID[core.destName] == nil then
                    core:sendDebugMessage(core.destName)
                    shadowBallCount = shadowBallCount + 1
                    core:sendDebugMessage("Count: " .. shadowBallCount)
                    shadowBallUID[core.destName] = core.destName
                    core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(330004) .. " (" .. shadowBallCount .. "/" .. #core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players .. ")",true)
                    InfoFrame_SetPlayerNeutralWithMessage(core.destName, C_Spell.GetSpellLink(330004))
                end
            end

            InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"])
        end

        --Player looses Shadow Ball
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 330004 then --330004
            core:sendDebugMessage("Player has lost Shadow Ball")
            if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, name) == true then
                if shadowBallUID[core.destName] ~= nil then
                    core:sendDebugMessage(core.destName)
                    shadowBallCount = shadowBallCount - 1
                    core:sendDebugMessage("Count: " .. shadowBallCount)
                    shadowBallUID[core.destName] = nil

                    local playerCheck = core.destName
                    core:sendDebugMessage("Checking if player has Slammed!")
                    --Check if player has SLAMMED! buff
                    C_Timer.After(10, function()
                        --Player lost Shadow Ball but did not gain Slammed! so fail achievement
                        core:sendDebugMessage("Checking " .. playerCheck)
                        if slammedUID[playerCheck] == nil and generalKaalKilled == false and core:getHealthPercent("boss1") > 53 then
                            core:sendDebugMessage("No Slammed detected")
                            core:sendMessage(playerCheck .. " " .. L["Shared_HasFailed"] .. " " .. GetAchievementLink(14289) .. " (" .. L["Core_PersonalAchievement"] .. ")",true,"failed")
                            InfoFrame_SetPlayerFailedWithMessage(playerCheck, "")
                            InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"])
                        end
                    end)
                end
            end
        end
    end

    if initialSetup == true then
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"])
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
    initialSetup = false
end