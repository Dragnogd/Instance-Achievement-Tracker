
--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

function IATDEBUG()
    core:sendDebugMessage("-----Starting IAT DEBUGUGGER----")
    --START Allowed Message functions to work
    core.achievementIDs[1] = 14148
    core.achievementsCompleted[1] = false
    core.IATInfoFrame:ToggleOn()
    core.IATInfoFrame:SetHeading(GetAchievementLink(14148))
    core.achievementsFailed[1] = false
    --END Allowed Message functions to work
end