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
    ["GUI_MinimapEnabled"] = "小地圖按鈕已啟用",
    ["GUI_MinimapDisabled"] = "小地圖按鈕已停用",
    ["GUI_AnnounceTracking"] = "通報隊伍開始追蹤成就",
    ["GUI_OnlyTrackMissingAchievements"] = "只追蹤缺少的成就",
    ["GUI_AnnounceMessagesToRaidWarning"] = "通報到團隊警告 (可用時)",
    ["GUI_AchievementsDiscordTitle"] = "Achievements Discord",
    ["GUI_AchievementsDiscordDescription"] = "戰術是由 Achievements Discord 伺服器慷慨大方的提供，在這個社群中可以遇到相同的成就控，相約一起組隊解各式各樣的成就。",
    ["GUI_PlaySoundOnSuccess"] = "成就完成時播放音效",
    ["GUI_PlaySoundOnFailed"] = "成就失敗時播放音效",
    ["GUI_SelectSound"] = "選擇音效",
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
    ["GUI_OnlyDisplayMissingAchievements"] = "只顯示缺少的成就",
    ["GUI_GreyOutCompletedAchievements"] = "用灰色顯示已完成的成就",
    ["GUI_HideCompletedAchievements"] = "隱藏已完成的成就",

    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    ["Core_StartingAchievementScan"] = "開始掃描成就",
    ["Core_GameFreezeWarning"] = "遊戲將會停頓幾秒",
    ["Core_AchievementScanFinished"] = "成就掃描完成",
    ["Core_EnableAchievementTracking"] = "啟用/停用 IAT 成就追蹤",
    ["Core_TrackAchievements"] = "追蹤成就",
    ["Core_Yes"] = "是",
    ["Core_No"] = "否",
    ["Core_AchievementTrackingEnabledFor"] = "已啟用追蹤成就",
    ["Core_help"] = "說明",
    ["Core_Commands"] = "指令清單",
    ["Core_ListCommands"] = "顯示可用的指令",
    ["Core_CommandEnableTracking"] = "啟用/停用 IAT 成就追蹤",
    ["Core_Enable"] = "啟用",
    ["Core_NoTrackingForInstance"] = "I副本成就追蹤: 無法追蹤這個首領戰的任何成就。",
    ["Core_Failed"] = "已失敗!",
    ["Core_PersonalAchievement"] = "個人成就",
    ["Core_Reason"] = "原因",
    ["Core_CriteriaMet"] = "條件已達成，現在可以擊殺首領!",
    ["Core_Counter"] = "數量",

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    ["Instances_Other"] = "其他", 
    ["Instances_TrashAfterThirdBoss"] = "第三個首領之後的垃圾",
}

core:RegisterLocale('zhTW', baseLocale)
