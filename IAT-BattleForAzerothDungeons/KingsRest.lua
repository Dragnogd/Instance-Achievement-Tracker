--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Kings Rest Bosses
------------------------------------------------------
core._1762 = {}

------------------------------------------------------
---- Mchimba The Embalmer
------------------------------------------------------
local struggleUsed = false

function core._1762:MchimbaTheEmbalmer()
    --Defeat Mchimba the Embalmer without him finishing a cast of Open Coffin and with entombed players using Struggle no more than once per cast of Entomb on Mythic Difficulty.

    --Boss has successfully cast Open Coffin so fail achievement
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 271290 then
        core:getAchievementFailed()
    end

    --Reset Struggle counter since emtomb has been cast
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 267702 then
        struggleUsed = false
    end

    --Check if player has used Struggle too many times.
    if core.type == "SPELL_CAST_SUCEESS" and core.spellId == 267764 and struggleUsed == false then
        struggleUsed = true
    elseif core.type == "SPELL_CAST_SUCEESS" and core.spellId == 267764 and struggleUsed == true then
        core:getAchievementFailed()
    end

    --Entomb 267702
    --Open Coffin 271290
    --Struggle 267764
end

function core._1762:ClearVariables()
    ------------------------------------------------------
    ---- Mchimba The Embalmer
    ------------------------------------------------------
    struggleUsed = false
end