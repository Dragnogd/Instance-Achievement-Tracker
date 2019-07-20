if(GetLocale() ~= 'deDE') then return end

local _, core = ...
local baseLocale = {
	["- Announce to chat players who are missing achievements for certain bosses"] = "- Spieler im Chat nennen, bei denen Erfolge für bestimmte Bosse fehlen.",
	["- Announce to chat tactics for a certain boss"] = "- Taktiken für einen bestimmten Boss im Chat ankündigen",
	["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Verfolgt Erfolge, die es erfordern eine bestimmte Anzahl Gegner in einer bestimmten Zeit zu töten. Benachrichtigt, sobald genügend Gegner erschienen sind und ob sie innerhalb der Zeitspanne getötet wurden",
	["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Überprüft alle Gruppen- oder Schlachtzugsmitglieder auf fehlende Erfolge in der aktuellen Instanz.",
	["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Verfolgt, wenn die Kriterien für einen Erfolg fehlgeschlagen sind und gibt dies im Chat aus",
	["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Verfolgt, wenn die Kriterien für einen Erfolg erfüllt sind und gibt dies im Chat aus",
	["(Enter instance to start scanning)"] = "(Instanz betreten, um den Scanvorgang zu starten)",
	["AssaultOnVioletHold_Festerface"] = [=[Um die %s zum vorschein zu bringen, muss %s 100 Energie erreichen.
Seine Energie nimmt ab, wenn er sich in der Nähe einer Lache auf dem Boden befindet, sodass der Boss von den Lachen ferngehalten werden muss. Sobald die %s erschienen ist, töte Sie und dann den Boss, um diesen Erfolg zu erzielen.]=],
	["AssaultOnVioletHold_MillificentManastorm"] = "Um diesen Erfolg zu vervollständigen, musst du das Spielzeug %s benutzen, während du %s bekämpfst.",
	["Atal_Dazar_Yazma"] = "Um die Schattenflammen-Leuchter zu zünden, muss sich jeder in der Gruppe mit Ausnahme des Tanks verteilen und in der Nähe eines Leuchter bleiben, wenn der Boss %s wirkt. Die Leuchter bleiben ca. 25 Sekunden lang beleuchtet. Aber erst, wenn der Boss nur noch 5 bis 10%% Gesundheit hat.",
	["AtalDazar_Other"] = "Die IAT_122969 im gesamten Dungeon werfen %s auf einen zufälligen Spieler, der ihn 5 Sekunden lang verhext. Am Ende der Dauer wird auch jeder verhext, der sich in der Nähe dieses Spielers befindet.\n\n Vor dem angreifen einer IAT_122969 sollte man den gesamten Trash im Dungeon leeren. Da du dieses Add zu jedem Boss bringen musst und eine Klasse mit einem langen CC haben (wie Mönch mit %s, Jäger mit %s, Magier mit %s), diese sollten das Add so lange unter Kontrolle halten, bis die Bosse sich dem Ende des Kampfes nähern. Wenn du keine Klasse mit CC hast, solltest du dich darauf konzentrieren, die %s-Zauber während des Kampfes zu unterbrechen.",
	["AtalDazar_Priestess_AlunZa"] = "Der Boss beschwört ein Add, indem er %s wirkt. Dieses Add bewegt sich in die Pfützen von %s und lässt sich einweichen. Wenn keine Pfützen vorhanden sind, greift das Add die Spieler an. An dieser Stelle sollten man es CC um übermäßigen Schaden zu vermeiden. Das Add muss 8 Pfützen %s einweichen, um ein IAT_131140 zu werden.",
	["BastionOfTwilight_HalfusWyrmbreaker"] = "Bei diesen Erfolg musst du zuerst nur den Boss angreifen und dann 2 der Drachen im Raum befreien. Klicke dazu auf die Drachen, die nicht den Debuff %s haben. Du musst dann beide Drachen innerhalb von 10 Sekunden hintereinander töten, bevor du den Boss tötest.",
	["BastionOfTwilight_ValionaAndTheralion"] = "Bei diesen Erfolg, greife %s an, um den Kampf zu beginnen und warte bis %s %s gewirkt hat. Sobald du in der aus %s erstellten Lache stehst, wirst du in das Schattenreich teleportiert. An diesem Punkt musst du 6 %s töten, die in zufälligen Abständen erscheinen. Wenn du 6 %s getötet hast, kannst du den Boss töten.",
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight_Alliance"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ChampionOfTheLight_Horde"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_ConclaveOfTheChosen"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong_Alliance"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Grong_Horde"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_HighTinkerMekkatorque"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JadefireMasters"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_JainaProudmoore"] = "",--]] 
	["BattleOfDazaralor_KingRastakhan"] = "Um diesen Erfolg zu erreichen, musst du die Phantom-Adds bis zum Ende des Kampfes am Leben erhalten. Tank sie einfach vom Schlachtzug weg, um unnötigen Schaden zu vermeiden. \n\n Ein dritter Tank ist ideal für diesen Erfolg",
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_Opulence"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["BattleOfDazaralor_StormwallBlockade"] = "",--]] 
	["BattleOfDazzarlor_BarrelsDestroyed"] = "Fässer zerstört",
	--[[Translation missing --]]
	--[[ ["BattleOfDazzarlor_OpulenceRangeWarning"] = "",--]] 
	["BlackrockCaverns_KarshSteelbender"] = "Zieh den Boss ins Feuer in der Mitte des Raumes bis er 15 Stapel von %s erreicht hat. Sobald er 15 Stapel von %s hat, kannst du den Boss töten.",
	["BlackRookHold_AmalgamOfSouls"] = "Bring den %s auf 50%% HP. Wenn die %s erscheinen, musst du eine von ihnen CC, um zu verhindern, dass sie den Boss erreicht. Nach 1 Minute verwandeln sich die %s in %s. Du kannst dann die %s töten und dann den Boss, um diesen Erfolg zu erzielen.",
	["BloodmaulSlagMines_Magmolatus"] = "Bei maximaler Stufe musst du den Boss langsam herunter hauen, damit sowohl %s als auch %s erscheinen, bevor du den Boss tötest.",
	["CathedralOfEternalNight_Agronox"] = "Um diesen Erfolg zu erreichen, muss man auf den 4 Knospensamen-Hülsen im Bossraum drauf stehen und auf einen donnernden Peitscher warten, der %s auf jeden der Knospensamen verteilt. Sobald dies für jeden der 4 Samen erledigt ist, kannst du den Boss töten.",
	["CathedralOfEternalNight_Mephistroth"] = "Sammel zu Beginn des Kampfes die %s ein. Dann musst du warten, bis der Boss 100 Energie erreicht hat und Phase 2 einleitet. In Phase 2 wende dich dem Schild zu, den du zu Beginn des Kampfes gegen die %s aufgenommen hast. Sobald 20 %s mit dem Schild reflektiert wurden, kannst du den Boss töten.",
	["CathedralOfEternalNight_ThrashbiteTheScornful"] = "Rund um den Raum stehen 4 Bücherschränke. Um diesen Erfolg zu vervollständigen, muss man sich hinter jeden Bücherschrank stellen und warten, bis der Boss %s wirkt, um ein Bücherschrank zu stürmen. Sobald ein Bücherschrank kaputt ist, erscheint ein anklickbares Buch auf dem Boden. Jedes Mitglied in der Gruppe muss auf dieses Buch klicken. Wiederhole dies für die anderen 3 Bücherschränke im Bossraum und achte dabei darauf, dass du im Uhrzeigersinn vor gehst. Sobald dies erledigt ist, sollte jeder in der Gruppe den %s-Buff haben und du kannst den Boss töten. Das letzte Buch hat der Boss selbst.\n\n Hinweis: Um diesen Erfolg abzuschließen, musst du eine komplette 5-Mann-Gruppe haben.",
	["Core_AchievementScanFinished"] = "Scannen der Erfolge abgeschlossen!",
	["Core_AchievementTrackingEnabledFor"] = "Erfolgsverfolgung aktiviert für ",
	["Core_CommandEnableTracking"] = "IAT Erfolgsverfolgung aktivieren/deaktivieren",
	["Core_Commands"] = "Liste mit Slash-Befehlen ",
	["Core_Counter"] = "Zähler ",
	["Core_CriteriaMet"] = "Kriterien wurden erfüllt. Boss kann jetzt getötet werden!",
	["Core_Enable"] = "aktivieren",
	["Core_EnableAchievementTracking"] = "Möchtest du die Erfolgsüberwachung aktivieren für ",
	["Core_Failed"] = "FEHLGESCHLAGEN!!!",
	["Core_GameFreezeWarning"] = "Das Spiel kann für ein paar Sekunden einfrieren ",
	["Core_help"] = "Hilfe ",
	["Core_ListCommands"] = "Zeigt eine Liste verfügbarer Slash-Befehle ",
	["Core_No"] = "Nein",
	["Core_NoTrackingForInstance"] = "IAT kann keine Erfolge für diese Begegnung verfolgen",
	["Core_PersonalAchievement"] = "Persönlicher Erfolg",
	["Core_Reason"] = "Grund ",
	["Core_StartingAchievementScan"] = "Starte Erfolgsscan für ",
	["Core_TrackAchievements"] = "Verfolge Erfolge ",
	["Core_Yes"] = "Ja",
	["CourtOfStars_Other"] = "Folgende Voraussetzungen müssen erfüllt sein:\n\n -Lass die %s nicht %s wirken\n -Deaktiviere die 5 Leuchtfeuer, bevor du den ersten Boss angreifst\n -Stelle sicher, dass du alle 3 Dämonen einzeln tötest, bevor du %s angreifst\n -Spion erraten beim ersten Versuch",
	["CourtOfStars_PatrolCaptainGerdo"] = "Bei diesen Erfolg sollte man zuerst den gesamten Trash im Bossraum räumen. Stelle beim Töten des Trash sicher, dass weder die Mobs noch die Spieler die Leuchtfeuer aktivieren, da dies den Erfolg fehlschlägt.\n\n Wenn der gesamte Trash tot ist, greife den Boss an und warte bis er %s gewirkt hat. Sobald der Boss diese Fähigkeit eingesetzt hat, musst du auf alle 5 Leuchtfeuer im Raum klicken. Sobald alle 5 Leuchtfeuer deaktiviert wurden, kannst du den Boss töten.",
	["CrucibleOfStorms_StartMoving"] = "DU KANNST DICH JETZT BEWEGEN!",
	["CrucibleOfStorms_StopMoving"] = "NICHT BEWEGEN!",
	--[[Translation missing --]]
	--[[ ["CrucibleOfStorms_TheRestlessCabal"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["CrucibleOfStorms_UunatHarbingerOfTheVoid"] = "",--]] 
	["DarkheartThicket_Dresaron"] = "Nachdem du den Boss angegriffen hast, lauf durch das große Ei hinter %s, um es auszubrüten. Töte als nächstes die %ss, die erscheinen und töte dann den Boss.",
	["DarkheartThicket_ShadeOfXavius"] = "Bring den Boss bis auf 15%% - 20%% Gesundheit und ziehe den Boss durch die wirbelnden Pfützen auf dem Boden bis der Boss 10 Stapel von %s hat und töte ihn dann.",
	["EyeOfAzshara_LadyHatecoil"] = "Wenn der %s-Debuff abläuft oder abgebrochen wird, atmet Sie in die Richtung, in der du dich gerade befindest und tötet alle %s auf dem Weg. Um den Erfolg zu erreichen, musst du bei 11 oder mehr %s 1 Atemzug machen. Die %s werden im Laufe der Zeit erscheinen, halte dich also von den Adds fern, bis 11 oder mehr erschienen sind.",
	["Features"] = "Eigenschaften",
	["Freehold_HarlanSweete"] = "%s zielt auf einen zufälligen Spieler für %s, der sich in der Nähe einer der Truhen befinden muss, damit sie zerstört werden.",
	["Freehold_RingOfBooty"] = "Für diesen Erfolg musst du während der gesamten Instanz 3 Gegenstände einsammeln. %s erscheint beim ersten Boss im Nest, nachdem du ihn besiegt hast. %s befindet sich links oben auf einer Plattform im Rum-Viertel und %s befindet sich in der Nähe des Haiköders, rechts vorne, nach dem dritten Boss.",
	["Freehold_SkycapNKragg"] = "Um IAT_138314 zu beschwören, musst du %s platzieren, bevor du den Boss angreifst.",
	["GUI_Achievement"] = "Erfolg",
	["GUI_Achievements"] = "Erfolge",
	["GUI_AchievementsCompletedForInstance"] = "Alle Erfolge sind abgeschlossen für ",
	["GUI_AchievementsDiscordDescription"] = "Die Taktiken wurden vom Achievements Discord Server bereit gestellt, die Mitglieder können sich mit gleichgesinnte Mitglieder und Gruppen für bestimme Erfolge treffen.",
	["GUI_AchievementsDiscordTitle"] = "Erfolge Discord ",
	["GUI_AnnounceMessagesToRaidWarning"] = "Zeige Nachrichten als Raidwarnung ",
	["GUI_AnnounceTracking"] = "Erfolge die beobachtet werden an die Gruppe ansagen",
	["GUI_Author"] = "Autor ",
	["GUI_BattleForAzeroth"] = "Battle for Azeroth",
	["GUI_Cataclysm"] = "Cataclysm",
	["GUI_Disabled"] = "Deaktiviert",
	["GUI_DisplayInfoFrame"] = "Info Rahmen aktivieren",
	["GUI_EnableAddon"] = "Addon aktivieren",
	["GUI_EnableAutomaticCombatLogging"] = "Aktiviere automatisch den Kampflog ",
	["GUI_Enabled"] = "Aktiviert",
	["GUI_EnterInstanceToStartScanning"] = "Instanz betreten, um den Scanvorgang zu starten",
	["GUI_GreyOutCompletedAchievements"] = "Abgeschlossene Erfolge werden ausgegraut",
	["GUI_HideCompletedAchievements"] = "Verstecke abgeschlossene Erfolge ",
	["GUI_Legion"] = "Legion",
	["GUI_MinimapDisabled"] = "Minimap Symbol deaktiviert ",
	["GUI_MinimapEnabled"] = "Minimap Symbol aktiviert ",
	["GUI_MistsOfPandaria"] = "Mists of Pandaria",
	["GUI_NoPlayersNeedAchievement"] = "Kein Spieler in der Gruppe benötigt diesen Erfolg",
	["GUI_OnlyDisplayMissingAchievements"] = "Zeige nur fehlende Erfolge ",
	["GUI_OnlyTrackMissingAchievements"] = "Verfolge nur fehlende Erfolge ",
	["GUI_Options"] = "Einstellungen",
	["GUI_OutputPlayers"] = "Ausgabe Spieler",
	["GUI_OutputTactics"] = "Ausgabe Taktik",
	["GUI_Players"] = "Spieler",
	["GUI_PlayersWhoNeedAchievement"] = "Spieler, die Erfolg brauchen",
	["GUI_PlaySoundOnFailed"] = "Spielt einen Ton, wenn ein Erfolg fehlschlägt",
	["GUI_PlaySoundOnSuccess"] = "Spielt einen Ton, wenn ein Erfolg abgeschlossen ist",
	["GUI_ScanInProgress"] = "Scan läuft noch",
	["GUI_SelectSound"] = "Wähle ein Ton",
	["GUI_Tactic"] = "Taktik",
	["GUI_Tactics"] = "Taktiken",
	["GUI_ToggleMinimap"] = "Zeige Minimap Knopf",
	["GUI_Track"] = "Verfolgen",
	["GUI_Tracking"] = "Verfolgung",
	["GUI_TrackingDisabled"] = "(Erfolgsverfolgung deaktiviert)",
	["GUI_TrackingNumber"] = "Derzeitige Verfolgung",
	["Gui_TranslatorNames"] = "SunnySunflow, g00v3R",
	["GUI_Translators"] = "Übersetzer ",
	["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
	["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
	["HallsOfValor_Other1"] = "Begib dich in den Bereich %s. Säubere den gesamten Bereich mit Ausnahme von %s und alle %s, die du nach dem Teleport siehst. Wenn du fertig bist, greife %s an und zieh ihn zu den 10 %s in der Gegend hin. Sobald %s 10 Stapel von %s hat, kannst du ihn töten, um den Erfolg zu erzielen.",
	["HallsOfValor_Other2"] = "Hinweis: Für diesen Erfolg sind mindestens 4 Spieler erforderlich.\n\n Nachdem du %s und %s besiegt hast, ist der Pfad zu den vier Könige jetzt offen. Bevor du den Weg einschlägst, gehe zurück in den Speisesaal und lass jeden Spieler ein %s auf dem Tisch aufnehmen, um den %s-Buff zu erhalten.\n\n Sobald man den Buff aufgenommen hat, haben die Spieler 20 Sekunden Zeit, um schnell die Rolltreppe hoch und ihren %s zu einem der vier Könige (%s, %s, %s und %s) zu werfen. Hinweis: Jeder Spieler muss einen anderen Boss auswählen.",
	["Instance Achievement Tracker"] = "Instance Achievement Tracker",
	["Instances_Other"] = "Sonstige ",
	["Instances_TrashAfterThirdBoss"] = "Trash nach dem dritten Boss ",
	["KingsRest_DazarTheFirstKing"] = "Dieser Erfolg wird bei %s erzielt, dem letzten Boss in der Instanz. Lass jeweils ein Spieler auf den Steinen vor den beiden Sarkophagen verweilen und die Lichter füllen sich um den Stein herum. Sobald beide angezündet sind, fängt der rechte Sarkophag an zu zittern, was bedeutet, dass du den Boss töten kannst.",
	["KingsRest_MchimbaTheEmbalmer"] = "Für diesen Erfolg muss der Spieler, den %s als Ziel hat, befreien ohne dass er %s mehr als einmal benutzt. Außerdem muss man ihn befreien, bevor der Boss mit dem Wirken von %s fertig ist.\n\n Hinweis: Spieler haben einen kleinen Fehler mit diesem Erfolg gemeldet , und es wird empfohlen, dass der Spieler im Grab %s nicht benutzt, bevor der Boss %s wirkt.",
	["KingsRest_Other"] = "Das erste Schmuckstück befindet sich im ersten Raum des Dungeon, hinter dem Sarkophag unter den Körben.\n Das zweite Schmuckstück befindet sich beim ersten Boss-Flur am Ende des Treppenabsatz hinter der letzten Treppe.\n Das dritte Schmuckstück - (Weitere Informationen findest du bei WowHead im Leitfaden zum Ruhm des kriegsgezeichneten Helden)\n Das vierte Schmuckstück befindet sich vor dem letzten Bossraum, am unteren Ende der Treppe, oben auf der rechten Säule.",
	["LostCityOfTheTolVir_Lockmaw"] = "Greif den Boss an und warte bis 20 %s erscheinen. Nachdem 20 %s erschienen sind, töte sie alle und dann den Boss.",
	["Main"] = "Hauptmenü",
	["MawOfSouls_Other"] = "Um diesen Erfolg zu vervollständigen, musst du den zweiten Boss innerhalb von 3 Minuten und 30 Sekunden töten, ab dem Betreten des Schiffes, direkt nach dem ersten Boss.",
	["NeltharionsLair_Naraxas"] = "Um diesen Erfolg zu vollenden, musst du warten bis der Boss 6 Stapel von %s erreicht hat. Dies kann auf folgende Arten geschehen:\n\n -Der Tank wird vom Boss gefressen\n -Lass die Adds am Leben, damit sie vom Boss gefressen werden.\n\n Sobald 6 Stapel von %s erreicht sind, kannst du den Boss töten, um den Erfolg zu erhalten.",
	--[[Translation missing --]]
	--[[ ["NeltharionsLair_Other"] = "",--]] 
	["ReturnToKarazhan_OperaHall"] = "Dieser Erfolg wird 3 Wochen in Anspruch nehmen, da sich die Theatervorführungen nach einem 3-wöchigen Zeitplan drehen.",
	["ReturnToKarazhan_ShadeOfMedivh"] = "Für diesen Erfolg sind 5 Spieler erforderlich. Alle Spieler in der Gruppe müssen auf ein Buch klicken, das sich links auf dem Boden befindet, nachdem alle den Bossraum betreten haben. Dies gibt jedem in der Gruppe den Debuff %s. Wenn alle den Debuff %s haben, kannst du den Boss töten.",
	["SeatOfTheTriumvirate_Lura"] = "Auf deinem Weg vom zweiten zum dritten Boss findest du Lachen der Leere, die dich in die Mitte von ihnen ziehen, wo du jede Sekunde einen Stapel von %s bekommst. Sobald du 10 Stapel erhalten hast, wird der Debuff durch einen neuen mit dem Namen %s ersetzt. Töte %s, während du von %s betroffen bist und der Erfolg wird anerkannt.",
	["SeatOfTheTriumvirate_Saprish"] = "Für diesen Erfolg musst du auf den 4 %s im Raum stehen, damit die %s gebrochen werden, wenn er zu einem der Spieler springt. Sobald alle %s gebrochen sind, kannst du %s töten und den Erfolg erhalten.",
	["SeatOfTheTriumvirate_ZuraalTheAscended"] = "Ungefähr vierzig Sekunden nach dem Kampf wird der Boss einen zufälligen Spieler als Ziel wählen und %s wirken, wodurch dieser Spieler in den leeren Bereich zurückgeworfen wird.\n\n Jetzt sollte der Spieler seinen Energiebalken auffüllen, %s angreifen und dann den zusätzliche Aktionsknopf %s in seiner Nähe verwenden, damit beide zurück in den normalen Bereich geschickt werden.\n\n Von dort aus tötest du nur %s, dann %s und schon hast du dein Erfolg.",
	["Shared_AddKillCounter"] = "%s Kill-Zähler ",
	["Shared_CompletedBossKill"] = "wird erfüllt wenn der Boss getötet wurde",
	["Shared_DamageFromAbility"] = "%s Schaden ",
	["Shared_DirectHitFromAbility"] = "%s direkter Schlag ",
	["Shared_DoesNotMeetCritera"] = "erfüllt nicht die Voraussetzungen für ",
	["Shared_Eight"] = "8",
	["Shared_Eighteen"] = "18",
	["Shared_Eleven"] = "11",
	["Shared_FailedPersonalAchievement"] = "%s ist gescheitert %s (Grund: %s)(Persönlicher Erfolg) ",
	["Shared_Fifteen"] = "15",
	["Shared_Five"] = "5",
	["Shared_Found"] = "gefunden ",
	["Shared_Four"] = "4",
	["Shared_Fourteen"] = "14",
	["Shared_GotHit"] = "wurde getroffen ",
	["Shared_HasBeenHitWith"] = "wurde getroffen mit ",
	["Shared_HasBeenInfectedWith"] = "wurde infiziert mit ",
	["Shared_HasCompleted"] = "hat abgeschlossen ",
	["Shared_HasFailed"] = "ist fehlgeschlagen ",
	["Shared_HasGained"] = "hat gewonnen ",
	["Shared_HasLost"] = "hat verloren ",
	["Shared_HeCanNowBeKileld"] = "Er kann jetzt getötet werden ",
	["Shared_JustKillBoss"] = "Bei Maximalstufe kann der Boss einfach getötet werden, um diesen Erfolg zu erzielen",
	["Shared_JustKillBossesTogether"] = "Bei Maximalstufe kannst du einfach die Bosse gleichzeitig töten, um diesen Erfolg zu erzielen",
	["Shared_JustKillBossSingleTarget"] = "Bei Maximalstufe kannst du einfach den Boss mit Einzelzielfähigkeiten töten, um diesen Erfolg zu erzielen",
	["Shared_KillTheAddNow"] = "Töte %s jetzt ",
	["Shared_MeetsCritera"] = "erfüllt die Voraussetzung für ",
	["Shared_Nine"] = "9",
	["Shared_Nineteen"] = "19",
	["Shared_NotHit"] = "wurden nicht getroffen ",
	["Shared_One"] = "1",
	["Shared_PlayersHit"] = "Spieler getroffen: ",
	["Shared_PlayersWhoNeedAchievement"] = "Spieler die den Erfolg brauchen ",
	["Shared_PlayersWhoStillNeedToGetHit"] = "Spieler die noch getroffen werden müssen: ",
	["Shared_PlayersWhoStillNeedToGetResurrected"] = "Die folgenden Spieler müssen wiederbelebt werden um den Erfolg zu erhalten: ",
	["Shared_ReportString"] = "Bitte melde den folgenden String zum IAT Autor",
	["Shared_Seven"] = "7",
	["Shared_Seventeen"] = "17",
	["Shared_SheCanNowBeKilled"] = "Sie kann jetzt getötet werden ",
	["Shared_Six"] = "6",
	["Shared_Sixteen"] = "16",
	["Shared_Ten"] = "10",
	["Shared_Thirteen"] = "13",
	["Shared_Three"] = "3",
	["Shared_Twelve"] = "12",
	["Shared_Twenty"] = "20",
	["Shared_Two"] = "2",
	["Shared_WasKilled"] = "wurde getötet ",
	["ShrineOfTheStorm_LordStormsong"] = "Während der Begegnung beginnt %s in regelmäßigen Abständen mit %s, wodurch %s beschworen werden. Sie verfolgen die Spieler und versuchen beim Aufprall zu explodieren. Um diesen Erfolg zu erzielen, darf keiner mit den leeren Kugeln in Kontakt kommen. Also weicht während der gesamten Begegnung aus.",
	["ShrineOfTheStorm_Other"] = "Die %s wird zu Beginn des Dungeons im ersten Raum aufgenommen. Wenn sie Frostschaden erleidet, wird die Geistflamme gelöscht. Es wird daher empfohlen, zuerst den Trash bis zum dritten Boss zu entsorgen und dann den Atem aufnehmen. Töte nicht den ersten Boss, da der Atem sonst verschwindet. Sobald du beim dritten Boss die Schreine erleuchtest, erhältst du den Erfolg.",
	["ShrineOfTheStorm_VolZith"] = "Um den %s-Debuff zu erhalten, musst du vor dem letzten Boss ins Wasser tauchen bis du leere Kugeln herumschwimmen siehst und dann durch sie hindurch schwimmen. Der Debuff macht dich 24 Sekunden lang feindlich gegenüber allen Spielern und verschwindet dann für 6 Sekunden, in denen der Heiler CDs verwendet und alle auf volle HP heilen muss. Vermeide AOE auf den Boss und verwende stattdessen so viel Selbstheilung wie möglich, um den Heiler zu helfen.\n\n Nachdem %s %s gewirkt hat, werden alle in den versunkenen Bereich teleportiert. Hier sollte man schnell die Adds töten und dann 20 bis 30 Sekunden warten bis die Abklingzeiten verfügbar sind. %s wird auch %s wirken und du musst 5 %s Adds unter Kontrolle halten, damit sie den Boss nicht erreichen.",
	["SiegeOfBoralus_DreadCaptainLockwood"] = "%s wird ununterbrochen versuchen, sich mit %s von Spielern zurückzuziehen, es sei denn, sie ist gefesselt oder gewurzelt. Wie aus der Erfolgsbeschreibung hervorgeht, musst du sie gefesselt oder gewurzelt halten und verhindern das sie jemals %s benutzt.",
	["SiegeOfBoralus_Other"] = "Wie der Name des Erfolgs andeutet, handelt es sich um einen berufsbezogenen Erfolg, bei dem du mit Gegenständen interagieren kannst, um Bosse zu beschwören.Um die Gegenstände in den Dungeons verwenden zu können, sind mindestens 75 Fertigkeitspunkte erforderlich.\n\n (Schmiedekunst) %s - Der Hammer befindet sich bei 58, 70 die Treppe hinunter zu den Docks.\n (Ingenieurwesen) %s - Der NPC befindet sich direkt zu Beginn der Instanz.\n (Alchemie) %s - Die 'Seltsame Phiole' befindet sich bei 54, 74 in der Nähe eines Tisches.",
	["SiegeOfBoralus_ViqGoth"] = "Während der Begegnung wird %s %s verwenden, was ein Sperrfeuer von %s in der Umgebung verursacht. Währenddessen werden mehrere %s auf das Land geworfen, die du zurück ins Wasser werfen musst, bevor du den Boss besiegen kannst.",
	["TempleOfSethraliss_AvatarOfSethraliss"] = "Für diesen Erfolg musst du %s küssen, bis sich einer von ihnen in einen 'Prinzen' verwandelt, der wie %s aussieht. Der 'Prinz' kann nicht sterben, also mach dir keine Gedanken über die Verwendung von AOE oder schaden.",
	["TempleOfSethraliss_Merektha"] = "Um die %s zu enthüllen, was oben auf den Knochen versteckt ist, musst du %s, %s, %s oder andere bodenschädigende Fähigkeiten einsetzen. Um das Ei zum Schlüpfen zu bringen, sammeln sich alle Spieler beim Boss und warten bis %s gewirkt ist. Sobald %s erscheint, kannst du sie töten und dann darauf klicken, um den %s-Buff zu erhalten, der dir den Erfolg verleiht.\n\n Hinweis: Die %s kann Angriffen ausweichen, teleportiert sich jedoch nach einigen Sekunden auf den Boden. Wenn du einen Todesritter in der Gruppe hast, sollte er mit %s die %s nach unten ziehen, um diesen Fehler nicht nur zu umgehen, sondern auch die Positionierung zu vereinfachen.",
	["TempleOfSethraliss_Merektha_LootSnake"] = "Plündere jetzt die %s , um den Erfolg abzuschließen",
	["TempleOfSethraliss_Trash"] = "Für diesen Erfolg sollte man nützliche Klassenfähigkeiten verwenden, um die %s unter Kontrolle zu halten, während man beide Augen näher bringt. Beachte, dass es im gesamten Raum mehrere %s gibt, die versuchen, das Auge zu stehlen. Es gibt einen in der Nähe jedes Auges, einen zwischen den Augen und dem Schädel und einige weitere in der Mitte des Raumes.\n\n Fähigkeiten wie %s, %s und %s sind ideal. Damit kann man die Adds auf einer Seite CC und dann vollständig ignorieren.",
	["TerraceOfEndlessSpring_DefeatedLast"] = "\"%s zuletzt besiegt\" Teil von",
	["The_Motherlode_CoinOperatedCrowdPummeler"] = "Hebe %s vorher beim Boss auf und wirf es auf %s, nachdem du den Boss angegriffen hast. %s wird %s während des Kampfes wirken, also solltest du den Zauber unterbrechen und ihn töten. Die anderen Adds werfen so schnell wie möglich Grog, sodass du 10 Sekunden lang betrunken bist.",
	["The_Motherlode_MogulRazdunk"] = "Ähnlich wie bei den Vorgängern dieses Erfolgs, ist dies ein persönlicher Erfolg. Bei dem du den meisten schädlichen Mechanismen der Bossbegegnung ausweichen musst.",
	["TheEmeraldNightmare_Cenarius"] = "Bei maximaler Stufe kannst du mit genügend Schaden den Boss töten, bevor alle %s gesäubert werden.",
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_DragonsOfNightmare"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_EleretheRenferal"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Nythendra"] = "",--]] 
	["TheEmeraldNightmare_Ursoc"] = "Töte den Trash auf der rechten Seite direkt vor dem Eingang der Höhle, in der sich der Boss befindet. Befreie %s und warte, bis er den Boss erreicht. Töte den Boss, während %s am Leben bleibt, um diesen Erfolg zu erzielen.",
	--[[Translation missing --]]
	--[[ ["TheEmeraldNightmare_Xavius"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_ChronomaticAnomaly"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Elisande"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Guldan"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_HighBotanistTelarn"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TheNighthold_Krosus"] = "",--]] 
	["TheNighthold_Skorpyron"] = "Bei maximaler Stufe, lass die gesamte Gruppe im Kreis in der Mitte des Raums stehen und töte den Boss, bevor er %s wirkt.",
	--[[Translation missing --]]
	--[[ ["TheNighthold_StarAugurEtraeus"] = "",--]] 
	["TheNighthold_Tichondrius"] = "Bei maximaler Stufe, kannst du den Boss einfach töten, bevor er %s wirkt. \n\n Hinweis: Dieser Erfolg ist ein persönlicher Erfolg.",
	["TheUnderrot_ElderLeaxa"] = "%s Fähigkeiten wenden %s auf Spieler an, wenn sie Zauberschaden erleiden. Dies bedeutet, dass alle ihre Fähigkeiten unterbrochen und ausgewichen werden müssen, um diese Schwächung zu verhindern.\n\n Um den Erfolg zu vereinfachen, kann der Heiler auf DD, um eine zusätzliche Unterbrechung durchzuführen und sie schneller zu töten.",
	["TheUnderrot_SporecallerZancha"] = "%s befindet sich in der oberen linken Ecke des Raums. Um ihn zu aktivieren, musst du den Boss dazu bringen, %s in seine Richtung zu wirken. \n\n Hinweis: Wenn %s Angriffen ausweicht, gehe einfach in die Mitte des Raums und er wird sich kurz dorthin teleportieren.",
	["TheUnderrot_UnboundAbomination"] = "Pfützen von %s verschmelzen gelegentlich zu %s Adds, die einen zufälligen Spieler fixieren. Du musst den Boss töten, ohne %s sterben zu lassen, was einfach gemacht werden kann, indem du Ihn in einem Kreis um den Raum ziehst.\n\n Benutze CC, um sie zu verlangsamen und vergiss nicht deine Talente, Schmuckstücke und azeritische Eigenschaften zu überprüfen, damit du die Sporen nicht versehentlich tötest.",
	--[[Translation missing --]]
	--[[ ["TolDagor_KnightCaptainValyri"] = "",--]] 
	["TolDagor_OverseerKorgus"] = "Kurz nachdem du die Begegnung gestartet hast, schießt %s %s Runden auf jeden Spieler und wendet %s an. Jedes Mal, wenn sich ein Spieler bewegt, wird der Effekte stärker und der Spieler wird schließlich 8 Sekunden lang betäubt. Dies sollten alle in der Gruppe zu Beginn der Begegnung tun, da es keine Ausweichmöglichkeiten gibt.",
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_DemonicInquisition"] = "",--]] 
	["TombOfSargeras_FallenAvatar"] = "Bei maximaler Stufe töte einfach den Boss, bevor er %s wirkt.",
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_Goroth"] = "",--]] 
	["TombOfSargeras_Harjatan"] = "Um %s hervorbringen, muss einer das Spielzeug %s verwenden.  \n\n Verwende das Spielzeug zu Beginn des Kampfes, konzentriere dich auf %s und nachdem er gestorben ist, kannst du den Boss töten.",
	--[[Translation missing --]]
	--[[ ["TombOfSargeras_MistressSasszine"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Guarm"] = "",--]] 
	["TrialOfValor_Helya"] = "Auf maximaler Stufe ist es einfacher, diesen Erfolg alleine zu meistern. Töte einfach den Boss ohne den %s-Debuff zu haben. Dies kann getan werden, indem sichergestellt wird, dass %s zuerst getötet wird, bevor der Boss getötet wird.",
	--[[Translation missing --]]
	--[[ ["TrialOfValor_Odyn"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Fetid_Devourer_Tactics"] = "",--]] 
	["Uldir_GHuun_Tactics"] = "Für diesen Erfolg musst du Gruppen von 3 Personen bilden, um die %s zu machen: 2 DDs + 1 Heiler, die dabei helfen.\n\n Wenn du eine kleinere Gruppe hast, dann solltest du noch ein paar Leute einladen, um beim Töten der Adds zu helfen.",
	--[[Translation missing --]]
	--[[ ["Uldir_MOTHER_Tactics"] = "",--]] 
	["Uldir_Mythrax_Tactics"] = "Stand November 2018: Der Erfolg funktioniert jetzt wie beschrieben.\n\n Dies erleichtert den Erfolg erheblich, da man nur die Kugeln einsammeln darf, die du selbst hervorgebracht hast.",
	--[[Translation missing --]]
	--[[ ["Uldir_Taloc_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_Vectis_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZekVoz_Tactics"] = "",--]] 
	--[[Translation missing --]]
	--[[ ["Uldir_ZulReborn_Tactics"] = "",--]] 
	["Ulduar_AssemblyOfIron1"] = "Um diesen Erfolg zu beenden, musst du %s zuletzt töten",
	["Ulduar_FlameLeviathan1"] = "Für diesen Erfolg sind 3 Läufe erforderlich, da man den Boss in jedem der 3 Fahrzeuge töten muss",
	["Ulduar_FlameLeviathan2"] = "Um diesen Erfolg zu vervollständigen, solltest du der Beifahrer im Zerstörer sein. Wenn der Beifahrer die Taste %s drückt, muss der Fahrer %s sehen können und die Aktion %s ausführen. Sobald %s erreicht ist, gibt es 2 Geschütztürme. Wenn du einen der Türme tötest, erhältst du die Errungenschaft.",
	["Ulduar_FlameLeviathan3"] = "Um diesen Erfolg zu vervollständigen, musst du den %s-Hardmodus aktivieren, indem du zu Beginn der Instanz mit %s sprichst. Danach musst du nur noch den Boss töten, ohne einen der Türme zu zerstören, die zum Boss führen.",
	["Ulduar_Other1"] = "Auf maximaler Stufe ist dieser Erfolg viel einfacher zu meistern, ohne ein Fahrzeug zu benutzen. Lauf einfach zwischen zwei der Säulen, von denen die %s herbei stürmen und warte einfach, bis 100 %s dich angreifen. Dann mach AOE schaden, um diesen Erfolg zu erzielen.",
	["Ulduar_Other2"] = "Töte den Boss, ohne die Reparatur-Unterlagen kurz vor dem Boss zu überfahren.",
	["VaultOfTheWardens_AshGolm"] = "Um diesen Erfolg zu vervollständigen, muss jeder in der Gruppe %s durch den Raum ziehen, um den %s -Debuff zu erhalten. Sobald jeder in der Gruppe den Debuff %s hat, kannst du den Boss töten.",
	["VaultOfTheWardens_Cordana"] = "Um diesen Erfolg zu vervollständigen, dürfen bei %s keine Spieler in der Gruppe von den Geistern getroffen werden. Während %s wird %s eine Salve von Pfeilen abfeuern, die kurz die Positionen der Geister enthüllen. Die Geister bewegen sich über die Plattform in einer Linie mit einer kleinen Lücke, durch die die Spieler gehen müssen, um die Welle zu vermeiden. Es gibt 4 Geisterwellen, die vermieden werden müssen.\n\n Zweitens muss der Spieler, der %s trägt, diese auf den Boden werfen, bevor %s 40%% Gesundheit erreicht, da dies der Zeitpunkt ist, an dem der erste Zauber von %s beginnt. %s darf nicht verwendet werden, um die Geister zu enthüllen, da dies den Erfolg fehlschlägt.\n\n Wenn du während %s alle 4 Geisterwellen vermieden hast und alle Geister die Plattform geräumt haben, kannst du den Boss töten, um diesen Erfolg zu erzielen.\n\n Hinweis: Um den Erfolg zu vereinfachen, kann ein Dämonenjäger mithilfe seiner %s-Fähigkeit, die Position der Geister aufdeckt ohne das der Erfolg fehlschlägt.",
	["WaycrestManor_GorakTul"] = "Während der Begegnung mit %s wirft der Boss in regelmäßigen Abständen %s weg, mit denen du die Leichen mit %s verbrennen kannst, damit sie nicht wieder auftauchen können. Sobald der Boss %s gewirkt hat und das dritte Add heraufbeschworen ist, musst du alle Adds vernichten und dann schnell %s verwenden, um ihre Leichen zu verbrennen.",
	["WaycrestManor_Other"] = "Wie der Name des Erfolgs andeutet, handelt es sich um einen berufsbezogenen Erfolg, bei dem du mit Gegenständen interagieren kannst, um Bosse zu beschwören. Um die Gegenstände in den Dungeons verwenden zu können, sind mindestens 75 Fertigkeitspunkte erforderlich.\n\n (Lederverarbeitung) %s - Die Karte, um diesen Boss zu beschwören, befindet sich im Jagdsaal von Kronsteiganwesen in der Ecke des Kamins.\n (Schneiderei) %s - Der '%s' (ein Stoffballen) befindet sich in der Banketthalle im obersten Stockwerk.\n (Kräuterkunde) %s - Die '%s' befindet sich im Brunnen auf der anderen Seite des Innenhofs, wo sich %s befindet.\n (Inschrift) %s - Das '%s' befindet sich in einem Bücherregal im Erdgeschoss auf der linken Seite, kurz bevor man in den Keller hinabsteigt.\n (Kochen) %s - Der Wein befindet sich im Keller in der Nähe anderer Weinfässer.",
	["WaycrestManor_SoulboundGoliath"] = "%s erhält alle 2 Sekunden einen Stapel namens %s. Um diesen Erfolg zu erzielen, musst du den Boss durch die Stellen von %s ziehen, die in der Gegend erscheinen um die %s-Stapel niedrig zu halten.",
}

core:RegisterLocale('deDE', baseLocale)

-- core:RegisterLocale('enUS', baseLocale)
