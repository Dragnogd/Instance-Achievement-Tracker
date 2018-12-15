--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Blackrock Caverns Bosses
------------------------------------------------------
core._645 = {}

------------------------------------------------------
---- Blackrock Caverns Bosses
------------------------------------------------------
local angeredEarthKilled = 0
local angeredEarthUID = {}

------------------------------------------------------
---- Blackrock Caverns Bosses
------------------------------------------------------
local evolvedTwilightZealotKilled = 0

function core._645:RomoggBonecrusher()
    if core.type == "SPELL_DAMAGE" and core.spellId == 75428 and core.overkill > 0 and angeredEarthUID[core.spawn_uid_dest] == nil then
        angeredEarthKilled = angeredEarthKilled + 1
        angeredEarthUID[core.spawn_uid_dest] = core.spawn_uid_dest
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " " .. format(L["Shared_AddKillCounter"], getNPCName(50376)) .. " (" .. angeredEarthKilled .. "/10)")
    end

    if angeredEarthKilled == 10 then
        core:getAchievementSuccess()
    end
end

function core._645:Corla()
    if core.type == "UNIT_DIED" and core.destName == "Evolved Twilight Zealot" then
        evolvedTwilightZealotKilled = evolvedTwilightZealotKilled + 1
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " " .. format(L["Shared_AddKillCounter"], getNPCName(39987)) .. " (" .. evolvedTwilightZealotKilled .. "/3)")
    end

    if evolvedTwilightZealotKilled == 3 then
        core:getAchievementSuccess()
    end
end

function core._645:KarshSteelbender()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 75846 and core.amount == 15 then
        core:getAchievementSuccess()
    end
end

function core._645:AscendantLordObsidius()
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 76189 and core.amount == 4 then
        core:getAchievementFailed()
    end
end

function core._645:ClearVariables()
    ------------------------------------------------------
    ---- Blackrock Caverns Bosses
    ------------------------------------------------------
    angeredEarthKilled = 0
    angeredEarthUID = {}

    ------------------------------------------------------
    ---- Blackrock Caverns Bosses
    ------------------------------------------------------
    evolvedTwilightZealotKilled = 0
end