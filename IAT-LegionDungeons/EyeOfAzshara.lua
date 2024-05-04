--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Eye of Azshara Bosses
------------------------------------------------------
core._1456 = {}

------------------------------------------------------
---- Lady Hatecoil
------------------------------------------------------
local timerStarted = false
local saltseaGlobulesCounter = 0

------------------------------------------------------
---- Wrath of Azshara
------------------------------------------------------
local playersHit = {}


function core._1456:WarlordParjesh()
    if core.type == "UNIT_DIED" and core.destID == "97264" then
        core:getAchievementFailed()
    end
end

function core._1456:LadyHatecoil()
    core:trackMob("98293", "Saltsea Globule", 11, "Kill the Salsea Globules with Curse of The Witch Now", 1, nil, nil)

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 193698 then
        timerStarted = true
        C_Timer.After(3, function() 
            timerStarted = false
            if saltseaGlobulesCounter >= 11 then
                core:getAchievementSuccess()
            else
                if saltseaGlobulesCounter > 0 then
                    core:sendMessage(saltseaGlobulesCounter .. "/11 Saltsea Globules killed with Curse of the Witch")
                end
                saltseaGlobulesCounter = 0
            end
        end)
    end

    if core.type == "UNIT_DIED" and core.destID == "98293" then
        if timerStarted == true and core.destFlags == 0xa48 then
            saltseaGlobulesCounter = saltseaGlobulesCounter + 1
        end
    end
end

function core._1456:WrathOfAzshara()
    local failed = false

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 196665 or core.spellId == 196666 then
        failed = true
    end

    if failed == true then
        if playersHit[core.destName] == nil then
            --Players has not been hit already
            --Check if the player actually needs the achievement
            if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, core.destName) then
                --Player needs achievement but has failed it
                core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.currentAchievementID) .. " (Personal Achievement)")
            end
            playersHit[core.destName] = true
        end
    end
end

function core._1456:ClearVariables()
    ------------------------------------------------------
    ---- Lady Hatecoil
    ------------------------------------------------------
    timerStarted = false
    saltseaGlobulesCounter = 0

    ------------------------------------------------------
    ---- Wrath of Azshara
    ------------------------------------------------------
    playersHit = {}
end