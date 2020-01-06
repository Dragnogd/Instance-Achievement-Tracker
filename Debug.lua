
--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

function IATDEBUG()
    core:sendDebugMessage("-----Starting IAT DEBUGUGGER----")

    --Setup Test Variables
    -- core.achievementIDs[1] = 14024

    --Dark Collapse
    -- core.type = "SPELL_DAMAGE"
    -- core.spellId = 306876
    -- core._2217:DarkInquisitorXanesh()

    --Void Awaken Gained
    core.type = "SPELL_AURA_APPLIED"
    core.spellId = 312406
    core.destName = "Whizzey"
    core._2217:DarkInquisitorXanesh()

    --Void Awaken Lost
    core.type = "SPELL_AURA_REMOVED"
    core.spellId = 312406
    core.destName = "Whizzey"
    core._2217:DarkInquisitorXanesh()

    core:sendDebugMessage("-----FINISHED IAT DEBUGUGGER----")
end