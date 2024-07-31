--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- De Other Side
------------------------------------------------------
core._2291 = {}
core._2291.Events = CreateFrame("Frame")

------------------------------------------------------
---- Highly Communicable
------------------------------------------------------
local initialSetup = false
local timerStarted = false
local criteriaMet = false

------------------------------------------------------
---- The Manastorms
------------------------------------------------------
local echoFingerLaserXtremeCompleted = false
local shadowfuryCompleted = false
local stepsCompleted = 0

function core._2291:DealerXyexa()
    --Defeat Dealer Xy'exa after collecting all 5 orbs floating above her in De Other Side on Mythic Difficulty.

    if core:getBlizzardTrackingStatus(14606, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2291:TheManastorms()
    --Cause Millhouse and Millificent to strike each other with each Shadowfury and Echo Finger Laser X-treme cast and defeat the Manastorms in De Other Side on Mythic difficulty.

    --Echo Finger Laser X-treme
    if core.type == "SPELL_DAMAGE" and core.spellId == 323992 and core.destID == "164556" and echoFingerLaserXtremeCompleted == false then
        echoFingerLaserXtremeCompleted = true
        stepsCompleted = stepsCompleted + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(323992) .. " " .. L["Shared_Completed"] .. " (" .. stepsCompleted .. "/2)",true)
    end

    --Echo Shadowfury
    if core.type == "SPELL_DAMAGE" and core.spellId == 320132 and core.destID == "164555" and shadowfuryCompleted == false then
        shadowfuryCompleted = true
        stepsCompleted = stepsCompleted + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(320132) .. " " .. L["Shared_Completed"] .. " (" .. stepsCompleted .. "/2)",true)
    end

    if stepsCompleted == 2 then
        core:getAchievementSuccess()
    end
end

core._2291.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2291:HighlyCommunicable()
    if initialSetup == true and criteriaMet == false then
        core:getAchievementFailed()
        core.achievementsCompleted[1] = false
    end

    if initialSetup == true and criteriaMet == true then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core._2291:TrackAdditional()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 322746 and core.destName ~= nil then --322746
        if UnitIsPlayer(core.destName) then
            if initialSetup == false then
                core:sendDebugMessage("Initial Setup for Highly Communicable")
                core.IATInfoFrame:SetHeading(GetAchievementLink(14354))
                InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasNotBeenMet"],"red")
                InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"])
                core.IATInfoFrame:ToggleOn()
                initialSetup = true
                core.infoFrameShown = true
                core.infoFrameLock = true
            end

            local name, realm = UnitName(core.destName)

            if InfoFrame_GetPlayerCompleteWithMessage(name) == false then
                InfoFrame_SetPlayerCompleteWithMessage(name, "")
                InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasBeenMet"],"green")
            end
        end

        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    end

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 322746 and core.destName ~= nil then --322746
        if UnitIsPlayer(core.destName) then
            local name, realm = UnitName(core.destName)

            InfoFrame_SetPlayerFailedWithMessage(name, "")
            C_Timer.After(0.5, function()
                if InfoFrame_IsAnyPlayerComplete() == false then
                    InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasNotBeenMet"],"red")
                end
            end)
        end
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    end

    if initialSetup == true then
        --InfoFrame_RefreshPlayersOnInfoFrameTable()
        if timerStarted == false then
            timerStarted = true
            local updatePerformed = false
            C_Timer.After(1, function()
                if InfoFrame_IsAnyPlayerComplete() == true then
                    if core.InfoFrame_PlayersTable ~= nil then
                        for player,status in pairs(core.InfoFrame_PlayersTable) do
                            for i=1,40 do
                                local auraData = C_UnitAuras.GetDebuffDataByIndex(player, i)
                                if auraData ~= nil and auraData.spellId == 322746 then ----322746
                                    core.InfoFrame_PlayersTable[player] = {2, math.floor(auraData.expirationTime - GetTime())}
                                    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
                                    updatePerformed = true
                                end
                            end
                        end

                    end
                end
                timerStarted = false

                if core.instance ~= nil and updatePerformed == true then
                    core._2291:TrackAdditional()
                end
            end)
        end
    end
end

function core._2291:ClearVariables()
    ------------------------------------------------------
    ---- The Manastorms
    ------------------------------------------------------
    echoFingerLaserXtremeCompleted = false
    shadowfuryCompleted = false
    stepsCompleted = 0
end

function core._2291:InstanceCleanup()
    ------------------------------------------------------
    ---- Highly Communicable
    ------------------------------------------------------
    initialSetup = false
    criteriaMet = false
end