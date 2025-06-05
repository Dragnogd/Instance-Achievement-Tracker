--------------------------------------
-- Last Auto Generated: 05/06/2025 20:05:21 using https://github.com/Dragnogd/Instance-Achievement-Tracker-Database-Manager
--------------------------------------
local _, core = ...
local L = core.L
local instances = {}

core.Instances = {
	--Wrath of the Lich King
	[3] = {
		Raids = {
			[615.10] = { --Obsidian Sanctum 10 Man
				name = 755,
				nameLocalised = L["Instance_TheObsidianSanctum"],
				classicPhase = 1,
				boss1 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 624,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
				boss2 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2047,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._615:GonnaGoWhenTheVolcanoBlows() end,
					partial = false,
					encounterID = 1090,
					displayInfoFrame = true,
					nameWrath = L["Boss_Sartharion"],
				},
				boss3 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2049,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
				boss4 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2050,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
				boss5 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2051,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
			},

			[615.25] = { --Obsidian Sanctum 25 Man
				name = 755,
				nameLocalised = L["Instance_TheObsidianSanctum"],
				classicPhase = 1,
				boss1 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 1877,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
				boss2 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2048,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._615:GonnaGoWhenTheVolcanoBlows() end,
					partial = false,
					encounterID = 1090,
					displayInfoFrame = true,
					nameWrath = L["Boss_Sartharion"],
				},
				boss3 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2052,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
				boss4 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2053,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
				boss5 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 2054,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1090,
					nameWrath = L["Boss_Sartharion"],
				},
			},

			[616.10] = { --Eye of Eternity 10 Man
				name = 756,
				nameLocalised = L["Instance_TheEyeOfEternity"],
				classicPhase = 1,
				boss1 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 1874,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._616:YouDontHaveAnEternity() end,
					partial = false,
					encounterID = 1094,
					displayInfoFrame = true,
					nameWrath = L["Boss_Malygos"],
				},
				boss2 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 1869,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._616:APokeInTheEye() end,
					partial = false,
					encounterID = 1094,
					nameWrath = L["Boss_Malygos"],
				},
				boss3 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 2148,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1094,
					nameWrath = L["Boss_Malygos"],
				},
			},

			[616.25] = { --Eye of Eternity 25 Man
				name = 756,
				nameLocalised = L["Instance_TheEyeOfEternity"],
				classicPhase = 1,
				boss1 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 1875,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._616:YouDontHaveAnEternity() end,
					partial = false,
					encounterID = 1094,
					nameWrath = L["Boss_Malygos"],
				},
				boss2 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 1870,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._616:APokeInTheEye() end,
					partial = false,
					encounterID = 1094,
					nameWrath = L["Boss_Malygos"],
				},
				boss3 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 2149,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1094,
					nameWrath = L["Boss_Malygos"],
				},
			},

			[249.10] = { --Onyxia's Lair 10 Man
				name = 760,
				nameLocalised = L["Instance_OnyxiasLair"],
				classicPhase = 3,
				boss1 = {
					name = 1651, --Onyxia
					bossIDs = {10184},
					achievement = 4402,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._249:Onyxia2() end,
					partial = false,
					encounterID = 1084,
					nameWrath = L["Boss_Onyxia"],
				},
				boss2 = {
					name = 1651, --Onyxia
					bossIDs = {},
					achievement = 4403,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1084,
					nameWrath = L["Boss_Onyxia"],
				},
				boss3 = {
					name = 1651, --Onyxia
					bossIDs = {10184},
					achievement = 4404,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._249:Onyxia1() end,
					partial = false,
					encounterID = 1084,
					nameWrath = L["Boss_Onyxia"],
				},
			},

			[249.25] = { --Onyxia's Lair 25 Man
				name = 760,
				nameLocalised = L["Instance_OnyxiasLair"],
				classicPhase = 3,
				boss1 = {
					name = 1651, --Onyxia
					bossIDs = {10184},
					achievement = 4405,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._249:Onyxia2() end,
					partial = false,
					encounterID = 1084,
					nameWrath = L["Boss_Onyxia"],
				},
				boss2 = {
					name = 1651, --Onyxia
					bossIDs = {},
					achievement = 4406,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1084,
					nameWrath = L["Boss_Onyxia"],
				},
				boss3 = {
					name = 1651, --Onyxia
					bossIDs = {10184},
					achievement = 4407,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._249:Onyxia1() end,
					partial = false,
					encounterID = 1084,
					nameWrath = L["Boss_Onyxia"],
				},
			},

			[649.10] = { --Trial of the Crusader 10 Man
				name = 757,
				nameLocalised = L["Instance_TrialOfTheCrusader"],
				classicPhase = 3,
				boss1 = {
					name = 1618, --Icehowl
					bossIDs = {34796},
					achievement = 3797,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:UpperBackPain() end,
					partial = false,
					encounterID = 1088,
					nameWrath = L["Boss_Icehowl"],
				},
				boss2 = {
					name = 1618, --Acidmaw and Dreadscale
					bossIDs = {34796,35144,34799},
					achievement = 3936,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:NotOneButTwoJormungars() end,
					partial = false,
					encounterID = 1088,
					nameWrath = L["Boss_AcidmawandDreadscale"],
				},
				boss3 = {
					name = 1619, --Lord Jaraxxus
					bossIDs = {34780},
					achievement = 3996,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:ThreeSixtyPainSpike() end,
					partial = false,
					encounterID = 1087,
					nameWrath = L["Boss_LordJaraxxus"],
				},
				boss4 = {
					name = 1621, --Faction Champions
					bossIDs = {34461,34460,34469,34467,34468,34465,34471,34466,34473,34472,34463,34470,34474,34475,34458,34451,34459,34448,34449,34445,34456,34447,34441,34454,34455,34444,34450,34453},
					achievement = 3798,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:FactionChampions() end,
					partial = false,
					encounterID = 1086,
					nameWrath = L["Boss_FactionChampions"],
				},
				boss5 = {
					name = 1622, --Twin Val'kyr
					bossIDs = {34497,34496},
					achievement = 3799,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:TwinValkyr() end,
					partial = false,
					encounterID = 1089,
					nameWrath = L["Boss_TwinValkyr"],
				},
				boss6 = {
					name = 1623, --Anub'arak
					bossIDs = {34564},
					achievement = 3800,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:Anubarak() end,
					partial = false,
					encounterID = 1085,
					displayInfoFrame = true,
					nameWrath = L["Boss_Anubarak"],
				},
			},

			[649.25] = { --Trial of the Crusader 25 Man
				name = 757,
				nameLocalised = L["Instance_TrialOfTheCrusader"],
				classicPhase = 3,
				boss1 = {
					name = 1618, --Icehowl
					bossIDs = {34796},
					achievement = 3813,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:UpperBackPain() end,
					partial = false,
					encounterID = 1088,
					nameWrath = L["Boss_Icehowl"],
				},
				boss2 = {
					name = 1618, --Acidmaw and Dreadscale
					bossIDs = {34796,35144,34799},
					achievement = 3937,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:NotOneButTwoJormungars() end,
					partial = false,
					encounterID = 1088,
					nameWrath = L["Boss_AcidmawandDreadscale"],
				},
				boss3 = {
					name = 1619, --Lord Jaraxxus
					bossIDs = {34780},
					achievement = 3997,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:ThreeSixtyPainSpike() end,
					partial = false,
					encounterID = 1087,
					nameWrath = L["Boss_LordJaraxxus"],
				},
				boss4 = {
					name = 1622, --Twin Val'kyr
					bossIDs = {34497,34496},
					achievement = 3815,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:TwinValkyr() end,
					partial = false,
					encounterID = 1089,
					nameWrath = L["Boss_TwinValkyr"],
				},
				boss5 = {
					name = 1623, --Anub'arak
					bossIDs = {34564},
					achievement = 3816,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._649:Anubarak() end,
					partial = false,
					encounterID = 1085,
					displayInfoFrame = true,
					nameWrath = L["Boss_Anubarak"],
				},
			},

			[624.10] = { --Vault of Archavon 10 Man
				name = 753,
				nameLocalised = L["Instance_VaultOfArchavon"],
				classicPhase = 1,
				boss1 = {
					name = 1597, --Archavon & Emalon & Koralon
					bossIDs = {},
					achievement = 4016,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1126,
					nameWrath = L["Boss_ArchavonTheStoneWatcher"],
				},
			},

			[624.25] = { --Vault of Archavon 25 Man
				name = 753,
				nameLocalised = L["Instance_VaultOfArchavon"],
				classicPhase = 1,
				boss1 = {
					name = 1597, --Archavon & Emalon & Koralon
					bossIDs = {},
					achievement = 4017,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1126,
					nameWrath = L["Boss_ArchavonTheStoneWatcher"],
				},
			},

			[603] = { --Ulduar
				name = 759,
				nameLocalised = L["Instance_Ulduar"],
				classicPhase = 2,
				retailOnly = true,
				boss1 = {
					name = L["Instances_Other"], --Dwarfageddon
					bossIDs = {33572},
					achievement = 12312,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:Dwarfageddon(12312) end,
					partial = true,
					displayInfoFrame = true,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --Unbroken
					bossIDs = {},
					achievement = 12313,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 1637, --Flame Leviathan (Three Car Garage)
					bossIDs = {},
					achievement = 12314,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss4 = {
					name = 1637, --Flame Leviathan (Take Out Those Turrets)
					bossIDs = {},
					achievement = 12315,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FlameLeviathanTakeOutThoseTurrets(12315) end,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss5 = {
					name = 1637, --Flame Leviathan (Shutout)
					bossIDs = {},
					achievement = 12316,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FlameLeviathanShutout(12316) end,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss6 = {
					name = 1637, --Flame Leviathan (Orbital Bombardment)
					bossIDs = {},
					achievement = 12317,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss7 = {
					name = 1637, --Flame Leviathan (Orbital Devastation)
					bossIDs = {},
					achievement = 12318,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss8 = {
					name = 1637, --Flame Leviathan (Nuked from Orbit)
					bossIDs = {},
					achievement = 12319,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss9 = {
					name = 1637, --Flame Leviathan (Orbit-uary)
					bossIDs = {},
					achievement = 12320,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss10 = {
					name = 1639, --Razorscale (A Quick Shave)
					bossIDs = {},
					achievement = 12321,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:RazorscaleAQuickShave(12321) end,
					partial = false,
					encounterID = 1139,
					nameWrath = L["Boss_Razorscale"],
				},
				boss11 = {
					name = 1639, --Razorscale (Iron Dwarf, Medium Rare)
					bossIDs = {},
					achievement = 12322,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:RazorscaleIronDwarfMediumRare(12322) end,
					partial = false,
					encounterID = 1139,
					nameWrath = L["Boss_Razorscale"],
				},
				boss12 = {
					name = 1638, --Ignis the Furnace Master (Shattered)
					bossIDs = {},
					achievement = 12323,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:IgnisTheFurnaceMasterShattered(12323) end,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss13 = {
					name = 1638, --Ignis the Furnace Master (Hot Pocket)
					bossIDs = {},
					achievement = 12324,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss14 = {
					name = 1638, --Ignis the Furnace Master (Stokin' the Furnace)
					bossIDs = {},
					achievement = 12325,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:IgnisTheFurnaceMasterStokinTheFurnace(12325) end,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss15 = {
					name = 1640, --XT-002 Deconstructor (Nerf Engineering)
					bossIDs = {},
					achievement = 12326,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfEngineering(12326) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss16 = {
					name = 1640, --XT-002 Deconstructor (Nerf Scrapbots)
					bossIDs = {},
					achievement = 12327,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfScrapbots(12327) end,
					partial = false,
					encounterID = 1142,
					displayInfoFrame = true,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss17 = {
					name = 1640, --XT-002 Deconstructor (Nerf Gravity Bombs)
					bossIDs = {},
					achievement = 12328,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfGravityBombs(12328) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss18 = {
					name = 1640, --XT-002 Deconstructor (Must Deconstruct Faster)
					bossIDs = {},
					achievement = 12329,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorMustDeconstructFaster(12329) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss19 = {
					name = 1640, --XT-002 Deconstructor (Heartbreaker)
					bossIDs = {},
					achievement = 12330,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorHeartbreaker(12330) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss20 = {
					name = 1641, --Assembly of Iron (I Choose You, Runemaster Molgeim)
					bossIDs = {},
					achievement = 12332,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouRunemasterMolgeim(12332) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss21 = {
					name = 1641, --Assembly of Iron (I Choose You, Stormcaller Brundir)
					bossIDs = {},
					achievement = 12333,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouStormcallerBrundir(12333) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss22 = {
					name = 1641, --Assembly of Iron (I Choose You, Steelbreaker)
					bossIDs = {},
					achievement = 12334,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouSteelbreaker(12334) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss23 = {
					name = 1641, --Assembly of Iron (But I'm On Your Side)
					bossIDs = {},
					achievement = 12335,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss24 = {
					name = 1641, --Assembly of Iron (Can't Do That While Stunned)
					bossIDs = {},
					achievement = 12336,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronCantDoThatWhileStunned(12336) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss25 = {
					name = 1642, --Kologarn (With Open Arms)
					bossIDs = {},
					achievement = 12337,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnWithOpenArms(12337) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss26 = {
					name = 1642, --Kologarn (Disarmed)
					bossIDs = {},
					achievement = 12338,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss27 = {
					name = 1642, --Kologarn (If Looks Could Kill)
					bossIDs = {},
					achievement = 12339,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnIfLooksCouldKill(12339) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss28 = {
					name = 1642, --Kologarn (Rubble and Roll)
					bossIDs = {},
					achievement = 12340,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnRubbleAndRoll(12340) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss29 = {
					name = 1643, --Auriaya (Crazy Cat Lady)
					bossIDs = {},
					achievement = 12341,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AuriayaCrazyCatLady(12341) end,
					partial = false,
					encounterID = 1131,
					nameWrath = L["Boss_Auriaya"],
				},
				boss30 = {
					name = 1643, --Auriaya (Nine Lives)
					bossIDs = {},
					achievement = 12342,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AuriayaNineLives(12342) end,
					partial = false,
					encounterID = 1131,
					nameWrath = L["Boss_Auriaya"],
				},
				boss31 = {
					name = 1644, --Hodir (Cheese the Freeze)
					bossIDs = {},
					achievement = 12343,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirCheeseTheFreeze(12343) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss32 = {
					name = 1644, --Hodir (I Have the Coolest Friends)
					bossIDs = {},
					achievement = 12344,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirIHaveTheCoolestFriends(12344) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss33 = {
					name = 1644, --Hodir (Getting Cold in Here)
					bossIDs = {},
					achievement = 12345,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirGettingColdInHere(12345) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss34 = {
					name = 1644, --Hodir (I Could Say That This Cache Was Rare)
					bossIDs = {},
					achievement = 12347,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirICouldSayThatThisCacheWasRare(12347) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss35 = {
					name = 1644, --Hodir (Staying Buffed All Winter)
					bossIDs = {},
					achievement = 12346,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss36 = {
					name = 1645, --Thorim (Getting Cold in Here)
					bossIDs = {},
					achievement = 12348,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:ThorimDontStandInTheLightning(12348) end,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss37 = {
					name = 1645, --Thorim (I'll Take You All On)
					bossIDs = {},
					achievement = 12349,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss38 = {
					name = 1645, --Thorim (Who Needs Bloodlust?)
					bossIDs = {},
					achievement = 12350,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss39 = {
					name = 1645, --Thorim (Siffed)
					bossIDs = {},
					achievement = 12351,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss40 = {
					name = 1645, --Thorim (Lose Your Illusion)
					bossIDs = {},
					achievement = 12352,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss41 = {
					name = L["Instances_Other"], --Lumberjacked
					bossIDs = {32914, 32913, 32915},
					achievement = 12360,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaLumberjacked(12360) end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss42 = {
					name = 1646, --Freya (Con-speed-atory)
					bossIDs = {32906, 33430, 33431, 33528, 33527, 33526, 33525, 32914, 32913, 33354, 33355, 32915},
					achievement = 12361,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaConSpeedAtory(12361) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss43 = {
					name = 1646, --Freya (Deforestation)
					bossIDs = {},
					achievement = 12362,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaDeforestation(12362) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss44 = {
					name = 1646, --Freya (Getting Back to Nature)
					bossIDs = {},
					achievement = 12363,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaGettingBackToNature(12363) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss45 = {
					name = 1646, --Freya (Knock on Wood)
					bossIDs = {},
					achievement = 12364,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss46 = {
					name = 1646, --Freya (Knock, Knock on Wood)
					bossIDs = {},
					achievement = 12365,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss47 = {
					name = 1646, --Freya (Knock, Knock, Knock on Wood)
					bossIDs = {},
					achievement = 12366,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss48 = {
					name = 1647, --Mimiron (Set Up Us the Bomb)
					bossIDs = {},
					achievement = 12367,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:MimironSetUpUsTheBomb(12367) end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss49 = {
					name = 1647, --Mimiron (Not-So-Friendly Fire)
					bossIDs = {},
					achievement = 12368,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:MimironNotSoFriendlyFire(12368) end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss50 = {
					name = 1647, --Mimiron (Firefighter)
					bossIDs = {},
					achievement = 12369,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss51 = {
					name = 1648, --General Vezax (Shadowdodger)
					bossIDs = {},
					achievement = 12372,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:Shadowdodger(12372) end,
					partial = false,
					encounterID = 1134,
					nameWrath = L["Boss_GeneralVezax"],
				},
				boss52 = {
					name = 1648, --General Vezax (I Love the Smell of Saronite in the Morning)
					bossIDs = {},
					achievement = 12373,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:ILoveTheSmellOfSaroniteInTheMorning(12373) end,
					partial = false,
					encounterID = 1134,
					nameWrath = L["Boss_GeneralVezax"],
				},
				boss53 = {
					name = 1649, --Yogg-Saron 1 (Kiss and Make Up)
					bossIDs = {},
					achievement = 12384,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KissAndMakeUp(12384) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron1"],
				},
				boss54 = {
					name = 1649, --Yogg-Saron 2 (Three Lights in the Darkness)
					bossIDs = {},
					achievement = 12385,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron2"],
				},
				boss55 = {
					name = 1649, --Yogg-Saron 3 (Two Lights in the Darkness)
					bossIDs = {},
					achievement = 12386,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron3"],
				},
				boss56 = {
					name = 1649, --Yogg-Saron 4 (One Light in the Darkness)
					bossIDs = {},
					achievement = 12387,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron4"],
				},
				boss57 = {
					name = 1649, --Yogg-Saron 5 (Alone in the Darkness)
					bossIDs = {},
					achievement = 12388,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron5"],
				},
				boss58 = {
					name = 1649, --Yogg-Saron 6 (Drive Me Crazy)
					bossIDs = {},
					achievement = 12395,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:DriveMeCrazy(12395) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron6"],
				},
				boss59 = {
					name = 1649, --Yogg-Saron 7 (He's Not Getting Any Older)
					bossIDs = {},
					achievement = 12396,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HesNotGettingAnyOlder(12396) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron7"],
				},
				boss60 = {
					name = 1649, --Yogg-Saron 8 (They're Coming Out of the Walls)
					bossIDs = {},
					achievement = 12397,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:TheyreComingOutOfTheWalls(12397) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron8"],
				},
				boss61 = {
					name = 1649, --Yogg-Saron 9 (In His House He Waits Dreaming)
					bossIDs = {},
					achievement = 12398,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron9"],
				},
				boss62 = {
					name = 1650, --Algalon the Observer (Supermassive)
					bossIDs = {},
					achievement = 12400,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1130,
					nameWrath = L["Boss_AlgalonTheObserver"],
				},
			},

			[603.10] = { --Ulduar 10 Man
				name = 759,
				nameLocalised = L["Instance_Ulduar"],
				classicPhase = 2,
				classicOnly = true,
				boss1 = {
					name = L["Instances_Other"], --Dwarfageddon 10 Man
					bossIDs = {33572},
					achievement = 3097,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:Dwarfageddon(3097) end,
					partial = true,
					displayInfoFrame = true,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --Unbroken 10 Man
					bossIDs = {},
					achievement = 2905,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 1637, --Flame Leviathan (Three Car Garage) 10 Man
					bossIDs = {},
					achievement = 2907,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss4 = {
					name = 1637, --Flame Leviathan (Take Out Those Turrets) 10 Man
					bossIDs = {},
					achievement = 2909,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FlameLeviathanTakeOutThoseTurrets(2909) end,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss5 = {
					name = 1637, --Flame Leviathan (Shutout) 10 Man
					bossIDs = {},
					achievement = 2911,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FlameLeviathanShutout(2911) end,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss6 = {
					name = 1637, --Flame Leviathan (Orbital Bombardment) 10 Man
					bossIDs = {},
					achievement = 2913,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss7 = {
					name = 1637, --Flame Leviathan (Orbital Devastation) 10 Man
					bossIDs = {},
					achievement = 2914,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss8 = {
					name = 1637, --Flame Leviathan (Nuked from Orbit) 10 Man
					bossIDs = {},
					achievement = 2915,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss9 = {
					name = 1637, --Flame Leviathan (Orbit-uary) 10 Man
					bossIDs = {},
					achievement = 3056,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss10 = {
					name = 1639, --Razorscale (A Quick Shave) 10 Man
					bossIDs = {},
					achievement = 2919,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:RazorscaleAQuickShave(2919) end,
					partial = false,
					encounterID = 1139,
					nameWrath = L["Boss_Razorscale"],
				},
				boss11 = {
					name = 1639, --Razorscale (Iron Dwarf, Medium Rare) 10 Man
					bossIDs = {},
					achievement = 2923,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:RazorscaleIronDwarfMediumRare(2923) end,
					partial = false,
					encounterID = 1139,
					nameWrath = L["Boss_Razorscale"],
				},
				boss12 = {
					name = 1638, --Ignis the Furnace Master (Shattered) 10 Man
					bossIDs = {},
					achievement = 2925,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:IgnisTheFurnaceMasterShattered(2925) end,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss13 = {
					name = 1638, --Ignis the Furnace Master (Hot Pocket) 10 Man
					bossIDs = {},
					achievement = 2927,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss14 = {
					name = 1638, --Ignis the Furnace Master (Stokin' the Furnace) 10 Man
					bossIDs = {},
					achievement = 2930,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:IgnisTheFurnaceMasterStokinTheFurnace(2930) end,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss15 = {
					name = 1640, --XT-002 Deconstructor (Nerf Engineering) 10 Man
					bossIDs = {},
					achievement = 2931,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfEngineering(2931) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss16 = {
					name = 1640, --XT-002 Deconstructor (Nerf Scrapbots) 10 Man
					bossIDs = {},
					achievement = 2933,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfScrapbots(2933) end,
					partial = false,
					encounterID = 1142,
					displayInfoFrame = true,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss17 = {
					name = 1640, --XT-002 Deconstructor (Nerf Gravity Bombs) 10 Man
					bossIDs = {},
					achievement = 2934,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfGravityBombs(2934) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss18 = {
					name = 1640, --XT-002 Deconstructor (Must Deconstruct Faster) 10 Man
					bossIDs = {},
					achievement = 2937,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorMustDeconstructFaster(2937) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss19 = {
					name = 1640, --XT-002 Deconstructor (Heartbreaker) 10 Man
					bossIDs = {},
					achievement = 3058,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorHeartbreaker(3058) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss20 = {
					name = 1641, --Assembly of Iron (I Choose You, Runemaster Molgeim) 10 Man
					bossIDs = {},
					achievement = 2939,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouRunemasterMolgeim(2939) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss21 = {
					name = 1641, --Assembly of Iron (I Choose You, Stormcaller Brundir) 10 Man
					bossIDs = {},
					achievement = 2940,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouStormcallerBrundir(2940) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss22 = {
					name = 1641, --Assembly of Iron (I Choose You, Steelbreaker) 10 Man
					bossIDs = {},
					achievement = 2941,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouSteelbreaker(2941) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss23 = {
					name = 1641, --Assembly of Iron (But I'm On Your Side) 10 Man
					bossIDs = {},
					achievement = 2945,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss24 = {
					name = 1641, --Assembly of Iron (Can't Do That While Stunned) 10 Man
					bossIDs = {},
					achievement = 2947,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronCantDoThatWhileStunned(2947) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss25 = {
					name = 1642, --Kologarn (With Open Arms) 10 Man
					bossIDs = {},
					achievement = 2951,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnWithOpenArms(2951) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss26 = {
					name = 1642, --Kologarn (Disarmed) 10 Man
					bossIDs = {},
					achievement = 2953,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss27 = {
					name = 1642, --Kologarn (If Looks Could Kill) 10 Man
					bossIDs = {},
					achievement = 2955,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnIfLooksCouldKill(2955) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss28 = {
					name = 1642, --Kologarn (Rubble and Roll) 10 Man
					bossIDs = {},
					achievement = 2959,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnRubbleAndRoll(2959) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss29 = {
					name = 1643, --Auriaya (Crazy Cat Lady) 10 Man
					bossIDs = {},
					achievement = 3006,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AuriayaCrazyCatLady(3006) end,
					partial = false,
					encounterID = 1131,
					nameWrath = L["Boss_Auriaya"],
				},
				boss30 = {
					name = 1643, --Auriaya (Nine Lives) 10 Man
					bossIDs = {},
					achievement = 3076,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AuriayaNineLives(3076) end,
					partial = false,
					encounterID = 1131,
					nameWrath = L["Boss_Auriaya"],
				},
				boss31 = {
					name = 1644, --Hodir (Cheese the Freeze) 10 Man
					bossIDs = {},
					achievement = 2961,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirCheeseTheFreeze(2961) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss32 = {
					name = 1644, --Hodir (I Have the Coolest Friends) 10 Man
					bossIDs = {},
					achievement = 2963,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirIHaveTheCoolestFriends(2963) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss33 = {
					name = 1644, --Hodir (Getting Cold in Here) 10 Man
					bossIDs = {},
					achievement = 2967,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirGettingColdInHere(2967) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss34 = {
					name = 1644, --Hodir (I Could Say That This Cache Was Rare) 10 Man
					bossIDs = {},
					achievement = 3182,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirICouldSayThatThisCacheWasRare(3182) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss35 = {
					name = 1644, --Hodir (Staying Buffed All Winter) 10 Man
					bossIDs = {},
					achievement = 2969,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss36 = {
					name = 1645, --Thorim (Don't Stand in the Lightning) 10 Man
					bossIDs = {},
					achievement = 2971,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:ThorimDontStandInTheLightning(2971) end,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss37 = {
					name = 1645, --Thorim (I'll Take You All On) 10 Man
					bossIDs = {},
					achievement = 2973,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss38 = {
					name = 1645, --Thorim (Who Needs Bloodlust?) 10 Man
					bossIDs = {},
					achievement = 2975,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss39 = {
					name = 1645, --Thorim (Siffed) 10 Man
					bossIDs = {},
					achievement = 2977,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss40 = {
					name = 1645, --Thorim (Lose Your Illusion) 10 Man
					bossIDs = {},
					achievement = 3176,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss41 = {
					name = L["Instances_Other"], --Lumberjacked 10 Man
					bossIDs = {32914, 32913, 32915},
					achievement = 2979,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaLumberjacked(12360) end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss42 = {
					name = 1646, --Freya (Con-speed-atory) 10 Man
					bossIDs = {32906, 33430, 33431, 33528, 33527, 33526, 33525, 32914, 32913, 33354, 33355, 32915},
					achievement = 2980,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaConSpeedAtory(753) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss43 = {
					name = 1646, --Freya (Deforestation) 10 Man
					bossIDs = {},
					achievement = 2985,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaDeforestation(2985) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss44 = {
					name = 1646, --Freya (Getting Back to Nature) 10 Man
					bossIDs = {},
					achievement = 2982,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaGettingBackToNature(2982) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss45 = {
					name = 1646, --Freya (Knock on Wood) 10 Man
					bossIDs = {},
					achievement = 3177,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss46 = {
					name = 1646, --Freya (Knock, Knock on Wood) 10 Man
					bossIDs = {},
					achievement = 3178,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss47 = {
					name = 1646, --Freya (Knock, Knock, Knock on Wood) 10 Man
					bossIDs = {},
					achievement = 3179,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss48 = {
					name = 1647, --Mimiron (Set Up Us the Bomb) 10 Man
					bossIDs = {},
					achievement = 2989,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:MimironSetUpUsTheBomb(2989) end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss49 = {
					name = 1647, --Mimiron (Not-So-Friendly Fire) 10 Man
					bossIDs = {},
					achievement = 3138,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:MimironNotSoFriendlyFire(3138) end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss50 = {
					name = 1647, --Mimiron (Firefighter) 10 Man
					bossIDs = {},
					achievement = 3180,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss51 = {
					name = 1648, --General Vezax (Shadowdodger) 10 Man
					bossIDs = {},
					achievement = 2996,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:Shadowdodger(2996) end,
					partial = false,
					encounterID = 1134,
					nameWrath = L["Boss_GeneralVezax"],
				},
				boss52 = {
					name = 1648, --General Vezax (I Love the Smell of Saronite in the Morning) 10 Man
					bossIDs = {},
					achievement = 3181,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:ILoveTheSmellOfSaroniteInTheMorning(3181) end,
					partial = false,
					encounterID = 1134,
					nameWrath = L["Boss_GeneralVezax"],
				},
				boss53 = {
					name = 1649, --Yogg-Saron 1 (Kiss and Make Up) 10 Man
					bossIDs = {},
					achievement = 3009,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KissAndMakeUp(3009) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron1"],
				},
				boss54 = {
					name = 1649, --Yogg-Saron 2 (Three Lights in the Darkness) 10 Man
					bossIDs = {},
					achievement = 3157,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron2"],
				},
				boss55 = {
					name = 1649, --Yogg-Saron 3 (Two Lights in the Darkness) 10 Man
					bossIDs = {},
					achievement = 3141,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron3"],
				},
				boss56 = {
					name = 1649, --Yogg-Saron 4 (One Light in the Darkness) 10 Man
					bossIDs = {},
					achievement = 3158,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron4"],
				},
				boss57 = {
					name = 1649, --Yogg-Saron 5 (Alone in the Darkness) 10 Man
					bossIDs = {},
					achievement = 3159,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron5"],
				},
				boss58 = {
					name = 1649, --Yogg-Saron 6 (Drive Me Crazy) 10 Man
					bossIDs = {},
					achievement = 3008,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:DriveMeCrazy(3008) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron6"],
				},
				boss59 = {
					name = 1649, --Yogg-Saron 7 (He's Not Getting Any Older) 10 Man
					bossIDs = {},
					achievement = 3012,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HesNotGettingAnyOlder(3012) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron7"],
				},
				boss60 = {
					name = 1649, --Yogg-Saron 8 (They're Coming Out of the Walls) 10 Man
					bossIDs = {},
					achievement = 3014,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:TheyreComingOutOfTheWalls(3014) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron8"],
				},
				boss61 = {
					name = 1649, --Yogg-Saron 9 (In His House He Waits Dreaming) 10 Man
					bossIDs = {},
					achievement = 3015,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron9"],
				},
				boss62 = {
					name = 1650, --Algalon the Observer (Supermassive) 10 Man
					bossIDs = {},
					achievement = 3003,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1130,
					nameWrath = L["Boss_AlgalonTheObserver"],
				},
			},

			[603.25] = { --Ulduar 25 Man
				name = 759,
				nameLocalised = L["Instance_Ulduar"],
				classicPhase = 2,
				classicOnly = true,
				boss1 = {
					name = L["Instances_Other"], --Dwarfageddon 25 Man
					bossIDs = {33572},
					achievement = 3098,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:Dwarfageddon(3098) end,
					partial = true,
					displayInfoFrame = true,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --Unbroken 25 Man
					bossIDs = {},
					achievement = 2906,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 1637, --Flame Leviathan (Three Car Garage) 25 Man
					bossIDs = {},
					achievement = 2908,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss4 = {
					name = 1637, --Flame Leviathan (Take Out Those Turrets) 25 Man
					bossIDs = {},
					achievement = 2910,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FlameLeviathanTakeOutThoseTurrets(2910) end,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss5 = {
					name = 1637, --Flame Leviathan (Shutout) 25 Man
					bossIDs = {},
					achievement = 2912,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FlameLeviathanShutout(2912) end,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss6 = {
					name = 1637, --Flame Leviathan (Orbital Bombardment) 25 Man
					bossIDs = {},
					achievement = 2918,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss7 = {
					name = 1637, --Flame Leviathan (Orbital Devastation) 25 Man
					bossIDs = {},
					achievement = 2916,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss8 = {
					name = 1637, --Flame Leviathan (Nuked from Orbit) 25 Man
					bossIDs = {},
					achievement = 2917,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss9 = {
					name = 1637, --Flame Leviathan (Orbit-uary) 25 Man
					bossIDs = {},
					achievement = 3057,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1132,
					nameWrath = L["Boss_FlameLeviathan"],
				},
				boss10 = {
					name = 1639, --Razorscale (A Quick Shave) 25 Man
					bossIDs = {},
					achievement = 2921,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:RazorscaleAQuickShave(2921) end,
					partial = false,
					encounterID = 1139,
					nameWrath = L["Boss_Razorscale"],
				},
				boss11 = {
					name = 1639, --Razorscale (Iron Dwarf, Medium Rare) 25 Man
					bossIDs = {},
					achievement = 2924,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:RazorscaleIronDwarfMediumRare(2924) end,
					partial = false,
					encounterID = 1139,
					nameWrath = L["Boss_Razorscale"],
				},
				boss12 = {
					name = 1638, --Ignis the Furnace Master (Shattered) 25 Man
					bossIDs = {},
					achievement = 2926,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:IgnisTheFurnaceMasterShattered(2926) end,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss13 = {
					name = 1638, --Ignis the Furnace Master (Hot Pocket) 25 Man
					bossIDs = {},
					achievement = 2928,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss14 = {
					name = 1638, --Ignis the Furnace Master (Stokin' the Furnace) 25 Man
					bossIDs = {},
					achievement = 2929,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:IgnisTheFurnaceMasterStokinTheFurnace(2929) end,
					partial = false,
					encounterID = 1136,
					nameWrath = L["Boss_IgnisTheFurnaceMaster"],
				},
				boss15 = {
					name = 1640, --XT-002 Deconstructor (Nerf Engineering) 25 Man
					bossIDs = {},
					achievement = 2932,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfEngineering(2932) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss16 = {
					name = 1640, --XT-002 Deconstructor (Nerf Scrapbots) 25 Man
					bossIDs = {},
					achievement = 2935,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfScrapbots(2935) end,
					partial = false,
					encounterID = 1142,
					displayInfoFrame = true,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss17 = {
					name = 1640, --XT-002 Deconstructor (Nerf Gravity Bombs) 25 Man
					bossIDs = {},
					achievement = 2936,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorNerfGravityBombs(2936) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss18 = {
					name = 1640, --XT-002 Deconstructor (Must Deconstruct Faster) 25 Man
					bossIDs = {},
					achievement = 2938,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorMustDeconstructFaster(2938) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss19 = {
					name = 1640, --XT-002 Deconstructor (Heartbreaker) 25 Man
					bossIDs = {},
					achievement = 3059,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:XT002DeconstructorHeartbreaker(3059) end,
					partial = false,
					encounterID = 1142,
					nameWrath = L["Boss_XT-002Deconstructor"],
				},
				boss20 = {
					name = 1641, --Assembly of Iron (I Choose You, Runemaster Molgeim) 25 Man
					bossIDs = {},
					achievement = 2942,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouRunemasterMolgeim(2942) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss21 = {
					name = 1641, --Assembly of Iron (I Choose You, Stormcaller Brundir) 25 Man
					bossIDs = {},
					achievement = 2943,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouStormcallerBrundir(2943) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss22 = {
					name = 1641, --Assembly of Iron (I Choose You, Steelbreaker) 25 Man
					bossIDs = {},
					achievement = 2944,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronIChooseYouSteelbreaker(2944) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss23 = {
					name = 1641, --Assembly of Iron (But I'm On Your Side) 25 Man
					bossIDs = {},
					achievement = 2946,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss24 = {
					name = 1641, --Assembly of Iron (Can't Do That While Stunned) 25 Man
					bossIDs = {},
					achievement = 2948,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AssemblyOfIronCantDoThatWhileStunned(2948) end,
					partial = false,
					encounterID = 1140,
					nameWrath = L["Boss_AssemblyOfIron"],
				},
				boss25 = {
					name = 1642, --Kologarn (With Open Arms) 25 Man
					bossIDs = {},
					achievement = 2952,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnWithOpenArms(2952) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss26 = {
					name = 1642, --Kologarn (Disarmed) 25 Man
					bossIDs = {},
					achievement = 2954,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss27 = {
					name = 1642, --Kologarn (If Looks Could Kill) 25 Man
					bossIDs = {},
					achievement = 2956,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnIfLooksCouldKill(2956) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss28 = {
					name = 1642, --Kologarn (Rubble and Roll) 25 Man
					bossIDs = {},
					achievement = 2960,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KologarnRubbleAndRoll(2960) end,
					partial = false,
					encounterID = 1137,
					nameWrath = L["Boss_Kologarn"],
				},
				boss29 = {
					name = 1643, --Auriaya (Crazy Cat Lady) 25 Man
					bossIDs = {},
					achievement = 3007,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AuriayaCrazyCatLady(3007) end,
					partial = false,
					encounterID = 1131,
					nameWrath = L["Boss_Auriaya"],
				},
				boss30 = {
					name = 1643, --Auriaya (Nine Lives) 25 Man
					bossIDs = {},
					achievement = 3077,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:AuriayaNineLives(3077) end,
					partial = false,
					encounterID = 1131,
					nameWrath = L["Boss_Auriaya"],
				},
				boss31 = {
					name = 1644, --Hodir (Cheese the Freeze) 25 Man
					bossIDs = {},
					achievement = 2962,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirCheeseTheFreeze(2962) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss32 = {
					name = 1644, --Hodir (I Have the Coolest Friends) 25 Man
					bossIDs = {},
					achievement = 2965,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirIHaveTheCoolestFriends(2965) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss33 = {
					name = 1644, --Hodir (Getting Cold in Here) 25 Man
					bossIDs = {},
					achievement = 2968,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirGettingColdInHere(2968) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss34 = {
					name = 1644, --Hodir (I Could Say That This Cache Was Rare) 25 Man
					bossIDs = {},
					achievement = 3184,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HodirICouldSayThatThisCacheWasRare(3184) end,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss35 = {
					name = 1644, --Hodir (Staying Buffed All Winter) 25 Man
					bossIDs = {},
					achievement = 2970,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1135,
					nameWrath = L["Boss_Hodir"],
				},
				boss36 = {
					name = 1645, --Thorim (Don't Stand in the Lightning) 25 Man
					bossIDs = {},
					achievement = 2972,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:ThorimDontStandInTheLightning(2972) end,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss37 = {
					name = 1645, --Thorim (I'll Take You All On) 25 Man
					bossIDs = {},
					achievement = 2974,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss38 = {
					name = 1645, --Thorim (Who Needs Bloodlust?) 25 Man
					bossIDs = {},
					achievement = 2976,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss39 = {
					name = 1645, --Thorim (Siffed) 25 Man
					bossIDs = {},
					achievement = 2978,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss40 = {
					name = 1645, --Thorim (Lose Your Illusion) 25 Man
					bossIDs = {},
					achievement = 3183,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1141,
					nameWrath = L["Boss_Thorim"],
				},
				boss41 = {
					name = L["Instances_Other"], --Lumberjacked 25 Man
					bossIDs = {32914, 32913, 32915},
					achievement = 3118,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaLumberjacked(12360) end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss42 = {
					name = 1646, --Freya (Con-speed-atory) 25 Man
					bossIDs = {32906, 33430, 33431, 33528, 33527, 33526, 33525, 32914, 32913, 33354, 33355, 32915},
					achievement = 2981,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaConSpeedAtory(753) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss43 = {
					name = 1646, --Freya (Deforestation) 25 Man
					bossIDs = {},
					achievement = 2984,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaDeforestation(2984) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss44 = {
					name = 1646, --Freya (Getting Back to Nature) 25 Man
					bossIDs = {},
					achievement = 2983,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:FreyaGettingBackToNature(2983) end,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss45 = {
					name = 1646, --Freya (Knock on Wood) 25 Man
					bossIDs = {},
					achievement = 3185,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss46 = {
					name = 1646, --Freya (Knock, Knock on Wood) 25 Man
					bossIDs = {},
					achievement = 3186,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss47 = {
					name = 1646, --Freya (Knock, Knock, Knock on Wood) 25 Man
					bossIDs = {},
					achievement = 3187,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1133,
					nameWrath = L["Boss_Freya"],
				},
				boss48 = {
					name = 1647, --Mimiron (Set Up Us the Bomb) 25 Man
					bossIDs = {},
					achievement = 3237,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:MimironSetUpUsTheBomb(3237) end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss49 = {
					name = 1647, --Mimiron (Not-So-Friendly Fire) 25 Man
					bossIDs = {},
					achievement = 2995,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:MimironNotSoFriendlyFire(2995) end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss50 = {
					name = 1647, --Mimiron (Firefighter) 25 Man
					bossIDs = {},
					achievement = 3189,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1138,
					nameWrath = L["Boss_Mimiron"],
				},
				boss51 = {
					name = 1648, --General Vezax (Shadowdodger) 25 Man
					bossIDs = {},
					achievement = 2997,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:Shadowdodger(2997) end,
					partial = false,
					encounterID = 1134,
					nameWrath = L["Boss_GeneralVezax"],
				},
				boss52 = {
					name = 1648, --General Vezax (I Love the Smell of Saronite in the Morning) 25 Man
					bossIDs = {},
					achievement = 3188,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:ILoveTheSmellOfSaroniteInTheMorning(3188) end,
					partial = false,
					encounterID = 1134,
					nameWrath = L["Boss_GeneralVezax"],
				},
				boss53 = {
					name = 1649, --Yogg-Saron 1 (Kiss and Make Up) 25 Man
					bossIDs = {},
					achievement = 3011,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:KissAndMakeUp(3011) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron1"],
				},
				boss54 = {
					name = 1649, --Yogg-Saron 2 (Three Lights in the Darkness) 25 Man
					bossIDs = {},
					achievement = 3161,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron2"],
				},
				boss55 = {
					name = 1649, --Yogg-Saron 3 (Two Lights in the Darkness) 25 Man
					bossIDs = {},
					achievement = 3162,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron3"],
				},
				boss56 = {
					name = 1649, --Yogg-Saron 4 (One Light in the Darkness 25 Man)
					bossIDs = {},
					achievement = 3163,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron4"],
				},
				boss57 = {
					name = 1649, --Yogg-Saron 5 (Alone in the Darkness) 25 Man
					bossIDs = {},
					achievement = 3164,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron5"],
				},
				boss58 = {
					name = 1649, --Yogg-Saron 6 (Drive Me Crazy) 25 Man
					bossIDs = {},
					achievement = 3010,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:DriveMeCrazy(3010) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron6"],
				},
				boss59 = {
					name = 1649, --Yogg-Saron 7 (He's Not Getting Any Older) 25 Man
					bossIDs = {},
					achievement = 3013,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:HesNotGettingAnyOlder(3013) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron7"],
				},
				boss60 = {
					name = 1649, --Yogg-Saron 8 (They're Coming Out of the Walls) 25 Man
					bossIDs = {},
					achievement = 3017,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._603:TheyreComingOutOfTheWalls(3017) end,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron8"],
				},
				boss61 = {
					name = 1649, --Yogg-Saron 9 (In His House He Waits Dreaming) 25 Man
					bossIDs = {},
					achievement = 3016,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1143,
					nameWrath = L["Boss_Yogg-Saron9"],
				},
				boss62 = {
					name = 1650, --Algalon the Observer (Supermassive) 25 Man
					bossIDs = {},
					achievement = 3002,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1130,
					nameWrath = L["Boss_AlgalonTheObserver"],
				},
			},

			[533.10] = { --Naxxramas 10 Man
				name = 754,
				nameLocalised = L["Instance_Naxxramas"],
				classicPhase = 1,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME70
					bossIDs = {},
					achievement = 578,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Naxxramas_TheDedicatedFew"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 1603, --Maexxna
					bossIDs = {15956,15952},
					achievement = 1858,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1116,
					nameWrath = L["Boss_Maexxna"],
				},
				boss3 = {
					name = 1610, --Patchwerk
					bossIDs = {16028},
					achievement = 1856,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Naxxramas_Classic_Patchwerk"] },
						},
					},
					enabled = true,
					track = function() core._533:Patchwerk() end,
					partial = false,
					encounterID = 1118,
					displayInfoFrame = true,
					nameWrath = L["Boss_Patchwerk"],
				},
				boss4 = {
					name = 1605, --Heigan the Unclean
					bossIDs = {15936},
					achievement = 1996,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:HeiganTheUnclean() end,
					partial = false,
					encounterID = 1112,
					nameWrath = L["Boss_HeiganTheUnclean"],
				},
				boss5 = {
					name = 1602, --Grand Widow Faerlina
					bossIDs = {15953},
					achievement = 1997,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:GrandWidowFaerlina() end,
					partial = false,
					encounterID = 1110,
					nameWrath = L["Boss_GrandWidowFaerlina"],
				},
				boss6 = {
					name = 1613, --Thaddius
					bossIDs = {15928,15930,15929},
					achievement = 2178,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Shocking() end,
					partial = false,
					encounterID = 1120,
					nameWrath = L["Boss_Thaddius"],
				},
				boss7 = {
					name = 1613, --Thaddius
					bossIDs = {15928,15930,15929},
					achievement = 2180,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Subtraction() end,
					partial = false,
					encounterID = 1120,
					nameWrath = L["Boss_Thaddius"],
				},
				boss8 = {
					name = 1606, --Loatheb
					bossIDs = {16011},
					achievement = 2182,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Loatheb() end,
					partial = false,
					encounterID = 1115,
					nameWrath = L["Boss_Loatheb"],
				},
				boss9 = {
					name = 1609, --Four Horsemen
					bossIDs = {16063,16064,16065,30549},
					achievement = 2176,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:FourHorsemen() end,
					partial = false,
					encounterID = 1121,
					displayInfoFrame = true,
					nameWrath = L["Boss_TheFourHorsemen"],
				},
				boss10 = {
					name = 1614, --Sapphiron
					bossIDs = {},
					achievement = 2146,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Sapphiron() end,
					partial = false,
					encounterID = 1119,
					displayInfoFrame = true,
					nameWrath = L["Boss_Sapphiron"],
				},
				boss11 = {
					name = 1615, --Kel'Thuzad
					bossIDs = {23562,23563,23561,16427,16429,16428},
					achievement = 2184,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:KelThuzad() end,
					partial = false,
					encounterID = 1114,
					nameWrath = L["Boss_KelThuzad"],
				},
			},

			[533.25] = { --Naxxramas 25 Man
				name = 754,
				nameLocalised = L["Instance_Naxxramas"],
				classicPhase = 1,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME71
					bossIDs = {},
					achievement = 579,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Naxxramas_TheDedicatedFew"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 1603, --Maexxna
					bossIDs = {15956,15952},
					achievement = 1859,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1116,
					nameWrath = L["Boss_Maexxna"],
				},
				boss3 = {
					name = 1610, --Patchwerk
					bossIDs = {16028},
					achievement = 1857,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Naxxramas_Classic_Patchwerk"] },
						},
					},
					enabled = true,
					track = function() core._533:Patchwerk() end,
					partial = false,
					encounterID = 1118,
					displayInfoFrame = true,
					nameWrath = L["Boss_Patchwerk"],
				},
				boss4 = {
					name = 1605, --Heigan the Unclean
					bossIDs = {15936},
					achievement = 2139,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:HeiganTheUnclean() end,
					partial = false,
					encounterID = 1112,
					nameWrath = L["Boss_HeiganTheUnclean"],
				},
				boss5 = {
					name = 1602, --Grand Widow Faerlina
					bossIDs = {15953},
					achievement = 2140,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:GrandWidowFaerlina() end,
					partial = false,
					encounterID = 1110,
					nameWrath = L["Boss_GrandWidowFaerlina"],
				},
				boss6 = {
					name = 1613, --Thaddius
					bossIDs = {15928,15930,15929},
					achievement = 2179,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Shocking() end,
					partial = false,
					encounterID = 1120,
					nameWrath = L["Boss_Thaddius"],
				},
				boss7 = {
					name = 1613, --Thaddius
					bossIDs = {15928,15930,15929},
					achievement = 2181,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Subtraction() end,
					partial = false,
					encounterID = 1120,
					nameWrath = L["Boss_Thaddius"],
				},
				boss8 = {
					name = 1606, --Loatheb
					bossIDs = {16011},
					achievement = 2183,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Loatheb() end,
					partial = false,
					encounterID = 1115,
					nameWrath = L["Boss_Loatheb"],
				},
				boss9 = {
					name = 1609, --Four Horsemen
					bossIDs = {16063,16064,16065,30549},
					achievement = 2177,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:FourHorsemen() end,
					partial = false,
					encounterID = 1121,
					displayInfoFrame = true,
					nameWrath = L["Boss_TheFourHorsemen"],
				},
				boss10 = {
					name = 1614, --Sapphiron
					bossIDs = {},
					achievement = 2147,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:Sapphiron() end,
					partial = false,
					encounterID = 1119,
					displayInfoFrame = true,
					nameWrath = L["Boss_Sapphiron"],
				},
				boss11 = {
					name = 1615, --Kel'Thuzad
					bossIDs = {23562,23563,23561,16427,16429,16428},
					achievement = 2185,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._533:KelThuzad() end,
					partial = false,
					encounterID = 1114,
					nameWrath = L["Boss_KelThuzad"],
				},
			},

			[631.10] = { --Icecrown Citadel 10 Man
				name = 758,
				nameLocalised = L["Instance_IcecrownCitadel"],
				classicPhase = 4,
				boss1 = {
					name = 1624, --Lord Marrowgar
					bossIDs = {36612},
					achievement = 4534,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:LordMarrowgar() end,
					partial = false,
					encounterID = 1101,
					nameWrath = L["Boss_LordMarrowgar"],
				},
				boss2 = {
					name = 1625, --Lady Deathwhisper
					bossIDs = {36855},
					achievement = 4535,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:LadyDeathwhisper() end,
					partial = false,
					encounterID = 1100,
					nameWrath = L["Boss_LadyDeathwhisper"],
				},
				boss3 = {
					name = 1626, --Gunship Battle
					bossIDs = {37215},
					achievement = 4536,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1099,
					nameWrath = L["Boss_GunshipBattle"],
				},
				boss4 = {
					name = 1628, --Deathbringer Saurfang
					bossIDs = {37813},
					achievement = 4537,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:DeathbringerSaurfang() end,
					partial = false,
					encounterID = 1096,
					nameWrath = L["Boss_DeathbringerSaurfang"],
				},
				boss5 = {
					name = 1629, --Festergut
					bossIDs = {36626},
					achievement = 4577,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:Festergut() end,
					partial = false,
					encounterID = 1097,
					nameWrath = L["Boss_Festergut"],
				},
				boss6 = {
					name = 1630, --Rotface
					bossIDs = {36627},
					achievement = 4538,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:Rotface() end,
					partial = false,
					encounterID = 1104,
					nameWrath = L["Boss_Rotface"],
				},
				boss7 = {
					name = 1631, --Professor Putricide
					bossIDs = {36678},
					achievement = 4578,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:ProfessorPutricide() end,
					partial = false,
					encounterID = 1102,
					nameWrath = L["Boss_PrOfessorPutricide"],
				},
				boss8 = {
					name = 1634, --Valithria Dreamwalker
					bossIDs = {36789},
					achievement = 4579,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1098,
					nameWrath = L["Boss_ValithriaDreamwalker"],
				},
				boss9 = {
					name = 1635, --Sindragosa
					bossIDs = {36853},
					achievement = 4580,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:Sindragosa() end,
					partial = false,
					encounterID = 1105,
					nameWrath = L["Boss_Sindragosa"],
				},
				boss10 = {
					name = 1632, --Blood Prince Council
					bossIDs = {37970},
					achievement = 4582,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1095,
					nameWrath = L["Boss_BloodPrinceCouncil"],
				},
				boss11 = {
					name = 1633, --Blood-Queen Lana'thel
					bossIDs = {37955},
					achievement = 4539,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1103,
					nameWrath = L["Boss_Blood-QueenLanaThel"],
				},
				boss12 = {
					name = 1636, --The Lich King
					bossIDs = {36597},
					achievement = 4601,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1106,
					nameWrath = L["Boss_TheLichKing"],
				},
				boss13 = {
					name = 1636, --The Lich King
					bossIDs = {},
					achievement = 4581,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1106,
					nameWrath = L["Boss_TheLichKing"],
				},
			},

			[631.25] = { --Icecrown Citadel 25 Man
				name = 758,
				nameLocalised = L["Instance_IcecrownCitadel"],
				classicPhase = 4,
				boss1 = {
					name = 1624, --Lord Marrowgar
					bossIDs = {36612},
					achievement = 4610,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:LordMarrowgar() end,
					partial = false,
					encounterID = 1101,
					nameWrath = L["Boss_LordMarrowgar"],
				},
				boss2 = {
					name = 1625, --Lady Deathwhisper
					bossIDs = {36855},
					achievement = 4611,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:LadyDeathwhisper() end,
					partial = false,
					encounterID = 1100,
					nameWrath = L["Boss_LadyDeathwhisper"],
				},
				boss3 = {
					name = 1626, --Gunship Battle
					bossIDs = {37215},
					achievement = 4612,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1099,
					nameWrath = L["Boss_GunshipBattle"],
				},
				boss4 = {
					name = 1628, --Deathbringer Saurfang
					bossIDs = {37813},
					achievement = 4613,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:DeathbringerSaurfang() end,
					partial = false,
					encounterID = 1096,
					nameWrath = L["Boss_DeathbringerSaurfang"],
				},
				boss5 = {
					name = 1629, --Festergut
					bossIDs = {36626},
					achievement = 4615,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:Festergut() end,
					partial = false,
					encounterID = 1097,
					nameWrath = L["Boss_Festergut"],
				},
				boss6 = {
					name = 1630, --Rotface
					bossIDs = {36627},
					achievement = 4614,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:Rotface() end,
					partial = false,
					encounterID = 1104,
					nameWrath = L["Boss_Rotface"],
				},
				boss7 = {
					name = 1631, --Professor Putricide
					bossIDs = {36678},
					achievement = 4616,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:ProfessorPutricide() end,
					partial = false,
					encounterID = 1102,
					nameWrath = L["Boss_PrOfessorPutricide"],
				},
				boss8 = {
					name = 1634, --Valithria Dreamwalker
					bossIDs = {36789},
					achievement = 4619,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1098,
					nameWrath = L["Boss_ValithriaDreamwalker"],
				},
				boss9 = {
					name = 1635, --Sindragosa
					bossIDs = {36853},
					achievement = 4620,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._631:Sindragosa() end,
					partial = false,
					encounterID = 1105,
					nameWrath = L["Boss_Sindragosa"],
				},
				boss10 = {
					name = 1632, --Blood Prince Council
					bossIDs = {37970},
					achievement = 4617,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1095,
					nameWrath = L["Boss_BloodPrinceCouncil"],
				},
				boss11 = {
					name = 1633, --Blood-Queen Lana'thel
					bossIDs = {37955},
					achievement = 4618,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1103,
					nameWrath = L["Boss_Blood-QueenLanaThel"],
				},
				boss12 = {
					name = 1636, --The Lich King
					bossIDs = {36597},
					achievement = 4621,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1106,
					nameWrath = L["Boss_TheLichKing"],
				},
				boss13 = {
					name = 1636, --The Lich King
					bossIDs = {},
					achievement = 4622,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1106,
					nameWrath = L["Boss_TheLichKing"],
				},
			},
		},

		Dungeons = {
			[574] = { --Utgarde Keep
				name = 285,
				nameLocalised = L["Instance_UtgardeKeep"],
				classicPhase = 1,
				boss1 = {
					name = 638, --Prince Keleseth
					bossIDs = {23953},
					achievement = 1919,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["UtgardeKeep_Classic_PrinceKeleseth"] },
						},
					},
					enabled = true,
					track = function() core._574:PrinceKeleseth() end,
					partial = false,
					encounterID = 2026,
					nameWrath = L["Boss_PrinceKeleseth"],
				},
			},

			[576] = { --The Nexus
				name = 281,
				nameLocalised = L["Instance_TheNexus"],
				classicPhase = 1,
				boss1 = {
					name = 618, --Grand Magus Telestra
					bossIDs = {26731},
					achievement = 2150,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["TheNexus_Classic_GrandMagusTelestra"] },
						},
					},
					enabled = true,
					track = function() core._576:GrandMagusTelestra() end,
					partial = false,
					nameWrath = L["Boss_GrandMagusTelestra"],
				},
				boss2 = {
					name = 619, --Anomalus
					bossIDs = {26763},
					achievement = 2037,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["TheNexus_Classic_Anomalus"] },
						},
					},
					enabled = true,
					track = function() core._576:Anomalus() end,
					partial = false,
					nameWrath = L["Boss_Anomalus"],
				},
				boss3 = {
					name = 621, --Keristrasza
					bossIDs = {26723},
					achievement = 2036,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["TheNexus_Classic_Keristasza"] },
						},
					},
					enabled = true,
					track = function() core._576:Keristrasza() end,
					partial = false,
					nameWrath = L["Boss_Keristasza"],
				},
			},

			[595] = { --The Culling of Stratholme
				name = 279,
				nameLocalised = L["Instance_TheCullingOfStratholme"],
				classicPhase = 1,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME72
					bossIDs = {27737},
					achievement = 1872,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._595:ZombieFest() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME73
					bossIDs = {},
					achievement = 1817,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheCullingOfStratholme_Other2"], "IAT_26533", "IAT_32273", "IAT_26533") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[601] = { --Azjol Nerub
				name = 272,
				nameLocalised = L["Instance_AzjolNerub"],
				classicPhase = 1,
				boss1 = {
					name = 585, --Krik'thir the Gatewatcher
					bossIDs = {},
					achievement = 1296,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["AzjolNerub_Classic_KrikthirTheGatewatcher"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1971,
					nameWrath = L["Boss_KrikthirTheGatewatcher"],
				},
				boss2 = {
					name = 586, --Hadronox
					bossIDs = {},
					achievement = 1297,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1972,
					nameWrath = L["Boss_Hadronox"],
				},
				boss3 = {
					name = 587, --Anub'arak
					bossIDs = {29120},
					achievement = 1860,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["AzjolNerub_Classic_Anubarak"] },
						},
					},
					enabled = true,
					track = function() core._601:Anubarak() end,
					partial = false,
					encounterID = 1973,
					nameWrath = L["Boss_Anubarak"],
				},
			},

			[619] = { --Ahn'Kahet The Old Kingdom
				name = 271,
				nameLocalised = L["Instance_AhnkahetTheOldKingdom"],
				classicPhase = 1,
				boss1 = {
					name = 580, --Elder Nadox
					bossIDs = {29309},
					achievement = 2038,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["AhnkahetTheOldKingdom_Classic_ElderNadox"] },
						},
					},
					enabled = true,
					track = function() core._619:ElderNadox() end,
					partial = false,
					encounterID = 1969,
					nameWrath = L["Boss_ElderNadox"],
				},
				boss2 = {
					name = 582, --Jedoga Shadowseeker
					bossIDs = {29310},
					achievement = 2056,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["AhnkahetTheOldKingdom_Classic_JedogaShadowseeker"] },
						},
					},
					enabled = true,
					track = function() core._619:JedogaShadowseeker() end,
					partial = false,
					encounterID = 1967,
					nameWrath = L["Boss_JedogaShadowseeker"],
				},
				boss3 = {
					name = 584, --Herald Volazj
					bossIDs = {29311},
					achievement = 1862,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["AhnkahetTheOldKingdom_Classic_HeraldVolazj"] },
						},
					},
					enabled = true,
					track = function() core._619:HeraldVolazj() end,
					partial = false,
					encounterID = 1968,
					nameWrath = L["Boss_HeraldVolazj"],
				},
			},

			[600] = { --Dark Tharon Keep
				name = 273,
				nameLocalised = L["Instance_DrakTharonKeep"],
				classicPhase = 1,
				boss1 = {
					name = 588, --Trollgore
					bossIDs = {26630},
					achievement = 2151,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["DrakTharonKeep_Classic_Trollgore"] },
						},
					},
					enabled = true,
					track = function() core._600:Trollgore() end,
					partial = false,
					encounterID = 1974,
					nameWrath = L["Boss_Trollgore"],
				},
				boss2 = {
					name = 589, --Novos the Summoner
					bossIDs = {},
					achievement = 2057,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["DrakTharonKeep_Classic_NovosTheSummoner"], "IAT_26627") },
						},
					},
					enabled = true,
					track = function() core._600:NovosTheSummoner() end,
					partial = false,
					encounterID = 1976,
					nameWrath = L["Boss_NovosTheSummoner"],
				},
				boss3 = {
					name = 590, --King Dred
					bossIDs = {27483},
					achievement = 2039,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["DrakTharonKeep_Classic_KingDred"], "IAT_27483", "IAT_26641", "IAT_26628", "IAT_27483", "IAT_27483", "IAT_27483", C_Spell.GetSpellLink(36922)) },
						},
					},
					enabled = true,
					track = function() core._600:KingDred() end,
					partial = false,
					encounterID = 1977,
					nameWrath = L["Boss_KingDred"],
				},
			},

			[608] = { --Violet Hold
				name = 283,
				nameLocalised = L["Instance_TheVioletHold"],
				classicPhase = 1,
				boss1 = {
					name = 632, --Cyanigosa
					bossIDs = {},
					achievement = 1816,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["VioletHold_Cyanigosa"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 2020,
					nameWrath = L["Boss_Cyanigosa"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME74
					bossIDs = {},
					achievement = 1865,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["VioletHold_Other"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 628, --Ichoron
					bossIDs = {},
					achievement = 2041,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["TheVioletHold_Classic_Ichoron"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Boss_Ichoron"],
				},
				boss4 = {
					name = 631, --Zuramat the Obliterator
					bossIDs = {29314},
					achievement = 2153,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["TheVioletHold_Classic_ZuramatTheObliterator"] },
						},
					},
					enabled = true,
					track = function() core._608:ZuramatTheObliterator() end,
					partial = false,
					nameWrath = L["Boss_ZuramatTheObliterator"],
				},
			},

			[604] = { --Gundrak
				name = 274,
				nameLocalised = L["Instance_Gundrak"],
				classicPhase = 1,
				boss1 = {
					name = 592, --Slad'ran
					bossIDs = {29304},
					achievement = 2058,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Gundrak_Classic_Sladran"] },
						},
					},
					enabled = true,
					track = function() core._604:Sladran() end,
					partial = false,
					encounterID = 1978,
					nameWrath = L["Boss_Sladran"],
				},
				boss2 = {
					name = 594, --Moorabi
					bossIDs = {29305},
					achievement = 2040,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Gundrak_Classic_Moorabi"] },
						},
					},
					enabled = true,
					track = function() core._604:Moorabi() end,
					partial = false,
					encounterID = 1980,
					nameWrath = L["Boss_Moorabi"],
				},
				boss3 = {
					name = 596, --Gal'darah
					bossIDs = {},
					achievement = 1864,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["Gundrak_Classic_Galdarah"], "IAT_29932", "IAT_29932", "IAT_29932", "IAT_29306", "IAT_29306", C_Spell.GetSpellLink(55814), C_Spell.GetSpellLink(55817), C_Spell.GetSpellLink(55817)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1981,
					nameWrath = L["Boss_Galdarah"],
				},
				boss4 = {
					name = 596, --Gal'darah
					bossIDs = {29306},
					achievement = 2152,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["Gundrak_Galdarah2"], C_Spell.GetSpellLink(54956), C_Spell.GetSpellLink(54956)) },
						},
					},
					enabled = true,
					track = function() core._604:Galdarah() end,
					partial = false,
					encounterID = 1981,
					nameWrath = L["Boss_Galdarah"],
				},
			},

			[599] = { --Halls of Stone
				name = 277,
				nameLocalised = L["Instance_HallsOfStone"],
				classicPhase = 1,
				boss1 = {
					name = 605, --Maiden of Grief
					bossIDs = {27975},
					achievement = 1866,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["HallsOfStone_Classic_MaidenOfGrief"] },
						},
					},
					enabled = true,
					track = function() core._599:MaidenOfGrief() end,
					partial = false,
					encounterID = 1996,
					nameWrath = L["Boss_MaidenOfGrief"],
				},
				boss2 = {
					name = 606, --Tribunal of Ages
					bossIDs = {27983},
					achievement = 2154,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["HallsOfStone_Classic_TribunalOfAges"] },
						},
					},
					enabled = true,
					track = function() core._599:TribunalOfAges() end,
					partial = false,
					encounterID = 1995,
					nameWrath = L["Boss_TribunalOfAges"],
				},
				boss3 = {
					name = 607, --Sjonnir The Ironshaper
					bossIDs = {27978},
					achievement = 2155,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfStone_Classic_SjonnirTheIronshaper"], "IAT_27981", "IAT_27981", "IAT_28165", "IAT_28165", "IAT_28165", "IAT_27981") },
						},
					},
					enabled = true,
					track = function() core._599:SjonnirTheIronshaper() end,
					partial = false,
					encounterID = 1998,
					nameWrath = L["Boss_SjonnirTheIronshaper"],
				},
			},

			[602] = { --Halls of Lightning
				name = 275,
				nameLocalised = L["Instance_HallsOfLightning"],
				classicPhase = 1,
				boss1 = {
					name = 597, --General Bjarngrim
					bossIDs = {28586},
					achievement = 1834,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["HallsOfLightning_Classic_GeneralBjarngrim"] },
						},
					},
					enabled = true,
					track = function() core._602:GeneralBjarngrim() end,
					partial = false,
					encounterID = 1987,
					nameWrath = L["Boss_GeneralBjarngrim"],
				},
				boss2 = {
					name = 598, --Volkhan
					bossIDs = {28587},
					achievement = 2042,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["HallsOfLightning_Classic_Volkhan"] },
						},
					},
					enabled = true,
					track = function() core._602:Volkhan() end,
					partial = false,
					encounterID = 1985,
					nameWrath = L["Boss_Volkhan"],
				},
				boss3 = {
					name = 600, --Loken
					bossIDs = {28923},
					achievement = 1867,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["HallsOfLightning_Classic_Loken"] },
						},
					},
					enabled = true,
					track = function() core._602:Loken() end,
					partial = false,
					encounterID = 1986,
					nameWrath = L["Boss_Loken"],
				},
			},

			[578] = { --The Oculus
				name = 282,
				nameLocalised = L["Instance_TheOculus"],
				classicPhase = 1,
				boss1 = {
					name = 625, --Ley-Guardian Eregos
					bossIDs = {},
					achievement = 1871,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheOculus_LeyGuardianEregos1"], "IAT_27654", "IAT_27654", "IAT_27654", "IAT_27658", "IAT_27658", "IAT_27658", "IAT_27756", "IAT_27756") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2013,
					nameWrath = L["Boss_Ley-GuardianEregos"],
				},
				boss2 = {
					name = 625, --Ley-Guardian Eregos
					bossIDs = {},
					achievement = 1868,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 2013,
					nameWrath = L["Boss_Ley-GuardianEregos"],
				},
				boss3 = {
					name = 625, --Ley-Guardian Eregos
					bossIDs = {},
					achievement = 2044,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2013,
					nameWrath = L["Boss_Ley-GuardianEregos"],
				},
				boss4 = {
					name = 625, --Ley-Guardian Eregos
					bossIDs = {},
					achievement = 2045,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2013,
					nameWrath = L["Boss_Ley-GuardianEregos"],
				},
				boss5 = {
					name = 625, --Ley-Guardian Eregos
					bossIDs = {},
					achievement = 2046,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2013,
					nameWrath = L["Boss_Ley-GuardianEregos"],
				},
			},

			[575] = { --Utgarde Pinnacle
				name = 286,
				nameLocalised = L["Instance_UtgardePinnacle"],
				classicPhase = 1,
				boss1 = {
					name = 641, --Svala Sorrowgrave
					bossIDs = {},
					achievement = 2043,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["UtgardePinnacle_Classic_SvalaSorrowgrave"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2030,
					nameWrath = L["Boss_SvalaSorrowgrave"],
				},
				boss2 = {
					name = 643, --Skadi the Ruthless
					bossIDs = {26690, 26693},
					achievement = 1873,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["UtgardePinnacle_Classic_SkadiTheRuthless"] },
						},
					},
					enabled = true,
					track = function() core._575:SkadiTheRuthless() end,
					partial = false,
					encounterID = 2029,
					nameWrath = L["Boss_SkadiTheRuthless"],
				},
				boss3 = {
					name = 643, --Skadi the Ruthless
					bossIDs = {},
					achievement = 2156,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["UtgardePinnacle_Classic_SkadiTheRuthless2"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2029,
					nameWrath = L["Boss_SkadiTheRuthless"],
				},
				boss4 = {
					name = 644, --King Ymiron
					bossIDs = {26861},
					achievement = 2157,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["UtgardePinnacle_Classic_KingYmiron"] },
						},
					},
					enabled = true,
					track = function() core._575:KingYmiron() end,
					partial = false,
					encounterID = 2028,
					nameWrath = L["Boss_KingYmiron"],
				},
			},

			[650] = { --Trial of the Champion
				name = 284,
				nameLocalised = L["Instance_TrialOfTheChampion"],
				classicPhase = 3,
				boss1 = {
					name = 636, --Argent Confessor Paletress
					bossIDs = {},
					achievement = 3802,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Boss_ArgentConfessorPaletress"],
				},
				boss2 = {
					name = 635, --Eadric the Pure
					bossIDs = {},
					achievement = 3803,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Boss_EadricThePure"],
				},
				boss3 = {
					name = 637, --The Black Knight
					bossIDs = {35451},
					achievement = 3804,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._650:TheBlackKnight() end,
					partial = false,
					encounterID = 2021,
					nameWrath = L["Boss_TheBlackKnight"],
				},
			},

			[632] = { --The Forge of Souls
				name = 280,
				nameLocalised = L["Instance_TheForgeOfSouls"],
				classicPhase = 4,
				boss1 = {
					name = 615, --Bronjahm
					bossIDs = {36497},
					achievement = 4522,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._632:Bronjahm() end,
					partial = false,
					encounterID = 2006,
					nameWrath = L["Boss_Bronjahm"],
				},
				boss2 = {
					name = 616, --Devourer of Souls
					bossIDs = {36502},
					achievement = 4523,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._632:DevourerOfSouls() end,
					partial = false,
					encounterID = 2007,
					nameWrath = L["Boss_DevourerOfSouls"],
				},
			},

			[658] = { --Pit of Saron
				name = 278,
				nameLocalised = L["Instance_PitOfSaron"],
				classicPhase = 4,
				boss1 = {
					name = 608, --Forgemaster Garfrost
					bossIDs = {36494},
					achievement = 4524,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._658:ForgemasterGarfrost() end,
					partial = false,
					encounterID = 1999,
					nameWrath = L["Boss_ForgemasterGarfrost"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME75
					bossIDs = {},
					achievement = 4525,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[668] = { --Halls of Reflection
				name = 276,
				nameLocalised = L["Instance_HallsOfReflection"],
				classicPhase = 4,
				boss1 = {
					name = 603, --MISSINGNAME76
					bossIDs = {},
					achievement = 4526,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Boss_MISSINGNAME76"],
				},
			},
		},
	},
}
