--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Upper Blackrock Spire Bosses
------------------------------------------------------
core._1358 = {}

------------------------------------------------------
---- Orebender Gor'ashan
------------------------------------------------------
local thunderCacophonyCounter = 0

------------------------------------------------------
---- Ragewing the Untamed
------------------------------------------------------
local ragewingWhelpUID = {}
local ragewingWhelpCounter = 0
local whelpsCounterAnnounced = false
local timerStarted = false
local whelpsKilled = 0

------------------------------------------------------
---- Warlord Zaela
------------------------------------------------------
local emberscaleIronflightCounter = 0 

function core._1358:OrebenderGorashan()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 166168 then
        thunderCacophonyCounter = 0
    end
    
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 154899 then
        thunderCacophonyCounter = thunderCacophonyCounter + 1
    end

    if thunderCacophonyCounter == 4 then
        core:getAchievementFailed()
    end
end

function core._1358:RagewingTheUntamed()
    if core.sourceID == "76801" then
        if ragewingWhelpUID[core.spawn_uid] == nil then
            ragewingWhelpUID[core.spawn_uid] = core.spawn_uid
            ragewingWhelpCounter = ragewingWhelpCounter + 1
        end
    end

    if core.destID == "76801" then
        if ragewingWhelpUID[core.spawn_uid_dest] == nil then
            ragewingWhelpUID[core.spawn_uid_dest] = core.spawn_uid_dest
            ragewingWhelpCounter = ragewingWhelpCounter + 1
        end
    end

    if core.type == "UNIT_DIED" and core.destID == "76801" and ragewingWhelpUID[core.spawn_uid_dest] ~= nil then
        ragewingWhelpUID[core.spawn_uid_dest] = nil
        ragewingWhelpCounter = ragewingWhelpCounter - 1
        whelpsKilled = whelpsKilled + 1
        if timerStarted == false then
            timerStarted = true
            C_Timer.After(10, function() 
                if whelpsKilled >= 20 then
                    core:getAchievementSuccess()
                else
                    core:getAchievementFailedWithMessageAfter("(" .. whelpsKilled .. "/20 Whelps killed in time)")
                end
            end)
        end
    end

    if ragewingWhelpCounter >= 20 and whelpsCounterAnnounced == false then
        whelpsCounterAnnounced = true
        core:sendMessage(ragewingWhelpCounter .. " whelps alive. They can now be killed")
    end
end

function core._1358:WarlordZaela()
    if core.type == "UNIT_DIED" and core.destID == "82428" and emberscaleIronflightCounter < 5 then
        emberscaleIronflightCounter = emberscaleIronflightCounter + 1
        core:sendMessage("Emberscale IronFlight Killed (" .. emberscaleIronflightCounter .. "/5)")
    end

    if emberscaleIronflightCounter == 5 then
        core:getAchievementSuccess()
    end
end

function core._1358:ClearVariables()
    ------------------------------------------------------
    ---- Orebender Gor'ashan
    ------------------------------------------------------
    thunderCacophonyCounter = 0

    ------------------------------------------------------
    ---- Ragewing the Untamed
    ------------------------------------------------------
    ragewingWhelpUID = {}
    ragewingWhelpCounter = 0
    whelpsCounterAnnounced = false
    timerStarted = false
    whelpsKilled = 0
end