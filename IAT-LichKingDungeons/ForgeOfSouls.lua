--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Forge of Souls Bosses
------------------------------------------------------
core._632 = {}

------------------------------------------------------
---- Bronjahm
------------------------------------------------------
local corruptedSoulFragments = 0


function core._632:Bronjahm()
    if core.type == "SPELL_SUMMON" and core.destID == "36535" then
        corruptedSoulFragments = corruptedSoulFragments + 1
        core:sendMessage(core:getAchievement() .. " Corrupted Soul Fragments Alive (" .. corruptedSoulFragments .. "/4)")
    end

    if core.type == "PARTY_KILL" and core.destID == "36535" then
        corruptedSoulFragments = corruptedSoulFragments - 1

        if core.achievementsCompleted[1] == true then
            core:getAchievementFailedWithMessageAfter(" This achievement can still be completed again by waiting for more Corrupted Soul Fragments")
            core.achievementsCompleted[1] = false
        end
    end

    if core.type == "SPELL_HEAL" and core.spellId == 68858 then
        corruptedSoulFragments = corruptedSoulFragments - 1
        core:sendMessage(core:getAchievement() .. " Corrupted Soul Fragments Alive (" .. corruptedSoulFragments .. "/4)")

        if core.achievementsCompleted[1] == true then
            core:getAchievementFailedWithMessageAfter(" This achievement can still be completed again by waiting for more Corrupted Soul Fragments")
            core.achievementsCompleted[1] = false
        end
    end

    if corruptedSoulFragments >= 4 then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end
end

function core._632:DevourerOfSouls()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 68982 then
        core:getAchievementFailed()
    end
end

function core._632:ClearVariables()
    ------------------------------------------------------
    ---- Bronjahm
    ------------------------------------------------------
    acorruptedSoulFragments = 0
end