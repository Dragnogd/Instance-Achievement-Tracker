--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Halls of Origination Bosses
------------------------------------------------------
core.HallsOfOrigination = {}
core.HallsOfOrigination.Events = CreateFrame("Frame")

------------------------------------------------------
---- Temple Guardian Anhuur
------------------------------------------------------
local reverberatingHymnTimerStarted = false

------------------------------------------------------
---- Earthrager Ptah
------------------------------------------------------
local lastPlayerHit = nil
local playersHit = {}

local playersVehicle = {}


function core.HallsOfOrigination:TempleGuardianAnhuur()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 75322 and reverberatingHymnTimerStarted == false then
        reverberatingHymnTimerStarted = true
        C_Timer.After(15, function()
            --If the timer has not been stopped than fail the achievement
            if reverberatingHymnTimerStarted == true then
                core:getAchievementFailed()
            end
        end)
    end

    if core.type == "SPELL_INTERRUPT" then
        if core.extraSpellId == 75322 then
            reverberatingHymnTimerStarted = false
        end
    end
end

function core.HallsOfOrigination:EarthragerPtah()
    -- if core.type == "SPELL_DAMAGE" and (core.spellId == 75339 or core.spellId == 75548) then
    --     lastPlayerHit = core.destName
    --     print(core.destName)
    -- end

    -- if core.type == "UNIT_DIED" and core.destID == "39443" then
    --     if playersHit[lastPlayerHit] == nil then
    --         --Players has not been hit already
    --         --Check if the player actually needs the achievement
    --         if core:has_value(core.Instances.Catacalysm.Dungeons.HallsOfOrigination.boss2.players, lastPlayerHit) then
    --             --Player needs achievement but has failed it
    --             core:sendMessage(lastPlayerHit .. " has failed " .. GetAchievementLink(core.currentAchievementID) .. " (Personal Achievement)")
    --         end
    --         playersHit[lastPlayerHit] = true
    --     end
    -- end


end

function core.HallsOfOrigination:ClearVariables()
    ------------------------------------------------------
    ---- Temple Guardian Anhuur
    ------------------------------------------------------
    reverberatingHymnTimerStarted = false

    ------------------------------------------------------
    ---- Earthrager Ptah
    ------------------------------------------------------
    lastPlayerHit = nil
    playersHit = {}
end

core.HallsOfOrigination.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.HallsOfOrigination:InitialSetup()
    core.HallsOfOrigination.Events:RegisterEvent("UNIT_ENTERING_VEHICLE")
    core.HallsOfOrigination.Events:RegisterEvent("UNIT_EXITING_VEHICLE")
end

function core.HallsOfOrigination.Events:UNIT_ENTERING_VEHICLE(self, unitID, arg2, arg3, arg4, arg5, arg6, vehicleGUID, arg8, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        local unitType, _, _, _, _, sourceID, spawn_uid = strsplit("-", vehicleGUID)
        if sourceID == "39443" then
            local name = UnitName(unitID)
            playersVehicle[name] = name
        end
    end
end

function core.HallsOfOrigination.Events:UNIT_EXITING_VEHICLE(self, unitID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        local name = UnitName(unitID)
        if playersVehicle[name] ~= nil then
            core:sendMessage(name .. " Has been knocked off their camel")
        end
    end
end