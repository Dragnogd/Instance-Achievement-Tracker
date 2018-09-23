--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Tomb of Sargeras Bosses
------------------------------------------------------
core._1676 = {}

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

function core._1676:Goroth()
    if core:getBlizzardTrackingStatus(11724) == true then
        core:getAchievementSuccess()
    end
end

function core._1676:DemonicInquisition()
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
            end
        end

        --Player has lost Unbearable Torment
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 233430 then
            if playersTormentTable[core.destName] ~= nil then
                playersTorment = playersTorment - 1
                playersTormentTable[core.destName] = nil
                --core:sendMessage(core.destName .. " has lost Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
                --print(core.destName .. " has lost Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")

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

function core._1676:ClearVariables()
    ------------------------------------------------------
    ---- Sisters of the Moon
    ------------------------------------------------------
    healthPercentageReached = false
    waxingTwilightSoulFound = false
end

function core._1676:InstanceCleanup()
    demonicInquisitionKilled = false
end