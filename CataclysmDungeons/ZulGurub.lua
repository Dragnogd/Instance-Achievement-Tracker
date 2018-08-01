--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Zul'Gurub Bosses
------------------------------------------------------
core._859 = {}

------------------------------------------------------
---- High Priestess Kilnara
------------------------------------------------------
local templeRatsCounter = 0

------------------------------------------------------
---- Jin'do
------------------------------------------------------
local twistedSoulsUID = {}
local twistedSoulsCounter = 0
local twistedSoulsAnnounced = false
local timerStarted = false
local twistedSoulsKilled = 0

function core._859:HighPriestVenoxis()
    if core.type == "SPELL_DAMAGE" and (core.spellId == 96638 or core.spellId == 96521 or core.spellId == 96685) then
        local reason = nil
        if core.spellId == 96638 then
            reason = "Bloodvenom"
        elseif core.spellId == 96521 then
            reason = "Pool of Acrid Tears"
        elseif core.spellId == 96685 then
            reason = "Venomous Effusion"
        end
        core:getAchievementFailedPersonalWithReason("Hit by " .. reason)
    end
end

function core._859:BloodlordMandokir()
    if core.type == "UNIT_DIED" and core.destID == "52157" then
        core:getAchievementFailed()
    end
end

function core._859:HighPriestessKilnara()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 98239 and templeRatsCounter < 4 then
        templeRatsCounter = templeRatsCounter + 1
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " Temple Rats Counter: (" .. templeRatsCounter .. "/4)")
    end

    if templeRatsCounter == 4 then
        core:getAchievementSuccess()
    end
end

function core._859:Jindo()
    if core.destID == "52624" and core.achievementsCompleted[1] == false and timerStarted == false then
        if twistedSoulsUID[core.spawn_uid_dest] == nil then
            twistedSoulsUID[core.spawn_uid_dest] = core.spawn_uid_dest
            twistedSoulsCounter = twistedSoulsCounter + 1
            core:sendMessageDelay(GetAchievementLink(core.achievementIDs[1]) .. " Twisted Spirits Counter: (" .. twistedSoulsCounter .. "/20)",twistedSoulsCounter,5)
        end
    end

    if core.sourceID == "52624" and core.achievementsCompleted[1] == false and timerStarted == false then
        if twistedSoulsUID[core.spawn_uid] == nil then
            twistedSoulsUID[core.spawn_uid] = core.spawn_uid
            twistedSoulsCounter = twistedSoulsCounter + 1
            core:sendMessageDelay(GetAchievementLink(core.achievementIDs[1]) .. " Twisted Spirits Counter: (" .. twistedSoulsCounter .. "/20)",twistedSoulsCounter,5)
        end
    end

    if twistedSoulsCounter >= 20 and twistedSoulsAnnounced == false then
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " requirements met. Kill the Twisted Spirits within 15 seconds of one another")
        twistedSoulsAnnounced = true
    end

    if core.type == "UNIT_DIED" and core.destID == "52624" then
        twistedSoulsCounter = twistedSoulsCounter - 1
        twistedSoulsUID[core.spawn_uid_dest] = nil
        if twistedSoulsAnnounced == true and core.destFlags == 0xa48 then
            twistedSoulsKilled = twistedSoulsKilled + 1
            if timerStarted == false then
                timerStarted = true
                core:sendMessage("Timer Started! 15 seconds remaining")
                C_Timer.After(15, function()
                    if twistedSoulsKilled >= 20 then
                        core:getAchievementSuccess()
                    else
                        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " (" .. twistedSoulsKilled .. "/20) Twisted Spirits Killed in time")
                        twistedSoulsKilled = 0
                        timerStarted = false
                        twistedSoulsAnnounced = false
                    end
                end)
            end
        end
    end
end

function core._859:ClearVariables()
    ------------------------------------------------------
    ---- High Priestess Kilnara
    ------------------------------------------------------
    templeRatsCounter = 0
   
    ------------------------------------------------------
    ---- Jin'do
    ------------------------------------------------------
    twistedSoulsUID = {}
    twistedSoulsCounter = 0
    twistedSoulsAnnounced = false
    timerStarted = false
    twistedSoulsKilled = 0
end