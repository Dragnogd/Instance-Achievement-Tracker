--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _1209 Bosses
------------------------------------------------------
core._1209 = {}
core._1209.Events = CreateFrame("Frame")

------------------------------------------------------
---- Ranjit
------------------------------------------------------
local playersHit = {}

------------------------------------------------------
---- Rukhran
------------------------------------------------------
local lastTime = nil
local birdCounter = 0

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

function core._1209:InstanceCleanup()
    core._1209.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._1209.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1209:InitialSetup()
    core._1209.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._1209.Events:UNIT_SPELLCAST_SUCCEEDED(self, unit, castGUID, spellID)
    if spellID == 153828 then
        if lastTime == nil or lastTime == GetTime() then
            birdCounter = birdCounter + 1
        else
            birdCounter = 1
        end
        lastTime = GetTime()
    end

    if birdCounter >= 3 then
        C_Timer.After(1, function()
            core:getAchievementSuccess()
        end)
    end
end

function core._1209:ClearVariables()
    ------------------------------------------------------
    ---- Ranjit
    ------------------------------------------------------
    playersHit = {}

    ------------------------------------------------------
    ---- Rukhran
    ------------------------------------------------------
    lastTime = nil
    birdCounter = 0
end