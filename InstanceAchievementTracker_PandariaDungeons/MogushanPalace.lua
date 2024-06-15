--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Mogushan Palace Bosses
------------------------------------------------------
core._994 = {}

------------------------------------------------------
---- Xin the Weaponmaster
------------------------------------------------------
local achievementSuccess = false
local timerStarted = false

function core._994.XinTheWeaponmaster()
    --Achievement Success
    if core.type == "SPELL_DAMAGE" and core.spellId == 124527 then
        achievementSuccess = true
    end

    --Check if Achievement has Failed
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 124537 then
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(10, function()
                if achievementSuccess == false then
                    core:getAchievementFailed()
                end
            end)
        end
    end
end

function core._994:ClearVariables()
    ------------------------------------------------------
    ---- Xin the Weaponmaster
    ------------------------------------------------------
    timerStarted = false
    achievementSuccess = false
end