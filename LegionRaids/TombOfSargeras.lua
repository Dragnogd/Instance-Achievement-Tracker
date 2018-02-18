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
    if UnitHealth("boss1") / UnitHealthMax("boss") *100 <= 20 then
        healthPercentageReached = true

        if healthPercentageReached == false then
            print("Health Percentage Reached")
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

function core.TombOfSargeras:Kiljaeden()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 241702 then
        core:getAchievementFailed()
    end
end

function core.TombOfSargeras:ClearVariables()
    ------------------------------------------------------
    ---- Sisters of the Moon
    ------------------------------------------------------
    healthPercentageReached = false
end