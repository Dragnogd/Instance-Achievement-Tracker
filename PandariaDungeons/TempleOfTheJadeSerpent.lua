--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Temple of the Jade Serpent Bosses
------------------------------------------------------
core.TempleOfTheJadeSerpent = {}

------------------------------------------------------
---- Wise Mari
------------------------------------------------------
local playersHit = {}

------------------------------------------------------
---- Sha of Doubt
------------------------------------------------------
local ShaOfDoubtCounter = 0

function core.TempleOfTheJadeSerpent:WiseMari()
    if core.spellId == 115167 then
        --If someone gets hit by the ability, check if they need the achievement or not
        
        if playersHit[core.destName] == nil then
            --Players has not been hit already
            --Check if the player actually needs the achievement
            if core:has_value(core.Instances.MistsOfPandaria.Dungeons.TempleOfTheJadeSerpent.boss1.players, core.destName) then
                --Player needs achievement but has failed it
                core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.achievementIDs[1]) .. " (Personal Achievement)")
            end
            playersHit[core.destName] = true
        end
    end
end

function core.TempleOfTheJadeSerpent:ShaOfDoubt()
    local name, realm = UnitName("Player")
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 123916 and core.destName == name then
        local _, _, _, count = UnitDebuff("Player", GetSpellInfo(123916))
        ShaOfDoubtCounter = count
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " Sha of Doubt Counter (" .. ShaOfDoubtCounter .. "/4)")
    end

    if ShaOfDoubtCounter == 4 then
        core:getAchievementSuccess()
    end
end

function core.TempleOfTheJadeSerpent:ShaOfDoubt2()
    if UnitAura("Player", GetSpellInfo(118714)) == false then
        core:getAchievementFailed()
    end
end

function core.TempleOfTheJadeSerpent:ClearVariables()
    ------------------------------------------------------
    ---- Wise Mari
    ------------------------------------------------------
    playersHit = {}
end