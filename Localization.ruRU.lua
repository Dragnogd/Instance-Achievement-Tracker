

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "- Объявить в чат игроков, у которых отсутствуют достижения на определенных боссов",
	["- Announce to chat tactics for a certain boss"] = "- Объявить тактику в чат для определенного босса",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Следит за достижениями, которые требуют, чтобы вы убили так много мобов в течение определенного периода времени. Он сообщит, когда появилось достаточно мобов и были ли они убиты в течение периода времени.",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Проверяет всех игроков в группе, чтобы увидеть, какие достижения у каждого игрока отсутствуют для текущего подземелья",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Сообщение, когда критерии достижений подземелья провалены и выводят его в чат",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Сообщение, когда критерии достижений подземелья выполнены и выводят его в чат",
	["(Enter instance to start scanning)"] = "(Войдите в подземелье, чтобы начать сканирование)",
	["Atal_Dazar_Yazma"] = "Все игроки, входящие в состав группы, за исключением танка, должны рассредоточиться и оставаться возле одной из жаровен, пока босс будет применять способность %s. Жаровни Пламени Тьмы будут гореть примерно 25 сек. — рекомендуем зажигать жаровни лишь тогда, когда у босса останется от 5 до 10%% здоровья.",
	["AtalDazar_Other"] = "В ходе прохождения подземелья IAT_122969 будет применять к случайному игроку %s способность, обращающую противника в существо на 5 сек. После того, как действие эффекта прекратится, все игроки, находящиеся рядом с этим игроком, также обратятся в это существо. \\n\\nРекомендуем расправиться со всеми противниками в подземелье до начала боя с IAT_122969. Вам придется подводить знахарку к каждому боссу подземелья. Также помогут классы, имеющие способности контроля, действующие в течение долгого периода времени (Монахи с %s, Охотники с %s, Маги с %s). Не позволяйте знахарке освободиться из-под эффектов контроля до того, пока у босса не останется мало здоровья. Если в группе отсутствуют классы, имеющие способности контроля, то сосредоточьте усилия на прерывании применения способности %s в ходе всего боя.",
	["AtalDazar_Priestess_AlunZa"] = "Босс будет призывать дополнительных противников с помощью заклинания %s. Призванный противник будет идти к лужам %s и осушать их. Когда луж не останется, противник начнет атаковать игроков. В этот момент игроки должны применить эффект контроля к нему, чтобы избежать получения дополнительного урона. После осушения 8 луж %s, он обратиться в IAT_131140.",
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
	["Freehold_HarlanSweete"] = "%s нацелится на случайного игрока за %s, который должен будет расположиться рядом с одним из сундуков, чтобы они в конечном итоге были уничтожены.",
	["Freehold_RingOfBooty"] = "Для этого достижения вам нужно будет собрать 3 предмета по всему подземелью. %s появляется в гнезде у первого босса после того, как вы победили его, %s находится на вершине платформы в Ромовом квартале, а %s можно найти около самого попугая (после третьего босса).",
	["Freehold_SkycapNKragg"] = "Чтобы вызвать IAT_138314, вы должны поместить %s, прежде чем атаковать босса.",
	["GUI_Achievement"] = "Достижение",
	["GUI_Achievements"] = "Достижений",
	["GUI_AchievementsCompletedForInstance"] = "Все достижения были завершены",
	["GUI_AchievementsDiscordDescription"] = "Тактика любезно предоставлена Дискорд сервером по достижениям, сообществом, участники которого могут встречаться с единомышленниками и формировать группы для различных достижений.",
	["GUI_AchievementsDiscordTitle"] = "Дискорд Достижений",
	["GUI_AnnounceMessagesToRaidWarning"] = "Отправлять сообщение в чат Оповещения Рейда",
	["GUI_AnnounceTracking"] = "Объявить о достижениях, отслеживаемых в группе",
	--[[Translation missing --]]
	--[[ ["GUI_Author"] = "Author",--]] 
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclysm",
	["GUI_Disabled"] = "Провалено",
	["GUI_EnableAddon"] = "Включить Аддон",
	--[[Translation missing --]]
	--[[ ["GUI_EnableAutomaticCombatLogging"] = "Enable automatic combat logging",--]] 
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
	["Gui_TranslatorNames"] = "Hubbotu",
	--[[Translation missing --]]
	--[[ ["GUI_Translators"] = "Translators",--]] 
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	["Instances_Other"] = "Другой",
	["Instances_TrashAfterThirdBoss"] = "Треш после третьего босса",
	--[[Translation missing --]]
	--[[ ["KingsRest_DazarTheFirstKing"] = "This achievement is obtained at %s, the last boss in the instance. Have two players each stay on top of the stones in front of the two sarcophagi, and the lights will start filling up around the stone. Once they are both lit up, the right sarcophagus will start shaking which means that you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_MchimbaTheEmbalmer"] = "For this achievement you will have to free the player targeted by %s without him using %s more than once, and also free him before the boss finishes casting %s.\\n\\n Note: Players have reported a minor bug with this achievement, and it's recommended that the entombed player does not use %s before the boss casts %s",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_Other"] = "The first trinket is in the first room of the dungeon, behind the sarcophagus, underneath the baskets.\\n The second trinket is in the first boss hallway, at the end of the platform, behind the last set of stairs.\\n The third trinket - (Check out the Glory of the Wartorn Hero Achievement Guide for details on WowHead)\\n The fourth trinket is located before the final boss room, at the bottom of the strairs, at the top of the right pillar.",--]] 
	["Main"] = "Главное Меню",
	["Shared_AddKillCounter"] = "%s счетчик убийств",
	["Shared_CompletedBossKill"] = "будет завершено после убийства босса",
	["Shared_DamageFromAbility"] = "%s урон",
	["Shared_DirectHitFromAbility"] = "%s прямое попадание",
	["Shared_DoesNotMeetCritera"] = "не соответствует критериям для",
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	["Shared_FailedPersonalAchievement"] = "%s провалено %s (причина: %s) (личное достижение)",
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	["Shared_Found"] = "найдено",
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	["Shared_GotHit"] = "получил удар",
	["Shared_HasBeenHitWith"] = "был поражен",
	["Shared_HasBeenInfectedWith"] = "был заражен",
	["Shared_HasCompleted"] = "завершил",
	["Shared_HasFailed"] = "провалил",
	["Shared_HasGained"] = "получил",
	["Shared_HasLost"] = "потерял",
	["Shared_HeCanNowBeKileld"] = "Теперь он может быть убит",
	["Shared_JustKillBoss"] = "На максимальном уровне вы можете просто убить босса, чтобы получить это достижение",
	["Shared_JustKillBossSingleTarget"] = "На максимальном уровне, вы можете просто убить босса при этом вы не должны использовать АОЕ атаки, чтобы получить это достижение",
	["Shared_KillTheAddNow"] = "Убей %s сейчас",
	["Shared_MeetsCritera"] = "соответствует критериям для",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "не получил удар",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "игроки бьют:",
	["Shared_PlayersWhoStillNeedToGetHit"] = "Игроки, которым еще нужно ударить:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "Чтобы получить достижение, необходимо воскресить следующих игроков:",
	--[[Translation missing --]]
	--[[ ["Shared_ReportString"] = "Please report the following string to the IAT author",--]] 
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	["Shared_SheCanNowBeKilled"] = "Теперь она может быть убита",
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	["Shared_WasKilled"] = "был убит",
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_LordStormsong"] = "During the course of the encounter, %s will periodically begin to %s which summons %s that will chase players and attempt to explode upon impact. To obtain this achievement, you must not come into contact with any of the void adds so you will keep kiting them throughout the encounter.",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_Other"] = "The %s is picked up at the start of the dungeon, in the first room. If you receive any frost damage then the spirit flames will be extinguished so it's recommended to first clear all the trash to the third boss, and then pick up the breath. Do not kill the first boss as that will make the breath despawn. Once you light up the shrines to the third boss you will get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["ShrineOfTheStorm_VolZith"] = "To get the %s debuff you will have to dive down in the water before the last boss until you see Void Orbs floating around, and then swim through them. The debuff will make you hostile to all players for 24 seconds, then disappear for 6 seconds time in which your healer must use cds and heal you to full hp. Avoid using aoe spells on the boss, and instead use self heals as much as possible to help your healer out.\\n\\n After %s casts %s, you will get teleported into the sunken realm where you should quickly kill the adds and then wait 20-30 seconds for cooldowns to be available. %s will also cast %s, and you will have to crowd control 5 %s adds so that they won't reach the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Fetid_Devourer_Tactics"] = "Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\\n\\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%% (%s)\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_GHuun_Tactics"] = "For this achievement you will have to make groups of 3 people to do the %s: 2 dps + 1 healer assisting them.\\n\\n If you have a smaller group then you should invite a few more people to help out with killing the adds",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_MOTHER_Tactics"] = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\\n\\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",--]] 
	["Uldir_Mythrax_Tactics"] = "По состоянию на ноябрь 2018 года: теперь достижение функционирует так, как описано.\\n\\n Это значительно облегчает достижение, поскольку вы просто подбираете свои шары.",
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
