
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

    core._2217:DarkInquisitorXanesh()

    core.type = "SPELL_AURA_APPLIED"
    core.spellId = 312406
    core.destName = "Whizzey"

    core._2217:DarkInquisitorXanesh()
    core._2217:DarkInquisitorXanesh()
    core._2217:DarkInquisitorXanesh()

    C_Timer.After(3, function() 
        core.type = "SPELL_AURA_REMOVED"
        core._2217:DarkInquisitorXanesh()
        core._2217:DarkInquisitorXanesh()
        core._2217:DarkInquisitorXanesh()
    end)

    core:sendDebugMessage("-----FINISHED IAT DEBUGUGGER----")
end