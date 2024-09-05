--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Fungal Folly
------------------------------------------------------
core._2664 = {}
core._2664.Events = CreateFrame("Frame")

function core._2664:InstanceCleanup()
    core._2664.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2664.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2664:InitialSetup()
    core._2664.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2664.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
    --Successfully complete a Fungarian delve without being hit by Explosive Spores on Tier 8 or higher.
    if spellID == 427732 then
        core:getAchievementFailed(40445, true)
	end
end