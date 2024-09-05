--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Skittering Breach
------------------------------------------------------
core._2685 = {}
core._2685.Events = CreateFrame("Frame")

function core._2685:InstanceCleanup()
    core._2685.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2685.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2685:InitialSetup()
    core._2685.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2685.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
    --Successfully complete a Nerubian delve without spawning ambushers from Nerubian Webs or taking damage Nerubian Eggs from on Tier 8 or higher.
	if spellID == 432451 then
        core:getAchievementFailed(40453, true)
	end
end