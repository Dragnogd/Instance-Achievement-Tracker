--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Court of Stars Bosses
------------------------------------------------------
core._1571 = {}

function core._1571:PatrolCaptainGerdo()
    if core:getBlizzardTrackingStatus(10610) == true then
		core:getAchievementSuccess()
	end
end

function core._1571:ClearVariables()
end