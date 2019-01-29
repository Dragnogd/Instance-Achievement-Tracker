if(GetLocale() ~= 'deDE') then return end

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "- Spieler im Chat posten, bei denen Erfolge für bestimmte Bosse fehlen",
	["- Announce to chat tactics for a certain boss"] = "- Taktiken für einen bestimmten Boss im Chat ausgeben",
	--[[Translation missing --]]
	--[[ ["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period.",--]] 
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Scannt alle Spieler in der Gruppe um zu zeigen, welchem Spieler welcher Erfolg in der aktuellen Instanz fehlt",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Verfolgt, wenn das Kriterium eines Instanz-Erfolgs fehlschlägt und gibt dies im Chat aus",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Verfolgt, wenn das Kriterium eines Instanz-Erfolgs erfüllt ist und gibt dies im Chat aus",
	["(Enter instance to start scanning)"] = "(Instanz betreten, um den Scanvorgang zu starten)",
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \n\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",--]] 
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
	["GUI_Tactics"] = "Taktik",
	["GUI_ToggleMinimap"] = "Zeige Minimap Knopf",
	["GUI_Track"] = "Verfolgen",
	["GUI_Tracking"] = "Verfolgung",
	["GUI_TrackingDisabled"] = "(Erfolgsverfolgung deaktiviert)",
	["GUI_TrackingNumber"] = "Derzeitige Verfolgung",
	["Gui_TranslatorNames"] = "gOOvER, Kaspi_1, sekorhex",
	["GUI_Translators"] = "Übersetzer",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	["Instances_Other"] = "Sonstige",
	["Instances_TrashAfterThirdBoss"] = "Trash nach dem dritten Boss",
	--[[Translation missing --]]
	--[[ ["KingsRest_DazarTheFirstKing"] = "This achievement is obtained at %s, the last boss in the instance. Have two players each stay on top of the stones in front of the two sarcophagi, and the lights will start filling up around the stone. Once they are both lit up, the right sarcophagus will start shaking which means that you can kill the boss.",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_MchimbaTheEmbalmer"] = "For this achievement you will have to free the player targeted by %s without him using %s more than once, and also free him before the boss finishes casting %s.\n\n Note: Players have reported a minor bug with this achievement, and it's recommended that the entombed player does not use %s before the boss casts %s",--]] 
	--[[Translation missing --]]
	--[[ ["KingsRest_Other"] = "The first trinket is in the first room of the dungeon, behind the sarcophagus, underneath the baskets.\n The second trinket is in the first boss hallway, at the end of the platform, behind the last set of stairs.\n The third trinket - (Check out the Glory of the Wartorn Hero Achievement Guide for details on WowHead)\n The fourth trinket is located before the final boss room, at the bottom of the strairs, at the top of the right pillar.",--]] 
	["Main"] = "Hauptmenü",
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
	["Shared_JustKillBossSingleTarget"] = "Um den Erfolg zu bekommen, kann der Boss einfach mit einer Single-Target Fähigkeit getötet werden",
	["Shared_KillTheAddNow"] = "Töte %s jetzt",
	["Shared_MeetsCritera"] = "erfüllt die Voraussetzung für",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "wurden nicht getroffen",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "Spieler getroffen:",
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
}

core:RegisterLocale('deDE', baseLocale)
