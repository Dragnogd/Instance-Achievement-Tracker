--------------------------------------
-- Last Auto Generated: 17/08/2025 16:03:30 using https://github.com/Dragnogd/Instance-Achievement-Tracker-Database-Manager
--------------------------------------
local _, core = ...
local L = core.L
local instances = {}

core.Instances = {
	--The War Within
	[11] = {
		Raids = {
			[2657] = { --Nerub-ar Palace
				name = 1273,
				boss1 = {
					name = 2607, --Ulgrax the Devourer
					bossIDs = {},
					achievement = 40261,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_UlgraxTheDevourer"], "IAT_225880", "IAT_225880", C_Spell.GetSpellLink(436217)) },
						},
					},
					enabled = true,
					track = function() core._2657:UlgraxTheDevourer() end,
					partial = false,
					encounterID = 2902,
				},
				boss2 = {
					name = 2611, --The Bloodbound Horror
					bossIDs = {},
					achievement = 40260,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_TheBloodboundHorror"], C_Spell.GetSpellLink(444363), "IAT_225335", C_Spell.GetSpellLink(453254), "IAT_225335", C_Spell.GetSpellLink(453254), "IAT_225423", "IAT_225423") },
						},
					},
					enabled = true,
					track = function() core._2657:TheBloodboundHorror() end,
					partial = false,
					encounterID = 2917,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2599, --Sikran
					bossIDs = {},
					achievement = 40255,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_Sikran"], "IAT_224610", C_Spell.GetSpellLink(451069), C_Spell.GetSpellLink(451069), C_Spell.GetSpellLink(451759), C_Spell.GetSpellLink(451759)) },
						},
					},
					enabled = true,
					track = function() core._2657:Sikran() end,
					partial = false,
					encounterID = 2898,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 2609, --Rasha'nan
					bossIDs = {},
					achievement = 40262,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_Rashanan"], C_Spell.GetSpellLink(439786), C_Spell.GetSpellLink(439786), C_Spell.GetSpellLink(439786)) },
						},
					},
					enabled = true,
					track = function() core._2657:Rashanan() end,
					partial = false,
					encounterID = 2918,
					displayInfoFrame = true,
				},
				boss5 = {
					name = 2612, --Broodtwister Ovi'nax
					bossIDs = {},
					achievement = 40263,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_BroodtwisterOvinax"], C_Spell.GetSpellLink(453267), C_Spell.GetSpellLink(444363), C_Spell.GetSpellLink(444363), "IAT_225164", C_Spell.GetSpellLink(452911)) },
						},
					},
					enabled = true,
					track = function() core._2657:BroodtwisterOvinax() end,
					partial = false,
					encounterID = 2919,
					displayInfoFrame = true,
				},
				boss6 = {
					name = 2601, --Nexus-Princess Ky'veza
					bossIDs = {},
					achievement = 40264,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_NexusPrincessKyveza"], "IAT_230877", "IAT_45136", C_Spell.GetSpellLink(462139), C_Spell.GetSpellLink(462139), C_Spell.GetSpellLink(462139), C_Spell.GetSpellLink(437620), C_Spell.GetSpellLink(462139)) },
						},
					},
					enabled = true,
					track = function() core._2657:NexusPrincessKyveza() end,
					partial = false,
					encounterID = 2920,
				},
				boss7 = {
					name = 2608, --The Silken Court
					bossIDs = {},
					achievement = 40730,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_TheSilkenCourt"], "IAT_217489", "IAT_228470", "IAT_217489", "IAT_217489", C_Spell.GetSpellLink(458622), "IAT_223781", C_Spell.GetSpellLink(458779)) },
						},
					},
					enabled = true,
					track = function() core._2657:SilkenCourt() end,
					partial = false,
					encounterID = 2921,
				},
				boss8 = {
					name = 2602, --Queen Ansurek
					bossIDs = {},
					achievement = 40266,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NerubarPalace_QueenAnsurek"], C_Spell.GetSpellLink(444306), C_Spell.GetSpellLink(445422), C_Spell.GetSpellLink(454847), C_Spell.GetSpellLink(454847)) },
						},
					},
					enabled = true,
					track = function() core._2657:QueenAnsurek() end,
					partial = false,
					encounterID = 2922,
					displayInfoFrame = true,
				},
			},

			[2769] = { --Undermine
				name = 1296,
				boss1 = {
					name = 2639, --Vexie and the Geargrinders
					bossIDs = {},
					achievement = 41208,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_VexieAndTheGeargrinders"] },
						},
					},
					enabled = true,
					track = function() core._2769:VexieAndTheGeargrinders() end,
					partial = false,
					encounterID = 3009,
				},
				boss2 = {
					name = 2640, --Cauldron of Carnage
					bossIDs = {},
					achievement = 41554,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_CauldronOfCarnage"], C_Spell.GetSpellLink(1219656), "IAT_235623", C_Spell.GetSpellLink(1219665), "IAT_235624", C_Spell.GetSpellLink(1219684), C_Spell.GetSpellLink(1219684)) },
						},
					},
					enabled = true,
					track = function() core._2769:CauldronOfCarnage() end,
					partial = false,
					encounterID = 3010,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2640, --Cauldron of Carnage
					bossIDs = {},
					achievement = 41694,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_CauldronOfCarnage2"], "IAT_238586", C_Spell.GetSpellLink(1221293), "IAT_229177", "IAT_229287", C_Spell.GetSpellLink(467901), "IAT_229181", "IAT_229177") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 3010,
				},
				boss4 = {
					name = 2640, --Cauldron of Carnage
					bossIDs = {},
					achievement = 41695,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_CauldronOfCarnage3"], "IAT_238587", C_Spell.GetSpellLink(1221300), "IAT_229181", "IAT_229288", C_Spell.GetSpellLink(467903), "IAT_229177", "IAT_229181") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 3010,
				},
				boss5 = {
					name = 2641, --Rik Reverb
					bossIDs = {},
					achievement = 41338,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_RikReverb"] },
						},
					},
					enabled = true,
					track = function() core._2769:RikReverb() end,
					partial = false,
					encounterID = 3011,
				},
				boss6 = {
					name = 2642, --Stix Bunkjunker
					bossIDs = {},
					achievement = 41596,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_StixBunkjunker"], C_Spell.GetSpellLink(464399), C_Spell.GetSpellLink(464149), C_Spell.GetSpellLink(464399), C_Spell.GetSpellLink(1219527), C_Spell.GetSpellLink(464399)) },
						},
					},
					enabled = true,
					track = function() core._2769:StixBunkjunker() end,
					partial = false,
					encounterID = 3012,
				},
				boss7 = {
					name = 2653, --Sprocketmonger Lockenstock
					bossIDs = {},
					achievement = 41711,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_SprocketmongerLockenstock"], C_Spell.GetSpellLink(1216414), C_Spell.GetSpellLink(1216525), C_Spell.GetSpellLink(1216674), C_Spell.GetSpellLink(1215858), C_Spell.GetSpellLink(1216699)) },
						},
					},
					enabled = true,
					track = function() core._2769:SprocketmongerLockenstock() end,
					partial = false,
					encounterID = 3013,
					displayInfoFrame = true,
				},
				boss8 = {
					name = 2644, --The One-Armed Bandit
					bossIDs = {},
					achievement = 41119,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_TheOneArmedBandit"] },
						},
					},
					enabled = true,
					track = function() core._2769:OneArmedBandit() end,
					partial = false,
					encounterID = 3014,
				},
				boss9 = {
					name = 2644, --The One-Armed Bandit
					bossIDs = {},
					achievement = 41120,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_TheOneArmedBandit2"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 3014,
				},
				boss10 = {
					name = 2644, --The One-Armed Bandit
					bossIDs = {},
					achievement = 41121,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_TheOneArmedBandit3"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 3014,
				},
				boss11 = {
					name = 2644, --The One-Armed Bandit
					bossIDs = {},
					achievement = 41122,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_TheOneArmedBandit4"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 3014,
				},
				boss12 = {
					name = 2645, --Mug'Zee Heads of Security
					bossIDs = {},
					achievement = 41337,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_MugZeeHeadsOfSecurity"], "IAT_236828", "IAT_236828", "IAT_236828", "IAT_238110", C_Spell.GetSpellLink(1216669)) },
						},
					},
					enabled = true,
					track = function() core._2769:MugZeeHeadsOfSecurity() end,
					partial = false,
					encounterID = 3015,
					displayInfoFrame = true,
				},
				boss13 = {
					name = 2645, --Mug'Zee Heads of Security
					bossIDs = {},
					achievement = 41211,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["LiberationOfUndermine_MugZeeHeadsOfSecurity2"], C_Spell.GetSpellLink(1213796), "IAT_228458", "IAT_229953", "IAT_229953", "IAT_228458", C_Spell.GetSpellLink(1213796)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 3015,
				},
				boss14 = {
					name = 2646, --Chrome King Gallywix
					bossIDs = {},
					achievement = 41347,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["LiberationOfUndermine_ChromeKingGallywix"] },
						},
					},
					enabled = true,
					track = function() core._2769:ChromeKingGallywix() end,
					partial = false,
					encounterID = 3016,
				},
			},

			[2810] = { --Manaforge Omega
				name = 1302,
				boss1 = {
					name = 2684, --Plexus Sentinel
					bossIDs = {},
					achievement = 42118,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_PlexusSentinel"], "IAT_243803", C_Spell.GetSpellLink(1220489), "IAT_243803", "IAT_243803", C_Spell.GetSpellLink(1233449), "IAT_243803") },
						},
					},
					enabled = true,
					track = function() core._2810:PlexusSentinel() end,
					partial = false,
					encounterID = 3129,
					displayInfoFrame = true,
				},
				boss2 = {
					name = 2686, --Loom'ithar
					bossIDs = {},
					achievement = 41613,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_Loomithar"], C_Spell.GetSpellLink(1246713), C_Spell.GetSpellLink(1246711), C_Spell.GetSpellLink(1246718)) },
						},
					},
					enabled = true,
					track = function() core._2810:Loomithar() end,
					partial = false,
					encounterID = 3131,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2685, --Soulbinder Naazindhri
					bossIDs = {},
					achievement = 41614,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_SoulbinderNaazindhri"], "IAT_248704", "IAT_248707", "IAT_248707") },
						},
					},
					enabled = true,
					track = function() core._2810:SoulbinderNaazindhri() end,
					partial = false,
					encounterID = 3130,
				},
				boss4 = {
					name = 2687, --Forgeweaver Araz
					bossIDs = {},
					achievement = 41615,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_ForgeweaverAraz"], "IAT_241923", "IAT_241923", "IAT_241923", "IAT_241923", "IAT_242589", "IAT_242589") },
						},
					},
					enabled = true,
					track = function() core._2810:ForgeweaverAraz() end,
					partial = false,
					encounterID = 3132,
				},
				boss5 = {
					name = 2688, --The Soul Hunters
					bossIDs = {},
					achievement = 41616,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_SoulHunters"], C_Spell.GetSpellLink(1247656), C_Spell.GetSpellLink(1246980)) },
						},
					},
					enabled = true,
					track = function() core._2810:SoulHunters() end,
					partial = false,
					encounterID = 3122,
					displayInfoFrame = true,
				},
				boss6 = {
					name = 2747, --Fractillus
					bossIDs = {},
					achievement = 41617,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["ManaforgeOmega_Fractillus"] },
						},
					},
					enabled = true,
					track = function() core._2810:Fractillus() end ,
					partial = false,
					encounterID = 3133,
					displayInfoFrame = true,
				},
				boss7 = {
					name = 2690, --Nexus-King Salhadaar
					bossIDs = {},
					achievement = 41618,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_NexusKingSalhadaar"], "IAT_228470", "IAT_228470") },
						},
					},
					enabled = true,
					track = function() core._2810:NexusKingSalhadaar() end,
					partial = false,
					encounterID = 3134,
				},
				boss8 = {
					name = 2691, --Dimensius, the All-Devouring
					bossIDs = {},
					achievement = 41619,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ManaforgeOmega_DimensiusTheAllDevouring"], C_Spell.GetSpellLink(1243577), "IAT_242587", C_Spell.GetSpellLink(1228206), C_Spell.GetSpellLink(1243577), C_Spell.GetSpellLink(1228206), C_Spell.GetSpellLink(1228206), C_Spell.GetSpellLink(1243577), C_Spell.GetSpellLink(1243577)) },
						},
					},
					enabled = true,
					track = function() core._2810:DimensiusTheAllDevouring() end,
					partial = false,
					encounterID = 3135,
					displayInfoFrame = true,
				},
			},
		},

		Dungeons = {
		},

		Delves = {
			[2664] = { --Fungal Folly
				name = 2437,
				boss1 = {
					name = L["Other"], --Sporesweeper (Fungal Folly)
					bossIDs = {},
					achievement = 40445,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Sporesweeper"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2681] = { --Kriegval's Rest
				name = 2443,
				boss1 = {
					name = L["Other"], --I TAKE Candle! (Kriegval's Rest)
					bossIDs = {},
					achievement = 40446,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_ITakeCandle"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2683] = { --The Waterworks
				name = 2500,
				boss1 = {
					name = L["Other"], --I TAKE Candle! (The Waterworks)
					bossIDs = {},
					achievement = 40446,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_ITakeCandle"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2688] = { --The Spiral Weave
				name = 2514,
				boss1 = {
					name = L["Other"], --Spider Senses (The Spiral Weave )
					bossIDs = {},
					achievement = 40453,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_SpiderSenses"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2686] = { --Nightfall Sanctum
				name = 2508,
				boss1 = {
					name = L["Other"], --Daystormer (Nightfall Sanctum)
					bossIDs = {},
					achievement = 40454,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_Daystormer"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2679] = { --Mycomancer Cavern
				name = 2509,
				boss1 = {
					name = L["Other"], --Sporesweeper (Myomancer Cavern)
					bossIDs = {},
					achievement = 40445,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Sporesweeper"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2767] = { --The Sinkhole
				name = 2659,
				boss1 = {
					name = L["Other"], --Just Keep Swimming (The Sinkhole)
					bossIDs = {},
					achievement = 40452,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_JustKeepSwimming"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2684] = { --The Dread Pit
				name = 2507,
				boss1 = {
					name = L["Other"], --Spider Senses (The Dread Pit)
					bossIDs = {},
					achievement = 40453,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_SpiderSenses"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2682] = { --Zekvir's Lair
				name = 2512,
			},

			[2768] = { --Tak-Rethan Abyss
				name = 2660,
				boss1 = {
					name = L["Other"], --Just Keep Swimming (Tak-Rethan Abyss)
					bossIDs = {},
					achievement = 40452,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_JustKeepSwimming"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2685] = { --Skittering Breach
				name = 2511,
				boss1 = {
					name = L["Other"], --Spider Senses (Skittering Breach)
					bossIDs = {},
					achievement = 40453,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_SpiderSenses"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2680] = { --Earthcrawl Mines
				name = 2522,
				boss1 = {
					name = L["Other"], --Spider Senses (Earthcrawl Mines)
					bossIDs = {},
					achievement = 40453,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_SpiderSenses"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},

			[2690] = { --The Underkeep
				name = 2533,
				boss1 = {
					name = L["Other"], --Spider Senses (The Underkeep)
					bossIDs = {},
					achievement = 40453,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Delves_SpiderSenses"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Other"],
				},
			},
		},
	},

	--Dragonflight
	[10] = {
		Raids = {
			[2522] = { --Vault of the Incarnates
				name = 1200,
				boss1 = {
					name = 2480, --Eranog
					bossIDs = {},
					achievement = 16335,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_Eranog"] },
						},
					},
					enabled = true,
					track = function() core._2522:Eranog() end,
					partial = false,
					encounterID = 2587,
				},
				boss2 = {
					name = 2500, --Terros
					bossIDs = {},
					achievement = 16365,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_Terros"] },
						},
					},
					enabled = true,
					track = function() core._2522:Terros() end,
					partial = false,
					encounterID = 2639,
				},
				boss3 = {
					name = 2486, --The Primal Council
					bossIDs = {},
					achievement = 16364,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_ThePrimalCouncil"] },
						},
					},
					enabled = true,
					track = function() core._2522:ThePrimalCouncil() end,
					partial = false,
					encounterID = 2590,
				},
				boss4 = {
					name = 2482, --Sennarth, The Cold Breath
					bossIDs = {},
					achievement = 16419,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_SennarthTheColdBreath"] },
						},
					},
					enabled = true,
					track = function() core._2522:SennarthTheColdBreath() end,
					partial = false,
					encounterID = 2592,
				},
				boss5 = {
					name = 2502, --Dathea, Ascended
					bossIDs = {},
					achievement = 16458,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_DatheaAscended"] },
						},
					},
					enabled = true,
					track = function() core._2522:DatheaAscended() end,
					partial = false,
					encounterID = 2635,
				},
				boss6 = {
					name = 2491, --Kurog Grimtotem
					bossIDs = {},
					achievement = 16450,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_KurogGrimtotem"] },
						},
					},
					enabled = true,
					track = function() core._2522:KurogGrimtotem() end,
					partial = false,
					encounterID = 2605,
				},
				boss7 = {
					name = 2493, --Broodkeeper Diurna
					bossIDs = {},
					achievement = 16442,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_BroodkeeperDiurna"] },
						},
					},
					enabled = true,
					track = function() core._2522:BroodkeeperDiurna() end,
					partial = false,
					encounterID = 2614,
					displayInfoFrame = true,
				},
				boss8 = {
					name = 2499, --Raszageth the Storm-Eater
					bossIDs = {},
					achievement = 16451,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["VaultOfTheIncarnates_RaszagethTheStormEater"] },
						},
					},
					enabled = true,
					track = function() core._2522:RaszagethTheStormEater() end,
					partial = false,
					encounterID = 2607,
				},
			},

			[2569] = { --Aberrus the Shadowed Crucible
				name = 1208,
				boss1 = {
					name = 2522, --Kazzara
					bossIDs = {},
					achievement = 18229,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_Kazzara"], "IAT_205674", C_Spell.GetSpellLink(411919), C_Spell.GetSpellLink(400430), C_Spell.GetSpellLink(411921)) },
						},
					},
					enabled = true,
					track = function() core._2569:KazzaraTheHellforged() end,
					partial = false,
					encounterID = 2688,
					displayInfoFrame = true,
				},
				boss2 = {
					name = 2529, --The Amalgamation Chamber
					bossIDs = {},
					achievement = 18168,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_TheAmalgamationChamber"], "IAT_205989", C_Spell.GetSpellLink(404732), "IAT_201773", C_Spell.GetSpellLink(405016), "IAT_76209", C_Spell.GetSpellLink(405641), "IAT_201934", "IAT_205378", "IAT_201773", "IAT_205989", "IAT_205989", C_Spell.GetSpellLink(404732), "IAT_205989", "IAT_201773", "IAT_76209", "IAT_205989", C_Spell.GetSpellLink(405016), C_Spell.GetSpellLink(405641), "IAT_205378") },
						},
					},
					enabled = true,
					track = function() core._2569:ShadowflameAmalgamation() end,
					partial = false,
					encounterID = 2687,
				},
				boss3 = {
					name = 2530, --The Forgotten Experiments
					bossIDs = {},
					achievement = 18173,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_TheForgottenExperiments"], "IAT_202800", "IAT_202800", "IAT_205352", "IAT_205352", "IAT_200912", C_Spell.GetSpellLink(406358), "IAT_205352", "IAT_200913", C_Spell.GetSpellLink(405492), "IAT_205352", "IAT_200918", "IAT_205352", C_Spell.GetSpellLink(411118), "IAT_205352") },
						},
					},
					enabled = true,
					track = function() core._2569:TheForgottenExperiments() end,
					partial = false,
					encounterID = 2693,
				},
				boss4 = {
					name = 2524, --Assault of the Zaqali
					bossIDs = {},
					achievement = 18228,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_AssaultOfTheZaqali"], C_Spell.GetSpellLink(411834), "IAT_202621", "IAT_198484", "IAT_205665", "IAT_192104", "IAT_205667", "IAT_205627", "IAT_192104", "IAT_202621", "IAT_198484", C_Spell.GetSpellLink(411834), "IAT_201340", C_Spell.GetSpellLink(401258), "IAT_201340", C_Spell.GetSpellLink(401258), C_Spell.GetSpellLink(411834), C_Spell.GetSpellLink(411834), "IAT_205627", "IAT_205667", C_Spell.GetSpellLink(411834)) },
						},
					},
					enabled = true,
					track = function() core._2569:AssaultOfTheZaqali() end,
					partial = false,
					encounterID = 2682,
				},
				boss5 = {
					name = 2525, --Rashok the Elder
					bossIDs = {},
					achievement = 18230,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_RashokTheElder"], "IAT_201320", "IAT_205630", "IAT_205630", C_Spell.GetSpellLink(405821), "IAT_205630", "IAT_205630", C_Spell.GetSpellLink(405821), "IAT_205630") },
						},
					},
					enabled = true,
					track = function() core._2569:RashokTheElder() end,
					partial = false,
					encounterID = 2680,
				},
				boss6 = {
					name = 2532, --The Vigilant Steward Zskarn
					bossIDs = {},
					achievement = 18193,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_TheVigilantStewardZskarn"], "IAT_202637", C_Spell.GetSpellLink(411635), C_Spell.GetSpellLink(412323)) },
						},
					},
					enabled = true,
					track = function() core._2569:TheVigilantStewardZskarn() end,
					partial = false,
					encounterID = 2689,
				},
				boss7 = {
					name = 2527, --Magmorax
					bossIDs = {},
					achievement = 18172,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_Magmorax"], "IAT_205437", C_Spell.GetSpellLink(411368), "IAT_205437", C_Spell.GetSpellLink(411573), C_Spell.GetSpellLink(411581)) },
						},
					},
					enabled = true,
					track = function() core._2569:Magmorax() end,
					partial = false,
					encounterID = 2683,
					displayInfoFrame = true,
				},
				boss8 = {
					name = 2523, --Echo of Neltharion
					bossIDs = {},
					achievement = 18149,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_EchoOfNeltharion"], "IAT_185437", "IAT_205340", "IAT_201261", "IAT_205341", "IAT_202637", "IAT_201320", "IAT_205343", "IAT_202637", "IAT_205342", "IAT_205343", C_Spell.GetSpellLink(401022), C_Spell.GetSpellLink(407790), C_Spell.GetSpellLink(407221), C_Spell.GetSpellLink(401022), "IAT_205343") },
						},
					},
					enabled = true,
					track = function() core._2569:EchoOfNeltharion() end,
					partial = false,
					encounterID = 2684,
				},
				boss9 = {
					name = 2520, --Scalecommander Sarkareth
					bossIDs = {},
					achievement = 17877,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AberrusTheShadowedCrucible_ScalecommanderSarkareth"], "IAT_185437", "IAT_193335", C_Spell.GetSpellLink(410271), C_Spell.GetSpellLink(410277), C_Spell.GetSpellLink(410277), C_Spell.GetSpellLink(401952), C_Spell.GetSpellLink(401215), C_Spell.GetSpellLink(410277), C_Spell.GetSpellLink(410285), C_Spell.GetSpellLink(401215), C_Spell.GetSpellLink(401952)) },
						},
					},
					enabled = true,
					track = function() core._2569:ScalecommanderSarkareth() end,
					partial = false,
					encounterID = 2685,
					displayInfoFrame = true,
				},
			},

			[2549] = { --Amirdrassil the Dream's Hope
				name = 1207,
				boss1 = {
					name = 2564, --Gnarlroot
					bossIDs = {},
					achievement = 19322,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_Gnarlroot"], "IAT_209333", C_Spell.GetSpellLink(421350), C_Spell.GetSpellLink(421038)) },
						},
					},
					enabled = true,
					track = function() core._2549:Gnarlroot() end,
					partial = false,
					encounterID = 2820,
				},
				boss2 = {
					name = 2554, --Igira the Cruel
					bossIDs = {},
					achievement = 19320,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_IgiraTheCruel"], "IAT_206689", "IAT_212668", C_Spell.GetSpellLink(414425), "IAT_212668") },
						},
					},
					enabled = true,
					track = function() core._2549:IgiraTheCruel() end,
					partial = false,
					encounterID = 2709,
				},
				boss3 = {
					name = 2557, --Volcoross
					bossIDs = {},
					achievement = 19321,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_Volcoross"], C_Spell.GetSpellLink(426751), C_Spell.GetSpellLink(426751), "IAT_211272", C_Spell.GetSpellLink(426751), "IAT_211272", "IAT_211272", "IAT_211273", "IAT_211273", "IAT_208478", "IAT_208478", "IAT_211273") },
						},
					},
					enabled = true,
					track = function() core._2549:Volcoross() end,
					partial = false,
					encounterID = 2737,
				},
				boss4 = {
					name = 2555, --Council of Dreams
					bossIDs = {},
					achievement = 19193,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_CouncilOfDreams"], "IAT_209490", "IAT_209490", "IAT_189620", C_Spell.GetSpellLink(418720), "IAT_209490", "IAT_209490") },
						},
					},
					enabled = true,
					track = function() core._2549:CouncilOfDreams() end,
					partial = false,
					encounterID = 2728,
					displayInfoFrame = true,
				},
				boss5 = {
					name = 2553, --Larodar, Keeper of the Flame
					bossIDs = {},
					achievement = 19089,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_LarodarKeeperOfTheFlame"], "IAT_208478", "IAT_211268", "IAT_211268", C_Spell.GetSpellLink(417634), C_Spell.GetSpellLink(424595), "IAT_208459", "IAT_208849", C_Spell.GetSpellLink(425249), "IAT_211268", "IAT_84152", "IAT_211268") },
						},
					},
					enabled = true,
					track = function() core._2549:Larodar() end,
					partial = false,
					encounterID = 2731,
				},
				boss6 = {
					name = 2556, --Nymue, Weaver of the Cycle
					bossIDs = {},
					achievement = 19394,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_NymueWeaverOfTheCycle"], C_Spell.GetSpellLink(429721), "IAT_214020", "IAT_214020") },
						},
					},
					enabled = true,
					track = function() core._2549:Nymue() end,
					partial = false,
					encounterID = 2708,
				},
				boss7 = {
					name = 2563, --Smolderon
					bossIDs = {},
					achievement = 19319,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_Smolderon"], "IAT_214082", C_Spell.GetSpellLink(426312), C_Spell.GetSpellLink(426337), C_Spell.GetSpellLink(426484)) },
						},
					},
					enabled = true,
					track = function() core._2549:Smolderon() end,
					partial = false,
					encounterID = 2824,
				},
				boss8 = {
					name = 2565, --Tindral Sageswift
					bossIDs = {},
					achievement = 19393,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_TindralSageswift"], "IAT_1043", "IAT_1043", C_Spell.GetSpellLink(428781), "IAT_1043") },
						},
					},
					enabled = true,
					track = function() core._2549:TindralSageswift() end,
					partial = false,
					encounterID = 2786,
				},
				boss9 = {
					name = 2519, --Fyrakk the Blazing
					bossIDs = {},
					achievement = 19390,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AmirdrassilTheDreamsHope_FyrakkTheBlazing"], "IAT_185409", "IAT_97551", "IAT_206689", "IAT_206172", C_Spell.GetSpellLink(431585), "IAT_207800", "IAT_97551", "IAT_207800", "IAT_4155", "IAT_4092", "IAT_4218", "IAT_4159", "IAT_4167", "IAT_4223", "IAT_157298", "IAT_185409", "IAT_157298") },
						},
					},
					enabled = true,
					track = function() core._2549:FyrakkTheBlazing() end,
					partial = false,
					encounterID = 2677,
				},
			},
		},

		Dungeons = {
			[2579] = { --Dawn of the Infinite
				name = 1209,
				boss1 = {
					name = 2521, --Chronikar
					bossIDs = {},
					achievement = 18589,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["DawnOfTheInfinite_Chronikar"] },
						},
					},
					enabled = true,
					track = function() core._2579:Chronikar() end,
					partial = false,
					encounterID = 2666,
				},
				boss2 = {
					name = 2528, --Manifested Timeways
					bossIDs = {},
					achievement = 18556,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["DawnOfTheInfinite_ManifestedTimeways"] },
						},
					},
					enabled = true,
					track = function() core._2579:ManifestedTimeways() end,
					partial = false,
					encounterID = 2667,
				},
				boss3 = {
					name = 2535, --Blight ofGalakrond
					bossIDs = {},
					achievement = 18612,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["DawnOfTheInfinite_BlightOfGalakrond"] },
						},
					},
					enabled = true,
					track = function() core._2579:BlightOfGalarond() end,
					partial = false,
					encounterID = 2668,
				},
				boss4 = {
					name = 2526, --Tyr The Infinite Keeper
					bossIDs = {},
					achievement = 18539,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["DawnOfTheInfinite_TyrTheInfiniteKeeper"] },
						},
					},
					enabled = true,
					track = function() core._2579:TyrTheInfiniteKeeper() end,
					partial = false,
					encounterID = 2670,
				},
				boss5 = {
					name = L["Instances_Other"], --Put That Thing Back Where It Came From
					bossIDs = {},
					achievement = 18706,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["DawnOfTheInfinite_PutThatThingBackWhereItCameFrom"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[2526] = { --Algeth'ar Academy
				name = 1201,
				boss1 = {
					name = 2509, --Vexamus
					bossIDs = {},
					achievement = 16434,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AlgetharAcademy_Vexamus"], C_Spell.GetSpellLink(387691), C_Spell.GetSpellLink(387691)) },
						},
					},
					enabled = true,
					track = function() core._2526:Vexamus() end,
					partial = false,
					encounterID = 2562,
				},
				boss2 = {
					name = 2495, --Crawth
					bossIDs = {},
					achievement = 16441,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AlgetharAcademy_Crawth"], "IAT_191736", C_Spell.GetSpellLink(377182)) },
						},
					},
					enabled = true,
					track = function() core._2526:Crawth() end,
					partial = false,
					encounterID = 2564,
				},
				boss3 = {
					name = 2512, --Overgrown Ancient
					bossIDs = {},
					achievement = 16329,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AlgetharAcademy_OvergrownAncient"], C_Spell.GetSpellLink(392005)) },
						},
					},
					enabled = true,
					track = function() core._2526:OvergrownAncient() end,
					partial = false,
					encounterID = 2563,
					displayInfoFrame = true,
				},
			},

			[2520] = { --Brackenhide Hollow
				name = 1196,
				boss1 = {
					name = 2471, --Hackclaw's War-Band
					bossIDs = {},
					achievement = 16296,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["BrackenhideHollow_HackclawsWarBand"] },
						},
					},
					enabled = true,
					track = function() core._2520:HackclawsWarBand() end,
					partial = false,
					encounterID = 2570,
				},
				boss2 = {
					name = 2473, --Treemouth
					bossIDs = {},
					achievement = 16430,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BrackenhideHollow_Treemouth"], C_Spell.GetSpellLink(383875), "IAT_186120", C_Spell.GetSpellLink(378022), C_Spell.GetSpellLink(378022), C_Spell.GetSpellLink(383875)) },
						},
					},
					enabled = true,
					track = function() core._2520:Treemouth() end,
					partial = false,
					encounterID = 2568,
				},
				boss3 = {
					name = 2474, --Decatriarch Wratheye
					bossIDs = {},
					achievement = 16404,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["BrackenhideHollow_DecatriarchWratheye"] },
						},
					},
					enabled = true,
					track = function() core._2520:DecatriarchWratheye() end,
					partial = false,
					encounterID = 2569,
				},
			},

			[2527] = { --Halls of Infusion
				name = 1204,
				boss2 = {
					name = 2507, --Gulping Goliath
					bossIDs = {},
					achievement = 16426,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfInfusion_GulpingGoliath"], "IAT_189722", C_Spell.GetSpellLink(385187), "IAT_195399", C_Spell.GetSpellLink(385743), "IAT_195399", C_Spell.GetSpellLink(385555), C_Spell.GetSpellLink(385555), "IAT_189722", "IAT_195399", C_Spell.GetSpellLink(385743), "IAT_195399", C_Spell.GetSpellLink(385555), "IAT_195399", C_Spell.GetSpellLink(385555)) },
						},
					},
					enabled = true,
					track = function() core._2527:GulpingGoliath() end,
					partial = false,
					encounterID = 2616,
				},
				boss3 = {
					name = 2511, --Primal Tsunami
					bossIDs = {},
					achievement = 16427,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfInfusion_PrimalTsunami"], "IAT_198527", "IAT_198527") },
						},
					},
					enabled = true,
					track = function() core._2527:PrimalTsunami() end,
					partial = false,
					encounterID = 2618,
				},
				boss1 = {
					name = L["Instances_Other"], --Toxicity Strike Team
					bossIDs = {},
					achievement = 16517,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfInfusion_ToxicityStrikeTeam"], C_Spell.GetSpellLink(391694), "IAT_197774") },
						},
					},
					enabled = true,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[2519] = { --Neltharus
				name = 1199,
				boss1 = {
					name = 2490, --Chargath, Bane of Scales
					bossIDs = {},
					achievement = 16438,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Neltharus_ChargathBaneOfScales"], C_Spell.GetSpellLink(375055), C_Spell.GetSpellLink(374482), "IAT_189340") },
						},
					},
					enabled = true,
					track = function() core._2519:ChargathBaneOfScales() end,
					partial = false,
					encounterID = 2613,
				},
				boss2 = {
					name = 2489, --Forgemaster Gorek
					bossIDs = {},
					achievement = 16432,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Neltharus_ForgemasterGorek"], C_Spell.GetSpellLink(375241), C_Spell.GetSpellLink(381482), C_Spell.GetSpellLink(375061), C_Spell.GetSpellLink(374812), C_Spell.GetSpellLink(374533)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2612,
				},
				boss3 = {
					name = 2494, --Magmatusk
					bossIDs = {},
					achievement = 16453,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Neltharus_Magmatusk"], C_Spell.GetSpellLink(391662), "IAT_181861", C_Spell.GetSpellLink(374410)) },
						},
					},
					enabled = true,
					track = function() core._2519:Magmatusk() end,
					partial = false,
					encounterID = 2610,
				},
			},

			[2521] = { --Ruby Life Pools
				name = 1202,
				boss1 = {
					name = 2503, --Kyrakka and Erkhart Stormvein
					bossIDs = {},
					achievement = 16440,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["RubyLifePools_KyrakkaAndErkhartStormvein"] },
						},
					},
					enabled = true,
					track = function() core._2521:KyrakkaAndErkhartStormvein() end,
					partial = false,
					encounterID = 2623,
				},
				boss2 = {
					name = 2488, --Melidrussa Chillworn
					bossIDs = {},
					achievement = 16402,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["RubyLifePools_MelidrussaChillworn"], "IAT_188252", "IAT_187894", "IAT_187894") },
						},
					},
					enabled = true,
					track = function() core._2521:Melidrussa() end,
					partial = false,
					encounterID = 2609,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2485, --Kokia Blazehoof
					bossIDs = {},
					achievement = 16320,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["RubyLifePools_KokiaBlazehoof"] },
						},
					},
					enabled = true,
					track = function() core._2521:KokiaBlazehoof() end,
					partial = false,
					encounterID = 2606,
				},
			},

			[2515] = { --The Azure Vault
				name = 1203,
				boss1 = {
					name = 2508, --Umbrelskul
					bossIDs = {},
					achievement = 16330,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TheAzureVault_Umbrelskul"] },
						},
					},
					enabled = true,
					track = nil,
					partial = false,
					encounterID = 2584,
				},
				boss2 = {
					name = 2508, --Umbrelskul
					bossIDs = {},
					achievement = 16331,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TheAzureVault_Umbrelskul2"] },
						},
					},
					enabled = true,
					track = function() core._2515:Umbrelskul2() end,
					partial = false,
					encounterID = 2584,
				},
				boss3 = {
					name = 2483, --Telash Greywing
					bossIDs = {},
					achievement = 16445,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TheAzureVault_TelashGreywing"] },
						},
					},
					enabled = true,
					track = function() core._2515:TelashGreywing() end,
					partial = false,
					encounterID = 2583,
				},
			},

			[2516] = { --The Nokhud Offensive
				name = 1198,
				boss2 = {
					name = 2497, --The Raging Tempest
					bossIDs = {},
					achievement = 16447,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TheNokhudOffensive_TheRagingTempest"] },
						},
					},
					enabled = true,
					track = function() core._2516:RagingTempest() end,
					partial = false,
					encounterID = 2636,
				},
				boss3 = {
					name = 2478, --Teera and Maruuk
					bossIDs = {},
					achievement = 16456,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNokhudOffensive_TeeraAndMaruuk"], C_Spell.GetSpellLink(392531), C_Spell.GetSpellLink(392419), C_Spell.GetSpellLink(392541)) },
						},
					},
					enabled = true,
					track = function() core._2516:TeeraAndMaruuk() end,
					partial = false,
					encounterID = 2581,
				},
				boss4 = {
					name = 2477, --Balakar Khan
					bossIDs = {},
					achievement = 16602,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNokhudOffensive_BalakarKhan"], "IAT_112464", "IAT_186151", C_Spell.GetSpellLink(376727), "IAT_112464", C_Spell.GetSpellLink(376727), "IAT_112464") },
						},
					},
					enabled = true,
					track = function() core._2516:BalakarKhan() end,
					partial = false,
					encounterID = 2580,
				},
				boss1 = {
					name = L["Instances_Other"], --Ohuna Incubation
					bossIDs = {},
					achievement = 16620,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TheNokhudOffensive_OhunaIncubation"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[2451] = { --Uldaman: Legacy of Tyr
				name = 1197,
				boss1 = {
					name = 2487, --Bromach
					bossIDs = {},
					achievement = 16337,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["UldamanLegacyOfTyr_Bromach"], "IAT_184018", "IAT_2889", "IAT_2889") },
						},
					},
					enabled = true,
					track = function() core._2451:Bromach() end,
					partial = false,
					encounterID = 2556,
				},
				boss2 = {
					name = 2484, --Sentinel Talondras
					bossIDs = {},
					achievement = 16282,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["UldamanLegacyOfTyr_SentinelTalondras"] },
						},
					},
					enabled = true,
					track = function() core._2451:SentinelTalondras() end,
					partial = false,
					encounterID = 2557,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2479, --Chrono-Lord Deios
					bossIDs = {},
					achievement = 16281,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["UldamanLegacyOfTyr_ChronoLordDeios"], C_Spell.GetSpellLink(376292)) },
						},
					},
					enabled = true,
					track = function() core._2451:ChronoLordDeios() end,
					partial = false,
					encounterID = 2559,
				},
			},
		},
	},

	--Shadowlands
	[9] = {
		Raids = {
			[2450] = { --Sanctum of Domination
				name = 1193,
				boss1 = {
					name = 2435, --The Tarragrue
					bossIDs = {},
					achievement = 14998,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_TheTarragrue"], "IAT_166246", "IAT_178783", C_Spell.GetSpellLink(347671), C_Spell.GetSpellLink(347967), C_Spell.GetSpellLink(186257), C_Spell.GetSpellLink(186265)) },
						},
					},
					enabled = true,
					track = function() core._2450:TheTarragrue() end,
					partial = false,
					encounterID = 2423,
				},
				boss2 = {
					name = 2442, --Eye of the Jailer
					bossIDs = {},
					achievement = 15065,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_EyeOfTheJailer"], C_Spell.GetSpellLink(355379), "IAT_179850", C_Spell.GetSpellLink(348969), C_Spell.GetSpellLink(355379), "IAT_178095", "IAT_178095", C_Spell.GetSpellLink(355427), C_Spell.GetSpellLink(355379), C_Spell.GetSpellLink(355427), C_Spell.GetSpellLink(355379), C_Spell.GetSpellLink(355427)) },
						},
					},
					enabled = true,
					track = function() core._2450:EyeOfTheJailer() end,
					partial = false,
					encounterID = 2433,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2439, --The Nine
					bossIDs = {},
					achievement = 15003,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_TheNine"], "IAT_178684", C_Spell.GetSpellLink(350541), C_Spell.GetSpellLink(350541), C_Spell.GetSpellLink(350555), C_Spell.GetSpellLink(350555)) },
						},
					},
					enabled = true,
					track = function() core._2450:TheNine() end,
					partial = false,
					encounterID = 2429,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 2444, --Remnant of Ner'zhul
					bossIDs = {},
					achievement = 15058,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_RemnantOfNerzhul"], C_Spell.GetSpellLink(349908), C_Spell.GetSpellLink(349908)) },
						},
					},
					enabled = true,
					track = function() core._2450:RemnantOfNerZhul() end,
					partial = false,
					encounterID = 2432,
				},
				boss5 = {
					name = 2445, --Soulrender Dormazain
					bossIDs = {},
					achievement = 15105,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_SoulrenderDormazain"], "IAT_68336", C_Spell.GetSpellLink(356731), C_Spell.GetSpellLink(356731), C_Spell.GetSpellLink(350217), C_Spell.GetSpellLink(352933), C_Spell.GetSpellLink(352933), C_Spell.GetSpellLink(77761), C_Spell.GetSpellLink(350217), C_Spell.GetSpellLink(352933)) },
						},
					},
					enabled = true,
					track = function() core._2450:SoulrenderDormazain() end,
					partial = false,
					encounterID = 2434,
					displayInfoFrame = true,
				},
				boss6 = {
					name = 2443, --Painsmith Raznal
					bossIDs = {},
					achievement = 15131,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_PainsmithRaznal"], "IAT_177584", "IAT_177584", C_Spell.GetSpellLink(350653), "IAT_177584") },
						},
					},
					enabled = true,
					track = function() core._2450:PainsmithRaznal() end,
					partial = false,
					encounterID = 2430,
				},
				boss7 = {
					name = 2446, --Guardian of the First Ones
					bossIDs = {},
					achievement = 15132,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_GuardianOfTheFirstOnes"], "IAT_180690", "IAT_180690", "IAT_180690", "IAT_176583", C_Spell.GetSpellLink(352394), C_Spell.GetSpellLink(358441), C_Spell.GetSpellLink(357396), C_Spell.GetSpellLink(357402), "IAT_180690", "IAT_180690") },
						},
					},
					enabled = true,
					track = function() core._2450:GuardianOfTheFirstOnes() end,
					partial = false,
					encounterID = 2436,
				},
				boss8 = {
					name = 2447, --Fatescribe Roh-Kalo
					bossIDs = {},
					achievement = 15040,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_FatescribeRohKalo"], C_Spell.GetSpellLink(353162), C_Spell.GetSpellLink(350355), C_Spell.GetSpellLink(350819), C_Spell.GetSpellLink(350826)) },
						},
					},
					enabled = true,
					track = function() core._2450:FatescribeRohKalo() end,
					partial = false,
					encounterID = 2431,
					displayInfoFrame = true,
				},
				boss9 = {
					name = 2440, --Kel'Thuzad
					bossIDs = {},
					achievement = 15108,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_KelThuzad"], "IAT_68655", "IAT_152253", "IAT_178095", "IAT_180860", "IAT_166313", "IAT_68655", "IAT_166313", C_Spell.GetSpellLink(356491), "IAT_68655") },
						},
					},
					enabled = true,
					track = function() core._2450:KelThuzad() end,
					partial = false,
					encounterID = 2422,
				},
				boss10 = {
					name = 2441, --Sylvanas Windrunner
					bossIDs = {},
					achievement = 15133,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanctumOfDomination_SylvanasWindrunner"], "IAT_180658", "IAT_180658", "IAT_180658", "IAT_180658", "IAT_180658", "IAT_180658") },
						},
					},
					enabled = true,
					track = function() core._2450:SylvanasWindrunner() end,
					partial = false,
					encounterID = 2435,
					displayInfoFrame = true,
				},
			},

			[2296] = { --Castle Nathria
				name = 1190,
				boss1 = {
					name = 2393, --Shriekwing
					bossIDs = {},
					achievement = 14293,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_Shriekwing"], "IAT_174626", C_Spell.GetSpellLink(340324), C_Spell.GetSpellLink(330711), C_Spell.GetSpellLink(342074), "IAT_174626", "IAT_174626", C_Spell.GetSpellLink(342074), C_Spell.GetSpellLink(330711)) },
						},
					},
					enabled = true,
					track = function() core._2296:Shriekwing() end,
					partial = false,
					encounterID = 2398,
				},
				boss2 = {
					name = 2429, --Huntsman Altimor
					bossIDs = {},
					achievement = 14523,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_HuntsmanAltimor"], "IAT_165066", C_Spell.GetSpellLink(334860), "IAT_169458") },
						},
					},
					enabled = true,
					track = function() core._2296:HuntsmanAltimor() end,
					partial = false,
					encounterID = 2418,
				},
				boss3 = {
					name = 2422, --Sun King's Salvation
					bossIDs = {},
					achievement = 14608,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_SunKingsSalvation"], "IAT_165805", "IAT_173768", C_Spell.GetSpellLink(326455), "IAT_173770", C_Spell.GetSpellLink(329509), "IAT_173769", C_Spell.GetSpellLink(328579), "IAT_168962", "IAT_173769", "IAT_173767", C_Spell.GetSpellLink(325877), C_Spell.GetSpellLink(325877), "IAT_173767") },
						},
					},
					enabled = true,
					track = function() core._2296:Kaelthas() end,
					partial = false,
					encounterID = 2402,
				},
				boss4 = {
					name = 2418, --Artificer Xy'mox
					bossIDs = {},
					achievement = 14617,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_ArtificerXymox"], "IAT_173945", C_Spell.GetSpellLink(328437), "IAT_173951", C_Spell.GetSpellLink(341135), C_Spell.GetSpellLink(341186), C_Spell.GetSpellLink(341253), "IAT_166644", "IAT_173951", "IAT_173945", "IAT_166644", C_Spell.GetSpellLink(328437), "IAT_173945", "IAT_173945", "IAT_173945", C_Spell.GetSpellLink(328437), "IAT_173945", C_Spell.GetSpellLink(329090), C_Spell.GetSpellLink(328880)) },
						},
					},
					enabled = true,
					track = function() core._2296:ArtificerXymox() end,
					partial = false,
					encounterID = 2405,
				},
				boss5 = {
					name = 2428, --Hungering Destroyer
					bossIDs = {},
					achievement = 14376,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_HungeringDestroyer"], C_Spell.GetSpellLink(334266), C_Spell.GetSpellLink(334266)) },
						},
					},
					enabled = true,
					track = function() core._2296:HungeringDestroyer() end,
					partial = false,
					encounterID = 2383,
				},
				boss6 = {
					name = 2420, --Lady Inerva Darkvein
					bossIDs = {},
					achievement = 14524,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_LadyInervaDarkvein"], "IAT_69820", C_Spell.GetSpellLink(339276), "IAT_69427", "IAT_69427", C_Spell.GetSpellLink(80353), "IAT_69427") },
						},
					},
					enabled = true,
					track = function() core._2296:LadyInervaDarkvein() end,
					partial = false,
					encounterID = 2406,
				},
				boss7 = {
					name = 2426, --Council of Blood
					bossIDs = {},
					achievement = 14619,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_Council of Blood"], "IAT_171146") },
						},
					},
					enabled = true,
					track = function() core._2296:CouncilOfBlood() end,
					partial = false,
					encounterID = 2412,
				},
				boss8 = {
					name = 2394, --Sludgefist
					bossIDs = {},
					achievement = 14294,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_Sludgefist"], "IAT_174073", "IAT_174733", "IAT_174733", "IAT_174073", "IAT_174073") },
						},
					},
					enabled = true,
					track = function() core._2296:Sludgefist() end,
					partial = false,
					encounterID = 2399,
				},
				boss9 = {
					name = 2425, --Stone Legion Generals
					bossIDs = {},
					achievement = 14525,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_StoneLegionGenerals"], C_Spell.GetSpellLink(339565), C_Spell.GetSpellLink(332393), C_Spell.GetSpellLink(339565), C_Spell.GetSpellLink(339574), C_Spell.GetSpellLink(339574)) },
						},
					},
					enabled = true,
					track = function() core._2296:StoneLegionGenerals() end,
					partial = false,
					encounterID = 2417,
					displayInfoFrame = true,
				},
				boss10 = {
					name = 2424, --Sire Denathrius
					bossIDs = {},
					achievement = 14610,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CastleNathria_SireDenathrius"], C_Spell.GetSpellLink(326699), "IAT_173685", C_Spell.GetSpellLink(328117), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326699), "IAT_173685", C_Spell.GetSpellLink(326699), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(326707), C_Spell.GetSpellLink(328117), C_Spell.GetSpellLink(326699), "IAT_173685") },
						},
					},
					enabled = true,
					track = function() core._2296:SireDenathrius() end,
					partial = false,
					encounterID = 2407,
					displayInfoFrame = true,
				},
			},

			[2481] = { --Sepulcher of the First Ones
				name = 1195,
				boss1 = {
					name = 2458, --Vigilant Guardian
					bossIDs = {},
					achievement = 15381,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_VigilantGuardian"], "IAT_184759", "IAT_183928", "IAT_184759", "IAT_184759", C_Spell.GetSpellLink(360412), "IAT_183928", C_Spell.GetSpellLink(360412), "IAT_184759") },
						},
					},
					enabled = true,
					track = function() core._2481:VigilantGuardian() end,
					partial = false,
					encounterID = 2512,
				},
				boss2 = {
					name = 2459, --Dausegne, the Fallen Oracle
					bossIDs = {},
					achievement = 15397,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_DausegneTheFallenOracle"], "IAT_185074", "IAT_183406", "IAT_181224", C_Spell.GetSpellLink(361751), C_Spell.GetSpellLink(361513), "IAT_185074", C_Spell.GetSpellLink(361751), "IAT_185074") },
						},
					},
					enabled = true,
					track = function() core._2481:Dausegne() end,
					partial = false,
					encounterID = 2540,
				},
				boss3 = {
					name = 2470, --Artificer Xy'mox
					bossIDs = {},
					achievement = 15398,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_ArtificerXymox"], "IAT_185427", "IAT_166644", C_Spell.GetSpellLink(367220), "IAT_185438", C_Spell.GetSpellLink(367275), "IAT_185439", C_Spell.GetSpellLink(367278), C_Spell.GetSpellLink(367275)) },
						},
					},
					enabled = true,
					track = function() core._2481:Xymox() end,
					partial = false,
					encounterID = 2553,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 2460, --Prototype Pantheon
					bossIDs = {},
					achievement = 15400,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_PrototypePantheon"], "IAT_185479", "IAT_181546", C_Spell.GetSpellLink(361305), "IAT_185456", "IAT_185480", "IAT_185456", C_Spell.GetSpellLink(367322), C_Spell.GetSpellLink(367322)) },
						},
					},
					enabled = true,
					track = function() core._2481:PrototypePantheon() end,
					partial = false,
					encounterID = 2544,
					displayInfoFrame = true,
				},
				boss5 = {
					name = 2461, --Lihuvim, Principal Architect
					bossIDs = {},
					achievement = 15419,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_LihuvimPrincipalArchitect"], "IAT_102950", "IAT_102950", "IAT_185423", "IAT_185423", "IAT_185423", "IAT_181579", "IAT_185423", "IAT_102950", "IAT_132523", "IAT_144341") },
						},
					},
					enabled = true,
					track = function() core._2481:Lihuvim() end,
					partial = false,
					encounterID = 2539,
				},
				boss6 = {
					name = 2465, --Skolex, the Insatiable Ravener
					bossIDs = {},
					achievement = 15401,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_SkolexTheInsatiableRavener"], C_Spell.GetSpellLink(359770), "IAT_183937", "IAT_183937") },
						},
					},
					enabled = true,
					track = function() core._2481:Skolex() end,
					partial = false,
					encounterID = 2542,
				},
				boss7 = {
					name = 2463, --Halondrus the Reclaimer
					bossIDs = {},
					achievement = 15386,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_HalondrusTheReclaimer"], "IAT_184823", "IAT_184915", "IAT_184823", "IAT_184823", "IAT_184823", "IAT_184823", "IAT_181012", "IAT_181012", "IAT_184823", "IAT_181012") },
						},
					},
					enabled = true,
					track = function() core._2481:HalondrusTheReclaimer() end,
					partial = false,
					encounterID = 2529,
					displayInfoFrame = true,
				},
				boss8 = {
					name = 2469, --Anduin Wrynn
					bossIDs = {},
					achievement = 15399,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_AnduinWrynn"], "IAT_160859", "IAT_183042", "IAT_166644", "IAT_184915", C_Spell.GetSpellLink(362405), "IAT_185005", "IAT_185005", "IAT_56839", "IAT_185005") },
						},
					},
					enabled = true,
					track = function() core._2481:AnduinWrynn() end,
					partial = false,
					encounterID = 2546,
				},
				boss9 = {
					name = 2457, --Lords of Dread
					bossIDs = {},
					achievement = 15315,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_LordsOfDread"], "IAT_179392") },
						},
					},
					enabled = true,
					track = function() core._2481:LordsOfDread() end,
					partial = false,
					encounterID = 2543,
				},
				boss10 = {
					name = 2467, --Rygelon
					bossIDs = {},
					achievement = 15396,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_Rygelon"], C_Spell.GetSpellLink(366195)) },
						},
					},
					enabled = true,
					track = function() core._2481:Rygelon() end,
					partial = false,
					encounterID = 2549,
					displayInfoFrame = true,
				},
				boss11 = {
					name = 2464, --The Jailer
					bossIDs = {},
					achievement = 15494,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SuplcherOfTheFirstOnes_TheJailer"], C_Spell.GetSpellLink(360282), C_Spell.GetSpellLink(360282)) },
						},
					},
					enabled = true,
					track = function() core._2481:TheJailer() end,
					partial = false,
					encounterID = 2537,
				},
			},
		},

		Dungeons = {
			[2291] = { --De Other Side
				name = 1188,
				boss1 = {
					name = L["Instances_Other"], --Highly Communicable
					bossIDs = {},
					achievement = 14354,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["DeOtherSide_HighlyCommunicable"], "IAT_164532", C_Spell.GetSpellLink(322746), "IAT_164532", C_Spell.GetSpellLink(322746), "IAT_164450") },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2409, --The Manastorms
					bossIDs = {},
					achievement = 14374,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["DeOtherSide_TheManastorms"], "IAT_164934", C_Spell.GetSpellLink(320132), C_Spell.GetSpellLink(324047), "IAT_67571", "IAT_101976", C_Spell.GetSpellLink(320132), "IAT_101976", "IAT_67571", C_Spell.GetSpellLink(324047)) },
						},
					},
					enabled = true,
					track = function() core._2291:TheManastorms() end,
					partial = false,
					encounterID = 2394,
				},
				boss3 = {
					name = 2398, --Dealer Xy'exa
					bossIDs = {},
					achievement = 14606,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["DeOtherSide_DealerXyexa"], "IAT_164450", C_Spell.GetSpellLink(320834)) },
						},
					},
					enabled = true,
					track = function() core._2291:DealerXyexa() end,
					partial = false,
					encounterID = 2400,
				},
			},

			[2287] = { --Halls of Atonement
				name = 1185,
				boss1 = {
					name = 2406, --Halkias
					bossIDs = {},
					achievement = 14567,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfAtonement_Halkias"], "IAT_164557", "IAT_165408") },
						},
					},
					enabled = true,
					track = function() core._2297:Halkias() end,
					partial = false,
					encounterID = 2401,
				},
				boss2 = {
					name = 2387, --Echelon
					bossIDs = {},
					achievement = 14284,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfAtonement_Echelon"], "IAT_156842", "IAT_164363", C_Spell.GetSpellLink(319592), "IAT_156842", C_Spell.GetSpellLink(319603), C_Spell.GetSpellLink(319592), "IAT_164363") },
						},
					},
					enabled = true,
					track = function() core._2297:Echelon() end,
					partial = false,
					encounterID = 2380,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2413, --Lord Chamberlain
					bossIDs = {},
					achievement = 14352,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfAtonement_LordChamberlain"], "IAT_164218", C_Spell.GetSpellLink(341245), "IAT_164218", "IAT_165737", C_Spell.GetSpellLink(323143)) },
						},
					},
					enabled = true,
					track = function() core._2297:LordChamberlain() end,
					partial = false,
					encounterID = 2381,
				},
			},

			[2290] = { --Mists of Tirna Scithe
				name = 1184,
				boss1 = {
					name = 2400, --Ingra Maloch
					bossIDs = {},
					achievement = 14503,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["MistsOfTirnaScithe_IngraMaloch"], "IAT_172995", "IAT_170218", C_Spell.GetSpellLink(323177), "IAT_172992", "IAT_172992") },
						},
					},
					enabled = true,
					track = function() core._2290:IngraMaloch() end,
					partial = false,
					encounterID = 2397,
				},
				boss2 = {
					name = 2402, --Mistcaller
					bossIDs = {},
					achievement = 14291,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["MistsOfTirnaScithe_Mistcaller"], "IAT_164501", "IAT_164501") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2392,
				},
				boss3 = {
					name = 2405, --Tred'ova
					bossIDs = {},
					achievement = 14375,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["MistsOfTirnaScithe_Tredova"], "IAT_172312", "IAT_164517", "IAT_172312", C_Spell.GetSpellLink(336416), "IAT_165512", "IAT_172312", C_Spell.GetSpellLink(336407)) },
						},
					},
					enabled = true,
					track = function() core._2290:Tredova() end,
					partial = false,
					encounterID = 2393,
				},
			},

			[2289] = { --Plaguefall
				name = 1183,
				boss1 = {
					name = L["Instances_Other"], --Multiple Bosses
					bossIDs = {},
					achievement = 14292,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Plaguefall_RidingWithMySlimes"], C_Spell.GetSpellLink(330092), C_Spell.GetSpellLink(330069), C_Spell.GetSpellLink(330069), C_Spell.GetSpellLink(330092), C_Spell.GetSpellLink(324631)) },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2419, --Globgrog
					bossIDs = {},
					achievement = 14347,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Plaguefall_Globgrog"], "IAT_164255", "IAT_171474", C_Spell.GetSpellLink(334640), "IAT_172093", C_Spell.GetSpellLink(335908), "IAT_172094", C_Spell.GetSpellLink(335909)) },
						},
					},
					enabled = true,
					track = function() core._2289:Globgrog() end,
					partial = false,
					encounterID = 2382,
				},
				boss3 = {
					name = 2403, --Doctor Ickus
					bossIDs = {},
					achievement = 14296,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Plaguefall_DoctorIckus"], C_Spell.GetSpellLink(333162), "IAT_164967", C_Spell.GetSpellLink(321406), "IAT_174018") },
						},
					},
					enabled = true,
					track = function() core._2289:DoctorIckus() end,
					partial = false,
					encounterID = 2384,
				},
			},

			[2284] = { --Sanguine Depths
				name = 1189,
				boss1 = {
					name = L["Instances_Other"], --Duraka the Unbreakable
					bossIDs = {},
					achievement = 14290,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanguineDepths_IOnlyHaveEyesForYou"], "IAT_180052", "IAT_180053", "IAT_169617", "IAT_180052", "IAT_180053", "IAT_156987", "IAT_169617", "IAT_180052") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2415, --Executor Tarvold
					bossIDs = {},
					achievement = 14286,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanguineDepths_ExecutorTarvold"], "IAT_165073", C_Spell.GetSpellLink(323551), "IAT_165556", "IAT_165556", C_Spell.GetSpellLink(323551), "IAT_165073", "IAT_165073") },
						},
					},
					enabled = true,
					track = function() core._2284:ExecutorTarvold() end,
					partial = false,
					encounterID = 2361,
				},
				boss3 = {
					name = 2407, --General Kaal
					bossIDs = {},
					achievement = 14289,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SanguineDepths_GeneralKaal"], "IAT_162102", "IAT_169594", "IAT_169594", "IAT_156987", "IAT_156987", "IAT_169554", C_Spell.GetSpellLink(322895), "IAT_169554", C_Spell.GetSpellLink(330055), "IAT_169594") },
						},
					},
					enabled = true,
					track = function() core._2284:GeneralKaal() end,
					partial = false,
					encounterID = 2363,
				},
			},

			[2285] = { --Spires of Ascension
				name = 1186,
				boss1 = {
					name = 2414, --Oryphrion
					bossIDs = {},
					achievement = 14331,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SpiresOfAscension_Oryphrion"], "IAT_171456", "IAT_171456", C_Spell.GetSpellLink(324444), C_Spell.GetSpellLink(324392), C_Spell.GetSpellLink(324046), "IAT_171456", "IAT_175422") },
						},
					},
					enabled = true,
					track = function() core._2285:Oryphrion() end,
					partial = false,
					encounterID = 2358,
				},
				boss2 = {
					name = 2412, --Devos, Paragon of Doubt 1
					bossIDs = {},
					achievement = 14323,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SpiresOfAscension_DevosParagonOfDoubt1"], C_Spell.GetSpellLink(334643), C_Spell.GetSpellLink(334625), "IAT_167169", "IAT_69756", "IAT_172386", C_Spell.GetSpellLink(322921), "IAT_167169", "IAT_167169", C_Spell.GetSpellLink(334625)) },
						},
					},
					enabled = true,
					track = function() core._2285:DevosParagonOfDoubt() end,
					partial = false,
					encounterID = 2359,
				},
				boss3 = {
					name = 2412, --Devos, Paragon of Doubt 2
					bossIDs = {},
					achievement = 14327,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["SpiresOfAscension_DevosParagonOfDoubt2"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
				},
			},

			[2293] = { --Theater of Pain
				name = 1187,
				boss1 = {
					name = 2397, --Affront of Challengers
					bossIDs = {},
					achievement = 14297,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TheaterOfPain_AffrontOfChallengers"] },
						},
					},
					enabled = true,
					track = function() core._2293:AffrontOfChallengers() end,
					partial = false,
					encounterID = 2391,
				},
				boss2 = {
					name = 2401, --Gorechop
					bossIDs = {},
					achievement = 14607,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheaterOfPain_Gorechop"], "IAT_162317", C_Spell.GetSpellLink(318406)) },
						},
					},
					enabled = true,
					track = function() core._2293:Gorechop() end,
					partial = false,
					encounterID = 2365,
				},
				boss3 = {
					name = 2417, --Mordretha
					bossIDs = {},
					achievement = 14533,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheaterOfPain_Mordretha"], "IAT_173675", "IAT_117072", "IAT_173675") },
						},
					},
					enabled = true,
					track = function() core._2293:Mordretha() end,
					partial = false,
					encounterID = 2404,
				},
			},

			[2286] = { --The Necrotic Wake
				name = 1182,
				boss1 = {
					name = 2391, --Amarth the Harvester
					bossIDs = {},
					achievement = 14295,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNecroticWake_AmarthTheHarvester"], "IAT_164475", C_Spell.GetSpellLink(321247), "IAT_171095", "IAT_171095", "IAT_171094", "IAT_171095", "IAT_164475", C_Spell.GetSpellLink(321247), "IAT_164475", C_Spell.GetSpellLink(333842), C_Spell.GetSpellLink(328351)) },
						},
					},
					enabled = true,
					track = function() core._2286:AmarthTheHarvester() end,
					partial = false,
					encounterID = 2388,
				},
				boss2 = {
					name = 2392, --Surgeon Stitchflesh
					bossIDs = {},
					achievement = 14320,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNecroticWake_SurgeonStitchflesh"], C_Spell.GetSpellLink(322681), "IAT_164578", "IAT_166266") },
						},
					},
					enabled = true,
					track = function() core._2286:SurgeonStitchflesh() end,
					partial = false,
					encounterID = 2389,
				},
				boss3 = {
					name = 2396, --Nalthor the Rimebinder
					bossIDs = {},
					achievement = 14285,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNecroticWake_NalthorTheRimebinder"], C_Spell.GetSpellLink(320784), C_Spell.GetSpellLink(287294), C_Spell.GetSpellLink(320788), C_Spell.GetSpellLink(320784), C_Spell.GetSpellLink(320788)) },
						},
					},
					enabled = true,
					track = function() core._2286:NalthorTheRimebinder() end,
					partial = false,
					encounterID = 2390,
					displayInfoFrame = true,
				},
			},

			[2441] = { --Tazavesh the Veiled Market
				name = 1194,
				boss1 = {
					name = L["Instances_Other"], --Mischief!
					bossIDs = {},
					achievement = 15190,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TazaveshTheVeiledMarket_Mischief"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2437, --Zo'phex the Sentinel
					bossIDs = {},
					achievement = 15109,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TazaveshTheVeiledMarket_ZophexTheSentinel"], "IAT_187178", "IAT_187179", "IAT_187173", "IAT_187171", "IAT_175616", C_Spell.GetSpellLink(345598), C_Spell.GetSpellLink(356436), C_Spell.GetSpellLink(356397), C_Spell.GetSpellLink(356484), C_Spell.GetSpellLink(356493), C_Spell.GetSpellLink(345598)) },
						},
					},
					enabled = true,
					track = function() core._2441:ZophexTheSentinel() end,
					partial = false,
					encounterID = 2425,
				},
				boss3 = {
					name = 2436, --Mailroom Mayhem
					bossIDs = {},
					achievement = 15106,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TazaveshTheVeiledMarket_MailroomMayhem"], C_Spell.GetSpellLink(346947), C_Spell.GetSpellLink(346947), C_Spell.GetSpellLink(346404), C_Spell.GetSpellLink(346947)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2424,
				},
				boss4 = {
					name = 2448, --Hylbrande
					bossIDs = {},
					achievement = 15179,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TazaveshTheVeiledMarket_Hylbrande"], C_Spell.GetSpellLink(346766), C_Spell.GetSpellLink(346828), C_Spell.GetSpellLink(346828), C_Spell.GetSpellLink(346828)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2426,
				},
				boss5 = {
					name = 2455, --So'leah
					bossIDs = {},
					achievement = 15178,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TazaveshTheVeiledMarket_Soleah"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
				},
			},
		},
	},

	--Battle for Azeroth
	[8] = {
		Raids = {
			[1861] = { --Uldir
				name = 1031,
				boss1 = {
					name = 2168, --Taloc
					bossIDs = {},
					achievement = 12937,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Uldir_Taloc_Tactics"], C_Spell.GetSpellLink(280461), C_Spell.GetSpellLink(195072), C_Spell.GetSpellLink(131347)) },
						},
					},
					enabled = true,
					track = function() core._1861:Taloc() end,
					partial = false,
					encounterID = 2144,
				},
				boss2 = {
					name = 2167, --MOTHER
					bossIDs = {},
					achievement = 12938,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Uldir_MOTHER_Tactics"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2141,
				},
				boss3 = {
					name = 2146, --Fetid Devourer
					bossIDs = {133298},
					achievement = 12823,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Uldir_Fetid_Devourer_Tactics"], C_Spell.GetSpellLink(262277), C_Spell.GetSpellLink(262378)) },
						},
					},
					enabled = true,
					track = function() core._1861:FetidDevourer() end,
					partial = false,
					encounterID = 2128,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 2169, --Zek'voz
					bossIDs = {},
					achievement = 12828,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Uldir_ZekVoz_Tactics"], C_Spell.GetSpellLink(278068)) },
						},
					},
					enabled = true,
					track = function() core._1861:Zekvoz() end,
					partial = false,
					encounterID = 2136,
				},
				boss5 = {
					name = 2166, --Vectis
					bossIDs = {},
					achievement = 12772,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Uldir_Vectis_Tactics"], C_Spell.GetSpellLink(266948)) },
						},
					},
					enabled = true,
					track = function() core._1861:Vectis() end,
					partial = false,
					encounterID = 2134,
				},
				boss6 = {
					name = 2195, --Zul Reborn
					bossIDs = {},
					achievement = 12830,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Uldir_ZulReborn_Tactics"] },
						},
					},
					enabled = true,
					track = function() core._1861:ZulReborn() end,
					partial = false,
					encounterID = 2145,
				},
				boss7 = {
					name = 2194, --Mythrax the Unraveler
					bossIDs = {},
					achievement = 12836,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Uldir_Mythrax_Tactics"] },
						},
					},
					enabled = true,
					track = function() core._1861:MythraxTheUnraveler() end,
					partial = false,
					encounterID = 2135,
				},
				boss8 = {
					name = 2147, --G'huun
					bossIDs = {},
					achievement = 12551,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Uldir_GHuun_Tactics"], C_Spell.GetSpellLink(263372)) },
						},
					},
					enabled = true,
					track = function() core._1861:Ghuun() end,
					partial = false,
					encounterID = 2122,
				},
			},

			[2070] = { --Battle of Dazar'alor
				name = 1176,
				boss1 = {
					name = 2344, --Champion of the Light
					bossIDs = {},
					achievement = 13316,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_ChampionOfTheLight_Alliance"], "IAT_147896", "IAT_147895", "IAT_144683", C_Spell.GetSpellLink(288579), "IAT_69181") },
							{ tactic = format(L["BattleOfDazaralor_ChampionOfTheLight_Horde"], "IAT_145903", "IAT_145898", "IAT_144680", C_Spell.GetSpellLink(288579), "IAT_69181") },
						},
					},
					enabled = true,
					track = function() core._2070:ChampionOfTheLight() end,
					partial = false,
					encounterID = 2265,
				},
				boss2 = {
					name = 2323, --Jadefire Masters
					bossIDs = {},
					achievement = 13431,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_JadefireMasters"], "IAT_58321", C_Spell.GetSpellLink(286396), "IAT_146107", C_Spell.GetSpellLink(284399), C_Spell.GetSpellLink(284388), "IAT_99009", C_Spell.GetSpellLink(286396), "IAT_58321") },
						},
					},
					enabled = true,
					track = function() core._2070:JadefireMasters() end,
					partial = false,
					encounterID = 2266,
				},
				boss3 = {
					name = 2340, --Grong
					bossIDs = {},
					achievement = 13383,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_Grong_Alliance"], "IAT_144637", "IAT_149043", "IAT_149043", C_Spell.GetSpellLink(282543), "IAT_149043", C_Spell.GetSpellLink(289050)) },
							{ tactic = format(L["BattleOfDazaralor_Grong_Alliance"], "IAT_144637", "IAT_149043", "IAT_149043", C_Spell.GetSpellLink(282179), "IAT_149043", C_Spell.GetSpellLink(289050)) },
						},
					},
					enabled = true,
					track = function() core._2070:Grong() end,
					partial = false,
					encounterID = 2263,
				},
				boss4 = {
					name = 2342, --Opulence
					bossIDs = {},
					achievement = 13345,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_Opulence"], "IAT_51090", "IAT_51090", C_Spell.GetSpellLink(284802), C_Spell.GetSpellLink(284802), C_Spell.GetSpellLink(284645), C_Spell.GetSpellLink(284664), C_Spell.GetSpellLink(284798), C_Spell.GetSpellLink(284802), "IAT_51090") },
						},
					},
					enabled = true,
					track = function() core._2070:Opulence() end,
					partial = false,
					encounterID = 2271,
					displayInfoFrame = true,
				},
				boss5 = {
					name = 2330, --Conclave of the Chosen
					bossIDs = {},
					achievement = 13325,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_ConclaveOfTheChosen"], "IAT_144807", C_Spell.GetSpellLink(282209), C_Spell.GetSpellLink(49576)) },
						},
					},
					enabled = true,
					track = function() core._2070:ConclaveOfTheChosen() end,
					partial = false,
					encounterID = 2268,
				},
				boss6 = {
					name = 2335, --King Rastakhan
					bossIDs = {},
					achievement = 13425,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["BattleOfDazaralor_KingRastakhan"] },
						},
					},
					enabled = true,
					track = function() core._2070:KingRastakhan() end,
					partial = false,
					encounterID = 2272,
				},
				boss7 = {
					name = 2334, --High Tinker Mekkatorque
					bossIDs = {},
					achievement = 13401,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_HighTinkerMekkatorque"], "IAT_87214", "IAT_111821", "IAT_149240", "IAT_149240", C_Spell.GetSpellLink(289864), C_Spell.GetSpellLink(289870)) },
						},
					},
					enabled = true,
					track = function() core._2070:HighTinkerMekkatorque() end,
					partial = false,
					encounterID = 2276,
				},
				boss8 = {
					name = 2337, --Stormwall Blockade
					bossIDs = {},
					achievement = 13430,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_StormwallBlockade"], "IAT_149289", "IAT_149289", "IAT_149289", C_Spell.GetSpellLink(285118), "IAT_149289", C_Spell.GetSpellLink(289479), C_Spell.GetSpellLink(289487), "IAT_149289", "IAT_149289", C_Spell.GetSpellLink(289479), C_Spell.GetSpellLink(289479)) },
						},
					},
					enabled = true,
					track = function() core._2070:StormwallBlockade() end,
					partial = false,
					encounterID = 2280,
				},
				boss9 = {
					name = 2343, --Jaina Proudmoore
					bossIDs = {},
					achievement = 13410,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BattleOfDazaralor_JainaProudmoore"], "IAT_149684", "IAT_149244", C_Spell.GetSpellLink(288218), C_Spell.GetSpellLink(288219), "IAT_149244", "IAT_149244") },
						},
					},
					enabled = true,
					track = function() core._2070:JainaProudmoore() end,
					partial = false,
					encounterID = 2281,
				},
			},

			[2096] = { --Crucible of Storms
				name = 1177,
				boss1 = {
					name = 2328, --The Restless Cabal
					bossIDs = {},
					achievement = 13501,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CrucibleOfStorms_TheRestlessCabal"], "IAT_146495", C_Spell.GetSpellLink(282407), C_Spell.GetSpellLink(282407), C_Spell.GetSpellLink(282407)) },
						},
					},
					enabled = true,
					track = function() core._2096:TheRestlessCabal() end,
					partial = false,
					encounterID = 2269,
				},
				boss2 = {
					name = 2332, --Uu'nat, Harbinger of the Void
					bossIDs = {},
					achievement = 13506,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CrucibleOfStorms_UunatHarbingerOfTheVoid"], "IAT_146750", "IAT_146750", C_Spell.GetSpellLink(285638), C_Spell.GetSpellLink(285685), C_Spell.GetSpellLink(285453), "IAT_146750") },
						},
					},
					enabled = true,
					track = function() core._2096:UunatHarbingerOfTheVoid() end,
					partial = false,
					encounterID = 2273,
					displayInfoFrame = true,
				},
			},

			[2164] = { --Azshara's Eternal Palace
				name = 1179,
				boss1 = {
					name = 2352, --Abyssal Commander Sivara
					bossIDs = {},
					achievement = 13684,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_AbyssalCommanderSivara"], "IAT_155144", "IAT_155273", C_Spell.GetSpellLink(303502), "IAT_155275", C_Spell.GetSpellLink(303532), C_Spell.GetSpellLink(303550), C_Spell.GetSpellLink(303756), "IAT_155275", C_Spell.GetSpellLink(303545), "IAT_155144", "IAT_155277", C_Spell.GetSpellLink(303513)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2298,
				},
				boss2 = {
					name = 2347, --Blackwater Behemoth
					bossIDs = {},
					achievement = 13628,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_BlackwaterBehemoth"], "IAT_155242", "IAT_155245", "IAT_155243", "IAT_155247", C_Spell.GetSpellLink(292167), C_Spell.GetSpellLink(276012)) },
						},
					},
					enabled = true,
					track = function() core._2164:BlackwaterBehemoth() end,
					partial = false,
					encounterID = 2289,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 2353, --Radiance of Azshara
					bossIDs = {},
					achievement = 13767,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_RadianceOfAzshara"], C_Spell.GetSpellLink(305157), C_Spell.GetSpellLink(305173), "IAT_152512", C_Spell.GetSpellLink(296701), C_Spell.GetSpellLink(296421), C_Spell.GetSpellLink(305173), C_Spell.GetSpellLink(296566)) },
						},
					},
					enabled = true,
					track = function() core._2164:RadianceOfAzshara() end,
					partial = false,
					encounterID = 2305,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 2354, --Lady Ashvane
					bossIDs = {},
					achievement = 13629,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_LadyAshvane"], C_Spell.GetSpellLink(296944), C_Spell.GetSpellLink(296534), C_Spell.GetSpellLink(296944)) },
						},
					},
					enabled = true,
					track = function() core._2164:LadyAshvane() end,
					partial = false,
					encounterID = 2304,
				},
				boss5 = {
					name = 2351, --Orgozoa
					bossIDs = {},
					achievement = 13724,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_Orgozoa"], "IAT_153941", C_Spell.GetSpellLink(298526), C_Spell.GetSpellLink(300308), C_Spell.GetSpellLink(298548), C_Spell.GetSpellLink(305322), C_Spell.GetSpellLink(121536), C_Spell.GetSpellLink(73325), C_Spell.GetSpellLink(298242)) },
						},
					},
					enabled = true,
					track = function() core._2164:Orgozoa() end,
					partial = false,
					encounterID = 2303,
				},
				boss6 = {
					name = 2359, --The Queen's Court
					bossIDs = {},
					achievement = 13633,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_TheQueensCourt"], C_Spell.GetSpellLink(302029), C_Spell.GetSpellLink(303227), C_Spell.GetSpellLink(304409), C_Spell.GetSpellLink(297656), C_Spell.GetSpellLink(297564), C_Spell.GetSpellLink(297585)) },
						},
					},
					enabled = true,
					track = function() core._2164:TheQueensCourt() end,
					partial = false,
					encounterID = 2311,
					displayInfoFrame = true,
				},
				boss7 = {
					name = 2349, --Za'qui, Harbinger of Ny'alotha
					bossIDs = {},
					achievement = 13716,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_ZaquiHarbingerOfNyalotha"], C_Spell.GetSpellLink(296018), C_Spell.GetSpellLink(295999), "IAT_155648") },
						},
					},
					enabled = true,
					track = function() core._2164:Zaqul() end,
					partial = false,
					encounterID = 2293,
				},
				boss8 = {
					name = 2361, --Queen Azshara
					bossIDs = {},
					achievement = 13768,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AzsharasEternalPalace_QueenAzshara"], "IAT_155126", C_Spell.GetSpellLink(300866), C_Spell.GetSpellLink(298569), C_Spell.GetSpellLink(300848), C_Spell.GetSpellLink(300866)) },
						},
					},
					enabled = true,
					track = function() core._2164:QueenAzshara() end,
					partial = false,
					encounterID = 2299,
				},
			},

			[2217] = { --Ny’alotha
				name = 1180,
				boss1 = {
					name = 2368, --Wrathion, the Black Emperor
					bossIDs = {},
					achievement = 14019,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_WrathionTheBlackEmperor"], "IAT_158327", C_Spell.GetSpellLink(308682), C_Spell.GetSpellLink(195072), C_Spell.GetSpellLink(109132)) },
						},
					},
					enabled = true,
					track = function() core._2217:WrathionTheBlackEmperor() end,
					partial = false,
					encounterID = 2329,
				},
				boss2 = {
					name = 2365, --Maut
					bossIDs = {},
					achievement = 14008,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_Maut"], "IAT_156650", "IAT_156523", "IAT_156650", C_Spell.GetSpellLink(307839), "IAT_160271", C_Spell.GetSpellLink(80353), C_Spell.GetSpellLink(305722)) },
						},
					},
					enabled = true,
					track = function() core._2217:Maut() end,
					partial = false,
					encounterID = 2327,
				},
				boss3 = {
					name = 2369, --The Prophet Skitra
					bossIDs = {},
					achievement = 14037,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_TheProphetSkitra"], "IAT_161573", "IAT_161901", "IAT_161573", "IAT_161901", "IAT_161573", "IAT_161573", C_Spell.GetSpellLink(80353)) },
						},
					},
					enabled = true,
					track = function() core._2217:ProphetSkitra() end,
					partial = false,
					encounterID = 2334,
				},
				boss4 = {
					name = 2377, --Dark Inquisitor Xanesh
					bossIDs = {},
					achievement = 14024,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_DarkInquisitorXanesh"], C_Spell.GetSpellLink(314202), C_Spell.GetSpellLink(312406), C_Spell.GetSpellLink(312406), C_Spell.GetSpellLink(312336), C_Spell.GetSpellLink(314202), C_Spell.GetSpellLink(312406), C_Spell.GetSpellLink(312406), C_Spell.GetSpellLink(314202)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2328,
				},
				boss5 = {
					name = 2372, --The Hivemind
					bossIDs = {},
					achievement = 14023,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_TheHivemind"], "IAT_161375", "IAT_132609", "IAT_156575", "IAT_132609", C_Spell.GetSpellLink(80353), "IAT_161414", C_Spell.GetSpellLink(315036)) },
						},
					},
					enabled = true,
					track = function() core._2217:Hivemind() end,
					partial = false,
					encounterID = 2333,
				},
				boss6 = {
					name = 2367, --Shad'har the Insatiable
					bossIDs = {},
					achievement = 13990,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_ShadharTheInsatiable"], "IAT_157231", C_Spell.GetSpellLink(312590), "IAT_157231") },
						},
					},
					enabled = true,
					track = function() core._2217:ShadharTheInsatiable() end,
					partial = false,
					encounterID = 2335,
					displayInfoFrame = true,
				},
				boss7 = {
					name = 2373, --Drest'agath
					bossIDs = {},
					achievement = 14026,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_Drestagath"], C_Spell.GetSpellLink(308947), "IAT_157602", "IAT_157602", C_Spell.GetSpellLink(308947), C_Spell.GetSpellLink(80353)) },
						},
					},
					enabled = true,
					track = function() core._2217:DrestAgath() end,
					partial = false,
					encounterID = 2343,
				},
				boss8 = {
					name = 2370, --Vexiona
					bossIDs = {},
					achievement = 14139,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_Vexiona"], C_Spell.GetSpellLink(307421), "IAT_157354", "IAT_162719", C_Spell.GetSpellLink(98008), C_Spell.GetSpellLink(62618), C_Spell.GetSpellLink(32375), C_Spell.GetSpellLink(307421)) },
						},
					},
					enabled = true,
					track = function() core._2217:Vexiona() end,
					partial = false,
					encounterID = 2336,
					displayInfoFrame = true,
				},
				boss9 = {
					name = 2364, --Ra-den the Despoiled
					bossIDs = {},
					achievement = 13999,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_RadenTheDespoiled"], C_Spell.GetSpellLink(306634), C_Spell.GetSpellLink(306733), C_Spell.GetSpellLink(306733), "IAT_156884", C_Spell.GetSpellLink(306634)) },
						},
					},
					enabled = true,
					track = function() core._2217:Raden() end,
					partial = false,
					encounterID = 2331,
				},
				boss10 = {
					name = 2374, --Il'gynoth, Corruption Reborn
					bossIDs = {},
					achievement = 14038,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_IlgynothCorruptionReborn"], "IAT_159514", "IAT_159514", "IAT_159514", C_Spell.GetSpellLink(80353), C_Spell.GetSpellLink(98008), C_Spell.GetSpellLink(62618)) },
						},
					},
					enabled = true,
					track = function() core._2217:IlgynothCorruptionReborn() end,
					partial = false,
					encounterID = 2345,
					displayInfoFrame = true,
				},
				boss11 = {
					name = 2366, --Carapace of N'Zoth
					bossIDs = {},
					achievement = 14147,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_CarapaceOfNZoth"], "IAT_157475", C_Spell.GetSpellLink(80353)) },
						},
					},
					enabled = true,
					track = function() core._2217:CarapaceOfNZoth() end,
					partial = false,
					encounterID = 2337,
				},
				boss12 = {
					name = 2375, --N'Zoth, the Corruptor
					bossIDs = {},
					achievement = 14148,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ny’alotha_NZothTheCorruptor"], C_Spell.GetSpellLink(307831), C_Spell.GetSpellLink(313334), "IAT_158041", C_Spell.GetSpellLink(307831), "IAT_162933", C_Spell.GetSpellLink(317066), C_Spell.GetSpellLink(307831), C_Spell.GetSpellLink(313334), C_Spell.GetSpellLink(80353), C_Spell.GetSpellLink(307831), "IAT_162933", C_Spell.GetSpellLink(307831), C_Spell.GetSpellLink(316271), C_Spell.GetSpellLink(313334), C_Spell.GetSpellLink(307831), C_Spell.GetSpellLink(309991)) },
						},
					},
					enabled = true,
					track = function() core._2217:NZothTheCorruptor() end,
					partial = false,
					encounterID = 2344,
					displayInfoFrame = true,
				},
			},
		},

		Dungeons = {
			[1763] = { --Atal Dazar
				name = 968,
				boss1 = {
					name = L["Instances_Other"], --Bringing Hexy Back
					bossIDs = {},
					achievement = 12270,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AtalDazar_Other"], C_Spell.GetSpellLink(279118), C_Spell.GetSpellLink(115078), C_Spell.GetSpellLink(187650), C_Spell.GetSpellLink(118), C_Spell.GetSpellLink(279118)) },
						},
					},
					enabled = true,
					track = function() core._1763:BringingHexyBack() end,
					partial = false,
					encounterID = 2087,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2082, --Priestess Alun'za
					bossIDs = {},
					achievement = 12272,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AtalDazar_Priestess_AlunZa"], C_Spell.GetSpellLink(259205), C_Spell.GetSpellLink(255558), C_Spell.GetSpellLink(255558), C_Spell.GetSpellLink(255558)) },
						},
					},
					enabled = true,
					track = function() core._1763:PriestessAlunza() end,
					partial = false,
					encounterID = 2084,
				},
				boss3 = {
					name = 2030, --Yazma
					bossIDs = {},
					achievement = 12273,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Atal_Dazar_Yazma"], C_Spell.GetSpellLink(259190)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Freehold_SkycapNKragg"], "IAT_119210") },
						},
					},
					enabled = true,
					track = function() core._1754:SkycapnKragg() end,
					partial = false,
					encounterID = 2093,
				},
				boss2 = {
					name = 2094, --Ring of Booty
					bossIDs = {},
					achievement = 12550,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Freehold_RingOfBooty"], "IAT_138718", "IAT_138705", "IAT_138719") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2095,
				},
				boss3 = {
					name = 2095, --Harlan Sweete
					bossIDs = {},
					achievement = 12998,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Freehold_HarlanSweete"], "IAT_129440", C_Spell.GetSpellLink(257305)) },
						},
					},
					enabled = true,
					track = function() core._1754:HarlanSweete() end,
					partial = false,
					encounterID = 2096,
				},
			},

			[1762] = { --Kings Rest
				name = 1041,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME2
					bossIDs = {},
					achievement = 12722,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["KingsRest_Other"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2171, --Mchimba the Embalmer
					bossIDs = {},
					achievement = 12721,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["KingsRest_MchimbaTheEmbalmer"], C_Spell.GetSpellLink(267702), C_Spell.GetSpellLink(267764), C_Spell.GetSpellLink(271290), C_Spell.GetSpellLink(267764), C_Spell.GetSpellLink(271290)) },
						},
					},
					enabled = true,
					track = function() core._1762:MchimbaTheEmbalmer() end,
					partial = false,
					encounterID = 2142,
				},
				boss3 = {
					name = 2172, --Dazar, The First King
					bossIDs = {},
					achievement = 12723,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["KingsRest_DazarTheFirstKing"], "IAT_136160") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
				},
			},

			[1864] = { --Shrine of the Storm
				name = 1036,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME3
					bossIDs = {},
					achievement = 12600,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ShrineOfTheStorm_Other"], C_Spell.GetSpellLink(275633)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 2155, --Lord Stormsong
					bossIDs = {},
					achievement = 12601,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ShrineOfTheStorm_LordStormsong"], "IAT_139737", "IAT_137036", C_Spell.GetSpellLink(269097)) },
						},
					},
					enabled = true,
					track = function() core._1864:LordStormsong() end,
					partial = false,
					encounterID = 2132,
				},
				boss3 = {
					name = 2156, --Vol'zith
					bossIDs = {275690},
					achievement = 12602,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ShrineOfTheStorm_VolZith"], C_Spell.GetSpellLink(275690), "IAT_134069", C_Spell.GetSpellLink(267360), "IAT_134069", C_Spell.GetSpellLink(267299), "IAT_135903") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SiegeOfBoralus_DreadCaptainLockwood"], "IAT_129208", C_Spell.GetSpellLink(272471), C_Spell.GetSpellLink(272471)) },
						},
					},
					enabled = true,
					track = function() core._1822:DreadCaptainLockwood() end,
					partial = false,
					encounterID = 2109,
				},
				boss2 = {
					name = 2140, --Viq'Goth
					bossIDs = {},
					achievement = 12726,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SiegeOfBoralus_ViqGoth"], "IAT_128652", C_Spell.GetSpellLink(274991), C_Spell.GetSpellLink(274991), "IAT_137588") },
						},
					},
					enabled = true,
					track = function() core._1822:ViqGoth() end,
					partial = false,
					encounterID = 2100,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME4
					bossIDs = {},
					achievement = 12489,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SiegeOfBoralus_Other"], "IAT_141800", "IAT_141805", "IAT_141792") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1877] = { --Temple of Sethraliss
				name = 1030,
				boss1 = {
					name = 2143, --Merektha
					bossIDs = {},
					achievement = 12507,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TempleOfSethraliss_Merektha"], "IAT_139300", C_Spell.GetSpellLink(1543), C_Spell.GetSpellLink(43265), C_Spell.GetSpellLink(5740), C_Spell.GetSpellLink(263914), "IAT_139300", C_Spell.GetSpellLink(270324), "IAT_139300", C_Spell.GetSpellLink(49576), "IAT_139300") },
						},
					},
					enabled = true,
					track = function() core._1877:Merektha() end,
					partial = false,
					encounterID = 2125,
				},
				boss2 = {
					name = 2145, --Avatar of Sethraliss
					bossIDs = {},
					achievement = 12508,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TempleOfSethraliss_AvatarOfSethraliss"], "IAT_137233", "IAT_136683") },
						},
					},
					enabled = true,
					track = function() core._1877:AvatarOfSethraliss() end,
					partial = false,
					encounterID = 2127,
				},
				boss3 = {
					name = L["Instances_TrashAfterThirdBoss"], --MISSINGNAME5
					bossIDs = {},
					achievement = 12503,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TempleOfSethraliss_Trash"], "IAT_144311", "IAT_144311", C_Spell.GetSpellLink(115078), C_Spell.GetSpellLink(187650), C_Spell.GetSpellLink(118)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_TrashAfterThirdBoss"],
				},
			},

			[1594] = { --The Motherlode
				name = 1012,
				boss1 = {
					name = 2109, --Coin-Operated Crowd Pummeler
					bossIDs = {},
					achievement = 12855,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["The_Motherlode_CoinOperatedCrowdPummeler"], C_Spell.GetSpellLink(278524), "IAT_142625", "IAT_142625", C_Spell.GetSpellLink(278673)) },
						},
					},
					enabled = true,
					track = function() core._1594:CoinOperatedCrowdPummeler() end,
					partial = false,
					encounterID = 2105,
				},
				boss2 = {
					name = 2116, --Mogul Razdunk
					bossIDs = {131227},
					achievement = 12854,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["The_Motherlode_MogulRazdunk"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheUnderrot_ElderLeaxa"], "IAT_131318", C_Spell.GetSpellLink(260685)) },
						},
					},
					enabled = true,
					track = function() core._1841:ElderLeaxa() end,
					partial = false,
					encounterID = 2111,
				},
				boss2 = {
					name = 2130, --Sporecaller Zancha
					bossIDs = {},
					achievement = 12549,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheUnderrot_SporecallerZancha"], "IAT_138740", C_Spell.GetSpellLink(272457), "IAT_138740") },
						},
					},
					enabled = true,
					track = function() core._1841:SporecallerZancha() end,
					partial = false,
					encounterID = 2112,
				},
				boss3 = {
					name = 2158, --Unbound Abomination
					bossIDs = {},
					achievement = 12499,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheUnderrot_UnboundAbomination"], C_Spell.GetSpellLink(269843), C_Spell.GetSpellLink(270108), C_Spell.GetSpellLink(270108)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TolDagor_KnightCaptainValyri"], "IAT_130646", C_Spell.GetSpellLink(256976), C_Spell.GetSpellLink(256955), "IAT_130646", C_Spell.GetSpellLink(257033)) },
						},
					},
					enabled = true,
					track = function() core._1771:KnightCaptainValyri() end,
					partial = false,
					encounterID = 2103,
				},
				boss2 = {
					name = 2096, --Overseer Korgus
					bossIDs = {},
					achievement = 12462,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TolDagor_OverseerKorgus"], "IAT_127503", C_Spell.GetSpellLink(256200), C_Spell.GetSpellLink(256200)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["WaycrestManor_SoulboundGoliath"], "IAT_131667", C_Spell.GetSpellLink(260512), C_Spell.GetSpellLink(260570), C_Spell.GetSpellLink(260512)) },
						},
					},
					enabled = true,
					track = function() core._1862:SoulboundGoliath() end,
					partial = false,
					encounterID = 2114,
				},
				boss2 = {
					name = 2129, --Gorak Tul
					bossIDs = {},
					achievement = 12490,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["WaycrestManor_GorakTul"], "IAT_144324", C_Spell.GetSpellLink(266198), "IAT_135552", C_Spell.GetSpellLink(266266), C_Spell.GetSpellLink(266198)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2117,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME6
					bossIDs = {},
					achievement = 12489,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["WaycrestManor_Other"], "IAT_131853", "IAT_131619", "IAT_135725", "IAT_131617", "IAT_135713", "IAT_131667", "IAT_131595", "IAT_135513", "IAT_131615") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[2097] = { --Operation: Mechagon
				name = 1178,
				boss1 = {
					name = 2357, --King Gobbamak
					bossIDs = {},
					achievement = 13706,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["OperationMechagon_KingGobbamak"], "IAT_155595", "IAT_150159", "IAT_155595", C_Spell.GetSpellLink(297257), C_Spell.GetSpellLink(297254), "IAT_155595", C_Spell.GetSpellLink(297257), "IAT_155595", "IAT_153172", "IAT_153245") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2290,
				},
				boss2 = {
					name = 2358, --Gunker
					bossIDs = {},
					achievement = 13698,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["OperationMechagon_Gunker"], "IAT_154741") },
						},
					},
					enabled = true,
					track = function() core._2097:Gunker() end,
					partial = false,
					encounterID = 2292,
				},
				boss3 = {
					name = 2336, --Tussle Tonks
					bossIDs = {},
					achievement = 13723,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["OperationMechagon_TussleTonks"], "IAT_145185", "IAT_151654", "IAT_145185", "IAT_151654", C_Spell.GetSpellLink(283565), "IAT_151654", "IAT_151654", "IAT_153202") },
						},
					},
					enabled = true,
					track = function() core._2097:TussleTonks() end,
					partial = false,
					encounterID = 2257,
				},
				boss4 = {
					name = 2348, --Machinist's Garden
					bossIDs = {},
					achievement = 13545,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["OperationMechagon_MachinistsGarden"], C_Spell.GetSpellLink(285440), C_Spell.GetSpellLink(294954), C_Spell.GetSpellLink(285460), C_Spell.GetSpellLink(294869)) },
						},
					},
					enabled = true,
					track = function() core._2097:MachinistsGarden() end,
					partial = false,
					encounterID = 2259,
				},
				boss5 = {
					name = L["Instances_Other"], --King Mechagon
					bossIDs = {},
					achievement = 13624,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["OperationMechagon_KeepDpsingAndNobodyExplodes"], "IAT_150190", "IAT_150190", "IAT_152703", "IAT_150190", "IAT_150295", "IAT_155760", C_Spell.GetSpellLink(303885), "IAT_155645", "IAT_144246", "IAT_155056", C_Spell.GetSpellLink(301850), "IAT_154817", "IAT_151168", "IAT_151168", "IAT_151168") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2260,
					nameWrath = L["Instances_Other"],
				},
			},
		},
	},

	--Legion
	[7] = {
		Raids = {
			[1520] = { --The Emerald Nightmare
				name = 768,
				boss1 = {
					name = 1703, --Nythendra
					bossIDs = {102672},
					achievement = 10555,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_Nythendra"], C_Spell.GetSpellLink(203552), "IAT_105097", C_Spell.GetSpellLink(203552)) },
						},
					},
					enabled = true,
					track = function() core._1520:Nythendra() end,
					partial = false,
					encounterID = 1853,
				},
				boss2 = {
					name = 1667, --Ursoc
					bossIDs = {100497},
					achievement = 10753,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_Ursoc"], "IAT_111263", "IAT_111263") },
						},
					},
					enabled = true,
					track = function() core._1520:Ursoc() end,
					partial = false,
					encounterID = 1841,
				},
				boss3 = {
					name = 1704, --Dragons of Nightmare
					bossIDs = {102683,102682,102681,102679},
					achievement = 10663,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_DragonsOfNightmare"], C_Spell.GetSpellLink(214588), C_Spell.GetSpellLink(214601), C_Spell.GetSpellLink(214604), C_Spell.GetSpellLink(214610)) },
						},
					},
					enabled = true,
					track = function() core._1520:DragonsOfNightmare() end,
					partial = false,
					encounterID = 1854,
					displayInfoFrame = true,
				},
				boss4 = {
					name = 1744, --Elerethe Renferal
					bossIDs = {}, --106087,
					achievement = 10771,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_EleretheRenferal"], C_Spell.GetSpellLink(212993), C_Spell.GetSpellLink(131347), C_Spell.GetSpellLink(164862), C_Spell.GetSpellLink(130)) },
						},
					},
					enabled = true,
					track = function() core._1520:EleretheRenferal() end,
					partial = false,
					encounterID = 1876,
				},
				boss5 = {
					name = 1738, --Il'gynoth The Heart of Corruption
					bossIDs = {},
					achievement = 10830,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_IllgynothHeartOfCorruption"], "IAT_105721", "IAT_105721") },
						},
					},
					enabled = true,
					track = function() core._1520:Ilgynoth() end,
					partial = false,
					encounterID = 1873,
				},
				boss6 = {
					name = 1750, --Cenarius
					bossIDs = {},
					achievement = 10772,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_Cenarius"], C_Spell.GetSpellLink(212726)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1877,
				},
				boss7 = {
					name = 1726, --Xavius
					bossIDs = {103769},
					achievement = 10755,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheEmeraldNightmare_Xavius"], C_Spell.GetSpellLink(188501), "IAT_110732", C_Spell.GetSpellLink(188501), "IAT_110732") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TrialOfValor_Odyn"], "IAT_95833", "IAT_94960", C_Spell.GetSpellLink(227503), C_Spell.GetSpellLink(229684)) },
						},
					},
					enabled = true,
					track = function() core._1648:Odyn() end,
					partial = false,
					encounterID = 1958,
				},
				boss2 = {
					name = 1830, --Guarm
					bossIDs = {114323},
					achievement = 11386,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TrialOfValor_Guarm"], C_Spell.GetSpellLink(231846), C_Spell.GetSpellLink(227539), C_Spell.GetSpellLink(227566), C_Spell.GetSpellLink(227570), C_Spell.GetSpellLink(227883)) },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1962,
				},
				boss3 = {
					name = 1829, --Helya (Trials of Valor)
					bossIDs = {114537},
					achievement = 11377,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TrialOfValor_Helya"], C_Spell.GetSpellLink(193367), "IAT_114709") },
						},
					},
					enabled = true,
					track = function() core._1648:Helya() end,
					partial = false,
					displayInfoFrame = true,
				},
			},

			[1530] = { --The Nighthold
				name = 786,
				boss1 = {
					name = 1706, --Skorpyron
					bossIDs = {}, --102263,
					achievement = 10678,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_Skorpyron"], C_Spell.GetSpellLink(204316)) },
						},
					},
					enabled = true,
					track = function() core._1530:Skorpyron() end,
					partial = false,
					encounterID = 1849,
				},
				boss2 = {
					name = 1725, --Chronomatic Anomaly
					bossIDs = {},
					achievement = 10697,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_ChronomaticAnomaly"], C_Spell.GetSpellLink(206617), C_Spell.GetSpellLink(206617), C_Spell.GetSpellLink(206617)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1865,
				},
				boss3 = {
					name = 1731, --Trilliax
					bossIDs = {}, --104288,
					achievement = 10742,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1530:Trilliax() end,
					partial = false,
					encounterID = 1867,
				},
				boss4 = {
					name = 1751, --Spellblade Aluriel
					bossIDs = {},
					achievement = 10817,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_SpellbladeAluriel"], "IAT_107698", "IAT_104528", "IAT_110907", "IAT_103725") },
						},
					},
					enabled = true,
					track = function() core._1530:SpellbladeAluriel() end,
					partial = false,
					encounterID = 1871,
				},
				boss5 = {
					name = 1732, --Star Augur Etraeus
					bossIDs = {103758},
					achievement = 10851,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_StarAugurEtraeus"], "IAT_111587", "IAT_107699", "IAT_103758", "IAT_111595") },
						},
					},
					enabled = true,
					track = function() core._1530:StarAugurEtraeus() end,
					partial = false,
					encounterID = 1863,
				},
				boss6 = {
					name = 1761, --High Botanist Tel'arn
					bossIDs = {104528},
					achievement = 10754,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_HighBotanistTelarn"], C_Spell.GetSpellLink(220114)) },
						},
					},
					enabled = true,
					track = function() core._1530:HighBotanistTelarn() end,
					partial = false,
					encounterID = 1886,
				},
				boss7 = {
					name = 1713, --Krosus
					bossIDs = {101002},
					achievement = 10575,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_Krosus"], "IAT_104262", C_Spell.GetSpellLink(205420), "IAT_104262", "IAT_104262") },
						},
					},
					enabled = true,
					track = function() core._1530:Krosus() end,
					partial = false,
					encounterID = 1842,
				},
				boss8 = {
					name = 1762, --Tichondrius
					bossIDs = {103685},
					achievement = 10704,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_Tichondrius"], C_Spell.GetSpellLink(213531)) },
						},
					},
					enabled = true,
					track = function() core._1530:Tichondrius() end,
					partial = false,
					encounterID = 1862,
				},
				boss9 = {
					name = 1743, --Elisande
					bossIDs = {106643},
					achievement = 10699,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_Elisande"], "IAT_68820", "IAT_105301", "IAT_105299", "IAT_68820", "IAT_68820") },
						},
					},
					enabled = true,
					track = function() core._1530:Elisande() end,
					partial = false,
					encounterID = 1872,
				},
				boss10 = {
					name = 1737, --Gul'dan
					bossIDs = {104154},
					achievement = 10696,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheNighthold_Guldan"], C_Spell.GetSpellLink(209270), C_Spell.GetSpellLink(209291), C_Spell.GetSpellLink(209270)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_Goroth"], "IAT_115844", C_Spell.GetSpellLink(233021), C_Spell.GetSpellLink(233279), C_Spell.GetSpellLink(233021), C_Spell.GetSpellLink(233021)) },
						},
					},
					enabled = true,
					track = function() core._1676:Goroth() end,
					partial = false,
					encounterID = 2032,
				},
				boss2 = {
					name = 1867, --Demonic Inquisition
					bossIDs = {116689,116691},
					achievement = 11696,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_DemonicInquisition"], "IAT_116691", C_Spell.GetSpellLink(235230)) },
						},
					},
					enabled = true,
					track = function() core._1676:DemonicInquisition() end,
					partial = false,
					encounterID = 2048,
					displayInfoFrame = true,
				},
				boss3 = {
					name = 1856, --Harjatan
					bossIDs = {116407},
					achievement = 11699,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_Harjatan"], "IAT_121071", "IAT_143660", "IAT_121071") },
						},
					},
					enabled = true,
					track = function() core._1676:Harjatan() end,
					partial = false,
					encounterID = 2036,
				},
				boss4 = {
					name = 1861, --Mistress Sassz'ine
					bossIDs = {},
					achievement = 11676,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_MistressSasszine"], "IAT_116329", C_Spell.GetSpellLink(234621), C_Spell.GetSpellLink(230139), C_Spell.GetSpellLink(234621), C_Spell.GetSpellLink(232913), C_Spell.GetSpellLink(234621), C_Spell.GetSpellLink(234621), "IAT_115795", C_Spell.GetSpellLink(234621), "IAT_115902", C_Spell.GetSpellLink(234621), "IAT_115902", "IAT_115795", C_Spell.GetSpellLink(234621), "IAT_115902") },
						},
					},
					enabled = true,
					track = function() core._1676:MistressSasszine() end,
					partial = false,
					encounterID = 2037,
				},
				boss5 = {
					name = 1903, --Sisters of the Moon
					bossIDs = {118523,118374,118518},
					achievement = 11773,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_SistersOfTheMoon"], "IAT_108600", "IAT_121498", "IAT_121498") },
						},
					},
					enabled = true,
					track = function() core._1676:SistersOfTheMoon() end,
					partial = false,
					encounterID = 2050,
				},
				boss6 = {
					name = 1896, --The Desolate Host
					bossIDs = {},
					achievement = 11674,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_TheDesolateHost"], "IAT_118924", "IAT_119938", C_Spell.GetSpellLink(235956), C_Spell.GetSpellLink(235989)) },
						},
					},
					enabled = true,
					track = function() core._1676:DesolateHost() end,
					partial = false,
					encounterID = 2054,
				},
				boss7 = {
					name = 1897, --Maiden of Vigilance
					bossIDs = {},
					achievement = 11675,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_MaidenOfVigilance"], "IAT_120564", "IAT_118289", C_Spell.GetSpellLink(243276), "IAT_120564", C_Spell.GetSpellLink(236420), "IAT_120564", "IAT_120564") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2052,
				},
				boss8 = {
					name = 1873, --Fallen Avatar
					bossIDs = {},
					achievement = 11683,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_FallenAvatar"], C_Spell.GetSpellLink(235572)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2038,
				},
				boss9 = {
					name = 1898, --Kil'jaeden
					bossIDs = {117269},
					achievement = 11770,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TombOfSargeras_Kiljaeden"], C_Spell.GetSpellLink(242696)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_GarothiWorldbreaker"], C_Spell.GetSpellLink(246686), "IAT_124436", C_Spell.GetSpellLink(246686), "IAT_124436", C_Spell.GetSpellLink(246686), "IAT_124436") },
						},
					},
					enabled = true,
					track = function() core._1712:GarothiWorldbreaker() end,
					partial = false,
					encounterID = 2076,
				},
				boss2 = {
					name = 1987, --Felhounds of Sargeras
					bossIDs = {122477,122135},
					achievement = 12065,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_FelhoundsOfSargeras"], C_Spell.GetSpellLink(253602), "IAT_122477", "IAT_122135", C_Spell.GetSpellLink(253602), "IAT_122477", "IAT_122135", C_Spell.GetSpellLink(253602)) },
						},
					},
					enabled = true,
					track = function() core._1712:FelhoundsOfSargeras() end,
					partial = false,
					encounterID = 2074,
				},
				boss3 = {
					name = 1997, --Antoran High Command
					bossIDs = {122367,130184,122369},
					achievement = 12129,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1712:AntoranHighCommand() end,
					partial = false,
					encounterID = 2070,
				},
				boss4 = {
					name = 1985, --Portal Keeper Hasabel
					bossIDs = {122104},
					achievement = 11928,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_PortalKeeperHasabel"], C_Spell.GetSpellLink(244612), C_Spell.GetSpellLink(245118), C_Spell.GetSpellLink(244612), C_Spell.GetSpellLink(244849), C_Spell.GetSpellLink(246911), C_Spell.GetSpellLink(246925), C_Spell.GetSpellLink(246929)) },
						},
					},
					enabled = true,
					track = function() core._1712:PortalKeeperHasabel() end,
					partial = false,
					encounterID = 2064,
				},
				boss5 = {
					name = 2025, --Eonar
					bossIDs = {},
					achievement = 12067,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["AntorusTheBurningThrone_Eonar"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2075,
				},
				boss6 = {
					name = 2009, --Imonar the Soulhunter
					bossIDs = {},
					achievement = 11949,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["AntorusTheBurningThrone_ImonarTheShoulhunter"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2082,
				},
				boss7 = {
					name = 2004, --Kin-garoth
					bossIDs = {122578},
					achievement = 12030,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_Kingaroth"], C_Spell.GetSpellLink(246779), C_Spell.GetSpellLink(246779)) },
						},
					},
					enabled = true,
					track = function() core._1712:KinGaroth() end,
					partial = false,
					encounterID = 2088,
				},
				boss8 = {
					name = 1983, --Varimathras
					bossIDs = {122366},
					achievement = 11948,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_Varimathras"], "IAT_122366", C_Spell.GetSpellLink(244042)) },
						},
					},
					enabled = true,
					track = function() core._1712:Varimathras() end,
					partial = false,
					encounterID = 2069,
				},
				boss9 = {
					name = 1986, --Coven of Shivarra
					bossIDs = {},
					achievement = 12046,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_CovenOfShivarra"], "IAT_104341", "IAT_104341", C_Spell.GetSpellLink(253189), C_Spell.GetSpellLink(245910), C_Spell.GetSpellLink(710), C_Spell.GetSpellLink(187650), C_Spell.GetSpellLink(339)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2073,
				},
				boss10 = {
					name = 1984, --Aggramar
					bossIDs = {121975},
					achievement = 11915,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_Aggramar"], "IAT_122532", "IAT_123531", "IAT_122532", "IAT_124691", C_Spell.GetSpellLink(244688), C_Spell.GetSpellLink(244688), C_Spell.GetSpellLink(244291), C_Spell.GetSpellLink(244033), C_Spell.GetSpellLink(244291), C_Spell.GetSpellLink(244033), C_Spell.GetSpellLink(246014), "IAT_122532", "IAT_122532", C_Spell.GetSpellLink(710), C_Spell.GetSpellLink(244033), C_Spell.GetSpellLink(189110), C_Spell.GetSpellLink(16979), C_Spell.GetSpellLink(100), C_Spell.GetSpellLink(187650), C_Spell.GetSpellLink(339), C_Spell.GetSpellLink(189110), "IAT_122532") },
						},
					},
					enabled = true,
					track = function() core._1712:Aggramar() end,
					partial = false,
					encounterID = 2063,
				},
				boss11 = {
					name = 2031, --Argus
					bossIDs = {124828},
					achievement = 12257,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AntorusTheBurningThrone_Argus"], "IAT_124828", "IAT_129722", "IAT_127809", "IAT_129722", "IAT_129722", "IAT_127809", "IAT_129722", "IAT_154431", "IAT_129722", "IAT_127809", "IAT_129722", "IAT_154431") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SeatOfTheTriumvirate_ZuraalTheAscended"], C_Spell.GetSpellLink(244433), "IAT_126283", C_Spell.GetSpellLink(244621), "IAT_126283", "IAT_122313") },
						},
					},
					enabled = true,
					track = function() core._1753:ZuraalTheAscended() end,
					partial = false,
					encounterID = 2065,
				},
				boss2 = {
					name = 1980, --Saprish
					bossIDs = {},
					achievement = 12005,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SeatOfTheTriumvirate_Saprish"], "IAT_126312", "IAT_122319", "IAT_126312", "IAT_122316") },
						},
					},
					enabled = true,
					track = function() core._1753:Saprish() end,
					partial = false,
					encounterID = 2066,
				},
				boss3 = {
					name = 1982, --L'ura
					bossIDs = {124729},
					achievement = 12009,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["SeatOfTheTriumvirate_Lura"], C_Spell.GetSpellLink(250820), C_Spell.GetSpellLink(250821), "IAT_122314", C_Spell.GetSpellLink(250821)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AssaultOnVioletHold_MillificentManastorm"], "IAT_118938", "IAT_101976") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1847,
				},
				boss2 = {
					name = 1693, --Festerface
					bossIDs = {101995},
					achievement = 10554,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["AssaultOnVioletHold_Festerface"], "IAT_102169", "IAT_101995", "IAT_102169") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
					},
					enabled = true,
					track = function() core._1456:WarlordParjesh() end,
					partial = false,
					encounterID = 1810,
				},
				boss2 = {
					name = 1490, --Lady Hatecoil
					bossIDs = {91789},
					achievement = 10457,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["EyeOfAzshara_LadyHatecoil"], C_Spell.GetSpellLink(193698), "IAT_98293", "IAT_98293", "IAT_98293") },
						},
					},
					enabled = true,
					track = function() core._1456:LadyHatecoil() end,
					partial = false,
					encounterID = 1811,
				},
				boss3 = {
					name = 1492, --Wrath of Azshara
					bossIDs = {96028},
					achievement = 10458,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["DarkheartThicket_Dresaron"], "IAT_99200", "IAT_111008") },
						},
					},
					enabled = true,
					track = function() core._1466:Dresaron() end,
					partial = false,
					encounterID = 1838,
				},
				boss2 = {
					name = 1657, --Shade of Xavius
					bossIDs = {99192},
					achievement = 10769,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["DarkheartThicket_ShadeOfXavius"], C_Spell.GetSpellLink(221315)) },
						},
					},
					enabled = true,
					track = function() core._1466:ShadeOfXavius() end,
					partial = false,
					encounterID = 1839,
				},
			},

			[1477] = { --Halls of Valor
				name = 721,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME7
					bossIDs = {99891},
					achievement = 10544,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfValor_Other1"], "IAT_99868", "IAT_99891", "IAT_96609", "IAT_99891", "IAT_96609", "IAT_99891", C_Spell.GetSpellLink(207753)) },
						},
					},
					enabled = true,
					track = function() core._1477:StagParty() end,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME8
					bossIDs = {},
					achievement = 10542,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HallsOfValor_Other2"], "IAT_99868", "IAT_95833", "IAT_102423", C_Spell.GetSpellLink(202285), "IAT_102423", "IAT_95843", "IAT_97083", "IAT_97084", "IAT_97081") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 1489, --Odyn
					bossIDs = {95676},
					achievement = 10543,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1477:Odyn() end,
					partial = false,
					encounterID = 1809,
				},
			},

			[1458] = { --Neltharion's Lair
				name = 767,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME9
					bossIDs = {},
					achievement = 10996,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NeltharionsLair_Other"], "IAT_140212", "IAT_101823", "IAT_140212", "IAT_140212", "IAT_113204", "IAT_111882", "IAT_113204", "IAT_111882", "IAT_140212", "IAT_111861", "IAT_105743", "IAT_105742", "IAT_105744", "IAT_111864", "IAT_111864", "IAT_140212") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 1673, --Naraxas
					bossIDs = {91005},
					achievement = 10875,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["NeltharionsLair_Naraxas"], C_Spell.GetSpellLink(199246), C_Spell.GetSpellLink(199246)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["VaultOfTheWardens_AshGolm"], C_Spell.GetSpellLink(199238), C_Spell.GetSpellLink(215478), C_Spell.GetSpellLink(215478)) },
						},
					},
					enabled = true,
					track = function() core._1493:AshGolm() end,
					partial = false,
					encounterID = 1816,
				},
				boss2 = {
					name = 1470, --Cordana
					bossIDs = {95888},
					achievement = 10680,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["VaultOfTheWardens_Cordana"], C_Spell.GetSpellLink(197422), C_Spell.GetSpellLink(197422), "IAT_95888", C_Spell.GetSpellLink(197941), "IAT_95888", C_Spell.GetSpellLink(197422), C_Spell.GetSpellLink(197941), C_Spell.GetSpellLink(197422), C_Spell.GetSpellLink(188501)) },
						},
					},
					enabled = true,
					track = function() core._1493:Cordana() end,
					partial = false,
					encounterID = 1818,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME10
					bossIDs = {},
					achievement = 10707,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["VaultOfTheWardens_Other"], "IAT_78430", C_Spell.GetSpellLink(192656), "IAT_95886", "IAT_102396") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1501] = { --Black Rook Hold
				name = 740,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME11
					bossIDs = {},
					achievement = 10709,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackRookHold_Other"], "IAT_100436", "IAT_100436", "IAT_94923", "IAT_98949", "IAT_94923") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 1518, --Amalgam of Souls
					bossIDs = {98542},
					achievement = 10710,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackRookHold_AmalgamOfSouls"], "IAT_98542", "IAT_99664", "IAT_99664", "IAT_99663", "IAT_99663", "IAT_99663") },
						},
					},
					enabled = true,
					track = function() core._1501:AmalgamOfSouls() end,
					partial = false,
					encounterID = 1832,
				},
				boss3 = {
					name = 1653, --Ilysanna Ravencrest
					bossIDs = {98696},
					achievement = 10711,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["MawOfSouls_Ymiron"], "IAT_97200", "IAT_96756", "IAT_98246", "IAT_97200", "IAT_98246", C_Spell.GetSpellLink(195031), "IAT_98246", C_Spell.GetSpellLink(195031)) },
						},
					},
					enabled = true,
					track = function() core._1492:Ymiron() end,
					partial = false,
					encounterID = 1822,
				},
				boss2 = {
					name = 1486, --Helya (Maw of Souls)
					bossIDs = {},
					achievement = 10412,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["MawOfSouls_Helya"], C_Spell.GetSpellLink(213413), "IAT_91387", C_Spell.GetSpellLink(213413), C_Spell.GetSpellLink(213404), C_Spell.GetSpellLink(213407), "IAT_94923", C_Spell.GetSpellLink(213441), "IAT_96756", C_Spell.GetSpellLink(213413), "IAT_96754", C_Spell.GetSpellLink(213413), "IAT_91387") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1824,
				},
				boss3 = {
					name = L["Instances_Other"], --MISSINGNAME12
					bossIDs = {},
					achievement = 10411,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["MawOfSouls_Other"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1516] = { --The Arcway
				name = 726,
				boss1 = {
					name = 1497, --Ivanyr
					bossIDs = {98203},
					achievement = 10773,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1516:Ivanyr() end,
					partial = false,
					encounterID = 1827,
				},
				boss2 = {
					name = 1498, --Corstilax
					bossIDs = {},
					achievement = 10775,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1825,
				},
				boss3 = {
					name = 1501, --Advisor Vandros
					bossIDs = {98208},
					achievement = 10776,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CourtOfStars_PatrolCaptainGerdo"], C_Spell.GetSpellLink(207806)) },
						},
					},
					enabled = true,
					track = function() core._1571:PatrolCaptainGerdo() end,
					partial = false,
					encounterID = 1868,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME13
					bossIDs = {},
					achievement = 10611,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CourtOfStars_Other"], "IAT_104251", C_Spell.GetSpellLink(210261), "IAT_104217") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1651] = { --Return to Karazhan
				name = 860,
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME14
					bossIDs = {},
					achievement = 11433,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ReturnToKarazhan_Other1"], "IAT_115831") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss2 = {
					name = 1820, --Opera Hall
					bossIDs = {},
					achievement = 11335,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["ReturnToKarazhan_OperaHall"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1957,
				},
				boss3 = {
					name = 1837, --Moroes
					bossIDs = {},
					achievement = 11338,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossesTogether"] },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1961,
				},
				boss4 = {
					name = 1817, --Shade of Medivh
					bossIDs = {},
					achievement = 11432,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ReturnToKarazhan_ShadeOfMedivh"], C_Spell.GetSpellLink(232658), C_Spell.GetSpellLink(232658)) },
						},
					},
					enabled = true,
					track = function() core._1651:ShadeOfMedivh() end,
					partial = false,
					encounterID = 1965,
				},
				boss5 = {
					name = 1818, --Mana Devourer
					bossIDs = {},
					achievement = 11431,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ReturnToKarazhan_ManaDevourer"], "IAT_114462", "IAT_116802", "IAT_115831", "IAT_116802", "IAT_114462", "IAT_116802", "IAT_116802", "IAT_116802", "IAT_116802", "IAT_116802", "IAT_158190", "IAT_116802", "IAT_115831", "IAT_116802", "IAT_116802") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1959,
				},
				boss6 = {
					name = L["Instances_Other"], --MISSINGNAME15
					bossIDs = {},
					achievement = 11430,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ReturnToKarazhan_Other2"], "IAT_98761", "IAT_98761", "IAT_98761", "IAT_113971", "IAT_15687", "IAT_15687", "IAT_114462", "IAT_98761", "IAT_158190", "IAT_114895", "IAT_98761", C_Spell.GetSpellLink(229074), "IAT_98761") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
			},

			[1677] = { --Cathedral of Eternal Night
				name = 900,
				boss1 = {
					name = 1905, --Agronox
					bossIDs = {},
					achievement = 11768,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CathedralOfEternalNight_Agronox"], C_Spell.GetSpellLink(236627)) },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 2055,
				},
				boss2 = {
					name = 1906, --Thrashbite the Scornful
					bossIDs = {117194},
					achievement = 11769,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CathedralOfEternalNight_ThrashbiteTheScornful"], C_Spell.GetSpellLink(237726), C_Spell.GetSpellLink(243261)) },
						},
					},
					enabled = true,
					track = function() core._1677:ThrashbiteTheScornful() end,
					partial = false,
					encounterID = 2057,
				},
				boss3 = {
					name = 1878, --Mephistroth
					bossIDs = {},
					achievement = 11703,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["CathedralOfEternalNight_Mephistroth"], "IAT_129207", C_Spell.GetSpellLink(232502), C_Spell.GetSpellLink(232502)) },
						},
					},
					enabled = true,
					track = function() core._1677:Mephistroth() end,
					partial = false,
					encounterID = 2039,
				},
			},
		},
	},

	--Warlords of Dranor
	[6] = {
		Raids = {
			[1228] = { --Highmaul
				name = 477,
				boss1 = {
					name = 1128, --Kargath Bladefist
					bossIDs = {78714},
					achievement = 8948,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1228:KargathBladefist() end,
					partial = false,
					encounterID = 1721,
				},
				boss2 = {
					name = 971, --The Butcher
					bossIDs = {77404},
					achievement = 8947,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Highmaul_TheButcher"], "IAT_80728", "IAT_80728", "IAT_80728", C_Spell.GetSpellLink(156152)) },
						},
					},
					enabled = true,
					track = function() core._1228:TheButcher() end,
					partial = false,
					encounterID = 1706,
				},
				boss3 = {
					name = 1195, --Tectus
					bossIDs = {}, --78948,
					achievement = 8974,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Highmaul_Tectus"], "IAT_78948", "IAT_80551", "IAT_80551", "IAT_80557", "IAT_80557") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1722,
				},
				boss4 = {
					name = 1196, --Brackenspore
					bossIDs = {78491},
					achievement = 8975,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Highmaul_Brackenspore"], "IAT_81403", "IAT_71803", C_Spell.GetSpellLink(163590), C_Spell.GetSpellLink(163590), "IAT_71803", C_Spell.GetSpellLink(163590), C_Spell.GetSpellLink(165223)) },
						},
					},
					enabled = true,
					track = function() core._1228:Brackenspore() end,
					partial = false,
					encounterID = 1720,
				},
				boss5 = {
					name = 1148, --Twin Ogron
					bossIDs = {78237,78238},
					achievement = 8958,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1719,
				},
				boss6 = {
					name = 1153, --Ko'ragh
					bossIDs = {79015},
					achievement = 8976,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1228:Koragh() end,
					partial = false,
					encounterID = 1723,
				},
				boss7 = {
					name = 1197, --Imperator Mar'gok
					bossIDs = {},
					achievement = 8977,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Highmaul_ImperatorMargok"], "IAT_78121", "IAT_78121", C_Spell.GetSpellLink(155040), C_Spell.GetSpellLink(57602), C_Spell.GetSpellLink(166389), "IAT_78121", "IAT_78121") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["BlackrockFoundry_BeastlordDarmac"] },
						},
					},
					enabled = true,
					track = function() core._1205:BeastlordDarmac() end,
					partial = false,
					encounterID = 1694,
				},
				boss2 = {
					name = 1147, --Operator Thogar
					bossIDs = {76906},
					achievement = 8982,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackrockFoundry_OperatorThogar"], "IAT_44606", "IAT_45057", "IAT_45057") },
						},
					},
					enabled = true,
					track = function() core._1205:OperatorThogar() end,
					partial = false,
					encounterID = 1692,
				},
				boss3 = {
					name = 1203, --Iron Maidens
					bossIDs = {77477, 77557, 77231},
					achievement = 8984,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossesTogether"] },
						},
					},
					enabled = true,
					track = function() core._1205:TheIronMaidens() end,
					partial = false,
					encounterID = 1695,
				},
				boss4 = {
					name = 1155, --Hans'gar & Franzok
					bossIDs = {76973, 76974},
					achievement = 8980,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1205:HansgarFranzok() end,
					partial = false,
					encounterID = 1693,
				},
				boss5 = {
					name = 1123, --Flamebender Ka'graz
					bossIDs = {76814},
					achievement = 8929,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
					},
					enabled = true,
					track = function() core._1205:FlamebenderKagraz() end,
					partial = false,
					encounterID = 1689,
				},
				boss6 = {
					name = 1162, --Kromog
					bossIDs = {77692},
					achievement = 8983,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackrockFoundry_Kromog"], C_Spell.GetSpellLink(157059), C_Spell.GetSpellLink(157059), C_Spell.GetSpellLink(157054), C_Spell.GetSpellLink(157054)) },
						},
					},
					enabled = true,
					track = function() core._1205:Kromog() end,
					partial = false,
					encounterID = 1713,
				},
				boss7 = {
					name = 1161, --Gruul
					bossIDs = {},
					achievement = 8978,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackrockFoundry_Gruul"], "IAT_82074", C_Spell.GetSpellLink(155301), C_Spell.GetSpellLink(155301), "IAT_82074", C_Spell.GetSpellLink(155301), "IAT_82074", "IAT_82074", "IAT_82074") },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1691,
				},
				boss8 = {
					name = 1202, --Oregorger
					bossIDs = {},
					achievement = 8979,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackrockFoundry_Oregorger"], "IAT_77182", C_Spell.GetSpellLink(163453), C_Spell.GetSpellLink(163454), "IAT_80951", "IAT_80951", "IAT_80951", "IAT_80951") },
						},
					},
					enabled = true,
					track = function() core._1205:Oregorger() end,
					partial = false,
					encounterID = 1696,
				},
				boss9 = {
					name = 1154, --Blast Furnace
					bossIDs = {76806},
					achievement = 8930,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["BlackrockFoundry_BlastFurnace"] },
						},
					},
					enabled = true,
					track = function() core._1205:BlastFurnace() end,
					partial = false,
					encounterID = 1690,
				},
				boss10 = {
					name = 959, --Blackhand
					bossIDs = {77325},
					achievement = 8952,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BlackrockFoundry_Blackhand"], C_Spell.GetSpellLink(163324), C_Spell.GetSpellLink(163324), C_Spell.GetSpellLink(156096), C_Spell.GetSpellLink(156107)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HellfireCitadel_HellfireAssault"], "IAT_90018", "IAT_90018") },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1778,
				},
				boss2 = {
					name = 1425, --Iron Reaver
					bossIDs = {}, --90284,
					achievement = 10057,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HellfireCitadel_IronReaver"], "IAT_94808", "IAT_94808", C_Spell.GetSpellLink(185282), "IAT_94808", "IAT_94808") },
						},
					},
					enabled = true,
					track = function() core._1448:IronReaver() end,
					partial = false,
					encounterID = 1785,
				},
				boss3 = {
					name = 1392, --Kormrok
					bossIDs = {90435},
					achievement = 10013,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1448:Kormrok() end,
					partial = false,
					encounterID = 1787,
				},
				boss4 = {
					name = 1432, --Hellfire High Council
					bossIDs = {92144, 92146, 92142},
					achievement = 10054,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["HellfireCitadel_HellfireHighCouncil"] },
						},
					},
					enabled = true,
					track = function() core._1448:HellfireHighCouncil() end,
					partial = false,
					encounterID = 1798,
				},
				boss5 = {
					name = 1396, --Kilrogg Deadeye
					bossIDs = {90378},
					achievement = 9972,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1786,
				},
				boss6 = {
					name = 1372, --Gorefiend
					bossIDs = {90199},
					achievement = 9979,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HellfireCitadel_Gorefiend"], "IAT_90199", "IAT_90199", C_Spell.GetSpellLink(181973), "IAT_94996", "IAT_93145", "IAT_93145") },
						},
					},
					enabled = true,
					track = function() core._1448:Gorefiend() end,
					partial = false,
					encounterID = 1783,
				},
				boss7 = {
					name = 1433, --Shadow-Lord Iskar
					bossIDs = {90316},
					achievement = 9988,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1448:ShadowLordIskar() end,
					partial = false,
					encounterID = 1788,
				},
				boss8 = {
					name = 1427, --Socrethar the Eternal
					bossIDs = {90296},
					achievement = 10086,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HellfireCitadel_SocretharTheEternal"], "IAT_90296", "IAT_90296", "IAT_91938", C_Spell.GetSpellLink(181288), "IAT_90296", "IAT_91938", "IAT_91938", C_Spell.GetSpellLink(102359), "IAT_90296") },
						},
					},
					enabled = true,
					track = function() core._1448:SocretharTheEternal() end,
					partial = false,
					encounterID = 1794,
				},
				boss9 = {
					name = 1394, --Tyrant Velhari
					bossIDs = {93439},
					achievement = 9989,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
					},
					enabled = true,
					track = function() core._1448:TyrantVelhari() end,
					partial = false,
					encounterID = 1784,
				},
				boss10 = {
					name = 1391, --Fel Lord Zakuun
					bossIDs = {89890},
					achievement = 10012,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1448:FelLordZakuun() end,
					partial = false,
					encounterID = 1777,
				},
				boss11 = {
					name = 1447, --Xhul'horac
					bossIDs = {93068},
					achievement = 10087,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1448:Xhulhorac() end,
					partial = false,
					encounterID = 1800,
				},
				boss12 = {
					name = 1395, --Mannoroth
					bossIDs = {91349, 91305},
					achievement = 10030,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HellfireCitadel_Mannoroth"], "IAT_91305", C_Spell.GetSpellLink(181275), "IAT_91305", "IAT_91241", "IAT_91241", "IAT_91349", "IAT_91241", "IAT_91349", "IAT_91241", C_Spell.GetSpellLink(182077), C_Spell.GetSpellLink(182077), "IAT_91241") },
						},
					},
					enabled = true,
					track = function() core._1448:Mannoroth() end,
					partial = false,
					encounterID = 1795,
				},
				boss13 = {
					name = 1438, --Archimonde
					bossIDs = {91331},
					achievement = 10073,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["HellfireCitadel_Archimonde"], "IAT_92208", "IAT_92208", "IAT_92208") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BloodmaulSlagMines_SlaveWatcherCrushto"], "IAT_74787", "IAT_88334", "IAT_74787", "IAT_74475", "IAT_88334", "IAT_88334") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					encounterID = 1653,
				},
				boss2 = {
					name = 893, --Magmolatus
					bossIDs = {74366},
					achievement = 8993,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["BloodmaulSlagMines_Magmolatus"], "IAT_74571", "IAT_74570") },
						},
					},
					enabled = true,
					track = function() core._1175:Magmolatus() end,
					partial = false,
					encounterID = 1655,
				},
				boss3 = {
					name = 889, --Gug'rokk
					bossIDs = {74790},
					achievement = 9008,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["IronDocks_FleshrenderNokgar"], "IAT_83026", "IAT_84520", "IAT_81603", "IAT_81305", "IAT_81305") },
						},
					},
					enabled = true,
					track = function() core._1195:FleshrenderNokgar() end,
					partial = false,
					encounterID = 1749,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME16
					bossIDs = {},
					achievement = 9081,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["IronDocks_Other"], "IAT_87451", "IAT_77153", "IAT_77153", "IAT_83775", "IAT_77153", "IAT_83775", "IAT_83775", "IAT_77153", "IAT_77153") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 1238, --Skulloc
					bossIDs = {83612},
					achievement = 9082,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Auchindoun_SoulbinderNyami"], "IAT_76283", "IAT_75029", "IAT_76283", "IAT_76283") },
						},
					},
					enabled = true,
					track = function() core._1182:SoulbinderNyami() end,
					partial = false,
					encounterID = 1685,
				},
				boss2 = {
					name = 1216, --Azzakel
					bossIDs = {},
					achievement = 9551,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1182:Azzakel() end,
					partial = false,
					encounterID = 1678,
				},
				boss3 = {
					name = 1225, --Teron'gor
					bossIDs = {},
					achievement = 9552,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Auchindoun_Terongor"], "IAT_86219", C_Spell.GetSpellLink(153396), C_Spell.GetSpellLink(153396), "IAT_86219", "IAT_77814", "IAT_77814") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1209:Ranjit() end,
					partial = false,
					encounterID = 1698,
				},
				boss2 = {
					name = 967, --Rukhran
					bossIDs = {},
					achievement = 9035,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Skyreach_Rukhran"], "IAT_76227", "IAT_76227", C_Spell.GetSpellLink(176544), C_Spell.GetSpellLink(153828), "IAT_76227", "IAT_76227", "IAT_76227", C_Spell.GetSpellLink(176544), C_Spell.GetSpellLink(176544)) },
						},
					},
					enabled = true,
					track = function() end,
					partial = false,
					encounterID = 1700,
				},
				boss3 = {
					name = 968, --High Sage Viryx
					bossIDs = {76266},
					achievement = 9036,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1209:HighSageViryx() end,
					partial = false,
					encounterID = 1701,
				},
				boss4 = {
					name = 968, --High Sage Viryx
					bossIDs = {},
					achievement = 9034,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Skyreach_HighSageViryx"], C_Spell.GetSpellLink(154043), C_Spell.GetSpellLink(154043), "IAT_86918", "IAT_86928", "IAT_86928") },
						},
					},
					enabled = false,
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["GrimrailDepot_RocketsparkAndBorka"], "IAT_81834", "IAT_77816", C_Spell.GetSpellLink(161089)) },
						},
					},
					enabled = true,
					track = function() core._1208:RocketsparkAndBorka() end,
					partial = false,
					encounterID = 1715,
				},
				boss2 = {
					name = 1163, --Nitrogg Thundertower
					bossIDs = {},
					achievement = 9007,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["GrimrailDepot_NitroggThundertower"], C_Spell.GetSpellLink(132469), C_Spell.GetSpellLink(51490), C_Spell.GetSpellLink(142895)) },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1279:Witherbark() end,
					partial = false,
					encounterID = 1746,
				},
				boss2 = {
					name = 1210, --Yalnu
					bossIDs = {}, --83846,
					achievement = 9223,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["ShadowmoonBurialGrounds_SadanaBloodfury"] },
						},
					},
					enabled = true,
					track = function() core._1176:SadanaBloodfury() end,
					partial = false,
					encounterID = 1677,
				},
				boss2 = {
					name = 1140, --Bonemaw
					bossIDs = {77006, 75452},
					achievement = 9025,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ShadowmoonBurialGrounds_Bonemaw"], "IAT_75829", "IAT_77006", "IAT_75452", "IAT_75452", "IAT_75452", C_Spell.GetSpellLink(153804), "IAT_77006", "IAT_77006") },
						},
					},
					enabled = true,
					track = function() core._1176:Bonemaw() end,
					partial = true,
					encounterID = 1679,
				},
				boss3 = {
					name = 1160, --Ner'zhul
					bossIDs = {76407},
					achievement = 9026,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["ShadowmoonBurialGrounds_Nerzhul"], "IAT_82457", C_Spell.GetSpellLink(154469), "IAT_76598") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._1358:OrebenderGorashan() end,
					partial = false,
					encounterID = 1761,
				},
				boss2 = {
					name = L["Instances_Other"], --MISSINGNAME17
					bossIDs = {},
					achievement = 9058,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["UpperBlackrockSpire_Other"], "IAT_86250", "IAT_146016", "IAT_86251", "IAT_77927", "IAT_77927", "IAT_146016", "IAT_146016", "IAT_77927") },
						},
					},
					enabled = false,
					track = nil,
					partial = false,
					nameWrath = L["Instances_Other"],
				},
				boss3 = {
					name = 1229, --Ragewing the Untamed
					bossIDs = {76585},
					achievement = 9056,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["UpperBlackrockSpire_RagewingTheUntamed"], "IAT_76585", "IAT_76801", "IAT_76801", "IAT_76801") },
						},
					},
					enabled = true,
					track = function() core._1358:RagewingTheUntamed() end,
					partial = false,
					encounterID = 1760,
				},
				boss4 = {
					name = 1234, --Warlord Zaela
					bossIDs = {77120},
					achievement = 9057,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["UpperBlackrockSpire_WarlordZaela"], "IAT_78736", "IAT_82428", "IAT_82428") },
						},
					},
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
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TerraceOfEndlessSpring_ProtectorsOfTheEndless"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["TerraceOfEndlessSpring_LeiShi"], "IAT_62983", "IAT_64346", "IAT_64346", "IAT_64346", "IAT_64346") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ThroneOfThunder_JinrokhTheBreaker"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ThroneOfThunder_CouncilOfElders"] },
						},
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
						[11] = {
							{ tactic = format(L["ThroneOfThunder_Tortos"], "IAT_67977", "IAT_67966", "IAT_67966", "IAT_67966", "IAT_67966") },
						},
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
						[11] = {
							{ tactic = format(L["ThroneOfThunder_Megaera"], "IAT_68065", "IAT_69086", "IAT_70250", "IAT_70251", "IAT_70252") },
						},
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
						[11] = {
							{ tactic = L["ThroneOfThunder_JiKun"] },
						},
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
						[11] = {
							{ tactic = L["ThroneOfThunder_DurumuTheForgotten"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ThroneOfThunder_DarkAnimus"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["ThroneOfThunder_TwinConsorts"], "IAT_68905", "IAT_68904") },
						},
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
						[11] = {
							{ tactic = format(L["ThroneOfThunder_LeiShen"], C_Spell.GetSpellLink(145444)) },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_Immerseus"], C_Spell.GetSpellLink(339), "IAT_72436", "IAT_71603", "IAT_73638", "IAT_73638", "IAT_73638") },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_TheFallenProtectors"], C_Spell.GetSpellLink(144365), C_Spell.GetSpellLink(144365), C_Spell.GetSpellLink(144365), C_Spell.GetSpellLink(144365)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_IronJuggernaut"], "IAT_71466", C_Spell.GetSpellLink(144918), "IAT_148201", "IAT_148201", C_Spell.GetSpellLink(144918), "IAT_72889", "IAT_72889") },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_KorkronDarkShaman"], "IAT_71466", "IAT_72455", "IAT_164076", "IAT_142949", "IAT_72496", "IAT_72490", "IAT_72545", "IAT_72451") },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_GeneralNazgrim"], "IAT_96223", "IAT_96223", "IAT_55087", "IAT_96223", "IAT_55087", "IAT_55087") },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_Malkorok"], "IAT_73033", "IAT_67844", "IAT_73033", "IAT_67844", C_Spell.GetSpellLink(142842), "IAT_73033", "IAT_73265", "IAT_73033", "IAT_73265", "IAT_67844") },
						},
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
						[11] = {
							{ tactic = L["SiegeOfOrgrimmar_SpoilsOfPandaria"] },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_ThokTheBloodthirsty"], "IAT_71529", "IAT_73195", "IAT_99646", "IAT_99646", "IAT_99646", "IAT_99646", "IAT_73195") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_ParagonsOfTheKlaxxi"], C_Spell.GetSpellLink(127811), C_Spell.GetSpellLink(141857), C_Spell.GetSpellLink(148649), C_Spell.GetSpellLink(127811), C_Spell.GetSpellLink(141857), C_Spell.GetSpellLink(141856), C_Spell.GetSpellLink(148653), C_Spell.GetSpellLink(127811), C_Spell.GetSpellLink(141853), C_Spell.GetSpellLink(148655), C_Spell.GetSpellLink(141857), C_Spell.GetSpellLink(142272), C_Spell.GetSpellLink(148651)) },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfOrgrimmar_GarroshHellscream"], "IAT_71979", "IAT_71984", "IAT_90049", "IAT_71983", "IAT_71979", "IAT_90049", "IAT_90049", "IAT_71979", "IAT_90049", "IAT_71979", "IAT_90049", "IAT_90049", "IAT_90049") },
						},
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
						[11] = {
							{ tactic = format(L["HeartOfFear_ImperialVizierZorlok"], C_Spell.GetSpellLink(125785), C_Spell.GetSpellLink(125785), C_Spell.GetSpellLink(125785), C_Spell.GetSpellLink(125785), C_Spell.GetSpellLink(125785), C_Spell.GetSpellLink(125785)) },
						},
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
						[11] = {
							{ tactic = format(L["HeartOfFear_BladeLordTayak"], C_Spell.GetSpellLink(128949), C_Spell.GetSpellLink(128949), C_Spell.GetSpellLink(128949)) },
						},
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
						[11] = {
							{ tactic = format(L["HeartOfFear_Garalon"], "IAT_62164") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["HeartOfFear_AmberShaperUnsok"] },
						},
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
						[11] = {
							{ tactic = format(L["HeartOfFear_GrandEmpressShekzeer"], "IAT_154638", "IAT_63591") },
						},
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
						[11] = {
							{ tactic = format(L["MogushanVaults_TheStoneGuard"], C_Spell.GetSpellLink(70613), C_Spell.GetSpellLink(69452), C_Spell.GetSpellLink(90637), C_Spell.GetSpellLink(15999), C_Spell.GetSpellLink(65382)) },
						},
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
						[11] = {
							{ tactic = format(L["MogushanVaults_FengTheAccursed"], C_Spell.GetSpellLink(116936), C_Spell.GetSpellLink(118307), C_Spell.GetSpellLink(118194), C_Spell.GetSpellLink(115730), C_Spell.GetSpellLink(116938), C_Spell.GetSpellLink(115911)) },
						},
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
						[11] = {
							{ tactic = format(L["MogushanVaults_GarajalTheSpiritbinder"], "IAT_15363", "IAT_15363", "IAT_64526") },
						},
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
						[11] = {
							{ tactic = format(L["MogushanVaults_TheSpiritKings"], "IAT_60709", "IAT_61427", "IAT_61427", C_Spell.GetSpellLink(118122), "IAT_61427", C_Spell.GetSpellLink(118047), C_Spell.GetSpellLink(118047), C_Spell.GetSpellLink(118047)) },
						},
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
						[11] = {
							{ tactic = format(L["MogushanVaults_Other"], "IAT_60410", "IAT_64061", "IAT_64061", "IAT_60410", "IAT_64061", C_Spell.GetSpellLink(126958)) },
						},
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
						[11] = {
							{ tactic = format(L["MogushanVaults_Elegon"], "IAT_60410", C_Spell.GetSpellLink(116529), "IAT_60913", "IAT_60913") },
						},
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
						[11] = {
							{ tactic = L["MogushanVaults_WillOfTheEmperor"] },
						},
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
						[11] = {
							{ tactic = format(L["StormstoutBrewery_Other2"], "IAT_59822", "IAT_80313", "IAT_59824", "IAT_59824") },
						},
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
						[11] = {
							{ tactic = L["StormstoutBrewery_OokOok"] },
						},
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
						[11] = {
							{ tactic = format(L["StormstoutBrewery_Other1"], "IAT_56637", "IAT_59458", "IAT_56717", "IAT_60276", "IAT_59458", "IAT_60276", C_Spell.GetSpellLink(111662), "IAT_59458", "IAT_60276") },
						},
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
						[11] = {
							{ tactic = format(L["StormstoutBrewery_Hoptallus"], "IAT_56637", "IAT_59458", "IAT_59458", "IAT_59458", C_Spell.GetSpellLink(111662)) },
						},
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
						[11] = {
							{ tactic = format(L["ScarletHalls_HoundmasterBraun"], "IAT_59303", "IAT_59303") },
						},
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
						[11] = {
							{ tactic = format(L["ScarletHalls_ArmsmasterHarlan"], "IAT_58676", C_Spell.GetSpellLink(111216), "IAT_58676", C_Spell.GetSpellLink(111216), "IAT_58676", C_Spell.GetSpellLink(111216)) },
						},
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
						[11] = {
							{ tactic = format(L["ScarletMonastery_ThalnosTheSoulrender"], "IAT_59789", "IAT_59930", "IAT_59930", "IAT_59930") },
						},
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
						[11] = {
							{ tactic = format(L["ScarletMonastery_BrotherKorloff"], "IAT_150024", "IAT_126712", C_Spell.GetSpellLink(114807), C_Spell.GetSpellLink(113764), "IAT_126712", "IAT_126712") },
						},
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
						[11] = {
							{ tactic = format(L["ScarletMonastery_HighInquisitorWhitemane"], "IAT_60040", "IAT_110758", C_Spell.GetSpellLink(113134), "IAT_58605", "IAT_58605", "IAT_60040", "IAT_110758") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Scholomance_Other1"], "IAT_59153", "IAT_59368", "IAT_59368", C_Spell.GetSpellLink(114141), C_Spell.GetSpellLink(114141), "IAT_59368", "IAT_59368", C_Spell.GetSpellLink(114141)) },
						},
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
						[11] = {
							{ tactic = format(L["Scholomance_Other2"], C_Spell.GetSpellLink(113395), "IAT_59100", C_Spell.GetSpellLink(113395), "IAT_59100", "IAT_59100") },
						},
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
						[11] = {
							{ tactic = L["Scholomance_Other3"] },
						},
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
						[11] = {
							{ tactic = L["TempleOfTheJadeSerpent_WiseMari"] },
						},
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
						[11] = {
							{ tactic = format(L["TempleOfTheJadeSerpent_ShaOfDoubt1"], C_Spell.GetSpellLink(117665), C_Spell.GetSpellLink(117665), "IAT_65614", "IAT_65614") },
						},
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
						[11] = {
							{ tactic = format(L["TempleOfTheJadeSerpent_ShaOfDoubt2"], "IAT_150081", C_Spell.GetSpellLink(118714), "IAT_56843", "IAT_150081") },
						},
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
						[11] = {
							{ tactic = format(L["MoguShanPalace_Gekkan"], "IAT_61431", "IAT_61243") },
						},
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
						[11] = {
							{ tactic = format(L["MoguShanPalace_XinTheWeaponmaster"], "IAT_156034") },
						},
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
						[11] = {
							{ tactic = format(L["MoguShanPalace_Other"], "IAT_63091", "IAT_61442", "IAT_67231", "IAT_61243", "IAT_61884", "IAT_63091") },
						},
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
						[11] = {
							{ tactic = format(L["ShadoPanMonastery_MasterSnowdrift"], "IAT_65407", "IAT_65407", "IAT_65407") },
						},
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
						[11] = {
							{ tactic = format(L["ShadoPanMonastery_ShaOfViolence"], "IAT_153415", "IAT_63342", "IAT_63342") },
						},
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
						[11] = {
							{ tactic = format(L["ShadoPanMonastery_TaranZhu"], C_Spell.GetSpellLink(107087), C_Spell.GetSpellLink(107087), C_Spell.GetSpellLink(107087)) },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfNiuazaoTemple_CommanderVojak"], "IAT_61699", C_Spell.GetSpellLink(120200), "IAT_61699") },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfNiuazaoTemple_GeneralPavalak"], C_Spell.GetSpellLink(160533), C_Spell.GetSpellLink(119388), C_Spell.GetSpellLink(119388), C_Spell.GetSpellLink(119703), C_Spell.GetSpellLink(119703), C_Spell.GetSpellLink(119703), C_Spell.GetSpellLink(160533), C_Spell.GetSpellLink(119388), C_Spell.GetSpellLink(119388), C_Spell.GetSpellLink(119703)) },
						},
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
						[11] = {
							{ tactic = format(L["SiegeOfNiuazaoTemple_WingLeaderNeronok"], C_Spell.GetSpellLink(217148), C_Spell.GetSpellLink(217148), "IAT_64471", C_Spell.GetSpellLink(125146), C_Spell.GetSpellLink(125146)) },
						},
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
						[11] = {
							{ tactic = format(L["GateOfTheSettingSun_SaboteurKiptilak"], C_Spell.GetSpellLink(113645), C_Spell.GetSpellLink(113645), C_Spell.GetSpellLink(113645)) },
						},
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
						[11] = {
							{ tactic = format(L["GateOfTheSettingSun_Other"], "IAT_56636", "IAT_56897", "IAT_61213", C_Spell.GetSpellLink(118795), C_Spell.GetSpellLink(118795)) },
						},
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
						[11] = {
							{ tactic = format(L["GateOfTheSettingSun_Raigonn"], "IAT_56897", "IAT_56930") },
						},
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
						[11] = {
							{ tactic = format(L["ABrewingStorm_PartyOfSix"], "IAT_59779") },
						},
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
						[11] = {
							{ tactic = L["ABrewingStorm_ThePerfectPour"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["ALittlePatience_Bubbletrapped"], "IAT_67569") },
						},
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
						[11] = {
							{ tactic = format(L["ALittlePatience_Cannonballer"], "IAT_68057") },
						},
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
						[11] = {
							{ tactic = format(L["ALittlePatience_IUsedToLoveThem"], "IAT_68599") },
						},
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
						[11] = {
							{ tactic = format(L["ALittlePatience_WeveBeenDancin"], "IAT_68376") },
						},
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
						[11] = {
							{ tactic = format(L["ALittlePatience_WhichCameFirst"], "IAT_67883") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ArenaOfAnnihilation_InTheEyeOfTheTiger"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["BattleOnTheHighSeas_KeepThoseBombsAway"] },
						},
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
						[11] = {
							{ tactic = format(L["BloodInTheSnow_HeedTheWeed"], "IAT_71440", "IAT_70468") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["BrewmoonFestival_BinanVillageAllStar"] },
						},
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
						[11] = {
							{ tactic = format(L["BrewmoonFestival_YaungolianBarbecue"], "IAT_64017", C_Spell.GetSpellLink(124792)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["CryptOfForgottenKings_FightAngerWithAnger"], "IAT_61709", "IAT_61709", C_Spell.GetSpellLink(129025)) },
						},
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
						[11] = {
							{ tactic = L["CryptOfForgottenKings_ItsATrap"] },
						},
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
						[11] = {
							{ tactic = format(L["DaggerInTheDark_WateryGrave"], "IAT_67263", C_Spell.GetSpellLink(133121)) },
						},
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
						[11] = {
							{ tactic = format(L["DaggerInTheDark_NoEggLeftBehind"], "IAT_67779") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["DarkHeartOfPandaria_AcceleratedArchaeology"] },
						},
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
						[11] = {
							{ tactic = L["LionsLanding_NumberFiveIsAlive"] },
						},
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
						[11] = {
							{ tactic = L["LionsLanding_WasteNotWantNot"] },
						},
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
						[11] = {
							{ tactic = L["LionsLanding_NumberFiveIsAlive"] },
						},
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
						[11] = {
							{ tactic = L["DominationPoint_WasteNotWantNot"] },
						},
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
						[11] = {
							{ tactic = L["GreenstoneVillage_PerfectDelivery"] },
						},
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
						[11] = {
							{ tactic = format(L["GreenstoneVillage_SaveItForLater"], C_Spell.GetSpellLink(119090)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["SecretsOfRagefire_TheFewTheProudTheGobSquad"] },
						},
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
						[11] = {
							{ tactic = L["UngaIngoo_SpillNoEvil"] },
						},
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
						[11] = {
							{ tactic = L["UngaIngoo_TheKegRunner"] },
						},
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
						[11] = {
							{ tactic = format(L["UngaIngoo_MonkeyInTheMiddle"], "IAT_64556") },
						},
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
						[11] = {
							{ tactic = L["UngaIngoo_MonkeySeeMonkeyKill"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["DragonSoul_WarlordZonozz"], "IAT_55308", "IAT_55334", "IAT_55334") },
						},
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
						[11] = {
							{ tactic = format(L["DragonSoul_YorsahjTheUnsleeping"], "IAT_55312") },
						},
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
						[11] = {
							{ tactic = format(L["DragonSoul_HagaraTheStormbinder"], C_Spell.GetSpellLink(302734), "IAT_137158", "IAT_56165", "IAT_137158", "IAT_56165", "IAT_56165", "IAT_56165") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["DragonSoul_WarmasterBlackhorn"] },
						},
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
						[11] = {
							{ tactic = L["DragonSoul_SpineOfDeathwing"] },
						},
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
						[11] = {
							{ tactic = L["DragonSoul_MadnessOfDeathwing"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["BlackwingDescent_Maloriak"], "IAT_43404", "IAT_49485", "IAT_49485") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["BlackwingDescent_Nefarian"] },
						},
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
						[11] = {
							{ tactic = format(L["BastionOfTwilight_HalfusWyrmbreaker"], C_Spell.GetSpellLink(86003)) },
						},
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
						[11] = {
							{ tactic = format(L["BastionOfTwilight_ValionaAndTheralion"], "IAT_45992", "IAT_45993", C_Spell.GetSpellLink(86408), C_Spell.GetSpellLink(86408), "IAT_49864", "IAT_49864") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ThroneOfTheFourWinds_ConclaveOfWind"] },
						},
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
						[11] = {
							{ tactic = format(L["ThroneOfTheFourWinds_AlAkir"], "IAT_46753", "IAT_155919", C_Spell.GetSpellLink(87904), "IAT_46753", C_Spell.GetSpellLink(87904)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Firelands_LordRhyolith"], "IAT_53258") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Firelands_Shannox"], "IAT_54105", "IAT_54105", "IAT_54105", "IAT_53695", "IAT_53694", "IAT_52675", "IAT_53494") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Firelands_MajordomoStaghelm"], "IAT_52571", "IAT_52936", C_Spell.GetSpellLink(99705), "IAT_53696", C_Spell.GetSpellLink(99705), C_Spell.GetSpellLink(99705)) },
						},
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
						[11] = {
							{ tactic = format(L["Firelands_Ragnaros"], "IAT_88938", "IAT_53501", "IAT_53501", C_Spell.GetSpellLink(98710), "IAT_53501", C_Spell.GetSpellLink(101088), "IAT_53501", C_Spell.GetSpellLink(101088)) },
						},
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
						[11] = {
							{ tactic = format(L["BlackrockCaverns_RomoggBonecrusher"], "IAT_39665", C_Spell.GetSpellLink(55101), "IAT_51405", "IAT_51405", C_Spell.GetSpellLink(153470), "IAT_51405", "IAT_51405", C_Spell.GetSpellLink(153470), "IAT_51405", C_Spell.GetSpellLink(153470), "IAT_51405", C_Spell.GetSpellLink(55101), "IAT_51405", C_Spell.GetSpellLink(153470)) },
						},
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
						[11] = {
							{ tactic = format(L["BlackrockCaverns_Corla"], "IAT_50284", "IAT_50284", C_Spell.GetSpellLink(75697), "IAT_50284", "IAT_39987") },
						},
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
						[11] = {
							{ tactic = format(L["BlackrockCaverns_KarshSteelbender"], C_Spell.GetSpellLink(75846), C_Spell.GetSpellLink(75846)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
					},
					enabled = true,
					track = function() core._645:AscendantLordObsidius() end,
					partial = false,
					encounterID = 1036,
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
						[11] = {
							{ tactic = format(L["TheStonecore_HighPriestessAzil"], "IAT_149995", "IAT_42428", "IAT_149995", "IAT_42428", "IAT_149995") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["TheVortexPinnacle_Other"] },
						},
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
						[11] = {
							{ tactic = format(L["GrimBatol_GeneralUmbriss"], "IAT_39984", "IAT_39984", C_Spell.GetSpellLink(90170), "IAT_39984") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["HallsOfOrigination_EarthragerPtah"], "IAT_45906", "IAT_45906") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["LostCityOfTheTolVir_Lockmaw"], "IAT_43658", "IAT_43658") },
						},
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
						[11] = {
							{ tactic = L["LostCityOfTheTolVir_HighProphetBarim"] },
						},
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
						[11] = {
							{ tactic = format(L["LostCityOfTheTolVir_Siamat"], "IAT_45268", "IAT_45268", C_Spell.GetSpellLink(91872), C_Spell.GetSpellLink(91872)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Deadmines_HelixGearbreaker"], "IAT_47297", "IAT_130437", "IAT_130437", "IAT_47297", "IAT_130437") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Deadmines_AdmiralRipsnarl"], "IAT_42778", "IAT_49392", C_Spell.GetSpellLink(92042)) },
						},
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
						[11] = {
							{ tactic = format(L["Deadmines_CaptainCookie"], "IAT_47739") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["ShadowfangKeep_LordGodfrey"], "IAT_36330", "IAT_50561", "IAT_50561", C_Spell.GetSpellLink(93564), "IAT_50561") },
						},
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
						[11] = {
							{ tactic = format(L["ZulGurub_Other"], "IAT_52442", "IAT_52418", "IAT_52442", "IAT_52440", "IAT_52414", "IAT_52422", "IAT_52405", "IAT_52438", "IAT_52392") },
						},
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
						[11] = {
							{ tactic = format(L["ZulGurub_HighPriestVenoxis"], "IAT_14507") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ZulGurub_HighPriestessKilnara"] },
						},
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
						[11] = {
							{ tactic = format(L["ZulGurub_Jindo"], "IAT_52148", "IAT_69212", "IAT_69212") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["ZulAman_Other1"] },
						},
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
						[11] = {
							{ tactic = format(L["ZulAman_Other2"], "IAT_23574", "IAT_28514", "IAT_29023", "IAT_28517") },
						},
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
						[11] = {
							{ tactic = L["ZulAman_Daakara"] },
						},
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
						[11] = {
							{ tactic = L["EndTime_EchoOfTyrande"] },
						},
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
						[11] = {
							{ tactic = format(L["EndTime_EchoOfSylvanas"], "IAT_54191", "IAT_54191") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["WellOfEternity_Mannoroth"], "IAT_54969", "IAT_54969", "IAT_55419", "IAT_54969") },
						},
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
						[11] = {
							{ tactic = format(L["HourOfTwilight_ArchbishopBenedictus"], "IAT_55466", "IAT_55466") },
						},
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
				name = 755,
				boss1 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 624,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["ObsidianSanctum_SartharionTheOnyxGuardian"], "IAT_28860") },
						},
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
						[11] = {
							{ tactic = format(L["ObsidianSanctum_SartharionTheOnyxGuardian"], "IAT_28860") },
						},
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
						[11] = {
							{ tactic = format(L["ObsidianSanctum_SartharionTheOnyxGuardian"], "IAT_28860") },
						},
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
				boss1 = {
					name = 1616, --Sartharion the Onyx Guardian
					bossIDs = {},
					achievement = 1877,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["ObsidianSanctum_SartharionTheOnyxGuardian"], "IAT_28860") },
						},
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
						[11] = {
							{ tactic = format(L["ObsidianSanctum_SartharionTheOnyxGuardian"], "IAT_28860") },
						},
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
						[11] = {
							{ tactic = format(L["ObsidianSanctum_SartharionTheOnyxGuardian"], "IAT_28860") },
						},
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
				boss1 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 1874,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["EyeOfEternity_Malygos"] },
						},
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
				boss1 = {
					name = 1617, --Malygos
					bossIDs = {28859},
					achievement = 1875,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["EyeOfEternity_Malygos"] },
						},
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
				boss1 = {
					name = 1651, --Onyxia
					bossIDs = {10184},
					achievement = 4402,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["OnyxiasLair_Onyxia"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
				boss1 = {
					name = 1651, --Onyxia
					bossIDs = {10184},
					achievement = 4405,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["OnyxiasLair_Onyxia"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
				boss1 = {
					name = 1618, --Icehowl
					bossIDs = {34796},
					achievement = 3797,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["TrialOfTheCrusader_LordJaraxxus"], "IAT_34826") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["TrialOfTheCrusader_Anubarak"], "IAT_34605", "IAT_34564") },
						},
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
				boss1 = {
					name = 1618, --Icehowl
					bossIDs = {34796},
					achievement = 3813,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["TrialOfTheCrusader_LordJaraxxus"], "IAT_34826") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["TrialOfTheCrusader_Anubarak"], "IAT_34605", "IAT_34564") },
						},
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
				boss1 = {
					name = 1597, --Archavon & Emalon & Koralon
					bossIDs = {},
					achievement = 4016,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["VaultOfArchavon_ArchavonEmalonKoralon"], "IAT_31125", "IAT_33993", "IAT_35013") },
						},
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
				boss1 = {
					name = 1597, --Archavon & Emalon & Koralon
					bossIDs = {},
					achievement = 4017,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["VaultOfArchavon_ArchavonEmalonKoralon"], "IAT_31125", "IAT_33993", "IAT_35013") },
						},
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
				boss1 = {
					name = L["Instances_Other"], --Dwarfageddon
					bossIDs = {33572},
					achievement = 12312,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["Ulduar_Other1"], "IAT_33572", "IAT_33572") },
						},
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
						[11] = {
							{ tactic = L["Ulduar_Other2"] },
						},
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
						[11] = {
							{ tactic = L["Ulduar_FlameLeviathan1"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_FlameLeviathan2"], C_Spell.GetSpellLink(64414), "IAT_33113", C_Spell.GetSpellLink(62324), "IAT_33113") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_FlameLeviathan3"], "IAT_33113", "IAT_33686") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_FlameLeviathan3"], "IAT_33113", "IAT_33686") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_FlameLeviathan3"], "IAT_33113", "IAT_33686") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_FlameLeviathan3"], "IAT_33113", "IAT_33686") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Razorscale"], "IAT_33186", "IAT_109674", "IAT_33186", "IAT_33186", "IAT_109674", C_Spell.GetSpellLink(64021), "IAT_109674") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_IgnisTheFurnaceMaster1"], "IAT_33118", "IAT_33121", "IAT_33121", "IAT_33118", C_Spell.GetSpellLink(65667), C_Spell.GetSpellLink(62373), C_Spell.GetSpellLink(62382), "IAT_33121") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_IgnisTheFurnaceMaster2"], C_Spell.GetSpellLink(62717), C_Spell.GetSpellLink(62717), C_Spell.GetSpellLink(62717)) },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Ulduar_XTDeconstructor1"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_XTDeconstructor2"], C_Spell.GetSpellLink(63849)) },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_AssemblyOfIron1"], "IAT_32927") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_AssemblyOfIron1"], "IAT_32857") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_AssemblyOfIron1"], "IAT_32867") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_AssemblyOfIron4"], "IAT_43499", "IAT_30472", "IAT_42780") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_AssemblyOfIron5"], C_Spell.GetSpellLink(63479), "IAT_32857", C_Spell.GetSpellLink(63479), "IAT_32857", "IAT_32867", "IAT_32927") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Kologarn1"], "IAT_32930") },
						},
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
						[11] = {
							{ tactic = L["Ulduar_Kologarn2"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Kologarn3"], "IAT_32930", "IAT_33768", "IAT_33768", "IAT_32930", "IAT_33768") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Auriaya2"], "IAT_34035", "IAT_34035", "IAT_34035") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Hodir1"], "IAT_111941", "IAT_111941") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Ulduar_Hodir2"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Ulduar_Thorim1"] },
						},
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
						[11] = {
							{ tactic = L["Ulduar_Thorim2"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_FreyaMiniBosses"], "IAT_32915", "IAT_32913", "IAT_32914", "IAT_33241", "IAT_33241") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Freya1"], "IAT_33202", "IAT_32919", "IAT_115143") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Freya2"], "IAT_33241", "IAT_32915", "IAT_32913", "IAT_32914") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Freya2"], "IAT_33241", "IAT_32915", "IAT_32913", "IAT_32914") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Freya2"], "IAT_33241", "IAT_32915", "IAT_32913", "IAT_32914") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Mimiron1"], "IAT_33244", "IAT_34057", "IAT_34057", "IAT_33244", "IAT_34057", C_Spell.GetSpellLink(63041), "IAT_34057") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_Mimiron2"], "IAT_150995") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_GeneralVezax"], "IAT_33524", "IAT_109450", "IAT_33524", "IAT_33524", "IAT_33524") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_YoggSaron1"], "IAT_33134", "IAT_33136", "IAT_33134") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_YoggSaron2"], "IAT_33136", "IAT_33136", "IAT_33552") },
						},
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
						[11] = {
							{ tactic = format(L["Ulduar_YoggSaron3"], "IAT_33552", "IAT_33134", "IAT_33552") },
						},
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
						[11] = {
							{ tactic = L["Ulduar_AlgalonTheObserver"] },
						},
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
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME70
					bossIDs = {},
					achievement = 578,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Naxxramas_TheDedicatedFew"] },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Naxxramas_KelThuzad"] },
						},
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
				boss1 = {
					name = L["Instances_Other"], --MISSINGNAME71
					bossIDs = {},
					achievement = 579,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["Naxxramas_TheDedicatedFew"] },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Naxxramas_KelThuzad"] },
						},
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
				boss1 = {
					name = 1624, --Lord Marrowgar
					bossIDs = {36612},
					achievement = 4534,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["IcecrownCitadel_LadyDeathwhisper"], "IAT_36855", "IAT_38135", "IAT_38009", "IAT_38010", "IAT_37890", "IAT_37949", "IAT_36855") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["IcecrownCitadel_ValithriaDreamwalker"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["IcecrownCitadel_BloodQueenLanathel"] },
						},
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
						[11] = {
							{ tactic = L["IcecrownCitadel_TheLichKing"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
				boss1 = {
					name = 1624, --Lord Marrowgar
					bossIDs = {36612},
					achievement = 4610,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["IcecrownCitadel_LadyDeathwhisper"], "IAT_36855", "IAT_38135", "IAT_38009", "IAT_38010", "IAT_37890", "IAT_37949", "IAT_36855") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["IcecrownCitadel_ValithriaDreamwalker"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = L["IcecrownCitadel_BloodQueenLanathel"] },
						},
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
						[11] = {
							{ tactic = L["IcecrownCitadel_TheLichKing"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
					name = 638, --Prince Keleseth
					bossIDs = {23953},
					achievement = 1919,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardeKeep_Classic_PrinceKeleseth"], "IAT_23953", C_Spell.GetSpellLink(42672), C_Spell.GetSpellLink(42672)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
					name = 618, --Grand Magus Telestra
					bossIDs = {26731},
					achievement = 2150,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheNexus_Classic_GrandMagusTelestra"], "IAT_26731", C_Spell.GetSpellLink(70421)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["TheNexus_Classic_Anomalus"], "IAT_26918", "IAT_26763", "IAT_26746", "IAT_26918", "IAT_26918") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["TheNexus_Classic_Keristasza"], C_Spell.GetSpellLink(48095), "IAT_26206", C_Spell.GetSpellLink(48179), C_Spell.GetSpellLink(32592)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = L["TheCullingOfStratholme_Other1"] },
						},
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
						[11] = {
							{ tactic = format(L["TheCullingOfStratholme_Other2"], "IAT_94471", "IAT_32273", "IAT_94471") },
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
					name = 585, --Krik'thir the Gatewatcher
					bossIDs = {},
					achievement = 1296,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["AzjolNerub_Classic_KrikthirTheGatewatcher"], "IAT_28730", "IAT_28729", "IAT_28731") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBossSingleTarget"] },
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
						[11] = {
							{ tactic = L["AzjolNerub_Hadronox"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
					name = 580, --Elder Nadox
					bossIDs = {29309},
					achievement = 2038,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["AhnkahetTheOldKingdom_Classic_ElderNadox"], "IAT_30176", C_Spell.GetSpellLink(56153), C_Spell.GetSpellLink(9484)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["AhnkahetTheOldKingdom_Classic_JedogaShadowseeker"], "IAT_29310", "IAT_30385", C_Spell.GetSpellLink(56219)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["AhnkahetTheOldKingdom_Classic_HeraldVolazj"], "IAT_30623") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
					name = 588, --Trollgore
					bossIDs = {26630},
					achievement = 2151,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["DrakTharonKeep_Classic_Trollgore"], "IAT_26630", C_Spell.GetSpellLink(49381), C_Spell.GetSpellLink(49381)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = format(L["DarkTharonKeep_NovosTheSummoner"], "IAT_26627", "IAT_26627", "IAT_26627") },
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
						[11] = {
							{ tactic = format(L["DarkTharonKeep_KingDred"], "IAT_26641", "IAT_26628", "IAT_27483") },
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
					name = 632, --Cyanigosa
					bossIDs = {},
					achievement = 1816,
					players = {},
					tactics = {
						[3] = {
							{ tactic = L["VioletHold_Cyanigosa"] },
						},
						[11] = {
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
						[11] = {
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
							{ tactic = format(L["TheVioletHold_Classic_Ichoron"], C_Spell.GetSpellLink(57804), "IAT_29313", "IAT_29313") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["TheVioletHold_Classic_ZuramatTheObliterator"], "IAT_29364") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
					name = 592, --Slad'ran
					bossIDs = {29304},
					achievement = 2058,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["Gundrak_Classic_Sladran"], "IAT_29304", "IAT_29713", C_Spell.GetSpellLink(55093), "IAT_29713", C_Spell.GetSpellLink(55093)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["Gundrak_Classic_Moorabi"], "IAT_29305", C_Spell.GetSpellLink(55098), "IAT_29305", C_Spell.GetSpellLink(55163), C_Spell.GetSpellLink(55098)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = format(L["Gundrak_Galdarah1"], C_Spell.GetSpellLink(55817), "IAT_29932", "IAT_29932", "IAT_29932", C_Spell.GetSpellLink(55814), "IAT_29932", "IAT_29932", "IAT_29932") },
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
						[11] = {
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
					name = 605, --Maiden of Grief
					bossIDs = {27975},
					achievement = 1866,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfStone_Classic_MaidenOfGrief"], "IAT_27975", C_Spell.GetSpellLink(59726)) },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["HallsOfStone_Classic_TribunalOfAges"], "IAT_29579") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = format(L["HallsOfStone_SjonnirTheIronshaper"], "IAT_27981", "IAT_27981", "IAT_28165", "IAT_28165") },
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
					name = 597, --General Bjarngrim
					bossIDs = {28586},
					achievement = 1834,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["HallsOfLightning_Classic_GeneralBjarngrim"], "IAT_28586", C_Spell.GetSpellLink(52092), "IAT_29240", "IAT_28586", C_Spell.GetSpellLink(52092)) },
						},
						[11] = {
							{ tactic = L["HallsOfLightning_GeneralBjarngrim"] },
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
							{ tactic = format(L["HallsOfLightning_Classic_Volkhan"], "IAT_28681", "IAT_28681") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
					name = 625, --Ley-Guardian Eregos
					bossIDs = {},
					achievement = 1871,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["TheOculus_LeyGuardianEregos1"], "IAT_27654", "IAT_27654", "IAT_27654", "IAT_27658", "IAT_27658", "IAT_27658", "IAT_27756", "IAT_27756") },
						},
						[11] = {
							{ tactic = format(L["TheOculus_LeyGuardianEregos1"], "IAT_27654", "IAT_27658", "IAT_27756", "IAT_27659", "IAT_108682", "IAT_27657", "IAT_107194", "IAT_27656") },
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
						[11] = {
							{ tactic = format(L["TheOculus_LeyGuardianEregos2"], "IAT_27656") },
						},
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
						[11] = {
							{ tactic = L["TheOculus_LeyGuardianEregos3"] },
						},
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
						[11] = {
							{ tactic = L["TheOculus_LeyGuardianEregos4"] },
						},
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
						[11] = {
							{ tactic = L["TheOculus_LeyGuardianEregos5"] },
						},
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
					name = 641, --Svala Sorrowgrave
					bossIDs = {},
					achievement = 2043,
					players = {},
					tactics = {
						[3] = {
							{ tactic = format(L["UtgardePinnacle_Classic_SvalaSorrowgrave"], "IAT_26555", "IAT_26555", C_Spell.GetSpellLink(48276), "IAT_26555", "IAT_26555", "IAT_26668", C_Spell.GetSpellLink(48277)) },
						},
						[11] = {
							{ tactic = L["UtgardePinnacle_SvalaSorrowgrave"] },
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
							{ tactic = format(L["UtgardePinnacle_Classic_SkadiTheRuthless"], "IAT_26693") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
							{ tactic = format(L["UtgardePinnacle_Classic_SkadiTheRuthless2"], "IAT_26893", "IAT_26693") },
						},
						[11] = {
							{ tactic = L["UtgardePinnacle_SkadiTheRuthless"] },
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
							{ tactic = format(L["UtgardePinnacle_Classic_KingYmiron"], "IAT_26861", C_Spell.GetSpellLink(48294), "IAT_26861") },
						},
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
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
					name = 636, --Argent Confessor Paletress
					bossIDs = {},
					achievement = 3802,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["TrialOfTheChampion_ArgentConfessorPaletress"] },
						},
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
						[11] = {
							{ tactic = L["TrialOfTheChampion_EadricThePure"] },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
					name = 615, --Bronjahm
					bossIDs = {36497},
					achievement = 4522,
					players = {},
					tactics = {
						[11] = {
							{ tactic = format(L["TheForgeOfSouls_Bronjahm"], "IAT_36535", "IAT_36535", "IAT_36535", "IAT_36535") },
						},
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
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
					name = 608, --Forgemaster Garfrost
					bossIDs = {36494},
					achievement = 4524,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
						[11] = {
							{ tactic = format(L["PitOfSaron_Other"], "IAT_154735") },
						},
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
					name = 603, --MISSINGNAME76
					bossIDs = {},
					achievement = 4526,
					players = {},
					tactics = {
						[11] = {
							{ tactic = L["Shared_JustKillBoss"] },
						},
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
