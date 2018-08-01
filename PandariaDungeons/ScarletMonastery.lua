--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Scarlet Monastery Bosses
------------------------------------------------------
core._1004 = {}

------------------------------------------------------
---- Thalnos the Soulrender
------------------------------------------------------
local empoweredZombieCounter = 0
local empoweredZombieTable = {}

------------------------------------------------------
---- High Inquisitor Whitemane
------------------------------------------------------
local scarletJudicatorCounter = 0

function core._1004:ThalnosTheSoulrender()
    if core.type == "SPELL_SUMMON" and core.destID == "59930" and empoweredZombieTable[core.spawn_uid_dest] == nil then
        empoweredZombieCounter = empoweredZombieCounter + 1
        empoweredZombieTable[core.spawn_uid_dest] = core.spawn_uid_dest

        if empoweredZombieCounter < 3 then
            core:sendMessage("Empowered Zombie Counter (" .. empoweredZombieCounter .. "/3)")
        end
    end

    if core.type == "UNIT_DIED" and core.destID == "59930" then
        empoweredZombieCounter = empoweredZombieCounter - 1
        empoweredZombieTable[core.spawn_uid_dest] = nil

        if empoweredZombieCounter < 3 then
            core:sendMessage("Empowered Zombie Counter (" .. empoweredZombieCounter .. "/3)")
        end

        if core.achievementCompleted == true and empoweredZombieCounter < 3 then
            core:sendMessage("Empowered Zombie has died. DO NOT KILL BOSS (" .. empoweredZombieCounter .. "/3)")
            core.achievementCompleted = false
        end
    end

    if empoweredZombieCounter == 3 then
        core:getAchievementSuccess()
    end
end

function core._1004:HighInquisitorWhitemane()
    if core.type == "UNIT_DIED" and core.destID == "58605" then
        scarletJudicatorCounter = scarletJudicatorCounter + 1
        if scarletJudicatorCounter <= 13 then
            core:sendMessage("Scarlet Judicator Counter (" .. scarletJudicatorCounter .. "/13)")
        end
    end

    if scarletJudicatorCounter == 13 then
        core:getAchievementSuccess()
    end
end

function core._1004:ClearVariables()
    ------------------------------------------------------
    ---- Thalnos the Soulrender
    ------------------------------------------------------
    empoweredZombieCounter = 0

    ------------------------------------------------------
    ---- High Inquisitor Whitemane
    ------------------------------------------------------
    scarletJudicatorCounter = 0
end