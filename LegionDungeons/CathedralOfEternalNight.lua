--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Cathedral of Eternal Night Bosses
------------------------------------------------------
core._1677 = {}

------------------------------------------------------
---- Thrashbite the Scornful
------------------------------------------------------
local volumeCounter = 0
local buff1Counter = 0
local buff2Counter = 0
local buff3Counter = 0
local buff4Counter = 0

function core._1677:ThrashbiteTheScornful()
    --Volume 1: 121776 Voume 2: 121783 Volume 3: 121784 Voume 4: 121785
    --Buff 1: 243256 Buff 2: 243258 Buff 3: 243259 Buff 4: 243261

    --Check if books spawn in correct order
    if core.type == "SPELL_SUMMON" and core.spellId == 121776 and volumeCounter == 0 then
        --Volume 1
        volumeCounter = 1
    elseif core.type == "SPELL_SUMMON" and core.spellId == 121783 and volumeCounter == 1 then
        --Volume 2
        volumeCounter = 2
    elseif core.type == "SPELL_SUMMON" and core.spellId == 121784 and volumeCounter == 2 then
        --Volume 3
        volumeCounter = 3
    elseif core.type == "SPELL_SUMMON" and core.spellId == 121785 and volumeCounter == 3 then
        --Volume 3
        volumeCounter = 4
    elseif core.type == "SPELL_SUMMON" and (core.spellId == 121776 or core.spellId == 121783 or core.spellId == 121784 or core.spellId == 121785) then
        --Books were read in the wrong order!!!
        core:getAchievementFailedWithMessageAfter("Books read in the wrong order")
    end

    --Check if all players in group have read books
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 243256 then
        buff1Counter = buff1Counter + 1
        core:sendMessage(core.destName .. " has read Volume 1 (" .. buff1Counter .. "/5)")
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 243258 then
        buff2Counter = buff2Counter + 1
        core:sendMessage(core.destName .. " has read Volume 2 (" .. buff2Counter .. "/5)")
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 243259 then
        buff3Counter = buff3Counter + 1
        core:sendMessage(core.destName .. " has read Volume 3 (" .. buff3Counter .. "/5)")
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 243261 then
        buff4Counter = buff4Counter + 1
        core:sendMessage(core.destName .. " has read Volume 4 (" .. buff4Counter .. "/5)")

        if buff4Counter == 5 then
            core:getAchievementSuccess()
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
    volumeCounter = 0
    buff1Counter = 0
    buff2Counter = 0
    buff3Counter = 0
    buff4Counter = 0
end