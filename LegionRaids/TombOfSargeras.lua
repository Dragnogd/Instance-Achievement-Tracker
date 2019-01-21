--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Tomb of Sargeras Bosses
------------------------------------------------------
core._1676 = {}
core._1676.Events = CreateFrame("Frame")

------------------------------------------------------
---- Demonic Inquisition
------------------------------------------------------
local playersTormentTable = {}
local playersTorment = 0
local demonicInquisitionKilled = false

------------------------------------------------------
---- Sisters of the Moon
------------------------------------------------------
local healthPercentageReached = false
local waxingTwilightSoulFound = false


local hydraCompleted = false
local eelCompleted = false
local playerCompleted = false
local murlocCompleted = false
local inkCompleted = false
------------------------------------------------------
---- Mistress Sass'zine
------------------------------------------------------
local partsCompleted = 0

function core._1676:Goroth()
    if core:getBlizzardTrackingStatus(11724) == true then
        core:getAchievementSuccess()
    end
end

function core._1676:DemonicInquisition()
    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],playersTorment,core.groupSize)
    
    if core.type == "UNIT_DIED" and (core.destID == "116689" or core.destID == "116691") then
        demonicInquisitionKilled = true
    end

    if demonicInquisitionKilled == false then
        --Player has gained Unbearable Torment
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 233430 then
            if playersTormentTable[core.destName] == nil then
                playersTorment = playersTorment + 1
                playersTormentTable[core.destName] = core.destName
                core:sendMessage(core.destName .. " has gained Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
                --print(core.destName .. " has gained Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
                InfoFrame_SetPlayerComplete(core.destName)
            end
        end

        --Player has lost Unbearable Torment
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 233430 then
            if playersTormentTable[core.destName] ~= nil then
                playersTorment = playersTorment - 1
                playersTormentTable[core.destName] = nil
                --core:sendMessage(core.destName .. " has lost Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
                --print(core.destName .. " has lost Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
                InfoFrame_SetPlayerFailed(core.destName)

                --If achievement was already completed then fail it
                if core.achievementsCompleted[1] == true then
                    core:getAchievementFailed()
                    core.achievementsCompleted[1] = false
                end
            end
        end

        if playersTorment == core.groupSize then
            core:getAchievementSuccess()
            core.achievementsFailed[1] = false
        end
    end
end

function core._1676:Harjatan()
    if core.type == "UNIT_DIED" and core.destID == "121071" then
        core:getAchievementSuccess()
    end
end

function core._1676:MistressSasszine()
    --Hydra Essence
    if core:getBlizzardTrackingStatus(11676, 1) == true and hydraCompleted == false then
        hydraCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage("Hydra Essence part of " .. core:getAchievement() .. " completed (" .. partsCompleted .. "/5)")
    end

    --Eel Tartare
    if core:getBlizzardTrackingStatus(11676, 2) == true and eelCompleted == false then
        eelCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage("Eel Tartare part of " .. core:getAchievement() .. " completed (" .. partsCompleted .. "/5)")
    end

    --Ink Sauce
    if core:getBlizzardTrackingStatus(11676, 3) == true and inkCompleted == false then
        inkCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage("Ink Sauce part of " .. core:getAchievement() .. " completed (" .. partsCompleted .. "/5)")
    end

    --Murloc Fillet
    if core:getBlizzardTrackingStatus(11676, 4) == true and murlocCompleted == false then
        murlocCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage("Murloc Fillet part of " .. core:getAchievement() .. " completed (" .. partsCompleted .. "/5)")
    end

    --Player Seasoning
    if core:getBlizzardTrackingStatus(11676, 5) == true and playerCompleted == false then
        playerCompleted = true
        partsCompleted = partsCompleted + 1
        core:sendMessage("Player Seasoning part of " .. core:getAchievement() .. " completed (" .. partsCompleted .. "/5)")
    end

    if partsCompleted == 5 then
        core:getAchievementSuccess()
    end
end

function core._1676:SistersOfTheMoon()
    --Check if add is in combat with boss
    if core.sourceID == "121498" or core.destID == "121498" then
        waxingTwilightSoulFound = true
    end

    --Check if boss has reached phase 3
    for i = 1, 5 do
        if UnitGUID("boss" .. i) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID("boss" .. i))
            if (destID == "118523" or destID == "118374" or destID == "118518") and core:getHealthPercent("boss" .. i) <= 20 and healthPercentageReached == false and waxingTwilightSoulFound == true then
                core:sendMessage(core:getAchievement() .. " Kill the Waxing Twilight Soul now!")
                healthPercentageReached = true
            end
        end
    end

    --Add has died
    if core.type == "UNIT_DIED" and core.destID == "121498" then
        if healthPercentageReached == true then
            core:getAchievementSuccess()
        else
            core:getAchievementFailed()
        end
    end
end

function core._1676:Kiljaeden()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 241702 then
        --print("Failed Dark Souls")
        core:getAchievementFailed()
    end
end

function core._1676:DesolateHost()
    if core:getBlizzardTrackingStatus(11674) == false then
        core:getAchievementFailed()
    end
end

function core._1676:ClearVariables()
    ------------------------------------------------------
    ---- Sisters of the Moon
    ------------------------------------------------------
    healthPercentageReached = false
    waxingTwilightSoulFound = false

    ------------------------------------------------------
    ---- Mistress Sass'zine
    ------------------------------------------------------
    partsCompleted = 0
    playerCompleted = false
    murlocCompleted = false
    inkCompleted = false
    eelCompleted = false
    hydraCompleted = false

    ------------------------------------------------------
    ---- Demonic Inquisition
    ------------------------------------------------------
    playersTormentTable = {}
    playersTorment = 0
end

