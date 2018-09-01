--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Temple of Sethraliss Bosses
------------------------------------------------------
core._1877 = {}

function core._1877:Merektha()
    --Detect solid snake kill and tell raid to loot the body
    if core.type == "UNIT_DIED" and core.destID == "139304" then
        core:sendMessage(core:getAchievement() .. " Loot the Solid Snake now to complete the achievement")
    end
end