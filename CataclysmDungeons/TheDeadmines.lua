--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Deadmines Bosses
------------------------------------------------------
core.Deadmines = {}

------------------------------------------------------
---- Glubtok
------------------------------------------------------
local playersHit = {}

------------------------------------------------------
---- Helix Gearbreaker
------------------------------------------------------
local mineRatsCounter = 0

function core.Deadmines:Glubtok()
    if core.type == "SPELL_DAMAGE" and core.spellId == 91397 then
        --If someone gets hit by the ability, check if they need the achievement or not
        
        if playersHit[core.destName] == nil then
            --Players has not been hit already
            --Check if the player actually needs the achievement
            if core:has_value(core.currentBosses[1].players, core.destName) then
                --Player needs achievement but has failed it
                core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.achievementIDs[1]) .. " (Personal Achievement)")
            end
            playersHit[core.destName] = true
        end
    end
end

function core.Deadmines:HelixGearbreaker()
    if core.type == "UNIT_DIED" and core.destID == "51462" and mineRatsCounter < 20 then
        mineRatsCounter = mineRatsCounter + 1
        core:sendMessageDelay(GetAchievementLink(core.achievementIDs[1]) .. " Mine Rats Counter: " .. mineRatsCounter .. "/20",mineRatsCounter,5)
    end

    if mineRatsCounter == 20 then
        core:getAchievementSuccess()
    end
end

function core.Deadmines:ClearVariables()
    ------------------------------------------------------
    ---- Glubtok
    ------------------------------------------------------
    playersHit = {}

    ------------------------------------------------------
    ---- Helix Gearbreaker
    ------------------------------------------------------
    local mineRatsCounter = 0
end