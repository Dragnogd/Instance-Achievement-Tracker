--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle of Dazar'alor Bosses
------------------------------------------------------
core._2070 = {}

------------------------------------------------------
---- Conclave of the Chosen
------------------------------------------------------
local ravenousStalkersUID = {}
local initialRaptorsTime = nil

function core._2070:KingRastakhan()
    --Defeat King Rastakhan with the Phantom of Retribution, Phantom of Rage and Phantom of Slaughter still alive on Normal difficulty or higher.

    --Phantom of Retribution Died
    if core.type == "UNIT_DIED" and core.destID == "146491" then
        core:getAchievementFailed()
    end

    --Phantom of Rage
    if core.type == "UNIT_DIED" and core.destID == "146492" then
        core:getAchievementFailed()
    end

    --Phantom of Slaughter
    if core.type == "UNIT_DIED" and core.destID == "146493" then
        core:getAchievementFailed()
    end
end

function core._2070:ConclaveOfTheChosen()
    --Defeat the Conclave of the Chosen in the Battle of Dazar'alor without killing all the initial raptors summoned by Gonk's Wrath on Normal difficulty or higher.

    --When we detect first raptor has spawned. Collect UID of all raptors that spawned at same time as the initial raptor
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "144807" and core.spellId == 257650 and initialRaptorsTime == nil then
        --Set the initial time so we can collect other raptors which spawned at same time
        initialRaptorsTime = core.timestamp
        table.insert(ravenousStalkersUID, core.spawn_uid_dest)
    elseif core.type == "SPELL_AURA_APPLIED" and core.destID == "144807" and core.spellId == 257650 and initialRaptorsTime ~= nil then
        --If timestamp matches then add to table
        if core.timestamp == initialRaptorsTime then
            table.insert(ravenousStalkersUID, core.spawn_uid_dest)
        end
    end

    --If raptors dies as in table then fail achievement
    if core.type == "UNIT_DIED" and core.destID == "144807" and core:has_value(ravenousStalkersUID, core.spawn_uid_dest) then
        core:getAchievementFailed()
    end
end
