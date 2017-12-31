--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Eye of Azshara Bosses
------------------------------------------------------
core.EyeOfAzshara = {}

------------------------------------------------------
---- Lady Hatecoil
------------------------------------------------------
local timerStarted = false
local saltseaGlobulesCounter = 0

function core.EyeOfAzshara:WarlordParjesh()
    if core.type == "UNIT_DIED" and core.destID == "97264" then
        core:getAchievementFailed()
    end
end

function core.EyeOfAzshara:LadyHatecoil()
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

    if core.type == "UNIT_DIED" then
        if timerStarted == true and core.destFlags == 0xa48 then
            saltseaGlobulesCounter = saltseaGlobulesCounter + 1
        end
    end
    

end

function core.EyeOfAzshara:WrathOfAzshara()
    
end

function core.EyeOfAzshara:ClearVariables()

end