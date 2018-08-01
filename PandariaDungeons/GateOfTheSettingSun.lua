--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Gate of the Setting Sun Bosses
------------------------------------------------------
core._962 = {}
core._962.Events = CreateFrame("Frame")

local f = CreateFrame("Frame")

------------------------------------------------------
---- Saboteur Kip'tilak
------------------------------------------------------
local stableMunitionsCounter = 0
local tempStore = {}

function core._962:SaboteurKiptilak()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 107215 and core.spawn_uid_dest ~= nil then
        if core:has_value(tempStore, core.spawn_uid_dest) == false then
            if stableMunitionsCounter > 0 then
                stableMunitionsCounter = stableMunitionsCounter - 1
            end
            table.insert(tempStore, core.spawn_uid_dest)  
        end
    end

    if stableMunitionsCounter >= 15 then
        core:getAchievementSuccessWithCustomMessage("","15 Stable Munitions Bombs Active. DPS boss down to 70% to complete achievement")
    end
end

function core._962:Raigonn()
    if core.type == "UNIT_DIED" and (core.destID == "56929" or core.destID == "56930" or core.destID == "56912") then
        core:getAchievementFailed()
    end
end

function core._962:ClearVariables()
    ------------------------------------------------------
    ---- Saboteur Kip'tilak
    ------------------------------------------------------
    stableMunitionsCounter = 0
    tempStore = {}
end

function core._962:InstanceCleanup()
    core._962.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._962:InitialSetup()
    core._962.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._962.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._962.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
        --Plant Munitions
        if spellID == 114288 then
            stableMunitionsCounter = stableMunitionsCounter + 1
        end
    end
end

