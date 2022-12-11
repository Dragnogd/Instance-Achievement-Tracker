--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- _533 Bosses
------------------------------------------------------
core._533 = {}
core._533.Events = CreateFrame("Frame")

------------------------------------------------------
---- Patchwerk
------------------------------------------------------
local timerStarted = false
local timer

------------------------------------------------------
---- Arachnophobia
------------------------------------------------------
local timer2Started = false
local timer2

------------------------------------------------------
---- Kel'Thuzad
------------------------------------------------------
local abominationsKilled = 0

------------------------------------------------------
---- Loatheb
------------------------------------------------------
local sporeKilledByPlayer = nil

------------------------------------------------------
---- Sapphiron
------------------------------------------------------
local startFrostResistanceCheck = false
local frostResistanceTicker = nil
local showSapphironInfoFrame = false
local sapphironKilled = false

------------------------------------------------------
---- Thaddius
------------------------------------------------------
local subtractionFailWarningAnnounced = false
local thaddiusKilled = false

function core._533:HeiganTheUnclean()
    --Defeat Heigan the Unclean in Naxxramas without anyone in the raid dying in 10 player mode.

    --Player has died so fail the Achievement
    if core.type == "UNIT_DIED" and core.currentDest == "Player" and core.destName ~= nil then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
    end
end

function core._533:Loatheb()
    --Defeat Loatheb in Naxxramas without killing any spores in 10-player mode.

    --Detect who killed the mob as the UNIT_DIED event is not supplying the information
    if (core.type == "SWING_DAMAGE" or core.type == "SPELL_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE") and core.destID == "16286" and core.overkill ~= nil then
        if core.overkill > 0 and core.sourceName ~= nil and core.currentSource == "Player" then
            sporeKilledByPlayer = core.sourceName
        end
    end

    if core.type == "UNIT_DIED" and core.destID == "16286" then
        if sporeKilledByPlayer ~= nil then
            core:getAchievementFailedWithMessageAfter("(" .. sporeKilledByPlayer .. ")")
        else
            core:getAchievementFailed()
        end
    end
end

function core._533:Patchwerk()
    --Defeat Patchwerk in Naxxramas in 3 minutes or less in 10-player mode.

    if timerStarted == false then
        timerStarted = true
        core.MobCounter:SetupCountdown(180)
    end
end

function core._533:Arachnophobia()

end

function core._533:TrackAdditional()
    --Defeat Maexxna in Naxxramas within 20 minutes of Anub'Rekhan's death in 10-player mode.
    if timer2Started == true then
        core.IATInfoFrame:ToggleOn()
        if core.difficultyID == 3 then
            core.IATInfoFrame:SetHeading(GetAchievementLink(1858))
        elseif core.difficultyID == 4 then
            core.IATInfoFrame:SetHeading(GetAchievementLink(1859))
        end
    end

    if core.type == "UNIT_DIED" and core.destID == "15956" then
        if timerStarted2 == false then
            timerStarted2 = true
            if core.difficultyID == 3 then
                core.MobCounter:SetupCountdown(1200,1858)
            elseif core.difficultyID == 4 then
                core.MobCounter:SetupCountdown(1200,1859)
            end
        end
    end

    if core.type == "UNIT_DIED" and core.destID == "15952" then
        core.MobCounter:CancelCountdown()
        core.IATInfoFrame:ToggleOff()
    end

    --Sapphiron InfoFrame
    if core.type == "UNIT_DIED" and core.destID == "15989" then
        sapphironKilled = true
    end

    if sapphironKilled == true then
        if core.IATInfoFrame:IsVisible() then
			core.IATInfoFrame:Reset()
		end
    end
end

function core._533:GrandWidowFaerlina()
    if core.type == "SPELL_AURA_APPLIED" and core.destID == "15953" and core.spellId == 28732 then
        core:getAchievementFailed()
    end
end

function core._533:Subtraction()
    if subtractionFailWarningAnnounced == false then
        subtractionFailWarningAnnounced = true
        if core.difficultyID == 3 then
            --10 Man
            if core.groupSize > 9 then
                core:sendMessage(GetAchievementLink(2180) .. " " .. L["Shared_WrongGroupConfig"])
            end
        elseif core.difficultyID == 4 then
            --25 Man
            if core.groupSize > 21 then
                core:sendMessage(GetAchievementLink(2181) .. " " .. L["Shared_WrongGroupConfig"])
            end
        end
    end
end

function core._533:Shocking()
	if core.type == "UNIT_DIED" and core.destID == "15928" then
        thaddiusKilled = true
    end

	if thaddiusKilled == false then
        if (core.spellId == 28085 or core.spellId == 28062) and (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") then
            if core.sourceName ~= nil and core.destName ~= nil then
                if core.difficultyID == 3 then
                    core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ", " .. core.destName .. ")",nil,2178)
                elseif core.difficultyID == 4 then
                    core:getAchievementFailedWithMessageAfter("(" .. core.sourceName .. ", " .. core.destName .. ")",nil,2179)
                end
            else
                if core.difficultyID == 3 then
                    core:getAchievementFailed(nil,2178)
                elseif core.difficultyID == 4 then
                    core:getAchievementFailed(nil,2179)
                end
            end
        end
    end
end

function core._533:FourHorsemen()
    --Defeat the 4 Horsemen in Naxxramas, ensuring that they all die within 15 seconds of each other in 10-player mode.

    if core.type == "UNIT_DIED" and (core.destID == "16063" or core.destID == "16064" or core.destID == "16065" or core.destID == "30549") then
        if timerStarted == false then
            timerStarted = true
            core.MobCounter:SetupCountdown(15)
        end
    end
end

function core._533:Sapphiron()
    --Defeat Sapphiron in Naxxramas without any member of the raid having a frost resist value over 100 in 10-player mode.
    if startFrostResistanceCheck == false then
        startFrostResistanceCheck = true
        sapphironFrostResistanceChecker()
    end
end

function sapphironFrostResistanceChecker()
    --Check players every second to make sure they are under 100 frost resistance
    frostResistanceTicker = C_Timer.NewTicker(1, function()
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],core.groupSize,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()

        for player,status in pairs(core.InfoFrame_PlayersTable) do
            --Check if the players frost resistance if over 100
            if core.gameVersionMajor == 3 then
                local baseResistance, totalResistance, bonusResistance, minusResistance = UnitResistance(player, 4)

                if totalResistance > 100 then
                    if core.encounterStarted == true and core.currentBosses[1].encounterID == 1119 then
                        core:getAchievementFailedWithMessageAfter("(" .. player .. ")")
                    end
                    InfoFrame_SetPlayerFailedWithMessage(player, totalResistance)
                else
                    InfoFrame_SetPlayerCompleteWithMessage(player, totalResistance)
                end
            else
                -- local totalResistance = 101

                -- if totalResistance > 100 then
                --     if core.encounterStarted == true then
                --         core:getAchievementFailedWithMessageAfter("(" .. player .. ")")
                --     end
                --     InfoFrame_SetPlayerFailedWithMessage(player, totalResistance)
                -- else
                --     InfoFrame_SetPlayerCompleteWithMessage(player, totalResistance)
                -- end
            end
        end
    end)
end

function core._533:KelThuzad()
    --Defeat Kel'Thuzad in Naxxramas while killing at least 18 abominations in his chamber in 10 player mode.
    sapphironKilled = true

    if core.type == "UNIT_DIED" and (core.destID == "23562" or core.destID == "16428") and abominationsKilled < 18 then
        abominationsKilled = abominationsKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCNameClassic(23562) .. " " .. L["Shared_Killed"] .. " (" .. abominationsKilled .. "/18)",true)
    end

    if abominationsKilled >= 18 then
        core:getAchievementSuccess()
    end
end

function core._533:InitialSetup()
    core._533.Events:RegisterEvent("ZONE_CHANGED_INDOORS")
    core._533.Events:RegisterEvent("ZONE_CHANGED")

    setupSapphironInfoFrame()
end

function core._533:IATInstanceCleanup()
    core._533.Events:UnregisterEvent("ZONE_CHANGED_INDOORS")
    core._533.Events:UnregisterEvent("ZONE_CHANGED")

    --Reset timer for Arachnophobia if running
    core.MobCounter:CancelCountdown()
    timer2Started = false
    sapphironKilled = false
end

core._533.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._533.Events:ZONE_CHANGED_INDOORS()
    setupSapphironInfoFrame()
end

function core._533.Events:ZONE_CHANGED()
    setupSapphironInfoFrame()
end

function setupSapphironInfoFrame()
    if C_Map.GetBestMapForUnit("Player") == 167 and sapphironKilled == false then
		showSapphironInfoFrame = true
        core.IATInfoFrame:ToggleOn()
        core.IATInfoFrame:SetHeading(GetAchievementLink(2146))
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],core.groupSize,core.groupSize)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
        if startFrostResistanceCheck == false then
            startFrostResistanceCheck = true
            sapphironFrostResistanceChecker()
        end
	else
		showSapphironInfoFrame = false
		if core.IATInfoFrame:IsVisible() then
			core.IATInfoFrame:Reset()
		end
    end
end

function core._533:ClearVariables()
    ------------------------------------------------------
    ---- Patchwerk
    ------------------------------------------------------
    timerStarted = false

    ------------------------------------------------------
    ---- Kel'Thuzad
    ------------------------------------------------------
    abominationsKilled = 0

    ------------------------------------------------------
    ---- Loatheb
    ------------------------------------------------------
    sporeKilledByPlayer = nil

    ------------------------------------------------------
    ---- Sapphiron
    ------------------------------------------------------
    startFrostResistanceCheck = false
    showSapphironInfoFrame = false
    if frostResistanceTicker ~= nil and C_Map.GetBestMapForUnit("Player") ~= 167 then
        frostResistanceTicker:Cancel()
        frostResistanceTicker = nil
    end

    ------------------------------------------------------
    ---- Thaddius
    ------------------------------------------------------
    subtractionFailWarningAnnounced = false
    thaddiusKilled = false
end