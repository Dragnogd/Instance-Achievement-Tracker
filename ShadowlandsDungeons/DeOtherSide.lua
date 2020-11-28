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
        core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(323992) .. " " .. L["Shared_Completed"] .. " (" .. stepsCompleted .. "/2)",true)
    end

    --Echo Shadowfury
    if core.type == "SPELL_DAMAGE" and core.spellId == 320132 and core.destID == "164555" and shadowfuryCompleted == false then
        shadowfuryCompleted = true
        stepsCompleted = stepsCompleted + 1
        core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(320132) .. " " .. L["Shared_Completed"] .. " (" .. stepsCompleted .. "/2)",true)
    end

    if stepsCompleted == 2 then
        core:getAchievementSuccess()
    end
end

core._2291.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2291:InstanceCleanup()
    core._2291.Events:UnregisterEvent("UNIT_AURA")
    core.IATInfoFrame:ToggleOff()
end

function core._2291:InitialSetup()
    core._2291.Events:RegisterEvent("UNIT_AURA")
end

function core._2291:TrackAdditional()
    if initialSetup == true then
        --InfoFrame_RefreshPlayersOnInfoFrameTable()

        if timerStarted == false then
            timerStarted = true
            C_Timer.After(1, function()
                if core.InfoFrame_PlayersTable ~= nil then
                    for player,status in pairs(core.InfoFrame_PlayersTable) do
                        for i=1,40 do
                            local _, _, _, _, _, expirationTime, _, _, _, spellId = UnitDebuff(player, i)
                            if spellId == 322746 then
                                core.InfoFrame_PlayersTable[player] = {2, math.floor(expirationTime - GetTime())}
                                InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
                            end
                        end
                    end

                end
                timerStarted = false

                if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players ~= nil then
                    core._2291:TrackAdditional()
                end
            end)
        end
    end
end

function core._2291.Events:UNIT_AURA(self, unitID)
    local name, realm = UnitName(unitID)
    local foundCorruptedBlood = false
    for i=1,40 do
        local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
        if spellId == 322746 then
            foundCorruptedBlood = true
        end
    end

    if initialSetup == false and foundCorruptedBlood == true then
        core.IATInfoFrame:SetHeading(GetAchievementLink(14354))
        InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasNotBeenMet"],"red")
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"])
        core.IATInfoFrame:ToggleOn()
        initialSetup = true
        core._2291:TrackAdditional()
    end

    if foundCorruptedBlood == true and name ~= nil then
        if InfoFrame_GetPlayerCompleteWithMessage(name) == false then
            InfoFrame_SetPlayerCompleteWithMessage(name, "")
            InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasBeenMet"],"green")
        end
    else
        InfoFrame_SetPlayerFailedWithMessage(name, "")
        if InfoFrame_IsAnyPlayerComplete() == false then
            InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasNotBeenMet"],"red")
        end
    end

    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
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
end