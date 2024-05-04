--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Temple of Sethraliss Bosses
------------------------------------------------------
core._1877 = {}

function core._1877:Merektha()
    --Detect solid snake kill and tell raid to loot the body
    if core.type == "UNIT_DIED" and core.destID == "139304" then
        core:sendMessage(core:getAchievement() .. format(L["TempleOfSethraliss_Merektha_LootSnake"], getNPCName(139304)))
    end
end

function core._1877:AvatarOfSethraliss()
    --Detect if Prince has spawned
    if core.destID == "139314" or core.sourceID == "139314" then
        core:getAchievementSuccess()
    end
end