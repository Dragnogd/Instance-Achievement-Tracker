if(GetLocale() ~= 'enUS') then return end

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["Main"] = "Main",
    ["Battle for Azeroth"] = "Battle for Azeroth",
    ["Legion"] = "Legion",
    ["Warlords of Draenor"] = "Warlords of Draenor",
    ["Mists of Pandaria"] = "Mists of Pandaria",
    ["Cataclysm"] = "Cataclysm",
    ["Wrath of the Lich King"] = "Wrath of the Lich King",
    ["Instance Achievement Tracker"] = "Instance Achievement Tracker",
    ["Currently Tracking:"] = "Currently Tracking:",
    ["Achievements"] = "Achievements",
    ["Achievement"] = "Achievement",
    ["Tactics"] = "Tactics",
    ["Features:"] = "Features:",
    ["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Tracks when the criteria of instance achievements have been met and output this to chat",
    ["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Tracks when the criteria of instance achievements has been failed and outputs this to chat",
    ["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period.",
    ["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Scans all players in the group to see which achievements each player is missing for the current instance",
    ["- Announce to chat players who are missing achievements for certain bosses"] = "- Announce to chat players who are missing achievements for certain bosses",
    ["- Announce to chat tactics for a certain boss"] = "- Announce to chat tactics for a certain boss",
    ["Options:"] = "Options:",
    ["Enable Addon"] = "Enable Addon",
    ["Show Minimap Button"] = "Show Minimap Button",
    ["(Achievement Tracking Disabled)"] = "(Achievement Tracking Disabled)",
    ["Output Tactics"] = "Output Tactics",
    ["Output Players"] = "Output Players",
    ["Track"] = "Track",
    ["Players"] = "Players",
    ["No players in the group need this achievement"] = "No players in the group need this achievement",
    ["scan still in progress"] = "scan still in progress",
    ["Enter instance to start scanning"] = "(Enter instance to start scanning)",
    ["Players who need Achievement"] = "Players who need Achievement",
    ["Disabled"] = "Disabled",
    ["Enabled"] = "Enabled",
    ["Tracking"] = "Tracking",
    ["Starting Achievement Scan For"] = "Starting Achievement Scan For",
    ["This may freeze your game for a few seconds"] = "This may freeze your game for a few seconds",
    ["Achievement Scanning Finished"] = "Achievement Scanning Finished",
    ["Do you want to enable achievement tracking for"] = "Do you want to enable achievement tracking for",
    ["Track Achievements"] = "Track Achievements",
    ["Yes"] = "Yes",
    ["No"] = "No",
    ["Achievement Tracking Enabled for"] = "Achievement Tracking Enabled for",
    ["List of slash commands"] = "List of slash commands",
    ["help"] = "help",
    ["enable"] = "enable",
    ["shows a list of avaliable slash commands"] = "shows a list of avaliable slash commands",
    ["enable/disable IAT achievement tracking"] = "enable/disable IAT achievement tracking",
    ["Other"] = "Other",
    ["Only track missing achievements"] = "Only Track Missing Achievements",
    ["Announce messages to Raid Warning if avaliable"] = "Announce messages to Raid Warning if avaliable",
    ["Play a sound when achievement is completed or failed"] = "Play a sound when achievement is completed or failed",
    ["Trash after the third boss"] = "Trash after the third boss",

    -------------------------------------------------------
    --- Tactics & Boss Modules
    -------------------------------------------------------

    --Shared
    ["Shared_HasBeenHitWith"] = "has been hit with",
    ["Shared_PlayersWhoStillNeedToGetHit"] = "Players who still need to get hit:",
    ["Shared_HasGained"] = "has gained",
    ["Shared_HasLost"] = "has lost",
    ["Shared_HasFailed"] = "has failed",
    ["Shared_Reason"] = "reason:",
    ["Shared_PersonalAchievement"] = "Personal Achievement",
    ["Shared_Timer10"] = "Timer Started!. 10 seconds remaining",
    ["Completed"] = "Completed",
    ["Shared_JustKillBoss"] = "At max level, you can simply just kill the boss to get this achievement.",
    ["Shared_GotHit"] = "got hit",
    ["Shared_NotHit"] = "did not get hit",
    ["Shared_PlayersHit"] = "players hit:",
    ["Shared_CompletedBossKill"] = "will be completed once boss is killed",
    ["Shared_Timer3"] = "Timer Started! 3 seconds remaining",

    -------------------------------------------------------
    --- Uldir
    -------------------------------------------------------
    --Tactics
    ["Uldir_Taloc_Tactics"] = "For this achievement you will have to collect 4 Orbs of Harmony while the Elevator is going down in phase 2.\n\n The positions of the orbs seem to be ranzomized, however a Demon Hunter can easily get all of them by Fel Rushing and Gliding.",
    ["Uldir_MOTHER_Tactics"] = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\n\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",
    ["Uldir_Fetid_Devourer_Tactics"] = "Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\n\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%%: %s",
    ["Uldir_ZekVoz_Tactics"] = "This achievement is pretty easy, however you should use the IAT_64482 after Yogg's image disappears in phase 2. The puzzle will activate the next time the Projection of Yogg-saron appears (the second time), which helps your healers with healing & mana (you won't have to deal with the mechanics for an extra minute).\n\n The %s deal anywhere from 25k to 35k damage, so make sure to dodge them as much as possible so your healers don't get overwhelmed.",
    ["Uldir_Vectis_Tactics"] = "Warmother Rakkali is located down on the platform right before you go to Vectis.\n\n After you get the Plague Bomb debuff on her, you can safely kill her, then kill the boss and you'll get the achievement.",
    ["Uldir_ZulReborn_Tactics"] = "This achievement is pretty straight forward, no one has to step onto the inner ring of the platform. Here are a few tips for the encounter:\n\n Tanks should pick all the adds, and stack them so that melee dps can cleave them. The Bloodhexers don't have %s on normal difficulty (if the debuff shows on them, it's just a visual bug, don't worry about it).\n Ranged dps should be on the boss 24/7, and should not switch to the adds unless melee dps can't keep up killing them in time.\n If you have 2 priests in the group, then you should assign them to different positions (left and right outside of the group) so that both sides are covered when ads spawn.\n At 40%% Zul will knock back everyone, so you should position yourself near a wall so you don't get knocked off the platform.",
    ["Uldir_Mythrax_Tactics"] = "As of November 2018: The Existential Crisis achievement now functions as described.\n\n This makes the achievement much more easier, as you just pick up the orbs that you spawned.",
    ["Uldir_GHuun_Tactics"] = "For this achievement you will have to make groups of 3 people to do the power matrix: 2 dps + 1 healer assisting them.\n\n As of right now the fight looks a bit overtuned for smaller raid groups, so if you have a 10-14 man group then you should invite a few more people to help out.",
    
    --Chat Output
    ["Uldir_Fetid_TerribleThrash"] = "Terrible Thrash",
    ["Uldir_Fetid_Immunity"] = "was been hit with Terrible Thrash but used an immunity so did not count",
    ["Uldir_Vectis_AddKill"] = "Warmother Rakkali has been infected with Plague Bomb. She can now be killed.",

    -------------------------------------------------------
    --- Atal Dazar
    -------------------------------------------------------
    --Tactics
    ["AtalDazar_Other"] = "The Zanchuli Witch-Doctor throughout the dungeon cast %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \n\nBefore pulling any Zanchuli Witch-Doctor you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",
    ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a Fatal Corruption.",
    ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",
    
    --Chat Output
    ["AtalDazar_PriestessAlunza_AddKill"] = "Kill the Spirit of Gold now!",
    ["AtalDazar_BringingHexyBack_Hex"] = "Atleast one players needs to be hexed on boss kill!",

    -------------------------------------------------------
    --- Freehold
    -------------------------------------------------------
    --Tactics
    ["Freehold_SkycapNKragg"] = "To summon Patches you have to place a %s before you pull the boss.",
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

    --Chat Output
    ["ShrineOfTheStorm_VolZith_Maddening_Dreams"] = "Maddening Dreams",
    
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
    ["TempleOfSethraliss_Merektha_LootSnake"] = "Loot the Solid Snake now to complete the achievement", 

    -------------------------------------------------------
    --- The Motherlode
    -------------------------------------------------------
    --Tactics
    ["The_Motherlode_CoinOperatedCrowdPummeler"] = "Pick up %s before the boss and throw it at Ledley the Bold after you engage the boss. Ledley the Bold will cast %s throughout the fight so you should interrupt the spell and kill him and the other adds asap as they will throw grog, making you drunk for 10 seconds.",
    ["The_Motherlode_MogulRazdunk"] = "Similarly to the predecessors of this achievement, this is a personal achievement that requires you to dodge most of the damaging mechanics of the boss encounter.",
    ["The_Motherlode_MogulRazdunk_Fail1"] = "Gatling Gun Damage",
    ["The_Motherlode_MogulRazdunk_Fail2"] = "Micro Missile Damage",
    ["The_Motherlode_MogulRazdunk_Fail3"] = "Drill Smash Direct Hit",
    ["The_Motherlode_MogulRazdunk_Fail4"] = "Big Red Rocket Direct Hit",

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