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
	--[[ ["AssaultOnVioletHold_Festerface"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["AssaultOnVioletHold_MillificentManastorm"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BastionOfTwilight_HalfusWyrmbreaker"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BastionOfTwilight_ValionaAndTheralion"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight_Alliance"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight_Horde"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ConclaveOfTheChosen"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong_Alliance"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong_Horde"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_HighTinkerMekkatorque"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JadefireMasters"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JainaProudmoore"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_KingRastakhan"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Opulence"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_StormwallBlockade"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_BarrelsDestroyed"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_OpulenceRangeWarning"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BlackrockCaverns_KarshSteelbender"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BlackRookHold_AmalgamOfSouls"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BloodmaulSlagMines_Magmolatus"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CathedralOfEternalNight_Agronox"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CathedralOfEternalNight_Mephistroth"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CathedralOfEternalNight_ThrashbiteTheScornful"] = "",--]] 
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
	--[[Translation missing --]]
	--[[ ["CourtOfStars_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CourtOfStars_PatrolCaptainGerdo"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CrucibleOfStorms_StartMoving"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CrucibleOfStorms_StopMoving"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CrucibleOfStorms_TheRestlessCabal"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CrucibleOfStorms_UunatHarbingerOfTheVoid"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["DarkheartThicket_Dresaron"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["DarkheartThicket_ShadeOfXavius"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["EyeOfAzshara_LadyHatecoil"] = "",--]] 
	["Features"] = "功能",
	--[[Translation missing --]]
	--[[ ["Freehold_HarlanSweete"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Freehold_RingOfBooty"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Freehold_SkycapNKragg"] = "",--]] 
	["GUI_Achievement"] = "成就",
	["GUI_Achievements"] = "成就",
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsCompletedForInstance"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsDiscordDescription"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsDiscordTitle"] = "",--]] 
	["GUI_AnnounceMessagesToRaidWarning"] = "在团队警告中显示信息",
	["GUI_AnnounceTracking"] = "在团队中显示成就追踪",
	--[[Translation missing --]]
	--[[ ["GUI_Author"] = "",--]] 
	["GUI_BattleForAzeroth"] = "争霸艾泽拉斯",
	["GUI_Cataclysm"] = "大地的裂变",
	["GUI_Disabled"] = "取消",
	--[[Translation missing --]]
	--[[ ["GUI_DisplayInfoFrame"] = "",--]] 
	["GUI_EnableAddon"] = "启用插件",
	--[[Translation missing --]]
	--[[ ["GUI_EnableAutomaticCombatLogging"] = "",--]] 
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
	--[[Translation missing --]]
	--[[ ["GUI_Tactic"] = "",--]] 
	["GUI_Tactics"] = "追踪",
	["GUI_ToggleMinimap"] = "在小地图显示按钮",
	["GUI_Track"] = "追踪",
	["GUI_Tracking"] = "追踪",
	["GUI_TrackingDisabled"] = "成就追踪已停用",
	["GUI_TrackingNumber"] = "当前追踪",
	["Gui_TranslatorNames"] = "萌丶汉丶纸",
	--[[Translation missing --]]
	--[[ ["GUI_Translators"] = "",--]] 
	["GUI_WarlordsOfDraenor"] = "德拉诺之王",
	["GUI_WrathOfTheLichKing"] = "巫妖王之怒",
	--[[Translation missing --]]
	--[[ ["HallsOfValor_Other1"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["HallsOfValor_Other2"] = "",--]] 
	["Instance Achievement Tracker"] = "Instance Achievement Tracker(成就追踪)",
	["Instances_Other"] = "其他",
	["Instances_TrashAfterThirdBoss"] = "第三个BOSS后的集市",
	--[[Translation missing --]]
	--[[ ["KingsRest_DazarTheFirstKing"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_MchimbaTheEmbalmer"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["LostCityOfTheTolVir_Lockmaw"] = "",--]] 
	["Main"] = "主界面",
	--[[Translation missing --]]
	--[[ ["MawOfSouls_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["NeltharionsLair_Naraxas"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["NeltharionsLair_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["ReturnToKarazhan_OperaHall"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["ReturnToKarazhan_ShadeOfMedivh"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["SeatOfTheTriumvirate_Lura"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["SeatOfTheTriumvirate_Saprish"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["SeatOfTheTriumvirate_ZuraalTheAscended"] = "",--]] 
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
	--[[ ["Shared_Found"] = "",--]] 
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
	--[[ ["Shared_JustKillBoss"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBossesTogether"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBossSingleTarget"] = "",--]] 
	["Shared_KillTheAddNow"] = "现在击杀 %s ",
	["Shared_MeetsCritera"] = "满足",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "没有被击中",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "击中玩家",
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoNeedAchievement"] = "",--]] 
	["Shared_PlayersWhoStillNeedToGetHit"] = "仍然需要被击中的玩家:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "以下玩家需要复活才能获得成就:",
	--[[Translation missing --]]
	--[[ ["Shared_ReportString"] = "",--]] 
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
	--[[ ["Shared_WasKilled"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_LordStormsong"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_VolZith"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["SiegeOfBoralus_DreadCaptainLockwood"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["SiegeOfBoralus_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["SiegeOfBoralus_ViqGoth"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_AvatarOfSethraliss"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_Merektha"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_Merektha_LootSnake"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_Trash"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TerraceOfEndlessSpring_DefeatedLast"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["The_Motherlode_CoinOperatedCrowdPummeler"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["The_Motherlode_MogulRazdunk"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Cenarius"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_DragonsOfNightmare"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_EleretheRenferal"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Nythendra"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Ursoc"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Xavius"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_ChronomaticAnomaly"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Elisande"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Guldan"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_HighBotanistTelarn"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Krosus"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Skorpyron"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_StarAugurEtraeus"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Tichondrius"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheUnderrot_ElderLeaxa"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheUnderrot_SporecallerZancha"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheUnderrot_UnboundAbomination"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TolDagor_KnightCaptainValyri"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TolDagor_OverseerKorgus"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_DemonicInquisition"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_FallenAvatar"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_Goroth"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_Harjatan"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_MistressSasszine"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Guarm"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Helya"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Odyn"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Fetid_Devourer_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_GHuun_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_MOTHER_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Mythrax_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Taloc_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Vectis_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZekVoz_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZulReborn_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_AssemblyOfIron1"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_FlameLeviathan1"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_FlameLeviathan2"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_FlameLeviathan3"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_Other1"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_Other2"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["VaultOfTheWardens_AshGolm"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["VaultOfTheWardens_Cordana"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_GorakTul"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_SoulboundGoliath"] = "",--]]
}

core:RegisterLocale('zhCN', baseLocale)

-- core:RegisterLocale('enUS', baseLocale)
