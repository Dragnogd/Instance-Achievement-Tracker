if(GetLocale() ~= 'zhCN') then return end

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    -- ["GUI_Achievements"] = "Achievements", --["Achievements"]
    ["GUI_Tactics"] = "追踪",
    ["GUI_TrackingNumber"] = "当前追踪",
    ["GUI_Options"] = "选项",
    ["GUI_EnableAddon"] = "启用插件",
    ["GUI_Enabled"] = "开始",
    ["GUI_Disabled"] = "取消",
    ["GUI_ToggleMinimap"] = "在小地图显示按钮",
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
    -- ["GUI_TrackingDisabled"] = "Achievement Tracking Disabled", --["(Achievement Tracking Disabled)"]
    -- ["GUI_EnterInstanceToStartScanning"] = "Enter instance to start scanning", --["Enter instance to start scanning"]
    ["GUI_BattleForAzeroth"] = "争霸艾泽拉斯",
    ["GUI_Legion"] = "军团再临",
    ["GUI_WarlordsOfDraenor"] = "德拉诺之王",
    ["GUI_MistsOfPandaria"] = "潘达利亚之谜",
    ["GUI_Cataclysm"] = "大地的裂变",
    ["GUI_WrathOfTheLichKing"] = "巫妖王之怒",
    ["GUI_Players"] = "脚男",
    ["GUI_Achievement"] = "成就",
    -- ["GUI_NoPlayersNeedAchievement"] = "No players in the group need this achievement", --["No players in the group need this achievement"]
    -- ["GUI_PlayersWhoNeedAchievement"] = "Players who need Achievement", --["Players who need Achievement"]
    -- ["GUI_ScanInProgress"] = "scan still in progress", --["scan still in progress"]
    ["GUI_Tracking"] = "追踪",
    ["GUI_Track"] = "追踪",
    ["GUI_OutputPlayers"] = "输出脚男",
    ["GUI_OutputTactics"] = "输出打法",
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

core:RegisterLocale('zhCN', baseLocale)
