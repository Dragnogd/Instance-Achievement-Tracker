-- local i = 2
-- while EJ_GetInstanceByIndex(i, false) do
--     local instanceId, name = EJ_GetInstanceByIndex(i, false)
--     print("---" .. instanceId, name)
--     EJ_SelectInstance(instanceId)
--     i = i+1
    
--     local j = 1
--     while EJ_GetEncounterInfoByIndex(j, instanceId) do
--         local name, _, encounterId = EJ_GetEncounterInfoByIndex(j, instanceId)
--         print(encounterId, name)
--         j = j+1
--     end
-- end

--NOTES for updating this file for new raids/dungeons
--EncounterID - Get this from boss mods
--

--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

local L = core.L

local instances = {}

core.Instances = {
    --Battle for Azeroth
    [2] = {
        Raids = {
            [1861] = { --Uldir
                name = 1031,
                boss1 = {
                    name = 2168, --Taloc
                    bossIDs = {},
                    achievement = 12937,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will have to collect 4 Orbs of Harmony while the Elevator is going down in phase 2.\n\n The positions of the orbs seem to be ranzomized, however a Demon Hunter can easily get all of them by Fel Rushing and Gliding.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2144,
                },
                boss2 = {
                    name = 2167, --MOTHER
                    bossIDs = {},
                    achievement = 12938,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\n\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",
                    enablesd = false,
                    track = nil,
                    partial = false,
                    encounterID = 2141,
                },
                boss3 = {
                    name = 2146, --Fetid Devourer
                    bossIDs = {133298},
                    achievement = 12823,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\n\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%%: %s", GetSpellLink(262277), GetSpellLink(262378)),
                    enabled = true,
                    track = function() core._1861:FetidDevourer() end,
                    partial = false,
                    encounterID = 2128,
                },
                boss4 = {
                    name = 2169, --Zek'voz
                    bossIDs = {},
                    achievement = 12828,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("This achievement is pretty easy, however you should use the IAT_64482 after Yogg's image disappears in phase 2. The puzzle will activate the next time the Projection of Yogg-saron appears (the second time), which helps your healers with healing & mana (you won't have to deal with the mechanics for an extra minute).\n\n The %s deal anywhere from 25k to 35k damage, so make sure to dodge them as much as possible so your healers don't get overwhelmed.", GetSpellLink(278068)),
                    enabled = true,
                    track = function() core._1861:Zekvoz() end,
                    partial = false,
                    encounterID = 2136,
                },
                boss5 = {
                    name = 2166, --Vectis
                    bossIDs = {},
                    achievement = 12772,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Warmother Rakkali is located down on the platform right before you go to Vectis.\n\n After you get the Plague Bomb debuff on her, you can safely kill her, then kill the boss and you'll get the achievement.",
                    enabled = true,
                    track = function() core._1861:Vectis() end,
                    partial = false,
                    encounterID = 2134,
                },
                boss6 = {
                    name = 2195, --Zul Reborn
                    bossIDs = {},
                    achievement = 12830,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("This achievement is pretty straight forward, no one has to step onto the inner ring of the platform. Here are a few tips for the encounter:\n\n Tanks should pick all the adds, and stack them so that melee dps can cleave them. The Bloodhexers don't have %s on normal difficulty (if the debuff shows on them, it's just a visual bug, don't worry about it).\n Ranged dps should be on the boss 24/7, and should not switch to the adds unless melee dps can't keep up killing them in time.\n If you have 2 priests in the group, then you should assign them to different positions (left and right outside of the group) so that both sides are covered when ads spawn.\n At 40%% Zul will knock back everyone, so you should position yourself near a wall so you don't get knocked off the platform.", GetSpellLink(276093)),
                    enabled = true,
                    track = function() corse._1861:ZulReborn() end,
                    partial = false,
                    encounterID = 2145,
                },
                boss7 = {
                    name = 2194, --Mythrax the Unraveler
                    bossIDs = {},
                    achievement = 12836,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("The text on the achievement is misleading, and you will have to do the opposite to get the achievement:\n Do not pick your own orbs\n Only pick orbs spawned by other players\n Thankfully the tracker is working properly and it will go red whenever you have failed the achievement.\n\n Here are a few tips for the encounter:\n Players getting %s should go away from the raid, however they should not hug any walls as the orbs can spawn on top of them.\n Once phase 2 starts the boss is going to channel %s and everyone must stand still until the cast is over. Once orbs spawn, everyone should pick orbs in the same direction (clockwise or counterclockwise).\n Dodge %s at all costs. If you get hit by the beam, you'll spawn orbs immediately and it's very likely that you'll walk into them by mistake.", GetSpellLink(272536), GetSpellLink(273810), GetSpellLink(274113)),
                    enabled = true,
                    track = function() core._1861:MythraxTheUnraveler() end,
                    partial = false,
                    encounterID = 2135,
                },
                boss8 = {
                    name = 2147, --G'huun
                    bossIDs = {},
                    achievement = 12551,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will have to make groups of 3 people to do the power matrix: 2 dps + 1 healer assisting them.\n\n As of right now the fight looks a bit overtuned for smaller raid groups, so if you have a 10-14 man group then you should invite a few more people to help out.",
                    enabled = true,
                    track = function() core._1861:Ghuun() end,
                    partial = false,
                    encounterID = 2122,
                },
            },

            -- [1861] = { --Battle of Dazar'alor
            --     name = 1031,
            --     boss1 = {
            --         name = 1031, --Champion of the Light
            --         bossIDs = {},
            --         achievement = 13316,
            --         players = {L["(Enter instance to start scanning)"]},
            --         tactics = "",
            --         enabled = false,
            --         track = nil,
            --         partial = false,
            --         encounterID = ,
            --     },
            --     boss2 = {
            --         name = 1031, --Grong
            --         bossIDs = {},
            --         achievement = 13383,
            --         players = {L["(Enter instance to start scanning)"]},
            --         tactics = "",
            --         enabled = false,
            --         track = nil,
            --         partial = false,
            --         encounterID = ,
            --     },
            --     boss3 = {
            --         name = 1031, --Treasure Guardian
            --         bossIDs = {},
            --         achievement = 13345,
            --         players = {L["(Enter instance to start scanning)"]},
            --         tactics = "",
            --         enabled = false,
            --         track = nil,
            --         partial = false,
            --         encounterID = ,
            --     },
            --     boss4 = {
            --         name = 1031, --Conclave of the Chosen
            --         bossIDs = {},
            --         achievement = 13325,
            --         players = {L["(Enter instance to start scanning)"]},
            --         tactics = "",
            --         enabled = false,
            --         track = nil,
            --         partial = false,
            --         encounterID = ,
            --     },
            --     boss5 = {
            --         name = 1031, --High Tinker Mekkatorque
            --         bossIDs = {},
            --         achievement = 13401,
            --         players = {L["(Enter instance to start scanning)"]},
            --         tactics = "",
            --         enabled = false,
            --         track = nil,
            --         partial = false,
            --         encounterID = ,
            --     },
            --     boss6 = {
            --         name = 1031, --Jaina Proudmoore
            --         bossIDs = {},
            --         achievement = 13410,
            --         players = {L["(Enter instance to start scanning)"]},
            --         tactics = "",
            --         enabled = false,
            --         track = nil,
            --         partial = false,
            --         encounterID = ,
            --     },
            -- },
        },

        Dungeons = {
            [1763] = { --Atal Dazar
                name = 968,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 12270,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("The Zanchuli Witch-Doctor throughout the dungeon cast %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \n\nBefore pulling any Zanchuli Witch-Doctor you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.", GetSpellLink(279118), GetSpellLink(115078), GetSpellLink(187650), GetSpellLink(118), GetSpellLink(279118)),
                    enabled = true,
                    track = function() core._1763:BringingHexyBack() end,
                    partial = false,
                    encounterID = {2087,2086,2085,2084},
                },
                boss2 = {
                    name = 2082, --Priestess Alun'za
                    bossIDs = {},
                    achievement = 12272,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a Fatal Corruption.", GetSpellLink(259205), GetSpellLink(255558), GetSpellLink(255558), GetSpellLink(255558)),
                    enabled = true,
                    track = function() core._1763:PriestessAlunza() end,
                    partial = false,
                    encounterID = 2084,
                },
                boss3 = {
                    name = 2030, --Yazma
                    bossIDs = {},
                    achievement = 12273,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.", GetSpellLink(259190)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2087,
                },
            },

            [1754] = { --Freehold
                name = 1001,
                boss1 = {
                    name = 2102, --Skycap'n Kragg
                    bossIDs = {},
                    achievement = 12548,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("To summon Patches you have to place a %s before you pull the boss.", "IAT_119210"),
                    enabled = true,
                    track = function() core._1754:SkycapnKragg() end,
                    partial = false,
                    encounterID = 2093,
                },
                boss2 = {
                    name = 2094, --Ring of Booty
                    bossIDs = {},
                    achievement = 12550,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will have to pick up 3 items throughout the instance. Sharkbait's Empty Dish spawns in the nest at the first boss after you defeat it, Gourmet Parrot Chow is found on top of a platform in The Rum Quarter, and Serve Sharkbait's Meal is found near Sharkbait after the third boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2095,
                },
                boss3 = {
                    name = 2095, --Harlan Sweete
                    bossIDs = {},
                    achievement = 12998,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Harlan Sweete will target a random player for %s, which will have to position near one of the chests, so that they will end up being destroyed.", GetSpellLink(257305)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2096,
                },
            },

            [1762] = { --Kings Rest
                name = 1041,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 12722,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "The first trinket is in the first room of the dungeon, behind the sarcophagus, undeath the baskets.\n The second trinket is in the first boss hallway, at the end of the platform, behind the last set of stairs.\n The third trinket - (Check out the Glory of the Wartorn Hero Achievement Guide for details on WowHead)\n The fourth trinket is located before the final boss room, at the bottom of the strairs, at the top of the right pillar.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 2171, --Mchimba the Embalmer
                    bossIDs = {},
                    achievement = 12721,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement you will have to free the player targeted by %s without him using %s more than once, and also free him before the boss finishes casting %s.\n\n Note: Players have reported a minor bug with this achievement, and it's recommended that the entombed player does not use Struggle before the boss casts Open Coffin.", GetSpellLink(267702), GetSpellLink(267764), GetSpellLink(271290)),
                    enabled = true,
                    track = function() core._1762:MchimbaTheEmbalmer() end,
                    partial = false,
                    encounterID = 2142,
                },
                boss3 = {
                    name = 2172,
                    bossIDs = {},
                    achievement = 12723,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement is obtained at King Dazar, the last boss in the instance. Have two players each stay on top of the stones in front of the two sarcophagi, and the lights will start filling up around the stone. Once they are both lit up, the right sarcophagus will start shaking which means that you can kill the boss.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1864] = { --Shrine of the Storm
                name = 1036,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 12600,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("The %s is picked up at the start of the dungeon, in the first room. If you receive any frost damage then the spirit flames will be extinguished so it's recommended to first clear all the trash to the third boss, and then pick up the breath. Do not kill the first boss as that will make the breath despawn. Once you light up the shrines to the third boss you will get the achievement.", GetSpellLink(275633)),
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 2155, --Lord Stormsong
                    bossIDs = {},
                    achievement = 12601,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("During the course of the encounter, Lord Stormsong will periodically begin to %s which summons Awoken Void that will chase players and attempt to explode upon impact. To obtain this achievement, you must not come into contact with any of the void adds so you will keep kiting them throughout the encounter.", GetSpellLink(269097)),
                    enabled = true,
                    track = function() core._1864:LordStormsong() end,
                    partial = false,
                    encounterID = 2132,
                },
                boss3 = {
                    name = 2156, --Vol'zith
                    bossIDs = {275690},
                    achievement = 12602,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("To get the %s debuff you will have to dive down in the water before the last boss until you see Void Orbs floating around, and then swim through them. The debuff will make you hostile to all players for 24 seconds, then disappear for 6 seconds time in which your healer must use cds and heal you to full hp. Avoid using aoe spells on the boss, and instead use self heals as much as possible to help your healer out.\n\n After Vol'zith the Whisperer casts %s, you will get teleported into the sunken realm where you should quickly kill the adds and then wait 20-30 seconds for cooldowns to be available. Vol'zith the Whisperer will also cast %s, and you will have to crowd control 5 Manifestation of the Deep adds so that they won't reach the boss.", GetSpellLink(275690), GetSpellLink(267360), GetSpellLink(267299)),
                    enabled = true,
                    track = function() core._1864:VolzithTheWhisperer() end,
                    partial = false,
                    encounterID = 2133,
                },
            },

            [1822] = { --Siege of Boralus
                name = 1023,
                boss1 = {
                    name = 2173, --Dread Captain Lockwood
                    bossIDs = {},
                    achievement = 12727,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Dread Captain Lockwood will continuously attempt to retreat from players using %s unless she is snared or rooted. As the achievement description implies, you have to keep her snared or rooted and prevent her from ever using %s. \n\n This achievement is currently bugged, and this has been confirmed by multiple game masters.\n\n You can bypass the bug by using a long cc spell on her at 97%% energy, spells has such as %s, %s, %s, %s as ideal as they last 15 seconds or more. You will have to kill the Ashvane Cannoneer really fast and use %s before the snare fades away.", GetSpellLink(272471), GetSpellLink(272471), GetSpellLink(339), GetSpellLink(1715), GetSpellLink(116), GetSpellLink(31589), GetSpellLink(268995)),
                    enabled = true,
                    track = function() core._1822:DreadCaptainLockwood() end,
                    partial = false,
                    encounterID = 2109,
                },
                boss2 = {
                    name = 2140, --Viq'Goth
                    bossIDs = {},
                    achievement = 12726,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("During the encounter, Viq'Goth will use %s which causes a barrage of putrid water around the area. During this, several Gasping Flounders will be thrown on the land which you will have to kick back into the water before defeating the boss.", GetSpellLink(274991)),
                    enabled = true,
                    track = function() core._1822:ViqGoth() end,
                    partial = false,
                    encounterID = 2100,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 12489,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Blacksmithing) Brutik Blackanvil - The hammer is found down the stairs to the docks at 58, 70.\n (Engineering) Threshanator 3000 - The NPC is found right at the start of the instance.\n (Alchemy) Liz Vilepot - The 'Strange Vial' is found near a table at at 54, 74.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1877] = { --Temple of Sethraliss
                name = 1030,
                boss1 = {
                    name = 2143, --Merektha
                    bossIDs = {},
                    achievement = 12507,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("In order to reveal the Solid Egg that is hidden on top of the bones, you will have to use %s, %s, %s or other ground damaging abilities. To make the egg hatch, have your dps and healer stack under the boss and wait for it to cast %s. Once the Solid Snake spawns, you can kill it, and then click on it to get the %s buff that grants you the achievement.\n\n Note: The Solid Snake might evade attacks but it will teleport to the ground after a few seconds. If you have a Death Knight in your group you should %s the Solid Egg down, which will not only bypass this bug, but also make positioning easier.", GetSpellLink(1543), GetSpellLink(43265), GetSpellLink(5740), GetSpellLink(263914), GetSpellLink(270324), GetSpellLink(49576)),
                    enabled = true,
                    track = function() core._1877:Merektha() end,
                    partial = false,
                    encounterID = 2125,
                },
                boss2 = {
                    name = 2145, --Avatar of Sethraliss
                    bossIDs = {},
                    achievement = 12508,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will have to /kiss Plague Toad until one of them transforms into a 'Prince' which looks like Trade Prince Gallywix. The 'Prince' cannot die so you don't have to worry about using aoe spells",
                    enabled = true,
                    track = function() core._1877:AvatarOfSethraliss() end,
                    partial = false,
                    encounterID = 2127,
                },
                boss3 = {
                    name = L["Trash after the third boss"],
                    bossIDs = {},
                    achievement = 12503,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement you will want to use class utility abilities to crowd control the Orb Guardian while you get both eyes closer. Note that there are several Orb Guardian throughout the room that will attempt to steal your eye back, there is one near each eye, one in between the eyes and the skull, and a few more in the middle of the room.\n\n Abilities such as %s, %s and %s are ideal, as you can cc the guardians on one side and then ignore them completely.", GetSpellLink(115078), GetSpellLink(187650), GetSpellLink(118)),
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1594] = { --The Motherlode
                name = 1012,
                boss1 = {
                    name = 2109, --Coin-Operated Crowd Pummeler
                    bossIDs = {},
                    achievement = 12855,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Pick up %s before the boss and throw it at Ledley the Bold after you engage the boss. Ledley the Bold will cast %s throughout the fight so you should interrupt the spell and kill him and the other adds asap as they will throw grog, making you drunk for 10 seconds.", GetSpellLink(278524), GetSpellLink(278673)),
                    enabled = true,
                    track = function() core._1594:CoinOperatedCrowdPummeler() end,
                    partial = false,
                    encounterID = 2105,
                },
                boss2 = {
                    name = 2116, --Mogul Razdunk
                    bossIDs = {131227},
                    achievement = 12854,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Similarly to the predecessors of this achievement, this is a personal achievement that requires you to dodge most of the damaging mechanics of the boss encounter.",
                    enabled = true,
                    track = function() core._1594:MogulRazdunk() end,
                    partial = false,
                    encounterID = 2108,
                },
            },

            [1841] = { --The Underrot
                name = 1022,
                boss1 = {
                    name = 2157, --Elder Leaxa
                    bossIDs = {},
                    achievement = 12498,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Elder Leaxa's abilities apply %s to players whenever they take spell damage. This means means that all of her abilities will have to be interrupted and dodged in order to prevent this debuff.\n\n To make the achievement easier, you can have your healer go dps so you have an extra interrupt, and also kill her faster.", GetSpellLink(260685)),
                    enabled = true,
                    track = function() core._1841:ElderLeaxa() end,
                    partial = false,
                    encounterID = 2111,
                },
                boss2 = {
                    name = 2130, --Sporecaller Zancha
                    bossIDs = {},
                    achievement = 12549,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Musashitake is located in the top left corner of the room. To make him active you will have to make the boss cast %s in his direction.\n\n Note: If Musashitake evades attacks then just go the middle of the room, and he will shortly teleport there.", GetSpellLink(272457)),
                    enabled = true,
                    track = function() core._1841:SporecallerZancha() end,
                    partial = false,
                    encounterID = 2112,
                },
                boss3 = {
                    name = 2158, --Unbound Abomination
                    bossIDs = {},
                    achievement = 12499,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Puddles of %s will occasionally coalesce into %s adds which fixate a random player. You will have to kill the boss without having any %s die, which is easily done by kiting them in a circle around the room.\n\n Make use of cc in order to slow them, and remember to check your talents, trinkets and azerite traits so you don't accidentally kill the spores.", GetSpellLink(269843), GetSpellLink(270108), GetSpellLink(270108)),
                    enabled = true,
                    track = function() core._1841:UnboundAbomination() end,
                    partial = false,
                    encounterID = 2123,
                },                
            },

            [1771] = { --Tol Dagor
                name = 1002,
                boss1 = {
                    name = 2099, --Knight Captain Valyri
                    bossIDs = {130646},
                    achievement = 12457,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement you will want to tank the boss in the middle of the room, and have the other 4 players move the barrels close to Knight Captain Valyri. You will want to move the barrels away from the fire:\n %s - This spell is cast underneath players, you simply have to move the barrel away.\n %s - When Knight Captain Valyri casts this spell, you will have to move the barrel away from where the boss is facing towards.\n %s - When a player gets this debuff, they have to move away from the barrel immediately and wait for a dispel.", GetSpellLink(256976), GetSpellLink(256955), GetSpellLink(257033)),
                    enabled = false,
                    track = nil, --function() core._1771:KnightCaptainValyri() end
                    partial = false,
                    encounterID = 2103,
                },
                boss2 = {
                    name = 2096, --Overseer Korgus
                    bossIDs = {},
                    achievement = 12462,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Shortly after you start the encounter, Overseer Korgus fires %s rounds at each player and applies %s. Every time a player moves its effects get stronger and will eventually cause the player to be stunned for 8 seconds, and you should do this as a group at the start of the encounter since there are no abilities to dodge.", GetSpellLink(256200), GetSpellLink(256200)),
                    enabled = true,
                    track = function() core._1771:OverseerKorgus() end,
                    partial = false,
                    encounterID = 2104,
                },
            },

            [1862] = { --Waycrest Manor
                name = 1021,
                boss1 = {
                    name = 2126, --Soulbound Goliath
                    bossIDs = {},
                    achievement = 12495,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Soulbound Goliath gets a stacking buff called %s every 2 seconds, so to get this achievement you will have to kite the boss through patches of %s that spawn in the area in order to keep the %s stacks low.", GetSpellLink(260512), GetSpellLink(260570), GetSpellLink(260512)),
                    enabled = true,
                    track = function() core._1862:SoulboundGoliath() end,
                    partial = false,
                    encounterID = 2114,
                },
                boss2 = {
                    name = 2129, --Gorak Tul
                    bossIDs = {},
                    achievement = 12490,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("During the Gorak Tul encounter, the boss will periodically toss out %s which you will need to use to burn the corpses of Deathtouched Slavers, so they can't respawn. Once the boss casts %s and summons the third add you will have to nuke the adds, and then quickly use %s to burn their corpses.", GetSpellLink(266198), GetSpellLink(266266), GetSpellLink(266198)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2117,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 12489,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "As the name of the achievement implies, this is a profession-based achievement where you to interact with items to summon bosses. In order to use the items throughout the dungeons, a minimum of 75 skill level is required.\n\n (Leatherworking) Huntmaster Grath - The map to summon this boss is found in the hunting lodge section of Waycrest, in the corner of the Kraker fireplace room.\n (Tailoring) Seamstress Johanna - The 'Cursed Loom' (a bolt of cloth) is found in the Banquet Hall, on the top floor.\n (Herbalism) Groundskeeper Lilith - The 'Vile pod' is found in the fountain across the courtyard where Soulbound Goliath is.\n (Inscription) Governess Tabitha - The 'Ancient Tome' is found in a bookshelf on the main floor, on the left side just before you descend to the cellar.\n (Cooking) Head Vintner Justin - The wine is found in the cellar, near other casks of wine.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },
        },
    },

    --Legion
    [3] = {
        Raids = {
            [1520] = { --The Emerald Nightmare
                name = 768,
                boss1 = { 
                    name = 1703, --Nythendra
                    bossIDs = {102672},
                    achievement = 10555,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "During the Heart of the Swarm phase, glow bugs will spawn around the edges of the room. Once they spawn players need to click on the bugs to squish them. Once 15 bugs have been squished you can kill the boss. 5 bugs spawn each phase so you will need a minimum of 3 Heart of the Swarm phases to complete this achievement.",
                    enabled = true,
                    track = function() core._1520:Nythendra() end,
                    partial = false,
                    encounterID = 1853,
                },
                boss2 = {
                    name = 1667, --Ursoc
                    bossIDs = {100497},
                    achievement = 10753,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the trash to the right hand side before of the entrance to the boss room. Free Tur Ragepaw and wait for him to reach the boss. Nuke the boss down while keeping Tur Ragepaw alive.",
                    enabled = true,
                    track = function() core._1520:Ursoc() end,
                    partial = false,
                    encounterID = 1841,
                },
                boss3 = {
                    name = 1704, --Dragons of Nightmare
                    bossIDs = {102683,102682,102681,102679},
                    achievement = 10663,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("There are 4 portals around the boss room. Everyone in the group must go into each of the 4 portals and collect 1 mist from each portal which gives them a buff. Once all players in the group have 4 buffs %s %s %s %s you can kill the boss. The easiest way to do this is to split the group up into 2 then have half the group collect the 4 buffs at once.", GetSpellLink(214588), GetSpellLink(214601), GetSpellLink(214604), GetSpellLink(214610)),
                    enabled = true,
                    track = function() core._1520:DragonsOfNightmare() end,
                    partial = false,
                    encounterID = 1854,
                },
                boss4 = {
                    name = 1744, --Elerethe Renferal
                    bossIDs = {}, --106087
                    achievement = 10771,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement, there are 7 eggs with a glowing red effect located around the room. To complete this achievement all 7 eggs need to be destroyed by running over them. Some of the eggs can only be reached by using %s or players using effects such as %s, %s or %s. Once all 7 eggs have been destroyed you can kill the boss.\n\n Note: If you cannot see any of the eggs, they will respawn after you have killed the boss.", GetSpellLink(212993), GetSpellLink(131347), GetSpellLink(164862), GetSpellLink(130)),
                    enabled = true,
                    track = function() core._1520:EleretheRenferal() end,
                    partial = false,
                    encounterID = 1876,
                },
                boss5 = {
                    name = 1738, --Ill'gynoth, Heart of Corruption
                    bossIDs = {105906,105721},
                    achievement = 10830,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Wait for 20 Nightmare Ichors to spawn. Once you have 20 adds, everyone should stand in front of the eye, then AOE down all the adds together. Once 20 adds have been killed in 10 seconds ontop of the eye, you can kill the boss.",
                    enabled = true,
                    track = function() core._1520:Ilgynoth() end,
                    partial = false,
                    encounterID = 1873,
                },
                boss6 = {
                    name = 1750, --Cenarius
                    bossIDs = {},
                    achievement = 10772,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At max level, with enough dps you can kill the boss before any of the Forces of Nightmare are cleansed.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1877,
                },
                boss7 = {
                    name = 1726, --Xavius
                    bossIDs = {103769},
                    achievement = 10755,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("To complete this achievement, you will need a Demon Hunter to use his %s ability. Around the outer edges of the boss rooms, a Creature in the Dark will spawn at 3 points during the fight. The Demon Hunter will need to use his %s ability to find the add and drag it into the centre of the room. The adds spawn at 100-65%%, 65%%-30%% and below 30%%. Once all 3 Creatures in the dark have been killed, you can kill the boss.", GetSpellLink(188501), GetSpellLink(188501)),
                    enabled = true,
                    track = function() core._1520:Xavius() end,
                    partial = false,
                    encounterID = 1864,
                },
            },

            [1648] = { --Trial of Valor
                name = 861,
                boss1 = {
                    name = 1819, --Odyn
                    bossIDs = {114263},
                    achievement = 11337,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement you will need to reach phase 2 by killing Hymdall and Hyrja. Next you will need to wait for the boss to cast [Draw Power]. The runes around the room will light up and adds will spawn with corresponding runes above their head. You will need to remember the order the runes lite up then drag the corresponding add to each of rune on the floor and kill. Make sure you kill each of the adds on their respective rune before placing the next add on it’s respective rune. For example if the yellow rune lit up first then orange, drag the yellow add to the rune and kill, then drag the orange add to the rune and kill. If you complete the achievement you will gain %s which means you can kill the boss.", GetSpellLink(229684)),
                    enabled = true,
                    track = function() core._1648:Odyn() end,
                    partial = false,
                    encounterID = 1958,
                },
                boss2 = {
                    name = 1830, --Guarm
                    bossIDs = {114323},
                    achievement = 11386,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement, a player will need to pick up %s next to the boss at the start of the fight. This bone will need to be dragged into each of the 3 breaths cast by the boss (%s, %s, %s).\n\n Note: Do not do any of the following while holding the bone or you will drop it.\n Do not cast any spells.\n Do not get hit by [Roaring Leap].\n Dying while holding the bone.\n\n You will need a separate player to soak each of the breaths. Therefore once one player has soaked a breath, they will need to drop the bone so another player can pick it up. Once all 3 breaths have been soaked while holding the chew toy you can kill the boss.", GetSpellLink(231846), GetSpellLink(227539), GetSpellLink(227566), GetSpellLink(227566)),
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1962,
                },
                boss3 = {
                    name = 1829, --Helya
                    bossIDs = {114537},
                    achievement = 11377,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At max level, this achievement is easier to complete solo. Simply kill the boss while you don’t have the %s debuff. This is done by making sure the Grimelord add is killed.", GetSpellLink(193367)),
                    enabled = true,
                    track = function() core._1648:Helya() end,
                    partial = false,
                },
            },

            [1530] = { --The Nighthold
                name = 786,
                boss1 = {
                    name = 1706, --Skorpyron
                    bossIDs = {}, --102263
                    achievement = 10678,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At max level, have your whole group stand on the circle in the middle of the room and nuke down the boss before he casts %s.", GetSpellLink(204316)),
                    enabled = true,
                    track = function() core._1530:Skorpyron() end,
                    partial = false,
                    encounterID = 1849,
                },
                boss2 = {
                    name = 1725, --Chronomatic Anomaly
                    bossIDs = {},
                    achievement = 10697,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("This achievement is easier to complete in heroic mode. Random players will get a %s debuff. These players need to stand on the blue circles around the boss room until the %s debuff expires. Once it expires you should see a spotlight appear at each of the blue circles around the room. Once at least 8 circles around the room have spotlights, you can kill the boss.", GetSpellLink(206617), GetSpellLink(206617)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1865,
                },
                boss3 = {
                    name = 1731, --Trilliax
                    bossIDs = {}, --104288
                    achievement = 10742,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At max level, you can simply just kill the boss to get this achievement.",
                    enabled = true,
                    track = function() core._1530:Trilliax() end,
					partial = false,
                    nameplateCheck = true,
                    encounterID = 1867,
                },
                boss4 = {
                    name = 1751, --Spellblade Aluriel
                    bossIDs = {},
                    achievement = 10817,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement requires dragging Spellblade Aluriel to various locations around the instance.\n\n The Shal’dorei Terrace: Located in the Botanist boss area. This can be completed on the bridge.\n Astromancer’s Rise: The room directly below Star Augar Etraeus.\n The Shattered Walkway: Located in front of Krosus.\n\n This achievement will take 3 lockouts to complete and can be completed in a single day.",
                    enabled = true,
                    track = function() core._1530:SpellbladeAluriel() end,
                    partial = false,
                    encounterID = 1871,
                },
                boss5 = {
                    name = 1732, --Star Augur Etraeus
                    bossIDs = {103758},
                    achievement = 10851,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement, you will need to drag Nether Elemental add being bound by 2 other adds located in the Spellblade Aluriel boss room up to Star Augar.\n\n You then need to dps the boss down to 30% without damaging the add. The add will then transform into a Well-Traveled Nether Elemental at which point you can kill the add then finish off the boss.",
                    enabled = true,
                    track = function() core._1530:StarAugurEtraeus() end,
                    partial = false,
                    encounterID = 1863,
                },
                boss6 = {
                    name = 1761, --High Botanist Tel'arn
                    bossIDs = {104528},
                    achievement = 10754,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Scattered around the botanist gardens are Mysterious Fruits. To complete this achievement every player needs to eat one of these fruits before pulling the boss and must not die during the encounter. The mysterious fruit will give the player the %s debuff. At max level you can simply nuke down the boss.\n\n Note: You must have at least 10 players minimum to complete this achievement.", GetSpellLink(220114)),
                    enabled = true,
                    track = function() core._1530:HighBotanistTelarn() end,
                    partial = false,
                    encounterID = 1886,
                },
                boss7 = {
                    name = 1713, --Krosus
                    bossIDs = {101002}, 
                    achievement = 10575,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("To complete this achievement, you must let 15 Burning Embers fall in the water during the bridge breaks. At max level you can simply not soak any of the %s to maximise the amount of Burning Embers. Once completed the achievement will go white and you can kill the boss.\n\n Note: The amount of Burning Embers that spawn depends on the group size. It is recommended to have 10+ players in the group to complete this achievement although this can vary depending on RNG.", GetSpellLink(205420)),
                    enabled = true,
                    track = function() core._1530:Krosus() end,
                    partial = false,
                    encounterID = 1842,
                },
                boss8 = {
                    name = 1762, --Tichondrius
                    bossIDs = {103685},
                    achievement = 10704,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At max level, you can simply kill the boss before he casts %s.\n\n Note: This achievement is a personal achievement.", GetSpellLink(213531)),
                    enabled = true,
                    track = function() core._1530:Tichondrius() end,
                    partial = false,
                    encounterID = 1862,
                },
                boss9 = {
                    name = 1743, --Elisande
                    bossIDs = {106643},
                    achievement = 10699,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will need to summon a Infinite Whelp pet before pulling the boss. You then to wait for the Expediant Elementral and Recursive Elemental to spawn then kill both on top of one another. Next drag the Infinite Whelp pet into the overlapping bubbles created from the elementals dying. This will spawn allow the Infinite Whelpling to be killed. Once the add is dead you can kill the boss.",
                    enabled = true,
                    track = function() core._1530:Elisande() end,
                    partial = false,
                    encounterID = 1872,
                },
                boss10 = {
                    name = 1737, --Gul'dan
                    bossIDs = {104154},
                    achievement = 10696,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("During phase 2, group up and wait for %s to spawn. The eyes will %s themselves over time spawning more and more eyes. Once 16 %s have spawned, nuke them down within 3 seconds of one another. Once this is done, you can kill the boss.", GetSpellLink(209270), GetSpellLink(209291), GetSpellLink(209270)),
                    enabled = true,
                    track = function() core._1530:Guldan() end,
                    partial = false,
                    encounterID = 1866,
                },
            },

            [1676] = { --Tomb of Sargeras
                name = 875,
                boss1 = {
                    name = 1862, --Goroth
                    bossIDs = {},
                    achievement = 11724,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Place world markers in a line and have your ranged dps and healers stack up on them so that Goroth spawns the %s in a straight line pointed towards him. Once someone is marked by %s they will have to go behind the pillars so that the star collides with the %s and destroys them.\n\n Rinse and repeat until the tracker goes white and then you can kill the boss.", GetSpellLink(233021), GetSpellLink(233279), GetSpellLink(233021)),
                    enabled = true,
                    track = function() core._1676:Goroth() end,
                    partial = false,
                    encounterID = 2032,
                },
                boss2 = {
                    name = 1867, --Demonic Inquisition
                    bossIDs = {116689,116691},
                    achievement = 11696,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Execute the fight as you normally do and slowly stop dps around 10-20%%. Now whenever Belac reaches one hundred energy he will cast %s, so everyone in the raid should attack him to get max torment really fast.\n\n Once everyone in the group has max torment you can kill the boss.", GetSpellLink(235230)),
                    enabled = true,
                    track = function() core._1676:DemonicInquisition() end,
                    partial = false,
                    encounterID = 2048,
                },
                boss3 = {
                    name = 1856, --Harjatan
                    bossIDs = {116407},
                    achievement = 11699,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "To spawn Elder Murk-Eye someone in the raid has to use the IAT_143660 toy.\n\n Use the toy at the start of the fight, focus Elder Murk-Eye, and after he dies you can kill the boss.",
                    enabled = true,
                    track = function() core._1676:Harjatan() end,
                    partial = false,
                    encounterID = 2036,
                },
                boss4 = {
                    name = 1861, --Mistress Sassz'ine
                    bossIDs = {},
                    achievement = 11676,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Hydra Essence comes from a player being hit by %s within Sarukel's %s.\n Ink Sauce comes from a player soaking the %s patch which has to come in contact with Sarukel's %s.\n Player Seasoning comes from a player willing to give their life by going into the inner circle of Sarukel's %s.\n Eel Tartare comes from the Abyss Stalkers, one of which has to die within Sarukel's %s.\n Murloc Fillet comes from the murlocs (Razorjaw Waverunners) from Phase 1, one of which also has to die within Sarukel's %s.\n Note: The Murlocs and the Abyss Stalkers need to be low health around 10%% before they can be sucked into the Maw. \n\n Preparation: To make this achievement extremely easy we recommend you use a third tank that will taunt murlocs and abyss stalkers away from the group so that they don't die to accidental cleave damage.\n Murlocs (Razorjaw Waverunners) only spawn in Phase 1 (100%%-70%%) and players should stand within %s patches so that the tank can pick them up once stunned players get dispelled.\n Abyss Stalkers will continue to spawn throughout Phase 2 so you don't have to worry about them too much.\n Strategy: To make the fight even easier you should first focus on getting 'Hydra Essence', 'Eel Tartare' and 'Murloc Fillet' parts of the achievement. %s (Ink Sauce) will stop Sarukel from casting %s so you should try to do this last at the same time with 'Player Seasoning' by sacrificing one of the players who soaked the ink.", GetSpellLink(230139), GetSpellLink(234621), GetSpellLink(232913), GetSpellLink(234621), GetSpellLink(234621), GetSpellLink(234621), GetSpellLink(234621), GetSpellLink(230358), GetSpellLink(232913), GetSpellLink(234621)),
                    enabled = true,
                    track = function() core._1676:MistressSasszine() end,
                    partial = false,
                    encounterID = 2037,
                },
                boss5 = {
                    name = 1903, --Sisters of the Moon
                    bossIDs = {118523,118374,118518},
                    achievement = 11773,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "On your way to the Sisters room you'll enter a large room full of trash and to the left you will find an isolated add called Twilight Soul, which you will have to pick up and interrupt throughout the fight.\n\n Bring the boss down to 20% health and the Twilight Soul will change its color to blue. Now you can kill the add, then kill the boss and you'll get the achievement.",
                    enabled = true,
                    track = function() core._1676:SistersOfTheMoon() end,
                    partial = false,
                    encounterID = 2050,
                },
                boss6 = {
                    name = 1896, --The Desolate Host
                    bossIDs = {},
                    achievement = 11674,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At the start of the fight a soul falls down and a player has to catch it by standing in the swirly yellow circle underneath the Engine of Souls.\n After that, every 5 seconds the soul will be launched in a random direction and a player from the opposite realm has to catch it. \n\n You will have to assign two people in each realm because the same person cannot soak two times in a row. The reason you do that is because if one of the players has the 'soul' above their character that means they recently caught it and are unable to do it again until someone else from the same realm catches the soul.\n\n Soak Rotation\n Soaker 1 - Corporeal Realm\n Soaker 1 - Spirit Realm\n Soaker 2 - Corporeal Realm\n Soaker 2 - Spirit Realm\n\nTips\n To make soaking easier, assigned players have to be marked and once they catch the soul they should always move towards a marked position such as the center of the room.\n Soakers should also watch out for the Reanimated Templar as as he will periodically cast %s, a spell that will knock them back if they get hit by the fel waves.\n Everyone affected by %s should move as far away as possible to avoid placing a wedge of shadow goo on the ground where the soul is supposed to be caught.", GetSpellLink(235956), GetSpellLink(235989)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2054,
                },
                boss7 = {
                    name = 1897, --Maiden of Vigilance
                    bossIDs = {},
                    achievement = 11675,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("There are a total of 9 Titanic Anomalies that you have to catch: 5 inside the well and 4 above the platform where you fight the Maiden of Vigilance.\n\n Split the raid into 2 parts as usual and then place a third world marker where assigned players will stack up to cause %s on themselves.\n\n The first Titanic Anomaly is pretty hard to capture since the gravity will pull you down as soon as you get %s. This is where your Demon Hunters, Hunters and Shamans come in handy due to their mid-air displacement abilities and because you don't want to waste too much time with this first orb you should sacrifice one of them.\n\n The next four Titanic Anomalies spawn as soon as the first one is captured and they rotate in a clockwise direction. You will have to go by trial and error until people get used to the timings. Jumping when you have 5 seconds left on the debuff seems to be the best moment to do it since you'll also make it back on the platform after you've captured the orb.\n\n Once you've collected all the orbs inside the well, the last four Titanic Anomalies will spawn above the platform and these ones are much easier to get. Just zoom out your camera and position your back towards the orbs so that you will catch it when you get knocked up into the air.", GetSpellLink(243276), GetSpellLink(236420)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2052,
                },
                boss8 = {
                    name = 1873, --Fallen Avatar
                    bossIDs = {},
                    achievement = 11683,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At max level you can just kill the boss before he cast %s.", GetSpellLink(235572)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2038,
                },
                boss9 = {
                    name = 1898, --Kil'jaeden
                    bossIDs = {117269},
                    achievement = 11770,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Preparation:\n Get as many Death Knights as you possibly can since their %s and %s are necessary for this achievement.\n Make sure every single player in the raid has their minimap zoomed in. As soon as someone finds Illidan during 'Intermission: Deceiver's Veil' that player can ping on the minimap to let others know of his location.\n Due to their insane mobility, Monks and Warriors are extremely helpful and they should talent %s / %s.\n\n Strategy\n Tank Kil'jaeden in a corner of the platform to force the adds to spawn close to each other.\n Assign your Death Knights to grip the Shadowsouls. They should always %s first and then %s.\n Everyone should spread out in a semicircle around Kil'jaeden so that at least 1 person will instantly find Illdan, get the %s buff and then rush towards the Shadowsouls to AoE stun and kill them.", GetSpellLink(49576), GetSpellLink(108199), GetSpellLink(119381), GetSpellLink(46968), GetSpellLink(49576), GetSpellLink(108199), GetSpellLink(236555)),
                    enabled = true,
                    track = function() core._1676:Kiljaeden() end,
                    partial = false,
                    encounterID = 2051,
                },
            },

            [1712] = { --Antorus the Burning Throne
                name = 946,
                boss1 = {
                    name = 1992, --Garothi Worldbreaker
                    bossIDs = {},
                    achievement = 11930,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement once someone is targeted by %s, that player will have to move near a worm in order to get it killed.\n\n Once you have killed 16 worms, the achievement will turn white and you can kill the boss", GetSpellLink(244410)),
                    enabled = true,
                    track = function() core._1712:GarothiWorldbreaker() end,
                    partial = false,
                    encounterID = 2076,
                },
                boss2 = {
                    name = 1987, --Felhounds of Sargeras
                    bossIDs = {122477,122135},
                    achievement = 12065,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("During the fight several pools of orange and purple color will spawn throughout the room. The tanks will have to bring each felhound to the pool that matches their own color in order to get a stack of %s. \n\nNote that the %s stacks get removed if the felhounds come close to each other. \n\nOnce both F'harg and Shatug have 5 stacks each you can kill the bosses.", GetSpellLink(253602), GetSpellLink(253602)),
                    enabled = true,
                    track = function() core._1712:FelhoundsOfSargeras() end,
                    partial = false,
                    encounterID = 2074,
                },
                boss3 = {
                    name = 1997, --Antoran High Command
                    bossIDs = {122367,130184,122369},
                    achievement = 12129,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At max level, you can just nuke the boss down without placing any %s", GetSpellLink(244902)),
                    enabled = true,
                    track = function() core._1712:AntoranHighCommand() end,
                    partial = false,
                    encounterID = 2070,
                },
                boss4 = {
                    name = 1985, --Portal Keeper Hasabel
                    bossIDs = {122104},
                    achievement = 11928,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("To open the Chaotic Rift, one player must be affected by all 3 debuffs from each platform at the same time. Bear in mind that this can only be done in Phase 1, which ends when the boss reaches 90%%, so make sure not to dps the boss at all.\n\nTo make this achievement easier, you can have one player bring the %s (orange debuff) close to the green platform. After that, another player can pick up the %s (purple debuff) from the purple platform, and then go to the green platform to pick up the %s (orange debuff) and the %s (green debuff).\n\nCombining these three debuffs will open a chaotic rift which will pull you constantly towards the back of the room.\n\nOnce the Chaotic Rift is open you can kill the boss", GetSpellLink(244613), GetSpellLink(245118), GetSpellLink(244613), GetSpellLink(82935)),
                    enabled = true,
                    track = function() core._1712:PortalKeeperHasabel() end,
                    partial = false,
                    encounterID = 2064,
                },
                boss5 = {
                    name = 2025, --Eonar
                    bossIDs = {},
                    achievement = 12067,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement, you will need to collect the 5 orbs of life within Eonar's Sanctuary. This achievement can be obtained only after you defeat the encounter. \n\nThe orbs spawn in a fixed pattern. After collecting the first  Orb of Life, you will then have to collect the rest within a certain amount of time or the orb sequence will reset.\nOrb 1 - Spawns on the platform which is connected to the lower and upper tracks with jump pads. Upon entering the Sanctuary, the platform is straight ahead.\nOrb 2 - Spawns on one of the pillars at the door near the middle path, which is the door you enter the Sanctuary through.\nOrb 3 - Spawns underneath Eonar's Essence platform, which is located to the left upon entering the Sanctuary.\nOrb 4 - Spawns between the two pillars underneath the upper path and is close to the first orb.\nOrb 5 - Spawns on a balcony far forward from the entrance to the Sanctuary, which you can reach by using the Extra Action Button.\n\n Once all 5 orbs are picked up, everyone in the raid group will get credit for it and obtain the achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2075,
                },
                boss6 = {
                    name = 2009, --Imonar the Soulhunter
                    bossIDs = {},
                    achievement = 11949,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement, you have to trigger all the traps on the bridge during the 2 intermissions. Intermission one happens at 66% health and Intermission two happens at 33% health. Once both intermissions are complete you can kill the boss",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2082,
                },
                boss7 = {
                    name = 2004, --Kin-garoth
                    bossIDs = {122578},
                    achievement = 12030,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement you will want to have your entire raid group stay in melee range of the boss and only detonate the %s that spawn in melee.\n\n Slowly dps the boss down until atleast 9 %s have spawned. Wait for the adds to come to the boss to avoid detonating %s", GetSpellLink(246779), GetSpellLink(246779), GetSpellLink(246779)),
                    enabled = true,
                    track = function() core._1712:KinGaroth() end,
                    partial = false,
                    encounterID = 2088,
                },
                boss8 = {
                    name = 1983, --Varimathras
                    bossIDs = {122366},
                    achievement = 11948,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("%s is triggered whenever a player is not within 8 yards of another player. Varimathras casts %s every 35 to 40 seconds, which will knock back the first target that he gets in contact with.\n\n The easiest way to complete this achievement at max level is to have your entire raid stack up against the wall with the tanks slightly in front of the group. You can then just kill the boss without anyone in the group moving.", GetSpellLink(243963), GetSpellLink(244042)),
                    enabled = true,
                    track = function() core._1712:Varimathras() end,
                    partial = false,
                    encounterID = 2069,
                },
                boss9 = {
                    name = 1986, --Coven of Shivarra
                    bossIDs = {},
                    achievement = 12046,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("This achievement is pretty straightforward and easy, however how you deal with the adds depends on your RNG:\nIf you get the %s as your first or second torment then you should kill all of them since your healers might struggle keeping everyone alive, and then wait for another wave to spawn.\n\nThe %s can be crowd controlled, so use abilities such as %s, %s or %s\n\nDon't forget to spread out while %s is active and move into a safe spot from the %s", GetSpellLink(250095), GetSpellLink(245910), GetSpellLink(710), GetSpellLink(187650), GetSpellLink(339), GetSpellLink(246763), GetSpellLink(245671)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2073,
                },
                boss10 = {
                    name = 1984, --Aggramar
                    bossIDs = {121975},
                    achievement = 11915,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement you will have to transform an Ember of Taeshalach into a Manifestation of Taeshalach. To accomplish that, the Ember has to get hit twice by Aggramar's %s combo.\n\nFirst you will want to let the Ember of Taeshalach move away from the edge of the platform, and then have a  Warlock %s it. In case you don't have any warlocks, you can use %s, %s or other crowd controls, however make sure that everyone stops dps on the boss to avoid any kind of accidental cleave, which might end up breaking the crowd control.\n\nThe %s is %s - %s - %s - %s - %s\n\nNote that you have to transform the Ember of Taeshalach within a single phase or else it will detonate, and because of this you should do it in Stage 2: Champion of Sargeras (80%%-40%%).", GetSpellLink(256208), GetSpellLink(710), GetSpellLink(187650), GetSpellLink(339), GetSpellLink(256208), GetSpellLink(244291), GetSpellLink(244033), GetSpellLink(244291), GetSpellLink(244033), GetSpellLink(246014)),
                    enabled = true,
                    track = function() core._1712:Aggramar() end,
                    partial = false,
                    encounterID = 2063,
                },
                boss11 = {
                    name = 2031, --Argus
                    bossIDs = {124828},
                    achievement = 12257,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will first have to get to Phase 4 of the fight. Once Argus kills the group only have the healers and tanks respawn using the tree. The rest of the group should stay dead and spread around the edges of the room.\n\nNow whenever Argus spawns atleast 6+ Reorigination Modules, wait for them to explode then have the players dead collect the Motes of Titanic Power around the room. You may wish to asssign one person inside the spirit world to make a short countdown so that everyone starts picking up the motes at the exact same time since you only have 5 seconds to complete the achievement. Once this is done, have the remaining players respawn using the tree and kill the boss.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 2092,
                },
            },
        },

        Dungeons = {
            [1753] = { --Seat of the Triumvirate
                name = 945,
                boss1 = {
                    name = 1979, --Zuraal the Ascended
                    bossIDs = {122313},
                    achievement = 12004,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1753:ZuraalTheAscended() end,
                    partial = false,
                    encounterID = 2065,
                },
                boss2 = {
                    name = 1980, --Saprish
                    bossIDs = {},
                    achievement = 12005,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2066,
                },
                boss3 = {
                    name = 1982, --L'ura
                    bossIDs = {124729},
                    achievement = 12009,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1753:Lura() end,
                    partial = false,
                    encounterID = 2068,
                },
            },

            [1544] = { --Assault on Violet Hold
                name = 777,
                boss1 = {
                    name = 1688, --Millificent Manastorm
                    bossIDs = {},
                    achievement = 10553,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1847,
                },
                boss2 = {
                    name = 1693, --Festerface
                    bossIDs = {101995},
                    achievement = 10554,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1544:Festerface() end,
                    partial = false,
                    encounterID = 1848,
                },
            },

            [1456] = { --Eye of Azshara
                name = 716,
                boss1 = {
                    name = 1480, --Warlord Parjesh
                    bossIDs = {91784},
                    achievement = 10456,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1456:WarlordParjesh() end,
                    partial = false,
                    encounterID = 1810,
                },
                boss2 = {
                    name = 1490, --Lady Hatecoil
                    bossIDs = {91789},
                    achievement = 10457,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1456:LadyHatecoil() end,
                    partial = false,
                    encounterID = 1811,
                },
                boss3 = {
                    name = 1492, --Wrath of Azshara
                    bossIDs = {96028},
                    achievement = 10458,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1456:WrathOfAzshara() end,
                    partial = false,
                    encounterID = 1814,
                },
            },

            [1466] = { --Darkheart Thicket
                name = 762,
                boss1 = {
                    name = 1656, --Dresaron
                    bossIDs = {99200},
                    achievement = 10766,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At max level, pull the boss, run through the big egg behind the boss to hatch it. Next kill the Hatespawn Abomination that spawns then kill the boss",
                    enabled = true,
                    track = function() core._1466:Dresaron() end,
                    partial = false,
                    encounterID = 1838,
                },
                boss2 = {
                    name = 1657, --Shade of Xavius
                    bossIDs = {99192},
                    achievement = 10769,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("DPS the boss down to 15%%-20%% health. Drag the boss through the swirly puddles on the ground until the boss has 10 stacks of %s then kill the boss.", GetSpellLink(221315)),
                    enabled = true,
                    track = function() core._1466:ShadeOfXavius() end,
                    partial = false,
                    encounterID = 1839,
                },
            },

            [1477] = { --Halls of Valor
                name = 721,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {99891},
                    achievement = 10544,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1477:StagParty() end,
                    partial = false,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10542,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss3 = {
                    name = 1489, --Odyn
                    bossIDs = {95676},
                    achievement = 10543,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1477:Odyn() end,
                    partial = false,
                    encounterID = 1809,
                },
            },

            [1458] = { --Neltharion's Lair
                name = 767,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10996,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1673, --Naraxas
                    bossIDs = {91005},
                    achievement = 10875,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1458:Naraxas() end,
                    partial = false,
                    encounterID = 1792,
                },
            },

            [1493] = { --Vault of the Wardens
                name = 707,
                boss1 = {
                    name = 1468, --Ash'Golm
                    bossIDs = {95886},
                    achievement = 10679,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1493:AshGolm() end,
                    partial = false,
                    encounterID = 1816,
                },
                boss2 = {
                    name = 1470, --Cordana
                    bossIDs = {95888},
                    achievement = 10680,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1493:Cordana() end,
                    partial = false,
                    encounterID = 1818,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10707,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1501] = { --Black Rook Hold
                name = 740,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10709,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1518, --Amalgam of Souls
                    bossIDs = {98542},
                    achievement = 10710,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1501:AmalgamOfSouls() end,
                    partial = false,
                    encounterID = 1832,
                },
                boss3 = {
                    name = 1653, --Ilysanna Ravencrest
                    bossIDs = {98696},
                    achievement = 10711,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1501:IllysannaRavencrest() end,
                    partial = false,
                    encounterID = 1833,
                },
            },

            [1492] = { --Maw of Souls
                name = 727,
                boss1 = {
                    name = 1502, --Ymiron
                    bossIDs = {96756},
                    achievement = 10413,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1492:Ymiron() end,
                    partial = false,
                    encounterID = 1822,
                },
                boss2 = {
                    name = 1486, --Helya
                    bossIDs = {},
                    achievement = 10412,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1824,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10411,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1516] = { --The Arcway
                name = 726,
                boss1 = {
                    name = 1497, --Ivanyr
                    bossIDs = {98203},
                    achievement = 10773,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1516:Ivanyr() end,
                    partial = false,
                    encounterID = 1827,
                },
                boss2 = {
                    name = 1498, --Corstilax
                    bossIDs = {},
                    achievement = 10775,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1825,
                },
                boss3 = {
                    name = 1501, --Advisor Vandros
                    bossIDs = {98208},
                    achievement = 10776,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1516:AdvisorVandros() end,
                    partial = false,
                    encounterID = 1829,
                },
            },

            [1571] = { --Court of Stars
                name = 800,
                boss1 = {
                    name = 1718, --Patrol Captain Gerdo
                    bossIDs = {},
                    achievement = 10610,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1868,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10611,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement, it is suggested that you follow the steps below to increase your chances of the conversation procing.\n\n - Kill all 5 Duskwatch Sentries before engaging the first boss\n - Disable all 5 Arcane Beacons before engaging the first boss\n - Guess the Spy on first try\n\n Check out https://www.wowhead.com/achievement=10611/dropping-some-eaves#comments:id=2622946 for more info on this achievement",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1651] = { --Return to Karazhan
                name = 860,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 11433,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1820, --Opera Hall
                    bossIDs = {},
                    achievement = 11335,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1957,
                },
                boss3 = {
                    name = 1837, --Moroes
                    bossIDs = {},
                    achievement = 11338,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1961,
                },
                boss4 = {
                    name = 1817, --Shade of Medivh
                    bossIDs = {},
                    achievement = 11432,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1651:ShadeOfMedivh() end,
                    partial = false,
                    encounterID = 1965,
                },
                boss5 = {
                    name = 1818, --Mana Devourer
                    bossIDs = {},
                    achievement = 11431,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1959,
                },
                boss6 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 11430,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1677] = { --Cathedral of Eternal Night
                name = 900,
                boss1 = {
                    name = 1905, --Agronox
                    bossIDs = {},
                    achievement = 11768,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("For this achievement, you need to stand on top of the 4 Budding Seed pods around the boss room and wait for a Fulminating Lasher to %s onto each of the Budding Seed. Once this is done for each of the 4 seeds you can kill the boss.", GetSpellLink(236627)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2055,
                },
                boss2 = {
                    name = 1906, --Thrashbite the Scornful
                    bossIDs = {117194},
                    achievement = 11769,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("Around the room there are 4 bookcases. To complete this achievement, you need to stand behind each of the bookcases and wait for the boss to cast %s in order to break a bookcase. Once a bookcase is broken, a clickable book appears on the floor. Each member in the group needs to click on this book. Rinse and repeat this for the other 3 bookcases in the boss room making sure you go in a clockwise direction. Once this is done, everyone in the group should have the %s buff and you can kill the boss.\n\n Note: You must have a full 5 man party to complete this achievement.", GetSpellLink(237726), GetSpellLink(243261)),
                    enabled = true,
                    track = function() core._1677:ThrashbiteTheScornful() end,
                    partial = false,
                    encounterID = 2057,
                },
                boss3 = {
                    name = 1878, --Mephistroth
                    bossIDs = {},
                    achievement = 11703,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format("At the start of the fight pick up the IAT_129207. You then need to wait for the boss to reach 100 energy which will begin phase 2. During phase 2 face the shield you picked up at the start of the fight towards the %s. Once 20 %s have been reflected with the shield, the achievement tracker will turn white and you can kill the boss.", GetSpellLink(232502), GetSpellLink(232502)),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2039,
                },
            },
        },
    },

    --Warlords of Dranor
    [4] = {
        Raids = {
            [1228] = { --Highmaul
                name = 477,
                boss1 = {
                    name = 1128, --Kargath Bladefist
                    bossIDs = {78714},
                    achievement = 8948,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke the boss down.",
                    enabled = true,
                    track = function() core._1228:KargathBladefist() end,
                    partial = false,
                    encounterID = 1721,
                },
                boss2 = {
                    name = 971, --The Butcher
                    bossIDs = {77404},
                    achievement = 8947,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1228:TheButcher() end,
                    partial = false,
                    encounterID = 1706,
                },
                boss3 = {
                    name = 1195, --Tectus
                    bossIDs = {}, --78948
                    achievement = 8974,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just nuke the boss down for the first and second split. On the third split wait for all 8 versions of the boss to spawn, then AOE them down within 10 seconds of one another.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1722,
                },
                boss4 = {
                    name = 1196, --Brackenspore
                    bossIDs = {78491},
                    achievement = 8975,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Before pulling the boss pick up the flamethrower fun. Damage the boss to below 50% health so that the green moss starts growing from the edges of the room. Once the room is full of green moss, start pressing the flamethrower button over the boss. Keep pressing the flamethrower button every time it comes off cooldown until you reach 15 stacks of Burning Infusion. Once you have 15 stacks you can kill the boss. The stacks do need to stay on you once you reach 15.",
                    enabled = true,
                    track = function() core._1228:Brackenspore() end,
                    partial = false,
                    encounterID = 1720,
                },
                boss5 = {
                    name = 1148, --Twin Ogron
                    bossIDs = {78237,78238},
                    achievement = 8958,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke the bosses down. Make sure they are standing next to each other.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1719,
                },
                boss6 = {
                    name = 1153, --Ko'ragh
                    bossIDs = {79015},
                    achievement = 8976,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._1228:Koragh() end,
                    partial = false,
                    encounterID = 1723,
                },
                boss7 = {
                    name = 1197, --Imperator Mar'gok
                    bossIDs = {},
                    achievement = 8977,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1228:ImperatorMargok() end,
                    partial = false,
                    encounterID = 1705,
                },
            },

            [1205] = { --Blackrock Foundry
                name = 457,
                boss1 = {
                    name = 1122, --Beastlord Darmac
                    bossIDs = {76865},
                    achievement = 8981,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Takes 3 kills to complete. Boss will mount the beast that is closest to him. DPS the boss down slowly and wait for boss to mount beast before killing.",
                    enabled = true,
                    track = function() core._1205:BeastlordDarmac() end,
                    partial = false,
                    encounterID = 1694,
                },
                boss2 = {
                    name = 1147, --Operator Thogar
                    bossIDs = {76906},
                    achievement = 8982,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Wait 10 seconds after pulling the boss then place Toy train set and then immediately after the wind up train wrecker on the first set of tracks as you enter the boss room. Achievement will be earned as soon as the requirements have been met.",
                    enabled = true,
                    track = function() core._1205:OperatorThogar() end,
                    partial = false,
                    encounterID = 1692,
                },
                boss3 = {
                    name = 1203, --Iron Maidens
                    bossIDs = {77477, 77557, 77231},
                    achievement = 8984,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Nuke all 3 bosses within 10 seconds of one another",
                    enabled = true,
                    track = function() core._1205:TheIronMaidens() end,
                    partial = false,
                    encounterID = 1695,
                },
                boss4 = {
                    name = 1155, --Hans'gar & Franzok
                    bossIDs = {76973, 76974},
                    achievement = 8980,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Nuke boss down as quick as possible without anyone in the group getting hit by a stamping press. The stamping press display an orange glow on the floor a few seconds before stamping.",
                    enabled = true,
                    track = function() core._1205:HansgarFranzok() end,
                    partial = false,
                    encounterID = 1693,
                },
                boss5 = {
                    name = 1123, --Flamebender Ka'graz
                    bossIDs = {76814},
                    achievement = 8929,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "1 person tank Aknor Stellbringer away from the boss.  Everyone else single target the boss down.",
                    enabled = true,
                    track = function() core._1205:FlamebenderKagraz() end,
                    partial = false,
                    encounterID = 1689,
                },
                boss6 = {
                    name = 1162, --Kromog
                    bossIDs = {77692},
                    achievement = 8983,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Requires atleast 10 players but more players makes achievement easier. Spread out around the room and wait for orange runes to spawn. When they spawn each player stand on their own rune. When hands spawn from runes and grab players nuke hands down as quickly as possible.",
                    enabled = true,
                    track = function() core._1205:Kromog() end,
                    partial = false,
                    encounterID = 1713,
                },
                boss7 = {
                    name = 1161, --Gruul
                    bossIDs = {},
                    achievement = 8978,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "1 player tank boss at entrance to room with boss facing into the center of the room. Everyone else stand underneath the ore which is positioned on the ceiling of the boss room. When boss casts overhead smash, players will be flung into the air. Click on the ore on the ceiling to collect it. Once all 3 ores have been collected you can nuke boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1691,
                },
                boss8 = {
                    name = 1202, --Oregorger
                    bossIDs = {},
                    achievement = 8979,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1696,
                },
                boss9 = {
                    name = 1154, --Blast Furnace
                    bossIDs = {76806},
                    achievement = 8930,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Completed during phase 2. During phase 2, 4 random players will be targeted by slag elementals. If you have a slag elemental following you, run to one of the primal elementalists which doesn’t have a slag elemental already on. Once there is slag elemental on each primal elementalists you can nuke down the slag elemental then primal elementalists as quick as possible. Getting all 4 primal elementalists down within 10 seconds will reward this achievement. ",
                    enabled = true,
                    track = function() core._1205:BlastFurnace() end,
                    partial = false,
                    encounterID = 1690,
                },
                boss10 = {
                    name = 959, --Blackhand
                    bossIDs = {77325},
                    achievement = 8952,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "DPS the boss down to 30% to reach phase 3. Ashes will then start falling from the ceiling. Spread out around the platform and stand underneath the falling ashes until it lands on you. Once the group has collected 20 falling ashes you can nuke boss. The more players you have the easy this achievement is.",
                    enabled = true,
                    track = function() core._1205:Blackhand() end,
                    partial = false,
                    encounterID = 1704,
                },
            },
            
            [1448] = { --Hellfire Citadel
                name = 669,
                boss1 = {
                    name = 1426, --Hellfire Assault
                    bossIDs = {93023},
                    achievement = 10026,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, simply nuke down all the mobs/vehicles as quick as possible. Make sure to keep an eye on the Felfire Crushers and Artillery especially",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    nameplateCheck = true,
                    encounterID = 1778,
                },
                boss2 = {
                    name = 1425, --Iron Reaver
                    bossIDs = {}, --90284
                    achievement = 10057,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "On the ledges to the left and right of the boss there are untargetable Hellfire Guardians. Bring the boss up against these ledges facing the boss towards the Hellfire Guardians. When the boss casts barrage, this should kill the mobs.",
                    enabled = true,
                    track = function() core._1448:IronReaver() end,
                    partial = false,
                    encounterID = 1785,
                    encounterID = 1785,
                },
                boss3 = {
                    name = 1392, --Kormrok
                    bossIDs = {90435},
                    achievement = 10013,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Personal Achievement. Nuke down boss and avoid getting hit by any waves during the encounter.",
                    enabled = true,
                    track = function() core._1448:Kormrok() end,
                    partial = false,
                    encounterID = 1787,
                },
                boss4 = {
                    name = 1432, --Hellfire High Council
                    bossIDs = {92144, 92146, 92142},
                    achievement = 10054,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Nuke down all 3 bosses so that they die within 10 seconds of one another",
                    enabled = true,
                    track = function() core._1448:HellfireHighCouncil() end,
                    partial = false,
                    encounterID = 1798,
                },
                boss5 = {
                    name = 1396, --Kilrogg Deadeye
                    bossIDs = {90378},
                    achievement = 9972,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just simply nuke down the boss",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1786,
                },
                boss6 = {
                    name = 1372, --Gorefiend
                    bossIDs = {90199},
                    achievement = 9979,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "During Feasts of Soul phase, players who do not have the Gorefiends Corruption debuff need to die. This can be done by standing in the pool the boss is sitting in. Once dead the players will get teleported into the belly of the boss. They need to kill the Fragment of the crone once inside. Once the fragment of the crone is dead, the soul of the crone will spawn in the boss room which can then be killed by the group.",
                    enabled = true,
                    track = function() core._1448:Gorefiend() end,
                    partial = false,
                    encounterID = 1783,
                },
                boss7 = {
                    name = 1433, --Shadow-Lord Iskar
                    bossIDs = {90316},
                    achievement = 9988,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just simply nuke down the boss without picking up the Eye of Anzu",
                    enabled = true,
                    track = function() core._1448:ShadowLordIskar() end,
                    partial = false,
                    encounterID = 1788,
                },
                boss8 = {
                    name = 1427, --Socrethar the Eternal
                    bossIDs = {90296},
                    achievement = 10086,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "During phase 2. Use the robot to put up a prison at the blue portal. Continue to use the prison at the portal to trap the adds until 20 Haunting Souls are trapped. Once this is done, leave the vehicle and aoe all the adds down. Players can also cc the adds to keep them in place. Do not kill the adds with the robot.",
                    enabled = true,
                    track = function() core._1448:SocretharTheEternal() end,
                    partial = false,
                    encounterID = 1794,
                },
                boss9 = {
                    name = 1394, --Tyrant Velhari
                    bossIDs = {93439},
                    achievement = 9989,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "1 person tank the Ancient Enforcer away from the group. Everyone else nuke the boss down",
                    enabled = true,
                    track = function() core._1448:TyrantVelhari() end,
                    partial = false,
                    encounterID = 1784,
                },
                boss10 = {
                    name = 1391, --Fel Lord Zakuun
                    bossIDs = {89890},
                    achievement = 10012,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down",
                    enabled = true,
                    track = function() core._1448:FelLordZakuun() end,
                    partial = false,
                    encounterID = 1777,
                },
                boss11 = {
                    name = 1447, --Xhul'horac
                    bossIDs = {93068},
                    achievement = 10087,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss down",
                    enabled = true,
                    track = function() core._1448:Xhulhorac() end,
                    partial = false,
                    encounterID = 1800,
                },
                boss12 = {
                    name = 1395, --Mannoroth
                    bossIDs = {91349, 91305},
                    achievement = 10030,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At the start of the fight kill the green & purple summoner. Wait for a player to get curse of the legion debuff before killing the red summoner. Once the curse of the legion debuff runs out or is dispelled, a doom lord will spawn. Get the doom lord down to 5% health. Next dps down Mannoroth to 30% health. Once this is done place the doom lord in front of the boss and wait for it to get killed by Mannoroth Empowered Fel Seeker ability. Once the doom lord has been killed by the boss, you can kill the boss.",
                    enabled = true,
                    track = function() core._1448:Mannoroth() end,
                    partial = false,
                    encounterID = 1795,
                },
                boss13 = {
                    name = 1438, --Archimonde
                    bossIDs = {91331},
                    achievement = 10073,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Wait for the Doomfire Spirit to spawn then nuke down boss. The Doomfire Spirit does not need to stay alive",
                    enabled = true,
                    track = function() core._1448:Archimonde() end,
                    partial = false,
                    encounterID = 1799,
                },
            },
        },

        Dungeons = {
            [1175] = { --Bloodmaul Slag Mines
                name = 385,
                boss1 = {
                    name = 888, --Slave Watcher Crushto
                    bossIDs = {},
                    achievement = 9005,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1653,
                },
                boss2 = {
                    name = 893, --Magmolatus
                    bossIDs = {74366},
                    achievement = 8993,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, dps down the boss slowly so that both Calamity and Ruination have a chance to spawn",
                    enabled = true,
                    track = function() core._1175:Magmolatus() end,
                    partial = false,
                    encounterID = 1655,
                },
                boss3 = {
                    name = 889, --Gug'rokk
                    bossIDs = {74790},
                    achievement = 9008,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, single target the boss down so that no Unstable Slags are killed",
                    enabled = true,
                    track = function() core._1175:Gugrokk() end,
                    partial = false,
                    encounterID = 1654,
                },
            },

            [1195] = { --Iron Docks
                name = 558,
                boss1 = {
                    name = 1235, --Fleshrender Nok'gar
                    bossIDs = {81305, 83026, 84520, 81603},
                    achievement = 9083,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1195:FleshrenderNokgar() end,
                    partial = false,
                    encounterID = 1749,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 9081,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 1238, --Skulloc
                    bossIDs = {83612},
                    achievement = 9082,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1195:Skulloc() end,
                    partial = false,
                    encounterID = 1754,
                },
            },

            [1182] = { --Auchindoun
                name = 547,
                boss1 = {
                    name = 1186, --Soulbinder Nyami
                    bossIDs = {},
                    achievement = 9023,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1685,
                },
                boss2 = {
                    name = 1216, --Azzakel
                    bossIDs = {},
                    achievement = 9551,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1678,
                },
                boss3 = {
                    name = 1225, --Teron'gor
                    bossIDs = {},
                    achievement = 9552,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1714,
                },
            },

            [1209] = { --Skyreach
                name = 476,
                boss1 = {
                    name = 965, --Ranjit
                    bossIDs = {75964},
                    achievement = 9033,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1209:Ranjit() end,
                    partial = false,
                    encounterID = 1698,
                },
                boss2 = {
                    name = 967, --Rukhran
                    bossIDs = {},
                    achievement = 9035,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1700,
                },
                boss3 = {
                    name = 968, --High Sage Viryx
                    bossIDs = {76266},
                    achievement = 9036,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1209:HighSageViryx() end,
                    partial = false,
                    encounterID = 1701,
                },
                boss4 = {
                    name = 968, --High Sage Viryx
                    bossIDs = {},
                    achievement = 9034,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = nil,
                    partial = false,
                    encounterID = 1701,
                },
            },

            [1208] = { --Grimrail Depot
                name = 536,
                boss1 = {
                    name = 1138, --Rocketspark and Borka
                    bossIDs = {77803,77816},
                    achievement = 9024,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1208:RocketsparkAndBorka() end,
                    partial = false,
                    encounterID = 1715,
                },
                boss2 = {
                    name = 1163, --Nitrogg Thundertower
                    bossIDs = {},
                    achievement = 9007,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1732,
                },
            },

            [1279] = { --The Everbloom
                name = 556,
                boss1 = {
                    name = 1214, --Witherbark
                    bossIDs = {81522},
                    achievement = 9017,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1279:Witherbark() end,
                    partial = false,
                    encounterID = 1746,
                },
                boss2 = {
                    name = 1208, --Archmage Sol
                    bossIDs = {},
                    achievement = 9493,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1751,
                },
                boss3 = {
                    name = 1210, --Yalnu
                    bossIDs = {}, --83846
                    achievement = 9223,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1756,
                },
            },

            [1176] = { --Shadowmoon Burial Grounds
                name = 537,
                boss1 = {
                    name = 1139, --Sadana Bloodfury
                    bossIDs = {},
                    achievement = 9018,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1677,
                },
                boss2 = {
                    name = 1140, --Bonemaw
                    bossIDs = {77006, 75452},
                    achievement = 9025,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1176:Bonemaw() end,
                    partial = true,
                    encounterID = 1679,
                },
                boss3 = {
                    name = 1160, --Ner'zhul
                    bossIDs = {76407},
                    achievement = 9026,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1176:Nerzhul() end,
                    partial = false,
                    encounterID = 1682,
                },
            },

            [1358] = { --Upper Blackrock Spire
                name = 559,
                boss1 = {
                    name = 1226, --Orebender Gor'ashan
                    bossIDs = {76413},
                    achievement = 9045,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1358:OrebenderGorashan() end,
                    partial = false,
                    encounterID = 1761,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 9058,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 1229, --Ragewing the Untamed
                    bossIDs = {76585},
                    achievement = 9056,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1358:RagewingTheUntamed() end,
                    partial = false,
                    encounterID = 1760,
                },
                boss4 = {
                    name = 1234, --Warlord Zaela
                    bossIDs = {77120},
                    achievement = 9057,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1358:WarlordZaela() end,
                    partial = false,
                    encounterID = 1762,
                },
            },
        },
    },

    --Mists of Pandaria
    [5] = {
        Raids = {
            [996] = { --Terrace of Endless Spring
                name = 320,
                boss1 = {
                    name = 683, --Protectors of the Endless
                    bossIDs = {60583, 60586, 60585},
                    achievement = 6717,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement takes 3 weeks to complete. All you need to do is rotate which 1 of the 3 bosses is to be killed last each week",
                    enabled = true,
                    track = function() core._996:ProtectorsOfTheEndless() end,
                    partial = false,
                    encounterID = 1409,
                },
                boss2 = {
                    name = 742, --Tsulong
                    bossIDs = {62442},
                    achievement = 6933,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply nuke the boss since it takes ~70 seconds for the enchanted plant to die without any healing",
                    enabled = true,
                    track = function() core._996:Tsulong() end,
                    partial = false,
                    encounterID = 1505,
                },
                boss3 = {
                    name = "729", --Lei Shi
                    bossIDs = {62983},
                    achievement = 6824,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Once you have started the fight. Every player must go down the steps to left and right of the boss into the water and walk up to a Parasitoid Sha. Once a player is close enough to the Parasitoid Sha it will attach itself to the head of that player. Once everyone in the raid has a Parasitoid Sha on their head, you can single target the boss down. Do not use multi-target abilities since you may accidently kill a Parasitoid Sha",
                    enabled = true,
                    track = function() core._996:LeiShi() end,
                    partial = false,
                    encounterID = 1506,
                },
                boss4 = {
                    name = 709, --Sha of Fear
                    bossIDs = {60999},
                    achievement = 6825,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply nuke the boss. Make sure you stand in the light to avoid getting feared",
                    enabled = true,
                    track = function() core._996:ShaOfFear() end,
                    partial = false,
                    encounterID = 1431,
                },
            },

            [1098] = { --Throne of Thunder
                name = 362,
                boss1 = {
                    name = 827, --Jin'rokh the Breaker
                    bossIDs = {},
                    achievement = 8094,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "The boss will randomly cast Focused Lighting Orbs on players. If the orb reaches the player it will explode. 2 players need to get the focused lighting orbs to explode into each other. To do this run away from the orb if it has been targeted on you. Once a 2nd orb has spawned, run your orb into the other players orb.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1577,
                },
                boss2 = {
                    name = 819, --Horridon
                    bossIDs = {68476},
                    achievement = 8038,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply nuke the boss down before any Zandalari Dinomancers spawn.",
                    enabled = true,
                    track = function() core._1098:Horridon() end,
                    partial = false,
                    encounterID = 1575,
                },
                boss3 = {
                    name = 816, --Council of Elders
                    bossIDs = {},
                    achievement = 8073,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply nuke down the boss. Make sure everyone is in the inner circle before pulling the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1570,
                },
                boss4 = {
                    name = 825, --Tortos
                    bossIDs = {67977},
                    achievement = 8077,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill at least 6 Whirl Turtles in a line next to one another. Once you have enough Whirl Turtles. Click on one the whirl turtle at either end of the line to kick it into the other turtles. Make sure you are facing towards the other turtles so it gets sent in the correct direction.",
                    enabled = true,
                    track = function() core._1098:Tortos() end,
                    partial = false,
                    encounterID = 1565,
                },
                boss5 = {
                    name = 821, --Megaera
                    bossIDs = {70235, 70212, 70247},
                    achievement = 8082,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement takes 3 kills to complete. During the encounter only kill 2 of the heads leaving out a different head each time.",
                    enabled = true,
                    track = function() core._1098:Megaera() end,
                    partial = false,
                    encounterID = 1578,
                },
                boss6 = {
                    name = 828, --Ji-Kun
                    bossIDs = {69712},
                    achievement = 8097,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "The golden egg will fall from the nest in the ceiling to the right of the boss from where you land. To do this achievement 1 player needs to jump down to the nest to the right below the platform 10 seconds after pulling the boss. Once the player is down there they need to kill the adds. This should give them a special action ability which they can use to fly up to the nest in the celling. Once there they need to watch out for the golden egg and click on it as quickly as possible. Once they have caught the egg you need a priest to cast leap of faith on that player back onto the platform. Once the egg is safely on the platform, the player with the egg must avoid all damage otherwise they will drop the egg. Nuke down the boss as soon as the egg is on the platform.",
                    enabled = true,
                    track = function() core._1098:JiKun() end,
                    partial = false,
                    encounterID = 1573,
                },
                boss7 = {
                    name = 818, --Durumu the Forgotten
                    bossIDs = {68036},
                    achievement = 8098,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Throughout the fight there will be 3 flashes of white light somewhere on the platform. To complete this achievement the 3 players that get targeted with the beams need to stand on top of the white fog to reveal one of 3 fog beasts (orange, purple and green). Once all fog beasts have been revealed you can nuke the boss.",
                    enabled = true,
                    track = function() core._1098:DurumuTheForgotten() end,
                    partial = false,
                    encounterID = 1572,
                },
                boss8 = {
                    name = 820, --Primordius
                    bossIDs = {69017},
                    achievement = 8037,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke down the boss. Do not stand in any puddles on the ground.",
                    enabled = true,
                    track = function() core._1098:Primordius() end,
                    partial = false,
                    encounterID = 1574,
                },
                boss9 = {
                    name = 824, --Dark Animus
                    bossIDs = {},
                    achievement = 8081,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement may take more than 1 run to complete although you can have multiple attempts during the same lockout. If you kill the Dark Ritualists without pulling the boss, you can reset the instance since they are counted as trash mobs. To do this convert the raid to heroic after killing the ritualists. Wait for a prompt to appear on your screen asking you to leave the instance. Once you are out of the instance, change the instance mode back to normal and then reset the instance. This can be done 9 time before you get locked out of the instance.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1576,
                },
                boss10 = {
                    name = 817, --Iron Qon
                    bossIDs = {68078},
                    achievement = 8087,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke down the boss.",
                    enabled = true,
                    track = function() core._1098:IronQon() end,
                    partial = false,
                    encounterID = 1559,
                },
                boss11 = {
                    name = 829, --Twin Consorts
                    bossIDs = {68905, 68904},
                    achievement = 8086,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, nuke down Lu’lin first then kill Suen.",
                    enabled = true,
                    track = function() core._1098:TwinConsorts() end,
                    partial = false,
                    encounterID = 1560,
                },
                boss12 = {
                    name = 729, --Lei Shen
                    bossIDs = {68397},
                    achievement = 8090,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement takes 4 kills to complete. Around the corners of the room there are 4 conduits. The boss will teleport to each conduit. Each week pick a different conduit to pull the boss at. Wait for the conduit to reach 3 stacks and overload then nuke the boss down.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1579,
                },
            },

            [1136] = { --Siege of Orgrimmar
                name = 369,
                boss1 = {
                    name = 852, --Immerseus
                    bossIDs = {71543},
                    achievement = 8536,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "During the split phase, crowd control the Sha Puddles on the ground. Keep them crowed controlled until they turn into Tears of the vale. At which point you can kill them. Kill 10 Tears of the vale to gain the achievement.",
                    enabled = true,
                    track = function() core._1136:Immerseus() end,
                    partial = false,
                    encounterID = 1602,
                },
                boss2 = {
                    name = 849, --The Fallen Protectors
                    bossIDs = {71475, 71479, 71480},
                    achievement = 8528,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 66% the boss will place " .. GetSpellLink(144365) .. " on a random player. You need to transfer this mark to 5 players by using the special action button on your screen which will appear once you have the debuff. You also need to transfer the Mark of Anguish at least 200 yards around the room. Spread the group around the room 40yards apart and continue to transfer the mark until the achievement goes white.",
                    enabled = true,
                    track = function() core._1136:TheFallenProtectors() end,
                    partial = true,
                    encounterID = 1598,
                },
                boss3 = {
                    name = 866, --Amalgam of Corruption
                    bossIDs = {72276},
                    achievement = 8532,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss to gain the achievement",
                    enabled = true,
                    track = function() core._1136:AmalgamOfCorruption() end,
                    partial = false,
                    encounterID = 1624,
                },
                boss4 = {
                    name = 867, --Sha of Pride
                    bossIDs = {71734},
                    achievement = 8521,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss to gain the achievement",
                    enabled = true,
                    track = function() core._1136:ShaOfPride() end,
                    partial = true,
                    encounterID = 1604,
                },
                boss5 = {
                    name = 881, --Galakras
                    bossIDs = {72311},
                    achievement = 8530,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the adds and boss to gain the achievement",
                    enabled = true,
                    track = function() core._1136:Galakras() end,
                    partial = true,
                    encounterID = 1622,
                },
                boss6 = {
                    name = 864, --Iron Juggernaut
                    bossIDs = {71466},
                    achievement = 8520,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "During the Siege phase, a random player will get targeted with the " .. GetSpellLink(144918) .. ". This player needs to kite the laser through the mines on the ground. Once the mines have been run over by the laser they will turn superheated. At this point click on the mines to stomp on them. Stomp on 6 superheated mines to earn the achievement.",
                    enabled = true,
                    track = function() core._1136:IronJuggernaut() end,
                    partial = false,
                    encounterID = 1600,
                },
                boss7 = {
                    name = 856, --Kor'kron Dark Shaman
                    bossIDs = {},
                    achievement = 8453,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Warning: Do not AOE trash after Iron Juggernaut. 1.) Kill the Oversear with the axe to save Ji Firepaw (you only have a few seconds after entering the room to do this). 2.) Save either the Theramore citizens being held by Overseer Thathung (do not kill the citizens) or save the orcs being held by Overseer Mojka (do not kill the orcs).  3.) Collect a key from Mokuar the Treasurer and unlock a cage of prisoners.",
                    enabled = true,
                    track = function() end,
                    encounterID = 1606,
                },
                boss8 = {
                    name = 850, --General Nazgrim
                    bossIDs = {71515},
                    achievement = 8448,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Release Gamon from the chains just outside the entrance to The Drag. Wait for Gamon to reach the boss before pulling, then just nuke the boss down.",
                    enabled = true,
                    track = function() core._1136:GeneralNazgrim() end,
                    partial = false,
                    encounterID = 1603,
                },
                boss9 = {
                    name = 846, --Malkorok
                    bossIDs = {71454},
                    achievement = 8538,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Drag the Corrupted Skullsplitter mob from the bottom of the stairs to Malkorok. Place the Corrupted Skullsplitter in the area the boss casts his Arcing Smash ability in. If the boss does not cast this ability then you need to dps the boss down the little. The boss will eventually cast Breath of Y'shaarj which should turn the Corrupted Skullspitter into a Corrupted Amalgamation. Once this happens nuke the add & boss.",
                    enabled = true,
                    track = function() core._1136:Malkorok() end,
                    partial = false,
                    encounterID = 1595,
                },
                boss10 = {
                    name = 870, --Spoils of Pandaria
                    bossIDs = {71385, 71398, 71383, 71397, 71405, 73951, 71409, 71388, 73948, 73949, 71380, 72535, 71392, 71433, 71378, 71395, 71393, 71408, 73723, 73724, 73725},
                    achievement = 8529,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Requires at least 2 players. Split the group into 2. One group should only kill Mantid mobs and the other group should only kill Mogu mobs. This is done by one group clearing each mob type on one side of the room then using the hook to move to move back up and across to the other side of the room. Do not go through the door in the middle of the two rooms.",
                    enabled = true,
                    track = function() core._1136:SecuredStockpileOfPandarenSpoils() end,
                    partial = false,
                    encounterID = 1594,
                },
                boss11 = {
                    name = 851, --Thok the Bloodthirsty
                    bossIDs = {}, --71529
                    achievement = 8527,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Requires at least 5 players. All players in the group need to reduce health to 50% or lower. Once this has happened the boss will move into the next phase. In this phase If you get fixated by the boss run away otherwise you will be instant killed. Kill the Kor’kron Jailer that spawns, pick up the key that drops and open the cage to the left of the room as you entered. Once the cage has been unlocked 3 times, the snail will come out. Nuke down the boss and wait for the snail to eat the remains.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1599,
                },
                boss12 = {
                    name = 865, --Siegecrafter Blackfuse
                    bossIDs = {71504},
                    achievement = 8543,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss to gain the achievement",
                    enabled = true,
                    track = function() core._1136:SiegecrafterBlackfuse() end,
                    partial = false,
                    encounterID = 1601,
                },
                boss13 = {
                    name = 853, --Paragons of the Klaxxi
                    bossIDs = {71158, 71152, 71155, 71153, 71157, 71160, 71156, 71154, 71161},
                    achievement = 8531,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement takes 3 kills to complete. Once each of bosses is killed, click on the boss to gain one of the appearances. Your role will dictate which bosses you gain appearances from. Nuke the bosses down slowly to make sure you get an appearance.",
                    enabled = true,
                    track = function() core._1136:Paragons() end,
                    partial = false,
                    encounterID = 1593,
                },
                boss14 = {
                    name = 869, --Garrosh Hellscream
                    bossIDs = {71865},
                    achievement = 8537,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Wait for 18 Kor’kron Warbringers to spawn. While waiting kill the siege engineers so that the Iron Stars are not launched. Also kill the shamans so they don’t heal the mobs later on. Once you have enough mobs stand at the opposite end and facing one the iron stars (this is done so the mobs are not accidently killed by the other iron star). Stop killing the engineers and wait for the Warbringers to get killed.",
                    enabled = true,
                    track = function() core._1136:GarroshHellscream() end,
                    partial = false,
                    encounterID = 1623,
                },
            },

            [1009] = { --Heart of Fear
                name = 330,
                boss1 = {
                    name = 745, --Imperial Vizier Zor'lok
                    bossIDs = {62980},
                    achievement = 6937,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "The " .. GetSpellLink(125785) .. " bugs spawn at the four pillars around the center of the room. 2 Zealous Parasite spawn at each pillar at a time. Every player needs to click on one of these Zealous Parasite to gain a debuff. Once every player in the group has got the debuff you can kill the boss. All players in the raid need to be alive and have the debuff to gain the achievement.",
                    enabled = true,
                    track = function() core._1009:ImperialVizierZorlok() end,
                    partial = false,
                    encounterID = 1507,
                },
                boss2 = {
                    name = 744, --Blade Lord Ta'yak
                    bossIDs = {},
                    achievement = 6936,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "There are 4 Braziers in the center of the room and 2 braziers to the far left and far right of the room as you are looking at the boss. Once the boss has reached 20% health you need to click on the braziers in the middle of the room which are lit up to gain the " .. GetSpellLink(128949) .. " buff. You then need to run to one of the brazier on the far right/left to light it up. Once all 4 far braziers are lit up you can kill the boss",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1504,
                },
                boss3 = {
                    name = 713, --Garalon
                    bossIDs = {62164, 63053},
                    achievement = 6553,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can single target the boss to gain the achievement. Avoid AOE as this may kill the legs",
                    enabled = true,
                    track = function() core._1009:Garalon() end,
                    partial = false,
                    encounterID = 1463,
                },
                boss4 = {
                    name = 741, --Wind Lord Mel'jarak
                    bossIDs = {},
                    achievement = 6683,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss to gain this achievement",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1498,
                },
                boss5 = {
                    name = 737, --Amber-Shaper Un'sok
                    bossIDs = {},
                    achievement = 6518,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will need atleast 2 players. Once you pull the boss, kill the Living Amber so that the pools that spawn once these adds are killed are stacked on top of one another. Once you have 8 pools stacked ontop of one another, you can nuke the boss. If a player becomes an Amber Monster then nuke that player down to 20% health to free them",
                    enabled = true,
                    track = function() core._1009:AmberShaperUnsok() end,
                    partial = false,
                    encounterID = 1499,
                },
                boss6 = {
                    name = 743, --Grand Empress Shek'zeer
                    bossIDs = {62837},
                    achievement = 6922,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you need a way to taunt the boss between 2 targets to manage the " .. GetSpellLink(123707) .. " debuff. 2 players will need to taunt at 4 stacks of the debuff to avoid dying. This will keep happening until the boss reaches 0 energy at which points the adds will spawn. Nuke down the 2 Kor'thik Reavers within 10 seconds of each other and then kill the boss to gain this achievement",
                    enabled = true,
                    track = function() core._1009:GrandEmpressShekzeer() end,
                    partial = false,
                    encounterID = 1501,
                },
            },

            [1008] = { --Mogu'shan Vaults
                name = 317,
                boss1 = {
                    name = 679, --The Stone Guard
                    bossIDs = {},
                    achievement = 6823,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement every player must have a canine companion pet summoned. The following pets definately work with the achievement: " .. GetSpellLink(70613) .. " " .. GetSpellLink(69452) .. " " .. GetSpellLink(90637),
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1395,
                },
                boss2 = {
                    name = 689, --Feng the Accursed
                    bossIDs = {60009},
                    achievement = 6674,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievment you need to reverse the following abilities: " .. GetSpellLink(116936) .. " " .. GetSpellLink(118307) .. " " .. GetSpellLink(118194) .. " " .. GetSpellLink(115730) .. " " .. GetSpellLink(116938) .. ". To reverse these abilities a tank spec'ed player need to pick up the " .. GetSpellLink(115911) .. " which is located to left of the boss. Phase 1: 95%; Epicenter is cast by boss; Lighting fists has to be reversed on a player who gets stunned by soaking the ability. Phase 2: 66%; Wildfire Spark is cast on a player. Phase 3: At 33%; Arcane Velocity is cast by boss; Arcane Resonance is cast on a player. Once all 5 abilities have been reversed you can kill boss. Note: if you do the instance on heroic difficulty the phases may be in a different order",
                    enabled = true,
                    track = function() core._1008:FengTheAccursed() end,
                    partial = false,
                    encounterID = 1390,
                },
                boss3 = {
                    name = 682, --Gara'jal the Spiritbinder
                    bossIDs = {},
                    achievement = 7056,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1434,
                },
                boss4 = {
                    name = 687, --The Spirit Kings
                    bossIDs = {},
                    achievement = 6687,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1436,
                },
                boss5 = {
                    name = 726, --Elegon
                    bossIDs = {60410},
                    achievement = 6686,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1008:Elegon() end,
                    partial = false,
                    encounterID = 1500,
                },
                boss6 = {
                    name = 677, --Will of the Emperor

                    bossIDs = {60400, 60399},
                    achievement = 6455,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1008:WillOfTheEmperor() end,
                    partial = false,
                    encounterID = 1407,
                },
            },
        },

        Dungeons = {
            [961] = { --Stormstout Brewery
                name = 302,
                boss1 = {
                    name = 668, --Ook-Ook
                    bossIDs = {56637},
                    achievement = 6089,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._961:OokOok() end,
                    partial = false,
                    encounterID = 1412,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6400,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = nil,
                    partial = false,
                },                
                boss3 = {
                    name = 669, --Hoptallus
                    bossIDs = {59426, 59460, 56718, 59459, 59461, 59551},
                    achievement = 6420,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._961:Hoptallus() end,
                    partial = false,
                    encounterID = 1413,
                },
                boss4 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6402,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [1001] = { --Scarlet Halls
                name = 311,
                boss1 = {
                    name = 660, --Houndmaster Braun
                    bossIDs = {58876, 58674, 59309},
                    achievement = 6684,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core.ScarletHalls:HoundmasterBraun() end,
                    partial = true,
                    encounterID = 1422,
                },
                boss2 = {
                    name = 654, --Armsmaster Harlan
                    bossIDs = {58632},
                    achievement = 6427,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core.ScarletHalls:ArmsmasterHarlan() end,
                    partial = false,
                    encounterID = 1421,
                },
            },

            [1004] = { --Scarlet Monastery
                name = 316,
                boss1 = {
                    name = 688, --Thalnos the Soulrender
                    bossIDs = {59789},
                    achievement = 6946,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1004:ThalnosTheSoulrender() end,
                    partial = false,
                    encounterID = 1423,
                },
                boss2 = {
                    name = 671, --Brother Korloff
                    bossIDs = {},
                    achievement = 6928,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1424,
                },
                boss3 = {
                    name = 674, --High Inquisitor Whitemane
                    bossIDs = {60040, 3977},
                    achievement = 6929,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1004:HighInquisitorWhitemane() end,
                    partial = false,
                    encounterID = 1425,
                },
            },

            [1007] = { --Scholomance
                name = 246,
                boss1 = {
                    name = 663, --Jandice Barov
                    bossIDs = {},
                    achievement = 6531,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1427,
                },
                boss2 = {
                    name = 665, --Rattlegore
                    bossIDs = {59153},
                    achievement = 6394,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1007:Rattlegore() end,
                    partial = false,
                    encounterID = 1428,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {59368},
                    achievement = 6396,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1007:Sanguinarian() end,
					partial = true,
                },
                boss4 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6821,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss5 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6715,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [960] = { --Temple of the Jade Serpent
                name = 313,
                boss1 = {
                    name = 672, --Wise Mari
                    bossIDs = {56448},
                    achievement = 6460,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._960:WiseMari() end,
                    partial = false,
                    encounterID = 1418,
                },
                boss2 = {
                    name = 335, --Sha of Doubt
                    bossIDs = {56439},
                    achievement = 6671,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._960:ShaOfDoubt() end,
                    partial = false,
                    encounterID = 1439,
                },
                boss3 = {
                    name = 335, --Sha of Doubt
                    bossIDs = {56439},
                    achievement = 6475,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._960:ShaOfDoubt2() end,
                    partial = false,
                    encounterID = 1439,
                },
            },

            [994] = { --Mogu'Shan Palace
                name = 321,
                boss1 = {
                    name = 690, --Gekkan
                    bossIDs = {},
                    achievement = 6478,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 698, --Xin the Weaponmaster
                    bossIDs = {61398},
                    achievement = 6736,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._994.XinTheWeaponmaster() end,
                    partial = false,
                    encounterID = 1441,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6713,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [959] = { --Shado Pan Monastery
                name = 312,
                boss1 = {
                    name = 657, --Master Snowdrift
                    bossIDs = {},
                    achievement = 6477,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1304,
                },
                boss2 = {
                    name = 685, --Sha of Violence
                    bossIDs = {56719},
                    achievement = 6472,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._959:ShaOfViolence() end,
                    partial = false,
                    encounterID = 1305,
                },
                boss3 = {
                    name = 686, --Taran Zhu
                    bossIDs = {56884},
                    achievement = 6471,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._959:TaranZhu() end,
                    partial = false,
                    encounterID = 1306,
                },
            },
    
            [1011] = { --Siege of Niuazao Temple
                name = 324,
                boss1 = {
                    name = 738, --Commander Vo'jak
                    bossIDs = {63106,61699,61670,61701,61634},
                    achievement = 6688,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1011:CommanderVojak() end,
                    partial = true,
                    encounterID = 1502,
                },
                boss2 = {
                    name = 692, --General Pa'valak
                    bossIDs = {61485},
                    achievement = 6485,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1011:GeneralPaValak() end,
                    partial = false,
                    encounterID = 1447,
                },
                boss3 = {
                    name = 727, --Wing Leader Ner'onok
                    bossIDs = {62205},
                    achievement = 6822,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._1011:WingLeaderNeronok() end,
                    partial = false,
                    encounterID = 1464,
                },
            },

            [962] = { --Gate of the Setting Sun
                name = 303,
                boss1 = {
                    name = 655, --Saboteur Kip'tilak
                    bossIDs = {56906},
                    achievement = 6479,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._962:SaboteurKiptilak() end,
                    partial = false,
                    encounterID = 1397,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6476,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 649, --Raigonn
                    bossIDs = {56877},
                    achievement = 6945,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._962:Raigonn() end,
                    partial = false,
                    encounterID = 1419,
                },
            },
        },
    },

    --Cataclysm
    [6] = {
        Raids = {
            [967] = { --Dragon Soul
                name = 187,
                boss1 = {
                    name = 311, --Morchok
                    bossIDs = {},
                    achievement = 6174,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1292,
                },
                boss2 = {
                    name = 324, --Warlord Zon'ozz
                    bossIDs = {55308},
                    achievement = 6128,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss but don’t kill him. When a purple ball spawns, run into it. Every time you run into the purple ball it will change direction. Run into the purple ball 10 times then nuke the boss. Try to aim the purple ball away from the boss so that it doesn’t get absorbed by the boss.",
                    enabled = true,
                    track = function() core._967:WarlordZonozz() end,
                    partial = false,
                    encounterID = 1294,
                },
                boss3 = {
                    name = 325, --Yor'sahj the Unsleeping
                    bossIDs = {55312},
                    achievement = 6129,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss but don’t kill him. Wait for the oozes around the edge of the room to reach the boss. Once all 4 colour combinations have reached the boss (Black & Yellow, Black & Blue, Red & Green & Purple & Yellow) you can kill him. This will take several ooze phases to get all the combinations. It doesn’t matter if the other oozes reach the boss that are not listed as a colour combination. Therefore, you can just AFK until the requirements of the achievement have been met.",
                    enabled = true,
                    track = function() core._967:YorsahjTheUnsleeping() end,
                    partial = false,
                    encounterID = 1295,
                },
                boss4 = {
                    name = 317, --Hagara the Stormbinder
                    bossIDs = {},
                    achievement = 6175,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1296,
                },
                boss5 = {
                    name = 331, --Ultraxion
                    bossIDs = {55294},
                    achievement = 6084,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._967:Ultraxion() end,
                    partial = false,
                    encounterID = 1297,
                },
                boss6 = {
                    name = 332, --Warmaster Blackhorn
                    bossIDs = {56598},
                    achievement = 6105,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For this achievement you will need a ranged dps ability. As soon as Twilight Assault Drakes spawn kill them as soon as they come in range. If you kill these drakes before they reach the ship, then you don’t have to worry about soaking any abilities. This is the only requirements to the achievement, any other damage to the ship such as Twilight Onslaught does not need to be absorbed.",
                    enabled = true,
                    track = function() core._967:Skyfire() end,
                    partial = false,
                    encounterID = 1298,
                },
                boss7 = {
                    name = 318, --Spine of Deathwing
                    bossIDs = {53879},
                    achievement = 6133,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._967:SpineOfDeathwing() end,
                    partial = false,
                    encounterID = 1291,
                },
                boss8 = {
                    name = 333, --Madness of Deathwing
                    bossIDs = {},
                    achievement = 6180,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1299,
                },
            },

            [669] = { --Blackwing Descent
                name = 73,
                boss1 = {
                    name = 170, --Magmaw
                    bossIDs = {41570},
                    achievement = 5306,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._669:Magmaw() end,
                    partial = false,
                    encounterID = 1024,
                },
                boss2 = {
                    name = 169, --Omnotron Defense System
                    bossIDs = {42178, 42179, 42180, 42166},
                    achievement = 5307,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._669:OminitronDefenseSystem() end,
                    partial = false,
                    encounterID = 1027,
                },
                boss3 = {
                    name = 173, --Maloriak
                    bossIDs = {41378},
                    achievement = 5310,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Damage the boss down to 25%. Be careful you don’t 1 shot the boss. Once 12 abbreviations have spawned AOE them down then kill boss. Make sure you don’t kill the boss before the adds have been AOE’d down.",
                    enabled = true,
                    track = function() core._669:Maloriak() end,
                    partial = false,
                    encounterID = 1025,
                },
                boss4 = {
                    name = 171, --Atramedes
                    bossIDs = {41442},
                    achievement = 5308,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1022,
                },
                boss5 = {
                    name = 172, --Chimaeron
                    bossIDs = {43296},
                    achievement = 5309,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._669:Chimaeron() end,
                    partial = false,
                    encounterID = 1023,
                },
                boss6 = {
                    name = 174, --Nefarian
                    bossIDs = {41270, 41376},
                    achievement = 4849,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._669:Nefarian() end,
                    partial = false,
                    encounterID = 1026,
                },
            },

            [671] = { --Bastion of Twilight
                name = 72,
                boss1 = {
                    name = 156, --Halfus Wyrmbreaker
                    bossIDs = {44600},
                    achievement = 5300,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss but kill him. Free 2 of the dragons around the room by interacting with them. The whelps count as 1 dragon as well. Kill the 2 dragons within 10 seconds of one another then kill the boss.",
                    enabled = true,
                    track = function() core._671:HalfusWyrmbreaker() end,
                    partial = false,
                    encounterID = 1030,
                },
                boss2 = {
                    name = 157, --Valiona And Theralion
                    bossIDs = {45992},
                    achievement = 4852,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull then bosses but don’t kill them. Wait for the spell Dazzling Destruction to cast. Once the boss has cast the spell stand in the pool that was created by the spell so that you get transferred to the shadow realm. Once you are in the shadow realm, kill 6 Twilight Fiends. Once the requirements have been met you can kill boss.",
                    enabled = true,
                    track = function() core._671_ValionaAndTheralion() end,
                    partial = false,
                    encounterID = 1032,
                },
                boss3 = {
                    name = 158, --Ascendant Council
                    bossIDs = {},
                    achievement = 5311,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1028,
                },
                boss4 = {
                    name = 167, --Cho'gall
                    bossIDs = {43324},
                    achievement = 5312,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke boss down.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1029,
                },
            },

            [754] = { --Throne of the Four Winds
                name = 74,
                boss1 = {
                    name = 154, --Conclave of Wind
                    bossIDs = {},
                    achievement = 5304,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1035,
                },
                boss2 = {
                    name = 155, --Al'Akir
                    bossIDs = {},
                    achievement = 5305,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1034,
                },
            },

            [720] = { --Firelands
                name = 78,
                boss1 = {
                    name = 192, --Beth'tilac
                    bossIDs = {52498},
                    achievement = 5821,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke down the boss.",
                    enabled = true,
                    track = function() core._720:Bethtilac() end,
                    partial = false,
                    encounterID = 1197,
                },
                boss2 = {
                    name = 193, --Lord Rhyolith
                    bossIDs = {52558},
                    achievement = 5810,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Single target dps down the right leg. Do not touch the left leg.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1204,
                },
                boss3 = {
                    name = 194, --Alysrazor
                    bossIDs = {52530},
                    achievement = 5813,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke down the boss.",
                    enabled = true,
                    track = function() core._720:Alysrazor() end,
                    partial = false,
                    encounterID = 1206,
                },
                boss4 = {
                    name = 195, --Shannox
                    bossIDs = {},
                    achievement = 5829,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1205,
                },
                boss5 = {
                    name = 196, --Baleroc
                    bossIDs = {53494},
                    achievement = 5830,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke down the boss.",
                    enabled = true,
                    track = function() core._720:Baleroc() end,
                    partial = false,
                    encounterID = 1200,
                },
                boss6 = {
                    name = 197, --Majordomo Staghelm
                    bossIDs = {},
                    achievement = 5799,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1185,
                },
                boss7 = {
                    name = 198, --Ragnaros
                    bossIDs = {52409},
                    achievement = 5855,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._720:Ragnaros() end,
                    partial = false,
                    encounterID = 1203,
                },
            },
        },

        Dungeons = {
            [645] = { --Blackrock Caverns
                name = 66,
                boss1 = {
                    name = 105, --Rom'ogg Bonecrusher
                    bossIDs = {39665},
                    achievement = 5281,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._645:RomoggBonecrusher() end,
                    partial = false,
                    encounterID = 1040,
                }, 
                boss2 = { 
                    name = 106, --Corla
                    bossIDs = {39679},
                    achievement = 5282,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "After pulling the boss wait for the three zealots evolve. This is done by not standing in the way of the beams being channelled to the mobs. Once they have all evolved you can nuke the boss.",
                    enabled = true,
                    track = function() core._645:Corla() end,
                    partial = false,
                    encounterID = 1038,
                },  
                boss3 = {
                    name = 107, --Karsh Steelbender
                    bossIDs = {39698},
                    achievement = 5283,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss into the fire in the middle of the room until he reaches 15 stacks of Superheated Quicksilver Armor. Once he has 15 stacks you can nuke the boss.",
                    enabled = true,
                    track = function() core._645:KarshSteelbender() end,
                    partial = false,
                    encounterID = 1039,
                },  
                boss4 = {
                    name = 109, --Ascendant Lord Obsidius
                    bossIDs = {39705},
                    achievement = 5284,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss",
                    enabled = true,
                    track = function() core._645:AscendantLordObsidius() end,
                    partial = false,
                    encounterID = 1036,
                },                 
            },

            [643] = {  --Throne of the Tides
                name = 65,
                boss1 = {
                    name = 101, --Lady Naz'Jar
                    bossIDs = {40586},
                    achievement = 5285,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Damage the boss down to about 40% health. Be careful that you don’t 1 shot the boss. When the boss transitions to the next phase, kill the 2 caster adds but keep the melee add up. Once the geyser spawns drag the remaining add into the geyser until it gets killed. This may have to done multiple times. Once the add has been killed by the geyser, you can kill the boss.",
                    enabled = true,
                    track = function() core._643:LadyNazjar() end,
                    partial = false,
                    encounterID = 1045,
                },
                boss2 = {
                    name = 104, --Ozumat
                    bossIDs = {44658, 44715, 44648},
                    achievement = 5286,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._643:Ozumat() end,
                    partial = false,
                    encounterID = 1047,
                },                  
            },

            [725] = { --The Stonecore
                name = 67,
                boss1 = {
                    name = 113, --High Priestess Azil
                    bossIDs = {42333},
                    achievement = 5287,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core.__725:HighPriestessAzil() end,
                    partial = false,
                    encounterID = 1057,
                },               
            },

            [657] = { --The Vortext Pinnacle
                name = 68,
                boss1 = {
                    name = 116, --Asaad
                    bossIDs = {43875},
                    achievement = 5288,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._657:Asaad() end,
                    partial = false,
                    encounterID = 1042,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 5289,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },                
            },

            [670] = { --Grim Batol
                name = 71,
                boss1 = {
                    name = 131, --General Umbriss
                    bossIDs = {39625},
                    achievement = 5297,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for a Malignant Trogg to spawn. Kill the Malignant Trogg next to the boss. Once the boss has got the Modgud's Malice from the killed add then you can kill the boss.",
                    enabled = true,
                    track = function() core._670:GeneralUmbriss() end,
                    partial = false,
                    encounterID = 1051,
                },
                boss2 = {
                    name = 134, --Erudax
                    bossIDs = {40484},
                    achievement = 5298,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._670:Erudax() end,
                    partial = false,
                    encounterID = 1049,
                },               
            },

            [644] = { --Halls of Origination
                name = 70,
                boss1 = {
                    name = 124, --Temple Guardian Anhuur
                    bossIDs = {39425},
                    achievement = 5293,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._644:TempleGuardianAnhuur() end,
                    partial = false,
                    encounterID = 1080,
                },
                boss2 = {
                    name = 125, --Earthrager Ptah
                    bossIDs = {39428},
                    achievement = 5294,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Mount one of the camels to the left or right of the boss before going up the steps. Once you have mounted a camel, just nuke down the boss.",
                    enabled = true,
                    track = function() core._644:EarthragerPtah() end,
                    partial = false,
                    encounterID = 1076,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 5296,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just complete the encounter as usual.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss4 = {
                    name = 130, --Rajh
                    bossIDs = {39378},
                    achievement = 5295,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._644:Rajh() end,
                    partial = false,
                    encounterID = 1078,
                },           
            },

            [755] = { --Lost City of the Tol'Vir
                name = 69,
                boss1 = {
                    name = 118, --Lockmaw
                    bossIDs = {43614},
                    achievement = 5291,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss and wait for 20 Frenzied Crocolisk to spawn. Once they have spawned nuke them down within 10 seconds. Make sure you don’t kill the boss before nuking down the adds.",
                    enabled = true,
                    track = function() core._755:Lockmaw() end,
                    partial = false,
                    encounterID = 1054,
                },  
                boss2 = {
                    name = 119, --High Prophet Barim
                    bossIDs = {43612},
                    achievement = 5290,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._755:HighProphetBarim() end,
                    partial = false,
                    encounterID = 1053,
                },  
                boss3 = {
                    name = 122, --Siamat
                    bossIDs = {44819},
                    achievement = 5292,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._755:Siamat() end,
                    partial = false,
                    encounterID = 1055,
                },           
            },

            [36] = { --Deadmines
                name = 63,
                boss1 = {
                    name = 89, --Glubtok
                    bossIDs = {47162},
                    achievement = 5366,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._36:Glubtok() end,
                    partial = false,
                    encounterID = 1064,
                },
                boss2 = {
                    name = 90, --Helix Gearbreaker
                    bossIDs = {47296},
                    achievement = 5367,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss and wait for him to pick you up and charge down the room. Once he has done this Mine Rats will spawn around the room. After you have killed 20 Mine Rats you can kill the boss. The boss will have to do multiple charges so that enough Mine Rats to spawn.",
                    enabled = true,
                    track = function() core._36:HelixGearbreaker() end,
                    partial = false,
                    encounterID = 1065,
                },  
                boss3 = {
                    name = 91, --Foe Reaper 5000
                    bossIDs = {},
                    achievement = 5368,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110 you can leave the Prototype Reaper alone and just nuke down the boss.",
                    enabled = false,
                    track = nil,
                    partial = true,
                    encounterID = 1063,
                },  
                boss4 = {
                    name = 92, --Admiral Ripsnarl
                    bossIDs = {47626},
                    achievement = 5369,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Damage Ripsnarl until he enters the vapour phase. Be careful that you don’t one shot the boss. Once he enters the vapour phase, wait until 3 Freezing Vapors cast Coalesce before killing boss.",
                    enabled = true,
                    track = function() core._36:AdmiralRipsnarl() end,
                    partial = false,
                    encounterID = 1062,
                },  
                boss5 = {
                    name = 93, --'Captain' Cookie
                    bossIDs = {47739},
                    achievement = 5370,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, Wait for the boss to enter the pot and attempt to cast Throw Food before killing the boss. If you kill the boss before this has happened, the achievement will not get rewarded.",
                    enabled = true,
                    track = function() core._36:CaptainCookie() end,
                    partial = false,
                    encounterID = 1060,
                },  
                boss6 = {
                    name = 95, --Vanessa VanCleef
                    bossIDs = {49541},
                    achievement = 5371,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just complete the encounter as quick as possible.",
                    enabled = true,
                    track = function() core._36:VanessaVanCleef() end,
                    partial = false,
                    encounterID = 1081,
                },            
            },

            [33] = { --Shadowfang Keep
                name = 64,
                boss1 = {
                    name = 96, --Baron Ashbury
                    bossIDs = {46962},
                    achievement = 5503,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._33:BaronAshbury() end,
                    partial = false,
                    encounterID = 1069,
                },
                boss2 = {
                    name = 98, --Commander Springvale
                    bossIDs = {4278},
                    achievement = 5504,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._33:CommanderSpringvale() end,
                    partial = false,
                    encounterID = 1071,
                },            
                boss3 = {
                    name = 100, --Lord Godfrey
                    bossIDs = {46964},
                    achievement = 5505,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for the Bloodthirsty Ghouls to spawn. Place the boss in front of the Bloodthirsty Ghouls and wait for the boss to kill the Bloodthirsty Ghouls with his Pistol Barrage ability. Once 12 Ghouls have been killed, you can nuke the boss.",
                    enabled = true,
                    track = function() core._33:LordGodfrey() end,
                    partial = false,
                    encounterID = 1072,
                },   
            },

            [859] = { --Zul'Gurub
                name = 76,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 5744,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 175, --High Priest Venoxis
                    bossIDs = {52155},
                    achievement = 5743,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss and wait for him to turn into the snake. While waiting make sure you avoid green stuff on the floor. Once the boss has turned into a snake you can kill him.",
                    enabled = true,
                    track = function() core._859:HighPriestVenoxis() end,
                    partial = false,
                    encounterID = 1178,
                },
                boss3 = {
                    name = 176, --Bloodlord Mandokir
                    bossIDs = {52151},
                    achievement = 5762,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = true,
                    track = function() core._859:BloodlordMandokir() end,
                    partial = false,
                    encounterID = 1179,
                },
                boss4 = {
                    name = 181, --High Priestess Kilnara
                    bossIDs = {52059},
                    achievement = 5765,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._859:HighPriestessKilnara() end,
                    partial = false,
                    encounterID = 1180,
                },
                boss5 = {
                    name = 185, --Jin'do
                    bossIDs = {52148, 52624},
                    achievement = 5759,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Damage the boss down to below 70% health. Wait for 20 Twisted Spirts to spawn then nuke them down. Once you have killed 20 Twisted spirits in 15 seconds you can kill boss.",
                    enabled = true,
                    track = function() core._859:Jindo() end,
                    partial = false,
                    encounterID = 1182,
                },
            },

            [568] = { --Zul'Aman
                name = 77,
                boss1 = {
                    name = 189, --Halazzi
                    bossIDs = {23577},
                    achievement = 5750,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._568:Halazzi() end,
                    partial = false,
                    encounterID = 1192,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 5761,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 5858,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss4 = {
                    name = 191, --Daakara
                    bossIDs = {},
                    achievement = 5760,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down while in the rectangular turquoise stonework.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1194,
                },
            },

            [938] = { --End Time
                name = 184,
                boss1 = {
                    name = 283, --Echo of Tyrande
                    bossIDs = {},
                    achievement = 5995,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, run the gauntlet without any player in healing spec. This way you don’t need to worry about a healer taking any damage.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1884,
                },
                boss2 = {
                    name = 323, --Echo of Sylvanas
                    bossIDs = {54123},
                    achievement = 6130,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for the Risen Ghouls to spawn. Once the Risen Ghouls have spawned, kill two of them then kill boss.",
                    enabled = true,
                    track = function() core._938:EchoOfSylvanas() end,
                    partial = false,
                    encounterID = 1882,
                },
            },

            [939] = { --Well of Eternity
                name = 185,
                boss1 = {
                    name = 290, --Peroth'arn
                    bossIDs = {55085},
                    achievement = 6127,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._939:Perotharn() end,
                    partial = false,
                    encounterID = 1272,
                },
                boss2 = {
                    name = 292, --Mannoroth
                    bossIDs = {54969, 55419},
                    achievement = 6070,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._939:Mannoroth() end,
                    partial = false,
                    encounterID = 1274,
                },
            },

            [940] = { --Hour of Twilight
                name = 186,
                boss1 = {
                    name = 341, --Archbishop Benedictus
                    bossIDs = {54938},
                    achievement = 6132,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Get the boss health down to 50%. Be careful that you don’t 1 shot the boss. Once the boss has entered his shadow form, run round the edges of the room and kill 10 Twilight Sparks. Once 10 Twilight Sparks have been killed, you can kill the boss.",
                    enabled = true,
                    track = function() core._940:ArchbishopBenedictus() end,
                    partial = false,
                    encounterID = 1339,
                },
            },
        },
    },

    --Wrath of the Lich King
    [7] = {
        Raids = {
            ["615-10"] = { --Obsidian Sanctum 10 Man
                name = 755,
                boss1 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 624,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss with less than 9 players in the group.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },
                boss2 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2047,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },  
                boss3 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2049,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },  
                boss4 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2050,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },  
                boss5 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2051,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },                               
            },

            ["615-25"] = { --Obsidian Sanctum 25 Man
                name = 755,
                boss1 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 1877,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss with less than 21 players in the group.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },
                boss2 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2048,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },  
                boss3 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2052,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },  
                boss4 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2053,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },  
                boss5 = {
                    name = 1616, --Sartharion the Onyx Guardian
                    bossIDs = {},
                    achievement = 2054,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1090,
                },                               
            },

            ["616-10"] = { --Eye of Eternity 10 Man
                name = 756,
                boss1 = {
                    name = 1617, --Malygos
                    bossIDs = {28859},
                    achievement = 1874,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._616:YouDontHaveAnEternity() end,
                    partial = false,
                    encounterID = 1094,
                },
                boss2 = {
                    name = 1617, --Malygos
                    bossIDs = {28859},
                    achievement = 1869,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss with fewer than the 9 players in the group.",
                    enabled = true,
                    track = function() core._616:APokeInTheEye() end,
                    partial = false,
                    encounterID = 1094,
                }, 
                boss3 = {
                    name = 1617, --Malygos
                    bossIDs = {28859},
                    achievement = 2148,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "DPS the boss down below 50% health so that he enters phase 2. Once the boss has entered phase 2 kill one of the Nexus Lord then mount the disc the mob was on. Once you are riding on a disk you can kill a scion of eternity to complete the achievement.",
                    enabled = true,
                    track = function() core._616:DenyinTheScion() end,
                    partial = false,
                    encounterID = 1094,
                },                             
            },

            ["616-25"] = { --Eye of Eternity 25 Man
                name = 756,
                boss1 = {
                    name = 1617, --Malygos
                    bossIDs = {28859},
                    achievement = 1875,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._616:YouDontHaveAnEternity() end,
                    partial = false,
                    encounterID = 1094,
                },
                boss2 = {
                    name = 1617, --Malygos
                    bossIDs = {28859},
                    achievement = 1870,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss with fewer than the 21 players in the group.",
                    enabled = true,
                    track = function() core._616:APokeInTheEye() end,
                    partial = false,
                    encounterID = 1094,
                }, 
                boss3 = {
                    name = 1617, --Malygos
                    bossIDs = {28859},
                    achievement = 2149,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "DPS the boss down below 50% health so that he enters phase 2. Once the boss has entered phase 2 kill one of the Nexus Lord then mount the disc the mob was on. Once you are riding on a disk you can kill a scion of eternity to complete the achievement.",
                    enabled = true,
                    track = function() core._616:DenyinTheScion() end,
                    partial = false,
                    encounterID = 1094,
                },                             
            },

            ["249-10"] = { --Onyxia's Lair 10 Man
                name = 760,
                boss1 = {
                    name = 1651, --Onyxia
                    bossIDs = {10184},
                    achievement = 4402,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._249:Onyxia2() end,
                    partial = false,
                    encounterID = 1084,
                },
                boss2 = {
                    name = 1651, --Onyxia
                    bossIDs = {},
                    achievement = 4403,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1084,
                },
                boss3 = {
                    name = 1651, --Onyxia
                    bossIDs = {10184},
                    achievement = 4404,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._249:Onyxia1() end,
                    partial = false,
                    encounterID = 1084,
                },                          
            },

            ["249-25"] = { --Onyxia's Lair 25 Man
                name = 760,
                boss1 = {
                    name = 1651, --Onyxia
                    bossIDs = {10184},
                    achievement = 4405,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._249:Onyxia2() end,
                    partial = false,
                    encounterID = 1084,
                },
                boss2 = {
                    name = 1651, --Onyxia
                    bossIDs = {}, 
                    achievement = 4406,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1084,
                },
                boss3 = {
                    name = 1651, --Onyxia
                    bossIDs = {10184},
                    achievement = 4407,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._249:Onyxia1() end,
                    partial = false,
                    encounterID = 1084,
                },                          
            },

            ["649-10"] = { --Trial of the Crusader 10 Man
                name = 757,
                boss1 = {
                    name = 1618, --Icehowl
                    bossIDs = {34796},
                    achievement = 3797,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down. Make sure you don’t kill the Snobolds that fall of Gormok back after killing him.",
                    enabled = true,
                    track = function() core._649:UpperBackPain() end,
                    partial = false,
                    encounterID = 1088,
                },
                boss2 = {
                    name = 1618, --Acidmaw and Dreadscale
                    bossIDs = {34796,35144,34799},
                    achievement = 3936,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, nuke down boss bosses within 10 seconds of each other.",
                    enabled = true,
                    track = function() core._649:NotOneButTwoJormungars() end,
                    partial = false,
                    encounterID = 1088,
                }, 
                boss3 = {
                    name = 1619, --Lord Jaraxxus
                    bossIDs = {34780},
                    achievement = 3996,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, pull the boss then wait for two Mistresses of Pain to spawn. Once they have spawned, single target down the boss.",
                    enabled = true,
                    track = function() core._649:ThreeSixtyPainSpike() end,
                    partial = false,
                    encounterID = 1087,
                }, 
                boss4 = {
                    name = 1621, --Faction Champions
                    bossIDs = {34461,34460,34469,34467,34468,34465,34471,34466,34473,34472,34463,34470,34474,34475,34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34450,34453},
                    achievement = 3798,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, nuke down all the enemy heroes within 60 seconds of one another.",
                    enabled = true,
                    track = function() core._649:FactionChampions() end,
                    partial = false,
                    encounterID = 1086,
                }, 
                boss5 = {
                    name = 1622, --Twin Val'kyr
                    bossIDs = {34497,34496},
                    achievement = 3799,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just simply nuke down one of the bosses since they share the same health pool.",
                    enabled = true,
                    track = function() core._649:TwinValkyr() end,
                    partial = false,
                    encounterID = 1089,
                }, 
                boss6 = {
                    name = 1623, --Anub'arak
                    bossIDs = {34564},
                    achievement = 3800,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for 25 Swarm Scarabs to spawn. Once enough adds have spawned. AOE them down. Be careful you don’t kill the boss first.",
                    enabled = true,
                    track = function() core._649:Anubarak() end,
                    partial = false,
                    encounterID = 1085,
                },                     
            },

            ["649-25"] = { --Trial of the Crusader 25 Man
                name = 757,
                boss1 = {
                    name = 1618, --Icehowl
                    bossIDs = {34796},
                    achievement = 3813,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down. Make sure you don’t kill the Snobolds that fall of Gormok back after killing him.",
                    enabled = true,
                    track = function() core._649:UpperBackPain() end,
                    partial = false,
                    encounterID = 1088,
                },
                boss2 = {
                    name = 1618, --Acidmaw and Dreadscale
                    bossIDs = {34796,35144,34799},
                    achievement = 3937,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, nuke down boss bosses within 10 seconds of each other.",
                    enabled = true,
                    track = function() core._649:NotOneButTwoJormungars() end,
                    partial = false,
                    encounterID = 1088,
                }, 
                boss3 = {
                    name = 1619, --Lord Jaraxxus
                    bossIDs = {34780},
                    achievement = 3997,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, pull the boss then wait for two Mistresses of Pain to spawn. Once they have spawned, single target down the boss.",
                    enabled = true,
                    track = function() core._649:ThreeSixtyPainSpike() end,
                    partial = false,
                    encounterID = 1087,
                }, 
                boss4 = {
                    name = 1622, --Twin Val'kyr
                    bossIDs = {34497,34496},
                    achievement = 3815,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just simply nuke down one of the bosses since they share the same health pool.",
                    enabled = true,
                    track = function() core._649:TwinValkyr() end,
                    partial = false,
                    encounterID = 1089,
                }, 
                boss5 = {
                    name = 1623, --Anub'arak
                    bossIDs = {34564},
                    achievement = 3816,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for 25 Swarm Scarabs to spawn. Once enough adds have spawned. AOE them down. Be careful you don’t kill the boss first.",
                    enabled = true,
                    track = function() core._649:Anubarak() end,
                    partial = false,
                    encounterID = 1085,
                },                     
            },

            ["624-10"] = { --Vault of Archavon 10 Man
                name = 753,
                boss1 = {
                    name = 1597, --Archavon & Emalon & Koralon
                    bossIDs = {},
                    achievement = 4016,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1126,
                },                   
            },

            ["624-25"] = { --Vault of Archavon 25 Man
                name = 753,
                boss1 = {
                    name = 1597, --Archavon & Emalon & Koralon
                    bossIDs = {},
                    achievement = 4017,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1126,
                },                   
            },

            [603] = { --Ulduar
                name = 759,
                boss1 = {
                    name = "Other 23",
                    bossIDs = {33572},
                    achievement = 12312,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, this achievement is a lot easier to complete without a vehicle. Just run up between 2 of the pillars towards the boss. Wait for 100 adds to attack you then just AOE all the adds down.",
                    enabled = true,
                    track = function() core._603:Dwarfageddon() end,
                    partial = true,
                },
                boss2 = {
                    name = "Other 24",
                    bossIDs = {},
                    achievement = 12313,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss without going over any of the repair pads located at the entrance to the boss room on the right and right.",
                    enabled = true,
                    track = function() end,
					partial = false,
                }, 
                boss3 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {},
                    achievement = 12314,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement will take 3 runs to complete since you will need to mount a different vehicle each time.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss4 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {33113},
                    achievement = 12315,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement requires at least 2 players. The player not going for the achievement needs to drive a demolisher and the player going for the achievements needs to be the passenger of the demolisher. Once you have pulled the boss, load the passenger into the catapult and throw them at the turrets on the boss. Once the player is up on the boss, they need to kill the turret to gain the achievement.",
                    enabled = true,
                    track = function() core._603:FlameLeviathanTakeOutThoseTurrets() end,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss5 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {33113},
                    achievement = 12316,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:FlameLeviathanShutout() end,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss6 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {},
                    achievement = 12317,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least one tower is kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss7 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {},
                    achievement = 12318,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least two towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss8 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {},
                    achievement = 12319,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least three towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss9 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {},
                    achievement = 12320,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if all four towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1132,
                }, 
                boss10 = {
                    name = 1639, --Razorscale
                    bossIDs = {33186},
                    achievement = 12321,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:RazorscaleAQuickShave() end,
                    partial = false,
                    encounterID = 1139,
                }, 
                boss11 = {
                    name = 1639, --Razorscale
                    bossIDs = {33186},
                    achievement = 12322,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Wait for 25 Dark Rune Guardian Dwarves to spawn then use the harpoons to pull Razorscale down. Once Razorscale is down dps the boss down to below 50% so the boss is permanently grounded. Be careful you don’t one shot the boss. Once the boss is grounded, place the Dark Rune Guardians in front of the boss until they are killed by Razorscale breath ability.",
                    enabled = true,
                    track = function() core._603:RazorscaleIronDwarfMediumRare() end,
                    partial = false,
                    encounterID = 1139,
                }, 
                boss12 = {
                    name = 1638, --Ignis the Furnace Master
                    bossIDs = {33118},
                    achievement = 12323,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for 2 Iron Constructs to spawn. Place the 2 Iron Constructs in the fire on the ground until they gain 10 stacks of the Heat Buff. Next drag the 2 Iron Constructs into the water so they turn to stone. Finally nuke down the 2 adds within 5 seconds of one another. Once both adds have died you can kill boss.",
                    enabled = true,
                    track = function() core._603:IgnisTheFurnaceMasterShattered() end,
                    partial = false,
                    encounterID = 1136,
                }, 
                boss13 = {
                    name = 1638, --Ignis the Furnace Master
                    bossIDs = {},
                    achievement = 12324,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement requires 2 players or a player with a pet class. The boss will randomly pick players to enter the pot that do not have aggro of the boss. Just pull the boss and wait till everyone gets thrown into the pot.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1136,
                }, 
                boss14 = {
                    name = 1638, --Ignis the Furnace Master
                    bossIDs = {33118},
                    achievement = 12325,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:IgnisTheFurnaceMasterStokinTheFurnace() end,
                    partial = false,
                    encounterID = 1136,
                }, 
                boss15 = {
                    name = 1640, --XT-002 Deconstructor
                    bossIDs = {33293},
                    achievement = 12326,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:XT002DeconstructorNerfEngineering() end,
                    partial = false,
                    encounterID = 1142,
                }, 
                boss16 = {
                    name = 1640, --XT-002 Deconstructor
                    bossIDs = {33293},
                    achievement = 12327,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._603:XT002DeconstructorNerfScrapbots() end,
                    partial = false,
                    encounterID = 1142,
                }, 
                boss17 = {
                    name = 1640, --XT-002 Deconstructor
                    bossIDs = {33293},
                    achievement = 12328,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:XT002DeconstructorNerfGravityBombs() end,
                    partial = false,
                    encounterID = 1142,
                }, 
                boss18 = {
                    name = 1640, --XT-002 Deconstructor
                    bossIDs = {33293},
                    achievement = 12329,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:XT002DeconstructorMustDeconstructFaster() end,
                    partial = false,
                    encounterID = 1142,
                }, 
                boss19 = {
                    name = 1640, --XT-002 Deconstructor
                    bossIDs = {33293},
                    achievement = 12330,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss and dps down until you reach 75%, 50% or 25% to start the heart phase. Careful you don’t one shot the boss. Once the heart is exposed nuke it down then kill the boss.",
                    enabled = true,
                    track = function() core._603:XT002DeconstructorHeartbreaker() end,
                    partial = false,
                    encounterID = 1142,
                }, 
                boss20 = {
                    name = 1641, --Assembly of Iron
                    bossIDs = {32867,32927,32857},
                    achievement = 12332,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just kill Runemaster Molgeim last.",
                    enabled = true,
                    track = function() core._603:AssemblyOfIronIChooseYouRunemasterMolgeim() end,
                    partial = false,
                    encounterID = 1140,
                }, 
                boss21 = {
                    name = 1641, --Assembly of Iron
                    bossIDs = {32867,32927,32857},
                    achievement = 12333,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just kill Stormcaller Brundir last.",
                    enabled = true,
                    track = function() core._603:AssemblyOfIronIChooseYouStormcallerBrundir() end,
                    partial = false,
                    encounterID = 1140,
                }, 
                boss22 = {
                    name = 1641, --Assembly of Iron
                    bossIDs = {32867,32927,32857},
                    achievement = 12334,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just kill Steelbreaker last.",
                    enabled = true,
                    track = function() core._603:AssemblyOfIronIChooseYouSteelbreaker() end,
                    partial = false,
                    encounterID = 1140,
                }, 
                boss23 = {
                    name = 1641, --Assembly of Iron
                    bossIDs = {},
                    achievement = 12335,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, use the Iron Boot Flask toy then nuke down the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1140,
                }, 
                boss24 = {
                    name = 1641, --Assembly of Iron
                    bossIDs = {32867,32927,32857},
                    achievement = 12336,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "After pulling the boss you must interrupt the first cast of Chain Lightning from Stormcaller Brundir before killing him. Once you have interrupted the spell, nuke down Stormcaller Brundir and then kill the other two bosses.",
                    enabled = true,
                    track = function() core._603:AssemblyOfIronCantDoThatWhileStunned() end,
                    partial = false,
                    encounterID = 1140,
                }, 
                boss25 = {
                    name = 1642, --Kologarn
                    bossIDs = {32930,32934,32933},
                    achievement = 12337,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just single target down the boss without killing the arms.",
                    enabled = true,
                    track = function() core._603:KologarnWithOpenArms() end,
                    partial = false,
                    encounterID = 1137,
                }, 
                boss26 = {
                    name = 1642, --Kologarn
                    bossIDs = {},
                    achievement = 12338,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, single target down the two arms then kill the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1137,
                }, 
                boss27 = {
                    name = 1642, --Kologarn
                    bossIDs = {32930,32934,32933},
                    achievement = 12339,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:KologarnIfLooksCouldKill() end,
                    partial = false,
                    encounterID = 1137,
                }, 
                boss28 = {
                    name = 1642, --Kologarn
                    bossIDs = {32930,32934,32933},
                    achievement = 12340,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "After pulling the boss kill the arms until 25 Rubble has spawned. Don’t damage the boss since killing the arms already does a lot of damage to the boss.",
                    enabled = true,
                    track = function() core._603:KologarnRubbleAndRoll() end,
                    partial = false,
                    encounterID = 1137,
                }, 
                boss29 = {
                    name = 1643, --Auriaya
                    bossIDs = {33515, 34014},
                    achievement = 12341,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just single target down the boss.",
                    enabled = true,
                    track = function() core._603:AuriayaCrazyCatLady() end,
                    partial = false,
                    encounterID = 1131,
                }, 
                boss30 = {
                    name = 1643, --Auriaya
                    bossIDs = {33515, 34014},
                    achievement = 12342,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "After pulling the boss wait for the Feral Defender to spawn. Once the Feral Defender has spawned kill him. He will then respawn after a short amount of time. Once the Feral Defender has been killed 9 times you can kill the boss.",
                    enabled = true,
                    track = function() core._603:AuriayaNineLives() end,
                    partial = false,
                    encounterID = 1131,
                }, 
                boss31 = {
                    name = 1644, --Hodir
                    bossIDs = {32845},
                    achievement = 12343,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = true,
                    track = function() core._603:HodirCheeseTheFreeze() end,
                    partial = false,
                    encounterID = 1135,
                }, 
                boss32 = {
                    name = 1644, --Hodir
                    bossIDs = {32845},
                    achievement = 12344,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, free the adds from the ice tombs then nuke down the boss.",
                    enabled = true,
                    track = function() core._603:HodirIHaveTheCoolestFriends() end,
                    partial = false,
                    encounterID = 1135,
                }, 
                boss33 = {
                    name = 1644, --Hodir
                    bossIDs = {32845},
                    achievement = 12345,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = true,
                    track = function() core._603:HodirGettingColdInHere() end,
                    partial = false,
                    encounterID = 1135,
                }, 
                boss34 = {
                    name = 1644, --Hodir
                    bossIDs = {32845},
                    achievement = 12347,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = true,
                    track = function() core._603:HodirICouldSayThatThisCacheWasRare() end,
                    partial = false,
                    encounterID = 1135,
                }, 
                boss35 = {
                    name = 1644, --Hodir
                    bossIDs = {},
                    achievement = 12346,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1135,
                }, 
                boss36 = {
                    name = 1645, --Thorim
                    bossIDs = {32865},
                    achievement = 12348,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = true,
                    track = function() core._603:ThorimDontStandInTheLightning() end,
                    partial = false,
                    encounterID = 1141,
                }, 
                boss37 = {
                    name = 1645, --Thorim
                    bossIDs = {},
                    achievement = 12349,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, complete the gauntlet part of the encounter to gain this achievement.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1141,
                }, 
                boss38 = {
                    name = 1645, --Thorim
                    bossIDs = {},
                    achievement = 12350,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1141,
                }, 
                boss39 = {
                    name = 1645, --Thorim
                    bossIDs = {},
                    achievement = 12351,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1141,
                }, 
                boss40 = {
                    name = 1645, --Thorim
                    bossIDs = {},
                    achievement = 12352,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke down the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1141,
                }, 
                boss41 = {
                    name = "Freya Mini Bosses",
                    bossIDs = {32914, 32913, 32915},
                    achievement = 12360,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull Elder Brightleaf, Elder Ironbranch and Elder Stonebark together in the Freya boss room and kill them within 15 seconds of one another.",
                    enabled = true,
                    track = function() core._603:FreyaLumberjacked() end,
                    partial = false,
                }, 
                boss42 = {
                    name = 1646, --Freya
                    bossIDs = {32906, 33430, 33431, 33528, 33527, 33526, 33525, 32914, 32913, 33354, 33355, 32915},
                    achievement = 12361,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For the achievement just kill the boss within 20 minutes of killing the first creature in the Freya boss room.",
                    enabled = true,
                    track = function() core._603:FreyaConSpeedAtory() end,
                    partial = false,
                    encounterID = 1133,
                }, 
                boss43 = {
                    name = 1646, --Freya
                    bossIDs = {32906},
                    achievement = 12362,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for 2 Ancient Water Spirits, 2 Storm Lashers and 2 Snaplashers to spawn. Once these have spawned aoe them down within 10 seconds of one another. Be careful that you don’t kill the boss first.",
                    enabled = true,
                    track = function() core._603:FreyaDeforestation() end,
                    partial = false,
                    encounterID = 1133,
                }, 
                boss44 = {
                    name = 1646, --Freya
                    bossIDs = {32906},
                    achievement = 12363,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:FreyaGettingBackToNature() end,
                    partial = false,
                    encounterID = 1133,
                }, 
                boss45 = {
                    name = 1646, --Freya
                    bossIDs = {},
                    achievement = 12364,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Defeat Freya leaving at least one of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1133,
                }, 
                boss46 = {
                    name = 1646, --Freya
                    bossIDs = {},
                    achievement = 12365,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Defeat Freya leaving at least two of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1133,
                }, 
                boss47 = {
                    name = 1646, --Freya
                    bossIDs = {},
                    achievement = 12366,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Defeat Freya leaving all three of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1133,
                }, 
                boss48 = {
                    name = 1647, --Mimiron
                    bossIDs = {33350, 33432},
                    achievement = 12367,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down. If a bomb bot spawns, make sure you kill it before it reaches you.",
                    enabled = true,
                    track = function() core._603:MimironSetUpUsTheBomb() end,
                    partial = false,
                    encounterID = 1138,
                }, 
                boss49 = {
                    name = 1647, --Mimiron
                    bossIDs = {33350, 33432},
                    achievement = 12368,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._603:MimironNotSoFriendlyFire() end,
                    partial = false,
                    encounterID = 1138,
                }, 
                boss50 = {
                    name = 1647, --Mimiron
                    bossIDs = {33350, 33432},
                    achievement = 12369,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Push the red button behind the boss to active hard mode to earn this achievement.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1138,
                }, 
                boss51 = {
                    name = 1648, --General Vezax
                    bossIDs = {33271},
                    achievement = 12372,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:Shadowdodger() end,
                    partial = false,
                    encounterID = 1134,
                }, 
                boss52 = {
                    name = 1648, --General Vezax
                    bossIDs = {33271},
                    achievement = 12373,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for the Saronite Animus to spawn. Once the Saronite Animus has spawned, kill it then kill the boss. The Saronite Animus takes about 5 minutes to spawn.",
                    enabled = true,
                    track = function() core._603:ILoveTheSmellOfSaroniteInTheMorning() end,
                    partial = false,
                    encounterID = 1134,
                }, 
                boss53 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {33134},
                    achievement = 12384,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "After bring Sara down to 0% at the start of phase one, she will turn angry. Use /kiss on her to complete this achievement at this point.",
                    enabled = true,
                    track = function() core._603:KissAndMakeUp() end,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss54 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {},
                    achievement = 12385,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down, provided you have not spoken to more than 3 keepers.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss55 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {},
                    achievement = 12386,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down, provided you have not spoken to more than 2 keepers.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss56 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {},
                    achievement = 12387,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down, provided you have not spoken to more than 1 keeper.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss57 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {},
                    achievement = 12388,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down, provided you have not spoken to any of the keepers.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss58 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {33134},
                    achievement = 12395,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:DriveMeCrazy() end,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss59 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {33134},
                    achievement = 12396,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._603:HesNotGettingAnyOlder() end,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss60 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {33134},
                    achievement = 12397,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "After starting the encounter, run into the clouds around the room to spawn Guardians of Yogg-Saron. Once 9 Guardians of Yogg-Saron have spawned, AOE then down within 12 seconds of one another. You can then kill the boss.",
                    enabled = true,
                    track = function() core._603:TheyreComingOutOfTheWalls() end,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss61 = {
                    name = 1649, --Yogg-Saron
                    bossIDs = {},
                    achievement = 12398,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement takes multiple runs to complete since it’s random which vision the boss will spawn. You can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1143,
                }, 
                boss62 = {
                    name = 1650, --Algalon the Observer
                    bossIDs = {},
                    achievement = 12400,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1130,
                },                    
            },

            ["533-10"] = { --Naxxramas 10 Man
                name = 754,
                boss1 = {
                    name = "Other 25",
                    bossIDs = {},
                    achievement = 578,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss with less than 9 players in the group.",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 1603, --Maexxna
                    bossIDs = {15956,15952},
                    achievement = 1858,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just nuke down the bosses in the Arachnid Quarter to gain this achievement.",
                    enabled = true,
                    track = function() core._533:Arachnophobia() end,
                    partial = false,
                    encounterID = 1116,
                },
                boss3 = {
                    name = 1610, --Patchwerk
                    bossIDs = {16028},
                    achievement = 1856,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._533:Patchwerk() end,
                    partial = false,
                    encounterID = 1118,
                },
                boss4 = {
                    name = 1605, --Heigan the Unclean
                    bossIDs = {15936},
                    achievement = 1996,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke the boss down.",
                    enabled = true,
                    track = function() core._533:HeiganTheUnclean() end,
                    partial = false,
                    encounterID = 1112,
                },
                boss5 = {
                    name = 1602, --Grand Widow Faerlina
                    bossIDs = {15953},
                    achievement = 1997,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke the boss down.",
                    enabled = true,
                    track = function() core._533:GrandWidowFaerlina() end,
                    partial = false,
                    encounterID = 1110,
                },
                boss6 = {
                    name = 1613, --Thaddius
                    bossIDs = {15928,15930,15929},
                    achievement = 2178,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._533:Shocking() end,
                    partial = false,
                    encounterID = 1120,
                },
                boss7 = {
                    name = 1613, --Thaddius
                    bossIDs = {15928,15930,15929},
                    achievement = 2180,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Just nuke the boss down with fewer than 9 players in the group.",
                    enabled = true,
                    track = function() core._533:Subtraction() end,
                    partial = false,
                    encounterID = 1120,
                },
                boss8 = {
                    name = 1606, --Loatheb
                    bossIDs = {16011},
                    achievement = 2182,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._533:Loatheb() end,
                    partial = false,
                    encounterID = 1115,
                },
                boss9 = {
                    name = 1609, --Four Horsemen
                    bossIDs = {16063,16064,16065,30549},
                    achievement = 2176,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill all 4 horsemen without 15 seconds of one another. After pulling the boss wait till they split before damaging them otherwise the encounter will reset if you one shot any of the horsemen.",
                    enabled = true,
                    track = function() core._533:FourHorsemen() end,
                    partial = false,
                    encounterID = 1121,
                },
                boss10 = {
                    name = 1614, --Sapphiron
                    bossIDs = {},
                    achievement = 2146,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1119,
                },
                boss11 = {
                    name = 1615, --Kel'Thuzad
                    bossIDs = {23562,23563,23561,16427,16429,16428},
                    achievement = 2184,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._533:KelThuzad() end,
                    partial = false,
                    encounterID = 1114,
                },                          
            },

            ["533-25"] = { --Naxxramas 25 Man
                name = 754,
                boss1 = {
                    name = "Other 26",
                    bossIDs = {},
                    achievement = 579,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill the boss with less than 21 players in the group.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1603, --Maexxna
                    bossIDs = {15956,15952},
                    achievement = 1859,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just nuke down the bosses in the Arachnid Quarter to gain this achievement.",
                    enabled = true,
                    track = function() core._533:Arachnophobia() end,
                    partial = false,
                    encounterID = 1116,
                },
                boss3 = {
                    name = 1610, --Patchwerk
                    bossIDs = {16028},
                    achievement = 1857,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._533:Patchwerk() end,
                    partial = false,
                    encounterID = 1118,
                },
                boss4 = {
                    name = 1605, --Heigan the Unclean
                    bossIDs = {15936},
                    achievement = 2139,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply nuke the boss down.",
                    enabled = true,
                    track = function() core._533:HeiganTheUnclean() end,
                    partial = false,
                    encounterID = 1112,
                },
                boss5 = {
                    name = 1602, --Grand Widow Faerlina
                    bossIDs = {15953},
                    achievement = 2140,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, single target the boss down without touching any of the adds.",
                    enabled = true,
                    track = function() core._533:GrandWidowFaerlina() end,
                    partial = false,
                    encounterID = 1110,
                },
                boss6 = {
                    name = 1613, --Thaddius
                    bossIDs = {15928,15930,15929},
                    achievement = 2179,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._533:Shocking() end,
                    partial = false,
                    encounterID = 1120,
                },
                boss7 = {
                    name = 1613, --Thaddius
                    bossIDs = {15928,15930,15929},
                    achievement = 2181,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Just nuke the boss down with fewer than 21 players in the group.",
                    enabled = true,
                    track = function() core._533:Subtraction() end,
                    partial = false,
                    encounterID = 1120,
                },
                boss8 = {
                    name = 1606, --Loatheb
                    bossIDs = {16011},
                    achievement = 2183,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._533:Loatheb() end,
                    partial = false,
                    encounterID = 1115,
                },
                boss9 = {
                    name = 1609, --Four Horsemen
                    bossIDs = {16063,16064,16065,30549},
                    achievement = 2177,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Kill all 4 horsemen without 15 seconds of one another. After pulling the boss wait till they split before damaging them otherwise the encounter will reset if you one shot any of the horsemen.",
                    enabled = true,
                    track = function() core._533:FourHorsemen() end,
                    partial = false,
                    encounterID = 1121,
                },
                boss10 = {
                    name = 1614, --Sapphiron
                    bossIDs = {},
                    achievement = 2147,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1119,
                },
                boss11 = {
                    name = 1615, --Kel'Thuzad
                    bossIDs = {23562,23563,23561,16427,16429,16428},
                    achievement = 2185,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._533:KelThuzad() end,
                    partial = false,
                    encounterID = 1114,
                },                          
            },

            ["631-10"] = { --Icecrown Citadel 10 Man
                name = 758,
                boss1 = {
                    name = 1624, --Lord Marrowgar
                    bossIDs = {36612},
                    achievement = 4534,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:LordMarrowgar() end,
                    partial = false,
                    encounterID = 1101,
                },
                boss2 = {
                    name = 1625, --Lady Deathwhisper
                    bossIDs = {36855},
                    achievement = 4535,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._631:LadyDeathwhisper() end,
                    partial = false,
                    encounterID = 1100,
                },     
                boss3 = {
                    name = 1626, --Gunship Battle
                    bossIDs = {37215},
                    achievement = 4536,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just complete the encounter as normal by firing the cannons at the enemy ship.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1099,
                },     
                boss4 = {
                    name = 1628, --Deathbringer Saurfang
                    bossIDs = {37813},
                    achievement = 4537,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:DeathbringerSaurfang() end,
                    partial = false,
                    encounterID = 1096,
                },     
                boss5 = {
                    name = 1629, --Festergut
                    bossIDs = {36626},
                    achievement = 4577,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:Festergut() end,
                    partial = false,
                    encounterID = 1097,
                },     
                boss6 = {
                    name = 1630, --Rotface
                    bossIDs = {36627},
                    achievement = 4538,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:Rotface() end,
                    partial = false,
                    encounterID = 1104,
                },     
                boss7 = {
                    name = 1631, --Professor Putricide
                    bossIDs = {36678},
                    achievement = 4578,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:ProfessorPutricide() end,
                    partial = false,
                    encounterID = 1102,
                },     
                boss8 = {
                    name = 1634, --Valithria Dreamwalker
                    bossIDs = {36789},
                    achievement = 4579,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement requires a healing class to complete. At 110, the healer can just heal the at the start of the fight. You do not need to wait for the portals to spawn if you can heal the boss to full in under 45 seconds.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1098,
                },     
                boss9 = {
                    name = 1635, --Sindragosa
                    bossIDs = {36853},
                    achievement = 4580,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:Sindragosa() end,
                    partial = false,
                    encounterID = 1105,
                },     
                boss10 = {
                    name = 1632, --Blood Prince Council
                    bossIDs = {37970},
                    achievement = 4582,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1095,
                },     
                boss11 = {
                    name = 1633, --Blood-Queen Lana'thel
                    bossIDs = {37955},
                    achievement = 4539,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement will take 2 kills to complete. At 110 to complete the ‘Defeat Blood-Queen Lana'thel without becoming a vampire’ criteria just simply nuke the boss down. To complete the ‘Defeat Blood-Queen Lana'thel while a vampire’ criteria, wait until you get the Essence of the Blood Queen debuff then nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1103,
                },     
                boss12 = {
                    name = 1636, --The Lich King
                    bossIDs = {36597},
                    achievement = 4601,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._631:LichKing() end,
                    partial = false,
                    encounterID = 1106,
                },
                boss13 = {
                    name = 1636, --The Lich King
                    bossIDs = {},
                    achievement = 4581,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1106,
                },                                
            },

            ["631-25"] = { --Icecrown Citadel 25 Man
                name = 758,
                boss1 = {
                    name = 1624, --Lord Marrowgar
                    bossIDs = {36612},
                    achievement = 4610,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:LordMarrowgar() end,
                    partial = false,
                    encounterID = 1101,
                },
                boss2 = {
                    name = 1625, --Lady Deathwhisper
                    bossIDs = {36855},
                    achievement = 4611,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._631:LadyDeathwhisper() end,
                    partial = false,
                    encounterID = 1100,
                },     
                boss3 = {
                    name = 1626, --Gunship Battle
                    bossIDs = {37215},
                    achievement = 4612,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just complete the encounter as normal by firing the cannons at the enemy ship.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1099,
                },     
                boss4 = {
                    name = 1628, --Deathbringer Saurfang
                    bossIDs = {37813},
                    achievement = 4613,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:DeathbringerSaurfang() end,
                    partial = false,
                    encounterID = 1096,
                },     
                boss5 = {
                    name = 1629, --Festergut
                    bossIDs = {36626},
                    achievement = 4615,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:Festergut() end,
                    partial = false,
                    encounterID = 1097,
                },     
                boss6 = {
                    name = 1630, --Rotface
                    bossIDs = {36627},
                    achievement = 4614,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:Rotface() end,
                    partial = false,
                    encounterID = 1104,
                },     
                boss7 = {
                    name = 1631, --Professor Putricide
                    bossIDs = {36678},
                    achievement = 4616,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:ProfessorPutricide() end,
                    partial = false,
                    encounterID = 1102,
                },     
                boss8 = {
                    name = 1634, --Valithria Dreamwalker
                    bossIDs = {36789},
                    achievement = 4619,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement requires a healing class to complete. At 110, the healer can just heal the at the start of the fight. You do not need to wait for the portals to spawn if you can heal the boss to full in under 45 seconds.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1098,
                },     
                boss9 = {
                    name = 1635, --Sindragosa
                    bossIDs = {36853},
                    achievement = 4620,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._631:Sindragosa() end,
                    partial = false,
                    encounterID = 1105,
                },     
                boss10 = {
                    name = 1632, --Blood Prince Council
                    bossIDs = {37970},
                    achievement = 4617,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1095,
                },     
                boss11 = {
                    name = 1633, --Blood-Queen Lana'thel
                    bossIDs = {37955},
                    achievement = 4618,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement will take 2 kills to complete. At 110 to complete the ‘Defeat Blood-Queen Lana'thel without becoming a vampire’ criteria just simply nuke the boss down. To complete the ‘Defeat Blood-Queen Lana'thel while a vampire’ criteria, wait until you get the Essence of the Blood Queen debuff then nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1103,
                },     
                boss12 = {
                    name = 1636, --The Lich King
                    bossIDs = {36597},
                    achievement = 4621,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._631:LichKing() end,
                    partial = false,
                    encounterID = 1106,
                },
                boss13 = {
                    name = 1636, --The Lich King
                    bossIDs = {},
                    achievement = 4622,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1106,
                },                               
            },
        },

        Dungeons = {
            [574] = { --Utgarde Keep
                name = 285,
                boss1 = {
                    name = 638, --Prince Keleseth
                    bossIDs = {23953},
                    achievement = 1919,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._574:PrinceKeleseth() end,
                    partial = false,
                    encounterID = 2026,
                },
            },

            [576] = { --The Nexus
                name = 281,
                boss1 = {
                    name = 618, --Grand Magus Telestra
                    bossIDs = {26731},
                    achievement = 2150,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._576:GrandMagusTelestra() end,
                    partial = false,
                },
                boss2 = {
                    name = 619, --Anomalus
                    bossIDs = {26763},
                    achievement = 2037,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Damage the boss down to 45%, be careful you don’t 1 shot the boss. Wait for the add to finish casting the indestructible buff on the boss. Once this has finished you can kill the boss. Make sure you don’t kill the chaotic rift.",
                    enabled = true,
                    track = function() core._576:Anomalus() end,
                    partial = false,
                },
                boss3 = {
                    name = 621, --Keristrasza
                    bossIDs = {26723},
                    achievement = 2036,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._576:Keristrasza() end,
                    partial = false,
                },
            },

            [595] = { --The Culling of Stratholme
                name = 279,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {27737},
                    achievement = 1872,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core.__595:ZombieFest() end,
					partial = false,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 1817,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
					partial = false,
                },
            },

            [601] = { --Azjol Nerub
                name = 272,
                boss1 = {
                    name = 585, --Krik'thir the Gatewatcher
                    bossIDs = {},
                    achievement = 1296,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just single target the boss down without killing any of the mobs around him.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1971,
                },
                boss2 = {
                    name = 586, --Hadronox
                    bossIDs = {},
                    achievement = 1297,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just go straight down to the boss ignoring all adds in the way. Nuke the boss down as soon as you reach him. Don’t wait for the boss to come to you.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1972,
                },
                boss3 = {
                    name = 587, --Anub'arak
                    bossIDs = {29120},
                    achievement = 1860,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._601:Anubarak() end,
                    partial = false,
                    encounterID = 1973,
                },
            },

            [619] = { --Ahn'Kahet The Old Kingdom
                name = 271,
                boss1 = {
                    name = 580, --Elder Nadox
                    bossIDs = {29309},
                    achievement = 2038,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._619:ElderNadox() end,
                    partial = false,
                    encounterID = 1969,
                },
                boss2 = {
                    name = 582, --Jedoga Shadowseeker
                    bossIDs = {29310},
                    achievement = 2056,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._619:JedogaShadowseeker() end,
                    partial = false,
                    encounterID = 1967,
                },
                boss3 = {
                    name = 584, --Herald Volazj
                    bossIDs = {29311},
                    achievement = 1862,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._619:HeraldVolazj() end,
                    partial = false,
                    encounterID = 1968,
                },
            },

            [600] = { --Dark Tharon Keep
                name = 273,
                boss1 = {
                    name = 588, --Trollgore
                    bossIDs = {26630},
                    achievement = 2151,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._600:Trollgore() end,
                    partial = false,
                    encounterID = 1974,
                },
                boss2 = {
                    name = 589, --Novos the Summoner
                    bossIDs = {},
                    achievement = 2057,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Stand at the top of the stairs and kill the undead adds and Crystal Handlers until all 4 Crystal Handlers have been killed. At this point phase 2 starts and you can kill the boss.",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1976,
                },
                boss3 = {
                    name = 590, --King Dred
                    bossIDs = {27483},
                    achievement = 2039,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss and pull 6 Drakkari Gutrippers and/or Drakkari Scytheclaw but don’t kill them. Once you in combat with the boss, single target down the raptors 1 by 1 until 6 are killed. Once this is done you can kill the boss.",
                    enabled = true,
                    track = function() core._600:KingDred() end,
                    partial = false,
                    encounterID = 1977,
                },
            },

            [608] = { --Violet Hold
                name = 283,
                boss1 = {
                    name = 632, --Cyanigosa
                    bossIDs = {},
                    achievement = 1816,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "For the achievement you must not use any of the red crystal around the room and none of the mobs can reach the entrance.",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 2020,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 1865,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement will take multiple runs to complete since it’s random which bosses are going to spawn.",
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss3 = {
                    name = 628, --Ichoron
                    bossIDs = {},
                    achievement = 2041,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss4 = {
                    name = 631, --Zuramat the Obliterator
                    bossIDs = {29314},
                    achievement = 2153,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._608:ZuramatTheObliterator() end,
                    partial = false,
                },
            },

            [604] = { --Gundrak
                name = 274,
                boss1 = {
                    name = 592, --Slad'ran
                    bossIDs = {29304},
                    achievement = 2058,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._604:Sladran() end,
                    partial = false,
                    encounterID = 1978,
                },
                boss2 = {
                    name = 594, --Moorabi
                    bossIDs = {29305},
                    achievement = 2040,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._604:Moorabi() end,
                    partial = false,
                    encounterID = 1980,
                },
                boss3 = {
                    name = 596, --Gal'darah
                    bossIDs = {},
                    achievement = 1864,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1981,
                },
                boss4 = {
                    name = 596, --Gal'darah
                    bossIDs = {29306},
                    achievement = 2152,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._604:Galdarah() end,
                    partial = false,
                    encounterID = 1981,
                },
            },

            [599] = { --Halls of Stone
                name = 277,
                boss1 = {
                    name = 605, --Maiden of Grief
                    bossIDs = {27975},
                    achievement = 1866,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._599:MaidenOfGrief() end,
                    partial = false,
                    encounterID = 1996,
                },
                boss2 = {
                    name = 606, --Tribunal of Ages
                    bossIDs = {27983},
                    achievement = 2154,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just complete the encounter without letting the adds reach Brann Bronzebeard.",
                    enabled = true,
                    track = function() core._599:TribunalOfAges() end,
                    partial = false,
                    encounterID = 1995,
                },
                boss3 = {
                    name = 607, --Sjonnir The Ironshaper
                    bossIDs = {27978},
                    achievement = 2155,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "Pull the boss then wait for the Malformed Ooze to form into one Iron Sludge. Once the Iron Sludge is formed, kill it then kill the boss.",
                    enabled = true,
                    track = function() core._599:SjonnirTheIronshaper() end,
                    partial = false,
                    encounterID = 1998,
                },
            },

            [602] = { --Halls of Lightning
                name = 275,
                boss1 = {
                    name = 597, --General Bjarngrim
                    bossIDs = {28586},
                    achievement = 1834,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just wait for the boss to gain Temporary Electrical Charge buff before pulling him. Once he has the buff pull the boss, wait for him to get his defensive stance up then kill him.",
                    enabled = true,
                    track = function() core._602:GeneralBjarngrim() end,
                    partial = false,
                    encounterID = 1987,
                },
                boss2 = {
                    name = 598, --Volkhan
                    bossIDs = {28587},
                    achievement = 2042,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._602:Volkhan() end,
                    partial = false,
                    encounterID = 1985,
                },
                boss3 = {
                    name = 600, --Loken
                    bossIDs = {28923},
                    achievement = 1867,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._602:Loken() end,
                    partial = false,
                    encounterID = 1986,
                },
            },

            [578] = { --The Oculus
                name = 282,
                boss1 = {
                    name = 625, --Ley-Guardian Eregos
                    bossIDs = {},
                    achievement = 1871,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2013,
                },
                boss2 = {
                    name = 625, --Ley-Guardian Eregos
                    bossIDs = {},
                    achievement = 1868,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 2013,
                },
                boss3 = {
                    name = 625, --Ley-Guardian Eregos
                    bossIDs = {},
                    achievement = 2044,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2013,
                },
                boss4 = {
                    name = 625, --Ley-Guardian Eregos
                    bossIDs = {},
                    achievement = 2045,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2013,
                },
                boss5 = {
                    name = 625, --Ley-Guardian Eregos
                    bossIDs = {},
                    achievement = 2046,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2013,
                },
            },

            [575] = { --Utgarde Pinnacle
                name = 286,
                boss1 = {
                    name = 641, --Svala Sorrowgrave
                    bossIDs = {},
                    achievement = 2043,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2030,
                },
                boss2 = {
                    name = 643, --Skadi the Ruthless
                    bossIDs = {26690, 26693},
                    achievement = 1873,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just complete the encounter as quickly as possible.",
                    enabled = true,
                    track = function() core._575:SkadiTheRuthless() end,
                    partial = false,
                    encounterID = 2029,
                },
                boss3 = {
                    name = 643, --Skadi the Ruthless
                    bossIDs = {},
                    achievement = 2156,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2029,
                },
                boss4 = {
                    name = 644, --King Ymiron
                    bossIDs = {26861},
                    achievement = 2157,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._575:KingYmiron() end,
                    partial = false,
                    encounterID = 2028,
                },
            },

            [650] = { --Trial of the Champion
                name = 284,
                boss1 = {
                    name = 636, --Argent Confessor Paletress
                    bossIDs = {},
                    achievement = 3802,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "This achievement will take multiple runs to complete. At 110, you can simply nuke down the boss to supress one of the memories.",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 635, --Eadric the Pure
                    bossIDs = {},
                    achievement = 3803,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 637, --The Black Knight
                    bossIDs = {35451},
                    achievement = 3804,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._650:TheBlackKnight() end,
                    partial = false,
                    encounterID = 2021,
                },
            },

            [632] = { --The Forge of Souls
                name = 280,
                boss1 = {
                    name = 615, --Bronjahm
                    bossIDs = {36497},
                    achievement = 4522,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "",
                    enabled = true,
                    track = function() core._632:Bronjahm() end,
                    partial = false,
                    encounterID = 2006,
                },
                boss2 = {
                    name = 616, --Devourer of Souls
                    bossIDs = {36502},
                    achievement = 4523,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._632:DevourerOfSouls() end,
                    partial = false,
                    encounterID = 2007,
                },
            },

            [658] = { --Pit of Saron
                name = 278,
                boss1 = {
                    name = 608, --Forgemaster Garfrost
                    bossIDs = {36494},
                    achievement = 4524,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, you can simply just nuke the boss down.",
                    enabled = true,
                    track = function() core._658:ForgemasterGarfrost() end,
                    partial = false,
                    encounterID = 1999,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 4525,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "When you run through the tunnel after the 2nd boss, no player in the group can hit by any of the icicles on the floor. The ground is marked where these icicles will fall so just make sure no one is standing in those areas.",
                    enabled = true,
                    track = function() end,
					partial = false,
                },
            },

            [668] = { --Halls of Reflection
                name = 276,
                boss1 = {
                    name = 603,
                    bossIDs = {},
                    achievement = 4526,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = "At 110, just complete the gauntlet as quickly as possible.",
                    enabled = false,
                    track = nil,
                    partial = false,
                },
            },
        },
    },
}
