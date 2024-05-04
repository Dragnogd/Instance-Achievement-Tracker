--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Cathedral of Eternal Night Bosses
------------------------------------------------------
core._1677 = {}

------------------------------------------------------
---- Thrashbite the Scornful
------------------------------------------------------
local buff1Counter = 0
local buff2Counter = 0
local buff3Counter = 0
local buff4Counter = 0
local playerCounter = {}

function core._1677:ThrashbiteTheScornful()
    --Volume 1: 121776 Voume 2: 121783 Volume 3: 121784 Voume 4: 121785
    --Buff 1: 243256 Buff 2: 243258 Buff 3: 243259 Buff 4: 243261

    InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],buff4Counter,5)

    --Check if all players in group have read books
    if core.destName ~= nil then
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 243256 then
            buff1Counter = buff1Counter + 1
            playerCounter[core.destName] = 1
            core:sendMessage(core:getAchievement() .. " " .. core.destName .. " " .. L["Core_Counter"] .. " (" .. playerCounter[core.destName] .. "/5)",true)
            InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerCounter[core.destName])
        elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 243258 then
            buff2Counter = buff2Counter + 1
            playerCounter[core.destName] = playerCounter[core.destName] + 1
            core:sendMessage(core:getAchievement() .. " " .. core.destName .. " " .. L["Core_Counter"] .. " (" .. playerCounter[core.destName] .. "/5)",true)
            InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerCounter[core.destName])
        elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 243259 then
            buff3Counter = buff3Counter + 1
            playerCounter[core.destName] = playerCounter[core.destName] + 1
            core:sendMessage(core:getAchievement() .. " " .. core.destName .. " " .. L["Core_Counter"] .. " (" .. playerCounter[core.destName] .. "/5)",true)
            InfoFrame_SetPlayerNeutralWithMessage(core.destName, playerCounter[core.destName])
        elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 243261 then
            buff4Counter = buff4Counter + 1
            playerCounter[core.destName] = playerCounter[core.destName] + 1
            core:sendMessage(core:getAchievement() .. " " .. core.destName .. " " .. L["Core_Counter"] .. " (" .. playerCounter[core.destName] .. "/5)",true)
            InfoFrame_SetPlayerCompleteWithMessage(core.destName, playerCounter[core.destName])

            if buff4Counter == 5 then
                core:getAchievementSuccess()
            end
        end
    end
end

function core._1677:Mephistroth()
    --Defeat Mephistroth within the Cathedral of Eternal Night after blocking 20 Shadow Blasts with the Aegis of Aggramar on Mythic difficulty.
	if core:getBlizzardTrackingStatus(11703) == true then
        core:getAchievementSuccess()
    end
end

function core._1677:ClearVariables()
    ------------------------------------------------------
    ---- Thrashbite the Scornful
    ------------------------------------------------------
    buff1Counter = 0
    buff2Counter = 0
    buff3Counter = 0
    buff4Counter = 0
end