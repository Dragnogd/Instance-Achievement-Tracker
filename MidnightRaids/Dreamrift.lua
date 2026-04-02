--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Dreamrift
------------------------------------------------------
core._2939 = {}
core._2939.Events = CreateFrame("Frame")

function core._2939:Chimaerus()
    -- Defeat Chimaerus after plucking all Corrupted Feathers from Sergeant Quackers and rescuing him from the Aln in The Dreamrift on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(61454,1) == true then
        core:getAchievementSuccess()
    end
end