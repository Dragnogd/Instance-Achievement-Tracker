--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Temple of the Jade Serpent Bosses
------------------------------------------------------
core._960 = {}

------------------------------------------------------
---- Wise Mari
------------------------------------------------------
local playersHit = {}

------------------------------------------------------
---- Sha of Doubt
------------------------------------------------------
local ShaOfDoubtCounter = 0

function core._960:WiseMari()
    if core.spellId == 115167 then
        --If someone gets hit by the ability, check if they need the achievement or not
        
        if playersHit[core.destName] == nil then
            --Players has not been hit already
            --Check if the player actually needs the achievement
            if core:has_value(core.currentBosses[1].players, core.destName) then
                --Player needs achievement but has failed it
                core:sendMessage(core.destName .. " has failed " .. GetAchievementLink(core.achievementIDs[1]) .. " (Personal Achievement)")
            end
            playersHit[core.destName] = true
        end
    end
end

function core._960:ShaOfDoubt()
    local name, realm = UnitName("Player")
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 123916 and core.destName == name then
        for i=1,40 do
            local _, _, count, _, _, _, _, _, _, spellId = UnitDebuff("Player", i)
            if spellId == 123916 then
                ShaOfDoubtCounter = count
                core:sendMessage(GetAchievementLink(core.achievementIDs[2]) .. " Sha of Doubt Counter (" .. ShaOfDoubtCounter .. "/4)")
            end
        end
    end

    if ShaOfDoubtCounter == 4 then
        core:getAchievementSuccess()
    end
end

function core._960:ShaOfDoubt2()
    for i=1,40 do
        local _, _, _, _, _, _, _, _, _, spellId = UnitAura("Player", i)
        if spellId == 118714 then
            core:getAchievementFailed(2)
        end
    end
end

function core._960:ClearVariables()
    ------------------------------------------------------
    ---- Wise Mari
    ------------------------------------------------------
    playersHit = {}
end