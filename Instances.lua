-- local i = 1
-- while EJ_GetInstanceByIndex(i, true) do --True for raid, false for dungeons. i = 1 for raids i = 2 for dungeons
--     local instanceId, name = EJ_GetInstanceByIndex(i, true)
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
                    tactics = L["Uldir_Taloc_Tactics"],
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
                    tactics = L["Uldir_MOTHER_Tactics"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2141,
                },
                boss3 = {
                    name = 2146, --Fetid Devourer
                    bossIDs = {133298},
                    achievement = 12823,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["Uldir_Fetid_Devourer_Tactics"], GetSpellLink(262277), GetSpellLink(262378)),
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
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["Uldir_ZekVoz_Tactics"], GetSpellLink(278068)),
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
                    tactics = L["Uldir_Vectis_Tactics"],
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
                    tactics = format(L["Uldir_ZulReborn_Tactics"], GetSpellLink(276093)),
                    enabled = true,
                    track = function() core._1861:ZulReborn() end,
                    partial = false,
                    encounterID = 2145,
                },
                boss7 = {
                    name = 2194, --Mythrax the Unraveler
                    bossIDs = {},
                    achievement = 12836,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Uldir_Mythrax_Tactics"],
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
                    tactics = L["Uldir_GHuun_Tactics"],
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
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_ChampionOfTheLight"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2265,
                },
                boss2 = {
                    name = {2323, 2341}, --Jadefire Masters
                    bossIDs = {},
                    achievement = 13431,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_JadefireMasters"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = {2266, 2285},
                },
                boss3 = {
                    name = {2340, 2325}, --Grong
                    bossIDs = {},
                    achievement = 13383,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_Grong"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = {2263, 2284},
                },
                boss4 = {
                    name = 2342, --Opulence
                    bossIDs = {},
                    achievement = 13345,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_Opulence"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2271,
                },
                boss5 = {
                    name = 2330, --Conclave of the Chosen
                    bossIDs = {},
                    achievement = 13325,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_ConclaveOfTheChosen"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2268,
                },
                boss6 = {
                    name = 2335, --King Rastakhan
                    bossIDs = {},
                    achievement = 13425,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_KingRastakhan"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2272,
                },
                boss7 = {
                    name = 2334, --High Tinker Mekkatorque
                    bossIDs = {},
                    achievement = 13401,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_HighTinkerMekkatorque"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2276,
                },
                boss8 = {
                    name = 2337, --Stormwall Blockade
                    bossIDs = {},
                    achievement = 13430,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_StormwallBlockade"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2280,
                },
                boss9 = {
                    name = 2343, --Jaina Proudmoore
                    bossIDs = {},
                    achievement = 13410,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BattleOfDazaralor_JainaProudmoore"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 2281,
                },
            },
        },

        Dungeons = {
            [1763] = { --Atal Dazar
                name = 968,
                boss1 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 12270,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["AtalDazar_Other"], GetSpellLink(279118), GetSpellLink(115078), GetSpellLink(187650), GetSpellLink(118), GetSpellLink(279118)),
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
                    tactics = format(L["AtalDazar_Priestess_AlunZa"], GetSpellLink(259205), GetSpellLink(255558), GetSpellLink(255558), GetSpellLink(255558)),
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
                    tactics = format(L["Atal_Dazar_Yazma"], GetSpellLink(259190)),
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
                    tactics = format(L["Freehold_SkycapNKragg"], "IAT_119210"),
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
                    tactics = L["Freehold_RingOfBooty"],
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
                    tactics = format(L["Freehold_HarlanSweete"], GetSpellLink(257305)),
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
                    tactics = L["KingsRest_Other"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 2171, --Mchimba the Embalmer
                    bossIDs = {},
                    achievement = 12721,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["KingsRest_MchimbaTheEmbalmer"], GetSpellLink(267702), GetSpellLink(267764), GetSpellLink(271290)),
                    enabled = true,
                    track = function() core._1762:MchimbaTheEmbalmer() end,
                    partial = false,
                    encounterID = 2142,
                },
                boss3 = {
                    name = 2172, --Dazar, The First King
                    bossIDs = {},
                    achievement = 12723,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["KingsRest_DazarTheFirstKing"],
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
                    tactics = format(L["ShrineOfTheStorm_Other"], GetSpellLink(275633)),
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 2155, --Lord Stormsong
                    bossIDs = {},
                    achievement = 12601,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["ShrineOfTheStorm_LordStormsong"], GetSpellLink(269097)),
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
                    tactics = format(L["ShrineOfTheStorm_VolZith"], GetSpellLink(275690), GetSpellLink(267360), GetSpellLink(267299)),
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
                    tactics = format(L["SiegeOfBoralus_DreadCaptainLockwood"], GetSpellLink(272471), GetSpellLink(272471), GetSpellLink(339), GetSpellLink(1715), GetSpellLink(116), GetSpellLink(31589), GetSpellLink(268995)),
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
                    tactics = format(L["SiegeOfBoralus_ViqGoth"], GetSpellLink(274991)),
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
                    tactics = L["SiegeOfBoralus_Other"],
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
                    tactics = format(L["TempleOfSethraliss_Merektha"], GetSpellLink(1543), GetSpellLink(43265), GetSpellLink(5740), GetSpellLink(263914), GetSpellLink(270324), GetSpellLink(49576)),
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
                    tactics = L["TempleOfSethraliss_AvatarOfSethraliss"],
                    enabled = true,
                    track = function() core._1877:AvatarOfSethraliss() end,
                    partial = false,
                    encounterID = 2127,
                },
                boss3 = {
                    name = L["Instances_TrashAfterThirdBoss"],
                    bossIDs = {},
                    achievement = 12503,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["TempleOfSethraliss_Trash"], GetSpellLink(115078), GetSpellLink(187650), GetSpellLink(118)),
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
                    tactics = format(L["The_Motherlode_CoinOperatedCrowdPummeler"], GetSpellLink(278524), GetSpellLink(278673)),
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
                    tactics = L["The_Motherlode_MogulRazdunk"],
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
                    tactics = format(L["TheUnderrot_ElderLeaxa"], GetSpellLink(260685)),
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
                    tactics = format(L["TheUnderrot_SporecallerZancha"], GetSpellLink(272457)),
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
                    tactics = format(L["TheUnderrot_UnboundAbomination"], GetSpellLink(269843), GetSpellLink(270108), GetSpellLink(270108)),
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
                    tactics = format(L["TolDagor_KnightCaptainValyri"], GetSpellLink(256976), GetSpellLink(256955), GetSpellLink(257033)),
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
                    tactics = format(L["TolDagor_OverseerKorgus"], GetSpellLink(256200), GetSpellLink(256200)),
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
                    tactics = format(L["WaycrestManor_SoulboundGoliath"], GetSpellLink(260512), GetSpellLink(260570), GetSpellLink(260512)),
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
                    tactics = format(L["WaycrestManor_GorakTul"], GetSpellLink(266198), GetSpellLink(266266), GetSpellLink(266198)),
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
                    tactics = L["WaycrestManor_Other"],
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
                    tactics = L["TheEmeraldNightmare_Nythendra"],
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
                    tactics = L["TheEmeraldNightmare_Ursoc"],
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
                    tactics = format(L["TheEmeraldNightmare_DragonsOfNightmare"], GetSpellLink(214588), GetSpellLink(214601), GetSpellLink(214604), GetSpellLink(214610)),
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1854,
                },
                boss4 = {
                    name = 1744, --Elerethe Renferal
                    bossIDs = {}, --106087
                    achievement = 10771,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = format(L["TheEmeraldNightmare_EleretheRenferal"], GetSpellLink(212993), GetSpellLink(131347), GetSpellLink(164862), GetSpellLink(130)),
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
                    tactics = L["TheEmeraldNightmare_IllgynothHeartOfCorruption"],
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
                    tactics = L["TheEmeraldNightmare_Cenarius"],
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
                    tactics = format(L["TheEmeraldNightmare_Xavius"], GetSpellLink(188501), GetSpellLink(188501)),
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
                    tactics = format(L["TrialOfValor_Odyn"], GetSpellLink(229684)),
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
                    tactics = format(L["TrialOfValor_Guarm"], GetSpellLink(231846), GetSpellLink(227539), GetSpellLink(227566), GetSpellLink(227566)),
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
                    tactics = format(L["TrialOfValor_Helya"], GetSpellLink(193367)),
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
                    tactics = format(L["TheNighthold_Skorpyron"], GetSpellLink(204316)),
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
                    tactics = format(L["TheNighthold_ChronomaticAnomaly"], GetSpellLink(206617), GetSpellLink(206617)),
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TheNighthold_SpellbladeAluriel"],
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
                    tactics = L["TheNighthold_StarAugurEtraeus"],
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
                    tactics = format(L["TheNighthold_HighBotanistTelarn"], GetSpellLink(220114)),
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
                    tactics = format(L["TheNighthold_Krosus"], GetSpellLink(205420)),
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
                    tactics = format(L["TheNighthold_Tichondrius"], GetSpellLink(213531)),
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
                    tactics = L["TheNighthold_Elisande"],
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
                    tactics = format(L["TheNighthold_Guldan"], GetSpellLink(209270), GetSpellLink(209291), GetSpellLink(209270)),
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
                    tactics = format(L["TombOfSargeras_Goroth"], GetSpellLink(233021), GetSpellLink(233279), GetSpellLink(233021)),
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
                    tactics = format(L["TombOfSargeras_DemonicInquisition"], GetSpellLink(235230)),
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
                    tactics = L["TombOfSargeras_Harjatan"],
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
                    tactics = format(L["TombOfSargeras_MistressSasszine"], GetSpellLink(230139), GetSpellLink(234621), GetSpellLink(232913), GetSpellLink(234621), GetSpellLink(234621), GetSpellLink(234621), GetSpellLink(234621), GetSpellLink(230358), GetSpellLink(232913), GetSpellLink(234621)),
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
                    tactics = L["TombOfSargeras_SistersOfTheMoon"],
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
                    tactics = format(L["TombOfSargeras_TheDesolateHost"], GetSpellLink(235956), GetSpellLink(235989)),
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
                    tactics = format(L["TombOfSargeras_MaidenOfVigilance"], GetSpellLink(243276), GetSpellLink(236420)),
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
                    tactics = format(L["TombOfSargeras_FallenAvatar"], GetSpellLink(235572)),
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
                    tactics = format(L["TombOfSargeras_Kiljaeden"], GetSpellLink(49576), GetSpellLink(108199), GetSpellLink(119381), GetSpellLink(46968), GetSpellLink(49576), GetSpellLink(108199), GetSpellLink(236555)),
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
                    tactics = format(L["AntorusTheBurningThrone_GarothiWorldbreaker"], GetSpellLink(244410)),
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
                    tactics = format(L["AntorusTheBurningThrone_FelhoundsOfSargeras"], GetSpellLink(253602), GetSpellLink(253602)),
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
                    tactics = format(L["AntorusTheBurningThrone_AntoranHighCommand"], GetSpellLink(244902)),
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
                    tactics = format(L["AntorusTheBurningThrone_PortalKeeperHasabel"], GetSpellLink(244613), GetSpellLink(245118), GetSpellLink(244613), GetSpellLink(82935)),
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
                    tactics = L["AntorusTheBurningThrone_Eonar"],
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
                    tactics = L["AntorusTheBurningThrone_ImonarTheShoulhunter"],
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
                    tactics = format(L["AntorusTheBurningThrone_Kingaroth"], GetSpellLink(246779), GetSpellLink(246779), GetSpellLink(246779)),
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
                    tactics = format(L["AntorusTheBurningThrone_Varimathras"], GetSpellLink(243963), GetSpellLink(244042)),
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
                    tactics = format(L["AntorusTheBurningThrone_CovenOfShivarra"], GetSpellLink(250095), GetSpellLink(245910), GetSpellLink(710), GetSpellLink(187650), GetSpellLink(339), GetSpellLink(246763), GetSpellLink(245671)),
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
                    tactics = format(L["AntorusTheBurningThrone_Aggramar"], GetSpellLink(256208), GetSpellLink(710), GetSpellLink(187650), GetSpellLink(339), GetSpellLink(256208), GetSpellLink(244291), GetSpellLink(244033), GetSpellLink(244291), GetSpellLink(244033), GetSpellLink(246014)),
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
                    tactics = L["AntorusTheBurningThrone_Argus"],
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
                    tactics = L["SeatOfTheTriumvirate_ZuraalTheAscended"],
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
                    tactics = L["SeatOfTheTriumvirate_Saprish"],
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
                    tactics = L["SeatOfTheTriumvirate_Lura"],
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
                    tactics = L["AssaultOnVioletHold_MillificentManastorm"],
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
                    tactics = L["AssaultOnVioletHold_Festerface"],
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
                    tactics = L["EyeOfAzshara_WarlordParjesh"],
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
                    tactics = L["EyeOfAzshara_LadyHatecoil"],
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
                    tactics = L["EyeOfAzshara_WrathOfAzshara"],
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
                    tactics = L["DarkheartThicket_Dresaron"],
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
                    tactics = format(L["DarkheartThicket_ShadeOfXavius"], GetSpellLink(221315)),
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
                    tactics = L["HallsOfValor_Other1"],
                    enabled = true,
                    track = function() core._1477:StagParty() end,
                    partial = false,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 10542,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["HallsOfValor_Other2"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss3 = {
                    name = 1489, --Odyn
                    bossIDs = {95676},
                    achievement = 10543,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["HallsOfValor_Odyn"],
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
                    tactics = L["NeltharionsLair_Other"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1673, --Naraxas
                    bossIDs = {91005},
                    achievement = 10875,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["NeltharionsLair_Naraxas"],
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
                    tactics = L["BlackRookHold_Other"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1518, --Amalgam of Souls
                    bossIDs = {98542},
                    achievement = 10710,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BlackRookHold_AmalgamOfSouls"],
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
                    tactics = L["BlackRookHold_IlysannaRavencrest"],
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
                    tactics = L["MawOfSouls_Ymiron"],
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
                    tactics = L["MawOfSouls_Helya"],
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
                    tactics = L["MawOfSouls_Other"],
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
                    tactics = L["TheArcway_Ivanyr"],
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
                    tactics = L["TheArcway_Corstilax"],
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
                    tactics = L["TheArcway_AdvisorVandros"],
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
                    tactics = L["CourtOfStars_PatrolCaptainGerdo"],
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
                    tactics = L["CourtOfStars_Other"],
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
                    tactics = L["ReturnToKarazhan_Other1"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1820, --Opera Hall
                    bossIDs = {},
                    achievement = 11335,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["ReturnToKarazhan_OperaHall"],
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
                    tactics = L["ReturnToKarazhan_Moroes"],
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
                    tactics = L["ReturnToKarazhan_ShadeOfMedivh"],
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
                    tactics = L["ReturnToKarazhan_ManaDevourer"],
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
                    tactics = L["ReturnToKarazhan_Other2"],
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
                    tactics = format(L["CathedralOfEternalNight_Agronox"], GetSpellLink(236627)),
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
                    tactics = format(L["CathedralOfEternalNight_ThrashbiteTheScornful"], GetSpellLink(237726), GetSpellLink(243261)),
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
                    tactics = format(L["CathedralOfEternalNight_Mephistroth"], GetSpellLink(232502), GetSpellLink(232502)),
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Highmaul_TheButcher"],
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
                    tactics = L["Highmaul_Tectus"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1722,
                },
                boss4 = {
                    name = 1196, --Brackenspore
                    bossIDs = {78491},
                    achievement = 8975,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Highmaul_Brackenspore"],
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
                    tactics = L["Highmaul_TwinOgron"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Highmaul_ImperatorMargok"],
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
                    tactics = L["BlackrockFoundry_BeastlordDarmac"],
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
                    tactics = L["BlackrockFoundry_OperatorThogar"],
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
                    tactics = L["BlackrockFoundry_IronMaidens"],
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
                    tactics = L["BlackrockFoundry_HansgarFranzok"],
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
                    tactics = L["BlackrockFoundry_FlamebenderKagraz"],
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
                    tactics = L["BlackrockFoundry_Kromog"],
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
                    tactics = L["BlackrockFoundry_Gruul"],
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1691,
                },
                boss8 = {
                    name = 1202, --Oregorger
                    bossIDs = {},
                    achievement = 8979,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BlackrockFoundry_Oregorger"],
                    enabled = true,
                    track = function() core._1205:Oregorger() end,
                    partial = false,
                    encounterID = 1696,
                },
                boss9 = {
                    name = 1154, --Blast Furnace
                    bossIDs = {76806},
                    achievement = 8930,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["BlackrockFoundry_BlastFurnace"],
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
                    tactics = L["BlackrockFoundry_Blackhand"],
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
                    tactics = L["HellfireCitadel_HellfireAssault"],
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
                    tactics = L["HellfireCitadel_IronReaver"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["HellfireCitadel_HellfireHighCouncil"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["HellfireCitadel_Gorefiend"],
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
                    tactics = L["HellfireCitadel_ShadowLordIskar"],
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
                    tactics = L["HellfireCitadel_SocretharTheEternal"],
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
                    tactics = L["HellfireCitadel_TyrantVelhari"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["HellfireCitadel_Mannoroth"],
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
                    tactics = L["HellfireCitadel_Archimonde"],
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
                    tactics = L["BloodmaulSlagMines_SlaveWatcherCrushto"],
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
                    tactics = L["BloodmaulSlagMines_Magmolatus"],
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
                    tactics = L["BloodmaulSlagMines_Gugrokk"],
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
                    tactics = L["IronDocks_FleshrenderNokgar"],
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
                    tactics = L["IronDocks_Other"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 1238, --Skulloc
                    bossIDs = {83612},
                    achievement = 9082,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["IronDocks_Skulloc"],
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
                    tactics = L["Auchindoun_SoulbinderNyami"],
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
                    tactics = L["Auchindoun_Azzakel"],
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
                    tactics = L["Auchindoun_Terongor"],
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
                    tactics = L["Skyreach_Ranjit"],
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
                    tactics = L["Skyreach_Rukhran"],
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
                    tactics = L["Skyreach_HighSageViryx1"],
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
                    tactics = L["Skyreach_HighSageViryx2"],
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
                    tactics = L["GrimrailDepot_RocketsparkAndBorka"],
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
                    tactics = L["GrimrailDepot_NitroggThundertower"],
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
                    tactics = L["TheEverbloom_Witherbark"],
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
                    tactics = L["TheEverbloom_ArchmageSol"],
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
                    tactics = L["TheEverbloom_Yalnu"],
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
                    tactics = L["ShadowmoonBurialGrounds_SadanaBloodfury"],
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
                    tactics = L["ShadowmoonBurialGrounds_Bonemaw"],
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
                    tactics = L["ShadowmoonBurialGrounds_Nerzhul"],
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
                    tactics = L["UpperBlackrockSpire_OrebenderGorashan"],
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
                    tactics = L["UpperBlackrockSpire_Other"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 1229, --Ragewing the Untamed
                    bossIDs = {76585},
                    achievement = 9056,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["UpperBlackrockSpire_RagewingTheUntamed"],
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
                    tactics = L["UpperBlackrockSpire_WarlordZaela"],
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
                    tactics = L["TerraceOfEndlessSpring_ProtectorsOfTheEndless"],
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
                    tactics = L["TerraceOfEndlessSpring_Tsulong"],
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
                    tactics = L["TerraceOfEndlessSpring_LeiShi"],
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
                    tactics = L["TerraceOfEndlessSpring_ShaOfFear"],
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
                    tactics = L["ThroneOfThunder_JinrokhTheBreaker"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ThroneOfThunder_CouncilOfElders"],
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
                    tactics = L["ThroneOfThunder_Tortos"],
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
                    tactics = L["ThroneOfThunder_Megaera"],
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
                    tactics = L["ThroneOfThunder_JiKun"],
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
                    tactics = L["ThroneOfThunder_DurumuTheForgotten"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ThroneOfThunder_DarkAnimus"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ThroneOfThunder_TwinConsorts"],
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
                    tactics = L["ThroneOfThunder_LeiShen"],
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
                    tactics = L["SiegeOfOrgrimmar_Immerseus"],
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
                    tactics = format(L["SiegeOfOrgrimmar_TheFallenProtectors"], GetSpellLink(144365)),
                    enabled = true,
                    track = function() core._1136:TheFallenProtectors() end,
                    partial = false,
                    encounterID = 1598,
                },
                boss3 = {
                    name = 866, --Amalgam of Corruption
                    bossIDs = {72276},
                    achievement = 8532,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = format(L["SiegeOfOrgrimmar_IronJuggernaut"], GetSpellLink(144918)),
                    enabled = true,
                    track = function() end,
                    partial = false,
                    encounterID = 1600,
                },
                boss7 = {
                    name = 856, --Kor'kron Dark Shaman
                    bossIDs = {},
                    achievement = 8453,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["SiegeOfOrgrimmar_KorkronDarkShaman"],
                    enabled = true,
                    track = function() end,
                    encounterID = 1606,
                },
                boss8 = {
                    name = 850, --General Nazgrim
                    bossIDs = {71515},
                    achievement = 8448,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["SiegeOfOrgrimmar_GeneralNazgrim"],
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
                    tactics = L["SiegeOfOrgrimmar_Malkorok"],
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
                    tactics = L["SiegeOfOrgrimmar_SpoilsOfPandaria"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1594,
                },
                boss11 = {
                    name = 851, --Thok the Bloodthirsty
                    bossIDs = {}, --71529
                    achievement = 8527,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["SiegeOfOrgrimmar_ThokTheBloodthirsty"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["SiegeOfOrgrimmar_ParagonsOfTheKlaxxi"],
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
                    tactics = L["SiegeOfOrgrimmar_GarroshHellscream"],
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
                    tactics = format(L["HeartOfFear_ImperialVizierZorlok"],  GetSpellLink(125785)),
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
                    tactics = L["HeartOfFear_BladeLordTayak"],
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
                    tactics = L["HeartOfFear_Garalon"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["HeartOfFear_AmberShaperUnsok"],
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
                    tactics = format(L["HeartOfFear_GrandEmpressShekzeer"], GetSpellLink(123707)),
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
                    tactics = format(L["MogushanVaults_TheStoneGuard"], GetSpellLink(70613), GetSpellLink(69452), GetSpellLink(90637)),
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
                    tactics = format(L["MogushanVaults_FengTheAccursed"], GetSpellLink(116936), GetSpellLink(118307), GetSpellLink(118194), GetSpellLink(115730), GetSpellLink(116938), GetSpellLink(115911)),
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
                    tactics = L["MogushanVaults_GarajalTheSpiritbinder"],
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
                    tactics = L["MogushanVaults_TheSpiritKings"],
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
                    tactics = L["MogushanVaults_Elegon"],
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
                    tactics = L["MogushanVaults_WillOfTheEmperor"],
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
                    tactics = L["StormstoutBrewery_OokOok"],
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
                    tactics = L["StormstoutBrewery_Other1"],
                    enabled = nil,
                    partial = false,
                },                
                boss3 = {
                    name = 669, --Hoptallus
                    bossIDs = {59426, 59460, 56718, 59459, 59461, 59551},
                    achievement = 6420,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["StormstoutBrewery_Hoptallus"],
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
                    tactics = L["StormstoutBrewery_Other2"],
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
                    tactics = L["ScarletHalls_HoundmasterBraun"],
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
                    tactics = L["ScarletHalls_ArmsmasterHarlan"],
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
                    tactics = L["ScarletMonastery_ThalnosTheSoulrender"],
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
                    tactics = L["ScarletMonastery_BrotherKorloff"],
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
                    tactics = L["ScarletMonastery_HighInquisitorWhitemane"],
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
                    tactics = L["Scholomance_JandiceBarov"],
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
                    tactics = L["Scholomance_Rattlegore"],
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
                    tactics = L["Scholomance_Other1"],
                    enabled = true,
                    track = function() core._1007:Sanguinarian() end,
					partial = true,
                },
                boss4 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6821,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Scholomance_Other2"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss5 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 6715,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Scholomance_Other3"],
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
                    tactics = L["TempleOfTheJadeSerpent_WiseMari"],
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
                    tactics = L["TempleOfTheJadeSerpent_ShaOfDoubt1"],
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
                    tactics = L["TempleOfTheJadeSerpent_ShaOfDoubt2"],
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
                    tactics = L["MoguShanPalace_Gekkan"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 698, --Xin the Weaponmaster
                    bossIDs = {61398},
                    achievement = 6736,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["MoguShanPalace_XinTheWeaponmaster"],
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
                    tactics = L["MoguShanPalace_Other"],
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
                    tactics = L["ShadoPanMonastery_MasterSnowdrift"],
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
                    tactics = L["ShadoPanMonastery_ShaOfViolence"],
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
                    tactics = L["ShadoPanMonastery_TaranZhu"],
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
                    tactics = L["SiegeOfNiuazaoTemple_CommanderVojak"],
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
                    tactics = L["SiegeOfNiuazaoTemple_GeneralPavalak"],
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
                    tactics = L["SiegeOfNiuazaoTemple_WingLeaderNeronok"],
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
                    tactics = L["GateOfTheSettingSun_SaboteurKiptilak"],
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
                    tactics = L["GateOfTheSettingSun_Other"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 649, --Raigonn
                    bossIDs = {56877},
                    achievement = 6945,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["GateOfTheSettingSun_Raigonn"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["DragonSoul_WarlordZonozz"],
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
                    tactics = L["DragonSoul_YorsahjTheUnsleeping"],
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
                    tactics = L["DragonSoul_HagaraTheStormbinder"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["DragonSoul_WarmasterBlackhorn"],
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
                    tactics = L["DragonSoul_SpineOfDeathwing"],
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
                    tactics = L["DragonSoul_MadnessOfDeathwing"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["BlackwingDescent_Maloriak"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["BlackwingDescent_Nefarian"],
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
                    tactics = L["BastionOfTwilight_HalfusWyrmbreaker"],
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
                    tactics = L["BastionOfTwilight_ValionaAndTheralion"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ThroneOfTheFourWinds_ConclaveOfWind"],
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
                    tactics = L["ThroneOfTheFourWinds_AlAkir"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Firelands_LordRhyolith"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Firelands_Shannox"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Firelands_MajordomoStaghelm"],
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
                    tactics = L["Firelands_Ragnaros"],
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
                    tactics = L["BlackrockCaverns_RomoggBonecrusher"],
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
                    tactics = L["BlackrockCaverns_Corla"],
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
                    tactics = L["BlackrockCaverns_KarshSteelbender"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ThroneOfTheTides_LadyNazJar"],
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
                    tactics = L["ThroneOfTheTides_Ozumat"],
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
                    tactics = L["TheStonecore_HighPriestessAzil"],
                    enabled = true,
                    track = function() core.__725:HighPriestessAzil() end,
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
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TheVortexPinnacle_Other"],
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
                    tactics = L["GrimBatol_GeneralUmbriss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["HallsOfOrigination_EarthragerPtah"],
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
                    tactics = L["Shared_JustKillBoss"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss4 = {
                    name = 130, --Rajh
                    bossIDs = {39378},
                    achievement = 5295,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["LostCityOfTheTolVir_Lockmaw"],
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
                    tactics = L["LostCityOfTheTolVir_HighProphetBarim"],
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
                    tactics = L["LostCityOfTheTolVir_Siamat"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Deadmines_HelixGearbreaker"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Deadmines_AdmiralRipsnarl"],
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
                    tactics = L["Deadmines_CaptainCookie"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ShadowfangKeep_LordGodfrey"],
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
                    tactics = L["ZulGurub_Other"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 175, --High Priest Venoxis
                    bossIDs = {52155},
                    achievement = 5743,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["ZulGurub_HighPriestVenoxis"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ZulGurub_HighPriestessKilnara"],
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
                    tactics = L["ZulGurub_Jindo"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ZulAman_Other1"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss3 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 5858,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["ZulAman_Other2"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss4 = {
                    name = 191, --Daakara
                    bossIDs = {},
                    achievement = 5760,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["ZulAman_Daakara"],
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
                    tactics = L["EndTime_EchoOfTyrande"],
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
                    tactics = L["EndTime_EchoOfSylvanas"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["WellOfEternity_Mannoroth"],
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
                    tactics = L["HourOfTwilight_ArchbishopBenedictus"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ObsidianSanctum_SartharionTheOnyxGuardian"],
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
                    tactics = L["ObsidianSanctum_SartharionTheOnyxGuardian"],
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
                    tactics = L["ObsidianSanctum_SartharionTheOnyxGuardian"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["ObsidianSanctum_SartharionTheOnyxGuardian"],
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
                    tactics = L["ObsidianSanctum_SartharionTheOnyxGuardian"],
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
                    tactics = L["ObsidianSanctum_SartharionTheOnyxGuardian"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["EyeOfEternity_Malygos"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["EyeOfEternity_Malygos"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["OnyxiasLair_Onyxia"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["OnyxiasLair_Onyxia"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TrialOfTheCrusader_Icehowl"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TrialOfTheCrusader_LordJaraxxus"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TrialOfTheCrusader_Anubarak"],
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
                    tactics = L["TrialOfTheCrusader_Icehowl"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TrialOfTheCrusader_LordJaraxxus"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TrialOfTheCrusader_Anubarak"],
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
                    tactics = L["VaultOfArchavon_ArchavonEmalonKoralon"],
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
                    tactics = L["VaultOfArchavon_ArchavonEmalonKoralon"],
                    enabled = false,
                    track = nil,
                    partial = false,
                    encounterID = 1126,
                },                   
            },

            [603] = { --Ulduar
                name = 759,
                boss1 = {
                    name = "Other",
                    bossIDs = {33572},
                    achievement = 12312,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Ulduar_Other1"],
                    enabled = true,
                    track = function() core._603:Dwarfageddon() end,
                    partial = true,
                },
                boss2 = {
                    name = "Other 24",
                    bossIDs = {},
                    achievement = 12313,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Ulduar_Other2"],
                    enabled = true,
                    track = function() end,
					partial = false,
                }, 
                boss3 = {
                    name = 1637, --Flame Leviathan
                    bossIDs = {},
                    achievement = 12314,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Ulduar_FlameLeviathan1"],
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
                    tactics = L["Ulduar_FlameLeviathan2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_FlameLeviathan3"],
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
                    tactics = L["Ulduar_FlameLeviathan4"],
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
                    tactics = L["Ulduar_FlameLeviathan5"],
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
                    tactics = L["Ulduar_FlameLeviathan6"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Razorscale"],
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
                    tactics = L["Ulduar_IgnisTheFurnaceMaster1"],
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
                    tactics = L["Ulduar_IgnisTheFurnaceMaster2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_XTDeconstructor1"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_XTDeconstructor2"],
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
                    tactics = L["Ulduar_AssemblyOfIron1"],
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
                    tactics = L["Ulduar_AssemblyOfIron2"],
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
                    tactics = L["Ulduar_AssemblyOfIron3"],
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
                    tactics = L["Ulduar_AssemblyOfIron4"],
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
                    tactics = L["Ulduar_AssemblyOfIron5"],
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
                    tactics = L["Ulduar_Kologarn1"],
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
                    tactics = L["Ulduar_Kologarn2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Kologarn3"],
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
                    tactics = L["Ulduar_Auriaya1"],
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
                    tactics = L["Ulduar_Auriaya2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Hodir1"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Hodir2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Thorim1"],
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
                    tactics = L["Ulduar_Thorim2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_FreyaMiniBosses"],
                    enabled = true,
                    track = function() core._603:FreyaLumberjacked() end,
                    partial = false,
                }, 
                boss42 = {
                    name = 1646, --Freya
                    bossIDs = {32906, 33430, 33431, 33528, 33527, 33526, 33525, 32914, 32913, 33354, 33355, 32915},
                    achievement = 12361,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Freya1"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Freya2"],
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
                    tactics = L["Ulduar_Freya3"],
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
                    tactics = L["Ulduar_Freya4"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_Mimiron1"],
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
                    tactics = L["Ulduar_Mimiron2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_GeneralVezax"],
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
                    tactics = L["Ulduar_YoggSaron1"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Ulduar_YoggSaron2"],
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
                    tactics = L["Ulduar_YoggSaron3"],
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
                    tactics = L["Ulduar_AlgalonTheObserver"],
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
                    tactics = L["Shared_JustKillBoss"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 1603, --Maexxna
                    bossIDs = {15956,15952},
                    achievement = 1858,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Naxxramas_GrandWidowFaerlina"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Naxxramas_KelThuzad"],
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
                    tactics = L["Shared_JustKillBoss"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss2 = {
                    name = 1603, --Maexxna
                    bossIDs = {15956,15952},
                    achievement = 1859,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Naxxramas_GrandWidowFaerlina"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Naxxramas_KelThuzad"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["IcecrownCitadel_LadyDeathwhisper"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["IcecrownCitadel_ValithriaDreamwalker"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["IcecrownCitadel_BloodQueenLanathel"],
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
                    tactics = L["IcecrownCitadel_TheLichKing"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["IcecrownCitadel_LadyDeathwhisper"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["IcecrownCitadel_ValithriaDreamwalker"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["IcecrownCitadel_BloodQueenLanathel"],
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
                    tactics = L["IcecrownCitadel_TheLichKing"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
                    enabled = true,
                    track = function() core._576:GrandMagusTelestra() end,
                    partial = false,
                },
                boss2 = {
                    name = 619, --Anomalus
                    bossIDs = {26763},
                    achievement = 2037,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["TheNexus_Anomalus"],
                    enabled = true,
                    track = function() core._576:Anomalus() end,
                    partial = false,
                },
                boss3 = {
                    name = 621, --Keristrasza
                    bossIDs = {26723},
                    achievement = 2036,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TheCullingOfStratholme_Other1"],
                    enabled = true,
                    track = function() core.__595:ZombieFest() end,
					partial = false,
                },
                boss2 = {
                    name = L["Other"],
                    bossIDs = {},
                    achievement = 1817,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["TheCullingOfStratholme_Other2"],
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
                    tactics = L["AzjolNerub_KrikthirTheGatewatcher"],
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
                    tactics = L["AzjolNerub_Hadronox"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["DarkTharonKeep_NovosTheSummoner"],
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
                    tactics = L["DarkTharonKeep_KingDred"],
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
                    tactics = L["VioletHold_Cyanigosa"],
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
                    tactics = L["VioletHold_Other"],
                    enabled = false,
                    track = nil,
					partial = false,
                },
                boss3 = {
                    name = 628, --Ichoron
                    bossIDs = {},
                    achievement = 2041,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss4 = {
                    name = 631, --Zuramat the Obliterator
                    bossIDs = {29314},
                    achievement = 2153,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Gundrak_Galdarah1"],
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
                    tactics = L["Gundrak_Galdarah2"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["HallsOfStone_SjonnirTheIronshaper"],
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
                    tactics = L["HallsOfLightning_GeneralBjarngrim"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TheOculus_LeyGuardianEregos1"],
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
                    tactics = L["TheOculus_LeyGuardianEregos2"],
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
                    tactics = L["TheOculus_LeyGuardianEregos3"],
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
                    tactics = L["TheOculus_LeyGuardianEregos4"],
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
                    tactics = L["TheOculus_LeyGuardianEregos5"],
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
                    tactics = L["UtgardePinnacle_SvalaSorrowgrave"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["UtgardePinnacle_SkadiTheRuthless"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TrialOfTheChampion_ArgentConfessorPaletress"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss2 = {
                    name = 635, --Eadric the Pure
                    bossIDs = {},
                    achievement = 3803,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["TrialOfTheChampion_EadricThePure"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
                boss3 = {
                    name = 637, --The Black Knight
                    bossIDs = {35451},
                    achievement = 3804,
                    players = {L["(Enter instance to start scanning)"]},
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["TheForgeOfSouls_Bronjahm"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["Shared_JustKillBoss"],
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
                    tactics = L["PitOfSaron_Other"],
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
                    tactics = L["Shared_JustKillBoss"],
                    enabled = false,
                    track = nil,
                    partial = false,
                },
            },
        },
    },
}
