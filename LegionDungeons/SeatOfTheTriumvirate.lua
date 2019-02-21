--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Seat of the Triumvirate Bosses
------------------------------------------------------
core._1753 = {}

------------------------------------------------------
---- L'ura
------------------------------------------------------
local crushingDarknessCounter = 0
local crushingDarknessUID = {}
local luraKilled = false

function core._1753:ZuraalTheAscended()
    if core.type == "UNIT_DIED" and core.destID == "126283" then
        core:getAchievementSuccess()
    end
end

function core._1753:Saprish()
    --Have Darkfang destroy 4 Sealed Void Caches using Shadow Pounce, then defeat Saprish in Seat of the Triumvirate on Mythic Difficulty.
    if core:getBlizzardTrackingStatus(12005) == true then
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
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].enabled == true then
        --Gained Crushing Darkness
        if core.type == "SPELL_AURA_APPLIED" and core.spellId == 250821 then
            if crushingDarknessUID[core.spawn_uid_dest_Player] == nil then
                crushingDarknessUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
                crushingDarknessCounter = crushingDarknessCounter + 1
                core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(250821) ..  " (" .. crushingDarknessCounter .. "/" .. core.groupSize .. ")")
            end
        end

        --Lost Crushing Darkness
        if core.type == "SPELL_AURA_REMOVED" and core.spellId == 250821 and luraKilled == false then
            if crushingDarknessUID[core.spawn_uid_dest_Player] ~= nil then
            crushingDarknessUID[core.spawn_uid_dest_Player] = nil
                crushingDarknessCounter = crushingDarknessCounter - 1
                core:sendMessage(core.destName .. " " .. L["Shared_HasLost"] .. " " .. GetSpellLink(250821) .. " (" .. crushingDarknessCounter .. "/" .. core.groupSize .. ")")
            end 
        end
    end
end

function core._1753:ClearVariables()
end