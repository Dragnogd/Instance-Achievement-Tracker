--------------------------------------
-- Last Auto Generated: 08/06/2025 14:40:46 using https://github.com/Dragnogd/Instance-Achievement-Tracker-Database-Manager
--------------------------------------
local _, core = ...
local L = core.L
local instances = {}

core.Instances = {
	--Mists of Pandaria
	[5] = {
		Raids = {
			[996] = { --Terrace of Endless Spring
				name = 320,
				boss1 = {
					name = 683, --Protectors of the Endless
					bossIDs = {60583, 60586, 60585},
					achievement = 6717,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._996:ProtectorsOfTheEndless() end,
					partial = false,
					encounterID = 1409,
				},
				boss2 = {
					name = 742, --Tsulong
					bossIDs = {62442},
					achievement = 6933,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._996:Tsulong() end,
					partial = false,
					encounterID = 1505,
				},
				boss3 = {
					name = 729, --Lei Shi
					bossIDs = {},
					achievement = 6824,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._996:LeiShi() end,
					partial = false,
					encounterID = 1506,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 709, --Sha of Fear
					bossIDs = {60999},
					achievement = 6825,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1577,
				},
				boss2 = {
					name = 819, --Horridon
					bossIDs = {68476},
					achievement = 8038,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:Horridon() end,
					partial = false,
					encounterID = 1575,
				},
				boss3 = {
					name = 816, --Council of Elders
					bossIDs = {},
					achievement = 8073,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1570,
				},
				boss4 = {
					name = 825, --Tortos
					bossIDs = {67977},
					achievement = 8077,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:Tortos() end,
					partial = false,
					encounterID = 1565,
				},
				boss5 = {
					name = 821, --Megaera
					bossIDs = {70235, 70212, 70247},
					achievement = 8082,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:Megaera() end,
					partial = false,
					encounterID = 1578,
				},
				boss6 = {
					name = 828, --Ji-Kun
					bossIDs = {69712},
					achievement = 8097,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:JiKun() end,
					partial = false,
					encounterID = 1573,
				},
				boss7 = {
					name = 818, --Durumu the Forgotten
					bossIDs = {68036},
					achievement = 8098,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:DurumuTheForgotten() end,
					partial = false,
					encounterID = 1572,
				},
				boss8 = {
					name = 820, --Primordius
					bossIDs = {69017},
					achievement = 8037,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:Primordius() end,
					partial = false,
					encounterID = 1574,
				},
				boss9 = {
					name = 824, --Dark Animus
					bossIDs = {},
					achievement = 8081,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1576,
				},
				boss10 = {
					name = 817, --Iron Qon
					bossIDs = {68078},
					achievement = 8087,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:IronQon() end,
					partial = false,
					encounterID = 1559,
				},
				boss11 = {
					name = 829, --Twin Consorts
					bossIDs = {68905, 68904},
					achievement = 8086,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1098:TwinConsorts() end,
					partial = false,
					encounterID = 1560,
				},
				boss12 = {
					name = 832, --Lei Shen
					bossIDs = {68397},
					achievement = 8090,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:Immerseus() end,
					partial = false,
					encounterID = 1602,
				},
				boss2 = {
					name = 849, --The Fallen Protectors
					bossIDs = {71475, 71479, 71480},
					achievement = 8528,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:TheFallenProtectors() end,
					partial = false,
					encounterID = 1598,
				},
				boss3 = {
					name = 866, --Amalgam of Corruption
					bossIDs = {72276},
					achievement = 8532,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:AmalgamOfCorruption() end,
					partial = false,
					encounterID = 1624,
				},
				boss4 = {
					name = 867, --Sha of Pride
					bossIDs = {71734},
					achievement = 8521,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:ShaOfPride() end,
					partial = true,
					encounterID = 1604,
				},
				boss5 = {
					name = 881, --Galakras
					bossIDs = {72311},
					achievement = 8530,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1622,
				},
				boss6 = {
					name = 864, --Iron Juggernaut
					bossIDs = {71466},
					achievement = 8520,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1600,
				},
				boss7 = {
					name = 856, --Kor'kron Dark Shaman
					bossIDs = {},
					achievement = 8453,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1606,
				},
				boss8 = {
					name = 850, --General Nazgrim
					bossIDs = {71515},
					achievement = 8448,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:GeneralNazgrim() end,
					partial = false,
					encounterID = 1603,
				},
				boss9 = {
					name = 846, --Malkorok
					bossIDs = {71454},
					achievement = 8538,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:Malkorok() end,
					partial = false,
					encounterID = 1595,
				},
				boss10 = {
					name = 870, --Spoils of Pandaria
					bossIDs = {71385, 71398, 71383, 71397, 71405, 73951, 71409, 71388, 73948, 73949, 71380, 72535, 71392, 71433, 71378, 71395, 71393, 71408, 73723, 73724, 73725},
					achievement = 8529,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1594,
				},
				boss11 = {
					name = 851, --Thok the Bloodthirsty
					bossIDs = {}, --71529,
					achievement = 8527,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1599,
				},
				boss12 = {
					name = 865, --Siegecrafter Blackfuse
					bossIDs = {71504},
					achievement = 8543,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:SiegecrafterBlackfuse() end,
					partial = false,
					encounterID = 1601,
				},
				boss13 = {
					name = 853, --Paragons of the Klaxxi
					bossIDs = {71158, 71152, 71155, 71153, 71157, 71160, 71156, 71154, 71161},
					achievement = 8531,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:Paragons() end,
					partial = false,
					encounterID = 1593,
				},
				boss14 = {
					name = 869, --Garrosh Hellscream
					bossIDs = {71865},
					achievement = 8537,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1136:GarroshHellscream() end,
					partial = false,
					encounterID = 1623,
					displayInfoFrame = true,
				},
			},

			[1009] = { --Heart of Fear
				name = 330,
				boss1 = {
					name = 745, --Imperial Vizier Zor'lok
					bossIDs = {62980},
					achievement = 6937,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1009:ImperialVizierZorlok() end,
					partial = false,
					encounterID = 1507,
					displayInfoFrame = true,
				},
				boss2 = {
					name = 744, --Blade Lord Ta'yak
					bossIDs = {},
					achievement = 6936,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1504,
				},
				boss3 = {
					name = 713, --Garalon
					bossIDs = {62164, 63053},
					achievement = 6553,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1009:Garalon() end,
					partial = false,
					encounterID = 1463,
				},
				boss4 = {
					name = 741, --Wind Lord Mel'jarak
					bossIDs = {},
					achievement = 6683,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1498,
				},
				boss5 = {
					name = 737, --Amber-Shaper Un'sok
					bossIDs = {},
					achievement = 6518,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1009:AmberShaperUnsok() end,
					partial = false,
					encounterID = 1499,
				},
				boss6 = {
					name = 743, --Grand Empress Shek'zeer
					bossIDs = {62837},
					achievement = 6922,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1395,
				},
				boss2 = {
					name = 689, --Feng the Accursed
					bossIDs = {60009},
					achievement = 6674,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1008:FengTheAccursed() end,
					partial = false,
					encounterID = 1390,
				},
				boss3 = {
					name = 682, --Gara'jal the Spiritbinder
					bossIDs = {},
					achievement = 7056,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1434,
				},
				boss4 = {
					name = 687, --The Spirit Kings
					bossIDs = {},
					achievement = 6687,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1008:TheSpiritKings() end,
					partial = false,
					encounterID = 1436,
					displayInfoFrame = true,
				},
				boss5 = {
					name = L["Instances_Other"], --And It's Good
					bossIDs = {},
					achievement = 7933,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss6 = {
					name = 726, --Elegon
					bossIDs = {60410},
					achievement = 6686,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1008:Elegon() end,
					partial = false,
					encounterID = 1500,
				},
				boss7 = {
					name = 677, --Will of the Emperor
					bossIDs = {},
					achievement = 6455,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1008:WillOfTheEmperor() end,
					partial = false,
					encounterID = 1407,
					displayInfoFrame = true,
				},
			},
		},

		Dungeons = {
			[961] = { --Stormstout Brewery
				name = 302,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME18
					bossIDs = {},
					achievement = 6402,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 668, --Ook-Ook
					bossIDs = {56637},
					achievement = 6089,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._961:OokOok() end,
					partial = false,
					encounterID = 1412,
				},
				boss3 = {
					name = L["Instances_Other"], --How Did He Get Up There?
					bossIDs = {},
					achievement = 6400,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss4 = {
					name = 669, --Hoptallus
					bossIDs = {59426, 59460, 56718, 59459, 59461, 59551},
					achievement = 6420,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._961:Hoptallus() end,
					partial = false,
					encounterID = 1413,
				},
			},

			[1001] = { --Scarlet Halls
				name = 311,
				boss1 = {
					name = 660, --Houndmaster Braun
					bossIDs = {58876, 58674, 59309},
					achievement = 6684,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1001:HoundmasterBraun() end,
					partial = true,
					encounterID = 1422,
				},
				boss2 = {
					name = 654, --Armsmaster Harlan
					bossIDs = {58632},
					achievement = 6427,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1001:ArmsmasterHarlan() end,
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1004:ThalnosTheSoulrender() end,
					partial = false,
					encounterID = 1423,
				},
				boss2 = {
					name = 671, --Brother Korloff
					bossIDs = {},
					achievement = 6928,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1004:BrotherKorloff() end,
					partial = false,
					encounterID = 1424,
				},
				boss3 = {
					name = 674, --High Inquisitor Whitemane
					bossIDs = {60040, 3977},
					achievement = 6929,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1427,
				},
				boss2 = {
					name = 665, --Rattlegore
					bossIDs = {59153},
					achievement = 6394,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1007:Rattlegore() end,
					partial = false,
					encounterID = 1428,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME20
					bossIDs = {59368},
					achievement = 6396,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1007:Sanguinarian() end,
					partial = true,
					nameWrath = L["Instances_Other"],
				},
				boss4 = {
					name = 684, --Darkmaster Gandling
					bossIDs = {},
					achievement = 6821,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
				},
				boss5 = {
					name = L["Instances_Other"], --MISSINGNAME21
					bossIDs = {},
					achievement = 6715,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[960] = { --Temple of the Jade Serpent
				name = 313,
				boss1 = {
					name = 672, --Wise Mari
					bossIDs = {56448},
					achievement = 6460,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._960:WiseMari() end,
					partial = false,
					encounterID = 1418,
				},
				boss2 = {
					name = 335, --Sha of Doubt
					bossIDs = {56439},
					achievement = 6671,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._960:ShaOfDoubt() end,
					partial = false,
					encounterID = 1439,
				},
				boss3 = {
					name = 335, --Sha of Doubt
					bossIDs = {56439},
					achievement = 6475,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
				},
				boss2 = {
					name = 698, --Xin the Weaponmaster
					bossIDs = {61398},
					achievement = 6736,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._994.XinTheWeaponmaster() end,
					partial = false,
					encounterID = 1441,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME22
					bossIDs = {},
					achievement = 6713,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[959] = { --Shado Pan Monastery
				name = 312,
				boss1 = {
					name = 657, --Master Snowdrift
					bossIDs = {},
					achievement = 6477,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1304,
				},
				boss2 = {
					name = 685, --Sha of Violence
					bossIDs = {56719},
					achievement = 6472,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._959:ShaOfViolence() end,
					partial = false,
					encounterID = 1305,
				},
				boss3 = {
					name = 686, --Taran Zhu
					bossIDs = {56884},
					achievement = 6471,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1011:CommanderVojak() end,
					partial = true,
					encounterID = 1502,
				},
				boss2 = {
					name = 692, --General Pa'valak
					bossIDs = {61485},
					achievement = 6485,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1011:GeneralPaValak() end,
					partial = false,
					encounterID = 1447,
				},
				boss3 = {
					name = 727, --Wing Leader Ner'onok
					bossIDs = {62205},
					achievement = 6822,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._962:SaboteurKiptilak() end,
					partial = false,
					encounterID = 1397,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME23
					bossIDs = {},
					achievement = 6476,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 649, --Raigonn
					bossIDs = {56877},
					achievement = 6945,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._962:Raigonn() end,
					partial = false,
					encounterID = 1419,
				},
			},
		},

		Scenarios = {
			[1005] = { --A Brewing Storm
				name = 517,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME24
					bossIDs = {},
					achievement = 7258,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME25
					bossIDs = {},
					achievement = 7261,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 58739, --MISSINGNAME26
					bossIDs = {58739},
					achievement = 7257,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1005:BorokhulaTheDestroyer() end,
					partial = false,
				},
			},

			[1104] = { --A Little Patience
				name = 589,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME27
					bossIDs = {},
					achievement = 7989,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME28
					bossIDs = {},
					achievement = 7990,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME29
					bossIDs = {},
					achievement = 7992,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss4 = {
					name = L["Instances_Other"], --MISSINGNAME30
					bossIDs = {},
					achievement = 7993,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss5 = {
					name = L["Instances_Other"], --MISSINGNAME31
					bossIDs = {},
					achievement = 7991,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1031] = { --Arena of Annihilation
				name = 511,
				boss1 = {
					name = 63313, --MISSINGNAME32
					bossIDs = {63313},
					achievement = 7273,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1031:BeatTheHeat() end,
					partial = false,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME33
					bossIDs = {},
					achievement = 7272,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1050] = { --Assault on Zan'vess
				name = 593,
				boss1 = {
					name = 67879, --MISSINGNAME34
					bossIDs = {67879},
					achievement = 8017,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1050:CommanderTelvrak() end,
					partial = false,
				},
			},

			[1099] = { --Battle on the High Seas
				name = 652,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME35
					bossIDs = {},
					achievement = 8347,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1130] = { --Blood in the Snow
				name = 646,
				boss1 = {
					name = L["Instances_Other"], --Heed The Weed
					bossIDs = {},
					achievement = 8329,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 70544, --MISSINGNAME37
					bossIDs = {},
					achievement = 8330,
					players = {},
					tactics = {
					},
					enabled = false,
					track = false,
					partial = false,
				},
			},

			[1051] = { --Brewmoon Festival
				name = 539,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME38
					bossIDs = {},
					achievement = 6931,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME39
					bossIDs = {},
					achievement = 6930,
					players = {},
					tactics = {
					},
					enabled = false,
					track = false,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1030] = { --Crypt of Forgotten Kings
				name = 504,
				boss1 = {
					name = 61707, --MISSINGNAME40
					bossIDs = {61707},
					achievement = 7276,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1030:AbominationOfAnger1() end,
					partial = false,
				},
				boss2 = {
					name = 61707, --MISSINGNAME41
					bossIDs = {61707},
					achievement = 8368,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1030:AbominationOfAnger2() end,
					partial = false,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME42
					bossIDs = {},
					achievement = 7275,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1095] = { --Dagger in the Dark
				name = 616,
				boss1 = {
					name = 67263, --MISSINGNAME43
					bossIDs = {67263},
					achievement = 7984,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1095:DarkhatchedLizardLord() end,
					partial = false,
				},
				boss2 = {
					name = 67264, --MISSINGNAME44
					bossIDs = {},
					achievement = 7987,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
				},
				boss3 = {
					name = 67266, --MISSINGNAME45
					bossIDs = {67266},
					achievement = 7986,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
				},
			},

			[1144] = { --Dark Heart of Pandaria
				name = 647,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME46
					bossIDs = {},
					achievement = 8319,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1103] = { --Lion's Landing (Alliance)
				name = 590,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME47
					bossIDs = {},
					achievement = 8011,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --Waste Not Want Not
					bossIDs = {},
					achievement = 8012,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1102] = { --Domination Point (Horde)
				name = 595,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME49
					bossIDs = {},
					achievement = 8014,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME50
					bossIDs = {},
					achievement = 8015,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1024] = { --Greenstone Village
				name = 492,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME51
					bossIDs = {},
					achievement = 7267,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME52
					bossIDs = {},
					achievement = 7266,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1000] = { --Theramore's Fall (Alliance)
				name = 566,
				boss1 = {
					name = 64900, --MISSINGNAME53
					bossIDs = {64900},
					achievement = 7526,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1000:Gashnul() end,
					partial = false,
				},
				boss2 = {
					name = 64479, --MISSINGNAME54
					bossIDs = {64479},
					achievement = 7527,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1000:Gatecrusher() end,
					partial = false,
				},
			},

			[999] = { --Theramore's Fall (Horde)
				name = 566,
				boss1 = {
					name = 58777, --MISSINGNAME55
					bossIDs = {},
					achievement = 7529,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
				},
				boss2 = {
					name = 58787, --MISSINGNAME56
					bossIDs = {},
					achievement = 7530,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
				},
			},

			[1131] = { --Secrets of Ragefire
				name = 649,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME57
					bossIDs = {},
					achievement = 8295,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1048] = { --Unga Ingoo
				name = 499,
				boss1 = {
					name = L["Instances_Other"], --Spill No Evil
					bossIDs = {},
					achievement = 7231,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME59
					bossIDs = {},
					achievement = 7232,
					players = {},
					tactics = {
					},
					enabled = true,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 62465, --MISSINGNAME60
					bossIDs = {62465},
					achievement = 7239,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._1048:CaptainOok() end,
					partial = false,
				},
				boss4 = {
					name = L["Instances_Other"], --Monkey See Monkey Kill
					bossIDs = {},
					achievement = 7248,
					players = {},
					tactics = {
					},
					enabled = true,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},
		},
	},

	--Cataclysm
	[4] = {
		Raids = {
			[967] = { --Dragon Soul
				name = 187,
				boss1 = {
					name = 311, --Morchok
					bossIDs = {},
					achievement = 6174,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1292,
				},
				boss2 = {
					name = 324, --Warlord Zon'ozz
					bossIDs = {55308},
					achievement = 6128,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._967:WarlordZonozz() end,
					partial = false,
					encounterID = 1294,
				},
				boss3 = {
					name = 325, --Yor'sahj the Unsleeping
					bossIDs = {55312},
					achievement = 6129,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._967:YorsahjTheUnsleeping() end,
					partial = false,
					encounterID = 1295,
				},
				boss4 = {
					name = 317, --Hagara the Stormbinder
					bossIDs = {},
					achievement = 6175,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1296,
				},
				boss5 = {
					name = 331, --Ultraxion
					bossIDs = {55294},
					achievement = 6084,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._967:Ultraxion() end,
					partial = false,
					encounterID = 1297,
				},
				boss6 = {
					name = 332, --Warmaster Blackhorn
					bossIDs = {56598},
					achievement = 6105,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._967:Skyfire() end,
					partial = false,
					encounterID = 1298,
				},
				boss7 = {
					name = 318, --Spine of Deathwing
					bossIDs = {53879},
					achievement = 6133,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._967:SpineOfDeathwing() end,
					partial = false,
					encounterID = 1291,
				},
				boss8 = {
					name = 333, --Madness of Deathwing
					bossIDs = {},
					achievement = 6180,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._669:Magmaw() end,
					partial = false,
					encounterID = 1024,
				},
				boss2 = {
					name = 169, --Omnotron Defense System
					bossIDs = {42178, 42179, 42180, 42166},
					achievement = 5307,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._669:OminitronDefenseSystem() end,
					partial = false,
					encounterID = 1027,
				},
				boss3 = {
					name = 173, --Maloriak
					bossIDs = {41378},
					achievement = 5310,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._669:Maloriak() end,
					partial = false,
					encounterID = 1025,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 171, --Atramedes
					bossIDs = {41442},
					achievement = 5308,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1022,
				},
				boss5 = {
					name = 172, --Chimaeron
					bossIDs = {43296},
					achievement = 5309,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._669:Chimaeron() end,
					partial = false,
					encounterID = 1023,
				},
				boss6 = {
					name = 174, --Nefarian
					bossIDs = {41270, 41376},
					achievement = 4849,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._671:HalfusWyrmbreaker() end,
					partial = false,
					encounterID = 1030,
				},
				boss2 = {
					name = 157, --Valiona And Theralion
					bossIDs = {45992},
					achievement = 4852,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._671:ValionaAndTheralion() end,
					partial = false,
					encounterID = 1032,
				},
				boss3 = {
					name = 158, --Ascendant Council
					bossIDs = {},
					achievement = 5311,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._671:AscendantCouncil() end,
					partial = false,
					encounterID = 1028,
				},
				boss4 = {
					name = 167, --Cho'gall
					bossIDs = {43324},
					achievement = 5312,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1035,
				},
				boss2 = {
					name = 155, --Al'Akir
					bossIDs = {},
					achievement = 5305,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._720:Bethtilac() end,
					partial = false,
					encounterID = 1197,
				},
				boss2 = {
					name = 193, --Lord Rhyolith
					bossIDs = {52558},
					achievement = 5810,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1204,
				},
				boss3 = {
					name = 194, --Alysrazor
					bossIDs = {52530},
					achievement = 5813,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._720:Alysrazor() end,
					partial = false,
					encounterID = 1206,
				},
				boss4 = {
					name = 195, --Shannox
					bossIDs = {},
					achievement = 5829,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._720:Shannox() end,
					partial = false,
					encounterID = 1205,
				},
				boss5 = {
					name = 196, --Baleroc
					bossIDs = {53494},
					achievement = 5830,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._720:Baleroc() end,
					partial = false,
					encounterID = 1200,
				},
				boss6 = {
					name = 197, --Majordomo Staghelm
					bossIDs = {},
					achievement = 5799,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1185,
				},
				boss7 = {
					name = 198, --Ragnaros
					bossIDs = {52409},
					achievement = 5855,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._645:RomoggBonecrusher() end,
					partial = false,
					encounterID = 1040,
				},
				boss2 = {
					name = 106, --Corla
					bossIDs = {39679},
					achievement = 5282,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._645:Corla() end,
					partial = false,
					encounterID = 1038,
				},
				boss3 = {
					name = 107, --Karsh Steelbender
					bossIDs = {39698},
					achievement = 5283,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._645:KarshSteelbender() end,
					partial = false,
					encounterID = 1039,
				},
				boss4 = {
					name = 109, --Ascendant Lord Obsidius
					bossIDs = {39705},
					achievement = 5284,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._645:AscendantLordObsidius() end,
					partial = false,
					encounterID = 1036,
				},
			},

			[643] = { --Throne of the Tides
				name = 65,
				boss1 = {
					name = 101, --Lady Naz'Jar
					bossIDs = {40586},
					achievement = 5285,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._643:LadyNazjar() end,
					partial = false,
					encounterID = 1045,
				},
				boss2 = {
					name = 104, --Ozumat
					bossIDs = {44658, 44715, 44648},
					achievement = 5286,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._725:HighPriestessAzil() end,
					partial = false,
					encounterID = 1057,
				},
			},

			[657] = { --The Vortex Pinnacle
				name = 68,
				boss1 = {
					name = 116, --Asaad
					bossIDs = {43875},
					achievement = 5288,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._657:Asaad() end,
					partial = false,
					encounterID = 1042,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME62
					bossIDs = {},
					achievement = 5289,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[670] = { --Grim Batol
				name = 71,
				boss1 = {
					name = 131, --General Umbriss
					bossIDs = {39625},
					achievement = 5297,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._670:GeneralUmbriss() end,
					partial = false,
					encounterID = 1051,
				},
				boss2 = {
					name = 134, --Erudax
					bossIDs = {40484},
					achievement = 5298,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._644:TempleGuardianAnhuur() end,
					partial = false,
					encounterID = 1080,
				},
				boss2 = {
					name = 125, --Earthrager Ptah
					bossIDs = {39428},
					achievement = 5294,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._644:EarthragerPtah() end,
					partial = false,
					encounterID = 1076,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME63
					bossIDs = {},
					achievement = 5296,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss4 = {
					name = 130, --Rajh
					bossIDs = {39378},
					achievement = 5295,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._755:Lockmaw() end,
					partial = false,
					encounterID = 1054,
					displayInfoFrame = true,
				},
				boss2 = {
					name = 119, --High Prophet Barim
					bossIDs = {43612},
					achievement = 5290,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._755:HighProphetBarim() end,
					partial = false,
					encounterID = 1053,
				},
				boss3 = {
					name = 122, --Siamat
					bossIDs = {44819},
					achievement = 5292,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._36:Glubtok() end,
					partial = false,
					encounterID = 1064,
				},
				boss2 = {
					name = 90, --Helix Gearbreaker
					bossIDs = {47296},
					achievement = 5367,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._36:HelixGearbreaker() end,
					partial = false,
					encounterID = 1065,
				},
				boss3 = {
					name = 91, --Foe Reaper 5000
					bossIDs = {},
					achievement = 5368,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = true,
					encounterID = 1063,
				},
				boss4 = {
					name = 92, --Admiral Ripsnarl
					bossIDs = {47626},
					achievement = 5369,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._36:AdmiralRipsnarl() end,
					partial = false,
					encounterID = 1062,
				},
				boss5 = {
					name = 93, --'Captain' Cookie
					bossIDs = {47739},
					achievement = 5370,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._36:CaptainCookie() end,
					partial = false,
					encounterID = 1060,
				},
				boss6 = {
					name = 95, --Vanessa VanCleef
					bossIDs = {49541},
					achievement = 5371,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._33:BaronAshbury() end,
					partial = false,
					encounterID = 1069,
				},
				boss2 = {
					name = 98, --Commander Springvale
					bossIDs = {4278},
					achievement = 5504,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._33:CommanderSpringvale() end,
					partial = false,
					encounterID = 1071,
				},
				boss3 = {
					name = 100, --Lord Godfrey
					bossIDs = {46964},
					achievement = 5505,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._33:LordGodfrey() end,
					partial = false,
					encounterID = 1072,
				},
			},

			[859] = { --Zul'Gurub
				name = 76,
				boss1 = {
					name = L["Instances_Other"], --Gurubashi Headhunter
					bossIDs = {},
					achievement = 5744,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 175, --High Priest Venoxis
					bossIDs = {52155},
					achievement = 5743,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._859:HighPriestVenoxis() end,
					partial = false,
					encounterID = 1178,
				},
				boss3 = {
					name = 176, --Bloodlord Mandokir
					bossIDs = {52151},
					achievement = 5762,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._859:BloodlordMandokir() end,
					partial = false,
					encounterID = 1179,
				},
				boss4 = {
					name = 181, --High Priestess Kilnara
					bossIDs = {52059},
					achievement = 5765,
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._859:HighPriestessKilnara() end,
					partial = false,
					encounterID = 1180,
				},
				boss5 = {
					name = 185, --Jin'do
					bossIDs = {52148, 52624},
					achievement = 5759,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._568:Halazzi() end,
					partial = false,
					encounterID = 1192,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME65
					bossIDs = {},
					achievement = 5761,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME66
					bossIDs = {},
					achievement = 5858,
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss4 = {
					name = 191, --Daakara
					bossIDs = {},
					achievement = 5760,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1884,
				},
				boss2 = {
					name = 323, --Echo of Sylvanas
					bossIDs = {54123},
					achievement = 6130,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._939:Perotharn() end,
					partial = false,
					encounterID = 1272,
				},
				boss2 = {
					name = 292, --Mannoroth
					bossIDs = {54969, 55419},
					achievement = 6070,
					players = {},
					tactics = {
					},
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
					players = {},
					tactics = {
					},
					enabled = true,
					track = function() core._940:ArchbishopBenedictus() end,
					partial = false,
					encounterID = 1339,
				},
			},
		},
	},

	--Wrath of the Lich King
	[3] = {
		Raids = {
			[615.10] = { --Obsidian Sanctum 10 Man
				name = L["Instance_TheObsidianSanctum"],
				boss1 = {
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
				name = L["Instance_TheObsidianSanctum"],
				boss1 = {
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
					name = L["Boss_Sartharion"], --Sartharion the Onyx Guardian
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
				name = L["Instance_TheEyeOfEternity"],
				boss1 = {
					name = L["Boss_Malygos"], --Malygos
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
					name = L["Boss_Malygos"], --Malygos
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
					name = L["Boss_Malygos"], --Malygos
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
				name = L["Instance_TheEyeOfEternity"],
				boss1 = {
					name = L["Boss_Malygos"], --Malygos
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
					name = L["Boss_Malygos"], --Malygos
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
					name = L["Boss_Malygos"], --Malygos
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
				name = L["Instance_OnyxiasLair"],
				boss1 = {
					name = L["Boss_Onyxia"], --Onyxia
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
					name = L["Boss_Onyxia"], --Onyxia
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
					name = L["Boss_Onyxia"], --Onyxia
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
				name = L["Instance_OnyxiasLair"],
				boss1 = {
					name = L["Boss_Onyxia"], --Onyxia
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
					name = L["Boss_Onyxia"], --Onyxia
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
					name = L["Boss_Onyxia"], --Onyxia
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
				name = L["Instance_TrialOfTheCrusader"],
				boss1 = {
					name = L["Boss_Icehowl"], --Icehowl
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
					name = L["Boss_AcidmawandDreadscale"], --Acidmaw and Dreadscale
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
					name = L["Boss_LordJaraxxus"], --Lord Jaraxxus
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
					name = L["Boss_FactionChampions"], --Faction Champions
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
					name = L["Boss_TwinValkyr"], --Twin Val'kyr
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
					name = L["Boss_Anubarak"], --Anub'arak
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
				name = L["Instance_TrialOfTheCrusader"],
				boss1 = {
					name = L["Boss_Icehowl"], --Icehowl
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
					name = L["Boss_AcidmawandDreadscale"], --Acidmaw and Dreadscale
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
					name = L["Boss_LordJaraxxus"], --Lord Jaraxxus
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
					name = L["Boss_TwinValkyr"], --Twin Val'kyr
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
					name = L["Boss_Anubarak"], --Anub'arak
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
				name = L["Instance_VaultOfArchavon"],
				boss1 = {
					name = L["Boss_ArchavonTheStoneWatcher"], --Archavon & Emalon & Koralon
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
				name = L["Instance_VaultOfArchavon"],
				boss1 = {
					name = L["Boss_ArchavonTheStoneWatcher"], --Archavon & Emalon & Koralon
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

			[603.10] = { --Ulduar 10 Man
				name = L["Instance_Ulduar"],
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Three Car Garage) 10 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Take Out Those Turrets) 10 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Shutout) 10 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Orbital Bombardment) 10 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Orbital Devastation) 10 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Nuked from Orbit) 10 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Orbit-uary) 10 Man
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
					name = L["Boss_Razorscale"], --Razorscale (A Quick Shave) 10 Man
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
					name = L["Boss_Razorscale"], --Razorscale (Iron Dwarf, Medium Rare) 10 Man
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
					name = L["Boss_IgnisTheFurnaceMaster"], --Ignis the Furnace Master (Shattered) 10 Man
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
					name = L["Boss_IgnisTheFurnaceMaster"], --Ignis the Furnace Master (Hot Pocket) 10 Man
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
					name = L["Boss_IgnisTheFurnaceMaster"], --Ignis the Furnace Master (Stokin' the Furnace) 10 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Nerf Engineering) 10 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Nerf Scrapbots) 10 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Nerf Gravity Bombs) 10 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Must Deconstruct Faster) 10 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Heartbreaker) 10 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (I Choose You, Runemaster Molgeim) 10 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (I Choose You, Stormcaller Brundir) 10 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (I Choose You, Steelbreaker) 10 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (But I'm On Your Side) 10 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (Can't Do That While Stunned) 10 Man
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
					name = L["Boss_Kologarn"], --Kologarn (With Open Arms) 10 Man
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
					name = L["Boss_Kologarn"], --Kologarn (Disarmed) 10 Man
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
					name = L["Boss_Kologarn"], --Kologarn (If Looks Could Kill) 10 Man
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
					name = L["Boss_Kologarn"], --Kologarn (Rubble and Roll) 10 Man
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
					name = L["Boss_Auriaya"], --Auriaya (Crazy Cat Lady) 10 Man
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
					name = L["Boss_Auriaya"], --Auriaya (Nine Lives) 10 Man
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
					name = L["Boss_Hodir"], --Hodir (Cheese the Freeze) 10 Man
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
					name = L["Boss_Hodir"], --Hodir (I Have the Coolest Friends) 10 Man
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
					name = L["Boss_Hodir"], --Hodir (Getting Cold in Here) 10 Man
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
					name = L["Boss_Hodir"], --Hodir (I Could Say That This Cache Was Rare) 10 Man
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
					name = L["Boss_Hodir"], --Hodir (Staying Buffed All Winter) 10 Man
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
					name = L["Boss_Thorim"], --Thorim (Don't Stand in the Lightning) 10 Man
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
					name = L["Boss_Thorim"], --Thorim (I'll Take You All On) 10 Man
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
					name = L["Boss_Thorim"], --Thorim (Who Needs Bloodlust?) 10 Man
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
					name = L["Boss_Thorim"], --Thorim (Siffed) 10 Man
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
					name = L["Boss_Thorim"], --Thorim (Lose Your Illusion) 10 Man
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
					name = L["Boss_Freya"], --Freya (Con-speed-atory) 10 Man
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
					name = L["Boss_Freya"], --Freya (Deforestation) 10 Man
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
					name = L["Boss_Freya"], --Freya (Getting Back to Nature) 10 Man
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
					name = L["Boss_Freya"], --Freya (Knock on Wood) 10 Man
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
					name = L["Boss_Freya"], --Freya (Knock, Knock on Wood) 10 Man
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
					name = L["Boss_Freya"], --Freya (Knock, Knock, Knock on Wood) 10 Man
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
					name = L["Boss_Mimiron"], --Mimiron (Set Up Us the Bomb) 10 Man
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
					name = L["Boss_Mimiron"], --Mimiron (Not-So-Friendly Fire) 10 Man
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
					name = L["Boss_Mimiron"], --Mimiron (Firefighter) 10 Man
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
					name = L["Boss_GeneralVezax"], --General Vezax (Shadowdodger) 10 Man
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
					name = L["Boss_GeneralVezax"], --General Vezax (I Love the Smell of Saronite in the Morning) 10 Man
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
					name = L["Boss_Yogg-Saron1"], --Yogg-Saron 1 (Kiss and Make Up) 10 Man
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
					name = L["Boss_Yogg-Saron2"], --Yogg-Saron 2 (Three Lights in the Darkness) 10 Man
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
					name = L["Boss_Yogg-Saron3"], --Yogg-Saron 3 (Two Lights in the Darkness) 10 Man
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
					name = L["Boss_Yogg-Saron4"], --Yogg-Saron 4 (One Light in the Darkness) 10 Man
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
					name = L["Boss_Yogg-Saron5"], --Yogg-Saron 5 (Alone in the Darkness) 10 Man
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
					name = L["Boss_Yogg-Saron6"], --Yogg-Saron 6 (Drive Me Crazy) 10 Man
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
					name = L["Boss_Yogg-Saron7"], --Yogg-Saron 7 (He's Not Getting Any Older) 10 Man
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
					name = L["Boss_Yogg-Saron8"], --Yogg-Saron 8 (They're Coming Out of the Walls) 10 Man
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
					name = L["Boss_Yogg-Saron9"], --Yogg-Saron 9 (In His House He Waits Dreaming) 10 Man
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
					name = L["Boss_AlgalonTheObserver"], --Algalon the Observer (Supermassive) 10 Man
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
				name = L["Instance_Ulduar"],
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Three Car Garage) 25 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Take Out Those Turrets) 25 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Shutout) 25 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Orbital Bombardment) 25 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Orbital Devastation) 25 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Nuked from Orbit) 25 Man
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
					name = L["Boss_FlameLeviathan"], --Flame Leviathan (Orbit-uary) 25 Man
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
					name = L["Boss_Razorscale"], --Razorscale (A Quick Shave) 25 Man
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
					name = L["Boss_Razorscale"], --Razorscale (Iron Dwarf, Medium Rare) 25 Man
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
					name = L["Boss_IgnisTheFurnaceMaster"], --Ignis the Furnace Master (Shattered) 25 Man
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
					name = L["Boss_IgnisTheFurnaceMaster"], --Ignis the Furnace Master (Hot Pocket) 25 Man
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
					name = L["Boss_IgnisTheFurnaceMaster"], --Ignis the Furnace Master (Stokin' the Furnace) 25 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Nerf Engineering) 25 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Nerf Scrapbots) 25 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Nerf Gravity Bombs) 25 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Must Deconstruct Faster) 25 Man
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
					name = L["Boss_XT-002Deconstructor"], --XT-002 Deconstructor (Heartbreaker) 25 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (I Choose You, Runemaster Molgeim) 25 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (I Choose You, Stormcaller Brundir) 25 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (I Choose You, Steelbreaker) 25 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (But I'm On Your Side) 25 Man
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
					name = L["Boss_AssemblyOfIron"], --Assembly of Iron (Can't Do That While Stunned) 25 Man
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
					name = L["Boss_Kologarn"], --Kologarn (With Open Arms) 25 Man
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
					name = L["Boss_Kologarn"], --Kologarn (Disarmed) 25 Man
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
					name = L["Boss_Kologarn"], --Kologarn (If Looks Could Kill) 25 Man
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
					name = L["Boss_Kologarn"], --Kologarn (Rubble and Roll) 25 Man
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
					name = L["Boss_Auriaya"], --Auriaya (Crazy Cat Lady) 25 Man
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
					name = L["Boss_Auriaya"], --Auriaya (Nine Lives) 25 Man
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
					name = L["Boss_Hodir"], --Hodir (Cheese the Freeze) 25 Man
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
					name = L["Boss_Hodir"], --Hodir (I Have the Coolest Friends) 25 Man
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
					name = L["Boss_Hodir"], --Hodir (Getting Cold in Here) 25 Man
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
					name = L["Boss_Hodir"], --Hodir (I Could Say That This Cache Was Rare) 25 Man
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
					name = L["Boss_Hodir"], --Hodir (Staying Buffed All Winter) 25 Man
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
					name = L["Boss_Thorim"], --Thorim (Don't Stand in the Lightning) 25 Man
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
					name = L["Boss_Thorim"], --Thorim (I'll Take You All On) 25 Man
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
					name = L["Boss_Thorim"], --Thorim (Who Needs Bloodlust?) 25 Man
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
					name = L["Boss_Thorim"], --Thorim (Siffed) 25 Man
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
					name = L["Boss_Thorim"], --Thorim (Lose Your Illusion) 25 Man
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
					name = L["Boss_Freya"], --Freya (Con-speed-atory) 25 Man
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
					name = L["Boss_Freya"], --Freya (Deforestation) 25 Man
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
					name = L["Boss_Freya"], --Freya (Getting Back to Nature) 25 Man
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
					name = L["Boss_Freya"], --Freya (Knock on Wood) 25 Man
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
					name = L["Boss_Freya"], --Freya (Knock, Knock on Wood) 25 Man
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
					name = L["Boss_Freya"], --Freya (Knock, Knock, Knock on Wood) 25 Man
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
					name = L["Boss_Mimiron"], --Mimiron (Set Up Us the Bomb) 25 Man
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
					name = L["Boss_Mimiron"], --Mimiron (Not-So-Friendly Fire) 25 Man
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
					name = L["Boss_Mimiron"], --Mimiron (Firefighter) 25 Man
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
					name = L["Boss_GeneralVezax"], --General Vezax (Shadowdodger) 25 Man
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
					name = L["Boss_GeneralVezax"], --General Vezax (I Love the Smell of Saronite in the Morning) 25 Man
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
					name = L["Boss_Yogg-Saron1"], --Yogg-Saron 1 (Kiss and Make Up) 25 Man
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
					name = L["Boss_Yogg-Saron2"], --Yogg-Saron 2 (Three Lights in the Darkness) 25 Man
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
					name = L["Boss_Yogg-Saron3"], --Yogg-Saron 3 (Two Lights in the Darkness) 25 Man
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
					name = L["Boss_Yogg-Saron4"], --Yogg-Saron 4 (One Light in the Darkness 25 Man)
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
					name = L["Boss_Yogg-Saron5"], --Yogg-Saron 5 (Alone in the Darkness) 25 Man
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
					name = L["Boss_Yogg-Saron6"], --Yogg-Saron 6 (Drive Me Crazy) 25 Man
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
					name = L["Boss_Yogg-Saron7"], --Yogg-Saron 7 (He's Not Getting Any Older) 25 Man
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
					name = L["Boss_Yogg-Saron8"], --Yogg-Saron 8 (They're Coming Out of the Walls) 25 Man
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
					name = L["Boss_Yogg-Saron9"], --Yogg-Saron 9 (In His House He Waits Dreaming) 25 Man
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
					name = L["Boss_AlgalonTheObserver"], --Algalon the Observer (Supermassive) 25 Man
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
				name = L["Instance_Naxxramas"],
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
					name = L["Boss_Maexxna"], --Maexxna
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
					name = L["Boss_Patchwerk"], --Patchwerk
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
					name = L["Boss_HeiganTheUnclean"], --Heigan the Unclean
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
					name = L["Boss_GrandWidowFaerlina"], --Grand Widow Faerlina
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
					name = L["Boss_Thaddius"], --Thaddius
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
					name = L["Boss_Thaddius"], --Thaddius
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
					name = L["Boss_Loatheb"], --Loatheb
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
					name = L["Boss_TheFourHorsemen"], --Four Horsemen
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
					name = L["Boss_Sapphiron"], --Sapphiron
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
					name = L["Boss_KelThuzad"], --Kel'Thuzad
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
				name = L["Instance_Naxxramas"],
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
					name = L["Boss_Maexxna"], --Maexxna
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
					name = L["Boss_Patchwerk"], --Patchwerk
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
					name = L["Boss_HeiganTheUnclean"], --Heigan the Unclean
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
					name = L["Boss_GrandWidowFaerlina"], --Grand Widow Faerlina
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
					name = L["Boss_Thaddius"], --Thaddius
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
					name = L["Boss_Thaddius"], --Thaddius
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
					name = L["Boss_Loatheb"], --Loatheb
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
					name = L["Boss_TheFourHorsemen"], --Four Horsemen
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
					name = L["Boss_Sapphiron"], --Sapphiron
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
					name = L["Boss_KelThuzad"], --Kel'Thuzad
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
				name = L["Instance_IcecrownCitadel"],
				boss1 = {
					name = L["Boss_LordMarrowgar"], --Lord Marrowgar
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
					name = L["Boss_LadyDeathwhisper"], --Lady Deathwhisper
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
					name = L["Boss_GunshipBattle"], --Gunship Battle
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
					name = L["Boss_DeathbringerSaurfang"], --Deathbringer Saurfang
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
					name = L["Boss_Festergut"], --Festergut
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
					name = L["Boss_Rotface"], --Rotface
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
					name = L["Boss_PrOfessorPutricide"], --Professor Putricide
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
					name = L["Boss_ValithriaDreamwalker"], --Valithria Dreamwalker
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
					name = L["Boss_Sindragosa"], --Sindragosa
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
					name = L["Boss_BloodPrinceCouncil"], --Blood Prince Council
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
					name = L["Boss_Blood-QueenLanaThel"], --Blood-Queen Lana'thel
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
					name = L["Boss_TheLichKing"], --The Lich King
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
					name = L["Boss_TheLichKing"], --The Lich King
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
				name = L["Instance_IcecrownCitadel"],
				boss1 = {
					name = L["Boss_LordMarrowgar"], --Lord Marrowgar
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
					name = L["Boss_LadyDeathwhisper"], --Lady Deathwhisper
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
					name = L["Boss_GunshipBattle"], --Gunship Battle
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
					name = L["Boss_DeathbringerSaurfang"], --Deathbringer Saurfang
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
					name = L["Boss_Festergut"], --Festergut
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
					name = L["Boss_Rotface"], --Rotface
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
					name = L["Boss_PrOfessorPutricide"], --Professor Putricide
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
					name = L["Boss_ValithriaDreamwalker"], --Valithria Dreamwalker
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
					name = L["Boss_Sindragosa"], --Sindragosa
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
					name = L["Boss_BloodPrinceCouncil"], --Blood Prince Council
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
					name = L["Boss_Blood-QueenLanaThel"], --Blood-Queen Lana'thel
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
					name = L["Boss_TheLichKing"], --The Lich King
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
					name = L["Boss_TheLichKing"], --The Lich King
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
				boss1 = {
					name = L["Boss_PrinceKeleseth"], --Prince Keleseth
					bossIDs = {23953},
					achievement = 1919,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardeKeep_Classic_PrinceKeleseth"], "IAT_23953", C_Spell.GetSpellLink(42672), C_Spell.GetSpellLink(42672)) },
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
				boss1 = {
					name = L["Boss_GrandMagusTelestra"], --Grand Magus Telestra
					bossIDs = {26731},
					achievement = 2150,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheNexus_Classic_GrandMagusTelestra"], "IAT_26731", C_Spell.GetSpellLink(70421)) },
						},
					},
					enabled = true,
					track = function() core._576:GrandMagusTelestra() end,
					partial = false,
					nameWrath = L["Boss_GrandMagusTelestra"],
				},
				boss2 = {
					name = L["Boss_Anomalus"], --Anomalus
					bossIDs = {26763},
					achievement = 2037,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheNexus_Classic_Anomalus"], "IAT_26918", "IAT_26763", "IAT_26746", "IAT_26918", "IAT_26918") },
						},
					},
					enabled = true,
					track = function() core._576:Anomalus() end,
					partial = false,
					nameWrath = L["Boss_Anomalus"],
				},
				boss3 = {
					name = L["Boss_Keristasza"], --Keristrasza
					bossIDs = {26723},
					achievement = 2036,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheNexus_Classic_Keristasza"], C_Spell.GetSpellLink(48095), "IAT_26206", C_Spell.GetSpellLink(48179), C_Spell.GetSpellLink(32592)) },
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
				boss1 = {
					name = L["Boss_KrikthirTheGatewatcher"], --Krik'thir the Gatewatcher
					bossIDs = {},
					achievement = 1296,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["AzjolNerub_Classic_KrikthirTheGatewatcher"], "IAT_28730", "IAT_28729", "IAT_28731") },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1971,
					nameWrath = L["Boss_KrikthirTheGatewatcher"],
				},
				boss2 = {
					name = L["Boss_Hadronox"], --Hadronox
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
					name = L["Boss_Anubarak"], --Anub'arak
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
				boss1 = {
					name = L["Boss_ElderNadox"], --Elder Nadox
					bossIDs = {29309},
					achievement = 2038,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["AhnkahetTheOldKingdom_Classic_ElderNadox"], "IAT_30176", C_Spell.GetSpellLink(56153), C_Spell.GetSpellLink(9484)) },
						},
					},
					enabled = true,
					track = function() core._619:ElderNadox() end,
					partial = false,
					encounterID = 1969,
					nameWrath = L["Boss_ElderNadox"],
				},
				boss2 = {
					name = L["Boss_JedogaShadowseeker"], --Jedoga Shadowseeker
					bossIDs = {29310},
					achievement = 2056,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["AhnkahetTheOldKingdom_Classic_JedogaShadowseeker"], "IAT_29310", "IAT_30385", C_Spell.GetSpellLink(56219)) },
						},
					},
					enabled = true,
					track = function() core._619:JedogaShadowseeker() end,
					partial = false,
					encounterID = 1967,
					nameWrath = L["Boss_JedogaShadowseeker"],
				},
				boss3 = {
					name = L["Boss_HeraldVolazj"], --Herald Volazj
					bossIDs = {29311},
					achievement = 1862,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["AhnkahetTheOldKingdom_Classic_HeraldVolazj"], "IAT_30623") },
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
				boss1 = {
					name = L["Boss_Trollgore"], --Trollgore
					bossIDs = {26630},
					achievement = 2151,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["DrakTharonKeep_Classic_Trollgore"], "IAT_26630", C_Spell.GetSpellLink(49381), C_Spell.GetSpellLink(49381)) },
						},
					},
					enabled = true,
					track = function() core._600:Trollgore() end,
					partial = false,
					encounterID = 1974,
					nameWrath = L["Boss_Trollgore"],
				},
				boss2 = {
					name = L["Boss_NovosTheSummoner"], --Novos the Summoner
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
					name = L["Boss_KingDred"], --King Dred
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
				boss1 = {
					name = L["Boss_Cyanigosa"], --Cyanigosa
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
					name = L["Boss_Ichoron"], --Ichoron
					bossIDs = {},
					achievement = 2041,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheVioletHold_Classic_Ichoron"], C_Spell.GetSpellLink(57804), "IAT_29313", "IAT_29313") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Boss_Ichoron"],
				},
				boss4 = {
					name = L["Boss_ZuramatTheObliterator"], --Zuramat the Obliterator
					bossIDs = {29314},
					achievement = 2153,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheVioletHold_Classic_ZuramatTheObliterator"], "IAT_29364") },
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
				boss1 = {
					name = L["Boss_Sladran"], --Slad'ran
					bossIDs = {29304},
					achievement = 2058,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["Gundrak_Classic_Sladran"], "IAT_29304", "IAT_29713", C_Spell.GetSpellLink(55093), "IAT_29713", C_Spell.GetSpellLink(55093)) },
						},
					},
					enabled = true,
					track = function() core._604:Sladran() end,
					partial = false,
					encounterID = 1978,
					nameWrath = L["Boss_Sladran"],
				},
				boss2 = {
					name = L["Boss_Moorabi"], --Moorabi
					bossIDs = {29305},
					achievement = 2040,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["Gundrak_Classic_Moorabi"], "IAT_29305", C_Spell.GetSpellLink(55098), "IAT_29305", C_Spell.GetSpellLink(55163), C_Spell.GetSpellLink(55098)) },
						},
					},
					enabled = true,
					track = function() core._604:Moorabi() end,
					partial = false,
					encounterID = 1980,
					nameWrath = L["Boss_Moorabi"],
				},
				boss3 = {
					name = L["Boss_Galdarah"], --Gal'darah
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
					name = L["Boss_Galdarah"], --Gal'darah
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
				boss1 = {
					name = L["Boss_MaidenOfGrief"], --Maiden of Grief
					bossIDs = {27975},
					achievement = 1866,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfStone_Classic_MaidenOfGrief"], "IAT_27975", C_Spell.GetSpellLink(59726)) },
						},
					},
					enabled = true,
					track = function() core._599:MaidenOfGrief() end,
					partial = false,
					encounterID = 1996,
					nameWrath = L["Boss_MaidenOfGrief"],
				},
				boss2 = {
					name = L["Boss_TribunalOfAges"], --Tribunal of Ages
					bossIDs = {27983},
					achievement = 2154,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfStone_Classic_TribunalOfAges"], "IAT_29579") },
						},
					},
					enabled = true,
					track = function() core._599:TribunalOfAges() end,
					partial = false,
					encounterID = 1995,
					nameWrath = L["Boss_TribunalOfAges"],
				},
				boss3 = {
					name = L["Boss_SjonnirTheIronshaper"], --Sjonnir The Ironshaper
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
				boss1 = {
					name = L["Boss_GeneralBjarngrim"], --General Bjarngrim
					bossIDs = {28586},
					achievement = 1834,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfLightning_Classic_GeneralBjarngrim"], "IAT_28586", C_Spell.GetSpellLink(52092), "IAT_29240", "IAT_28586", C_Spell.GetSpellLink(52092)) },
						},
					},
					enabled = true,
					track = function() core._602:GeneralBjarngrim() end,
					partial = false,
					encounterID = 1987,
					nameWrath = L["Boss_GeneralBjarngrim"],
				},
				boss2 = {
					name = L["Boss_Volkhan"], --Volkhan
					bossIDs = {28587},
					achievement = 2042,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfLightning_Classic_Volkhan"], "IAT_28681", "IAT_28681") },
						},
					},
					enabled = true,
					track = function() core._602:Volkhan() end,
					partial = false,
					encounterID = 1985,
					nameWrath = L["Boss_Volkhan"],
				},
				boss3 = {
					name = L["Boss_Loken"], --Loken
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
				boss1 = {
					name = L["Boss_Ley-GuardianEregos"], --Ley-Guardian Eregos
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
					name = L["Boss_Ley-GuardianEregos"], --Ley-Guardian Eregos
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
					name = L["Boss_Ley-GuardianEregos"], --Ley-Guardian Eregos
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
					name = L["Boss_Ley-GuardianEregos"], --Ley-Guardian Eregos
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
					name = L["Boss_Ley-GuardianEregos"], --Ley-Guardian Eregos
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
				boss1 = {
					name = L["Boss_SvalaSorrowgrave"], --Svala Sorrowgrave
					bossIDs = {},
					achievement = 2043,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardePinnacle_Classic_SvalaSorrowgrave"], "IAT_26555", "IAT_26555", C_Spell.GetSpellLink(48276), "IAT_26555", "IAT_26555", "IAT_26668", C_Spell.GetSpellLink(48277)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2030,
					nameWrath = L["Boss_SvalaSorrowgrave"],
				},
				boss2 = {
					name = L["Boss_SkadiTheRuthless"], --Skadi the Ruthless
					bossIDs = {26690, 26693},
					achievement = 1873,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardePinnacle_Classic_SkadiTheRuthless"], "IAT_26693") },
						},
					},
					enabled = true,
					track = function() core._575:SkadiTheRuthless() end,
					partial = false,
					encounterID = 2029,
					nameWrath = L["Boss_SkadiTheRuthless"],
				},
				boss3 = {
					name = L["Boss_SkadiTheRuthless"], --Skadi the Ruthless
					bossIDs = {},
					achievement = 2156,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardePinnacle_Classic_SkadiTheRuthless2"], "IAT_26893", "IAT_26693") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2029,
					nameWrath = L["Boss_SkadiTheRuthless"],
				},
				boss4 = {
					name = L["Boss_KingYmiron"], --King Ymiron
					bossIDs = {26861},
					achievement = 2157,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardePinnacle_Classic_KingYmiron"], "IAT_26861", C_Spell.GetSpellLink(48294), "IAT_26861") },
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
				boss1 = {
					name = L["Boss_ArgentConfessorPaletress"], --Argent Confessor Paletress
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
					name = L["Boss_EadricThePure"], --Eadric the Pure
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
					name = L["Boss_TheBlackKnight"], --The Black Knight
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
				boss1 = {
					name = L["Boss_Bronjahm"], --Bronjahm
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
					name = L["Boss_DevourerOfSouls"], --Devourer of Souls
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
				boss1 = {
					name = L["Boss_ForgemasterGarfrost"], --Forgemaster Garfrost
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
				boss1 = {
					name = L["Boss_MISSINGNAME76"], --MISSINGNAME76
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
