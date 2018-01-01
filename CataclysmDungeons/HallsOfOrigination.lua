--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Halls of Origination Bosses
------------------------------------------------------
core.HallsOfOrigination = {}

------------------------------------------------------
---- Temple Guardian Anhuur
------------------------------------------------------
local reverberatingHymnTimerStarted = false

------------------------------------------------------
---- Earthrager Ptah
------------------------------------------------------
local lastPlayerHit = nil
local playersHit = {}

function core.HallsOfOrigination:TempleGuardianAnhuur()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 75322 and reverberatingHymnTimerStarted == false then
        reverberatingHymnTimerStarted = true
        C_Timer.After(15, function()
            --If the timer has not been stopped than fail the achievement
            if reverberatingHymnTimerStarted == true then
                core:getAchievementFailed()
            end
        end)
    end

    if core.type == "SPELL_INTERRUPT" then
        if core.extraSpellId == 75322 then
            reverberatingHymnTimerStarted = false
        end
    end
end

function core.HallsOfOrigination:EarthragerPtah()
    if core.type == "SPELL_DAMAGE" and (core.spellId == 75339 or core.spellId == 75548) then
        lastPlayerHit = core.destName
        print(core.destName)
    end

    if core.type == "UNIT_DIED" and core.destID == "39443" then
        if playersHit[lastPlayerHit] == nil then
            --Players has not been hit already
            --Check if the player actually needs the achievement
            if core:has_value(core.Instances.Catacalysm.Dungeons.HallsOfOrigination.boss2.players, lastPlayerHit) then
                --Player needs achievement but has failed it
                core:sendMessage(lastPlayerHit .. " has failed " .. GetAchievementLink(core.currentAchievementID) .. " (Personal Achievement)")
            end
            playersHit[lastPlayerHit] = true
        end
    end
end

function core.HallsOfOrigination:ClearVariables()
    ------------------------------------------------------
    ---- Temple Guardian Anhuur
    ------------------------------------------------------
    reverberatingHymnTimerStarted = false

    ------------------------------------------------------
    ---- Earthrager Ptah
    ------------------------------------------------------
    lastPlayerHit = nil
    playersHit = {}
end