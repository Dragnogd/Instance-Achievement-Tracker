--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _1182 Bosses
------------------------------------------------------
core._1182 = {}

function core._1182:SoulbinderNyami()
	if core:getBlizzardTrackingStatus(9023) == true then
		core:getAchievementSuccess()
	end
end

function core._1182:Azzakel()
	if core:getBlizzardTrackingStatus(9551) == false then
		core:getAchievementFailed()
	end
end

function core._1182:ClearVariables()
end