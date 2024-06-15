--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Freehold Bosses
------------------------------------------------------
core._1754 = {}

------------------------------------------------------
---- Harlan Sweete
------------------------------------------------------
local chestsDestroyed = 0
local chestUID = {}

function core._1754:SkycapnKragg()
    if core.type == "UNIT_DIED" and core.destID == "138314" then
        core:getAchievementSuccess()
    end
end

function core._1754:HarlanSweete()
    --Defeat Harlan Sweete after destroying three Chests o' Booty in Freehold on Mythic Difficulty.
    if core.type == "SPELL_DAMAGE" and core.destID == "144596" and core.spellId == 257310 then
        if chestUID[core.spawn_uid_dest] == nil then
            chestUID[core.spawn_uid_dest] = core.spawn_uid_dest
            chestsDestroyed = chestsDestroyed + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(144596) .. " " .. L["Core_Counter"] .. " (" .. chestsDestroyed .. "/3)",true)
        end
    end

    if chestsDestroyed == 3 then
        core:getAchievementSuccess()
    end
end

function core._1754:ClearVariables()
    ------------------------------------------------------
    ---- Harlan Sweete
    ------------------------------------------------------
    chestsDestroyed = 0
end