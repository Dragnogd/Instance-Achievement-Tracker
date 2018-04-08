--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Vault of the Wardens Bosses
------------------------------------------------------
core.VaultOfTheWardens = {}

------------------------------------------------------
---- Ash'Golm
------------------------------------------------------
local playersFiredUp = 0

function core.VaultOfTheWardens:AshGolm()
    --Gained Debuff
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 215478 then
        playersFiredUp = playersFiredUp + 1
        core:sendMessage(core.destName .. " has gained Fired Up debuff (" .. playersFiredUp .. "/" .. core.groupSize .. ")")
    end

    --Lost Debuff
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 215478 then
        playersFiredUp = playersFiredUp - 1
        if core.achievementsCompleted[1] == true then
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
        end
    end

    --Achievement Success
    if playersFiredUp == core.groupSize then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core.VaultOfTheWardens:Cordana()
    if core.type == "SPELL_DAMAGE" and core.core.spellId == 197506 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core.VaultOfTheWardens:ClearVariables()
end