--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Trial of the Crusader Bosses
------------------------------------------------------
core.TrialOfTheCrusader = {}

------------------------------------------------------
---- The Northrend Beasts
------------------------------------------------------
local GormokTheImpalerKilled = false
local AcidmawKilled = false
local DreadscaleKilled = false
local UpperBackPainCompleted = false

function core.TrialOfTheCrusader:UpperBackPain()
    core:getAchievementToTrack()
    core:trackMob("34800", "Snobold Vassal", 4, nil, 1, "track", 1)

    --Gormok The Impaler Killed
    if core.type == "UNIT_DIED" and core.destID == "34796" then
        GormokTheImpalerKilled = false

        --Boss killed but achievement not complete
        if UpperBackPainCompleted == false then
            core:getAchievementFailed(1)
        end
    end

    --Achievement Complete
    if core.mobCounter == 4 then
        UpperBackPainCompleted = true
    end

    if core.mobCounter < 4 and UpperBackPainCompleted == true and GormokTheImpalerKilled == true then
        --Boss killed but adds killed afterwards
        core:getAchievementFailed(1)
    elseif core.mobCounter > 4 and UpperBackPainCompleted == true and GormokTheImpalerKilled == false then
        --Adds killed but boss is still alive
        core:sendMessage(core:getAchievement() .. " Snobold Died. Do not kill boss. Wait for another Snobold to spawn")
        core.achievementsCompleted[1] = false
    end
end

function core.TrialOfTheCrusader:NotOneButTwoJormungars()
    --Defeat Acidmaw and Dreadscale within 10 seconds of one another
end

function core.TrialOfTheCrusader:ClearVariables()

end