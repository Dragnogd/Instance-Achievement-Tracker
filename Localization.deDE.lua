if(GetLocale() ~= 'deDE') then return end

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "Spieler im Chat posten, bei denen Erfolge für bestimmte Bosse fehlen",
	["- Announce to chat tactics for a certain boss"] = "Taktiken für einen bestimmten Boss im Chat ausgeben",
	--[[Translation missing --]]
	--[[ ["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period.",--]] 
	--[[Translation missing --]]
	--[[ ["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Scans all players in the group to see which achievements each player is missing for the current instance",--]] 
	--[[Translation missing --]]
	--[[ ["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Tracks when the criteria of instance achievements has been failed and outputs this to chat",--]] 
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Verfolgt, wann die Kriterien für Instanzen Erfolge erfüllt sind und gibt diese im Chat aus",
	["(Enter instance to start scanning)"] = "(Instanz betreten, um den Scanvorgang zu starten)",
	--[[Translation missing --]]
	--[[ ["Atal_Dazar_Yazma"] = "In order to lite the Shadowflame Sconces, everyone in the group except the tank will have to spread and stay near one of them when the boss casts %s. The sconces will stay lit up for about 25 seconds, so you should do this when the boss is low on health around 5 to 10%%.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Other"] = "The IAT_122969 throughout the dungeon casts %s on a random player which hexes them for 5 seconds, and at the end of its duration anyone who is stood near that player will also get hexed. \\n\\nBefore pulling any IAT_122969 you will want to clear all the trash in the dungeon. You will have to bring the add to every boss, and if you have a class with a long cc (such as Monk with %s, Hunter with %s, Mage with %s) then you should keep it crowd controlled until close to the end of the fight. If you don't have any class with cc, then you should just focus on interrupting its %s cast throughout the fight.",--]] 
	--[[Translation missing --]]
	--[[ ["AtalDazar_Priestess_AlunZa"] = "Boss will summon an add by casting %s. This add will move to any %s puddles and soak them, and when there are no puddles up, it will turn to attack the players. At this point, you should cc the add in order to prevent excessive damage. The add will have to soak 8 puddles of %s in order to turn into a IAT_131140.",--]] 
	--[[Translation missing --]]
	--[[ ["Core_AchievementScanFinished"] = "Achievement Scanning Finished",--]] 
	--[[Translation missing --]]
	--[[ ["Core_AchievementTrackingEnabledFor"] = "Achievement Tracking Enabled for",--]] 
	--[[Translation missing --]]
	--[[ ["Core_CommandEnableTracking"] = "enable/disable IAT achievement tracking",--]] 
	--[[Translation missing --]]
	--[[ ["Core_Commands"] = "List of slash commands",--]] 
	--[[Translation missing --]]
	--[[ ["Core_Counter"] = "Counter",--]] 
	--[[Translation missing --]]
	--[[ ["Core_CriteriaMet"] = "Criteria has been met. Boss can now be killed!",--]] 
	--[[Translation missing --]]
	--[[ ["Core_Enable"] = "enable",--]] 
	--[[Translation missing --]]
	--[[ ["Core_EnableAchievementTracking"] = "Do you want to enable achievement tracking for",--]] 
	--[[Translation missing --]]
	--[[ ["Core_Failed"] = "FAILED!",--]] 
	--[[Translation missing --]]
	--[[ ["Core_GameFreezeWarning"] = "This may freeze your game for a few seconds",--]] 
	--[[Translation missing --]]
	--[[ ["Core_help"] = "help",--]] 
	--[[Translation missing --]]
	--[[ ["Core_ListCommands"] = "shows a list of avaliable slash commands",--]] 
	["Core_No"] = "Nein",
	--[[Translation missing --]]
	--[[ ["Core_NoTrackingForInstance"] = "IAT cannot track any achievements for this encounter",--]] 
	--[[Translation missing --]]
	--[[ ["Core_PersonalAchievement"] = "Personal Achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Core_Reason"] = "Reason",--]] 
	--[[Translation missing --]]
	--[[ ["Core_StartingAchievementScan"] = "Starting acchievement scan for",--]] 
	--[[Translation missing --]]
	--[[ ["Core_TrackAchievements"] = "Track Achievements",--]] 
	["Core_Yes"] = "Ja",
	["Features"] = "Features",
	--[[Translation missing --]]
	--[[ ["Freehold_SkycapNKragg"] = "To summon IAT_138314 you have to place a %s before you pull the boss.",--]] 
	["GUI_Achievement"] = "Erfolg",
	["GUI_Achievements"] = "Erfolge",
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsCompletedForInstance"] = "All achievements have been completed for",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements.",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AchievementsDiscordTitle"] = "Achievements Discord",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AnnounceMessagesToRaidWarning"] = "Announce messages to Raid Warning",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_AnnounceTracking"] = "Announce achievements being tracked to group",--]] 
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclysm",
	["GUI_Disabled"] = "Deaktiviert",
	["GUI_EnableAddon"] = "Addon aktivieren",
	["GUI_Enabled"] = "Aktiviert",
	["GUI_EnterInstanceToStartScanning"] = "Instanz betreten, um den Scanvorgang zu starten",
	--[[Translation missing --]]
	--[[ ["GUI_GreyOutCompletedAchievements"] = "Grey out completed achievements",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_HideCompletedAchievements"] = "Hide completed achievements",--]] 
	["GUI_Legion"] = "Legion",
	--[[Translation missing --]]
	--[[ ["GUI_MinimapDisabled"] = "Minimap icon disabled",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_MinimapEnabled"] = "Minimap icon enabled",--]] 
	["GUI_MistsOfPandaria"] = "Mists of Pandaria",
	["GUI_NoPlayersNeedAchievement"] = "Kein Spieler in der Gruppe, welches den Erfolg benötigt",
	--[[Translation missing --]]
	--[[ ["GUI_OnlyDisplayMissingAchievements"] = "Only display missing achievements",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_OnlyTrackMissingAchievements"] = "Only track missing achievements",--]] 
	["GUI_Options"] = "Einstellungen",
	["GUI_OutputPlayers"] = "Ausgabe Spieler",
	["GUI_OutputTactics"] = "Ausgabe Taktik",
	["GUI_Players"] = "Spieler",
	["GUI_PlayersWhoNeedAchievement"] = "Spieler, welche den Erfolg benötigen",
	--[[Translation missing --]]
	--[[ ["GUI_PlaySoundOnFailed"] = "Play a sound when an achievement fails",--]] 
	--[[Translation missing --]]
	--[[ ["GUI_PlaySoundOnSuccess"] = "Play a sound when a achievement is completed",--]] 
	["GUI_ScanInProgress"] = "Scan läuft noch",
	--[[Translation missing --]]
	--[[ ["GUI_SelectSound"] = "Select Sound",--]] 
	["GUI_Tactics"] = "Taktik",
	["GUI_ToggleMinimap"] = "Zeige Minimap Knopf",
	["GUI_Track"] = "Verfolgen",
	["GUI_Tracking"] = "Verfolgung",
	["GUI_TrackingDisabled"] = "(Erfolgsverfolgung deaktiviert)",
	["GUI_TrackingNumber"] = "Derzeitige Verfolgung",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	--[[Translation missing --]]
	--[[ ["Instances_Other"] = "Other",--]] 
	--[[Translation missing --]]
	--[[ ["Instances_TrashAfterThirdBoss"] = "Trash after the third boss",--]] 
	["Main"] = "Hauptmenü",
	--[[Translation missing --]]
	--[[ ["Shared_AddKillCounter"] = "%s kill counter",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_CompletedBossKill"] = "will be completed once boss is killed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_DamageFromAbility"] = "%s Damage",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_DirectHitFromAbility"] = "%s Direct Hit",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_DoesNotMeetCritera"] = "does not meet the critera for",--]] 
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	--[[Translation missing --]]
	--[[ ["Shared_FailedPersonalAchievement"] = "%s has failed %s (Reason: %s)(Personal Achievement)",--]] 
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	--[[Translation missing --]]
	--[[ ["Shared_Found"] = "found",--]] 
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	--[[Translation missing --]]
	--[[ ["Shared_GotHit"] = "got hit",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasBeenHitWith"] = "has been hit with",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasBeenInfectedWith"] = "has been infected with",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasCompleted"] = "has completed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasFailed"] = "has failed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasGained"] = "has gained",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HasLost"] = "has lost",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_HeCanNowBeKileld"] = "He can now be killed",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBoss"] = "At max level, you can simply just kill the boss to get this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_JustKillBossSingleTarget"] = "At max level, you can simply just kill the boss with single target abilities to get this achievement",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_KillTheAddNow"] = "Kill the %s now",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_MeetsCritera"] = "meets the criteria for",--]] 
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	--[[Translation missing --]]
	--[[ ["Shared_NotHit"] = "did not get hit",--]] 
	["Shared_One"] = "1",
	--[[Translation missing --]]
	--[[ ["Shared_PlayersHit"] = "players hit:",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoStillNeedToGetHit"] = "Players who still need to get hit:",--]] 
	--[[Translation missing --]]
	--[[ ["Shared_PlayersWhoStillNeedToGetResurrected"] = "The following players need to be resurrected in order to receive the achievement:",--]] 
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	--[[Translation missing --]]
	--[[ ["Shared_SheCanNowBeKilled"] = "She can now be killed",--]] 
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	--[[Translation missing --]]
	--[[ ["Uldir_Fetid_Devourer_Tactics"] = "Every fourth melee attack the boss will cast %s on the target closest to the current tank, a hit which deals physical damage equal to 300%% of a standard melee attack.\\n\\n Every player will have to be hit, and it's recommended to use a personal cooldown when that happens. The fight itself isn't that hard, but you should prioritize people without a good defensive cooldown, as the boss enrages at 50%% (%s)\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_GHuun_Tactics"] = "For this achievement you will have to make groups of 3 people to do the %s: 2 dps + 1 healer assisting them.\\n\\n If you have a smaller group then you should invite a few more people to help out with killing the adds",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_MOTHER_Tactics"] = "To enter the 'passcode' you will have to click the buttons in each chamber in a specific order that is randomized for every group. The order can be 321, 213, 231 or similar combinations.\\n\\n Check if the buttons in the first room stop blinking, and then send a group of 2-3 dps and a healer to click on the buttons in the second and the third room. If the buttons are clicked in the right sequence, they will stop blinking and won't be clickable anymore. Once you've done that you can kill the boss and get the achievement.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Mythrax_Tactics"] = "As of November 2018: The achievement now functions as described.\\n\\n This makes the achievement much more easier, as you just pick up the orbs that you spawned.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Taloc_Tactics"] = "For this achievement you will have to collect 4 %s while the Elevator is going down in phase 2.\\n\\n The positions of the orbs seem to be randomised, however a Demon Hunter can easily get all of them by using %s and %s",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Vectis_Tactics"] = "IAT_142148 is located down on the platform right before you go to IAT_134442.\\n\\n After you get the %s debuff on her, you can safely kill her, then kill the boss and you'll get the achievement.\",",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZekVoz_Tactics"] = "This achievement is pretty easy, however you should use the IAT_64482 after IAT_135129 disappears in phase 2. The puzzle will activate the next time the IAT_135129 appears (the second time), which helps your healers with healing & mana (you won't have to deal with the mechanics for an extra minute).\\n\\n The %s deal anywhere from 25k to 35k damage, so make sure to dodge them as much as possible so your healers don't get overwhelmed.",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZulReborn_Tactics"] = "This achievement is pretty straight forward, no one has to step onto the inner ring of the platform. Here are a few tips for the encounter:\\n\\n Tanks should pick all the adds, and stack them so that melee dps can cleave them.\\n Ranged dps should be on the boss 24/7, and should not switch to the adds unless melee dps can't keep up killing them in time.\\n If you have 2 priests in the group, then you should assign them to different positions (left and right outside of the group) so that both sides are covered when adds spawn.\\n At 40%% IAT_138967 will knock back everyone, so you should position yourself near a wall so you don't get knocked off the platform.\"",--]] 
}

core:RegisterLocale('deDE', baseLocale)
