--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Tomb of Sargeras Bosses
------------------------------------------------------
core.TombOfSargeras = {}

------------------------------------------------------
---- Demonic Inquisition
------------------------------------------------------
local playersTormentTable = {}
local playersTorment = 0

------------------------------------------------------
---- Sisters of the Moon
------------------------------------------------------
local healthPercentageReached = false

function core.TombOfSargeras:DemonicInquisition()
    --Player has gained Unbearable Torment
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 233430 then
        if playersTormentTable[core.destName] == nil then
            playersTorment = playersTorment + 1
            playersTormentTable[core.destName] = core.destName
            --core:sendMessage(core.destName .. " has gained Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
        end
    end

    --Player has lost Unbearable Torment
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 233430 then
        if playersTormentTable[core.destName] ~= nil then
            playersTorment = playersTorment - 1
            playersTormentTable[core.destName] = nil
            --core:sendMessage(core.destName .. " has lost Unbearable Torment (" .. playersTorment .. "/" .. core.groupSize .. ")")
        
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

function core.TombOfSargeras:Harjatan()
    if core.type == "UNIT_DIED" and core.destID == "121071" then
        core:getAchievementSuccess()
    end
end

function core.TombOfSargeras:SistersOfTheMoon()
    --Check if boss has reached 20% health
    if core:getHealthPercent("boss1") <= 20 then
        if healthPercentageReached == false then
            core:sendMessage(core:getAchievement() .. " Kill the Waxing Twilight Soul now!")
        end
        healthPercentageReached = true
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

function core.TombOfSargeras:Kiljaeden()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 241702 then
        --print("Failed Dark Souls")
        core:getAchievementFailed()
    end
end

function core.TombOfSargeras:ClearVariables()
    ------------------------------------------------------
    ---- Sisters of the Moon
    ------------------------------------------------------
    healthPercentageReached = false
end