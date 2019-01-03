

local _, core = ...
local baseLocale = {
    ["- Announce to chat players who are missing achievements for certain bosses"] = "- Объявить в чат игроков, у которых отсутствуют достижения на определенных боссов",
	["- Announce to chat tactics for a certain boss"] = "- Объявить тактику в чат для определенного босса",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Следит за достижениями, которые требуют, чтобы вы убили так много мобов в течение определенного периода времени. Он сообщит, когда появилось достаточно мобов и были ли они убиты в течение периода времени.",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Проверяет всех игроков в группе, чтобы увидеть, какие достижения у каждого игрока отсутствуют для текущего подземелья",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Сообщение, когда критерии достижений подземелья провалены и выводят его в чат",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Сообщение, когда критерии достижений подземелья выполнены и выводят его в чат",
	["(Enter instance to start scanning)"] = "(Войдите в подземелье, чтобы начать сканирование)",
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \\n\\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",--]] 
	["Core_AchievementScanFinished"] = "Сканирование достижений завершено",
	["Core_AchievementTrackingEnabledFor"] = "Отслеживание достижений включено для",
	["Core_CommandEnableTracking"] = "включить/отключить отслеживание достижений аддоном IAT",
	["Core_Commands"] = "Список команд",
	["Core_Counter"] = "Счетчик",
	["Core_CriteriaMet"] = "Критерии были выполнены. Босс теперь может быть убит!",
	["Core_Enable"] = "включить",
	["Core_EnableAchievementTracking"] = "Вы хотите включить отслеживание достижений для",
	["Core_Failed"] = "НЕ УДАЛОСЬ!",
	["Core_GameFreezeWarning"] = "Это может зафризить вашу игру на несколько секунд",
	["Core_help"] = "помощь",
	["Core_ListCommands"] = "показывает список доступных команд",
	["Core_No"] = "Нет",
	["Core_NoTrackingForInstance"] = "Аддон IAT не может отслеживать какие-либо достижения для этой битвы",
	["Core_PersonalAchievement"] = "Личное Достижение",
	["Core_Reason"] = "Причина",
	["Core_StartingAchievementScan"] = "Запуск сканирования достижений для",
	["Core_TrackAchievements"] = "Отслеживать Достижения",
	["Core_Yes"] = "Да",
	["Features"] = "Возможности",
	--[[Translation missing --]]
	--[[ ["Freehold_SkycapNKragg"] = "To summon IAT_138314 you have to place a %s before you pull the boss.",--]] 
	["GUI_Achievement"] = "Достижение",
	["GUI_Achievements"] = "Достижений",
	["GUI_AchievementsCompletedForInstance"] = "Все достижения были завершены",
	["GUI_AchievementsDiscordDescription"] = "Тактика любезно предоставлена Дискорд сервером по достижениям, сообществом, участники которого могут встречаться с единомышленниками и формировать группы для различных достижений.",
	["GUI_AchievementsDiscordTitle"] = "Дискорд Достижений",
	["GUI_AnnounceMessagesToRaidWarning"] = "Отправлять сообщение в чат Рейд Оповещения",
	["GUI_AnnounceTracking"] = "Объявить о достижениях, отслеживаемых в группе",
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclysm",
	["GUI_Disabled"] = "Провалено",
	["GUI_EnableAddon"] = "Включить Аддон",
	["GUI_Enabled"] = "Включено",
	["GUI_EnterInstanceToStartScanning"] = "Войдите в подземелье, чтобы начать сканирование",
	["GUI_GreyOutCompletedAchievements"] = "Серый цвет завершенных достижений",
	["GUI_HideCompletedAchievements"] = "Скрыть выполненные достижения",
	["GUI_Legion"] = "Legion",
	["GUI_MinimapDisabled"] = "Значок у мини-карты отключен",
	["GUI_MinimapEnabled"] = "Значок у мини-карты включен",
	["GUI_MistsOfPandaria"] = "Mists of Pandaria",
	["GUI_NoPlayersNeedAchievement"] = "Ни одному игроку в группе не нужно это достижение",
	["GUI_OnlyDisplayMissingAchievements"] = "Отображать только невыполненные достижения",
	["GUI_OnlyTrackMissingAchievements"] = "Только отслеживать невыполненные достижения",
	["GUI_Options"] = "Настройки",
	["GUI_OutputPlayers"] = "Показать Достижение",
	["GUI_OutputTactics"] = "Показать Тактику",
	["GUI_Players"] = "Игроки",
	["GUI_PlayersWhoNeedAchievement"] = "Игроки, которые нуждаются в достижении",
	["GUI_PlaySoundOnFailed"] = "Воспроизведение звука при провале достижения",
	["GUI_PlaySoundOnSuccess"] = "Воспроизвести звук, когда достижение завершено",
	["GUI_ScanInProgress"] = "сканирование продолжается",
	["GUI_SelectSound"] = "Выберите Звук",
	["GUI_Tactics"] = "Тактика",
	["GUI_ToggleMinimap"] = "Показывать кнопку на Миникарте",
	["GUI_Track"] = "Следить",
	["GUI_Tracking"] = "Отслеживание",
	["GUI_TrackingDisabled"] = "(Отслеживание достижений отключено)",
	["GUI_TrackingNumber"] = "В настоящее время отслеживается",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	--[[Translation missing --]]
	--[[ ["Instances_Other"] = "Other",--]] 
	--[[Translation missing --]]
	--[[ ["Instances_TrashAfterThirdBoss"] = "Trash after the third boss",--]] 
	["Main"] = "Главное Меню",
	--[[Translation missing --]]
	--[[ ["Shared_AddKillCounter"] = "%s kill counter",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_CompletedBossKill"] = "will be completed once boss is killed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_DamageFromAbility"] = "%s Damage",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_DirectHitFromAbility"] = "%s Direct Hit",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_DoesNotMeetCritera"] = "does not meet the critera for",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Eight"] = "8",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Eighteen"] = "18",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Eleven"] = "11",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_FailedPersonalAchievement"] = "%s has failed %s (Reason: %s)(Personal Achievement)",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Fifteen"] = "15",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Five"] = "5",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Found"] = "found",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Four"] = "4",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Fourteen"] = "14",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_GotHit"] = "got hit",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasBeenHitWith"] = "has been hit with",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasBeenInfectedWith"] = "has been infected with",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasCompleted"] = "has completed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasFailed"] = "has failed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasGained"] = "has gained",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasLost"] = "has lost",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HeCanNowBeKileld"] = "He can now be killed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBoss"] = "At max level, you can simply just kill the boss to get this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBossSingleTarget"] = "At max level, you can simply just kill the boss with single target abilities to get this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_KillTheAddNow"] = "Kill the %s now",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_MeetsCritera"] = "meets the criteria for",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Nine"] = "9",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Nineteen"] = "19",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_NotHit"] = "did not get hit",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_One"] = "1",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_PlayersHit"] = "players hit:",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoStillNeedToGetHit"] = "Players who still need to get hit:",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoStillNeedToGetResurrected"] = "The following players need to be resurrected in order to receive the achievement:",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Seven"] = "7",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Seventeen"] = "17",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_SheCanNowBeKilled"] = "She can now be killed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Six"] = "6",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Sixteen"] = "16",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Ten"] = "10",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Thirteen"] = "13",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Three"] = "3",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Twelve"] = "12",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Twenty"] = "20",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_Two"] = "2",--]] 
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

core:RegisterLocale('ruRU', baseLocale)
