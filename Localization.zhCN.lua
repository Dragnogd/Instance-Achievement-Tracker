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
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight"] = "For this achievement you will need to steal 3 shinies from each of the enemies of the encounter, and bring them to the Mysterious Trashpile. You will have to steal 9 shinies in total: 3 from %s/%s, 3 from %s/%s and 3 from %s/%s\n\n Additionally this achievement requires everyone in the raid to interact with the Mysterious Trashpile to get the %s debuff. During the boss fight players will get transformed into a %s and get an extra action button to use on the enemies to steal one shiny coin.\n\n Once your raid group has handed in the 9 shiny coins (3 from each npc type) you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ConclaveOfTheChosen"] = "To get this achievement you will need to leave one of the three initial raptors alive until the end of the fight. You can kill the rest, but since you can’t CC them, you will need to kite one for the entire duration of the fight.\n\n A different player will get fixated by the %s every 20 seconds (%s), so you will need to make sure that the player kites it away from the raid to avoid any AoE damage.\n\n One or two Death Knights may be useful on this fight since they can %s the raptor away from the raid.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong"] = "For this achievement you will need to carry and place 6 barrels on the floor before the fight against %s. You can find the %s by the stairs before you go up to the boss area.\n\n Place the %s on the floor, engage the boss, and make sure the barrels get hit by %s (Horde version) or %s (Alliance version).\n\n Once the %s are destroyed, the boss will gain a 20%% damage increase buff for 30 seconds per barrel destroyed (%s). Once all barrels are destroyed, finish him off and you will get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_HighTinkerMekkatorque"] = "To complete this achievement you will need an engineer with %s and %s.\n\n Summon the two Blingtrons before starting the fight and they will start dueling. Shortly after the boss is engaged, the %s will spawn. It’s easy to kill, so defeat it and then finish the boss fight and you should get the achievement.\n\n %s has two abilities:\n %s - 8 yards AoE ability around the npc, move away if you're melee.\n %s - Chain Lightning, stay spread or interrupt the cast.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JadefireMasters"] = "For this achievement you will have to pick up the hidden %s in the boss arena, protect it from fire sources and have the Monk cast %s on it.\n\n You should pick up the egg after the first set of %s has been dealt with, this way you don't risk of losing the egg to %s. Make sure to pick it up before phase 2 starts, as %s will break it. \n\n The Monk will transform into a %s at 100 energy. After %s hits the player holding the egg, you can kill the boss to get the achievement.\n\n The locations of the %s are different for Horde and Alliance.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JainaProudmoore"] = "To complete this achievement you will first need 3 players to collect snow mounds during the fight against %s.\n\n The snow mounds can only be found during the first intermission. The snow mounds will be evenly spread around the circular area so you will need at least 3 players on a fast class to start running as soon as the phase starts.\n\n Walk through a snow mound and a little snowflake will appear next to your characters. Once all 3 have been found, interrupt the boss to enter the next phase. The players who have the snowflake should stack near one of the barrels to create the %s.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_KingRastakhan"] = "To do this achievement you will need to keep the Phantom adds alive until the end of the fight. Simply tank them away from the raid to avoid unnecessary damage. \n\n A third tank is ideal for this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Opulence"] = "To get this achievement you will first have to make sure that at least one player has the %s pet.\n\n The achievement is personal, and requires the player to use a /praise command on a %s pet, while under the effect of a %s. The pet doesn’t need to be your own.\n\n To get under the %s, one or more players should pick up %s. This jewel will grant the player a stack of %s while they are stood alone. Upon reaching 100 stacks, they will gain the %s aura for 20 seconds, granting the player and all nearby players %s, increasing critical strike chance by 100%%. The buff will take about 100 seconds to appear, and once it's active /praise the %s pet to get credit for this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_StormwallBlockade"] = "To complete this achievement you will need to summon %s during the boss fight. You don’t need to defeat %s.\n\n To summon %s you need to click on a fish pool to the left of the docks after the boss has been engaged. Ideally you want only one player staying behind on the docks to summon it. That player will have to deal with a few mechanics for 2 minutes.\n\n -After clicking on the pool, the player will start pulling a rope out of the water, and they will start to slowly get pulled towards the water. Walk in the opposite direction to stay on the docks, but don’t walk too far away from the edge or the rope will break.\n -Shortly after, %s will start falling on the player, who will have to dodge them to stay alive.\n -After that, waves will come crashing onto the docks, and the player pulling the rope will have to dodge them.\n\n This will go on until the 2-minute rope-pulling cast finishes. The rest of the raid need to perform the boss fight as usual.\n\n Once %s spawned, the summoning player and later the raid will have to deal with its two abilities alongside the normal boss abilities:\n %s - A frontal cone that will push anyone away, shooting them into the water\n %s - Pulls all the players towards %s, instantly killing those who get too close.\n\n To deal with %s, you will need an outlaw rogue solely focusing on stunning it every time it casts %s. If you don't have a rogue, then you'll have to make a cc rotation. The rest of the raid will need to kill the boss before the enrage, while dealing with %s on top of the mechanics.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_BarrelsDestroyed"] = "barrels destroyed",--]] 
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
	["Gui_TranslatorNames"] = "萌丶汉丶纸",
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
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoNeedAchievement"] = "Players who need achievement",--]] 
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
	--[[ ["SiegeOfBoralus_DreadCaptainLockwood"] = "%s will continuously attempt to retreat from players using %s unless she is snared or rooted. As the achievement description implies, you have to keep her snared or rooted and prevent her from ever using %s.",--]] 
	--[[Translation missing --]]
	--[[ ["SiegeOfBoralus_Other"] = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Blacksmithing) %s - The hammer is found down the stairs to the docks at 58, 70.\n (Engineering) %s - The NPC is found right at the start of the instance.\n (Alchemy) %s - The 'Strange Vial' is found near a table at at 54, 74.",--]] 
	--[[Translation missing --]]
	--[[ ["SiegeOfBoralus_ViqGoth"] = "During the encounter, %s will use %s which causes a barrage of %s around the area. During this, several %s will be thrown on the land which you will have to kick back into the water before defeating the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_AvatarOfSethraliss"] = "For this achievement you will have to /kiss %s until one of them transforms into a 'Prince' which looks like %s. The 'Prince' cannot die so you don't have to worry about using aoe spells",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_Merektha"] = "In order to reveal the %s that is hidden on top of the bones, you will have to use %s, %s, %s or other ground damaging abilities. To make the egg hatch, have your dps and healer stack under the boss and wait for it to cast %s. Once the %s spawns, you can kill it, and then click on it to get the %s buff that grants you the achievement.\n\n Note: The %s might evade attacks but it will teleport to the ground after a few seconds. If you have a Death Knight in your group you should %s the %s down, which will not only bypass this bug, but also make positioning easier.",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_Merektha_LootSnake"] = "Loot the %s now to complete the achievement",--]] 
	--[[Translation missing --]]
	--[[ ["TempleOfSethraliss_Trash"] = "For this achievement you will want to use class utility abilities to crowd control the %s while you get both eyes closer. Note that there are several %s throughout the room that will attempt to steal your eye back, there is one near each eye, one in between the eyes and the skull, and a few more in the middle of the room.\n\n Abilities such as %s, %s and %s are ideal, as you can cc the adds on one side and then ignore them completely.",--]] 
	--[[Translation missing --]]
	--[[ ["The_Motherlode_CoinOperatedCrowdPummeler"] = "Pick up %s before the boss and throw it at %s after you engage the boss. %s will cast %s throughout the fight so you should interrupt the spell and kill him and the other adds asap as they will throw grog, making you drunk for 10 seconds.",--]] 
	--[[Translation missing --]]
	--[[ ["The_Motherlode_MogulRazdunk"] = "Similarly to the predecessors of this achievement, this is a personal achievement that requires you to dodge most of the damaging mechanics of the boss encounter.",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Cenarius"] = "At max level, with enough dps you can kill the boss before any of the %s are cleansed.",--]] 
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
	--[[Translation missing --]]
	--[[ ["TheNighthold_Skorpyron"] = "At max level, have your whole group stand in the circle in the middle of the room and kill the boss before he casts %s.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_StarAugurEtraeus"] = "For this achievement, you will need to drag the %s add in the %s boss room up to %s.\n\n You then need to dps the boss down to 30%% without damaging the add. The add will then transform into a %s at which point you can kill the add and then kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Tichondrius"] = "At max level, you can simply kill the boss before he casts %s.\n\n Note: This achievement is a personal achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["TheUnderrot_ElderLeaxa"] = "%s abilities apply %s to players whenever they take spell damage. This means means that all of her abilities will have to be interrupted and dodged in order to prevent this debuff.\n\n To make the achievement easier, you can have your healer go dps so you have an extra interrupt, and also kill her faster.",--]] 
	--[[Translation missing --]]
	--[[ ["TheUnderrot_SporecallerZancha"] = "%s is located in the top left corner of the room. To make him active you will have to make the boss cast %s in his direction.\n\n Note: If %s evades attacks then just go the middle of the room, and he will shortly teleport there.",--]] 
	--[[Translation missing --]]
	--[[ ["TheUnderrot_UnboundAbomination"] = "Puddles of %s will occasionally coalesce into %s adds which fixate a random player. You will have to kill the boss without having any %s die, which is easily done by kiting them in a circle around the room.\n\n Make use of cc in order to slow them, and remember to check your talents, trinkets and azerite traits so you don't accidentally kill the spores.",--]] 
	--[[Translation missing --]]
	--[[ ["TolDagor_KnightCaptainValyri"] = "For this achievement you will want to tank the boss in the middle of the room, and have the other 4 players move the barrels close to %s. You will want to move the barrels away from the fire:\n %s - This spell is cast underneath players, you simply have to move the barrel away.\n %s - When %s casts this spell, you will have to move the barrel away from where the boss is facing towards.\n %s - When a player gets this debuff, they have to move away from the barrel immediately and wait for a dispel.",--]] 
	--[[Translation missing --]]
	--[[ ["TolDagor_OverseerKorgus"] = "Shortly after you start the encounter, %s fires %s rounds at each player and applies %s. Every time a player moves its effects get stronger and will eventually cause the player to be stunned for 8 seconds, and you should do this as a group at the start of the encounter since there are no abilities to dodge.",--]] 
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
	--[[Translation missing --]]
	--[[ ["WaycrestManor_GorakTul"] = "During the %s encounter, the boss will periodically toss out %s which you will need to use to burn the corpses of %s, so they can't respawn. Once the boss casts %s and summons the third add you will have to nuke the adds, and then quickly use %s to burn their corpses.",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_Other"] = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Leatherworking) %s - The map to summon this boss is found in the hunting lodge section of Waycrest, in the corner of the Kraker fireplace room.\n (Tailoring) %s - The '%s' (a bolt of cloth) is found in the Banquet Hall, on the top floor.\n (Herbalism) %s - The '%s' is found in the fountain across the courtyard where %s is.\n (Inscription) %s - The '%s' is found in a bookshelf on the main floor, on the left side just before you descend to the cellar.\n (Cooking) %s - The wine is found in the cellar, near other casks of wine.",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_SoulboundGoliath"] = "%s gets a stacking buff called %s every 2 seconds, so to get this achievement you will have to kite the boss through patches of %s that spawn in the area in order to keep the %s stacks low.",--]]
}

core:RegisterLocale('zhCN', baseLocale)
