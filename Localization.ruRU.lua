

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["GUI_Achievements"] = "Достижений",
    ["GUI_Tactics"] = "Тактик",
    ["GUI_TrackingNumber"] = "В настоящее время отслеживается",
    ["GUI_Options"] = "Настройки",
    ["GUI_EnableAddon"] = "Включить Аддон",
    ["GUI_Enabled"] = "Включено",
    ["GUI_Disabled"] = "Провалено",
    ["GUI_ToggleMinimap"] = "Показывать кнопку на Миникарте",
    -- ["GUI_MinimapEnabled"] = "Minimap icon enabled",
    -- ["GUI_MinimapDisabled"] = "Minimap icon disabled",
    -- ["GUI_AnnounceTracking"] = "Announce achievements being tracked to group", --L["Announce Achievements Being Tracked To Group"]
    -- ["GUI_OnlyTrackMissingAchievements"] = "Only track missing achievements", --["Only track missing achievements"]
    -- ["GUI_AnnounceMessagesToRaidWarning"] = "Announce messages to Raid Warning", --["Announce messages to Raid Warning"]
    -- ["GUI_AchievementsDiscordTitle"] = "Achievements Discord",
    -- ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements.",
    -- ["GUI_PlaySoundOnSuccess"] = "Play a sound when a achievement is completed",
    -- ["GUI_PlaySoundOnFailed"] = "Play a sound when an achievement fails",
    -- ["GUI_SelectSound"] = "Select Sound",
    ["GUI_TrackingDisabled"] = "Отслеживание достижений отключено",
    ["GUI_EnterInstanceToStartScanning"] = "Войдите в подземелье, чтобы начать сканирование",
    ["GUI_BattleForAzeroth"] = "Битва за Азерот",
    ["GUI_Legion"] = "Легион",
    ["GUI_WarlordsOfDraenor"] = "Военачальники Дренора",
    ["GUI_MistsOfPandaria"] = "Туманы Пандарии",
    ["GUI_Cataclysm"] = "Катаклизм",
    ["GUI_WrathOfTheLichKing"] = "Гнев Короля-Лича",
    ["GUI_Players"] = "Игроки",
    ["GUI_Achievement"] = "Достижение",
    ["GUI_NoPlayersNeedAchievement"] = "Ни одному игроку в группе не нужно это достижение",
    ["GUI_PlayersWhoNeedAchievement"] = "Игроки, которые нуждаются в достижении",
    ["GUI_ScanInProgress"] = "сканирование продолжается",
    ["GUI_Tracking"] = "Отслеживание",
    ["GUI_Track"] = "Следить",
    ["GUI_OutputPlayers"] = "Показать Достижение",
    ["GUI_OutputTactics"] = "Показать Тактику",
    -- ["GUI_OnlyDisplayMissingAchievements"] = "Only display missing achievements",
    -- ["GUI_GreyOutCompletedAchievements"] = "Grey out completed achievements",

    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    -- ["Core_StartingAchievementScan"] = "Starting acchievement scan for", --["Starting Achievement Scan For"]
    -- ["Core_GameFreezeWarning"] = "This may freeze your game for a few seconds", --["This may freeze your game for a few seconds"]
    -- ["Core_AchievementScanFinished"] = "Achievement Scanning Finished", --["Achievement Scanning Finished"]
    -- ["Core_EnableAchievementTracking"] = "Do you want to enable achievement tracking for", --["Do you want to enable achievement tracking for"]
    -- ["Core_TrackAchievements"] = "Track Achievements", --["Track Achievements"]
    -- ["Core_Yes"] = "Yes", --["Core_Yes"]
    -- ["Core_No"] = "No", --["Core_No"]
    -- ["Core_AchievementTrackingEnabledFor"] = "Achievement Tracking Enabled for", --["Achievement Tracking Enabled for"]
    -- ["Core_help"] = "help", --["help"]
    -- ["Core_Commands"] = "List of slash commands", --["List of slash commands"]
    -- ["Core_ListCommands"] = "shows a list of avaliable slash commands", --["shows a list of avaliable slash commands"]
    -- ["Core_CommandEnableTracking"] = "enable/disable IAT achievement tracking", --["enable/disable IAT achievement tracking"]
    -- ["Core_Enable"] = "enable", --["enable"]
    -- ["Core_NoTrackingForInstance"] = "IAT cannot track any achievements for this encounter.",
    -- ["Core_Failed"] = "FAILED!",
    -- ["Core_PersonalAchievement"] = "Personal Achievement",
    -- ["Core_Reason"] = "Reason",
    -- ["Core_CriteriaMet"] = "Criteria has been met. Boss can now be killed!",
    -- ["Core_Counter"] = "Counter",

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    -- ["Other"] = "Other", 
    -- ["Instances_TrashAfterThirdBoss"] = "Trash after the third boss", --L["Trash after the third boss"]        
}

core:RegisterLocale('ruRU', baseLocale)
