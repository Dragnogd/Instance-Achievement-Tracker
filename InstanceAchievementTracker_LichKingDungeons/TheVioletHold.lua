--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Violet Hold Bosses
------------------------------------------------------
core._608 = {}
core._608.Events = CreateFrame("Frame")

------------------------------------------------------
---- Defenseless
------------------------------------------------------
local defenselessFailed = false

function core._608:ZuramatTheObliterator()
    if core.type == "UNIT_DIED" and core.destID == "29364" then
        core:getAchievementFailed()
    end
end

function core._608:ClearVariables()
end

function core._608:InstanceCleanup()
    core._608.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._608:InitialSetup()
    core._608.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._608.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._608.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and defenselessFailed == false then
        --Check if player has clicked on a crystal
        if spellID == 6247 then
            core:sendMessage(GetAchievementLink(1816) .. " FAILED! Defense Control Crystal Used (" .. UnitName(unitID) .. ")")
            defenselessFailed = true
        end
    end
end

function core._608:TrackAdditional()
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true and defenselessFailed == false then
        if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 58040 then
            core:sendMessage(GetAchievementLink(1816) .. " FAILED! Prison Seal Integrity less than 100%")
            defenselessFailed = true
        end
    end
end