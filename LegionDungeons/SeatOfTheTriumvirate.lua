--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Seat of the Triumvirate Bosses
------------------------------------------------------
core._1753 = {}

------------------------------------------------------
---- L'ura
------------------------------------------------------
local crushingDarknessCounter = 0
local luraKilled = false

function core._1753:ZuraalTheAscended()
    if core.type == "UNIT_DIED" and core.destID == "126283" then
        core:getAchievementSuccess()
    end
end

function core._1753:Lura()
    if core.type == "UNIT_DIED" and core.destID == "124729" then
        luraKilled = true
    end

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 250821 and luraKilled == false then
        core:getAchievmentFailed()
    end
end

function core._1753:TrackAdditional()
    --Gained Crushing Darkness
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 250821 then
        crushingDarknessCounter = crushingDarknessCounter + 1
        core:sendMessage(core.destName .. " Has gained Crushing Darkness (" .. crushingDarknessCounter .. "/" .. core.groupSize .. ")")
    end

    --Lost Crushing Darkness
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 250821 and luraKilled == false then
        crushingDarknessCounter = crushingDarknessCounter - 1
        core:sendMessage(core.destName .. " Has lost Crushing Darkness ( " .. crushingDarknessCounter .. "/" .. core.groupSize .. ")")
    end
end

function core._1753:ClearVariables()
end