--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Vault of the Wardens Bosses
------------------------------------------------------
core._1493 = {}

------------------------------------------------------
---- Ash'Golm
------------------------------------------------------
local playersFiredUp = 0
local ashGolmKilled = false

function core._1493:AshGolm()
    if core.type == "UNIT_DIED" and core.destID == "95886" then
        ashGolmKilled = true
    end

    if ashGolmKilled == false then
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
                core.achievementsCompleted[1] = false
            end
        end

        --Achievement Success
        if playersFiredUp == core.groupSize then
            core:getAchievementSuccess()
            core.achievementsFailed[1] = false
        end
    end
end

function core._1493:Cordana()
    if core.type == "SPELL_DAMAGE" and core.spellId == 197506 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._1493:ClearVariables()
end

function core._1493:InstanceCleanup()
    ashGolmKilled = false
end