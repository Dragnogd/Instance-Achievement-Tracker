--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Iron Docks Bosses
------------------------------------------------------
core.IronDocks = {}

------------------------------------------------------
---- Fleshrender Nok'gar
------------------------------------------------------
local SiegemasterOlugarFound = false
local PitwardenGwarnokFound = false
local ChampionDrunaFound = false


function core.IronDocks:FleshrenderNokgar()
    --Siegemaster Olugar
    if (core.sourceID == "83026" or core.destID == "83026") and SiegemasterOlugarFound == false then
        print("Siegemaster Olugar Found")
        SiegemasterOlugarFound = true
    end

    --Pitwarden Gwarnok
    if (core.sourceID == "84520" or core.destID == "84520") and PitwardenGwarnokFound == false then
        print("Pitwarden Gwarnok Found")
        PitwardenGwarnokFound = true
    end

    --Champion Druna
    if (core.sourceID == "81603" or core.destID == "81603") and ChampionDrunaFound == false then
        print("Champion Druna Found")
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
        print("Unit Died")
        core:getAchievementFailedWithMessageAfter("(Reason: " .. reason .. " has died)")
    end

    if (core.sourceID == "81305" or core.destID == "81305") and SiegemasterOlugarFound == true and PitwardenGwarnokFound == true and ChampionDrunaFound == true then
        core:getAchievementSuccess()
    end
end

function core.IronDocks:Skulloc()
    if core.type == "SPELL_DAMAGE" and core.spellId == 168390 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " got hit by Cannon Barrage)")
    elseif core.type == "SPELL_DAMAGE" and core.spellId == 169129 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. " got hit by Backdraft)")
    end
end

function core.IronDocks:ClearVariables()
    ------------------------------------------------------
    ---- Fleshrender Nok'gar
    ------------------------------------------------------
    SiegemasterOlugarFound = false
    PitwardenGwarnokFound = false
    ChampionDrunaFound = false
end