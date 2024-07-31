--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- _631 Citadel Bosses
------------------------------------------------------
core._631 = {}
core._631.Events = CreateFrame("Frame")

------------------------------------------------------
---- Lady Deathwhisper
------------------------------------------------------
local CultFanaticFound = false
local CultAdherentFound = false
local DeformedFanaticFound = false
local ReanimatedFanaticFound = false
local ReanimatedAdherentFound = false
local CultFanaticWait = false --When the mobs get transformed, wait 1 second before checking if it's actually dead
local CultAdherentWait = false --When the mobs get transformed, wait 1 second before checking if it's actually dead
local AddCounter = 0

------------------------------------------------------
---- _631 Gunship Battle
------------------------------------------------------
local currentTimestamp = nil

------------------------------------------------------
---- Deathbringer Saurfang
------------------------------------------------------
local markOfTheFallenChampionCounter = 0

------------------------------------------------------
---- Valithria Dreamwalker
------------------------------------------------------
AchievementTracker_portalsSpawned = false
local portalsEntered = 0
local noteDisplayed = false
local noteTwoDisplay = false
local totalPortals = 0
local players = {}

------------------------------------------------------
---- Sindragosa
------------------------------------------------------
local mysticBuffetStack = 0

------------------------------------------------------
---- Festergut
------------------------------------------------------
local InoculatedStack = 0

------------------------------------------------------
---- BloodQueenLanathel
------------------------------------------------------
local vampires = {}
local nonVampires = {}
local otherPlayers = {}
local playersCompleted = {}

------------------------------------------------------
---- Lich King
------------------------------------------------------
local necroticPlagueStack = 0
local necroticPlagueCompletedAnnounced = false

function core._631:LordMarrowgar()
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 69065 then
        core:sendMessage(core.destName .. " has been Impaled")
        C_Timer.After(8, function()
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(core.destName, i)
                if auraData ~= nil and auraData.spellId == 69065 then
                    core:getAchievementFailed()
                end
            end
        end)
    end
end

function core._631:LadyDeathwhisper()
    local CultFanatic = {"Cult Fanatic", "Fanático del Culto"}
    local CultAdherent = {"Cult Adherent", "Partidario del Culto"}
    local DeformedFanatic = {"Deformed Fanatic", "Fanático deformado"}
    local ReanimatedFanatic = {"Reanimated Fanatic", "Fanático reanimado"}
    local ReanimatedAdherent = {"Reanimated Adherent", "Partidario reanimado"}
    local currentAddSource = nil
    local currentAddDest = nil
    local languages = 2

    for langCount = 1, languages do
        --When a mob has spawned
        if core.sourceName ~= nil then
            if string.find(core.sourceName, CultFanatic[langCount]) then
                currentAddSource = "Cult Fanatic"
            elseif string.find(core.sourceName, CultAdherent[langCount]) then
                currentAddSource = "Cult Adherent"
            elseif string.find(core.sourceName, DeformedFanatic[langCount]) then
                currentAddSource = "Deformed Fanatic"
            elseif string.find(core.sourceName, ReanimatedFanatic[langCount]) then
                currentAddSource = "Reanimated Fanatic"
            elseif string.find(core.sourceName, ReanimatedAdherent[langCount]) then
                currentAddSource = "Reanimated Adherent"
            end
        end
        --When a mob has died
        if core.destName ~= nil then
            if string.find(core.destName, CultFanatic[langCount]) then
                currentAddDest = "Cult Fanatic"
            elseif string.find(core.destName, CultAdherent[langCount]) then
                currentAddDest = "Cult Adherent"
            elseif string.find(core.destName, DeformedFanatic[langCount]) then
                currentAddDest = "Deformed Fanatic"
            elseif string.find(core.destName, ReanimatedFanatic[langCount]) then
                currentAddDest = "Reanimated Fanatic"
            elseif string.find(core.destName, ReanimatedAdherent[langCount]) then
                currentAddDest = "Reanimated Adherent"
            end
        end
    end

    if core.type == "SPELL_DAMAGE" or core.type == "SPELL_CAST_SUCCESS" or core.type == "SWING_MISSED" or core.type == "SPELL_AURA_APPLIED" or core.type == "SWING_DAMAGE" or core.type == "SPELL_PERIODIC_HEAL" or core.type == "SPELL_CAST_START" then
        if currentAddSource == "Cult Fanatic" and CultFanaticFound == false then
            CultFanaticFound = true
            AddCounter = AddCounter + 1
            if CultFanaticWait == false then
                core:sendMessage("Cult Fanatic found (" .. AddCounter .. "/5)")
            end
        elseif currentAddSource == "Cult Adherent" and CultAdherentFound == false then
            CultAdherentFound = true
            AddCounter = AddCounter + 1
            if CultAdherentWait == false then
                core:sendMessage("Cult Adherent found (" .. AddCounter .. "/5)")
            end
        elseif currentAddSource == "Deformed Fanatic" and DeformedFanaticFound == false then
            DeformedFanaticFound = true
            AddCounter = AddCounter + 1
            core:sendMessage("Deformed Fanatic found (" .. AddCounter .. "/5)")
        elseif currentAddSource == "Reanimated Fanatic" and ReanimatedFanaticFound == false then
            ReanimatedFanaticFound = true
            AddCounter = AddCounter + 1
            core:sendMessage("Reanimated Fanatic found (" .. AddCounter .. "/5)")
        elseif currentAddSource == "Reanimated Adherent" and ReanimatedAdherentFound == false then
            ReanimatedAdherentFound = true
            AddCounter = AddCounter + 1
            core:sendMessage("Reanimated Adherent found (" .. AddCounter .. "/5)")
        end
    end

    --Check if the reanimated mobs were killed with overkill damage
    if core.type == "SPELL_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SWING_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" then
        if currentAddDest == "Reanimated Fanatic" or currentAddDest == "Reanimated Adherent" then
            if core.overkill ~= nil then
                if core.overkill > 0 then
                    if currentAddDest == "Reanimated Adherent" then
                        ReanimatedAdherentFound = false
                        AddCounter = AddCounter - 1
                        core:sendMessage("Reanimated Adherent has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    elseif currentAddDest == "Reanimated Fanatic" then
                        ReanimatedFanaticFound = false
                        AddCounter = AddCounter - 1
                        core:sendMessage("[WIP] Reanimated Fanatic has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    end
                end
            end
        end
     end

    if core.type == "UNIT_DIED" then
        if currentAddDest == "Cult Fanatic" and CultFanaticFound == true then
            CultFanaticWait = true
            CultFanaticFound = false
            AddCounter = AddCounter - 1
            C_Timer.After(2, function()
                if CultFanaticFound == false then
                    core:sendMessage("Cult Fanatic has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    CultFanaticWait = false
                end
            end)
        elseif currentAddDest == "Cult Adherent" and CultAdherentFound == true then
            CultAdherentWait = true
            CultAdherentFound = false
            AddCounter = AddCounter - 1
            C_Timer.After(2, function()
                if CultAdherentFound == false then
                    core:sendMessage("Cult Adherent has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    CultAdherentWait = false
                end
            end)
        elseif currentAddDest == "Deformed Fanatic" and DeformedFanaticFound == true then
            DeformedFanaticFound = false
            AddCounter = AddCounter - 1
            core:sendMessage("Deformed Fanatic has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
        end
    end

    if AddCounter == 5 then
        core:getAchievementSuccess()
    end
end

function core._631:DeathbringerSaurfang()
    --Detect if mark of the fallen champion has been cast
    if core.type == "SPELL_CAST_START" and core.spellId == 72293 and markOfTheFallenChampionCounter ~= 5 then
            markOfTheFallenChampionCounter = markOfTheFallenChampionCounter + 1
    end

    --if counter reaches 5 then the achievement has failed
    if markOfTheFallenChampionCounter == 5 then
        core:getAchievementFailed()
    end
end

function core._631:Sindragosa()
    if core.type == "SPELL_AURA_APPLIED_DOSE" or core.type == "SPELL_AURA_APPLIED" then
        if core.spellId == 70127 and core.unitType ~= "Pet" then
            if core.amount == nil then
                core.amount = 1
            end
            core:sendMessage(core.destName .. " has " .. core.amount .. " stacks of Mystic Buffet")

            --Get the highest stack of Mystic Buffet and save to variable
            if core.amount > mysticBuffetStack and mysticBuffetStack < 6 then
                mysticBuffetStack = core.amount
            end

            if mysticBuffetStack > 5 then
                core:getAchievementFailed()
                core.achievementFailed = true
            end
        end
    end
end

function core._631:Festergut()
    if core.type == "SPELL_AURA_APPLIED_DOSE" or core.type == "SPELL_AURA_APPLIED" then
        if core.spellId == 69291 and core.unitType ~= "Pet" then
            if core.amount == nil then
                core.amount = 1
            end

            --Get the highest stack of Mystic Buffet and save to variable
            if core.amount > InoculatedStack and InoculatedStack < 3 then
                InoculatedStack = core.amount
                core:sendMessage(core.destName .. " has " .. core.amount .. " stacks of Inoculated")
            end

            if InoculatedStack > 2 then
                core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
            end
        end
    end
end

function core._631:Rotface()
    if core.type == "SPELL_CAST_START" and core.spellId == 69839 then
        core:getAchievementFailed()
    end
end

function core._631:ProfessorPutricide()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 70539 then
        core:getAchievementFailed()
    end
end

function core._631:InstanceCleanup()
    core._631.Events:UnregisterEvent("UNIT_AURA")
end

core._631.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._631:InitialSetup()
    core._631.Events:RegisterEvent("UNIT_AURA")
end

function core._631.Events:UNIT_AURA(self, unitID)
	if next(core.currentBosses) ~= nil then
		if core.currentBosses[1].encounterID == 1106 and necroticPlagueCompletedAnnounced == false then
			local foundNecroticPlague = false
			for i=1,40 do
				local auraData = C_UnitAuras.GetDebuffDataByIndex(unitID, i)
				if (auraData ~= nil and auraData.spellId == 70337) or (auraData ~= nil and auraData.spellId == 70338) then
					foundNecroticPlague = true
					if auraData.applications > necroticPlagueStack and necroticPlagueCompletedAnnounced == false then
                        necroticPlagueStack = auraData.applications
                        if core.gameVersionMajor > 4 then
                            core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(70337) .. " " .. L["Core_Counter"] .. " (" .. necroticPlagueStack .. "/30)",true)
                        else
                            core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(70337) .. " " .. L["Core_Counter"] .. " (" .. necroticPlagueStack .. "/30)",true)
                        end
					end
				end
			end

            if necroticPlagueStack >= 30 and necroticPlagueCompletedAnnounced == false then
                if core.difficultyID == 3 then
                    core:getAchievementSuccess(4601)
                elseif core.difficultyID == 4 then
                    core:getAchievementSuccess(4621)
                end
                necroticPlagueCompletedAnnounced = true
            end
        end
    end
end

function core._631:ClearVariables()
    ------------------------------------------------------
    ---- _631 Citadel Bosses
    ------------------------------------------------------
    players = {}

    ------------------------------------------------------
    ---- Lady Deathwhisper
    ------------------------------------------------------
    CultFanaticFound = false
    CultAdherentFound = false
    DeformedFanaticFound = false
    ReanimatedFanaticFound = false
    ReanimatedAdherentFound = false
    CultFanaticWait = false
    CultAdherentWait = false
    AddCounter = 0

    ------------------------------------------------------
    ---- _631 Gunship Battle
    ------------------------------------------------------
    currentTimestamp = nil

    ------------------------------------------------------
    ---- Deathbringer Saurfang
    ------------------------------------------------------
    markOfTheFallenChampionCounter = 0

    ------------------------------------------------------
    ---- Valithria Dreamwalker
    ------------------------------------------------------
    AchievementTracker_portalsSpawned = false
    portalsEntered = 0
    noteDisplayed = false
    noteTwoDisplay = false
    totalPortals = 0

    ------------------------------------------------------
    ---- Sindragosa
    ------------------------------------------------------
    mysticBuffetStack = 0

    ------------------------------------------------------
    ---- BloodQueenLanathel
    ------------------------------------------------------
    playersCompleted = {}

    ------------------------------------------------------
    ---- Lich King
    ------------------------------------------------------
    necroticPlagueStack = 0
    necroticPlagueCompletedAnnounced = false
end