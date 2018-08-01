--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Iron Docks Bosses
------------------------------------------------------
core._1195 = {}

------------------------------------------------------
---- Fleshrender Nok'gar
------------------------------------------------------
local SiegemasterOlugarFound = false
local PitwardenGwarnokFound = false
local ChampionDrunaFound = false
local fleshrenderKilled = false


function core._1195:FleshrenderNokgar()
    --If Fleshrender Nok'gar has died then stop tracking
    if core.type == "UNIT_DIED" and core.destID == "81305" then
        fleshrenderKilled = true
    end

    if fleshrenderKilled == false then
        --Siegemaster Olugar
        if (core.sourceID == "83026" or core.destID == "83026") and SiegemasterOlugarFound == false then
            SiegemasterOlugarFound = true
        end

        --Pitwarden Gwarnok
        if (core.sourceID == "84520" or core.destID == "84520") and PitwardenGwarnokFound == false then
            PitwardenGwarnokFound = true
        end

        --Champion Druna
        if (core.sourceID == "81603" or core.destID == "81603") and ChampionDrunaFound == false then
            ChampionDrunaFound = true
        end

        if core.type == "UNIT_DIED" and (core.destID == "83026" or core.destID == "84520" or core.destID == "81603") then
            local reason = nil
            if core.destID == "83026" then
                reason = "Siegemaster Olugar"
            elseif core.destID == "84520" then
                reason = "Pitwarden Gwarnok"
            elseif core.destID == "81603" then
                reason = "Champion Druna"
            end
            core:getAchievementFailedWithMessageAfter("(Reason: " .. reason .. " has died)")
        end

        if (core.sourceID == "81305" or core.destID == "81305") and SiegemasterOlugarFound == true and PitwardenGwarnokFound == true and ChampionDrunaFound == true then
            core:getAchievementSuccess()
        end
    end
end

function core._1195:Skulloc()
    if core.type == "SPELL_DAMAGE" and core.spellId == 168390 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " got hit by Cannon Barrage)")
    elseif core.type == "SPELL_DAMAGE" and core.spellId == 169129 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " got hit by Backdraft)")
    end
end

function core._1195:ClearVariables()
    ------------------------------------------------------
    ---- Fleshrender Nok'gar
    ------------------------------------------------------
    SiegemasterOlugarFound = false
    PitwardenGwarnokFound = false
    ChampionDrunaFound = false
end