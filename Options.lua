local _, core = ...
local L = core.L

AchievementTrackerOptions = {}

core.Options = {
    EnableAddon = {
        name = L['GUI_EnableAddon'],
        type = 'toggle',
        desc = L['GUI_EnableAddonDescription'],
        get = function() return AchievementTrackerOptions["enableAddon"] end,
        set = function(value) EnableAddon(value) end,
        default = true,
    },
    ToggleMinimap = {
        name = L['GUI_ToggleMinimap'],
        type = 'toggle',
        desc = L['GUI_ShowMimapButtonDescription'],
        get = function() return AchievementTrackerOptions["showMinimap"] end,
        set = function(value) ToggleMinimapIcon(value) end,
        default = true,
    },
    AnnounceTracking = {
        name = L['GUI_AnnounceTracking'],
        type = 'toggle',
        desc = L['GUI_AnnounceAchievementsToGroupDescription'],
        get = function() return AchievementTrackerOptions["announceTrackedAchievements"] end,
        set = function(value) AchievementTrackerOptions["announceTrackedAchievements"] = value end,
        default = false,
    },
    OnlyTrackMissingAchievements = {
        name = L['GUI_OnlyTrackMissingAchievements'],
        type = 'toggle',
        desc = L['GUI_OnlyTrackMissingAchievementsDescription'],
        get = function() return AchievementTrackerOptions["onlyTrackMissingAchievements"] end,
        set = function(value) AchievementTrackerOptions["onlyTrackMissingAchievements"] = value end,
        default = false,
    },
    AnnounceMessagesToRaidWarning = {
        name = L['GUI_AnnounceMessagesToRaidWarning'],
        type = 'toggle',
        desc = L['GUI_AnnounceMessagesToRaidWarningDescription'],
        get = function() return AchievementTrackerOptions["announceToRaidWarning"] end,
        set = function(value) AchievementTrackerOptions["announceToRaidWarning"] = value end,
        default = true,
    },
    PlaySoundOnSuccess = {
        name = L['GUI_PlaySoundOnSuccess'],
        type = 'toggle',
        desc = L['GUI_PlaySoundOnCompletionDescription'],
        get = function() return AchievementTrackerOptions["toggleSound"] end,
        set = function(value) end,
        default = false,
    },
    PlaySoundOnFailed = {
        name = L['GUI_PlaySoundOnFailed'],
        type = 'toggle',
        desc = L['GUI_PlaySoundOnFailDescription'],
        get = function() return AchievementTrackerOptions["toggleSoundFailed"] end,
        set = function(value) end,
        default = false,
    },
    HideCompletedAchievements = {
        name = L['GUI_HideCompletedAchievements'],
        type = 'toggle',
        desc = L['GUI_HideCompletedAchievementsDescription'],
        get = function() return AchievementTrackerOptions["hideCompletedAchievements"] end,
        set = function(value) SetHideCompletedAchievements(value) end,
        default = false,
    },
    GreyOutCompletedAchievements = {
        name = L['GUI_GreyOutCompletedAchievements'],
        type = 'toggle',
        desc = L['GUI_GreyOutCompletedAchievementsDescription'],
        get = function() return AchievementTrackerOptions["greyOutCompletedAchievements"] end,
        set = function(value) SetGreyOutCompletedAchievements(value) end,
        default = false,
    },
    EnableAutomaticCombatLogging = {
        name = L['GUI_EnableAutomaticCombatLogging'],
        type = 'toggle',
        desc = L['GUI_EnableCombatLogDescription'],
        get = function() return AchievementTrackerOptions["enableAutomaticCombatLogging"] end,
        set = function(value) AchievementTrackerOptions["enableAutomaticCombatLogging"] = value end,
        default = false,
    },
    DisplayInfoFrame = {
        name = L['GUI_DisplayInfoFrame'],
        type = 'toggle',
        desc = L['GUI_EnableInfoFrameDescription'],
        get = function() return AchievementTrackerOptions["displayInfoFrame"] end,
        set = function(value) AchievementTrackerOptions["displayInfoFrame"] = value end,
        default = true,
    },
    TrackAchievementsInBlizzardUI = {
        name = L['GUI_TrackAchievementsInBlizzardUI'],
        type = 'toggle',
        desc = L['GUI_TrackAchievementsInUIDescription'],
        get = function() return AchievementTrackerOptions["trackAchievementsInBlizzardUI"] end,
        set = function(value) AchievementTrackerOptions["trackAchievementsInBlizzardUI"] = value end,
        default = false,
    },
    TrackCharacterAchievements = {
        name = L['GUI_TrackCharacterAchievements'],
        type = 'toggle',
        desc = L['GUI_TrackChararcterAchievementsDescription'],
        get = function() return AchievementTrackerOptions["trackCharacterAchievements"]  end,
        set = function(value) SetTrackCharacterAchievements(value) end,
        default = false,
    },
    TrackAchievementsAutomatically = {
        name = L['GUI_TrackAchievementsAutomatically'],
        type = 'toggle',
        desc = L['GUI_TrackAchievementsAutomaticallyDescription'],
        get = function() return AchievementTrackerOptions["trackAchievementsAutomatically"] end,
        set = function(value) AchievementTrackerOptions["trackAchievementsAutomatically"] = value end,
        default = false,
    },
    ChangeMinimapIcon = {
        name = L['GUI_ChangeMinimapIcon'],
        type = 'toggle',
        desc = L['GUI_ChangeMinimapIconDescription'],
        get = function() return AchievementTrackerOptions["changeMinimapIcon"] end,
        set = function(value) AchievementTrackerOptions["changeMinimapIcon"] = value end,
        default = false,
    },
}

function SetTrackCharacterAchievements(checked)
    AchievementTrackerOptions["trackCharacterAchievements"] = checked

    core:SetTrackCharacterAchievements()
end

function SetGreyOutCompletedAchievements(checked)
    AchievementTrackerOptions["greyOutCompletedAchievements"] = checked

	--If hide completed achievements is true then toggle off
	if core.Options.HideCompletedAchievements.get() == true then
		AchievementTrackerOptions["hideCompletedAchievements"] = false
	end
end

function SetHideCompletedAchievements(checked)
    AchievementTrackerOptions["hideCompletedAchievements"] = checked

	--If hide completed achievements is true then toggle off
	if core.Options.GreyOutCompletedAchievements.get() == true then
		AchievementTrackerOptions["greyOutCompletedAchievements"] = false
	end
end

function EnableAddon(checked)
    if (core.inCombat == false and checked == false) or checked == true then
        AchievementTrackerOptions["enableAddon"] = checked
        core:SetAddonEnabled()
    else
        core:printMessage(L["GUI_BlockDisableAddon"])
    end
end

function ToggleMinimapIcon(checked)
    AchievementTrackerOptions["showMinimap"] = checked
    if core.ATButton ~= nil then
        if checked then
            core.ATButton:Show("InstanceAchievementTracker")
        else
            core.ATButton:Hide("InstanceAchievementTracker")
        end
    end
end

function AchievementTracker_SelectSoundFailed(self, arg1, arg2, checked)
    if arg1 == 1 then
        PlaySound(SOUNDKIT.RAID_WARNING, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["failedSoundID"] = 1
        setFailedSound(SOUNDKIT.RAID_WARNING)
    elseif arg1 == 2 then
        PlaySound(SOUNDKIT.LFG_REWARDS, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.LFG_REWARDS
        AchievementTrackerOptions["failedSoundID"] = 2
        setFailedSound(SOUNDKIT.LFG_REWARDS)
    elseif arg1 == 3 then
        PlaySound(SOUNDKIT.UI_BATTLEGROUND_COUNTDOWN_FINISHED, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.UI_BATTLEGROUND_COUNTDOWN_FINISHED
        AchievementTrackerOptions["failedSoundID"] = 3
        setFailedSound(SOUNDKIT.UI_BATTLEGROUND_COUNTDOWN_FINISHED)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.UI_SCENARIO_ENDING, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.UI_SCENARIO_ENDING
        AchievementTrackerOptions["failedSoundID"] = 4
        setFailedSound(SOUNDKIT.UI_SCENARIO_ENDING)
    elseif arg1 == 5 then
        PlaySound(SOUNDKIT.UI_GARRISON_MISSION_COMPLETE_ENCOUNTER_FAIL, "Master") --Fail
        AchievementTrackerOptions["failedSound"] = SOUNDKIT.UI_GARRISON_MISSION_COMPLETE_ENCOUNTER_FAIL
        AchievementTrackerOptions["failedSoundID"] = 5
        setFailedSound(SOUNDKIT.UI_GARRISON_MISSION_COMPLETE_ENCOUNTER_FAIL)
    elseif arg1 == 6 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Not_Prepared.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Not_Prepared.ogg"
        AchievementTrackerOptions["failedSoundID"] = 6
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Not_Prepared.ogg")
    elseif arg1 == 7 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_2.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_2.ogg"
        AchievementTrackerOptions["failedSoundID"] = 7
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_2.ogg")
    elseif arg1 == 8 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_3.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_3.ogg"
        AchievementTrackerOptions["failedSoundID"] = 8
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_3.ogg")
    elseif arg1 == 9 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_4.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_4.ogg"
        AchievementTrackerOptions["failedSoundID"] = 9
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_4.ogg")
    elseif arg1 == 10 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_5.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_5.ogg"
        AchievementTrackerOptions["failedSoundID"] = 10
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound_5.ogg")
    elseif arg1 == 11 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Failed.ogg", "Master") --Fail
        AchievementTrackerOptions["failedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Failed.ogg"
        AchievementTrackerOptions["failedSoundID"] = 11
        setFailedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Failed.ogg")
    end
    MSA_DropDownMenu_SetText(arg2, arg1)
end

function AchievementTracker_SelectSoundCompleted(self, arg1, arg2, checked)
    if arg1 == 1 then
        PlaySound(SOUNDKIT.READY_CHECK, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 1
        setCompletedSound(SOUNDKIT.READY_CHECK)
    elseif arg1 == 2 then
        PlaySound(SOUNDKIT.ALARM_CLOCK_WARNING_2, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 2
        setCompletedSound(SOUNDKIT.ALARM_CLOCK_WARNING_2)
    elseif arg1 == 3 then
        PlaySound(SOUNDKIT.ALARM_CLOCK_WARNING_3, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 3
        setCompletedSound(SOUNDKIT.ALARM_CLOCK_WARNING_3)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.AUCTION_WINDOW_CLOSE, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 4
        setCompletedSound(SOUNDKIT.AUCTION_WINDOW_CLOSE)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.AUCTION_WINDOW_CLOSE, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 4
        setCompletedSound(SOUNDKIT.AUCTION_WINDOW_CLOSE)
    elseif arg1 == 4 then
        PlaySound(SOUNDKIT.AUCTION_WINDOW_CLOSE, "Master") --Success
        AchievementTrackerOptions["completedSound"] = SOUNDKIT.RAID_WARNING
        AchievementTrackerOptions["completedSoundID"] = 4
        setCompletedSound(SOUNDKIT.AUCTION_WINDOW_CLOSE)
    elseif arg1 == 5 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Prepared.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Prepared.ogg"
        AchievementTrackerOptions["completedSoundID"] = 5
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\You_Are_Prepared.ogg")
    elseif arg1 == 6 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 6.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 6.ogg"
        AchievementTrackerOptions["completedSoundID"] = 6
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 6.ogg")
    elseif arg1 == 7 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 7.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 7.ogg"
        AchievementTrackerOptions["completedSoundID"] = 7
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 7.ogg")
    elseif arg1 == 8 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 8.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 8.ogg"
        AchievementTrackerOptions["completedSoundID"] = 8
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 8.ogg")
    elseif arg1 == 9 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 9.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 9.ogg"
        AchievementTrackerOptions["completedSoundID"] = 9
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 9.ogg")
    elseif arg1 == 10 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 10.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 10.ogg"
        AchievementTrackerOptions["completedSoundID"] = 10
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 10.ogg")
    elseif arg1 == 11 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 11.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 11.ogg"
        AchievementTrackerOptions["completedSoundID"] = 11
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 11.ogg")
    elseif arg1 == 12 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 12.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 12.ogg"
        AchievementTrackerOptions["completedSoundID"] = 12
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Sound 12.ogg")
    elseif arg1 == 13 then
        PlaySoundFile("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Completed.ogg", "Master") --Success
        AchievementTrackerOptions["completedSound"] = "Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Completed.ogg"
        AchievementTrackerOptions["completedSoundID"] = 13
        setCompletedSound("Interface\\AddOns\\InstanceAchievementTracker\\Sounds\\Achievement Completed.ogg")
    end
    MSA_DropDownMenu_SetText(arg2, arg1)
end