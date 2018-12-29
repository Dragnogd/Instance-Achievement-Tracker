local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["GUI_Achievements"] = "Achievements", --["Achievements"]
    ["GUI_Tactics"] = "Tactics", --["Tactics"]
    ["GUI_TrackingNumber"] = "Currently Tracking", --["Currently Tracking:"]
    ["GUI_Options"] = "Options", --["Options:"] --["Main"]
    ["GUI_EnableAddon"] = "Enable Addon", --["Enable Addon"]
    ["GUI_Enabled"] = "Enabled", --["Enabled"]
    ["GUI_Disabled"] = "Disabled", --["Disabled"]
    ["GUI_ToggleMinimap"] = "Show minimap button", --["Show Minimap Button"]
    ["GUI_MinimapEnabled"] = "Minimap icon enabled",
    ["GUI_MinimapDisabled"] = "Minimap icon disabled",
    ["GUI_AnnounceTracking"] = "Announce achievements being tracked to group", --L["Announce Achievements Being Tracked To Group"]
    ["GUI_OnlyTrackMissingAchievements"] = "Only track missing achievements", --["Only track missing achievements"]
    ["GUI_AnnounceMessagesToRaidWarning"] = "Announce messages to Raid Warning", --["Announce messages to Raid Warning"]
    ["GUI_AchievementsDiscordTitle"] = "Achievements Discord",
    ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements.",
    ["GUI_PlaySoundOnSuccess"] = "Play a sound when a achievement is completed",
    ["GUI_PlaySoundOnFailed"] = "Play a sound when an achievement fails",
    ["GUI_SelectSound"] = "Select Sound",
    ["GUI_TrackingDisabled"] = "Achievement Tracking Disabled", --["(Achievement Tracking Disabled)"]
    ["GUI_EnterInstanceToStartScanning"] = "Enter instance to start scanning", --["Enter instance to start scanning"]
    ["GUI_BattleForAzeroth"] = "Battle for Azeroth", --["Battle for Azeroth"]
    ["GUI_Legion"] = "Legion", --["Legion"]
    ["GUI_WarlordsOfDraenor"] = "Warlords of Draenor", --["Warlords of Draenor"]
    ["GUI_MistsOfPandaria"] = "Mists of Pandaria", --["Mists of Pandaria"]
    ["GUI_Cataclysm"] = "Cataclysm", --["Cataclysm"]
    ["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King", --["Wrath of the Lich King"]
    ["GUI_Players"] = "Players", --["Players"]
    ["GUI_Achievement"] = "Achievement", --["Achievement"]
    ["GUI_NoPlayersNeedAchievement"] = "No players in the group need this achievement", --["No players in the group need this achievement"]
    ["GUI_PlayersWhoNeedAchievement"] = "Players who need Achievement", --["Players who need Achievement"]
    ["GUI_ScanInProgress"] = "scan still in progress", --["scan still in progress"]
    ["GUI_Tracking"] = "Tracking", --["Tracking"]
    ["GUI_Track"] = "Track", --["Track"]
    ["GUI_OutputPlayers"] = "Output Players", --["Output Players"]
    ["GUI_OutputTactics"] = "Output Tactics", --Output Tactics
    ["GUI_OnlyDisplayMissingAchievements"] = "Only display missing achievements",
    ["GUI_GreyOutCompletedAchievements"] = "Grey out completed achievements",
    ["GUI_HideCompletedAchievements"] = "Hide completed achievements",
    ["GUI_AchievementsCompletedForInstance"] = "All achievements have been completed for",

    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    ["Core_StartingAchievementScan"] = "Starting acchievement scan for", --["Starting Achievement Scan For"]
    ["Core_GameFreezeWarning"] = "This may freeze your game for a few seconds", --["This may freeze your game for a few seconds"]
    ["Core_AchievementScanFinished"] = "Achievement Scanning Finished", --["Achievement Scanning Finished"]
    ["Core_EnableAchievementTracking"] = "Do you want to enable achievement tracking for", --["Do you want to enable achievement tracking for"]
    ["Core_TrackAchievements"] = "Track Achievements", --["Track Achievements"]
    ["Core_Yes"] = "Yes", --["Core_Yes"]
    ["Core_No"] = "No", --["Core_No"]
    ["Core_AchievementTrackingEnabledFor"] = "Achievement Tracking Enabled for", --["Achievement Tracking Enabled for"]
    ["Core_help"] = "help", --["help"]
    ["Core_Commands"] = "List of slash commands", --["List of slash commands"]
    ["Core_ListCommands"] = "shows a list of avaliable slash commands", --["shows a list of avaliable slash commands"]
    ["Core_CommandEnableTracking"] = "enable/disable IAT achievement tracking", --["enable/disable IAT achievement tracking"]
    ["Core_Enable"] = "enable", --["enable"]
    ["Core_NoTrackingForInstance"] = "IAT cannot track any achievements for this encounter",
    ["Core_Failed"] = "FAILED!",
    ["Core_PersonalAchievement"] = "Personal Achievement",
    ["Core_Reason"] = "Reason",
    ["Core_CriteriaMet"] = "Criteria has been met. Boss can now be killed!",
    ["Core_Counter"] = "Counter",

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    ["Instances_Other"] = "Other", 
    ["Instances_TrashAfterThirdBoss"] = "Trash after the third boss", --L["Trash after the third boss"]

    -- ["Features:"] = "Features:",
    -- ["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Tracks when the criteria of instance achievements have been met and output this to chat",
    -- ["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Tracks when the criteria of instance achievements has been failed and outputs this to chat",
    -- ["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period.",
    -- ["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Scans all players in the group to see which achievements each player is missing for the current instance",
    -- ["- Announce to chat players who are missing achievements for certain bosses"] = "- Announce to chat players who are missing achievements for certain bosses",
    -- ["- Announce to chat tactics for a certain boss"] = "- Announce to chat tactics for a certain boss",
    
    -------------------------------------------------------
    --- Tactics & Boss Modules
    -------------------------------------------------------

    --Shared
    ["Shared_HasBeenHitWith"] = "has been hit with",
    ["Shared_PlayersWhoStillNeedToGetHit"] = "Players who still need to get hit:",
    ["Shared_PlayersWhoStillNeedToGetResurrected"] = "The following players need to be resurrected in order to receive the achievement:",
    ["Shared_HasGained"] = "has gained",
    ["Shared_HasLost"] = "has lost",
    ["Shared_HasFailed"] = "has failed",
    ["Shared_HasCompleted"] = "has completed",
    ["Shared_Reason"] = "reason:", -----TODO duplicate
    ["Shared_PersonalAchievement"] = "Personal Achievement", -----------TODO duplicate
    ["Shared_Timer10"] = "Timer Started!. 10 seconds remaining", --TODO insert number of seconds remaining
    ["Completed"] = "Completed", --TODO wrong format
    ["Shared_JustKillBoss"] = "At max level, you can simply just kill the boss to get this achievement",
    ["Shared_JustKillBossSingleTarget"] = "At max level, you can simply just kill the boss with single target abilities to get this achievement",
    ["Shared_GotHit"] = "got hit",
    ["Shared_NotHit"] = "did not get hit",
    ["Shared_PlayersHit"] = "players hit:",
    ["Shared_CompletedBossKill"] = "will be completed once boss is killed",
    ["Shared_Timer3"] = "Timer Started! 3 seconds remaining", --TODO insert number of seconds remaining
    ["Shared_Countdown20"] = "20 seconds remaining",
    ["Shared_MeetsCritera"] = "meets the criteria for",
    ["Shared_DoesNotMeetCritera"] = "does not meet the critera for",
    ["Shared_HasBeenInfectedWith"] = "has been infected with",
    ["Shared_SheCanNowBeKilled"] = "She can now be killed",
    ["Shared_HeCanNowBeKileld"] = "He can now be killed",
    ["Shared_KillTheAddNow"] = "Kill the %s now",
    ["Shared_FailedPersonalAchievement"] = "%s has failed %s (Reason: %s)(Personal Achievement)",
    ["Shared_DamageFromAbility"] = "%s Damage",
    ["Shared_DirectHitFromAbility"] = "%s Direct Hit",
    ["Shared_AddKillCounter"] = "%s kill counter",
    ["Shared_One"] = "1",
    ["Shared_Two"] = "2",
    ["Shared_Three"] = "3",
    ["Shared_Four"] = "4",
    ["Shared_Five"] = "5",
    ["Shared_Six"] = "6",
    ["Shared_Seven"] = "7",
    ["Shared_Eight"] = "8",
    ["Shared_Nine"] = "9",
    ["Shared_Ten"] = "10",
    ["Shared_Eleven"] = "11",
    ["Shared_Twelve"] = "12",
    ["Shared_Thirteen"] = "13",
    ["Shared_Fourteen"] = "14",
    ["Shared_Fifteen"] = "15",
    ["Shared_Sixteen"] = "16",
    ["Shared_Seventeen"] = "17",
    ["Shared_Eighteen"] = "18",
    ["Shared_Nineteen"] = "19",
    ["Shared_Twenty"] = "20",
    ["Shared_WasKilled"] = "was killed",
    ["Shared_Found"] = "found",

    -------------------------------------------------------
    --- Battle of Dazar'alor
    -------------------------------------------------------
    --Tactics
    ["BattleOfDazaralor_ChampionOfTheLight"] = "",
    ["BattleOfDazaralor_JadefireMasters"] = "",
    ["BattleOfDazaralor_Grong"] = "",
    ["BattleOfDazaralor_Opulence"] = "",
    ["BattleOfDazaralor_ConclaveOfTheChosen"] = "",
    ["BattleOfDazaralor_KingRastakhan"] = "",
    ["BattleOfDazaralor_HighTinkerMekkatorque"] = "",
    ["BattleOfDazaralor_StormwallBlockade"] = "",
    ["BattleOfDazaralor_JainaProudmoore"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Uldir
    -------------------------------------------------------
    --Tactics
    ["Uldir_Taloc_Tactics"] = "For this achievement you will have to collect 4 %s while the Elevator is going down in phase 2.\n\n The positions of the orbs seem to be randomised, however a Demon Hunter can easily get all of them by using %s and %s",
    ["Uldir_MOTHER_Tactics"] = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\n\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",
    ["Uldir_Fetid_Devourer_Tactics"] = "Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\n\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%% (%s)",
    ["Uldir_ZekVoz_Tactics"] = "This achievement is pretty easy, however you should use the IAT_64482 after IAT_135129 disappears in phase 2. The puzzle will activate the next time the IAT_135129 appears (the second time), which helps your healers with healing & mana (you won't have to deal with the mechanics for an extra minute).\n\n The %s deal anywhere from 25k to 35k damage, so make sure to dodge them as much as possible so your healers don't get overwhelmed.",
    ["Uldir_Vectis_Tactics"] = "IAT_142148 is located down on the platform right before you go to IAT_134442.\n\n After you get the %s debuff on her, you can safely kill her, then kill the boss and you'll get the achievement.",
    ["Uldir_ZulReborn_Tactics"] = "This achievement is pretty straight forward, no one has to step onto the inner ring of the platform. Here are a few tips for the encounter:\n\n Tanks should pick all the adds, and stack them so that melee dps can cleave them.\n Ranged dps should be on the boss 24/7, and should not switch to the adds unless melee dps can't keep up killing them in time.\n If you have 2 priests in the group, then you should assign them to different positions (left and right outside of the group) so that both sides are covered when adds spawn.\n At 40%% IAT_138967 will knock back everyone, so you should position yourself near a wall so you don't get knocked off the platform.",
    ["Uldir_Mythrax_Tactics"] = "As of November 2018: The achievement now functions as described.\n\n This makes the achievement much more easier, as you just pick up the orbs that you spawned.",
    ["Uldir_GHuun_Tactics"] = "For this achievement you will have to make groups of 3 people to do the %s: 2 dps + 1 healer assisting them.\n\n If you have a smaller group then you should invite a few more people to help out with killing the adds",

    -------------------------------------------------------
    --- Atal Dazar
    -------------------------------------------------------
    --Tactics
    ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \n\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",
    ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",
    ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",
    
    --Chat Output
    ["AtalDazar_BringingHexyBack_Hex"] = "Atleast one players needs to be hexed on boss kill!", --TODO

    -------------------------------------------------------
    --- Freehold
    -------------------------------------------------------
    --Tactics
    ["Freehold_SkycapNKragg"] = "To summon IAT_138314 you have to place a %s before you pull the boss.",
    ["Freehold_RingOfBooty"] = "For this achievement you will have to pick up 3 items throughout the instance. Sharkbait's Empty Dish spawns in the nest at the first boss after you defeat it, Gourmet Parrot Chow is found on top of a platform in The Rum Quarter, and Serve Sharkbait's Meal is found near Sharkbait after the third boss.",
    ["Freehold_HarlanSweete"] = "Harlan Sweete will target a random player for %s, which will have to position near one of the chests, so that they will end up being destroyed.",

    -------------------------------------------------------
    --- Kings Reset
    -------------------------------------------------------
    --Tactics
    ["KingsRest_Other"] = "The first trinket is in the first room of the dungeon, behind the sarcophagus, undeath the baskets.\n The second trinket is in the first boss hallway, at the end of the platform, behind the last set of stairs.\n The third trinket - (Check out the Glory of the Wartorn Hero Achievement Guide for details on WowHead)\n The fourth trinket is located before the final boss room, at the bottom of the strairs, at the top of the right pillar.",
    ["KingsRest_MchimbaTheEmbalmer"] = "For this achievement you will have to free the player targeted by %s without him using %s more than once, and also free him before the boss finishes casting %s.\n\n Note: Players have reported a minor bug with this achievement, and it's recommended that the entombed player does not use Struggle before the boss casts Open Coffin.",
    ["KingsRest_DazarTheFirstKing"] = "This achievement is obtained at King Dazar, the last boss in the instance. Have two players each stay on top of the stones in front of the two sarcophagi, and the lights will start filling up around the stone. Once they are both lit up, the right sarcophagus will start shaking which means that you can kill the boss.",

    -------------------------------------------------------
    --- Shrine of the Storm
    -------------------------------------------------------
    --Tactics
    ["ShrineOfTheStorm_Other"] = "The %s is picked up at the start of the dungeon, in the first room. If you receive any frost damage then the spirit flames will be extinguished so it's recommended to first clear all the trash to the third boss, and then pick up the breath. Do not kill the first boss as that will make the breath despawn. Once you light up the shrines to the third boss you will get the achievement.",
    ["ShrineOfTheStorm_LordStormsong"] = "During the course of the encounter, Lord Stormsong will periodically begin to %s which summons Awoken Void that will chase players and attempt to explode upon impact. To obtain this achievement, you must not come into contact with any of the void adds so you will keep kiting them throughout the encounter.",
    ["ShrineOfTheStorm_VolZith"] = "To get the %s debuff you will have to dive down in the water before the last boss until you see Void Orbs floating around, and then swim through them. The debuff will make you hostile to all players for 24 seconds, then disappear for 6 seconds time in which your healer must use cds and heal you to full hp. Avoid using aoe spells on the boss, and instead use self heals as much as possible to help your healer out.\n\n After Vol'zith the Whisperer casts %s, you will get teleported into the sunken realm where you should quickly kill the adds and then wait 20-30 seconds for cooldowns to be available. Vol'zith the Whisperer will also cast %s, and you will have to crowd control 5 Manifestation of the Deep adds so that they won't reach the boss.",

    -------------------------------------------------------
    --- Siege of Boralus
    -------------------------------------------------------
    --Tactics
    ["SiegeOfBoralus_DreadCaptainLockwood"] = "Dread Captain Lockwood will continuously attempt to retreat from players using %s unless she is snared or rooted. As the achievement description implies, you have to keep her snared or rooted and prevent her from ever using %s. \n\n This achievement is currently bugged, and this has been confirmed by multiple game masters.\n\n You can bypass the bug by using a long cc spell on her at 97%% energy, spells has such as %s, %s, %s, %s as ideal as they last 15 seconds or more. You will have to kill the Ashvane Cannoneer really fast and use %s before the snare fades away.",
    ["SiegeOfBoralus_ViqGoth"] = "During the encounter, Viq'Goth will use %s which causes a barrage of putrid water around the area. During this, several Gasping Flounders will be thrown on the land which you will have to kick back into the water before defeating the boss.",
    ["SiegeOfBoralus_Other"] = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Blacksmithing) Brutik Blackanvil - The hammer is found down the stairs to the docks at 58, 70.\n (Engineering) Threshanator 3000 - The NPC is found right at the start of the instance.\n (Alchemy) Liz Vilepot - The 'Strange Vial' is found near a table at at 54, 74.",

    -------------------------------------------------------
    --- Temple of Sethraliss
    -------------------------------------------------------
    --Tactics
    ["TempleOfSethraliss_Merektha"] = "In order to reveal the Solid Egg that is hidden on top of the bones, you will have to use %s, %s, %s or other ground damaging abilities. To make the egg hatch, have your dps and healer stack under the boss and wait for it to cast %s. Once the Solid Snake spawns, you can kill it, and then click on it to get the %s buff that grants you the achievement.\n\n Note: The Solid Snake might evade attacks but it will teleport to the ground after a few seconds. If you have a Death Knight in your group you should %s the Solid Egg down, which will not only bypass this bug, but also make positioning easier.",
    ["TempleOfSethraliss_AvatarOfSethraliss"] = "For this achievement you will have to /kiss Plague Toad until one of them transforms into a 'Prince' which looks like Trade Prince Gallywix. The 'Prince' cannot die so you don't have to worry about using aoe spells",
    ["TempleOfSethraliss_Trash"] = "For this achievement you will want to use class utility abilities to crowd control the Orb Guardian while you get both eyes closer. Note that there are several Orb Guardian throughout the room that will attempt to steal your eye back, there is one near each eye, one in between the eyes and the skull, and a few more in the middle of the room.\n\n Abilities such as %s, %s and %s are ideal, as you can cc the guardians on one side and then ignore them completely.",

    --Chat Output
    ["TempleOfSethraliss_Merektha_LootSnake"] = "Loot the %s now to complete the achievement", 

    -------------------------------------------------------
    --- The Motherlode
    -------------------------------------------------------
    --Tactics
    ["The_Motherlode_CoinOperatedCrowdPummeler"] = "Pick up %s before the boss and throw it at Ledley the Bold after you engage the boss. Ledley the Bold will cast %s throughout the fight so you should interrupt the spell and kill him and the other adds asap as they will throw grog, making you drunk for 10 seconds.",
    ["The_Motherlode_MogulRazdunk"] = "Similarly to the predecessors of this achievement, this is a personal achievement that requires you to dodge most of the damaging mechanics of the boss encounter.",

    -------------------------------------------------------
    --- The Underrot
    -------------------------------------------------------
    --Tactics
    ["TheUnderrot_ElderLeaxa"] = "Elder Leaxa's abilities apply %s to players whenever they take spell damage. This means means that all of her abilities will have to be interrupted and dodged in order to prevent this debuff.\n\n To make the achievement easier, you can have your healer go dps so you have an extra interrupt, and also kill her faster.",
    ["TheUnderrot_SporecallerZancha"] = "Musashitake is located in the top left corner of the room. To make him active you will have to make the boss cast %s in his direction.\n\n Note: If Musashitake evades attacks then just go the middle of the room, and he will shortly teleport there.",
    ["TheUnderrot_UnboundAbomination"] = "Puddles of %s will occasionally coalesce into %s adds which fixate a random player. You will have to kill the boss without having any %s die, which is easily done by kiting them in a circle around the room.\n\n Make use of cc in order to slow them, and remember to check your talents, trinkets and azerite traits so you don't accidentally kill the spores.",

    -------------------------------------------------------
    --- Tol Dagor
    -------------------------------------------------------
    --Tactics
    ["TolDagor_KnightCaptainValyri"] = "For this achievement you will want to tank the boss in the middle of the room, and have the other 4 players move the barrels close to Knight Captain Valyri. You will want to move the barrels away from the fire:\n %s - This spell is cast underneath players, you simply have to move the barrel away.\n %s - When Knight Captain Valyri casts this spell, you will have to move the barrel away from where the boss is facing towards.\n %s - When a player gets this debuff, they have to move away from the barrel immediately and wait for a dispel.",
    ["TolDagor_OverseerKorgus"] = "Shortly after you start the encounter, Overseer Korgus fires %s rounds at each player and applies %s. Every time a player moves its effects get stronger and will eventually cause the player to be stunned for 8 seconds, and you should do this as a group at the start of the encounter since there are no abilities to dodge.",
        
    -------------------------------------------------------
    --- Waycrest Manor
    -------------------------------------------------------
    --Tactics
    ["WaycrestManor_SoulboundGoliath"] = "Soulbound Goliath gets a stacking buff called %s every 2 seconds, so to get this achievement you will have to kite the boss through patches of %s that spawn in the area in order to keep the %s stacks low.",
    ["WaycrestManor_GorakTul"] = "During the Gorak Tul encounter, the boss will periodically toss out %s which you will need to use to burn the corpses of Deathtouched Slavers, so they can't respawn. Once the boss casts %s and summons the third add you will have to nuke the adds, and then quickly use %s to burn their corpses.",
    ["WaycrestManor_Other"] = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Leatherworking) Huntmaster Grath - The map to summon this boss is found in the hunting lodge section of Waycrest, in the corner of the Kraker fireplace room.\n (Tailoring) Seamstress Johanna - The 'Cursed Loom' (a bolt of cloth) is found in the Banquet Hall, on the top floor.\n (Herbalism) Groundskeeper Lilith - The 'Vile pod' is found in the fountain across the courtyard where Soulbound Goliath is.\n (Inscription) Governess Tabitha - The 'Ancient Tome' is found in a bookshelf on the main floor, on the left side just before you descend to the cellar.\n (Cooking) Head Vintner Justin - The wine is found in the cellar, near other casks of wine.",  

    -------------------------------------------------------
    --- The Emerald Nightmare
    -------------------------------------------------------
    --Tactics
    ["TheEmeraldNightmare_Nythendra"] = "During the Heart of the Swarm phase, glow bugs will spawn around the edges of the room. Once they spawn players need to click on the bugs to squish them. Once 15 bugs have been squished you can kill the boss. 5 bugs spawn each phase so you will need a minimum of 3 Heart of the Swarm phases to complete this achievement.",
    ["TheEmeraldNightmare_Ursoc"] = "Kill the trash to the right hand side before of the entrance to the boss room. Free Tur Ragepaw and wait for him to reach the boss. Nuke the boss down while keeping Tur Ragepaw alive.",
    ["TheEmeraldNightmare_DragonsOfNightmare"] = "There are 4 portals around the boss room. Everyone in the group must go into each of the 4 portals and collect 1 mist from each portal which gives them a buff. Once all players in the group have 4 buffs %s %s %s %s you can kill the boss. The easiest way to do this is to split the group up into 2 then have half the group collect the 4 buffs at once.",
    ["TheEmeraldNightmare_EleretheRenferal"] = "For this achievement, there are 7 eggs with a glowing red effect located around the room. To complete this achievement all 7 eggs need to be destroyed by running over them. Some of the eggs can only be reached by using %s or players using effects such as %s, %s or %s. Once all 7 eggs have been destroyed you can kill the boss.\n\n Note: If you cannot see any of the eggs, they will respawn after you have killed the boss.",
    ["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "Wait for 20 Nightmare Ichors to spawn. Once you have 20 adds, everyone should stand in front of the eye, then AOE down all the adds together. Once 20 adds have been killed in 10 seconds ontop of the eye, you can kill the boss.",
    ["TheEmeraldNightmare_Cenarius"] = "At max level, with enough dps you can kill the boss before any of the Forces of Nightmare are cleansed.",
    ["TheEmeraldNightmare_Xavius"] = "To complete this achievement, you will need a Demon Hunter to use his %s ability. Around the outer edges of the boss rooms, a Creature in the Dark will spawn at 3 points during the fight. The Demon Hunter will need to use his %s ability to find the add and drag it into the centre of the room. The adds spawn at 100-65%%, 65%%-30%% and below 30%%. Once all 3 Creatures in the dark have been killed, you can kill the boss.",

    --Chat Output
    ["TheEmeraldNightmare_NightmareIchors"] = "Nightmare Ichors",
    ["TheEmeraldNightmare_IllgynothComplete"] = "20 Nightmare Ichors have spawned. They can now be killed at the eye",
    ["TheEmeraldNightmare_NightmareIchorsKilled"] = "Nightmare Ichors Killed:",
    ["TheEmeraldNightmare_DragonsOfNightmare_PlayersWithBuffs"] = "Players with all 4 buffs",
    ["TheEmeraldNightmare_Xavius_CreaturesKilled"] = "Creature of Madness Killed",
    ["TheEmeraldNightmare_Nythendra_BugsSquished"] = "Glow Bugs Sqished",

    -------------------------------------------------------
    --- Trial of Valor
    -------------------------------------------------------
    --Tactics
    ["TrialOfValor_Odyn"] = "For this achievement you will need to reach phase 2 by killing Hymdall and Hyrja. Next you will need to wait for the boss to cast [Draw Power]. The runes around the room will light up and adds will spawn with corresponding runes above their head. You will need to remember the order the runes lite up then drag the corresponding add to each of rune on the floor and kill. Make sure you kill each of the adds on their respective rune before placing the next add on it’s respective rune. For example if the yellow rune lit up first then orange, drag the yellow add to the rune and kill, then drag the orange add to the rune and kill. If you complete the achievement you will gain %s which means you can kill the boss.",
    ["TrialOfValor_Guarm"] = "For this achievement, a player will need to pick up %s next to the boss at the start of the fight. This bone will need to be dragged into each of the 3 breaths cast by the boss (%s, %s, %s).\n\n Note: Do not do any of the following while holding the bone or you will drop it.\n Do not cast any spells.\n Do not get hit by [Roaring Leap].\n Dying while holding the bone.\n\n You will need a separate player to soak each of the breaths. Therefore once one player has soaked a breath, they will need to drop the bone so another player can pick it up. Once all 3 breaths have been soaked while holding the chew toy you can kill the boss.",
    ["TrialOfValor_Helya"] = "At max level, this achievement is easier to complete solo. Simply kill the boss while you don’t have the %s debuff. This is done by making sure the Grimelord add is killed.",

    --Chat Output
    ["TrialOfValor_Guarm_Part1"] = "Fiery Phelgm (Orange) part of",
    ["TrialOfValor_Guarm_Part2"] = "Salty Spittle (Green) part of",
    ["TrialOfValor_Guarm_Part3"] = "Dark Discharge (Purple) part of",

    -------------------------------------------------------
    --- The Nighthold
    -------------------------------------------------------
    --Tactics
    ["TheNighthold_Skorpyron"] = "At max level, have your whole group stand on the circle in the middle of the room and nuke down the boss before he casts %s.",
    ["TheNighthold_ChronomaticAnomaly"] = "This achievement is easier to complete in heroic mode. Random players will get a %s debuff. These players need to stand on the blue circles around the boss room until the %s debuff expires. Once it expires you should see a spotlight appear at each of the blue circles around the room. Once at least 8 circles around the room have spotlights, you can kill the boss.",
    ["TheNighthold_SpellbladeAluriel"] = "This achievement requires dragging Spellblade Aluriel to various locations around the instance.\n\n The Shal’dorei Terrace: Located in the Botanist boss area. This can be completed on the bridge.\n Astromancer’s Rise: The room directly below Star Augar Etraeus.\n The Shattered Walkway: Located in front of Krosus.\n\n This achievement will take 3 lockouts to complete and can be completed in a single day.",
    ["TheNighthold_StarAugurEtraeus"] = "For this achievement, you will need to drag Nether Elemental add being bound by 2 other adds located in the Spellblade Aluriel boss room up to Star Augar.\n\n You then need to dps the boss down to 30% without damaging the add. The add will then transform into a Well-Traveled Nether Elemental at which point you can kill the add then finish off the boss.",
    ["TheNighthold_HighBotanistTelarn"] = "Scattered around the botanist gardens are Mysterious Fruits. To complete this achievement every player needs to eat one of these fruits before pulling the boss and must not die during the encounter. The mysterious fruit will give the player the %s debuff. At max level you can simply nuke down the boss.\n\n Note: You must have at least 10 players minimum to complete this achievement.",
    ["TheNighthold_Krosus"] = "To complete this achievement, you must let 15 Burning Embers fall in the water during the bridge breaks. At max level you can simply not soak any of the %s to maximise the amount of Burning Embers. Once completed the achievement will go white and you can kill the boss.\n\n Note: The amount of Burning Embers that spawn depends on the group size. It is recommended to have 10+ players in the group to complete this achievement although this can vary depending on RNG.",
    ["TheNighthold_Tichondrius"] = "At max level, you can simply kill the boss before he casts %s.\n\n Note: This achievement is a personal achievement.",
    ["TheNighthold_Elisande"] = "For this achievement you will need to summon a Infinite Whelp pet before pulling the boss. You then to wait for the Expediant Elementral and Recursive Elemental to spawn then kill both on top of one another. Next drag the Infinite Whelp pet into the overlapping bubbles created from the elementals dying. This will spawn allow the Infinite Whelpling to be killed. Once the add is dead you can kill the boss.",
    ["TheNighthold_Guldan"] = "During phase 2, group up and wait for %s to spawn. The eyes will %s themselves over time spawning more and more eyes. Once 16 %s have spawned, nuke them down within 3 seconds of one another. Once this is done, you can kill the boss.",

    --Chat Output
    ["TheNighthold_Skorpyron_NoPlayersHit"] = "No players were hit by Shockwave",
    ["TheNighthold_Trilliax_ToxicSlices1"] = "Toxic slice eaten. You can only eat a maximum of",
    ["TheNighthold_Trilliax_ToxicSlices2"] = "more toxic slices",
    ["TheNighthold_StarAugur_KillAdd"] = "Kill the Well-Traveled Nether Elemental now",
    ["TheNighthold_Spellblade_Location1"] = "'The Shal'dorei Terrace part of'",
    ["TheNighthold_Spellblade_Location2"] = "'Shattered Walkway part of'",
    ["TheNighthold_Spellblade_Location3"] = "'Astomancers Rise part of'",
    ["TheNighthold_Botanist_LostBuff"] = "has LOST the Mysterious Fruit debuff",
    ["TheNighthold_Botanist_GainedBuff"] = "has got the Mysterious Fruit debuff",
    ["TheNighthold_Krosus_AddKilled"] = "killed a Burning Ember",
    ["TheNighthold_Krosus_AddKilledTotal"] = "Burning Embers Killed",
    ["TheNighthold_Guldan_Eyes"] = "Eye of Gul'dan",
    ["TheNighthold_Guldan_EyesTotal"] = "16 Eye of Gul'dan have spawned",

    -------------------------------------------------------
    --- Tomb of Sargeras
    -------------------------------------------------------
    --Tactics
    ["TombOfSargeras_Goroth"] = "Place world markers in a line and have your ranged dps and healers stack up on them so that Goroth spawns the %s in a straight line pointed towards him. Once someone is marked by %s they will have to go behind the pillars so that the star collides with the %s and destroys them.\n\n Rinse and repeat until the tracker goes white and then you can kill the boss.",
    ["TombOfSargeras_DemonicInquisition"] = "Execute the fight as you normally do and slowly stop dps around 10-20%%. Now whenever Belac reaches one hundred energy he will cast %s, so everyone in the raid should attack him to get max torment really fast.\n\n Once everyone in the group has max torment you can kill the boss.",
    ["TombOfSargeras_Harjatan"] = "To spawn Elder Murk-Eye someone in the raid has to use the IAT_143660 toy.\n\n Use the toy at the start of the fight, focus Elder Murk-Eye, and after he dies you can kill the boss.",
    ["TombOfSargeras_MistressSasszine"] = "Hydra Essence comes from a player being hit by %s within Sarukel's %s.\n Ink Sauce comes from a player soaking the %s patch which has to come in contact with Sarukel's %s.\n Player Seasoning comes from a player willing to give their life by going into the inner circle of Sarukel's %s.\n Eel Tartare comes from the Abyss Stalkers, one of which has to die within Sarukel's %s.\n Murloc Fillet comes from the murlocs (Razorjaw Waverunners) from Phase 1, one of which also has to die within Sarukel's %s.\n Note: The Murlocs and the Abyss Stalkers need to be low health around 10%% before they can be sucked into the Maw. \n\n Preparation: To make this achievement extremely easy we recommend you use a third tank that will taunt murlocs and abyss stalkers away from the group so that they don't die to accidental cleave damage.\n Murlocs (Razorjaw Waverunners) only spawn in Phase 1 (100%%-70%%) and players should stand within %s patches so that the tank can pick them up once stunned players get dispelled.\n Abyss Stalkers will continue to spawn throughout Phase 2 so you don't have to worry about them too much.\n Strategy: To make the fight even easier you should first focus on getting 'Hydra Essence', 'Eel Tartare' and 'Murloc Fillet' parts of the achievement. %s (Ink Sauce) will stop Sarukel from casting %s so you should try to do this last at the same time with 'Player Seasoning' by sacrificing one of the players who soaked the ink.",
    ["TombOfSargeras_SistersOfTheMoon"] = "On your way to the Sisters room you'll enter a large room full of trash and to the left you will find an isolated add called Twilight Soul, which you will have to pick up and interrupt throughout the fight.\n\n Bring the boss down to 20% health and the Twilight Soul will change its color to blue. Now you can kill the add, then kill the boss and you'll get the achievement.",
    ["TombOfSargeras_TheDesolateHost"] = "At the start of the fight a soul falls down and a player has to catch it by standing in the swirly yellow circle underneath the Engine of Souls.\n After that, every 5 seconds the soul will be launched in a random direction and a player from the opposite realm has to catch it. \n\n You will have to assign two people in each realm because the same person cannot soak two times in a row. The reason you do that is because if one of the players has the 'soul' above their character that means they recently caught it and are unable to do it again until someone else from the same realm catches the soul.\n\n Soak Rotation\n Soaker 1 - Corporeal Realm\n Soaker 1 - Spirit Realm\n Soaker 2 - Corporeal Realm\n Soaker 2 - Spirit Realm\n\nTips\n To make soaking easier, assigned players have to be marked and once they catch the soul they should always move towards a marked position such as the center of the room.\n Soakers should also watch out for the Reanimated Templar as as he will periodically cast %s, a spell that will knock them back if they get hit by the fel waves.\n Everyone affected by %s should move as far away as possible to avoid placing a wedge of shadow goo on the ground where the soul is supposed to be caught.",
    ["TombOfSargeras_MaidenOfVigilance"] = "There are a total of 9 Titanic Anomalies that you have to catch: 5 inside the well and 4 above the platform where you fight the Maiden of Vigilance.\n\n Split the raid into 2 parts as usual and then place a third world marker where assigned players will stack up to cause %s on themselves.\n\n The first Titanic Anomaly is pretty hard to capture since the gravity will pull you down as soon as you get %s. This is where your Demon Hunters, Hunters and Shamans come in handy due to their mid-air displacement abilities and because you don't want to waste too much time with this first orb you should sacrifice one of them.\n\n The next four Titanic Anomalies spawn as soon as the first one is captured and they rotate in a clockwise direction. You will have to go by trial and error until people get used to the timings. Jumping when you have 5 seconds left on the debuff seems to be the best moment to do it since you'll also make it back on the platform after you've captured the orb.\n\n Once you've collected all the orbs inside the well, the last four Titanic Anomalies will spawn above the platform and these ones are much easier to get. Just zoom out your camera and position your back towards the orbs so that you will catch it when you get knocked up into the air.",
    ["TombOfSargeras_FallenAvatar"] = "At max level you can just kill the boss before he cast %s.",
    ["TombOfSargeras_Kiljaeden"] = "Preparation:\n Get as many Death Knights as you possibly can since their %s and %s are necessary for this achievement.\n Make sure every single player in the raid has their minimap zoomed in. As soon as someone finds Illidan during 'Intermission: Deceiver's Veil' that player can ping on the minimap to let others know of his location.\n Due to their insane mobility, Monks and Warriors are extremely helpful and they should talent %s / %s.\n\n Strategy\n Tank Kil'jaeden in a corner of the platform to force the adds to spawn close to each other.\n Assign your Death Knights to grip the Shadowsouls. They should always %s first and then %s.\n Everyone should spread out in a semicircle around Kil'jaeden so that at least 1 person will instantly find Illdan, get the %s buff and then rush towards the Shadowsouls to AoE stun and kill them.",

    --Chat Output

    -------------------------------------------------------
    --- Antorus the Burning Throne
    -------------------------------------------------------
    --Tactics
    ["AntorusTheBurningThrone_GarothiWorldbreaker"] = "For this achievement once someone is targeted by %s, that player will have to move near a worm in order to get it killed.\n\n Once you have killed 16 worms, the achievement will turn white and you can kill the boss",
    ["AntorusTheBurningThrone_FelhoundsOfSargeras"] = "During the fight several pools of orange and purple color will spawn throughout the room. The tanks will have to bring each felhound to the pool that matches their own color in order to get a stack of %s. \n\nNote that the %s stacks get removed if the felhounds come close to each other. \n\nOnce both F'harg and Shatug have 5 stacks each you can kill the bosses.",
    ["AntorusTheBurningThrone_AntoranHighCommand"] = "At max level, you can just nuke the boss down without placing any %s",
    ["AntorusTheBurningThrone_PortalKeeperHasabel"] = "To open the Chaotic Rift, one player must be affected by all 3 debuffs from each platform at the same time. Bear in mind that this can only be done in Phase 1, which ends when the boss reaches 90%%, so make sure not to dps the boss at all.\n\nTo make this achievement easier, you can have one player bring the %s (orange debuff) close to the green platform. After that, another player can pick up the %s (purple debuff) from the purple platform, and then go to the green platform to pick up the %s (orange debuff) and the %s (green debuff).\n\nCombining these three debuffs will open a chaotic rift which will pull you constantly towards the back of the room.\n\nOnce the Chaotic Rift is open you can kill the boss",
    ["AntorusTheBurningThrone_Eonar"] = "For this achievement, you will need to collect the 5 orbs of life within Eonar's Sanctuary. This achievement can be obtained only after you defeat the encounter. \n\nThe orbs spawn in a fixed pattern. After collecting the first  Orb of Life, you will then have to collect the rest within a certain amount of time or the orb sequence will reset.\nOrb 1 - Spawns on the platform which is connected to the lower and upper tracks with jump pads. Upon entering the Sanctuary, the platform is straight ahead.\nOrb 2 - Spawns on one of the pillars at the door near the middle path, which is the door you enter the Sanctuary through.\nOrb 3 - Spawns underneath Eonar's Essence platform, which is located to the left upon entering the Sanctuary.\nOrb 4 - Spawns between the two pillars underneath the upper path and is close to the first orb.\nOrb 5 - Spawns on a balcony far forward from the entrance to the Sanctuary, which you can reach by using the Extra Action Button.\n\n Once all 5 orbs are picked up, everyone in the raid group will get credit for it and obtain the achievement.",
    ["AntorusTheBurningThrone_ImonarTheShoulhunter"] = "For this achievement, you have to trigger all the traps on the bridge during the 2 intermissions. Intermission one happens at 66% health and Intermission two happens at 33% health. Once both intermissions are complete you can kill the boss",
    ["AntorusTheBurningThrone_Kingaroth"] = "For this achievement you will want to have your entire raid group stay in melee range of the boss and only detonate the %s that spawn in melee.\n\n Slowly dps the boss down until atleast 9 %s have spawned. Wait for the adds to come to the boss to avoid detonating %s",
    ["AntorusTheBurningThrone_Varimathras"] = "%s is triggered whenever a player is not within 8 yards of another player. Varimathras casts %s every 35 to 40 seconds, which will knock back the first target that he gets in contact with.\n\n The easiest way to complete this achievement at max level is to have your entire raid stack up against the wall with the tanks slightly in front of the group. You can then just kill the boss without anyone in the group moving.",
    ["AntorusTheBurningThrone_CovenOfShivarra"] = "This achievement is pretty straightforward and easy, however how you deal with the adds depends on your RNG:\nIf you get the %s as your first or second torment then you should kill all of them since your healers might struggle keeping everyone alive, and then wait for another wave to spawn.\n\nThe %s can be crowd controlled, so use abilities such as %s, %s or %s\n\nDon't forget to spread out while %s is active and move into a safe spot from the %s",
    ["AntorusTheBurningThrone_Aggramar"] = "For this achievement you will have to transform an Ember of Taeshalach into a Manifestation of Taeshalach. To accomplish that, the Ember has to get hit twice by Aggramar's %s combo.\n\nFirst you will want to let the Ember of Taeshalach move away from the edge of the platform, and then have a  Warlock %s it. In case you don't have any warlocks, you can use %s, %s or other crowd controls, however make sure that everyone stops dps on the boss to avoid any kind of accidental cleave, which might end up breaking the crowd control.\n\nThe %s is %s - %s - %s - %s - %s\n\nNote that you have to transform the Ember of Taeshalach within a single phase or else it will detonate, and because of this you should do it in Stage 2: Champion of Sargeras (80%%-40%%).",
    ["AntorusTheBurningThrone_Argus"] = "For this achievement you will first have to get to Phase 4 of the fight. Once Argus kills the group only have the healers and tanks respawn using the tree. The rest of the group should stay dead and spread around the edges of the room.\n\nNow whenever Argus spawns atleast 6+ Reorigination Modules, wait for them to explode then have the players dead collect the Motes of Titanic Power around the room. You may wish to asssign one person inside the spirit world to make a short countdown so that everyone starts picking up the motes at the exact same time since you only have 5 seconds to complete the achievement. Once this is done, have the remaining players respawn using the tree and kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Seat of the Triumvirate
    -------------------------------------------------------
    --Tactics
    ["SeatOfTheTriumvirate_ZuraalTheAscended"] = "",
    ["SeatOfTheTriumvirate_Saprish"] = "",
    ["SeatOfTheTriumvirate_Lura"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Assault on Violet Hold
    -------------------------------------------------------
    --Tactics
    ["AssaultOnVioletHold_MillificentManastorm"] = "",
    ["AssaultOnVioletHold_Festerface"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Eye of Azshara
    -------------------------------------------------------
    --Tactics
    ["EyeOfAzshara_WarlordParjesh"] = "",
    ["EyeOfAzshara_LadyHatecoil"] = "",
    ["EyeOfAzshara_WrathOfAzshara"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Darkheart Thicket
    -------------------------------------------------------
    --Tactics
    ["DarkheartThicket_Dresaron"] = "At max level, pull the boss, run through the big egg behind the boss to hatch it. Next kill the Hatespawn Abomination that spawns then kill the boss",
    ["DarkheartThicket_ShadeOfXavius"] = "DPS the boss down to 15%%-20%% health. Drag the boss through the swirly puddles on the ground until the boss has 10 stacks of %s then kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Valor
    -------------------------------------------------------
    --Tactics
    ["HallsOfValor_Other1"] = "",
    ["HallsOfValor_Other2"] = "",
    ["HallsOfValor_Odyn"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Neltharion's Lair
    -------------------------------------------------------
    --Tactics
    ["NeltharionsLair_Other"] = "",
    ["NeltharionsLair_Naraxas"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Vault of the Wardens
    -------------------------------------------------------
    --Tactics
    ["VaultOfTheWardens_AshGolm"] = "",
    ["VaultOfTheWardens_Cordana"] = "",
    ["VaultOfTheWardens_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Black Rook Hold
    -------------------------------------------------------
    --Tactics
    ["BlackRookHold_Other"] = "",
    ["BlackRookHold_AmalgamOfSouls"] = "",
    ["BlackRookHold_IlysannaRavencrest"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Maw of Souls
    -------------------------------------------------------
    --Tactics
    ["MawOfSouls_Ymiron"] = "",
    ["MawOfSouls_Helya"] = "",
    ["MawOfSouls_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Arcway
    -------------------------------------------------------
    --Tactics
    ["TheArcway_Ivanyr"] = "",
    ["TheArcway_Corstilax"] = "",
    ["TheArcway_AdvisorVandros"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Court of Stars
    -------------------------------------------------------
    --Tactics
    ["CourtOfStars_PatrolCaptainGerdo"] = "",
    ["CourtOfStars_Other"] = "For this achievement, it is suggested that you follow the steps below to increase your chances of the conversation procing.\n\n - Kill all 5 Duskwatch Sentries before engaging the first boss\n - Disable all 5 Arcane Beacons before engaging the first boss\n - Guess the Spy on first try\n\n Check out https://www.wowhead.com/achievement=10611/dropping-some-eaves#comments:id=2622946 for more info on this achievement",

    --Chat Output

    -------------------------------------------------------
    --- Return to Karazhan
    -------------------------------------------------------
    --Tactics
    ["ReturnToKarazhan_Other1"] = "",
    ["ReturnToKarazhan_OperaHall"] = "",
    ["ReturnToKarazhan_Moroes"] = "",
    ["ReturnToKarazhan_ShadeOfMedivh"] = "",
    ["ReturnToKarazhan_ManaDevourer"] = "",
    ["ReturnToKarazhan_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Cathedral of Eternal Night
    -------------------------------------------------------
    --Tactics
    ["CathedralOfEternalNight_Agronox"] = "For this achievement, you need to stand on top of the 4 Budding Seed pods around the boss room and wait for a Fulminating Lasher to %s onto each of the Budding Seed. Once this is done for each of the 4 seeds you can kill the boss.",
    ["CathedralOfEternalNight_ThrashbiteTheScornful"] = "Around the room there are 4 bookcases. To complete this achievement, you need to stand behind each of the bookcases and wait for the boss to cast %s in order to break a bookcase. Once a bookcase is broken, a clickable book appears on the floor. Each member in the group needs to click on this book. Rinse and repeat this for the other 3 bookcases in the boss room making sure you go in a clockwise direction. Once this is done, everyone in the group should have the %s buff and you can kill the boss.\n\n Note: You must have a full 5 man party to complete this achievement.",
    ["CathedralOfEternalNight_Mephistroth"] = "At the start of the fight pick up the IAT_129207. You then need to wait for the boss to reach 100 energy which will begin phase 2. During phase 2 face the shield you picked up at the start of the fight towards the %s. Once 20 %s have been reflected with the shield, the achievement tracker will turn white and you can kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Highmaul
    -------------------------------------------------------
    --Tactics
    ["Highmaul_TheButcher"] = "",
    ["Highmaul_Tectus"] = "At 110, just nuke the boss down for the first and second split. On the third split wait for all 8 versions of the boss to spawn, then AOE them down within 10 seconds of one another.",
    ["Highmaul_Brackenspore"] = "Before pulling the boss pick up the flamethrower fun. Damage the boss to below 50% health so that the green moss starts growing from the edges of the room. Once the room is full of green moss, start pressing the flamethrower button over the boss. Keep pressing the flamethrower button every time it comes off cooldown until you reach 15 stacks of Burning Infusion. Once you have 15 stacks you can kill the boss. The stacks do need to stay on you once you reach 15.",
    ["Highmaul_TwinOgron"] = "At 110, you can simply nuke the bosses down. Make sure they are standing next to each other.",
    ["Highmaul_ImperatorMargok"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Blackrock Foundry
    -------------------------------------------------------
    --Tactics
    ["BlackrockFoundry_BeastlordDarmac"] = "Takes 3 kills to complete. Boss will mount the beast that is closest to him. DPS the boss down slowly and wait for boss to mount beast before killing.",
    ["BlackrockFoundry_OperatorThogar"] = "Wait 10 seconds after pulling the boss then place Toy train set and then immediately after the wind up train wrecker on the first set of tracks as you enter the boss room. Achievement will be earned as soon as the requirements have been met.",
    ["BlackrockFoundry_IronMaidens"] = "Nuke all 3 bosses within 10 seconds of one another",
    ["BlackrockFoundry_HansgarFranzok"] = "Nuke boss down as quick as possible without anyone in the group getting hit by a stamping press. The stamping press display an orange glow on the floor a few seconds before stamping.",
    ["BlackrockFoundry_FlamebenderKagraz"] = "1 person tank Aknor Stellbringer away from the boss. Everyone else single target the boss down.",
    ["BlackrockFoundry_Kromog"] = "Requires atleast 10 players but more players makes achievement easier. Spread out around the room and wait for orange runes to spawn. When they spawn each player stand on their own rune. When hands spawn from runes and grab players nuke hands down as quickly as possible.",
    ["BlackrockFoundry_Gruul"] = "1 player tank boss at entrance to room with boss facing into the center of the room. Everyone else stand underneath the ore which is positioned on the ceiling of the boss room. When boss casts overhead smash, players will be flung into the air. Click on the ore on the ceiling to collect it. Once all 3 ores have been collected you can nuke boss.",
    ["BlackrockFoundry_Oregorger"] = "",
    ["BlackrockFoundry_BlastFurnace"] = "Completed during phase 2. During phase 2, 4 random players will be targeted by slag elementals. If you have a slag elemental following you, run to one of the primal elementalists which doesn’t have a slag elemental already on. Once there is slag elemental on each primal elementalists you can nuke down the slag elemental then primal elementalists as quick as possible. Getting all 4 primal elementalists down within 10 seconds will reward this achievement.",
    ["BlackrockFoundry_Blackhand"] = "DPS the boss down to 30% to reach phase 3. Ashes will then start falling from the ceiling. Spread out around the platform and stand underneath the falling ashes until it lands on you. Once the group has collected 20 falling ashes you can nuke boss. The more players you have the easy this achievement is.",

    --Chat Output

    -------------------------------------------------------
    --- Hellfire Citadel
    -------------------------------------------------------
    --Tactics
    ["HellfireCitadel_HellfireAssault"] = "At 110, simply nuke down all the mobs/vehicles as quick as possible. Make sure to keep an eye on the Felfire Crushers and Artillery especially",
    ["HellfireCitadel_IronReaver"] = "On the ledges to the left and right of the boss there are untargetable Hellfire Guardians. Bring the boss up against these ledges facing the boss towards the Hellfire Guardians. When the boss casts barrage, this should kill the mobs.",
    ["HellfireCitadel_HellfireHighCouncil"] = "Nuke down all 3 bosses so that they die within 10 seconds of one another",
    ["HellfireCitadel_Gorefiend"] = "During Feasts of Soul phase, players who do not have the Gorefiends Corruption debuff need to die. This can be done by standing in the pool the boss is sitting in. Once dead the players will get teleported into the belly of the boss. They need to kill the Fragment of the crone once inside. Once the fragment of the crone is dead, the soul of the crone will spawn in the boss room which can then be killed by the group.",
    ["HellfireCitadel_ShadowLordIskar"] = "At 110, just simply nuke down the boss without picking up the Eye of Anzu",
    ["HellfireCitadel_SocretharTheEternal"] = "During phase 2. Use the robot to put up a prison at the blue portal. Continue to use the prison at the portal to trap the adds until 20 Haunting Souls are trapped. Once this is done, leave the vehicle and aoe all the adds down. Players can also cc the adds to keep them in place. Do not kill the adds with the robot.",
    ["HellfireCitadel_TyrantVelhari"] = "1 person tank the Ancient Enforcer away from the group. Everyone else nuke the boss down",
    ["HellfireCitadel_Mannoroth"] = "At the start of the fight kill the green & purple summoner. Wait for a player to get curse of the legion debuff before killing the red summoner. Once the curse of the legion debuff runs out or is dispelled, a doom lord will spawn. Get the doom lord down to 5% health. Next dps down Mannoroth to 30% health. Once this is done place the doom lord in front of the boss and wait for it to get killed by Mannoroth Empowered Fel Seeker ability. Once the doom lord has been killed by the boss, you can kill the boss.",
    ["HellfireCitadel_Archimonde"] = "Wait for the Doomfire Spirit to spawn then nuke down boss. The Doomfire Spirit does not need to stay alive",

    --Chat Output

    -------------------------------------------------------
    --- Bloodmaul Slag Mines
    -------------------------------------------------------
    --Tactics
    ["BloodmaulSlagMines_SlaveWatcherCrushto"] = "",
    ["BloodmaulSlagMines_Magmolatus"] = "At 110, dps down the boss slowly so that both Calamity and Ruination have a chance to spawn",
    ["BloodmaulSlagMines_Gugrokk"] = "At 110, single target the boss down so that no Unstable Slags are killed",

    --Chat Output

    -------------------------------------------------------
    --- Iron Docks
    -------------------------------------------------------
    --Tactics
    ["IronDocks_FleshrenderNokgar"] = "",
    ["IronDocks_Other"] = "",
    ["IronDocks_Skulloc"] = "",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    ["Auchindoun_SoulbinderNyami"] = "",
    ["Auchindoun_Azzakel"] = "",
    ["Auchindoun_Terongor"] = "",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    ["Skyreach_Ranjit"] = "",
    ["Skyreach_Rukhran"] = "",
    ["Skyreach_HighSageViryx1"] = "",
    ["Skyreach_HighSageViryx2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Grimrail Depot
    -------------------------------------------------------
    --Tactics
    ["GrimrailDepot_RocketsparkAndBorka"] = "",
    ["GrimrailDepot_NitroggThundertower"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Everbloom
    -------------------------------------------------------
    --Tactics
    ["TheEverbloom_Witherbark"] = "",
    ["TheEverbloom_ArchmageSol"] = "",
    ["TheEverbloom_Yalnu"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Shadowmoon Burial Grounds
    -------------------------------------------------------
    --Tactics
    ["ShadowmoonBurialGrounds_SadanaBloodfury"] = "",
    ["ShadowmoonBurialGrounds_Bonemaw"] = "",
    ["ShadowmoonBurialGrounds_Nerzhul"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Upper Blackrock Spire
    -------------------------------------------------------
    --Tactics
    ["UpperBlackrockSpire_OrebenderGorashan"] = "",
    ["UpperBlackrockSpire_Other"] = "",
    ["UpperBlackrockSpire_RagewingTheUntamed"] = "",
    ["UpperBlackrockSpire_WarlordZaela"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Terrace of Endless Spring
    -------------------------------------------------------
    --Tactics
    ["TerraceOfEndlessSpring_ProtectorsOfTheEndless"] = "This achievement takes 3 weeks to complete. All you need to do is rotate which 1 of the 3 bosses is to be killed last each week",
    ["TerraceOfEndlessSpring_Tsulong"] = "At 110 you can simply nuke the boss since it takes ~70 seconds for the enchanted plant to die without any healing",
    ["TerraceOfEndlessSpring_LeiShi"] = "Once you have started the fight. Every player must go down the steps to left and right of the boss into the water and walk up to a Parasitoid Sha. Once a player is close enough to the Parasitoid Sha it will attach itself to the head of that player. Once everyone in the raid has a Parasitoid Sha on their head, you can single target the boss down. Do not use multi-target abilities since you may accidently kill a Parasitoid Sha",
    ["TerraceOfEndlessSpring_ShaOfFear"] = "At 110 you can simply nuke the boss. Make sure you stand in the light to avoid getting feared",

    --Chat Output

    -------------------------------------------------------
    --- Throne of Thunder
    -------------------------------------------------------
    --Tactics
    ["ThroneOfThunder_JinrokhTheBreaker"] = "The boss will randomly cast Focused Lighting Orbs on players. If the orb reaches the player it will explode. 2 players need to get the focused lighting orbs to explode into each other. To do this run away from the orb if it has been targeted on you. Once a 2nd orb has spawned, run your orb into the other players orb.",
    ["ThroneOfThunder_CouncilOfElders"] = "At 110 you can simply nuke down the boss. Make sure everyone is in the inner circle before pulling the boss.",
    ["ThroneOfThunder_Tortos"] = "Kill at least 6 Whirl Turtles in a line next to one another. Once you have enough Whirl Turtles. Click on one the whirl turtle at either end of the line to kick it into the other turtles. Make sure you are facing towards the other turtles so it gets sent in the correct direction.",
    ["ThroneOfThunder_Megaera"] = "This achievement takes 3 kills to complete. During the encounter only kill 2 of the heads leaving out a different head each time.",
    ["ThroneOfThunder_JiKun"] = "The golden egg will fall from the nest in the ceiling to the right of the boss from where you land. To do this achievement 1 player needs to jump down to the nest to the right below the platform 10 seconds after pulling the boss. Once the player is down there they need to kill the adds. This should give them a special action ability which they can use to fly up to the nest in the celling. Once there they need to watch out for the golden egg and click on it as quickly as possible. Once they have caught the egg you need a priest to cast leap of faith on that player back onto the platform. Once the egg is safely on the platform, the player with the egg must avoid all damage otherwise they will drop the egg. Nuke down the boss as soon as the egg is on the platform.",
    ["ThroneOfThunder_DurumuTheForgotten"] = "Throughout the fight there will be 3 flashes of white light somewhere on the platform. To complete this achievement the 3 players that get targeted with the beams need to stand on top of the white fog to reveal one of 3 fog beasts (orange, purple and green). Once all fog beasts have been revealed you can nuke the boss.",
    ["ThroneOfThunder_DarkAnimus"] = "This achievement may take more than 1 run to complete although you can have multiple attempts during the same lockout. If you kill the Dark Ritualists without pulling the boss, you can reset the instance since they are counted as trash mobs. To do this convert the raid to heroic after killing the ritualists. Wait for a prompt to appear on your screen asking you to leave the instance. Once you are out of the instance, change the instance mode back to normal and then reset the instance. This can be done 9 time before you get locked out of the instance.",
    ["ThroneOfThunder_TwinConsorts"] = "At 110, nuke down Lu’lin first then kill Suen.",
    ["ThroneOfThunder_LeiShen"] = "This achievement takes 4 kills to complete. Around the corners of the room there are 4 conduits. The boss will teleport to each conduit. Each week pick a different conduit to pull the boss at. Wait for the conduit to reach 3 stacks and overload then nuke the boss down.",

    --Chat Output

    -------------------------------------------------------
    --- Siege of Orgrimmar
    -------------------------------------------------------
    --Tactics
    ["SiegeOfOrgrimmar_Immerseus"] = "During the split phase, crowd control the Sha Puddles on the ground. Keep them crowed controlled until they turn into Tears of the vale. At which point you can kill them. Kill 10 Tears of the vale to gain the achievement.",
    ["SiegeOfOrgrimmar_TheFallenProtectors"] = "At 66%% the boss will place %s on a random player. You need to transfer this mark to 5 players by using the special action button on your screen which will appear once you have the debuff. You also need to transfer the Mark of Anguish at least 200 yards around the room. Spread the group around the room 40yards apart and continue to transfer the mark until the achievement goes white.",
    ["SiegeOfOrgrimmar_IronJuggernaut"] = "During the Siege phase, a random player will get targeted with the %s. This player needs to kite the laser through the mines on the ground. Once the mines have been run over by the laser they will turn superheated. At this point click on the mines to stomp on them. Stomp on 6 superheated mines to earn the achievement.",
    ["SiegeOfOrgrimmar_KorkronDarkShaman"] = "Warning: Do not AOE trash after Iron Juggernaut. 1.) Kill the Oversear with the axe to save Ji Firepaw (you only have a few seconds after entering the room to do this). 2.) Save either the Theramore citizens being held by Overseer Thathung (do not kill the citizens) or save the orcs being held by Overseer Mojka (do not kill the orcs).  3.) Collect a key from Mokuar the Treasurer and unlock a cage of prisoners.",
    ["SiegeOfOrgrimmar_GeneralNazgrim"] = "Release Gamon from the chains just outside the entrance to The Drag. Wait for Gamon to reach the boss before pulling, then just nuke the boss down.",
    ["SiegeOfOrgrimmar_Malkorok"] = "Drag the Corrupted Skullsplitter mob from the bottom of the stairs to Malkorok. Place the Corrupted Skullsplitter in the area the boss casts his Arcing Smash ability in. If the boss does not cast this ability then you need to dps the boss down the little. The boss will eventually cast Breath of Y'shaarj which should turn the Corrupted Skullspitter into a Corrupted Amalgamation. Once this happens nuke the add & boss.",
    ["SiegeOfOrgrimmar_SpoilsOfPandaria"] = "Requires at least 2 players. Split the group into 2. One group should only kill Mantid mobs and the other group should only kill Mogu mobs. This is done by one group clearing each mob type on one side of the room then using the hook to move to move back up and across to the other side of the room. Do not go through the door in the middle of the two rooms.",
    ["SiegeOfOrgrimmar_ThokTheBloodthirsty"] = "Requires at least 5 players. All players in the group need to reduce health to 50% or lower. Once this has happened the boss will move into the next phase. In this phase If you get fixated by the boss run away otherwise you will be instant killed. Kill the Kor’kron Jailer that spawns, pick up the key that drops and open the cage to the left of the room as you entered. Once the cage has been unlocked 3 times, the snail will come out. Nuke down the boss and wait for the snail to eat the remains.",
    ["SiegeOfOrgrimmar_ParagonsOfTheKlaxxi"] = "This achievement takes 3 kills to complete. Once each of bosses is killed, click on the boss to gain one of the appearances. Your role will dictate which bosses you gain appearances from. Nuke the bosses down slowly to make sure you get an appearance.",
    ["SiegeOfOrgrimmar_GarroshHellscream"] = "Wait for 18 Kor’kron Warbringers to spawn. While waiting kill the siege engineers so that the Iron Stars are not launched. Also kill the shamans so they don’t heal the mobs later on. Once you have enough mobs stand at the opposite end and facing one the iron stars (this is done so the mobs are not accidently killed by the other iron star). Stop killing the engineers and wait for the Warbringers to get killed.",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    ["HeartOfFear_ImperialVizierZorlok"] = "The %s bugs spawn at the four pillars around the center of the room. 2 Zealous Parasite spawn at each pillar at a time. Every player needs to click on one of these Zealous Parasite to gain a debuff. Once every player in the group has got the debuff you can kill the boss. All players in the raid need to be alive and have the debuff to gain the achievement.",
    ["HeartOfFear_BladeLordTayak"] = "There are 4 Braziers in the center of the room and 2 braziers to the far left and far right of the room as you are looking at the boss. Once the boss has reached 20% health you need to click on the braziers in the middle of the room which are lit up to gain the " .. GetSpellLink(128949) .. " buff. You then need to run to one of the brazier on the far right/left to light it up. Once all 4 far braziers are lit up you can kill the boss",
    ["HeartOfFear_Garalon"] = "At 110 you can single target the boss to gain the achievement. Avoid AOE as this may kill the legs",
    ["HeartOfFear_AmberShaperUnsok"] = "For this achievement you will need atleast 2 players. Once you pull the boss, kill the Living Amber so that the pools that spawn once these adds are killed are stacked on top of one another. Once you have 8 pools stacked ontop of one another, you can nuke the boss. If a player becomes an Amber Monster then nuke that player down to 20% health to free them",
    ["HeartOfFear_GrandEmpressShekzeer"] = "For this achievement you need a way to taunt the boss between 2 targets to manage the %s debuff. 2 players will need to taunt at 4 stacks of the debuff to avoid dying. This will keep happening until the boss reaches 0 energy at which points the adds will spawn. Nuke down the 2 Kor'thik Reavers within 10 seconds of each other and then kill the boss to gain this achievement",

    --Chat Output

    -------------------------------------------------------
    --- Mogu'shan Vaults
    -------------------------------------------------------
    --Tactics
    ["MogushanVaults_TheStoneGuard"] = "For this achievement every player must have a canine companion pet summoned. The following pets definately work with the achievement: %s %s %s ",
    ["MogushanVaults_FengTheAccursed"] = "For this achievment you need to reverse the following abilities: %s %s %s %s %s. To reverse these abilities a tank spec'ed player need to pick up the %s which is located to left of the boss. Phase 1: 95%%; Epicenter is cast by boss; Lighting fists has to be reversed on a player who gets stunned by soaking the ability. Phase 2: 66%%; Wildfire Spark is cast on a player. Phase 3: At 33%%; Arcane Velocity is cast by boss; Arcane Resonance is cast on a player. Once all 5 abilities have been reversed you can kill boss. Note: if you do the instance on heroic difficulty the phases may be in a different order",
    ["MogushanVaults_GarajalTheSpiritbinder"] = "",
    ["MogushanVaults_TheSpiritKings"] = "",
    ["MogushanVaults_Elegon"] = "",
    ["MogushanVaults_WillOfTheEmperor"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Stormstout Brewery
    -------------------------------------------------------
    --Tactics
    ["StormstoutBrewery_OokOok"] = "",
    ["StormstoutBrewery_Other1"] = "",
    ["StormstoutBrewery_Hoptallus"] = "",
    ["StormstoutBrewery_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Scarlet Halls
    -------------------------------------------------------
    --Tactics
    ["ScarletHalls_HoundmasterBraun"] = "",
    ["ScarletHalls_ArmsmasterHarlan"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Scarlet Monastery
    -------------------------------------------------------
    --Tactics
    ["ScarletMonastery_ThalnosTheSoulrender"] = "",
    ["ScarletMonastery_BrotherKorloff"] = "",
    ["ScarletMonastery_HighInquisitorWhitemane"] = "",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    ["Scholomance_JandiceBarov"] = "",
    ["Scholomance_Rattlegore"] = "",
    ["Scholomance_Other1"] = "",
    ["Scholomance_Other2"] = "",
    ["Scholomance_Other3"] = "",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    ["TempleOfTheJadeSerpent_WiseMari"] = "",
    ["TempleOfTheJadeSerpent_ShaOfDoubt1"] = "",
    ["TempleOfTheJadeSerpent_ShaOfDoubt2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Mogu'Shan Palace
    -------------------------------------------------------
    --Tactics
    ["MoguShanPalace_Gekkan"] = "",
    ["MoguShanPalace_XinTheWeaponmaster"] = "",
    ["MoguShanPalace_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Shado Pan Monastery
    -------------------------------------------------------
    --Tactics
    ["ShadoPanMonastery_MasterSnowdrift"] = "",
    ["ShadoPanMonastery_ShaOfViolence"] = "",
    ["ShadoPanMonastery_TaranZhu"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Siege of Niuazao Temple
    -------------------------------------------------------
    --Tactics
    ["SiegeOfNiuazaoTemple_CommanderVojak"] = "",
    ["SiegeOfNiuazaoTemple_GeneralPavalak"] = "",
    ["SiegeOfNiuazaoTemple_WingLeaderNeronok"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Gate of the Setting Sun
    -------------------------------------------------------
    --Tactics
    ["GateOfTheSettingSun_SaboteurKiptilak"] = "",
    ["GateOfTheSettingSun_Other"] = "",
    ["GateOfTheSettingSun_Raigonn"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Dragon Soul
    -------------------------------------------------------
    --Tactics
    ["DragonSoul_WarlordZonozz"] = "Pull the boss but don’t kill him. When a purple ball spawns, run into it. Every time you run into the purple ball it will change direction. Run into the purple ball 10 times then nuke the boss. Try to aim the purple ball away from the boss so that it doesn’t get absorbed by the boss.",
    ["DragonSoul_YorsahjTheUnsleeping"] = "Pull the boss but don’t kill him. Wait for the oozes around the edge of the room to reach the boss. Once all 4 colour combinations have reached the boss (Black & Yellow, Black & Blue, Red & Green & Purple & Yellow) you can kill him. This will take several ooze phases to get all the combinations. It doesn’t matter if the other oozes reach the boss that are not listed as a colour combination. Therefore, you can just AFK until the requirements of the achievement have been met.",
    ["DragonSoul_HagaraTheStormbinder"] = "",
    ["DragonSoul_WarmasterBlackhorn"] = "For this achievement you will need a ranged dps ability. As soon as Twilight Assault Drakes spawn kill them as soon as they come in range. If you kill these drakes before they reach the ship, then you don’t have to worry about soaking any abilities. This is the only requirements to the achievement, any other damage to the ship such as Twilight Onslaught does not need to be absorbed.",
    ["DragonSoul_SpineOfDeathwing"] = "",
    ["DragonSoul_MadnessOfDeathwing"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Blackwing Descent
    -------------------------------------------------------
    --Tactics
    ["BlackwingDescent_Maloriak"] = "Damage the boss down to 25%. Be careful you don’t 1 shot the boss. Once 12 abbreviations have spawned AOE them down then kill boss. Make sure you don’t kill the boss before the adds have been AOE’d down.",
    ["BlackwingDescent_Nefarian"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Bastion of Twilight
    -------------------------------------------------------
    --Tactics
    ["BastionOfTwilight_HalfusWyrmbreaker"] = "Pull the boss but kill him. Free 2 of the dragons around the room by interacting with them. The whelps count as 1 dragon as well. Kill the 2 dragons within 10 seconds of one another then kill the boss.",
    ["BastionOfTwilight_ValionaAndTheralion"] = "Pull then bosses but don’t kill them. Wait for the spell Dazzling Destruction to cast. Once the boss has cast the spell stand in the pool that was created by the spell so that you get transferred to the shadow realm. Once you are in the shadow realm, kill 6 Twilight Fiends. Once the requirements have been met you can kill boss.",

    --Chat Output

    -------------------------------------------------------
    --- Throne of the Four Winds
    -------------------------------------------------------
    --Tactics
    ["ThroneOfTheFourWinds_ConclaveOfWind"] = "",
    ["ThroneOfTheFourWinds_AlAkir"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Firelands
    -------------------------------------------------------
    --Tactics
    ["Firelands_LordRhyolith"] = "Single target dps down the right leg. Do not touch the left leg.",
    ["Firelands_Shannox"] = "",
    ["Firelands_MajordomoStaghelm"] = "",
    ["Firelands_Ragnaros"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Blackrock Caverns
    -------------------------------------------------------
    --Tactics
    ["BlackrockCaverns_RomoggBonecrusher"] = "",
    ["BlackrockCaverns_Corla"] = "After pulling the boss wait for the three zealots evolve. This is done by not standing in the way of the beams being channelled to the mobs. Once they have all evolved you can nuke the boss.",
    ["BlackrockCaverns_KarshSteelbender"] = "Pull the boss into the fire in the middle of the room until he reaches 15 stacks of Superheated Quicksilver Armor. Once he has 15 stacks you can nuke the boss.",

    --Chat Output
    ["BlackrockCaverns_AngeredEarthKilled"] = "Angered Earth Killed",
    ["BlackrockCaverns_EvolvedTwilightZealotKilled"] = "Evolved Twilight Zealot Killed",

    -------------------------------------------------------
    --- Throne of the Tides
    -------------------------------------------------------
    --Tactics
    ["ThroneOfTheTides_LadyNazJar"] = "Damage the boss down to about 40% health. Be careful that you don’t 1 shot the boss. When the boss transitions to the next phase, kill the 2 caster adds but keep the melee add up. Once the geyser spawns drag the remaining add into the geyser until it gets killed. This may have to done multiple times. Once the add has been killed by the geyser, you can kill the boss.",
    ["ThroneOfTheTides_Ozumat"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Stonecore
    -------------------------------------------------------
    --Tactics
    ["TheStonecore_HighPriestessAzil"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Vortex Pinnacle
    -------------------------------------------------------
    --Tactics
    ["TheVortexPinnacle_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Grim Batol
    -------------------------------------------------------
    --Tactics
    ["GrimBatol_GeneralUmbriss"] = "Pull the boss then wait for a Malignant Trogg to spawn. Kill the Malignant Trogg next to the boss. Once the boss has got the Modgud's Malice from the killed add then you can kill the boss.",

    --Chat Output
    ["GrimBatol_FailedMessage"] = "Achievement can still be completed by waiting for another Malignant Trogg",

    -------------------------------------------------------
    --- Halls of Origination
    -------------------------------------------------------
    --Tactics
    ["HallsOfOrigination_EarthragerPtah"] = "Mount one of the camels to the left or right of the boss before going up the steps. Once you have mounted a camel, just nuke down the boss.",

    --Chat Output
    ["HallsOfOrigination_KnockedOffCamel"] = "has been knocked off their camel",

    -------------------------------------------------------
    --- Lost City of the Tol'Vir
    -------------------------------------------------------
    --Tactics
    ["LostCityOfTheTolVir_Lockmaw"] = "Pull the boss and wait for 20 Frenzied Crocolisk to spawn. Once they have spawned nuke them down within 10 seconds. Make sure you don’t kill the boss before nuking down the adds.",
    ["LostCityOfTheTolVir_HighProphetBarim"] = "",
    ["LostCityOfTheTolVir_Siamat"] = "",

    --Chat Output
    ["LostCityOfTheTolVir_FrenziedCrocodileCounter"] = "Frenzied Crocolisk Counter",
    ["LostCityOfTheTolVir_FrenziedCrocodileKilled"] = "Frenzied Crocolisk killed in time",
    ["LostCityOfTheTolVir_BurningSoulsKilled"] = "Burning Souls killed",

    -------------------------------------------------------
    --- Deadmines
    -------------------------------------------------------
    --Tactics
    ["Deadmines_HelixGearbreaker"] = "Pull the boss and wait for him to pick you up and charge down the room. Once he has done this Mine Rats will spawn around the room. After you have killed 20 Mine Rats you can kill the boss. The boss will have to do multiple charges so that enough Mine Rats to spawn.",
    ["Deadmines_AdmiralRipsnarl"] = "Damage Ripsnarl until he enters the vapour phase. Be careful that you don’t one shot the boss. Once he enters the vapour phase, wait until 3 Freezing Vapors cast Coalesce before killing boss.",
    ["Deadmines_CaptainCookie"] = "At 110, Wait for the boss to enter the pot and attempt to cast Throw Food before killing the boss. If you kill the boss before this has happened, the achievement will not get rewarded.",

    --Chat Output

    -------------------------------------------------------
    --- Shadowfang Keep
    -------------------------------------------------------
    --Tactics
    ["ShadowfangKeep_LordGodfrey"] = "Pull the boss then wait for the Bloodthirsty Ghouls to spawn. Place the boss in front of the Bloodthirsty Ghouls and wait for the boss to kill the Bloodthirsty Ghouls with his Pistol Barrage ability. Once 12 Ghouls have been killed, you can nuke the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Zul'Gurub
    -------------------------------------------------------
    --Tactics
    ["ZulGurub_Other"] = "",
    ["ZulGurub_HighPriestVenoxis"] = "Pull the boss and wait for him to turn into the snake. While waiting make sure you avoid green stuff on the floor. Once the boss has turned into a snake you can kill him.",
    ["ZulGurub_HighPriestessKilnara"] = "",
    ["ZulGurub_Jindo"] = "Damage the boss down to below 70% health. Wait for 20 Twisted Spirts to spawn then nuke them down. Once you have killed 20 Twisted spirits in 15 seconds you can kill boss.",

    --Chat Output

    -------------------------------------------------------
    --- Zul'Aman
    -------------------------------------------------------
    --Tactics
    ["ZulAman_Other1"] = "",
    ["ZulAman_Other2"] = "",
    ["ZulAman_Daakara"] = "At 110, you can simply just nuke the boss down while in the rectangular turquoise stonework.",

    --Chat Output

    -------------------------------------------------------
    --- End Time
    -------------------------------------------------------
    --Tactics
    ["EndTime_EchoOfTyrande"] = "At 110, run the gauntlet without any player in healing spec. This way you don’t need to worry about a healer taking any damage.",
    ["EndTime_EchoOfSylvanas"] = "Pull the boss then wait for the Risen Ghouls to spawn. Once the Risen Ghouls have spawned, kill two of them then kill boss.",

    --Chat Output

    -------------------------------------------------------
    --- Well of Eternity
    -------------------------------------------------------
    --Tactics
    ["WellOfEternity_Mannoroth"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Hour of Twilight
    -------------------------------------------------------
    --Tactics
    ["HourOfTwilight_ArchbishopBenedictus"] = "Get the boss health down to 50%. Be careful that you don’t 1 shot the boss. Once the boss has entered his shadow form, run round the edges of the room and kill 10 Twilight Sparks. Once 10 Twilight Sparks have been killed, you can kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Obsidian Sanctum
    -------------------------------------------------------
    --Tactics
    ["ObsidianSanctum_SartharionTheOnyxGuardian"] = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",

    --Chat Output

    -------------------------------------------------------
    --- Eye of Eternity
    -------------------------------------------------------
    --Tactics
    ["EyeOfEternity_Malygos"] = "DPS the boss down below 50% health so that he enters phase 2. Once the boss has entered phase 2 kill one of the Nexus Lord then mount the disc the mob was on. Once you are riding on a disk you can kill a scion of eternity to complete the achievement.",

    --Chat Output

    -------------------------------------------------------
    --- Onyxia's Lair
    -------------------------------------------------------
    --Tactics
    ["OnyxiasLair_Onyxia"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Trial of the Crusader
    -------------------------------------------------------
    --Tactics
    ["TrialOfTheCrusader_Icehowl"] = "At 110, you can simply just nuke the boss down. Make sure you don’t kill the Snobolds that fall of Gormok back after killing him.",
    ["TrialOfTheCrusader_LordJaraxxus"] = "At 110, pull the boss then wait for two Mistresses of Pain to spawn. Once they have spawned, single target down the boss.",
    ["TrialOfTheCrusader_Anubarak"] = "Pull the boss then wait for 25 Swarm Scarabs to spawn. Once enough adds have spawned. AOE them down. Be careful you don’t kill the boss first.",

    --Chat Output

    -------------------------------------------------------
    --- Vault of Archavon
    -------------------------------------------------------
    --Tactics
    ["VaultOfArchavon_ArchavonEmalonKoralon"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Ulduar
    -------------------------------------------------------
    --Tactics
    ["Ulduar_Other1"] = "At 110, this achievement is a lot easier to complete without a vehicle. Just run up between 2 of the pillars towards the boss. Wait for 100 adds to attack you then just AOE all the adds down.",
    ["Ulduar_Other2"] = "Kill the boss without going over any of the repair pads located at the entrance to the boss room on the right and right.",
    ["Ulduar_FlameLeviathan1"] = "This achievement will take 3 runs to complete since you will need to mount a different vehicle each time.",
    ["Ulduar_FlameLeviathan2"] = "This achievement requires at least 2 players. The player not going for the achievement needs to drive a demolisher and the player going for the achievements needs to be the passenger of the demolisher. Once you have pulled the boss, load the passenger into the catapult and throw them at the turrets on the boss. Once the player is up on the boss, they need to kill the turret to gain the achievement.",
    ["Ulduar_FlameLeviathan3"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least one tower is kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    ["Ulduar_FlameLeviathan4"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least two towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    ["Ulduar_FlameLeviathan5"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least three towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    ["Ulduar_FlameLeviathan6"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if all four towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    ["Ulduar_Razorscale"] = "Wait for 25 Dark Rune Guardian Dwarves to spawn then use the harpoons to pull Razorscale down. Once Razorscale is down dps the boss down to below 50% so the boss is permanently grounded. Be careful you don’t one shot the boss. Once the boss is grounded, place the Dark Rune Guardians in front of the boss until they are killed by Razorscale breath ability.",
    ["Ulduar_IgnisTheFurnaceMaster1"] = "Pull the boss then wait for 2 Iron Constructs to spawn. Place the 2 Iron Constructs in the fire on the ground until they gain 10 stacks of the Heat Buff. Next drag the 2 Iron Constructs into the water so they turn to stone. Finally nuke down the 2 adds within 5 seconds of one another. Once both adds have died you can kill boss.",
    ["Ulduar_IgnisTheFurnaceMaster2"] = "This achievement requires 2 players or a player with a pet class. The boss will randomly pick players to enter the pot that do not have aggro of the boss. Just pull the boss and wait till everyone gets thrown into the pot.",
    ["Ulduar_XTDeconstructor1"] = "",
    ["Ulduar_XTDeconstructor2"] = "Pull the boss and dps down until you reach 75%, 50% or 25% to start the heart phase. Careful you don’t one shot the boss. Once the heart is exposed nuke it down then kill the boss.",
    ["Ulduar_AssemblyOfIron1"] = "At max level, just kill Runemaster Molgeim last",
    ["Ulduar_AssemblyOfIron2"] = "At max level, just kill Stormcaller Brundir last",
    ["Ulduar_AssemblyOfIron3"] = "At max level, just kill Steelbreaker last.",
    ["Ulduar_AssemblyOfIron4"] = "At max level, use the Iron Boot Flask toy then nuke down the boss.",
    ["Ulduar_AssemblyOfIron5"] = "After pulling the boss you must interrupt the first cast of Chain Lightning from Stormcaller Brundir before killing him. Once you have interrupted the spell, nuke down Stormcaller Brundir and then kill the other two bosses.",
    ["Ulduar_Kologarn1"] = "At max level, just single target down the boss without killing the arms.",
    ["Ulduar_Kologarn2"] = "At max level, single target down the two arms then kill the boss.",
    ["Ulduar_Kologarn3"] = "After pulling the boss kill the arms until 25 Rubble has spawned. Don’t damage the boss since killing the arms already does a lot of damage to the boss.",
    ["Ulduar_Auriaya1"] = "At 110, just single target down the boss.",
    ["Ulduar_Auriaya2"] = "After pulling the boss wait for the Feral Defender to spawn. Once the Feral Defender has spawned kill him. He will then respawn after a short amount of time. Once the Feral Defender has been killed 9 times you can kill the boss.",
    ["Ulduar_Hodir1"] = "At 110, free the adds from the ice tombs then nuke down the boss.",
    ["Ulduar_Hodir2"] = "",
    ["Ulduar_Thorim1"] = "At 110, complete the gauntlet part of the encounter to gain this achievement.",
    ["Ulduar_Thorim2"] = "",
    ["Ulduar_FreyaMiniBosses"] = "Pull Elder Brightleaf, Elder Ironbranch and Elder Stonebark together in the Freya boss room and kill them within 15 seconds of one another.",
    ["Ulduar_Freya1"] = "Pull the boss then wait for 2 Ancient Water Spirits, 2 Storm Lashers and 2 Snaplashers to spawn. Once these have spawned aoe them down within 10 seconds of one another. Be careful that you don’t kill the boss first.",
    ["Ulduar_Freya2"] = "Defeat Freya leaving at least one of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
    ["Ulduar_Freya3"] = "Defeat Freya leaving at least two of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
    ["Ulduar_Freya4"] = "Defeat Freya leaving all three of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
    ["Ulduar_Mimiron1"] = "",
    ["Ulduar_Mimiron2"] = "Push the red button behind the boss to active hard mode to earn this achievement.",
    ["Ulduar_GeneralVezax"] = "Pull the boss then wait for the Saronite Animus to spawn. Once the Saronite Animus has spawned, kill it then kill the boss. The Saronite Animus takes about 5 minutes to spawn.",
    ["Ulduar_YoggSaron1"] = "After bring Sara down to 0% at the start of phase one, she will turn angry. Use /kiss on her to complete this achievement at this point.",
    ["Ulduar_YoggSaron2"] = "After starting the encounter, run into the clouds around the room to spawn Guardians of Yogg-Saron. Once 9 Guardians of Yogg-Saron have spawned, AOE then down within 12 seconds of one another. You can then kill the boss.",
    ["Ulduar_YoggSaron3"] = "This achievement takes multiple runs to complete since it’s random which vision the boss will spawn. You can simply just nuke the boss down.",
    ["Ulduar_AlgalonTheObserver"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Naxxramas
    -------------------------------------------------------
    --Tactics
    ["Naxxramas_GrandWidowFaerlina"] = "At max level, single target the boss down without touching any of the adds.",
    ["Naxxramas_KelThuzad"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Icecrown Citadel
    -------------------------------------------------------
    --Tactics
    ["IcecrownCitadel_LadyDeathwhisper"] = "",
    ["IcecrownCitadel_ValithriaDreamwalker"] = "This achievement requires a healing class to complete. At 110, the healer can just heal the at the start of the fight. You do not need to wait for the portals to spawn if you can heal the boss to full in under 45 seconds.",
    ["IcecrownCitadel_BloodQueenLanathel"] = "This achievement will take 2 kills to complete. At 110 to complete the ‘Defeat Blood-Queen Lana'thel without becoming a vampire’ criteria just simply nuke the boss down. To complete the ‘Defeat Blood-Queen Lana'thel while a vampire’ criteria, wait until you get the Essence of the Blood Queen debuff then nuke the boss down.",
    ["IcecrownCitadel_TheLichKing"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Nexus
    -------------------------------------------------------
    --Tactics
    ["TheNexus_Anomalus"] = "Damage the boss down to 45%, be careful you don’t 1 shot the boss. Wait for the add to finish casting the indestructible buff on the boss. Once this has finished you can kill the boss. Make sure you don’t kill the chaotic rift.",

    --Chat Output

    -------------------------------------------------------
    --- The Culling of Stratholme
    -------------------------------------------------------
    --Tactics
    ["TheCullingOfStratholme_Other1"] = "",
    ["TheCullingOfStratholme_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Azjol Nerub
    -------------------------------------------------------
    --Tactics
    ["AzjolNerub_KrikthirTheGatewatcher"] = "At 110, just single target the boss down without killing any of the mobs around him.",
    ["AzjolNerub_Hadronox"] = "At 110, just go straight down to the boss ignoring all adds in the way. Nuke the boss down as soon as you reach him. Don’t wait for the boss to come to you.",

    --Chat Output

    -------------------------------------------------------
    --- Dark Tharon Keep
    -------------------------------------------------------
    --Tactics
    ["DarkTharonKeep_NovosTheSummoner"] = "Stand at the top of the stairs and kill the undead adds and Crystal Handlers until all 4 Crystal Handlers have been killed. At this point phase 2 starts and you can kill the boss.",
    ["DarkTharonKeep_KingDred"] = "Pull the boss and pull 6 Drakkari Gutrippers and/or Drakkari Scytheclaw but don’t kill them. Once you in combat with the boss, single target down the raptors 1 by 1 until 6 are killed. Once this is done you can kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Violet Hold
    -------------------------------------------------------
    --Tactics
    ["VioletHold_Cyanigosa"] = "For the achievement you must not use any of the red crystal around the room and none of the mobs can reach the entrance.",
    ["VioletHold_Other"] = "This achievement will take multiple runs to complete since it’s random which bosses are going to spawn.",

    --Chat Output

    -------------------------------------------------------
    --- Gundrak
    -------------------------------------------------------
    --Tactics
    ["Gundrak_Galdarah1"] = "",
    ["Gundrak_Galdarah2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Stone
    -------------------------------------------------------
    --Tactics
    ["HallsOfStone_SjonnirTheIronshaper"] = "Pull the boss then wait for the Malformed Ooze to form into one Iron Sludge. Once the Iron Sludge is formed, kill it then kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Lightning
    -------------------------------------------------------
    --Tactics
    ["HallsOfLightning_GeneralBjarngrim"] = "At 110, just wait for the boss to gain Temporary Electrical Charge buff before pulling him. Once he has the buff pull the boss, wait for him to get his defensive stance up then kill him.",

    --Chat Output

    -------------------------------------------------------
    --- The Oculus
    -------------------------------------------------------
    --Tactics
    ["TheOculus_LeyGuardianEregos1"] = "",
    ["TheOculus_LeyGuardianEregos2"] = "",
    ["TheOculus_LeyGuardianEregos3"] = "",
    ["TheOculus_LeyGuardianEregos4"] = "",
    ["TheOculus_LeyGuardianEregos5"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Utgarde Pinnacle
    -------------------------------------------------------
    --Tactics
    ["UtgardePinnacle_SvalaSorrowgrave"] = "",
    ["UtgardePinnacle_SkadiTheRuthless"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Trial of the Champion
    -------------------------------------------------------
    --Tactics
    ["TrialOfTheChampion_ArgentConfessorPaletress"] = "This achievement will take multiple runs to complete. At 110, you can simply nuke down the boss to supress one of the memories.",
    ["TrialOfTheChampion_EadricThePure"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Forge of Souls
    -------------------------------------------------------
    --Tactics
    ["TheForgeOfSouls_Bronjahm"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Pit of Saron
    -------------------------------------------------------
    --Tactics
    ["PitOfSaron_Other"] = "When you run through the tunnel after the 2nd boss, no player in the group can hit by any of the icicles on the floor. The ground is marked where these icicles will fall so just make sure no one is standing in those areas.",

    --Chat Output
}

core:RegisterLocale('enUS', baseLocale)

    -- -------------------------------------------------------
    -- --- 
    -- -------------------------------------------------------
    -- --Tactics
    -- [""] = ,

    -- --Chat Output
    -- [""] = ,
    
    -- L["Shared_JustKillBoss"]
    -- L["Shared_JustKillBossSingleTarget"]