--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Mycomancer Cavern
------------------------------------------------------
core._2679 = {}
core._2679.Events = CreateFrame("Frame")

function core._2679:InstanceCleanup()
    core._2679.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2679.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2679:InitialSetup()
    core._2679.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2679.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
    --Successfully complete a Fungarian delve without being hit by Explosive Spores on Tier 8 or higher.
	if spellID == 427732 then
        core:getAchievementFailed(40445, true)
	end
end