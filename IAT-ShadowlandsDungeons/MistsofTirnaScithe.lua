--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Mists of Tirna Scithe
------------------------------------------------------
core._2290 = {}

------------------------------------------------------
---- Tredova
------------------------------------------------------
local announceKillAdd = false

------------------------------------------------------
---- IngraMaloch
------------------------------------------------------
local announceKillOvergrownHydra = false
local hydraSeedCounter = 0

function core._2290:IngraMaloch()
    --Defeat Ingra Maloch after defeating an Overgrown Hydra on in thie Mists of Tirna Scithe on Mythic difficulty.

    --Hydra Seed Nourised stacks
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 338349 and core.destID == "172995" then
        hydraSeedCounter = hydraSeedCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(172995) .. " " .. L["Core_Counter"] .. " (" .. hydraSeedCounter .. "/9)",true)
    end

    --Detect when Overgrown Hydra has spawned
    if core.sourceID == "172992" or core.destID == "172992" and announceKillOvergrownHydra == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(172992)),true)
        announceKillOvergrownHydra = true
    end

    if core:getBlizzardTrackingStatus(14503, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2290:Tredova()
    --Defeat Tred'ova after defeating an Elightened Spinemaw Gorger in the Mists of Tirna Scithe on Mythic difficulty.

    --Detect when add get enlightenment
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 336407 and core.destID == "172312" and announceKillAdd == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(172312)),true)
        announceKillAdd = true
    end

    if core:getBlizzardTrackingStatus(14375, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2290:ClearVariables()
    ------------------------------------------------------
    ---- Tredova
    ------------------------------------------------------
    announceKillAdd = false

    ------------------------------------------------------
    ---- IngraMaloch
    ------------------------------------------------------
    announceKillOvergrownHydra = false
    hydraSeedCounter = 0
end