--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- The Azure Vault Bosses
------------------------------------------------------
core._2515 = {}

------------------------------------------------------
---- Other
------------------------------------------------------
local hidePlayersFailed = {}

------------------------------------------------------
---- Umbrelskul
------------------------------------------------------
local geodeChunksKilled = 0

------------------------------------------------------
---- Telash Greywing
------------------------------------------------------
local icyStacksCount = 0

function core._2515:Umbrelskul2()
    --Defeat Umbrelskul after smashing Shimmering Geodes with Dragon Strike and destroying 9 Geode Chunks in The Azure Vault on Mythic difficulty.

    if core.type == "UNIT_DIED" and core.destID == "196696" then
        geodeChunksKilled = geodeChunksKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(196696) .. " " .. L["Shared_Killed"] .. " (" .. geodeChunksKilled .. "/9)",true)
    end

    if core:getBlizzardTrackingStatus(16331, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2515:TelashGreywing()
    --Defeat Telash Greywing after using Icy Devastator 12 times on an Icy Crystal to create a Very Icy Crystal in The Azure Vault on Mythic difficulty.

    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.destID == "197643" and core.spellId == 392417 then
        icyStacksCount = icyStacksCount + 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(392417) .. " " .. L["Core_Counter"] .. " (" .. icyStacksCount .. "/12)",true)
    end

    if core:getBlizzardTrackingStatus(16445, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2515:TrackAdditional()
	--You Must Be Made of Hide
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
        --Polymorphed
		if core.type == "SPELL_AURA_APPLIED" and core.spellId == 386368 then
			if core.destName ~= nil then
                local name, realm = UnitName(core.destName)
                if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players, name) == true and core:has_value(hidePlayersFailed, core.destName) == false then
                    table.insert(hidePlayersFailed, core.destName)
                    core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(16330), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(386368))),true)
                end
			end
		end

        --Shreiking Whelp
        if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 397726 then
			if core.destName ~= nil then
				local name, realm = UnitName(core.destName)
                if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players, name) == true and core:has_value(hidePlayersFailed, core.destName) == false then
                    table.insert(hidePlayersFailed, core.destName)
                    core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(16330), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(397726))),true)
                end
			end
		end
	end
end

function core._2515:InstanceCleanup()
    ------------------------------------------------------
    ---- Other
    ------------------------------------------------------
    hidePlayersFailed = {}
end

function core._2515:ClearVariables()
    ------------------------------------------------------
    ---- The Azure Vault Bosses
    ------------------------------------------------------
    geodeChunksKilled = 0

    ------------------------------------------------------
    ---- Telash Greywing
    ------------------------------------------------------
    icyStacksCount = 0
end