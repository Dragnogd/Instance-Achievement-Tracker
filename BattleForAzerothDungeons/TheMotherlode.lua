--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Motherlode Bosses
------------------------------------------------------
core.TheMotherlode = {}

------------------------------------------------------
---- Mogul Razdunk
------------------------------------------------------
local playersHit = {}

function core.TheMotherlode:CoinOperatedCrowdPummeler()
    if core.type == "UNIT_DIED" and core.destID == "142625" then
        core:getAchievementSuccess()
    end
end

function core.TheMotherlode:MogulRazdunk()
    --Defeat Mogul Razdunk without being struck by Gatling Gun, Micro Missiles, Big Red Rocket, or a direct hit from Drill Smash in The MOTHERLODE!! on Mythic difficulty.
    --Gatling Gun 260279
    --Micro Missiles 276234
    --Big Red Rocket 270277
    --Drill Smash 260202
    if core.spellId == 260279 or core.spellId == 276234 or core.spellId == 270277 or core.spellId == 260202 then
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

function core.TheMotherlode:ClearVariables()
    playersHit = {}
end