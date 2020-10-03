--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Halls of Atonement
------------------------------------------------------
core._2297 = {}

------------------------------------------------------
---- Echelon
------------------------------------------------------
local addsKilled = 0
local timerStarted = false
local addsTurnedToStone = {}
local addsTurnedToStoneCounter = 0

function core._2297:Halkias()
    --Defeat Halkias after he absorbs all three Shards of Halkas in the Halls of Atonement on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14567, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2297:Echelon()
    --Defeat Echelon after shatter 18 or more Undying Stonefiends at one time in the Halls of Atonement on Mythic difficulty.

    --Adds turned to stone
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "164363" and core.spellId == 319724 then
        if addsTurnedToStone[core.destID] == nil then
            addsTurnedToStone[core.destID] = core.destID
            addsTurnedToStoneCounter = addsTurnedToStoneCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(164363) .. " " .. L["Core_Counter"] .. " (" .. addsTurnedToStoneCounter .. "/18)",true)
        end
    end

    --Adds not stone anymore
    if core.type == "SPELL_AURA_REMOVED" and core.destID == "164363" and core.spellId == 319724 then
        if addsTurnedToStone[core.destID] ~= nil then
            addsTurnedToStone[core.destID] = nil
            addsTurnedToStoneCounter = addsTurnedToStoneCounter - 1
        end
    end

    if core.type == "SPELL_INSTAKILL" and core.destID == "164363" and core.spellId == 319965 then
        addsKilled = addsKilled + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(2, function()
                core:sendMessage(core:getAchievement() .. " " .. getNPCName(164363) .. " " .. L["Shared_Killed"] .. " (" .. addsKilled .. "/18)",true)
                addsKilled = 0
                timerStarted = false
            end)
        end
    end

    if core:getBlizzardTrackingStatus(14284, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2297:LordChamberlain()
    --Defeat Lord Chamberlain with 3 Sinstone Statues in corners of the room in the Halls of Atonement on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14352, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2297:ClearVariables()
    ------------------------------------------------------
    ---- Echelon
    ------------------------------------------------------
    addsKilled = 0
    timerStarted = false
    addsTurnedToStone = {}
    addsTurnedToStoneCounter = 0
end