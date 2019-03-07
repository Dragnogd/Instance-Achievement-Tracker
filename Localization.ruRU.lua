if(GetLocale() ~= 'ruRU') then return end

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
	["AtalDazar_Other"] = "В ходе прохождения подземелья IAT_122969 будет применять к случайному игроку %s способность, обращающую противника в существо на 5 сек. После того, как действие эффекта прекратится, все игроки, находящиеся рядом с этим игроком, также обратятся в это существо. \n\n Рекомендуем расправиться со всеми противниками в подземелье до начала боя с IAT_122969. Вам придется подводить знахарку к каждому боссу подземелья. Также помогут классы, имеющие способности контроля, действующие в течение долгого периода времени (Монахи с %s, Охотники с %s, Маги с %s). Не позволяйте знахарке освободиться из-под эффектов контроля до того, пока у босса не останется мало здоровья. Если в группе отсутствуют классы, имеющие способности контроля, то сосредоточьте усилия на прерывании применения способности %s в ходе всего боя.",
	["AtalDazar_Priestess_AlunZa"] = "Босс будет призывать дополнительных противников с помощью заклинания %s. Призванный противник будет идти к лужам %s и осушать их. Когда луж не останется, противник начнет атаковать игроков. В этот момент игроки должны применить эффект контроля к нему, чтобы избежать получения дополнительного урона. После осушения 8 луж %s, он обратиться в IAT_131140.",
	["BattleOfDazaralor_ChampionOfTheLight"] = "Для этого достижения вам нужно украсть по 3 блестяшки у каждого из врагов в сражении и доставить их к Загадочной кучи мусора. Вам нужно будет украсть 9 блестяшек в общей сложности: 3 из %s/%s, 3 из %s/%s и 3 из %s/%s\n\n Кроме того, для этого достижения требуется, чтобы все участники рейда взаимодействовали с Загадочной кучей мусора для получения дебаффа %s. Во время битвы с боссами игроки превратятся в %s и получат дополнительную кнопку действия, чтобы использовать на противников для кражи одной блестяшки.\n\n Как только ваша рейд-группа сдаст 9 блестяшек (по 3 от каждого типа НПС) Вы можете убить босса и получить достижение.",
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ConclaveOfTheChosen"] = "To get this achievement you will need to leave one of the three initial raptors alive until the end of the fight. You can kill the rest, but since you can’t CC them, you will need to kite one for the entire duration of the fight.\n\n A different player will get fixated by the %s every 20 seconds (%s), so you will need to make sure that the player kites it away from the raid to avoid any AoE damage.\n\n One or two Death Knights may be useful on this fight since they can %s the raptor away from the raid.",--]] 
	["BattleOfDazaralor_Grong"] = "Для этого достижения вам нужно будет найти и отнести 6 бочек и установить их возле %s перед началом боя. Вы можете найти %s внизу лестницы, прежде чем подняться в зону босса.\n\n Поместите %s возле босса, а только затем атакуйте его и убедитесь, что бочки ломаются от %s (версия для Орды) или от %s (версия для Альянса).\n\n Как только %s будет уничтожена, босс получит 20%% положительный эффект увеличения урона в течение 30 секунд за каждую уничтоженную бочку (%s). Как только все бочки будут уничтожены, добейте его, и вы получите достижение.",
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_HighTinkerMekkatorque"] = "To complete this achievement you will need an engineer with %s and %s.\n\n Summon the two Blingtrons before starting the fight and they will start dueling. Shortly after the boss is engaged, the %s will spawn. It’s easy to kill, so defeat it and then finish the boss fight and you should get the achievement.\n\n %s has two abilities:\n %s - 8 yards AoE ability around the npc, move away if you're melee.\n %s - Chain Lightning, stay spread or interrupt the cast.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JadefireMasters"] = "For this achievement you will have to pick up the hidden %s in the boss arena, protect it from fire sources and have the Monk cast %s on it.\n\n You should pick up the egg after the first set of %s has been dealt with, this way you don't risk of losing the egg to %s. Make sure to pick it up before phase 2 starts, as %s will break it. \n\n The Monk will transform into a %s at 100 energy. After %s hits the player holding the egg, you can kill the boss to get the achievement.\n\n The locations of the %s are different for Horde and Alliance.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JainaProudmoore"] = "To complete this achievement you will first need 3 players to collect snow mounds during the fight against %s.\n\n The snow mounds can only be found during the first intermission. The snow mounds will be evenly spread around the circular area so you will need at least 3 players on a fast class to start running as soon as the phase starts.\n\n Walk through a snow mound and a little snowflake will appear next to your characters. Once all 3 have been found, interrupt the boss to enter the next phase. The players who have the snowflake should stack near one of the barrels to create the %s.\n\n Use %s to remove the %s from the barrel next to the %s, and then attack the barrel. The explosion will cause the %s to melt, which completed the criteria for this achievement.",--]] 
	["BattleOfDazaralor_KingRastakhan"] = "Чтобы сделать это достижение, вам нужно будет оставить в живых Духов до конца боя. Просто держите их подальше от рейда, чтобы избежать ненужного урона. \n\n Третий танк идеально подходит для этого достижения",
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Opulence"] = "To get this achievement you will first have to make sure that at least one player has the %s pet.\n\n The achievement is personal, and requires the player to use a /praise command on a %s pet, while under the effect of a %s. The pet doesn’t need to be your own.\n\n To get under the %s, one or more players should pick up %s. This jewel will grant the player a stack of %s while they are stood alone. Upon reaching 100 stacks, they will gain the %s aura for 20 seconds, granting the player and all nearby players %s, increasing critical strike chance by 100%%. The buff will take about 100 seconds to appear, and once it's active /praise the %s pet to get credit for this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_StormwallBlockade"] = "To complete this achievement you will need to summon %s during the boss fight. You don’t need to defeat %s.\n\n To summon %s you need to click on a fish pool to the left of the docks after the boss has been engaged. Ideally you want only one player staying behind on the docks to summon it. That player will have to deal with a few mechanics for 2 minutes.\n\n -After clicking on the pool, the player will start pulling a rope out of the water, and they will start to slowly get pulled towards the water. Walk in the opposite direction to stay on the docks, but don’t walk too far away from the edge or the rope will break.\n -Shortly after, %s will start falling on the player, who will have to dodge them to stay alive.\n -After that, waves will come crashing onto the docks, and the player pulling the rope will have to dodge them.\n\n This will go on until the 2-minute rope-pulling cast finishes. The rest of the raid need to perform the boss fight as usual.\n\n Once %s spawned, the summoning player and later the raid will have to deal with its two abilities alongside the normal boss abilities:\n %s - A frontal cone that will push anyone away, shooting them into the water\n %s - Pulls all the players towards %s, instantly killing those who get too close.\n\n To deal with %s, you will need an outlaw rogue solely focusing on stunning it every time it casts %s. If you don't have a rogue, then you'll have to make a cc rotation. The rest of the raid will need to kill the boss before the enrage, while dealing with %s on top of the mechanics.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_BarrelsDestroyed"] = "barrels destroyed",--]] 
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
	["Freehold_HarlanSweete"] = "%s нацеливает на случайного игрока %s, этот игрок должен будет расположиться рядом с одним из сундуков, чтобы они в конечном итоге были уничтожены.",
	["Freehold_RingOfBooty"] = "Для этого достижения вам нужно будет собрать 3 предмета по всему подземелью. %s появляется в гнезде у первого босса после того, как вы победили его, %s находится на вершине платформы в Ромовом квартале, а %s можно после убийства третьего босса.",
	["Freehold_SkycapNKragg"] = "Чтобы вызвать IAT_138314, вы должны разместить %s, прежде чем атаковать босса.",
	["GUI_Achievement"] = "Достижение",
	["GUI_Achievements"] = "Достижений",
	["GUI_AchievementsCompletedForInstance"] = "Все достижения были завершены",
	["GUI_AchievementsDiscordDescription"] = "Тактика любезно предоставлена Дискорд сервером по достижениям, сообществом, участники которого могут встречаться с единомышленниками и формировать группы для различных достижений.",
	["GUI_AchievementsDiscordTitle"] = "Дискорд Достижений",
	["GUI_AnnounceMessagesToRaidWarning"] = "Отправлять сообщение в чат Оповещение Рейда",
	["GUI_AnnounceTracking"] = "Объявить о достижениях, отслеживаемых в группе",
	["GUI_Author"] = "Автор",
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclysm",
	["GUI_Disabled"] = "Провалено",
	["GUI_EnableAddon"] = "Включить Аддон",
	["GUI_EnableAutomaticCombatLogging"] = "Включить автоматическое ведение журнала боя",
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
	["Gui_TranslatorNames"] = "Хоргул-Гордунни",
	["GUI_Translators"] = "Перевод на Русский язык",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	["Instances_Other"] = "Общее",
	["Instances_TrashAfterThirdBoss"] = "Треш после третьего босса",
	["KingsRest_DazarTheFirstKing"] = "Это достижение можно получить во время сражения с %s последним боссом подземелья. Два игрока должны встать на камни, стоящих напротив двух саркофагов, после чего вокруг камней появятся огоньки. После того, как все огоньки загорятся, саркофаг, расположенный с правой стороны, начнет трястись. Это означает, что вы можете убить босса.",
	["KingsRest_MchimbaTheEmbalmer"] = "Для этого достижения вам нужно будет освободить игрока, на которого нацелено %s для этого использовать %s нельзя более одного раза. А также, вы должны освободить игрока до того, как босс завершит применение способности %s.\n\n Примечание: игроки сообщают, что столкнулись с небольшой ошибкой при выполнении достижения. Застрявшему игроку не рекомендуется использовать %s до того как босс применил %s.",
	["KingsRest_Other"] = "Первое украшение можно найти в первой комнате подземелья, позади саркофагов за корзинами.\n Второе украшение можно найти в пролете по пути к первому боссу, за лестницами, расположенными в конце платформы.\n Местоположение третьего украшения и его получения (смотрите гайд на WowHead)\n Четвертое украшение можно найти у входа в помещение с заключительным боссом, на вершине правой колонны.",
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
	["Shared_PlayersWhoNeedAchievement"] = "Игроки, которым нужно достижение",
	["Shared_PlayersWhoStillNeedToGetHit"] = "Игроки, которым еще нужно ударить:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "Чтобы получить достижение, необходимо воскресить следующих игроков:",
	["Shared_ReportString"] = "Пожалуйста, сообщите следующую строку автору IAT",
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
	["ShrineOfTheStorm_LordStormsong"] = "Во время боя с %s он будет периодически призывать %s используя заклинание %s, они будут преследовать игрока и пытаться взорваться после соприкосновения с ним. Для получения этого достижения вы не должны коснутся этих созданий, и кайтить их в течение всего боя.",
	["ShrineOfTheStorm_Other"] = "Найти %s можно в первой комнате, после начала прохождения подземелья. Если вы получите урон от магии льда, то огонь духов погаснет. Рекомендуется предварительно очистить путь до третьего босса от всех противников, после чего подобрать огонь. Не убивайте первого босса — в противном случае огонь пропадет и более не появится. Вы получите достижение после того, как огни у третьего босса будут зажжены.",
	["ShrineOfTheStorm_VolZith"] = "Чтобы получить дебафф %s вы должны нырнуть в воду перед последним боссом и доплыть до той глубины, на которой появляются Сферы Пустоты, и проплыть через них. Дебафф сделает вас враждебным ко всем игрокам в течение 24 сек., после чего эффект будет снят на 6 сек., в течение которых лекарь должен использовать мощные заклинания исцеления и восстановить вам полный запас здоровья. Избегайте использования урона по области во время боя с боссом, и используйте способности самоисцеления, чтобы помочь лекарю.\n\n После того как %s произнесет %s, вас переместят в затонувший мир. Ваша задача заключается в быстром убийстве противников. Выждите 20-30 сек., чтобы мощные способности успели восстановиться. Также %s применит %s. Применяйте эффекты контроля к пяти %s, и не позволить им дойти до босса.",
	["SiegeOfBoralus_DreadCaptainLockwood"] = "%s будет пытаться убежать от игроков с помощью используя %s используйте эффекты обездвиживания, чтобы не дать ей этого сделать. Как следует из описания достижения, вы должны не допустить использования боссом %s.",
	["SiegeOfBoralus_Other"] = "Как видно из названия достижения, это профессиональное достижение, где вы можете взаимодействовать с предметами, чтобы вызывать боссов. Чтобы использовать предметы в подземельях, требуется минимальный уровень навыка 75.\n\n (Кузнечное Дело) %s - молот можно найти у лестниц, ведущих в доки по координатам 58, 70.\n (Инженерное дело) %s - НПС может быть найден у входа в подземелье.\n (Алхимия) %s - флакон может быть найден у стола по координатам 54, 74. ",
	["SiegeOfBoralus_ViqGoth"] = "Во время сражения с %s будет использовать %s обливая область поражения тухлой водой. Во время этого на землю будет выброшено несколько %s которые вам придется отбросить назад в воду, прежде чем победить босса.",
	["TempleOfSethraliss_AvatarOfSethraliss"] = "Для этого достижения вам придется использовать эмоцию /поцелуй на %s, пока один из них не превратится в 'принца', похожего на %s. 'Принц' не может умереть, вы можете свободно использовать способности, наносящие урон по области.",
	["TempleOfSethraliss_Merektha"] = "Чтобы увидеть %s, который скрыт поверх костей, вы должны будете использовать %s, %s, %s или другие способности, наносящие урон земле. Чтобы заставить яйцо треснуть, расставьте лекаря и бойцов под боссом и дождитесь применения способности %s. Как только появится %s, вы можете убить его, а затем щелкнуть по нему, чтобы получить бафф %s, который и дает вам достижение.\n\n Примечание: %s может оказаться невосприимчивым к атакам, но через несколько секунд он телепортируется на землю. Если в вашей группе есть Рыцарь смерти, вы должны использовать %s на %s, что не только обойдет эту ошибку, но и облегчит позиционирование.",
	["TempleOfSethraliss_Merektha_LootSnake"] = "Получите %s сейчас, чтобы завершить достижение",
	["TempleOfSethraliss_Trash"] = "Для этого достижения вы должны использовать способности класса, чтобы контролировать %s, когда вы приблизите оба глаза. Обратите внимание, что по всей комнате есть несколько %s, которые попытаются украсть ваш глаз, по одному возле каждого глаза, один между глазами и черепом, и еще несколько в середине комнаты.\n\n Такие способности, как %s, %s и %s, являются идеальными, вы можете наложить на стражей, расположенных в одной из сторон комнаты, эффекты контроля, после чего полностью забыть о их существовании.",
	["The_Motherlode_CoinOperatedCrowdPummeler"] = "Поднимите %s перед боссом и бросьте его в %s после того, как вы начнете сражение с боссом. %s будет использовать %s на протяжении всего боя, поэтому вы должны прервать заклинание и убить его, а также убивайте его подручных как можно скорее, поскольку они бросают грог, заставляя вас опьянеть на 10 секунд.",
	["The_Motherlode_MogulRazdunk"] = "Это личное достижение, которое требует от вас уклонения от большей части разрушительных механик боя с боссом.",
	["TheEmeraldNightmare_Cenarius"] = "На максимальном уровне, с достаточным количеством дпс, вы можете убить босса до того, как вы очистите %s.",
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_DragonsOfNightmare"] = "There are 4 portals around the boss room. Everyone in the group must go into each of the 4 portals and collect 1 mist from each portal which gives them a buff. Once all players in the group have 4 buffs %s %s %s %s you can kill the boss. You will need to leave atleast one player out at the start of the fight to tank the bosses while everyone else is collecting mists.",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_EleretheRenferal"] = "For this achievement, there are 7 eggs with a glowing red effect located around the room. To complete this achievement all 7 eggs need to be destroyed by running over them. Some of the eggs can only be reached by using %s or players using effects such as %s, %s or %s. Once all 7 eggs have been destroyed you can kill the boss.\n\n Note: If you cannot see any of the eggs, they will respawn after you have engaged the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "Wait for 20 %s to spawn by killing the tentacles that spawn. Once you have 20 %s alive, everyone in the group will need to stand in front of the eye, then AOE down all the adds together. Once 20 adds have been killed in 10 seconds on top of the eye, you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Nythendra"] = "During the %s phase, %s will spawn around the edges of the room. Once they spawn players need to click on the bugs to squish them. Once 15 bugs have been squished you can kill the boss. 5 bugs spawn each phase so you will need a minimum of 3 %s phases to complete this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Ursoc"] = "Kill the trash to the right hand side just outside the entrance to the cave where the boss is located. Free %s and wait for him to reach the boss. Kill the boss while keeping %s alive to get this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Xavius"] = "To complete this achievement, you will need a Demon Hunter to use his %s ability. Around the outer edges of the boss room, a %s will spawn at 3 points during the fight. The Demon Hunter will need to use his %s ability to find the add and drag it into the centre of the room. The adds spawn at 100-65%%, 65%%-30%% and below 30%%. Once all 3 %s have been killed, you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_ChronomaticAnomaly"] = "This achievement is easier to complete in heroic mode. Random players will get a %s debuff. These players need to stand on the blue circles around the boss room until the %s debuff expires. Once it expires you will see a spotlight appear at the location the %s exploded at. Once at least 8 circles around the room have spotlights, you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Elisande"] = "For this achievement you will need to summon a %s pet before pulling the boss.\n\n You then to wait for the %s and %s to spawn, then kill both of the adds on top of one another. Next drag the %s pet into the overlapping bubbles created from the elementals dying. This will spawn allow the %s to be killed. Once the add is dead you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Guldan"] = "During phase 2, group up and wait for %s to spawn. The eyes will %s themselves over time spawning more and more eyes. Once 16 %s have spawned, kill them within 3 seconds of one another then kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_HighBotanistTelarn"] = "Scattered around the boss area are Mysterious Fruits. To complete this achievement every player needs to eat one of these fruits before pulling the boss and must not die during the encounter. The mysterious fruit will give the player the %s debuff. At max level you can simply nuke down the boss.\n\n Note: You must have at least 10 players minimum to complete this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Krosus"] = "To complete this achievement, you must let 15 %s fall in the water when the bridge breaks. At max level you can simply not soak any of the %s to maximise the amount of %s falling into the water.\n\n Note: The amount of %s that spawn increases with more players in the group.",--]] 
	["TheNighthold_Skorpyron"] = "На максимальном уровне пусть вся ваша группа встанет в круг в центре комнаты и убьет босса, прежде чем он использует %s.",
	--[[Translation missing --]]
	--[[ ["TheNighthold_StarAugurEtraeus"] = "For this achievement, you will need to drag the %s add in the %s boss room up to %s.\n\n You then need to dps the boss down to 30%% without damaging the add. The add will then transform into a %s at which point you can kill the add and then kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Tichondrius"] = "At max level, you can simply kill the boss before he casts %s.\n\n Note: This achievement is a personal achievement.",--]] 
	["TheUnderrot_ElderLeaxa"] = "%s применяет способность %s к игрокам всякий раз, когда они получают урон от заклинаний. Это означает, что все ее способности должны быть прерваны и избегать попадания под их действие, чтобы предотвратить этот дебафф.\n\n Чтобы упростить достижение, вы можете заставить своего целителя стать дд, чтобы у вас было дополнительное прерывание, а также убить ее быстрее.",
	["TheUnderrot_SporecallerZancha"] = "%s находится в верхнем левом углу комнаты. Чтобы сделать его активным, вы должны заставить босса использовать %s в его направлении.\n\n Примечание: Если %s невосприимчив к атакам, просто зайдите в середину комнаты, и он вскоре телепортируется туда.",
	["TheUnderrot_UnboundAbomination"] = "Лужи %s иногда объединяются в %s, и преследовать случайного игрока.. Вам нужно будет убить босса, не позволив погибнуть ни одной %s, этого легко добиться, просто кайтя их по комнате по кругу.\n\n Используйте эффекты контроля, чтобы замедлить споры. Не забудьте удостовериться в том, что выбранные таланты, надетые аксессуары и активные азеритовые особенности случайно не убьют споры.",
	["TolDagor_KnightCaptainValyri"] = "Для получения этого достижения танку следует держать босса в центре комнаты, а остальные 4 участников должны перемещать бочки ближе к %s. Нельзя допустить, чтобы бочонок попал под действие огня:\n %s - это способность применяется под ногами игроков вам нужно просто оттащить бочку в сторону.\n Когда %s применяет %s вам нужно будет оттащить бочку от того места, в которое смотрит босс.\n %s - Когда игрок получает этот дебафф то ему следует немедленно отойти от бочек и дождаться развеивания эффекта.",
	["TolDagor_OverseerKorgus"] = "Вскоре после начала боя, %s выпустит в каждого игрока пулю с %s, что повлечет за собой получение дебаффа %s. Каждый раз, когда игрок перемещает, его эффекты усиливаются и в конечном итоге приводят к тому, что игрок оглушается на 8 секунд. Вы должны попасть под действие яда в составе всей группы в начале боя.",
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_DemonicInquisition"] = "Dps the boss down to around 20%%. Now whenever %s reaches one hundred energy he will cast %s, so everyone in the raid should attack him to get max torment really fast.\n\n Once everyone in the group has max torment you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_Goroth"] = "For this achievement have your ranged dps and healers stack up together so that %s spawns the %s in a straight line pointed towards him. Once someone is marked by %s they will have to go behind the pillars so that the star collides with the %s and destroys them.\n\n Once 30 %s have been destroyed you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_Harjatan"] = "To spawn %s someone in the raid has to use the %s toy.\n\n Use the toy at the start of the fight, focus %s, and after he dies you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_MistressSasszine"] = "To complete this achievement, you need to feed each of the items below into %s %s during Phase 2 (70%%) of the encounter.\n\n 'Hydra Essence' comes from a player being hit by %s in the outer circle of the %s.\n 'Ink Sauce' comes from a player soaking the %s patch which has to come in contact with the outer circle of the %s.\n 'Player Seasoning' comes from a player dying in the inner circle of %s.\n 'Eel Tartare' comes from the %s being sucked into the outer circle of the %s.\n 'Murloc Fillet' comes from the %s being sucked into the outer circle of the %s.\n\n Note: The %s and the %s need to be around 10%% health before they can be sucked into the %s. The %s only spawns during phase 1 so do not push the boss to phase 2 till at least 1 of those adds have spawned.",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Guarm"] = "For this achievement, a player will need to pick up %s next to the boss at the start of the fight. This bone will need to be dragged into each of the 3 breaths cast by the boss (%s, %s, %s).\n\n Note: Do not do any of the following while holding the bone or you will drop it.\n Do not cast any spells.\n Do not get hit by %s.\n Dying while holding the bone.\n\n You will need a separate player to soak each of the breaths. Therefore once one player has soaked a breath, they will need to drop the bone so another player can pick it up. Once all 3 breaths have been soaked while holding the chew toy you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Helya"] = "At max level, this achievement is easier to complete solo. Simply kill the boss without having the %s debuff. This can be done by making sure the %s add is killed before killing the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Odyn"] = "For this achievement you will need to reach phase 2 by killing %s and %s. Next you will need to wait for the boss to cast %s, at which point the runes on the floor will light up and adds will spawn with the corresponding runes above their heads. You will need to remember the order the runes lite up on the floor and then kill the corresponding adds on the matching runes in that order.\n\n Once the requirements of the achievement have been met you will gain %s which means you can kill the boss.",--]] 
	["Uldir_Fetid_Devourer_Tactics"] = "Во время каждой четвёртой атаки босс применяет %s к игроку, стоящему ближе всего к текущему танку, который наносит урон равный 300%% по сравнению от обычной атаки.\n\n Каждый игрок должен получить этот удар, рекомендуется использовать персональную защиту. Бой довольно прост но вы должны учесть, что на 50%% наступает (%s) и босс впадает в бешенство.",
	["Uldir_GHuun_Tactics"] = "Для этого достижения вам нужно создать группы из трех игроков для перетаскивания %s: 2 бойца +1 целитель.\n\n Если в вашей группе недостаточно игроков пригласите еще несколько человек которые помогу в убийстве аддов.",
	["Uldir_MOTHER_Tactics"] = "Чтобы ввести 'код доступа', вам нужно будет нажимать кнопки в каждой комнате в определенном порядке, который рандомизирован для каждой группы. Порядок может быть 321, 213, 231 или аналогичными комбинациями.\n\n Проверьте, перестали ли мигать кнопки в первой комнате, а затем отправьте группу из 2-3 человек вместе с целителем, чтобы они нажимали на кнопки во второй и третьей комнате. Если кнопки нажимаются в правильной последовательности, они перестанут мигать и больше не будут нажиматься. Как только вы это сделаете, вы можете убить босса и получить достижение.",
	["Uldir_Mythrax_Tactics"] = "По состоянию на ноябрь 2018 года: теперь достижение функционирует так, как описано.\n\nЭто значительно облегчает достижение, поскольку вы просто подбираете свои шары.",
	["Uldir_Taloc_Tactics"] = "Для этого достижения вам нужно будет собрать 4 %s, пока Лифт опускается на 2 фазе.\n\n Позиции сфер кажутся случайными, однако Охотник на Демонов может легко получить их все, используя %s и %s.",
	["Uldir_Vectis_Tactics"] = "IAT_142148 находится внизу платформы прямо перед входом к IAT_134442.\n\n После того, как вы получите на нее дебафф %s (для этого нужно завести ее в лужу), вы можете безопасно убить ее, затем убить босса, и вы получите достижение.\",",
	["Uldir_ZekVoz_Tactics"] = "Это достижение довольно простое, однако вы должны использовать IAT_64482 после того, как IAT_135129 исчезнет в фазе 2. Головоломка активируется при следующем появлении IAT_135129 (во второй раз), это поможет лекарям с сохранением маны и облегчит задачу по исцелению рейда, поскольку вам не придется тратить еще одну минуту на одну из механик сражения.\n\n %s наносят урон от 25k до 35k урона, старайтесь не попадать под область поражения, чтобы облегчить жизнь целителям.",
	["Uldir_ZulReborn_Tactics"] = "Это достижение довольно простое, никто не должен наступать на внутреннее кольцо платформы. Вот несколько советов для этого боя:\n\n Танки должны отвлечь на себя всех аддов и собрать их в одном месте, дав возможность бойцам ближнего боя наносить урон.\n Бойцы дальнего боя должны вести сражение только с боссом.\n Если в вашей группе 2 жреца, то вы должны развести их в противоположные стороны (разместив по левую и правую сторону от группы соответственно).\n При 40%% IAT_138967 босс откинет участников группы. Убедитесь, что за вашей спиной расположена стена — таким образом вас не сбросит с платформы.",
	["WaycrestManor_GorakTul"] = "Во время боя с боссом %s он будет периодически выбрасывать %s, который вам понадобится, чтобы сжечь трупы %s, чтобы они не могли возродиться. Как только босс использует %s и призовет третьего поработителя, вам придется уничтожить его, а затем быстро использовать %s, чтобы сжечь все трупы.",
	["WaycrestManor_Other"] = "Как видно из названия достижения, это профессиональное достижение, где вы можете взаимодействовать с предметами, чтобы вызывать боссов. Чтобы использовать предметы в подземельях, требуется минимальный уровень навыка 75.\n\n (Кожевничество) %s - карту, необходимую для призыва босса, можно найти в охотничьем зале, что в усадьбе Уэйкрестов, в углу каминного зала.\n (Портняжное дело) %s - '%s' можно найти в банкетном зале, на верхнем этаже.\n (Травничество) %s - '%s' можно найти у фонтана, что расположен во дворе усадьбы. Неподалеку от места сражения с %s.\n (Начертание) %s - '%s' находится на книжной полке на первом этаже, с левой стороны, прямо перед тем, как вы спуститесь в погреб.\n (Кулинария) %s - вино можно найти в погребе, рядом с прочими бочками вина.",
	["WaycrestManor_SoulboundGoliath"] = "%s будет получать один дебафф %s каждые 2 секунды, поэтому для получения этого достижения вам потребуется кайтить босса через области, пораженные %s чтобы держать стаки %s на низком показателе.",
}

core:RegisterLocale('ruRU', baseLocale)
