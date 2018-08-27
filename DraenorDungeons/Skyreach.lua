--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _1209 Bosses
------------------------------------------------------
core._1209 = {}

------------------------------------------------------
---- Ranjit
------------------------------------------------------
local playersHit = {}

function core._1209:Ranjit()
    local playerHit = false
    local reason = nil
    
    --Spinning Blade
    if core.spellId == 153123 then 
        playerHit = true
        reason = "Spinning Blade"
    end

    --Windwall
    if core.spellId == 153759 then
        playerHit = true
        reason = "Windwall"
    end
    
    --Four Winds
    if core.spellId == 153139 then
        playerHit = true
        reason = "Four Winds"
    end
    
    --Lens Flare
    if core.spellId == 154043 then
        playerHit = true
        reason = "Lens Flare"
    end
    
    if playerHit == true then
        if playersHit[core.destName] == nil then
            --Players has not been hit already
            --Check if the player actually needs the achievement
            if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players, core.destName) then
                --Player needs achievement but has failed it
                core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.currentAchievementID) .. " (Personal Achievement) (Reason: Damage from " .. reason .. ")")
            end
            playersHit[core.destName] = true
        end
    end
end

function core._1209:HighSageViryx()
    if core.type == "UNIT_DIED" and core.destID == "76292" then
        core:getAchievementFailed()
    end
end

function core._1209:ClearVariables()
    ------------------------------------------------------
    ---- Ranjit
    ------------------------------------------------------
    playersHit = {}
end