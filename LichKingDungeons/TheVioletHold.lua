--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Violet Hold Bosses
------------------------------------------------------
core.VioletHold = {}
core.VioletHold.Events = CreateFrame("Frame")

------------------------------------------------------
---- Defenseless
------------------------------------------------------
local defenselessFailed = false

function core.VioletHold:ZuramatTheObliterator()
    if core.type == "UNIT_DIED" and core.destID == "29364" then
        core:getAchievementFailed()
    end
end

function core.VioletHold:ClearVariables()
end

function core.VioletHold:InstanceCleanup()
    core.VioletHold.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core.VioletHold:InitialSetup()
    core.VioletHold.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core.VioletHold.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.VioletHold.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and defenselessFailed == false then
        --Check if player has clicked on a crystal
        if spellID == 6247 then
            core:sendMessage(GetAchievementLink(1816) .. " FAILED! Defense Control Crystal Used (" .. UnitName(unitID) .. ")")
            defenselessFailed = true
        end
    end
end

function core.VioletHold:TrackAdditional()
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and defenselessFailed == false then
        if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 58040 then
            core:sendMessage(GetAchievementLink(1816) .. " FAILED! Prison Seal Integrity less than 100%")
            defenselessFailed = true
        end
    end
end