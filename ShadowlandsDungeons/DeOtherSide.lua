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
local playersCompletedAchievement = 0

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
    C_Timer.After(5, function()
        core.IATInfoFrame:ToggleOn()
        InfoFrame_UpdatePlayersOnInfoFrame()
        InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasNotBeenMet"],"red")
        core.IATInfoFrame:SetHeading(GetAchievementLink(14354))
    end)
end

function core._2291:TrackAdditional()
    InfoFrame_RefreshPlayersOnInfoFrame()
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

    if foundCorruptedBlood == true then
        InfoFrame_SetPlayerComplete(name)
        InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasBeenMet"],"green")
    else
        InfoFrame_SetPlayerFailed(name)
        if InfoFrame_IsAnyPlayerComplete() == false then
            InfoFrame_SetHeaderWithColour(L["Shared_CriteriaHasNotBeenMet"],"red")
        end
    end
    InfoFrame_UpdatePlayersOnInfoFrame()
end

function core._2291:ClearVariables()
    ------------------------------------------------------
    ---- Highly Communicable
    ------------------------------------------------------
    playersCompletedAchievement = 0

    ------------------------------------------------------
    ---- The Manastorms
    ------------------------------------------------------
    echoFingerLaserXtremeCompleted = false
    shadowfuryCompleted = false
    stepsCompleted = 0
end