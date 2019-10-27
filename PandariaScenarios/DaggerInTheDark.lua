--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Dagger in the Dark
------------------------------------------------------
core._1095 = {}
core._1095.Events = CreateFrame("Frame")

------------------------------------------------------
---- Darkhatched Lizard-Lord
------------------------------------------------------
local addsKilled = 0

function core._1095:DarkhatchedLizardLord()
    --Kill 3 of the Darkhatched Lizard-Lord's reinforcements using his Water Jets ability in the Dagger in the Dark Scenario.

    if core.type == "SPELL_DAMAGE" and core.spellId == 133121 and core.overkill > 0 then   
        addsKilled = addsKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. L["Shared_AddsKilled"] .. " (" .. addsKilled .. "/3)")
    end

    if addsKilled >= 3 then
        core:getAchievementSuccess()
    end
end

function core._1095:ClearVariables()
    ------------------------------------------------------
    ---- Darkhatched Lizard-Lord
    ------------------------------------------------------
    addsKilled = 0
end

function core._1095:InstanceCleanup()
    core._1095.Events:UnregisterEvent("UNIT_AURA")
end

function core._1095:InitialSetup()
    core._1095.Events:RegisterEvent("UNIT_AURA")
end

core._1095.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1095.Events:UNIT_AURA(self, unitID, ...)
    if next(core.currentBosses) ~= nil then
        if core.currentBosses[1].achievement == 7986 then
            for i=1,40 do
                local spellName, _, _, _, _, _, _, _, _, spellId = UnitBuff(unitID, i)
                if spellId == 133004 then
                    core:getAchievementFailedWithMessageAfter("(" .. UnitName(unitID) .. ")")
                end
            end  
        end
    end
end