--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Tomb of Sargeras Bosses
------------------------------------------------------
core.TombOfSargeras = {}

------------------------------------------------------
---- Sisters of the Moon
------------------------------------------------------
local healthPercentageReached = false

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