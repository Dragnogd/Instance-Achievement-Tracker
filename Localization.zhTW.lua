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
	["GUI_AchievementsCompletedForInstance"] = "所有成就都已經完成",
	["GUI_AchievementsDiscordDescription"] = "戰術是由 Achievements Discord 伺服器慷慨大方的提供，在這個社群中可以遇到相同的成就控，相約一起組隊解各式各樣的成就。",
	["GUI_AchievementsDiscordTitle"] = "Achievements Discord",
	["GUI_AnnounceMessagesToRaidWarning"] = "通報到團隊警告 (可用時)",
	["GUI_AnnounceTracking"] = "通報隊伍開始追蹤成就",
	["GUI_Author"] = "作者",
	["GUI_BattleForAzeroth"] = "決戰艾澤拉斯",
	["GUI_Cataclysm"] = "浩劫與重生",
	["GUI_Disabled"] = "已停用",
	["GUI_DisplayInfoFrame"] = "啟用資訊框",
	["GUI_EnableAddon"] = "啟用插件",
	["GUI_EnableAutomaticCombatLogging"] = "啟用自動戰鬥記錄",
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
	["GUI_Tactic"] = "戰術",
	["GUI_Tactics"] = "戰術",
	["GUI_ToggleMinimap"] = "顯示小地圖按鈕",
	["GUI_Track"] = "追蹤",
	["GUI_Tracking"] = "正在追蹤",
	["GUI_TrackingDisabled"] = "(成就追蹤已停用)",
	["GUI_TrackingNumber"] = "目前追蹤",
	["Gui_TranslatorNames"] = "gaspy10",
	["GUI_Translators"] = "翻譯",
	["GUI_WarlordsOfDraenor"] = "德拉諾之霸",
	["GUI_WrathOfTheLichKing"] = "巫妖王之怒",
	--[[Translation missing --]]
	--[[ ["HallsOfValor_Other1"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["HallsOfValor_Other2"] = "",--]] 
	["Instance Achievement Tracker"] = "副本成就追蹤",
	["Instances_Other"] = "其他",
	["Instances_TrashAfterThirdBoss"] = "第三個首領之後的垃圾",
	--[[Translation missing --]]
	--[[ ["KingsRest_DazarTheFirstKing"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_MchimbaTheEmbalmer"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_Other"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["LostCityOfTheTolVir_Lockmaw"] = "",--]] 
	["Main"] = "一般",
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
	["Shared_Found"] = "已發現",
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
	["Shared_JustKillBossesTogether"] = "滿等時，只要同時擊殺首領就可獲得這個成就。",
	["Shared_JustKillBossSingleTarget"] = "滿等時，只需要直接使用單體技能擊殺首領即可得到這個成就。",
	["Shared_KillTheAddNow"] = "現在擊殺 %s",
	["Shared_MeetsCritera"] = "達成條件",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "沒有擊中",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "玩家擊中:",
	["Shared_PlayersWhoNeedAchievement"] = "需要成就的玩家",
	["Shared_PlayersWhoStillNeedToGetHit"] = "仍需要擊中的玩家:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "這些玩家需要被復活才能獲得成就:",
	["Shared_ReportString"] = "請將下列的文字訊息回報給副本成就追蹤插件的作者",
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
	["Shared_WasKilled"] = "已擊殺",
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

core:RegisterLocale('zhTW', baseLocale)

-- core:RegisterLocale('enUS', baseLocale)