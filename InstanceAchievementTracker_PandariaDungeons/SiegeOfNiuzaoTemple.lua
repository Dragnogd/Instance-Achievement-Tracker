--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Siege of Niuzao-Temple Bosses
------------------------------------------------------
core._1011 = {}

------------------------------------------------------
---- General Pa'valak Bosses
------------------------------------------------------
local detonateCounter = 0

------------------------------------------------------
---- Wing Leader Ner'onok
------------------------------------------------------
local TenwusResolveCounter = 0
local TenwusPlayerTrack = {}

function core._1011:CommanderVojak()
    if core.type == "UNIT_DIED" and core.destID == "61699" then
        core:getAchievementSuccess()
    end
end

function core._1011:GeneralPaValak()
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.destID == "61485" and core.spellId == 119395 then
        detonateCounter = detonateCounter + 1
    end

    if detonateCounter >= 20 then
        core:getAchievementSuccess()
    end
end

function core._1011:WingLeaderNeronok()
    --Recieved Buff
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_REFRESH") and core.spellId == 125146 then
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, core.destName) then
            --Player needs achievement but has failed it
            TenwusResolveCounter = TenwusResolveCounter + 1
            core:sendMessage(core.destName .. " has recieved Tenwu's Resolve (" .. TenwusResolveCounter .. "/" .. #core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players .. ") (Personal Achievement)")
            TenwusPlayerTrack[core.destName] = true
        end
    end 
    
    --Lost Buff
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 125146 and TenwusPlayerTrack[core.destName] ~= nil then
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players, core.destName)  then
            --Player needs achievement but has failed it
            TenwusResolveCounter = TenwusResolveCounter - 1
            core:sendMessage(core.destName .. " has LOST Tenwu's Resolve. DO NOT KILL BOSS! (" .. TenwusResolveCounter .. "/" .. #core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players .. ") (Personal Achievement)")
            core.achievementCompleted = false
            TenwusPlayerTrack[core.destName] = false
        end   
    end

    --Everyone who needs achievement has got it
    if TenwusResolveCounter == #core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].players then
        core:getAchievementSuccess()
    end
end

function core._1011:ClearVariables()
    ------------------------------------------------------
    ---- General Pa'valak Bosses
    ------------------------------------------------------
    detonateCounter = 0

    ------------------------------------------------------
    ---- Wing Leader Ner'onok
    ------------------------------------------------------
    TenwusResolveCounter = 0
    TenwusPlayerTrack = {}
end

