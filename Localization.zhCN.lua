if(GetLocale() ~= 'zhCN') then return end

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "通报某些BOSS还没有成就的玩家",
	["- Announce to chat tactics for a certain boss"] = "通报某些BOSS成就攻略",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "持续追踪需要在一定时间内杀指定数量怪物成就，当有聚集足够的怪的时候他会在聊天框报告这些怪物是否在指定时间被击杀",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "扫描队中的所有玩家，追踪没有当前BOSS成就的玩家",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "追踪当前BOSS成就失败并输出到聊天框",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "追踪当前BOSS成就并输出到聊天框",
	["(Enter instance to start scanning)"] = "进入副本开始扫描",
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \n\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",--]] 
	["Core_AchievementScanFinished"] = "成就扫描完毕",
	["Core_AchievementTrackingEnabledFor"] = "成就追踪已启用",
	["Core_CommandEnableTracking"] = "开启/关闭IAT成就追踪",
	["Core_Commands"] = "命令列表",
	["Core_Counter"] = "计数",
	["Core_CriteriaMet"] = "成就已经达成. BOSS可以被击杀!",
	["Core_Enable"] = "开启",
	["Core_EnableAchievementTracking"] = "是否启用成就追踪",
	["Core_Failed"] = "失败!",
	["Core_GameFreezeWarning"] = "这可能会造成几秒的卡顿",
	["Core_help"] = "帮助",
	["Core_ListCommands"] = "显示命令列表",
	["Core_No"] = "否",
	["Core_NoTrackingForInstance"] = "IAT 无法追踪这场战役的任何成就.",
	["Core_PersonalAchievement"] = "个人成就",
	["Core_Reason"] = "原因",
	["Core_StartingAchievementScan"] = "开始扫描",
	["Core_TrackAchievements"] = "追踪成就",
	["Core_Yes"] = "是",
	["Features"] = "功能",
	--[[Translation missing --]]
	--[[ ["Freehold_HarlanSweete"] = "%s will target a random player for %s, which will have to position near one of the chests, so that they will end up being destroyed.",--]] 
	--[[Translation missing --]]
	--[[ ["Freehold_RingOfBooty"] = "For this achievement you will have to pick up 3 items throughout the instance. %s spawns in the nest at the first boss after you defeat it, %s is found on top of a platform in The Rum Quarter, and %s is found near Sharkbait after the third boss.",--]] 
	--[[Translation missing --]]
	--[[ ["Freehold_SkycapNKragg"] = "To summon IAT_138314 you have to place a %s before you pull the boss.",--]] 
	["GUI_Achievement"] = "成就",
	["GUI_Achievements"] = "成就",
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsCompletedForInstance"] = "All achievements have been completed for",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements.",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsDiscordTitle"] = "Achievements Discord",--]] 
	["GUI_AnnounceMessagesToRaidWarning"] = "在团队警告中显示信息",
	["GUI_AnnounceTracking"] = "在团队中显示成就追踪",
	--[[Translation missing --]]
	--[[ ["GUI_Author"] = "Author",--]] 
	["GUI_BattleForAzeroth"] = "争霸艾泽拉斯",
	["GUI_Cataclysm"] = "大地的裂变",
	["GUI_Disabled"] = "取消",
	["GUI_EnableAddon"] = "启用插件",
	--[[Translation missing --]]
	--[[ ["GUI_EnableAutomaticCombatLogging"] = "Enable automatic combat logging",--]] 
	["GUI_Enabled"] = "开始",
	["GUI_EnterInstanceToStartScanning"] = "进入副本开始扫描",
	["GUI_GreyOutCompletedAchievements"] = "淡出已完成的成就",
	["GUI_HideCompletedAchievements"] = "隐藏已完成成就",
	["GUI_Legion"] = "军团再临",
	["GUI_MinimapDisabled"] = "关闭迷你小地图图标",
	["GUI_MinimapEnabled"] = "开启迷你小地图图标",
	["GUI_MistsOfPandaria"] = "潘达利亚之谜",
	["GUI_NoPlayersNeedAchievement"] = "队伍中没有玩家需要做这个成就",
	["GUI_OnlyDisplayMissingAchievements"] = "只显示未完成成就",
	["GUI_OnlyTrackMissingAchievements"] = "只追踪未完成成就",
	["GUI_Options"] = "选项",
	["GUI_OutputPlayers"] = "输出玩家",
	["GUI_OutputTactics"] = "输出战术",
	["GUI_Players"] = "玩家",
	["GUI_PlayersWhoNeedAchievement"] = "需要做成就的玩家",
	["GUI_PlaySoundOnFailed"] = "当成就失败时播放音效",
	["GUI_PlaySoundOnSuccess"] = "当成就完成时播放音效",
	["GUI_ScanInProgress"] = "扫描仍在进行中",
	["GUI_SelectSound"] = "选择音效",
	["GUI_Tactics"] = "追踪",
	["GUI_ToggleMinimap"] = "在小地图显示按钮",
	["GUI_Track"] = "追踪",
	["GUI_Tracking"] = "追踪",
	["GUI_TrackingDisabled"] = "成就追踪已停用",
	["GUI_TrackingNumber"] = "当前追踪",
	--[[Translation missing --]]
	--[[ ["Gui_TranslatorNames"] = "Gui_TranslatorNames",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_Translators"] = "Translators",--]] 
	["GUI_WarlordsOfDraenor"] = "德拉诺之王",
	["GUI_WrathOfTheLichKing"] = "巫妖王之怒",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker(成就追踪)",
	["Instances_Other"] = "其他",
	["Instances_TrashAfterThirdBoss"] = "第三个BOSS后的集市",
	--[[Translation missing --]]
	--[[ ["KingsRest_DazarTheFirstKing"] = "This achievement is obtained at %s, the last boss in the instance. Have two players each stay on top of the stones in front of the two sarcophagi, and the lights will start filling up around the stone. Once they are both lit up, the right sarcophagus will start shaking which means that you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_MchimbaTheEmbalmer"] = "For this achievement you will have to free the player targeted by %s without him using %s more than once, and also free him before the boss finishes casting %s.\n\n Note: Players have reported a minor bug with this achievement, and it's recommended that the entombed player does not use %s before the boss casts %s",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_Other"] = "The first trinket is in the first room of the dungeon, behind the sarcophagus, underneath the baskets.\n The second trinket is in the first boss hallway, at the end of the platform, behind the last set of stairs.\n The third trinket - (Check out the Glory of the Wartorn Hero Achievement Guide for details on WowHead)\n The fourth trinket is located before the final boss room, at the bottom of the strairs, at the top of the right pillar.",--]] 
	["Main"] = "主界面",
	["Shared_AddKillCounter"] = "%s 击杀次数",
	["Shared_CompletedBossKill"] = "将完成(当BOSS被击杀)",
	["Shared_DamageFromAbility"] = "%s 伤害",
	["Shared_DirectHitFromAbility"] = "%s 直接命中",
	["Shared_DoesNotMeetCritera"] = "不满足",
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	["Shared_FailedPersonalAchievement"] = "%s 已经失败 %s (原因: %s)(个人成就)",
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	--[[Translation missing --]]
	--[[ ["Shared_Found"] = "found",--]] 
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	["Shared_GotHit"] = "被击中",
	["Shared_HasBeenHitWith"] = "已经被击中",
	["Shared_HasBeenInfectedWith"] = "被感染",
	["Shared_HasCompleted"] = "已成功",
	["Shared_HasFailed"] = "已失败",
	["Shared_HasGained"] = "已获得",
	["Shared_HasLost"] = "已失去",
	["Shared_HeCanNowBeKileld"] = "他现在可以被击杀",
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBoss"] = "At max level, you can simply just kill the boss to get this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBossSingleTarget"] = "At max level, you can simply just kill the boss with single target abilities to get this achievement",--]] 
	["Shared_KillTheAddNow"] = "现在击杀 %s ",
	["Shared_MeetsCritera"] = "满足",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "没有被击中",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "击中玩家",
	["Shared_PlayersWhoStillNeedToGetHit"] = "仍然需要被击中的玩家:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "以下玩家需要复活才能获得成就:",
	--[[Translation missing --]]
	--[[ ["Shared_ReportString"] = "Please report the following string to the IAT author",--]] 
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	["Shared_SheCanNowBeKilled"] = "她现在可以被击杀",
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	--[[Translation missing --]]
	--[[ ["Shared_WasKilled"] = "was killed",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_LordStormsong"] = "During the course of the encounter, %s will periodically begin to %s which summons %s that will chase players and attempt to explode upon impact. To obtain this achievement, you must not come into contact with any of the void adds so you will keep kiting them throughout the encounter.",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_Other"] = "The %s is picked up at the start of the dungeon, in the first room. If you receive any frost damage then the spirit flames will be extinguished so it's recommended to first clear all the trash to the third boss, and then pick up the breath. Do not kill the first boss as that will make the breath despawn. Once you light up the shrines to the third boss you will get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_VolZith"] = "To get the %s debuff you will have to dive down in the water before the last boss until you see Void Orbs floating around, and then swim through them. The debuff will make you hostile to all players for 24 seconds, then disappear for 6 seconds time in which your healer must use cds and heal you to full hp. Avoid using aoe spells on the boss, and instead use self heals as much as possible to help your healer out.\n\n After %s casts %s, you will get teleported into the sunken realm where you should quickly kill the adds and then wait 20-30 seconds for cooldowns to be available. %s will also cast %s, and you will have to crowd control 5 %s adds so that they won't reach the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Fetid_Devourer_Tactics"] = "Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\n\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%% (%s)\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_GHuun_Tactics"] = "For this achievement you will have to make groups of 3 people to do the %s: 2 dps + 1 healer assisting them.\n\n If you have a smaller group then you should invite a few more people to help out with killing the adds",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_MOTHER_Tactics"] = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\n\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Mythrax_Tactics"] = "As of November 2018: The achievement now functions as described.\n\n This makes the achievement much more easier, as you just pick up the orbs that you spawned.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Taloc_Tactics"] = "For this achievement you will have to collect 4 %s while the Elevator is going down in phase 2.\n\n The positions of the orbs seem to be randomised, however a Demon Hunter can easily get all of them by using %s and %s",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Vectis_Tactics"] = "IAT_142148 is located down on the platform right before you go to IAT_134442.\n\n After you get the %s debuff on her, you can safely kill her, then kill the boss and you'll get the achievement.\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZekVoz_Tactics"] = "This achievement is pretty easy, however you should use the IAT_64482 after IAT_135129 disappears in phase 2. The puzzle will activate the next time the IAT_135129 appears (the second time), which helps your healers with healing & mana (you won't have to deal with the mechanics for an extra minute).\n\n The %s deal anywhere from 25k to 35k damage, so make sure to dodge them as much as possible so your healers don't get overwhelmed.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZulReborn_Tactics"] = "This achievement is pretty straight forward, no one has to step onto the inner ring of the platform. Here are a few tips for the encounter:\n\n Tanks should pick all the adds, and stack them so that melee dps can cleave them.\n Ranged dps should be on the boss 24/7, and should not switch to the adds unless melee dps can't keep up killing them in time.\n If you have 2 priests in the group, then you should assign them to different positions (left and right outside of the group) so that both sides are covered when adds spawn.\n At 40%% IAT_138967 will knock back everyone, so you should position yourself near a wall so you don't get knocked off the platform.\"",--]]
}

core:RegisterLocale('zhCN', baseLocale)
