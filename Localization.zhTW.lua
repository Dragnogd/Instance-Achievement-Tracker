if(GetLocale() ~= 'zhTW') then return end

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["GUI_Achievements"] = "成就",
    ["GUI_Tactics"] = "戰術",
    ["GUI_TrackingNumber"] = "目前追蹤",
    ["GUI_Options"] = "選項",
    ["GUI_EnableAddon"] = "啟用插件",
    ["GUI_Enabled"] = "已啟用",
    ["GUI_Disabled"] = "已停用",
    ["GUI_ToggleMinimap"] = "顯示小地圖按鈕",
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
    ["GUI_TrackingDisabled"] = "成就追蹤已停用",
    ["GUI_EnterInstanceToStartScanning"] = "進入副本開始掃描",
    ["GUI_BattleForAzeroth"] = "決戰艾澤拉斯",
    ["GUI_Legion"] = "軍臨天下",
    ["GUI_WarlordsOfDraenor"] = "德拉諾之霸",
    ["GUI_MistsOfPandaria"] = "潘達利亞之謎",
    ["GUI_Cataclysm"] = "浩劫與重生",
    ["GUI_WrathOfTheLichKing"] = "巫妖王之怒",
    ["GUI_Players"] = "玩家",
    ["GUI_Achievement"] = "成就",
    ["GUI_NoPlayersNeedAchievement"] = "隊伍中沒有玩家需要做這個成就",
    ["GUI_PlayersWhoNeedAchievement"] = "需要做成就的玩家",
    ["GUI_ScanInProgress"] = "掃描仍在進行中",
    ["GUI_Tracking"] = "正在追蹤",
    ["GUI_Track"] = "追蹤",
    ["GUI_OutputPlayers"] = "輸出玩家",
    ["GUI_OutputTactics"] = "輸出戰術",
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

core:RegisterLocale('zhTW', baseLocale)
