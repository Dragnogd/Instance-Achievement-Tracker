--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Mogushan Palace Bosses
------------------------------------------------------
core.MoguShanPalace = {}

------------------------------------------------------
---- Xin the Weaponmaster
------------------------------------------------------
local gemsPressed = 0
local timerStarted = false

function core.MoguShanPalace.XinTheWeaponmaster()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 124537 then
        gemsPressed = gemsPressed + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(10, function()
                if gemsPressed ~= 2 then
                    core:getAchievementFailed()
                else
                    core:getAchievementSuccess()
                end
            end)
        end
    end
end

function core.MoguShanPalace:ClearVariables()
    ------------------------------------------------------
    ---- Xin the Weaponmaster
    ------------------------------------------------------
    gemsPressed = 0
    timerStarted = false
end