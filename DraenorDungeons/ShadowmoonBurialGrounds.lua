--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Shadowmoon Burial Grounds Bosses
------------------------------------------------------
core.ShadowmoonBurialGrounds = {}

------------------------------------------------------
---- Bonemaw
------------------------------------------------------
local corpseSkitterlingUID = {}
local corpseSkitterlingCounter = 0
local corpseSkitterlingCounter2 = 0
local corpseSkitterlingAnnounced = false
local inhaledFinished = false

function core.ShadowmoonBurialGrounds:Bonemaw()
    --Corpse Skitterlings Alive
    if (core.type == "SWING_DAMAGE" or core.type == "SWING_MISSED") and core.sourceID == "77006" then
        --print(core.sourceName)
        if inhaledFinished == true then
            corpseSkitterlingUID = {}
            corpseSkitterlingCounter2 = corpseSkitterlingCounter
            corpseSkitterlingCounter = 0
        end

        if corpseSkitterlingUID[core.spawn_uid] == nil then
            corpseSkitterlingUID[core.spawn_uid] = core.spawn_uid
            corpseSkitterlingCounter = corpseSkitterlingCounter + 1
            print(corpseSkitterlingCounter)
        end
    end

    --Corpse Skitterlings Dead
    if core.type == "UNIT_DIED" and core.destID == "77006" then
        corpseSkitterlingUID[core.spawn_uid] = false
        corpseSkitterlingCounter = corpseSkitterlingCounter - 1
        print(corpseSkitterlingCounter)
    end

    --Corpse Skitterlings Sucked up by boss
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 153804 then
        inhaledFinished = true
        C_Timer.After(5, function()
            core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " " .. corpseSkitterlingCounter - corpseSkitterlingCounter2 .. " /25 Corpse Skitterlings inhaled by the boss")
            if corpseSkitterlingCounter - corpseSkitterlingCounter2 >= 25 then
                core:getAchievementSuccess()
            else
                core:getAchievementFailed()
            end
        end)
    end

    --25 Corpse Skitterlings collected before boss
    if corpseSkitterlingCounter > 25 and corpseSkitterlingAnnounced == false then
        corpseSkitterlingAnnounced = true
        core:sendMessage(GetAchievementLink(core.currentAchievementID) .. " 25 Corpse Skitterlings have been engaged. You can now pull boss and wait for Inhale")
    end
end

function core.ShadowmoonBurialGrounds:ClearVariables()
    ------------------------------------------------------
    ---- Bonemaw
    ------------------------------------------------------
    corpseSkitterlingUID = {}
    corpseSkitterlingCounter = 0
    corpseSkitterlingCounter2 = 0
    corpseSkitterlingAnnounced = false
    inhaledFinished = false
end