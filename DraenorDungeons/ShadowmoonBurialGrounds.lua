--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Shadowmoon Burial Grounds Bosses
------------------------------------------------------
core._1176 = {}

------------------------------------------------------
---- Bonemaw
------------------------------------------------------
local corpseSkitterlingUID = {}
local corpseSkitterlingCounter = 0
local corpseSkitterlingAnnounced = false

------------------------------------------------------
---- Ner'zhul
------------------------------------------------------
local ritualOfBonesCounter = 0
local timerStarted = false

function core._1176:Bonemaw()
    --Corpse Skitterlings Alive
    if (core.type == "SWING_DAMAGE" or core.type == "SWING_MISSED") and core.sourceID == "77006" then
        if corpseSkitterlingUID[core.spawn_uid] == nil then
            corpseSkitterlingUID[core.spawn_uid] = core.spawn_uid
            corpseSkitterlingCounter = corpseSkitterlingCounter + 1
            --print(core.spawn_uid .. " : " .. corpseSkitterlingCounter)
        end
    end

    --Corpse Skitterlings Dead
    if core.type == "UNIT_DIED" and core.destID == "77006" then
        corpseSkitterlingUID[core.spawn_uid_dest] = false
        corpseSkitterlingCounter = corpseSkitterlingCounter - 1
        --print(core.spawn_uid_dest .. " : " .. corpseSkitterlingCounter)
    end

    --Corpse Skitterlings Sucked up by boss
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 153804 then
        C_Timer.After(5, function()
            core:sendMessage(GetAchievementLink(9025) .. " " .. corpseSkitterlingCounter .. " /25 Corpse Skitterlings inhaled by the boss")
            if corpseSkitterlingCounter >= 25 then
                core:getAchievementSuccess()
            else
                core:getAchievementFailed()
            end
        end)
    end

    --25 Corpse Skitterlings collected before boss
    if corpseSkitterlingCounter > 25 and corpseSkitterlingAnnounced == false then
        corpseSkitterlingAnnounced = true
        core:sendMessage(GetAchievementLink(9025) .. " 25 Corpse Skitterlings have been engaged. You can now pull boss and wait for Inhale")
    end
end

function core._1176:Nerzhul()
    if core.type == "UNIT_DIED" and core.destID == "76518" then
        ritualOfBonesCounter = ritualOfBonesCounter + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(5, function()
                if ritualOfBonesCounter >= 2 then
                    core:getAchievementSuccess()
                else
                    ritualOfBonesCounter = 0
                end
            end)
        end
    end
end

function core._1176:ClearVariables()
    ------------------------------------------------------
    ---- Bonemaw
    ------------------------------------------------------
    corpseSkitterlingUID = {}
    corpseSkitterlingCounter = 0
    corpseSkitterlingAnnounced = false

    ------------------------------------------------------
    ---- Ner'zhul
    ------------------------------------------------------
    ritualOfBonesCounter = 0
    timerStarted = false
end