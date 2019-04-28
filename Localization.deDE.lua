if(GetLocale() ~= 'deDE') then return end

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "- Spieler im Chat nennen, bei denen Erfolge für bestimmte Bosse fehlen",
	["- Announce to chat tactics for a certain boss"] = "- Taktiken für einen bestimmten Boss im Chat ausgeben",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Verfolgt Erfolge, die es erfordern eine bestimmte Anzahl Gegner in einer bestimmten Zeit zu töten. Benachrichtigt, sobald genügend Gegner erschienen sind und ob sie innerhalb der Zeitspanne getötet wurden.",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Überprüft alle Gruppen- oder Schlachtzugsmitglieder auf fehlende Erfolge in der aktuellen Instanz",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Verfolgt, wenn die Kriterien für einen Erfolg fehlgeschlagen sind, und gibt dies im Chat aus",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Verfolgt, wenn die Kriterien für einen Erfolg erfüllt sind, und gibt dies im Chat aus",
	["(Enter instance to start scanning)"] = "(Instanz betreten, um den Scanvorgang zu starten)",
	--[[Translation missing --]]
	--[[ ["AssaultOnVioletHold_Festerface"] = "In order to get the %s to spawn, %s needs to reach 100 energy. His energy decreases when he is near a pool on the floor so the boss will need to be kited away from the pools. Once the %s has spawned kill it then kill the boss to get this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["AssaultOnVioletHold_MillificentManastorm"] = "To complete this achievement you will need to use the %s toy while fighting %s",--]] 
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \n\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",--]] 
	--[[Translation missing --]]
	--[[ ["BastionOfTwilight_HalfusWyrmbreaker"] = "To complete this achievement, you must first pull the boss then free 2 of the dragons around the room. This is done by clicking on the dragons that do not have the %s debuff. You then need to single target down both dragons within 10 seconds of one another before killing the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["BastionOfTwilight_ValionaAndTheralion"] = "To complete this achievement, pull %s to start the fight then wait for %s to cast %s. Once you stand in the pool created from %s you will teleported into the shadow realm at which point you will need to kill 6 %s which spawn at random intervals. When you have killed 6 %s you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight"] = "For this achievement you will need to steal 3 shinies from each of the enemies of the encounter, and bring them to the Mysterious Trashpile. You will have to steal 9 shinies in total: 3 from %s/%s, 3 from %s/%s and 3 from %s/%s\n\n Additionally this achievement requires everyone in the raid to interact with the Mysterious Trashpile to get the %s debuff. During the boss fight players will get transformed into a %s and get an extra action button to use on the enemies to steal one shiny coin.\n\n Once your raid group has handed in the 9 shiny coins (3 from each npc type) you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight_Alliance"] = "For this achievement you will need to steal 3 shinies from each of the enemies of the encounter, and bring them to the Mysterious Trashpile. You will have to steal 9 shinies in total: 3 from %s, 3 from %s and 3 from %s\n\n Additionally this achievement requires everyone in the raid to interact with the Mysterious Trashpile to get the %s debuff. During the boss fight players will get transformed into a %s and get an extra action button to use on the enemies to steal one shiny coin.\n\n Once your raid group has handed in the 9 shiny coins (3 from each npc type) you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight_Horde"] = "For this achievement you will need to steal 3 shinies from each of the enemies of the encounter, and bring them to the Mysterious Trashpile. You will have to steal 9 shinies in total: 3 from %s, 3 from %s and 3 from %s\n\n Additionally this achievement requires everyone in the raid to interact with the Mysterious Trashpile to get the %s debuff. During the boss fight players will get transformed into a %s and get an extra action button to use on the enemies to steal one shiny coin.\n\n Once your raid group has handed in the 9 shiny coins (3 from each npc type) you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ConclaveOfTheChosen"] = "To get this achievement you will need to leave one of the three initial raptors alive until the end of the fight. You can kill the rest, but since you can’t CC them, you will need to kite one for the entire duration of the fight.\n\n A different player will get fixated by the %s every 20 seconds (%s), so you will need to make sure that the player kites it away from the raid to avoid any AoE damage.\n\n One or two Death Knights may be useful on this fight since they can %s the raptor away from the raid.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong"] = "For this achievement you will need to carry and place 6 barrels on the floor before the fight against %s. You can find the %s by the stairs before you go up to the boss area.\n\n Place the %s on the floor, engage the boss, and make sure the barrels get hit by %s (Horde version) or %s (Alliance version).\n\n Once the %s are destroyed, the boss will gain a 20%% damage increase buff for 30 seconds per barrel destroyed (%s). Once all barrels are destroyed, finish him off and you will get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong_Alliance"] = "For this achievement you will need to carry and place 6 barrels on the floor before the fight against %s. You can find the %s by the stairs before you go up to the boss area.\n\n Place the %s on the floor, engage the boss, and make sure the barrels get hit by %s.\n\n Once the %s are destroyed, the boss will gain a 20%% damage increase buff for 30 seconds per barrel destroyed (%s). Once all barrels are destroyed, finish him off and you will get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong_Horde"] = "For this achievement you will need to carry and place 6 barrels on the floor before the fight against %s. You can find the %s by the stairs before you go up to the boss area.\n\n Place the %s on the floor, engage the boss, and make sure the barrels get hit by %s.\n\n Once the %s are destroyed, the boss will gain a 20%% damage increase buff for 30 seconds per barrel destroyed (%s). Once all barrels are destroyed, finish him off and you will get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_HighTinkerMekkatorque"] = "To complete this achievement you will need an engineer with %s and %s.\n\n Summon the two Blingtrons before starting the fight and they will start dueling. Shortly after the boss is engaged, the %s will spawn. It’s easy to kill, so defeat it and then finish the boss fight and you should get the achievement.\n\n %s has two abilities:\n %s - 8 yards AoE ability around the npc, move away if you're melee.\n %s - Chain Lightning, stay spread or interrupt the cast.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JadefireMasters"] = "For this achievement you will have to pick up the hidden %s in the boss arena, protect it from fire sources and have the Monk cast %s on it.\n\n You should pick up the egg after the first set of %s has been dealt with, this way you don't risk of losing the egg to %s. Make sure to pick it up before phase 2 starts, as %s will break it. \n\n The Monk will transform into a %s at 100 energy. After %s hits the player holding the egg, you can kill the boss to get the achievement.\n\n The locations of the %s are different for Horde and Alliance.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JainaProudmoore"] = "To complete this achievement you will first need 3 players to collect snow mounds during the fight against %s.\n\n The snow mounds can only be found during the first intermission. The snow mounds will be evenly spread around the circular area so you will need at least 3 players on a fast class to start running as soon as the phase starts.\n\n Walk through a snow mound and a little snowflake will appear next to your characters. Once all 3 have been found, interrupt the boss to enter the next phase. The players who have the snowflake should stack near one of the barrels to create the %s.\n\n Use %s to remove the %s from the barrel next to the %s, and then attack the barrel. The explosion will cause the %s to melt, which completed the criteria for this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_KingRastakhan"] = "To do this achievement you will need to keep the Phantom adds alive until the end of the fight. Simply tank them away from the raid to avoid unnecessary damage. \n\n A third tank is ideal for this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Opulence"] = "To get this achievement you will first have to make sure that at least one player has the %s pet.\n\n The achievement is personal, and requires the player to use a /praise command on a %s pet, while under the effect of a %s. The pet doesn’t need to be your own.\n\n To get under the %s, one or more players should pick up %s. This jewel will grant the player a stack of %s while they are stood alone. Upon reaching 100 stacks, they will gain the %s aura for 20 seconds, granting the player and all nearby players %s, increasing critical strike chance by 100%%. The buff will take about 100 seconds to appear, and once it's active /praise the %s pet to get credit for this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_StormwallBlockade"] = "To complete this achievement you will need to summon %s during the boss fight. You don’t need to defeat %s.\n\n To summon %s you need to click on a fish pool to the left of the docks after the boss has been engaged. Ideally you want only one player staying behind on the docks to summon it. That player will have to deal with a few mechanics for 2 minutes.\n\n -After clicking on the pool, the player will start pulling a rope out of the water, and they will start to slowly get pulled towards the water. Walk in the opposite direction to stay on the docks, but don’t walk too far away from the edge or the rope will break.\n -Shortly after, %s will start falling on the player, who will have to dodge them to stay alive.\n -After that, waves will come crashing onto the docks, and the player pulling the rope will have to dodge them.\n\n This will go on until the 2-minute rope-pulling cast finishes. The rest of the raid need to perform the boss fight as usual.\n\n Once %s spawned, the summoning player and later the raid will have to deal with its two abilities alongside the normal boss abilities:\n %s - A frontal cone that will push anyone away, shooting them into the water\n %s - Pulls all the players towards %s, instantly killing those who get too close.\n\n To deal with %s, you will need an outlaw rogue solely focusing on stunning it every time it casts %s. If you don't have a rogue, then you'll have to make a cc rotation. The rest of the raid will need to kill the boss before the enrage, while dealing with %s on top of the mechanics.",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_BarrelsDestroyed"] = "barrels destroyed",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_OpulenceRangeWarning"] = "Warning: For IAT to track this achievement correctly, %s must be within 25 yards of players praising the %s. Players with the %s should stand together to make this easier",--]] 
	--[[Translation missing --]]
	--[[ ["BlackrockCaverns_KarshSteelbender"] = "Pull the boss into the fire in the middle of the room until he reaches 15 stacks of %s. Once he has 15 stacks of %s you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["BlackRookHold_AmalgamOfSouls"] = "Bring the %s down to 50%% HP. When the %s spawn you will need to CC one of them to prevent it reaching the boss. After 1 minute the %s will transform into a %s. You can then kill the %s then the boss to get this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["BloodmaulSlagMines_Magmolatus"] = "At max level you will need to dps down the boss slowly so that both %s and %s have spawned before killing the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["CathedralOfEternalNight_Agronox"] = "For this achievement, you need to stand on top of the 4 Budding Seed pods around the boss room and wait for a Fulminating Lasher to %s onto each of the Budding Seed. Once this is done for each of the 4 seeds you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["CathedralOfEternalNight_Mephistroth"] = "At the start of the fight pick up the %s. You then need to wait for the boss to reach 100 energy which will begin phase 2. During phase 2 face the shield you picked up at the start of the fight towards the %s. Once 20 %s have been reflected with the shield, you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["CathedralOfEternalNight_ThrashbiteTheScornful"] = "Around the room there are 4 bookcases. To complete this achievement, you need to stand behind each of the bookcases and wait for the boss to cast %s in order to break a bookcase. Once a bookcase is broken, a clickable book appears on the floor. Each member in the group needs to click on this book. Rinse and repeat this for the other 3 bookcases in the boss room making sure you go in a clockwise direction. Once this is done, everyone in the group should have the %s buff and you can kill the boss.\n\n Note: You must have a full 5 man party to complete this achievement.",--]] 
	["Core_AchievementScanFinished"] = "Scannen der Erfolge abgeschlossen",
	--[[Translation missing --]]
	--[[ ["Core_AchievementTrackingEnabledFor"] = "Achievement Tracking Enabled for",--]] 
	--[[Translation missing --]]
	--[[ ["Core_CommandEnableTracking"] = "enable/disable IAT achievement tracking",--]] 
	["Core_Commands"] = "Liste mit Slash-Befehlen",
	["Core_Counter"] = "Zähler",
	--[[Translation missing --]]
	--[[ ["Core_CriteriaMet"] = "Criteria has been met. Boss can now be killed!",--]] 
	["Core_Enable"] = "aktivieren",
	--[[Translation missing --]]
	--[[ ["Core_EnableAchievementTracking"] = "Do you want to enable achievement tracking for",--]] 
	["Core_Failed"] = "FEHLGESCHLAGEN!",
	["Core_GameFreezeWarning"] = "Das Spiel kann für ein paar Sekunden einfrieren",
	["Core_help"] = "Hilfe",
	["Core_ListCommands"] = "Zeigt eine Liste verfügbarer Slash-Befehle",
	["Core_No"] = "Nein",
	["Core_NoTrackingForInstance"] = "IAT kann bei diesem Gefecht keine Erfolge verfolgen",
	["Core_PersonalAchievement"] = "persönlicher Erfolg",
	["Core_Reason"] = "Grund",
	["Core_StartingAchievementScan"] = "Starte Erfolgsscan für",
	["Core_TrackAchievements"] = "Verfolge Erfolge",
	["Core_Yes"] = "Ja",
	--[[Translation missing --]]
	--[[ ["CourtOfStars_PatrolCaptainGerdo"] = "To complete this this achievement, you must first clear all the trash in the boss room. While killing the trash make sure that neither the mobs nor players activate the beacons as this will fail the achievement.\n\n Once all the trash is dead, pull the boss then wait for him to cast %s. Once the boss has cast this ability, you will need to click on all 5 beacons around the room. Once all 5 beacons have been disabled, you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["DarkheartThicket_Dresaron"] = "After pulling the boss, run through the big egg behind %s to hatch it. Next kill the %ss that spawns then kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["DarkheartThicket_ShadeOfXavius"] = "DPS the boss down to 15%%-20%% health. Drag the boss through the swirly puddles on the ground until the boss has 10 stacks of %s then kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["EyeOfAzshara_LadyHatecoil"] = "When the %s debuff expires or is dispelled you will do a breath in the direction that you are currently facing killing any %s in its path. In order to get the achievement you need to do 1 breath on 11 or more %s. The %s will spawn over time so face yourself away from the adds until 11 or more have spawned.",--]] 
	["Features"] = "Features",
	--[[Translation missing --]]
	--[[ ["Freehold_HarlanSweete"] = "%s will target a random player for %s, which will have to position near one of the chests, so that they will end up being destroyed.",--]] 
	--[[Translation missing --]]
	--[[ ["Freehold_RingOfBooty"] = "For this achievement you will have to pick up 3 items throughout the instance. %s spawns in the nest at the first boss after you defeat it, %s is found on top of a platform in The Rum Quarter, and %s is found near Sharkbait after the third boss.",--]] 
	--[[Translation missing --]]
	--[[ ["Freehold_SkycapNKragg"] = "To summon IAT_138314 you have to place a %s before you pull the boss.",--]] 
	["GUI_Achievement"] = "Erfolg",
	["GUI_Achievements"] = "Erfolge",
	["GUI_AchievementsCompletedForInstance"] = "Alle Erfolge sind abgeschlossen für",
	["GUI_AchievementsDiscordDescription"] = "Die Taktiken wurden vom Erfolgs Discord Server bereit gestellt, die Mitglieder können sich mit gleichgesinnte Mitglieder und Gruppen für bestimme Erfolge treffen.",
	["GUI_AchievementsDiscordTitle"] = "Erfolge Discord",
	["GUI_AnnounceMessagesToRaidWarning"] = "Zeige Nachrichten als Raidwarnung",
	["GUI_AnnounceTracking"] = "Erfolge die beobachtet werden and die Gruppe ansagen.",
	["GUI_Author"] = "Autor",
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclysm",
	["GUI_Disabled"] = "Deaktiviert",
	--[[Translation missing --]]
	--[[ ["GUI_DisplayInfoFrame"] = "Enable Info Frame",--]] 
	["GUI_EnableAddon"] = "Addon aktivieren",
	["GUI_EnableAutomaticCombatLogging"] = "Aktiviere automatisch den Kampflog",
	["GUI_Enabled"] = "Aktiviert",
	["GUI_EnterInstanceToStartScanning"] = "Instanz betreten, um den Scanvorgang zu starten",
	["GUI_GreyOutCompletedAchievements"] = "Graue abgeschlossene Erfolge aus",
	["GUI_HideCompletedAchievements"] = "Verstecke abgeschlossene Erfolge",
	["GUI_Legion"] = "Legion",
	["GUI_MinimapDisabled"] = "Minimap Symbol deaktiviert",
	["GUI_MinimapEnabled"] = "Minimap Symbol aktiviert",
	["GUI_MistsOfPandaria"] = "Mists of Pandaria",
	["GUI_NoPlayersNeedAchievement"] = "Kein Spieler in der Gruppe, welches den Erfolg benötigt",
	["GUI_OnlyDisplayMissingAchievements"] = "Zeige nur fehlende Erfolge",
	["GUI_OnlyTrackMissingAchievements"] = "Verfolge nur fehlende Erfolge",
	["GUI_Options"] = "Einstellungen",
	["GUI_OutputPlayers"] = "Ausgabe Spieler",
	["GUI_OutputTactics"] = "Ausgabe Taktik",
	["GUI_Players"] = "Spieler",
	["GUI_PlayersWhoNeedAchievement"] = "Spieler, welche den Erfolg benötigen",
	["GUI_PlaySoundOnFailed"] = "Spiele einen Sound wenn ein Erfolg fehlschlägt",
	["GUI_PlaySoundOnSuccess"] = "Spiel ein Sound wenn der Erfolg abgeschlossen ist",
	["GUI_ScanInProgress"] = "Scan läuft noch",
	["GUI_SelectSound"] = "Wähle Sound",
	--[[Translation missing --]]
	--[[ ["GUI_Tactic"] = "Tactic",--]] 
	["GUI_Tactics"] = "Taktik",
	["GUI_ToggleMinimap"] = "Zeige Minimap Knopf",
	["GUI_Track"] = "Verfolgen",
	["GUI_Tracking"] = "Verfolgung",
	["GUI_TrackingDisabled"] = "(Erfolgsverfolgung deaktiviert)",
	["GUI_TrackingNumber"] = "Derzeitige Verfolgung",
	["Gui_TranslatorNames"] = "gOOvER, Kaspi_1",
	["GUI_Translators"] = "Übersetzer",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	--[[Translation missing --]]
	--[[ ["HallsOfValor_Other1"] = "Make your way over to the %s area. Clear the entire area except for the %s you see when you teleport in and any %s. Once you're done, aggro the %s and kite him over to the 10 %s in the area. Once the %s has 10 stacks of %s you can kill it to get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["HallsOfValor_Other2"] = "Note: This achievement requires a minimum of 4 players to complete.\n\n After you defeated both %s and %s the path to the four kings will now be open. Before you take the path, head back to the dining hall and have every player click on a %s on the table to gain the %s buff.\n\n Once you pick up the buff players will have 20 seconds to head up the stairs and throw their %s to one of the four kings (%s, %s, %s and %s). Note: Each player will need to pick a different boss.",--]] 
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	["Instances_Other"] = "Sonstige",
	["Instances_TrashAfterThirdBoss"] = "Trash nach dem dritten Boss",
	--[[Translation missing --]]
	--[[ ["KingsRest_DazarTheFirstKing"] = "This achievement is obtained at %s, the last boss in the instance. Have two players each stay on top of the stones in front of the two sarcophagi, and the lights will start filling up around the stone. Once they are both lit up, the right sarcophagus will start shaking which means that you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_MchimbaTheEmbalmer"] = "For this achievement you will have to free the player targeted by %s without him using %s more than once, and also free him before the boss finishes casting %s.\n\n Note: Players have reported a minor bug with this achievement, and it's recommended that the entombed player does not use %s before the boss casts %s",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_Other"] = "The first trinket is in the first room of the dungeon, behind the sarcophagus, underneath the baskets.\n The second trinket is in the first boss hallway, at the end of the platform, behind the last set of stairs.\n The third trinket - (Check out the Glory of the Wartorn Hero Achievement Guide for details on WowHead)\n The fourth trinket is located before the final boss room, at the bottom of the strairs, at the top of the right pillar.",--]] 
	--[[Translation missing --]]
	--[[ ["LostCityOfTheTolVir_Lockmaw"] = "Pull the boss then wait for 20 %s to spawn. After 20 %s have spawned, AOE them down then kill the boss.",--]] 
	["Main"] = "Hauptmenü",
	--[[Translation missing --]]
	--[[ ["MawOfSouls_Other"] = "To complete this achievement, you must kill the second boss within 3 minutes and 30 seconds after boarding the ship just after the first boss.",--]] 
	--[[Translation missing --]]
	--[[ ["NeltharionsLair_Naraxas"] = "To complete this achievement you will need to wait for the boss to gain 6 stacks of %s. This can be done in the following ways:\n\n -The tank getting eaten by the boss\n -Leaving the adds alive allowing them to get eaten by the boss.\n\n Once 6 stacks of %s has been reached you can kill the boss to get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["NeltharionsLair_Other"] = "You will first need to buy a %s from the %s which is found by walking down the narrow path to the right after entering the instance. You will then need to hit snails throughout the instance with the %s. Make sure not to kill the snails before hitting them with the %s.\n\n %s is found on a mushroom during the barrel river part of the instance. You will need to throw a fish at him to get him to move. Once you have hit him with a fish, he will be waiting for you at the bottom of the waterfall.\n\n %s is found in the cave behind the waterfall where you just found %s. You will need someone to taunt %s so he will move away from the electricity field before hitting him with the %s.\n\n %s is found before the 2nd boss in the long pathway towards the bat world quest at the back of the cave.\n\n %s, %s and %s are found directly after the 2nd boss running around in circles.\n\n %s is just after the previous 3 snails. You will need to go into the water on your right and then swim to the cave. %s is hanging on the celling of the cave so you will need to hit him once so he falls down. You will then be able to hit him with the %s.",--]] 
	--[[Translation missing --]]
	--[[ ["ReturnToKarazhan_OperaHall"] = "This achievement will take 3 weeks to complete as the plays rotate on a 3 week schedule.",--]] 
	--[[Translation missing --]]
	--[[ ["ReturnToKarazhan_ShadeOfMedivh"] = "This achievement requires 5 players to complete. All players in the group will need to click on a book found on the floor to the left after entering the boss room. This will give everyone in the group the %s debuff. Once everyone has got the %s debuff you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["SeatOfTheTriumvirate_Lura"] = "On your way from the second to the third boss you will find pools of void that pull you towards the center of them where you will get a stack of %s every second. Once you get 10 stacks, the debuff gets replaced by a new one called %s. Killing %s while affected by %s will award the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["SeatOfTheTriumvirate_Saprish"] = "For this achievement you will need to stand on top of the 4 %s around the room so that %s breaks it when he jumps to one of the players. Once all the %s have been broken you can kill %s and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["SeatOfTheTriumvirate_ZuraalTheAscended"] = "About forty seconds into the fight the boss will target a random player and cast %s which will knock that player backwards into the void realm.\n\n Now that player will want to fill up their energy bar, attack %s and then use the extra action button %s near him so that both of them will get sent back to the normal realm.\n\n From there you just kill %s, then %s and there's your achievement.",--]] 
	["Shared_AddKillCounter"] = "%s Kill-Zähler",
	["Shared_CompletedBossKill"] = "wird erfüllt wenn der Boss getötet wurde",
	["Shared_DamageFromAbility"] = "%s Schaden",
	["Shared_DirectHitFromAbility"] = "%s direkter Schlag",
	["Shared_DoesNotMeetCritera"] = "erfüllt nicht die Voraussetzungen für",
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	["Shared_FailedPersonalAchievement"] = "%s ist gescheitert %s (Grund: %s)(Persönlicher Erfolg)",
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	["Shared_Found"] = "gefunden",
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	["Shared_GotHit"] = "wurde getroffen",
	["Shared_HasBeenHitWith"] = "wurde getroffen von",
	["Shared_HasBeenInfectedWith"] = "wurde infiziert mit",
	["Shared_HasCompleted"] = "hat abgeschlossen",
	["Shared_HasFailed"] = "ist fehlgeschlagen",
	["Shared_HasGained"] = "hat gewonnen",
	["Shared_HasLost"] = "hat verloren",
	["Shared_HeCanNowBeKileld"] = "Er kann jetzt getötet werden",
	["Shared_JustKillBoss"] = "Auf Maximallevel kann der Boss einfach getötet werden um den Erfolg zu bekommen",
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBossesTogether"] = "At max level, you can simply just kill the bosses at the same time to get this achievement",--]] 
	["Shared_JustKillBossSingleTarget"] = "Um den Erfolg zu bekommen, kann der Boss einfach mit einer Single-Target Fähigkeit getötet werden",
	["Shared_KillTheAddNow"] = "Töte %s jetzt",
	["Shared_MeetsCritera"] = "erfüllt die Voraussetzung für",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "wurden nicht getroffen",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "Spieler getroffen:",
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoNeedAchievement"] = "Players who need achievement",--]] 
	["Shared_PlayersWhoStillNeedToGetHit"] = "Spieler die noch getroffen werden müssen:",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "Die folgenden Spieler müssen wiederbelebt werden um den Erfolg zu erhalten:",
	["Shared_ReportString"] = "Bitte melde den folgenden string zum IAT Autor",
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	["Shared_SheCanNowBeKilled"] = "Sie kann jetzt getötet werden",
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	["Shared_WasKilled"] = "wurde getötet",
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
	--[[ ["TerraceOfEndlessSpring_DefeatedLast"] = "'%s Defeated Last' part of",--]] 
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
	--[[ ["Ulduar_AssemblyOfIron1"] = "To complete this achievement you just need to kill %s last",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_FlameLeviathan1"] = "This achievement will take 3 runs to complete since you will need to kill the boss while inside each of the 3 vehicles",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_FlameLeviathan2"] = "To complete this achievement, you need to be the passenger in the demolisher. As the passenger hit the %s button, then have the driver face %s and use the %s action. Once atop of %s, there are 2 turrets. Killing one of the turrets will award the achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_FlameLeviathan3"] = "To complete this achievement you will need to activate %s hard mode by speaking to %s at the start of the instance. After that you just need to kill the boss without destroying any of the towers leading up to the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_Other1"] = "At max level, this achievement is a lot easier to complete without using a vehicle. Just run up between 2 of the pillars where the %s are coming out from. Next Wait for 100 %s to attack you then just AOE them all down together to get this achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["Ulduar_Other2"] = "Kill the boss without going over any of the repair pads located just before the boss",--]] 
	--[[Translation missing --]]
	--[[ ["VaultOfTheWardens_AshGolm"] = "To complete this achievement everyone in your group needs to soak %s around the room in order to get the %s debuff. Once everyone in the group has the %s debuff you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_GorakTul"] = "During the %s encounter, the boss will periodically toss out %s which you will need to use to burn the corpses of %s, so they can't respawn. Once the boss casts %s and summons the third add you will have to nuke the adds, and then quickly use %s to burn their corpses.",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_Other"] = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Leatherworking) %s - The map to summon this boss is found in the hunting lodge section of Waycrest, in the corner of the Kraker fireplace room.\n (Tailoring) %s - The '%s' (a bolt of cloth) is found in the Banquet Hall, on the top floor.\n (Herbalism) %s - The '%s' is found in the fountain across the courtyard where %s is.\n (Inscription) %s - The '%s' is found in a bookshelf on the main floor, on the left side just before you descend to the cellar.\n (Cooking) %s - The wine is found in the cellar, near other casks of wine.",--]] 
	--[[Translation missing --]]
	--[[ ["WaycrestManor_SoulboundGoliath"] = "%s gets a stacking buff called %s every 2 seconds, so to get this achievement you will have to kite the boss through patches of %s that spawn in the area in order to keep the %s stacks low.",--]]
}

core:RegisterLocale('deDE', baseLocale)

-- core:RegisterLocale('enUS', baseLocale)
