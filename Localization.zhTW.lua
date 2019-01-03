if(GetLocale() ~= 'zhTW') then return end

local _, core = ...
local baseLocale = {
    ["- Announce to chat players who are missing achievements for certain bosses"] = "- 在聊天視窗通報哪個玩家缺少哪個首領的成就",
	["- Announce to chat tactics for a certain boss"] = "- 在聊天視窗通報某些首領的成就解法",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- 持續追蹤成就要求你在指定時間內擊殺多少怪物。會在聊天視窗通報已經擊殺足夠數量的怪物以及是否在時間內完成。",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- 掃描隊伍中的所有玩家，檢查每個玩家缺少當前副本的哪個成就。",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- 追蹤成就的要求失敗時輸出到聊天視窗",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- 追蹤達到成就的要求時輸出到聊天視窗",
	["(Enter instance to start scanning)"] = "(進入副本開始掃描)",
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \\n\\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",--]] 
	["Core_AchievementScanFinished"] = "成就掃描完成",
	["Core_AchievementTrackingEnabledFor"] = "已啟用追蹤成就",
	["Core_CommandEnableTracking"] = "啟用/停用 IAT 成就追蹤",
	["Core_Commands"] = "指令清單",
	["Core_Counter"] = "數量",
	["Core_CriteriaMet"] = "條件已達成，現在可以擊殺首領!",
	["Core_Enable"] = "啟用",
	["Core_EnableAchievementTracking"] = "是否要啟用追蹤成就",
	["Core_Failed"] = "已失敗!",
	["Core_GameFreezeWarning"] = "遊戲將會停頓幾秒",
	["Core_help"] = "說明",
	["Core_ListCommands"] = "顯示可用的指令",
	["Core_No"] = "否",
	["Core_NoTrackingForInstance"] = "副本成就追蹤: 無法追蹤這個首領戰的任何成就。",
	["Core_PersonalAchievement"] = "個人成就",
	["Core_Reason"] = "原因",
	["Core_StartingAchievementScan"] = "開始掃描成就",
	["Core_TrackAchievements"] = "追蹤成就",
	["Core_Yes"] = "是",
	["Features"] = "功能",
	--[[Translation missing --]]
	--[[ ["Freehold_SkycapNKragg"] = "To summon IAT_138314 you have to place a %s before you pull the boss.",--]] 
	["GUI_Achievement"] = "成就",
	["GUI_Achievements"] = "成就",
	["GUI_AchievementsCompletedForInstance"] = "所有成就都已經完成",
	["GUI_AchievementsDiscordDescription"] = "戰術是由 Achievements Discord 伺服器慷慨大方的提供，在這個社群中可以遇到相同的成就控，相約一起組隊解各式各樣的成就。",
	["GUI_AchievementsDiscordTitle"] = "Achievements Discord",
	["GUI_AnnounceMessagesToRaidWarning"] = "通報到團隊警告 (可用時)",
	["GUI_AnnounceTracking"] = "通報隊伍開始追蹤成就",
	["GUI_BattleForAzeroth"] = "決戰艾澤拉斯",
	["GUI_Cataclysm"] = "浩劫與重生",
	["GUI_Disabled"] = "已停用",
	["GUI_EnableAddon"] = "啟用插件",
	["GUI_Enabled"] = "已啟用",
	["GUI_EnterInstanceToStartScanning"] = "進入副本開始掃描",
	["GUI_GreyOutCompletedAchievements"] = "用灰色顯示已完成的成就",
	["GUI_HideCompletedAchievements"] = "隱藏已完成的成就",
	["GUI_Legion"] = "軍臨天下",
	["GUI_MinimapDisabled"] = "小地圖按鈕已停用",
	["GUI_MinimapEnabled"] = "小地圖按鈕已啟用",
	["GUI_MistsOfPandaria"] = "潘達利亞之謎",
	["GUI_NoPlayersNeedAchievement"] = "隊伍中沒有玩家需要做這個成就",
	["GUI_OnlyDisplayMissingAchievements"] = "只顯示缺少的成就",
	["GUI_OnlyTrackMissingAchievements"] = "只追蹤缺少的成就",
	["GUI_Options"] = "選項",
	["GUI_OutputPlayers"] = "輸出玩家",
	["GUI_OutputTactics"] = "輸出戰術",
	["GUI_Players"] = "玩家",
	["GUI_PlayersWhoNeedAchievement"] = "需要做成就的玩家",
	["GUI_PlaySoundOnFailed"] = "成就失敗時播放音效",
	["GUI_PlaySoundOnSuccess"] = "成就完成時播放音效",
	["GUI_ScanInProgress"] = "掃描仍在進行中",
	["GUI_SelectSound"] = "選擇音效",
	["GUI_Tactics"] = "戰術",
	["GUI_ToggleMinimap"] = "顯示小地圖按鈕",
	["GUI_Track"] = "追蹤",
	["GUI_Tracking"] = "正在追蹤",
	["GUI_TrackingDisabled"] = "(成就追蹤已停用)",
	["GUI_TrackingNumber"] = "目前追蹤",
	["GUI_WarlordsOfDraenor"] = "德拉諾之霸",
	["GUI_WrathOfTheLichKing"] = "巫妖王之怒",
	["Instance Achievement Tracker"] = "副本成就追蹤",
	["Instances_Other"] = "其他",
	["Instances_TrashAfterThirdBoss"] = "第三個首領之後的垃圾",
	["Main"] = "一般",
	["Shared_AddKillCounter"] = "%s 擊殺數量",
	["Shared_CompletedBossKill"] = "擊殺首領後即可完成",
	["Shared_DamageFromAbility"] = "% 傷害",
	["Shared_DirectHitFromAbility"] = "%s 直接擊中",
	["Shared_DoesNotMeetCritera"] = "尚未達成條件",
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	["Shared_FailedPersonalAchievement"] = "%s 的 %s 已經失敗 (原因: %s) (個人成就)",
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	--[[Translation missing --]]
	--[[ ["Shared_Found"] = "found",--]] 
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	["Shared_GotHit"] = "擊中",
	["Shared_HasBeenHitWith"] = "已擊中",
	["Shared_HasBeenInfectedWith"] = "已受影響",
	["Shared_HasCompleted"] = "已完成",
	["Shared_HasFailed"] = "已失敗",
	["Shared_HasGained"] = "已獲得",
	["Shared_HasLost"] = "已失去",
	["Shared_HeCanNowBeKileld"] = "現在可以擊殺他",
	["Shared_JustKillBoss"] = "滿等時，只需要直接擊殺首領即可得到這個成就。",
	["Shared_JustKillBossSingleTarget"] = "滿等時，只需要直接使用單體技能擊殺首領即可得到這個成就。",
	["Shared_KillTheAddNow"] = "現在擊殺 %s",
	["Shared_MeetsCritera"] = "達成條件",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "沒有擊中",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "玩家擊中:",
	["Shared_PlayersWhoStillNeedToGetHit"] = "仍需要擊中的玩家:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "這些玩家需要被復活才能獲得成就:",
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	["Shared_SheCanNowBeKilled"] = "現在可以擊殺她",
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	--[[Translation missing --]]
	--[[ ["Uldir_Fetid_Devourer_Tactics"] = "Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\\n\\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%% (%s)\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_GHuun_Tactics"] = "For this achievement you will have to make groups of 3 people to do the %s: 2 dps + 1 healer assisting them.\\n\\n If you have a smaller group then you should invite a few more people to help out with killing the adds",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_MOTHER_Tactics"] = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\\n\\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Mythrax_Tactics"] = "As of November 2018: The achievement now functions as described.\\n\\n This makes the achievement much more easier, as you just pick up the orbs that you spawned.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Taloc_Tactics"] = "For this achievement you will have to collect 4 %s while the Elevator is going down in phase 2.\\n\\n The positions of the orbs seem to be randomised, however a Demon Hunter can easily get all of them by using %s and %s",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Vectis_Tactics"] = "IAT_142148 is located down on the platform right before you go to IAT_134442.\\n\\n After you get the %s debuff on her, you can safely kill her, then kill the boss and you'll get the achievement.\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZekVoz_Tactics"] = "This achievement is pretty easy, however you should use the IAT_64482 after IAT_135129 disappears in phase 2. The puzzle will activate the next time the IAT_135129 appears (the second time), which helps your healers with healing & mana (you won't have to deal with the mechanics for an extra minute).\\n\\n The %s deal anywhere from 25k to 35k damage, so make sure to dodge them as much as possible so your healers don't get overwhelmed.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZulReborn_Tactics"] = "This achievement is pretty straight forward, no one has to step onto the inner ring of the platform. Here are a few tips for the encounter:\\n\\n Tanks should pick all the adds, and stack them so that melee dps can cleave them.\\n Ranged dps should be on the boss 24/7, and should not switch to the adds unless melee dps can't keep up killing them in time.\\n If you have 2 priests in the group, then you should assign them to different positions (left and right outside of the group) so that both sides are covered when adds spawn.\\n At 40%% IAT_138967 will knock back everyone, so you should position yourself near a wall so you don't get knocked off the platform.\"",--]]
}

core:RegisterLocale('zhTW', baseLocale)
