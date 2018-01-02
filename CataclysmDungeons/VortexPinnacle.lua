--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Vortex Pinnacle Bosses
------------------------------------------------------
core.TheVortexPinnacle = {}

------------------------------------------------------
---- Asaad
------------------------------------------------------
local playersHit = {}

function core.TheVortexPinnacle:Asaad()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 87618 then
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

function core.TheVortexPinnacle:ClearVariables()
    ------------------------------------------------------
    ---- Asaad
    ------------------------------------------------------
    playersHit = {}
end