if(GetLocale() ~= 'frFR') then return end

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["GUI_Achievements"] = "Hauts-faits", --["Achievements"]
    ["GUI_Tactics"] = "Tactiques", --["Tactics"]
    ["GUI_TrackingNumber"] = "Actuellement suivi", --["Currently Tracking:"]
    ["GUI_Options"] = "Options", --["Options:"] --["Main"]
    ["GUI_EnableAddon"] = "Activer l'Addon", --["Enable Addon"]
    ["GUI_Enabled"] = "Activé", --["Enabled"]
    ["GUI_Disabled"] = "Désactivé", --["Disabled"]
    ["GUI_ToggleMinimap"] = "Afficher l'icone de la MiniMap", --["Show Minimap Button"]
    ["GUI_MinimapEnabled"] = "Icone de la MiniMap Activé", -- "Minimap icon enabled"
    ["GUI_MinimapDisabled"] = "Icone de la MiniMap Désactivé", -- Minimap icon disabled"
    ["GUI_AnnounceTracking"] = "Annoncer les hauts-faits pistés au groupe", --L["Announce Achievements Being Tracked To Group"]
    ["GUI_OnlyTrackMissingAchievements"] = "Ne traquer que les hauts-faits manquants", --["Only track missing achievements"]
    ["GUI_AnnounceMessagesToRaidWarning"] = "Envoyer les annonces sur l'Alerte Raid", --["Announce messages to Raid Warning"]
    -- ["GUI_AchievementsDiscordTitle"] = "Achievements Discord", -- "Achievements Discord"
    ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements. \n\nTactiques gentiment contribué par le 'Achievements Discord Server', une communauté où les membres peuvent rencontrer des chasseurs de HF aux vues similaires et former des groupes pour une variété de Hauts-Faits.", -- "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements."
    ["GUI_PlaySoundOnSuccess"] = "Jouer un son quand un haut-fait est accompli", -- "Play a sound when a achievement is completed"
    ["GUI_PlaySoundOnFailed"] = "Jouer un son quand un haut-fait est raté", -- "Play a sound when an achievement fails"
    ["GUI_SelectSound"] = "Selectionner un son", -- "Select Sound"
    ["GUI_TrackingDisabled"] = "Pistage des hauts-faits désactivé", --["(Achievement Tracking Disabled)"]
    ["GUI_EnterInstanceToStartScanning"] = "Entrez dans l'instance pour commencer le scan", --["Enter instance to start scanning"]
    ["GUI_BattleForAzeroth"] = "Battle for Azeroth", --["Battle for Azeroth"]
    ["GUI_Legion"] = "Legion", --["Legion"]
    ["GUI_WarlordsOfDraenor"] = "Warlords of Draenor", --["Warlords of Draenor"]
    ["GUI_MistsOfPandaria"] = "Mists of Pandaria", --["Mists of Pandaria"]
    ["GUI_Cataclysm"] = "Cataclysm", --["Cataclysm"]
    ["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King", --["Wrath of the Lich King"]
    ["GUI_Players"] = "Joueurs", --["Players"]
    ["GUI_Achievement"] = "Haut-fait", --["Achievement"]
    ["GUI_NoPlayersNeedAchievement"] = "Aucun joueur du groupe n'a besoin de ce haut-fait", --["No players in the group need this achievement"]
    ["GUI_PlayersWhoNeedAchievement"] = "Joueurs qui ont besoin du haut-fait", --["Players who need Achievement"]
    ["GUI_ScanInProgress"] = "scan toujours en cours", --["scan still in progress"]
    ["GUI_Tracking"] = "Pistage", --["Tracking"]
    ["GUI_Track"] = "Suivi", --["Track"]
    ["GUI_OutputPlayers"] = "Annoncer les joueurs", --["Output Players"]
    ["GUI_OutputTactics"] = "Annoncer la tactique", --Output Tactics
    ["GUI_OnlyDisplayMissingAchievements"] = "Ne montrer que les hauts-faits manquants", -- "Only display missing achievements"
    ["GUI_GreyOutCompletedAchievements"] = "Griser les hauts-faits complétés", -- "Grey out completed achievements"
    ["GUI_HideCompletedAchievements"] = "Cacher les hauts-faits complétés", -- "Hide completed achievements",
    ["GUI_AchievementsCompletedForInstance"] = "Tous les hauts-faits ont étés achevés pour", -- "All achievements have been completed for"
    ["GUI_EnableAutomaticCombatLogging"] = "Activer automatiquement l'Enregistrement des combats", -- Enable automatic combat logging
	["GUI_Author"] = "Auteur", -- "Author"
    ["GUI_Translators"] = "Traducteurs", -- "Translators"
    ["Gui_TranslatorNames"] = "(EU) Feant-KirinTor et (EU) Snowayway-Elune",
    ["GUI_BlockDisableAddon"] = "Vous ne pouvez pas désactiver l’addon pendant que vous êtes en combat. Attendez jusqu’à ce que vous soyez hors de combat puis essayez à nouveau", -- "You cannot disable the addon while you are are in combat. Wait till you are out of combat then try again"
    ["GUI_DisplayInfoFrame"] = "Activer la fenêtre d'info", -- "Enable Info Frame",
    ["GUI_Tactic"] = "|cffFF4000Tactique|r", -- "Tactic",
    ["GUI_TrackAchievementsInBlizzardUI"] = "Afficher les hauts-faits suivis dans la fenêtre de blizzard", -- "Track achievements in Achievements UI",
    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    ["Core_StartingAchievementScan"] = "Démarrage du scan pour les hauts-faits", --["Starting Achievement Scan For"]
    ["Core_GameFreezeWarning"] = "Cela peut geler votre jeu pour quelques secondes", --["This may freeze your game for a few seconds"]
    ["Core_AchievementScanFinished"] = "Scan des hauts-faits achevés", --["Achievement Scanning Finished"]
    ["Core_EnableAchievementTracking"] = "Voulez-vous activer le pistage des hauts-faits pour", --["Do you want to enable achievement tracking for"]
    ["Core_TrackAchievements"] = "Pistage des hauts-faits", --["Track Achievements"]
    ["Core_Yes"] = "Oui", --["Core_Yes"]
    ["Core_No"] = "Non", --["Core_No"]
    ["Core_AchievementTrackingEnabledFor"] = "Pistage des hauts-faits activé pour", --["Achievement Tracking Enabled for"]
    ["Core_help"] = "aide", --["help"]
    ["Core_Commands"] = "Liste des commandes 'slash'", --["List of slash commands"]
    ["Core_ListCommands"] = "Affiche une liste des commandes 'slash' disponibles", --["shows a list of avaliable slash commands"]
    ["Core_CommandEnableTracking"] = "active/désactive le pistage IAT des hauts-faits", --["enable/disable IAT achievement tracking"]
    ["Core_Enable"] = "active", --["enable"]
    ["Core_NoTrackingForInstance"] = "IAT ne peut pas suivre les hauts-faits de cette rencontre.", -- "IAT cannot track any achievements for this encounter"
    ["Core_Failed"] = "RATÉ!", -- "FAILED!"
    ["Core_PersonalAchievement"] = "Haut-fait personnel", -- "Personal Achievement"
    ["Core_Reason"] = "Raison", -- "Reason"
    ["Core_CriteriaMet"] = "Les critères ont été remplis. Le Boss peut maintenant être tué! ATTENTION: Ce tracker a utilisé les données collectées MANUELLEMENT par les joueurs.", -- "Criteria has been met. Boss can now be killed! Warning: This tracker has used data manually collected by players."
    ["Core_Counter"] = "Compteur", -- "Counter",
    ["Core_CombatLogEnabled"] = "Enregistrement du combat activé", -- "Combat Logging enabled"
    ["Core_CombatLogDisabled"] = "Enregistrement du combat désactivé", -- "Combat Logging disabled"
    ["Core_TranscriptorLogEnabled"] = "Transcriptor Log enabled", -- "Transcriptor Log enabled" **
    ["Core_TranscriptorLogDisabled"] = "Transcriptor Log disabled", -- "Transcriptor Log disabled"
    ["Core_Toggle"] = "bascule", -- "toggle"
    ["Core_CommandToggleTracking"] = "Bascule la fenêtre pour activer ou désactiver le suivi des hauts-faits pour l’instance actuelle", -- "Toggles the window to enable or disable achievement tracking for the current instance"
    ["Core_AlreadyEnabled"] = "IAT est déjà activé pour cette instance", -- "IAT is already enabled for this instance"
    ["Core_EnableAddonFirst"] = "Veuillez d’abord activer IAT dans les options avant d’essayer d'activer le suivi des hauts-faits.", -- "Please enable IAT in the options first before trying to toggle achievement tracking"
    ["Core_CompletedAllAchievements"] = "Vous avez terminé tous les hauts-faits de cette instance", -- "You have completed all achievements for this instance"
    ["Core_IncompletedAchievements"] = "Hauts-faits non-accomplis de cette instance :", -- "Incomplete achievements for this instance"

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------
    ["MobCounter_TimeReamining"] = "Temps restant", -- "Time remaining"
    ["MobCounter_TimerNotStarted"] = "Chrono non démarré", -- "Timer not started"
    ["MobCounter_MobsAlive"] = "%s en vie", -- "%s alive"
    ["MobCounter_MobsKilled"] = "%s tué dans les temps", -- "%s killed in time"
    ["MobCounter_TimerStarted"] = "Chrono démarré %s restant", -- "Timer started %s remaining"

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    ["Instances_Other"] = "Autre", 
    ["Instances_TrashAfterThirdBoss"] = "Trash aprés le 3ème boss", --L["Trash after the third boss"]

    -- ["Features:"] = " Fonctionnalités:",
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
    ["Shared_HasBeenHitWith"] = "a été touché avec", -- "has been hit with"
    ["Shared_PlayersWhoStillNeedToGetHit"] = "Joueurs qui ont encore besoin d'être touchés:", -- "Players who still need to get hit:"
    ["Shared_PlayersWithBuff"] = "Joueurs avec 'buff'", -- "Players with buff"
    ["Shared_PlayersWhoStillNeedToGetResurrected"] = "Les joueurs suivants doivent être ressuscités pour recevoir le haut-fait :", -- "The following players need to be resurrected in order to receive the achievement:"
    ["Shared_HasGained"] = "a gagné", -- "has gained"
    ["Shared_HasLost"] = "a perdu", -- "has lost"
    ["Shared_HasFailed"] = "a échoué", -- "has failed"
    ["Shared_HasCompleted"] = "a achevé", -- "has completed"
    ["Shared_Reason"] = "raison:", -----TODO duplicate -- "reason:"
    ["Shared_PersonalAchievement"] = "Haut-fait personnel", -----------TODO duplicate -- "Personal Achievement"
    ["Shared_Timer10"] = "Compte à rebours démarré! Il reste 10 secondes", --TODO insert number of seconds remaining -- "Timer Started!. 10 seconds remaining"
    ["Completed"] = "Achevé", --TODO wrong format -- "Completed"
    ["Shared_JustKillBoss"] = "Au niveau max, vous pouvez simplement tuer le boss pour obtenir ce haut-fait", -- "At max level, you can simply just kill the boss to get this achievement"
    ["Shared_JustKillBossSingleTarget"] = "Au niveau max, vous pouvez simplement tuer le boss avec des capacités à ciblage unique pour obtenir ce haut-fait", -- "At max level, you can simply just kill the boss with single target abilities to get this achievement"
    ["Shared_GotHit"] = "a été touché", -- "got hit"
    ["Shared_NotHit"] = "n'a pas été touché", -- "did not get hit"
    ["Shared_PlayersHit"] = "Joueurs touchés:", -- "players hit:"
    ["Shared_CompletedBossKill"] = "sera complété une fois le boss tué", -- "will be completed once boss is killed"
    ["Shared_Timer3"] = "Compte à rebours démarré! 3 secondes restantes", --TODO insert number of seconds remaining -- "Timer Started! 3 seconds remaining"
    ["Shared_Countdown20"] = "20 secondes restantes", -- "20 seconds remaining"
    ["Shared_MeetsCritera"] = "répond aux critères de", -- "meets the criteria for"
    ["Shared_DoesNotMeetCritera"] = "ne répond pas aux critères pour", -- "does not meet the critera for"
    ["Shared_HasBeenInfectedWith"] = "a été infecté par", -- "has been infected with"
    ["Shared_SheCanNowBeKilled"] = "Elle peut maintenant être tuée", -- "She can now be killed"
    ["Shared_HeCanNowBeKileld"] = "Il peut maintenant être tué", -- "He can now be killed"
    ["Shared_KillTheAddNow"] = "Tuer les %s maintenant", -- "Kill the %s now"
    ["Shared_FailedPersonalAchievement"] = "%s a raté %s (Raison: %s)(haut-fait personnel)", -- "%s has failed %s (Reason: %s)(Personal Achievement)"
    ["Shared_DamageFromAbility"] = "%s Dégât", -- %s Damage"
    ["Shared_DirectHitFromAbility"] = "%s Coup Direct", -- "%s Direct Hit"
    ["Shared_AddKillCounter"] = "%s compteur de 'kill'", -- "%s kill counter"
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
    ["Shared_WasKilled"] = "a été tué", -- "was killed"
    ["Shared_Found"] = "trouvé", -- "found"
    ["Shared_ReportString"] = "Merci de retourner cette séquence de caractères aux auteurs d'IAT", -- "Please report the following string to the IAT author"
    ["Shared_PlayersWhoNeedAchievement"] = "Joueurs qui ont besoins de ce haut-fait", -- "Players who need achievement"
    ["Shared_HasStolenFrom"] = "a volé de", -- "has stolen from"
    ["Shared_WaitForAnother"] = "Attendre %s pour collecter un autre %s", -- "Wait for %s to collect another %s"

    ["Shared_MissingDebuff"] = "Certains joueurs n'ont pas", -- "Some players are missing"
    ["Shared_JustKillBossesTogether"] = "Au niveau max, vous pouvez simplement tuer les boss en même temps pour obtenir ce haut-fait.", -- "At max level, you can simply just kill the bosses at the same time to get this achievement."
    ["Shared_TrackingStatus"] = "Joueurs avec l'addon", -- "Players with addon"
    ["Shared_Notes"] = "Notes", -- "Notes"
    ["Shared_PlayersRunningAddon"] = "Pour que IAT puisse suivre ce haut-fait avec précision, chaque joueur dans le groupe qui doit avoir l’addon", -- "For IAT to track this achievement accurately, every player is the group needs to be running the addon"
    ["Shared_AchievementFailed"] = "Haut-fait Raté", -- "Achievement Failed"
    ["Shared_TrackingAchievementFor"] = "Pistage du/des haut(s)-fait(s) pour", -- "Tracking achievement for"
    ["Shared_PlayersWithPet"] = "Joueurs avec la mascotte", -- "Players with pet"
    ["Shared_PlayersTwentyFiveyards"] = "Pour que IAT puisse suivre ce haut-fait avec précision, les joueurs doivent être à moins de 25 mètres l’un de l’autre au moment de son 'achèvement'", -- "For IAT to track this achievement accurately, players must be within 25 yards of each other when completing the achievement"
    ["Shared_HitBy"] = "touché par", -- "hit by"
    ["Shared_PlayersWhoDidNotUse"] = "Joueurs qui n'ont pas utilisés", -- "Players who did not use"
    ["Shared_Fails"] = "Ratés", -- "Fails"
    ["Shared_Completed"] = "Achevé", -- "Completed"
    ["Shared_DoNotKillBoss"] = "NE TUEZ PAS LE BOSS!", -- "DO NOT KILL BOSS!"
    ["Shared_HasDied"] = "est mort", -- "has died"
    ["Shared_NOW"] = "MAINTENANT!", -- "NOW!"
    ["Shared_PlayersRunningAddon2"] = "Pour que IAT puisse suivre ce haut-fait avec précision, les joueurs qui collectent des objets doivent avoir l’addon", -- "For IAT to track this achievement accurately, players collecting items need to be running the addon"
    ["Shared_Killed"] = "tué", -- "killed"
    ["Shared_HasCaught"] = "a attrapé", -- "has caught"
    ["Shared_AutomaticTracking"] = "Pour que IAT puisse suivre ce haut-fait AUTOMATIQUEMENT, les joueurs qui collectent des objets doivent avoir l’addon", -- "To track this achievement AUTOMATICALLY, players collecting items need to be running the addon"
    ["Shared_ManualTracking"] = "Pour que IAT puisse suivre ce haut-fait MANUELLEMENT, les joueurs doivent taper combien d’éléments ils ont recueillis dans le chat. (+3, -2 etc)", -- "To track this achievement MANUALLY players must type how many items they have collected into chat. (+3, -2 etc)"
    ["Shared_AutomaticCounter"] = "Compteur Automatique", -- "Automatic Counter"
    ["Shared_ManualCounter"] = "Compteur Manuel", -- "Manual Counter"
    ["Shared_AddsKilled"] = "Adds tués", -- "Adds killed"


-- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH -- -- BATTLE FOR AZEROTH --


    -------------------------------------------------------
    --- Ny’alotha, the Walking City
    -------------------------------------------------------
    --Tactics
    ["Ny’alotha_WrathionTheBlackEmperor"] = "Pour ce haut-fait vous devez éliminer 10 %s en 3 secondes. Vous pouvez facilement le faire en désignant 3 joueurs pour prendre %s en Phase 2 puis en les laissant marcher sur les éclats en même temps.\n\n %s du Chasseur de démon et %s du Moine sont d'excellents sorts pour ce combat, comme ils permettent de faire plusieurs éclats instantanément.",
    ["Ny’alotha_Maut"] = "Pour ce haut-fait vous devez surcharger une %s en la laissant 'soak' une orbe de mana pendant la Phase 2, la tuer et ensuite vaincre %s.\n\n Pour rendre ce haut-fait plus simple, demandez à un troisième tank de garder %s loin du boss et de la tanker dans une %s jusqu'à que la Phase 2 commence.\n\n Une fois l'add transformé en %s, utilisez %s et atomisez l'add avant la fin de la canalisation de %s.",
    ["Ny’alotha_TheProphetSkitra"] = "Pour ce haut-fait vous devez vaincre %s et ses deux clones après avoir engagé %s.\n\n %s est trouvable au fond du couloir sur la gauche avant d'aller sur %s. Soyez sûr d'éliminer tous les 'trashs' sur le chemin ainsi que ceux dans la salle du boss avant d'engager %s.\n\n Après le début du combat, deux clones de %s vont apparaître. Utilisez %s et tuez les disciples, vous pouvez ensuite finir le boss et obtenir le haut-fait.",
    ["Ny’alotha_DarkInquisitorXanesh"] = "Pour ce haut-fait vous devez éliminer un %s trois fois, avec à chaque fois moins de 3 secondes restantes sur le debuff %s .\n\n Pour obtenir le debuff %s, les joueurs doivent absober les zones de %s. De là, faites des passes d'%s entre deux joueurs, approchez le du portail et éliminez le quand le debuff %s va expirer dans les 3 secondes.\n\n Note: Assurez-vous de prendre en compte le temps de déplacement de l'orbe, même si vous êtes proche du portail cela prendra 1 ou 2 secondes en plus à l'orbe pour être éliminé.\n\n Important: Si le debuff %s a expiré et que l'%s est rentré, ça ne comptera pas et vous devrez le refaire une nouvelle fois.",
    ["Ny’alotha_TheHivemind"] = "Pour ce haut-fait vous devez trouver et ramasser trois %s et les ramener au combat contre %s.\n\n Vous trouverez un spécimen près de l'entrée de la Gueule de Gor'ma (sur la droite), un dans la Chambre du Rituel (avant %s) et le dernier juste avant %s.\n\n Commencez le combat et les trois spécimens vont évoluer peu de temps après. Utilisez %s, atomisez les %s et finissez le boss pour avoir le haut-fait.\n\n Note: Les joueurs qui prennent les spécimens auront le buff: %s. Si le buff disparaît pour une raison quelconque, les spécimens réapparaîtront à leur position originale.",
    ["Ny’alotha_ShadharTheInsatiable"] = "Pour ce haut-fait tout le monde dans le raid doit /cajoler %s et avoir le debuff %s.\n\n Note: Chaque fois que quelqu'un /cajole %s, il obtiendra un buff de hâte et ne mordra personne d'autre pendant 5 secondes. Les joueurs doivent /cajoler pendant le combat jusqu'à que tous obtiennent le debuff.\n\n Note: Les sorts d'immunité comme le Bouclier Divin du paladin font disparaître le debuff, faites attention.",
    ["Ny’alotha_Drestagath"] = "Pour ce haut-fait vous devez déclencher %s deux fois en 60 secondes.\n\n Strategie: Tuez les tentacules jusqu'à que %s atteigne 80 d'énergie et attendez que les tentacules réapparaissent. Une fois que 4+ tentacules sont apparus, tuez-en un pour que %s atteigne 100 d'énergie et canalise %s.\n\n De là, utilisez %s et tuez tous les tentacules restants ainsi que les nouveaux qui apparaissent pendant le chrono de 1 minute.",
    ["Ny’alotha_Vexiona"] = "Pour ce haut-fait tous les joueurs dans le groupe doivent se faire toucher par %s au moins 30 fois avant de vaincre %s.\n\n Soyez rassemblé en un groupe, le tank doit faire en sorte que %s fasse face au groupe, et utilisez les CD defensifs de raid comme %s, %s et %s une fois que l'add commence à canaliser %s.\n\n Comme vous ne pouvez pas atteindre 30 stacks en une seule canalisation, vous devrez faire ceci plusieurs fois. Faites en sorte d'établir une rotation entre les CD defensifs de raid et ceux qui sont personnel.",
    ["Ny’alotha_RadenTheDespoiled"] = "Pour ce haut-fait les joueurs doivent détruire 2 obelisques en utilisant le %s que vous obtenez grâce à %s. Pour déclencher %s, les joueurs doivent tuer %s.\n\n Note: Vous aurez besoin de cinq joueurs pour diriger le %s vers les obélisques en faisant face avec leur personnage dans la direction des obélisques.",
    ["Ny’alotha_IlgynothCorruptionReborn"] = "Pour ce haut-fait vous devez vaincre 10 %s en moins de 3 secondes. Le meilleur moment pour completer ce haut-fait est soit peu après la première intermission ou bien à la fin du combat quand les %s apparraissent constamment.\n\n Une fois que 10 ou plus %s sont en vie, groupez vous, utilisez %s, les CD defensifs de raid (tels que %s et %s) et atomisez les adds.",
    ["Ny’alotha_CarapaceOfNZoth"] = "Pour ce hait-fait votre raid va devoir se séparer en deux, descendez tous les %s à 10%%-15%% hp, et ensuite tuez les en 10 secondes.\n\n Notez que %s n'est pas nécessaire pour cette phase, vous pouvez la garder pour la Phase 3. Tant que les joueurs utilisent leurs CD et essences pour détruire les excroissances, vous ne devriez avoir aucun problème pour les vaincre en 10 secondes.",
    ["Ny’alotha_NZothTheCorruptor"] = "Pour ce haut-fait tout le monde dans le groupe devra être à 0 %s pour avoir %s et ensuite vaincre %s. Ce haut-fait est réalisé en Phase 3 (en Normal ou Heroïque), à la fin de l'affrontement.\n\n Une fois que tous les joueurs sont sous 50 %s et que le boss est environ à 15%%-20%% hp, laissez %s finir sa canalistaion de %s sans personne pour la 'soak'. Tout le monde atteindra donc 0 %s, recevra le %s et vous pourrez utiliser %s pour annihiler N'Zoth.\n\n Astuce: En Phase 3, les joueurs avec beaucoup de %s devraient toujours 'soak' %s et les joueurs avec peu de %s devraient utiliser un tick de %s pour éviter d'avoir %s trop tôt.\n\n Astuce: Si certains joueurs ont trop de %s, ils peuvent rester dans %s pour la perdre rapidement.",

    --Chat Output
    ["OrbNotReturnedSuccessfully"] = "L'orbe n'a pas été éliminé avec succès",
    ["OrbNotReturnedTimeLimit"] = "L'orbe n'a pas été éliminé dans le temps imparti",

    -------------------------------------------------------
    --- The Eternal Palace
    -------------------------------------------------------
    --Tactics
    ["AzsharasEternalPalace_AbyssalCommanderSivara"] = "Les trois lieutenants requis pour ce haut-fait se trouvent dans les 'trashs' avant le %s. Il suffit de tuer tous les 'trashs' du milieu et du côté droit de la pièce. \n\nVous pouvez utiliser quatre tanks, mais si votre troisième tank est bien équipé, il n’est pas nécessaire d’en avoir un quatrième. \n\n%s lance %s. Pour supprimer cet effet, vous pouvez éloigner tous les lieutenants de la bannière ou demander à un dps distance de la détruire. \n\n%s lance %s. Il suffit de s’éloigner pendant la canalisation pour éviter les dégâts. Elle lance également %s et %s qui feront des dégâts mineurs. \n\n%s lance également de temps en temps %s, ce qui guérit un de ses alliés pour 35%% de leur santé maximale. Il n’est pas nécessaire de l'interrompre, assurez-vous simplement que le lieutenant est loin du %s. \n\n%s lance %s qui 'fear' tout le monde à proximité. Le troisième ou quatrième tank doit interrompre ce sort à chaque fois qu’il est lancé.",
    ["AzsharasEternalPalace_BlackwaterBehemoth"] = "Pour ce haut-fait, vous devrez affecter quelques personnes pour nager dans toute la zone et recueillir des échantillons de vie marine :\n -%s\n -%s\n -%s\n -%s\n\nUne fois que vous avez prélevé 50 échantillons, vous pouvez tuer le boss.\n\nAssurez-vous que les joueurs assignés passent en spécialisation 'tank', car de cette façon ils ne seront pas touchés par %s. Si vous avez des druides dans votre groupe, ils devraient être assignés à recueillir les échantillons car ils nageront plus grâce à leur %s.\n\nNotez que les joueurs assignés doivent tapper le boss au moins une fois, sinon ils pourraient ne pas obtenir la validation du haut-fait.",
    ["AzsharasEternalPalace_RadianceOfAzshara"] = "Pour ce haut-fait, vous devrez exécuter 6 tours complets consécutifs sans tomber dans l’eau.\n\nAprès trois tours, vous obtiendrez le debuff %s 'A mi-chemin de la ligne d'arrivée !' et après avoir couru trois tours de plus, vous obtiendrez un autre debuff %s 'Course de fond accomplie'.\n\nCe haut-fait est une réalisation personnelle.\n\nAssurez vous de garder tous vos gros CDs de DPS pour la gestion de l'add %s, car si vous le tuez suffisamment vite, vous n’aurez pas à gérer les %s.\n\nEvitez à tout prix d’être touché par une %s puisque le fait de reculer peut supprimer le debuff %s. Les 'tanks' doivent également se méfier du %s et de la façon dont ils se positionnent pour ne pas être projetés dans l’eau.",
    ["AzsharasEternalPalace_LadyAshvane"] = "Pour ce haut-fait, vous devrez vous assurer que les 3 sorts d'%s traverse Lady Ashvane. Si possible, essayez, en plus, de vous positionner derrière une %s pour la détruire en même temps.\n\nEn difficulté normale ce haut-fait est assez facile à faire et avec suffisamment de dps vous pouvez sauter les %s de la deuxième phase (la deuxième fois que le bouclier est cassé).",
    ["AzsharasEternalPalace_Orgozoa"] = "Pour ce haut-fait, vous devrez affecter une personne pour attraper l'œuf %s pendant l’intermède en se tenant sur le bord de la plate-forme juste avant la descente. La personne qui attrape l’œuf devra alors l’amener en bas tout en évitant la %s et les %s pendant la descente. La personne qui porte l’œuf ne doit plus utiliser de capacités jusqu'à la fin du combat, sinon elle le laissera tomber.\n\nS’assurer de NE PAS interrompre %s trop tôt, car la personne qui transporte l’œuf sera ralentie de 30%% (%s). Un prêtre peut aider avec %s et %s.",
    ["AzsharasEternalPalace_TheQueensCourt"] = "Pour obtenir %s vous devrez, pendant le combat, effectuer les bons rituels (émotes) quand un certain décret est actif :\n\n -%s - /salut ou /salute\n -%s - /courbette ou /curtsey\n -%s - /applaudir ou /applause\n -%s - /ramper ou /grovel\n -%s - /genou ou /kneel\n\nCe haut-fait est une réalisation personnelle.\n\nIl est vivement conseillé de préparer, avant la rencontre, une macro pour chaque décret.\nExemple de macro pour le décret En formation :\n/tar Reine Azshara\n/salut\n/targetlasttarget",
    ["AzsharasEternalPalace_ZaquiHarbingerOfNyalotha"] = "Pour ouvrir un portail vers le niveau secret des vaches, vous devrez activer 6 runes ( les cercles orange au sol ). Pour ce faire,  dans la phase 4, les joueurs devront rester sur chacune d’elles, être affecté par %s, puis se le faire dispel laissant au sol une %s qui va activer la rune sur laquelle elle se trouve.\n\nQuand les 6 runes auront étés activés, un portail s’ouvrira au milieu de la salle. Placez vous proche de ce portail, puis appuyez sur l'extra-bouton qui vous basculera dans le niveau secret des vaches! Vous aurez alors un temps limité pour vachisider 10 %s.",
    ["AzsharasEternalPalace_QueenAzshara"] = "Pour obtenir ce haut-fait, vous devrez vaincre %s avec un seul joueur en vie et ce joueur devra avoir le 'buff' %s sur lui.\n\nLa fin du combat devrait ressembler à quelque chose comme ceci :\n - Descendre le boss à 500k points de vie.\n - Tout le monde, sauf les 2 tanks et 1 heal, restent dans les sceaux pour accumuler 10 stacks de %s et mourir.\n - Les 3 joueurs restants doivent maintenant descendre le boss à 200k points de vie, puis arrêter tous dps.\n - Utiliser %s jusqu’à ce que l’un des tanks obtienne le buff %s.\n - le tank sans le buff et le healer doivent maintenant rester à leur tour dans les sceaux pour mourir.\n - Une fois que Tank avec le buff est le seul joueur vivant, il peut finir de tuer le boss et obtenir la validation du haut-fait pour l'ensemble du raid.",

    --Chat Output
    ["AzsharasEternalPalace_SamplesCollected"] = "Echantillons collectés", -- "Samples collected",
    ["AzsharasEternalPalace_Salute"] = "salut", -- Salute
    ["AzsharasEternalPalace_Curtsey"] = "courbette", -- Curtsey
    ["AzsharasEternalPalace_Grovel"] = "ramper", -- Grovel
    ["AzsharasEternalPalace_Kneel"] = "genou", -- Kneel
    ["AzsharasEternalPalace_Applause"] = "applaudir", -- Applause
    ["AzsharasEternalPalace_TargetAndPerformEmote"] = "Visez %s et /%s MAINTENANT!",

    -------------------------------------------------------
    --- Crucible Of Storms - Creuset des Tempêtes
    -------------------------------------------------------
    --Tactics
    ["CrucibleOfStorms_TheRestlessCabal"] = "Pendant le combat, %s lancera %s. Cela produira des météores violets qui rebondiront dans la pièce jusqu’à ce qu’ils touchent un joueur. Le rayon d’impact et les dommages se réduiront à rebond sans être absorbé (jusqu’à un maximum de deux fois). Évitez simplement toutes les %s jusqu’à ce que vous en ayez 10, puis tuez le boss. \n\nVous n’avez besoin que de 10 %s actives à un moment donné pendant le combat. Il est recommandé de le faire au début du combat.",
    ["CrucibleOfStorms_UunatHarbingerOfTheVoid"] = "Pour ce haut-fait, vous ne devez PAS bouger tant que l’œil de %s est ouvert. Ce haut-fait est personnel, et vous ne pouvez pas l’obtenir pendant que vous êtes mort. \n\nL’œil de %s s’ouvre lorsque Uu’nat lance %s, %s ou %s, donc arrêtez de bouger complètement lorsque le boss a accumulé près de 100 points d'énergies. Vous ne devez PAS bouger tant que l’œil de %s ne soit pas complètement fermé, ce qui se produit autour de 40 points d'énergies. L’œil est également ouvert pendant les transitions à environ 70%% et 45%%.",

    --Chat Output
    ["CrucibleOfStorms_StopMoving"] = "NE BOUGEZ PLUS!",
    ["CrucibleOfStorms_StartMoving"] = "VOUS POUVEZ BOUGER!",

   -------------------------------------------------------
    --- Battle of Dazar'alor - Bataille de Dazar'alor
    -------------------------------------------------------
    ["BattleOfDazaralor_ChampionOfTheLight_Alliance"] = "Pour réaliser ce haut-fait, vous devrez voler 3 objets à chacun des ennemis de la rencontre et les amener au Tas de déchets mystérieux. Vous devrez voler 9 objets au total: 3 de %s, 3 de %s et 3 de %s.\n\n En outre, ce haut-fait requiert que tout le monde dans le raid interagisse avec le Tas de déchets mystérieux pour obtenir le debuff %s. Pendant le combat contre le boss, les joueurs seront transformés en %s et auront un extra-bouton à utiliser sur les ennemis pour leur voler un objet.\n\n Une fois que votre groupe de raid aura remis les 9 objets (3 de chaque type de PNJ) vous pourrez tuer le boss et obtenir la validation du haut-fait.",
    ["BattleOfDazaralor_ChampionOfTheLight_Horde"] = "Pour réaliser ce haut-fait, vous devrez voler 3 objets à chacun des ennemis de la rencontre et les amener au Tas de déchets mystérieux. Vous devrez voler 9 objets au total: 3 des %s, 3 des %s et 3 des %s.\n\n En outre, ce haut-fait requiert que tout le monde dans le raid interagisse avec le Tas de déchets mystérieux pour obtenir le debuff %s. Pendant le combat contre le boss, les joueurs seront transformés en %s et auront un extra-bouton à utiliser sur les ennemis pour leur voler un objet.\n\n Une fois que votre groupe de raid aura remis les 9 objets (3 de chaque type de PNJ) vous pourrez tuer le boss et obtenir la validation du haut-fait.",
    ["BattleOfDazaralor_JadefireMasters"] = "Pour ce haut-fait, vous devrez récupérer l'%s caché dans l'arène des boss, le protéger des incendies et laisser le boss moine lancer %s dessus. \n\n Vous devriez récupérer l'œuf après la première série de %s, ainsi vous ne risquez pas de perdre l’œuf dans une %s. Assurez-vous de le récupérer avant le début de la phase 2, car %s le casserait. \n\n Le moine se transformera en %s à 100 énergies. Après que %s ait atteint le joueur qui porte l'œuf, vous pouvez tuer le boss pour obtenir la validation du haut-fait. \n\n Les emplacements de l'%s sont différents pour la Horde et l'Alliance.",
    ["BattleOfDazaralor_Grong_Alliance"] = "Pour ce haut-fait, vous devrez transporter et placer au sol 6 barils avant le combat contre %s. Vous pouvez trouver les %s à côté des escaliers avant de monter vers la zone du boss.\n\n Placer les %s sur le sol, engager le boss, et s’assurer que les barils soient touchés par %s.\n\n Une fois que les %s sont détruits, le boss gagnera un buff de bonus aux dégats de 20%% par baril détruit pour 30 secondes (%s). Une fois tous les barils détruits, tuez le boss et vous obtiendrez la validation du haut-fait.",
    ["BattleOfDazaralor_Grong_Horde"] = "Pour ce haut-fait, vous devrez transporter et placer 6 barils au sol avant le combat contre %s. Vous pouvez trouver les %s à côté des escaliers avant de monter vers la zone du boss.\n\n Placer les %s sur le sol, engager le boss, et s’assurer que les barils soient touchés par %s.\n\n Une fois que les %s sont détruits, le boss gagnera un buff de bonus aux dégats de 20%% par baril détruit pour 30 secondes (%s). Une fois tous les barils détruits, tuez le boss et vous obtiendrez la validation du haut-fait.",
    ["BattleOfDazaralor_Opulence"] = "Pour obtenir ce haut-fait, vous devrez d’abord vous assurer qu’au moins un joueur possède la mascotte %s.\n\n La validation est personnelle et exige que le joueur utilise la commande /praise ou /louer sur la mascotte %s, sous l’effet d’une %s. La mascotte n’a pas besoin d’être la vôtre. \n\n Pour bénéficier du buff %s, un ou plusieurs joueurs devront ramasser des %s. Ce caillou donnera au joueur qui le possède un stack de %s toutes les secondes, tant qu'il reste éloigné des autres joueurs. En atteignant 100 stack, il gagnera l'aura %s pendant 20 secondes, accordant au joueur et à tous les joueurs voisins %s, augmentant le taux critique de 100%%. Il devra alors se rapprocher des autres joueurs pour qu'ils puissent bénéficier du buff et utiliser la commande /louer sur la mascotte pour valider le haut-fait.",
    ["BattleOfDazaralor_ConclaveOfTheChosen"] = "Pour obtenir ce haut-fait, vous devrez laisser l’un des trois raptors initiaux en vie jusqu’à la fin du combat. Vous pouvez tuer le reste, mais puisque vous ne pouvez pas les CC, vous aurez besoin d'en 'kite' un pendant toute la durée du combat.\n\n Un joueur différent sera fixé par le %s toutes les 20 secondes (%s), donc vous devrez vous assurer que ce joueur l'emmène loin du raid pour éviter tout dommage AoE.\n\n Un ou deux DK peuvent être utiles dans ce combat car ils peuvent utiliser leur capacité %s sur le raptor afin de l'éloigner du raid.",
    ["BattleOfDazaralor_KingRastakhan"] = "Pour faire ce haut-fait, vous aurez besoin de garder les 'adds' fantômes vivants jusqu’à la fin du combat. Il suffit de les éloigner du raid pour éviter les dégâts malencontreux.\n\n Un troisième Tank est idéal.",
    ["BattleOfDazaralor_HighTinkerMekkatorque"] = "Pour ce haut-fait, vous aurez besoin d’un ingénieur avec %s et %s.\n\n Invoquer les deux Blingotrons avant de commencer le combat et ils vont commencer un duel. Engagez le boss et peu de temps après, le %s va apparaitre. Il est facile à tuer, alors détruisez le, Puis, finissez le combat contre le boss et vous devriez avoir la validation du haut-fait.\n\n %s possède deux capacités :\n %s - capacité AoE de  8 mètres autour de lui, donc éloignez-vous si vous êtes au CaC.\n %s - donc restez éloignés les uns des autres, ou, plus simplement, interrompez le sort.",
    ["BattleOfDazaralor_StormwallBlockade"] = "Pour accomplir ce haut-fait, vous devrez invoquer le %s pendant le combat contre le Boss. Vous n’aurez pas besoin de le tuer (%s).\n\n Pour invoquer le %s, vous devrez cliquer sur un banc de poissons à gauche des quais, après que le boss ai été engagé. Idéalement, un seul joueur restera derrière sur les quais pour l’invoquer. Ce joueur devra faire face à quelques mécaniques spéciales pendant 2 minutes.\n\n - Après avoir cliqué sur le banc de poisson, le joueur va commencer à tirer une corde hors de l’eau, et ils vont commencer à se faire lentement tirer hors de l’eau. Marchez dans la direction opposée pour rester sur les quais, mais ne marchez pas trop loin du bord ou la corde se cassera.\n - Peu de temps après, une %s va commencer à s'avancer vers le joueur qui devra les esquiver pour rester en vie.\n - Après cela, les vagues vont s’écraser sur les quais, et le joueur tirant la corde devra les esquiver.\n\n Cela durera 2 minutes, le temps que le cast du sort du tirage de corde se termine. Le reste du raid doit effectuer le combat du boss comme d’habitude.\n\n Une fois le %s apparu, le joueur invoquant, et plus tard, le raid, devront faire face à ses deux capacités en même temps que les capacités normales du boss :\n %s - Un cône frontal qui repoussera n’importe qui vers l’eau\n %s - Tire tous les joueurs vers %s, tuant instantanément ceux qui sont trop proches.\n\n Pour gérer le %s, vous aurez idéalement un Voleur qui se consacrera à l’étourdir chaque fois qu’il lancera %s. Si vous n’avez pas de Voleur, alors vous devrez faire une rotation de cc. Le reste du raid devra tuer le boss avant son 'enrage', tout en faisant attention à l'%s.",
    ["BattleOfDazaralor_JainaProudmoore"] = "Pour accomplir ce haut-fait, vous aurez d’abord besoin de 3 joueurs pour collecter des monticules de neige pendant la lutte contre %s.\n\n Les monticules de neige ne peuvent être trouvés que lors du premier entracte. Les monticules de neige seront uniformément répartis autour de la zone circulaire de sorte que vous aurez besoin d’au moins 3 joueurs 'rapide' pour commencer à courir dès que la phase commence.\n\n Marchez à travers un monticule de neige et un petit flocon de neige apparaîtra à côté de votre personnage. Une fois que les 3 ont été trouvés, interrompez le boss pour entrer dans la phase suivante. Les joueurs qui ont le flocon de neige devront se tenir l'un sur l'autre près de l’un des barils pour créer les %s.\n\n Utiliser les %s pour retirer les %s du baril à côté des %s, puis attaquer le baril. L’explosion fera fondre les %s, ce qui a permettra de valider les critères de validation ce haut-fait.",

    --Chat Output
    -- ["BattleOfDazaralor_PraiseEmote"] = "Vous louez %s", -- "You praise %s"
    ["BattleOfDazzarlor_BarrelsDestroyed"] = "Barils détruits", -- "barrels destroyed"
    ["BattleOfDazzarlor_PraiseSelf"] = "Vous faites l’éloge de", -- "You lavish praise upon"
    ["BattleOfDazzarlor_PraiseOther"] = "fait l’éloge de", -- "lavishes praise upon"
		-- string.match(message
		-- 14 InstanceAchievementTracker\AchievementTrackerCore.lua
		-- 04 InstanceAchievementTracker\BattleForAzerothRaids\BattleOfDazaralor.lua
		-- 04 InstanceAchievementTracker\CataclysmRaids\DragonSoul.lua
		-- 03 InstanceAchievementTracker\LichKingDungeons\UtgardePinnacle.lua
		-- 04 InstanceAchievementTracker\PandariaRaids\MogushanVaults.lua
    ["BattleOfDazzarlor_PlayersTransformed"] = "Certains joueurs sont actuellement transformés. Ne tuez PAS le boss maintenant!", -- "Some players are currently transformed. Do not kill boss yet"
    ["BattleOfDazzarlor_OpulenceRangeWarning"] = "Avertissement : Pour que IAT suive correctement ce HF, %s doit être dans un rayon de 25 mètres des joueurs louant les %s. Les joueurs avec les %s devraient se tenir ensemble pour rendre cela plus facile", -- "Warning: For IAT to track this achievement correctly, %s must be within 25 yards of players praising the %s. Players with the %s should stand together to make this easier"

    -------------------------------------------------------
    --- Uldir - Uldir
    -------------------------------------------------------
    --Tactics
    ["Uldir_Taloc_Tactics"] = "Pour ce Haut-Fait, vous devrez recueillir 4 %s tandis que l’ascenseur descend dans la phase 2.\n\n Les positions des orbes semblent être aléatoires, mais un Chasseur de démons peut facilement les recueillir toutes en utilisant %s et %s",
    ["Uldir_MOTHER_Tactics"] = "Pour entrer le 'mot de passe' vous devrez cliquer sur les boutons dans chaque salle dans un ordre spécifique qui est aléatoire pour chaque groupe. L’ordre peut être 321, 213, 231 ou des combinaisons similaires.\n\n Vérifiez si les boutons de la première salle cessent de clignoter, puis envoyer un groupe de 2-3 dps et un healer pour cliquer sur les boutons dans la deuxième et la troisième salle. Si les boutons sont activés dans la bonne séquence, ils cesseront de clignoter et ne seront plus cliquables. Une fois que vous avez fait cela, vous pouvez tuer le boss et obtenir le Haut-Fait.",
    ["Uldir_Fetid_Devourer_Tactics"] = "Chaque quatrième attaque de mêlée le boss lancera %s sur la cible la plus proche du tank actuel, un coup qui inflige des dommages physiques égal à 300%% d’une attaque de mêlée standard.\n\n Chaque joueur devra être frappé, et il est recommandé d’utiliser un CD personnel lorsque cela se produit. Le combat lui-même n’est pas si difficile, mais vous devriez prioriser les gens sans un bon CD défensif, car le boss enrage à 50%% (%s)",
    ["Uldir_ZekVoz_Tactics"] = "Ce Haut-Fait est assez facile, mais vous devrez utiliser la IAT_64482 après la disparition de la IAT_135129 à la phase 2. Le puzzle s’activera la prochaine fois que la IAT_135129 apparaîtra (la deuxième fois), ce qui aidera vos healer pour les soins et la mana. (vous n’aurez pas à gérer avec la mécanique plus d'une minute).\n\n Les %s infligent entre 25k et 35k de dégâts, donc assurez-vous de les esquiver ( cercle violet sous les pieds ) autant que possible afin que vos healer ne soient pas submergés.",
    ["Uldir_Vectis_Tactics"] = "IAT_142148 est situé sur la plateforme juste avant de passer à IAT_134442.\n\n Après avoir obtenu le debuff %s sur elle, vous pouvez la tuer en toute sécurité, puis tuer le boss et vous obtiendrez le Haut-Fait.",
    ["Uldir_ZulReborn_Tactics"] = "Ce Haut-Fait est assez simple, personne ne doit marcher sur l’anneau intérieur de la plate-forme. Voici quelques conseils pour la rencontre :\n\n les Tanks devronts récupérer tous les adds, et les packs de sorte que les dps de melee puissent cleave.\n Les dps distance devront rester sur le boss tout le temps, et ne devraient pas toucher aux adds à moins que les dps de melee n'arrivent pas à les tuer à temps.\n Si vous avez 2 prêtres dans le groupe, alors vous devriez les affecter à des positions différentes (gauche et droite à l’extérieur du groupe) de sorte que les deux côtés soient couverts quand les adds appraîtront.\n À 40%% IAT_138967 fera tomber tout le monde, alors vous devriez vous placer près d’un mur pour ne pas vous faire éjecter de la plateforme.",
    ["Uldir_Mythrax_Tactics"] = "Vous devez ramasser uniquement les orbes que vous avez fait apparaître. Du à de nombreux bug, il est conseillé de faire ce HF Sans Pet.",
    ["Uldir_GHuun_Tactics"] = "Pour ce Haut-Fait, vous devrez faire des groupes de 3 personnes pour faire les %s : 2 dps + 1 healer pour les aider.\nFonctionne : Transfert du mage, ?\nNE fonctionne PAS : Portail de démo, Transcendence du moine, ?",

    -------------------------------------------------------
    --- Operation: Mechagon
    -------------------------------------------------------
    --Tactics
    ["OperationMechagon_KingGobbamak"] = "Pour compléter ce haut-fait, vous devez garder l'%s qui se trouve derrière le %s chargé, pendant tout le combat. Pour charger l'%s, il suffit qu'un joueur se précipite sur l'appareil quand le joueur a une %s (que vous obtenez d'un %s). La façon la plus simple de procéder est d’avoir 2 joueurs qui chargent à tour de rôle l'%s toutes les 15 secondes.\n\Note : assurez-vous que les joueurs qui ont la %s destinée à l'%s ne se déplacent pas trop près du %s ou de la %s.",
    ["OperationMechagon_Gunker"] = "Après avoir engagé le boss, 5 bestioles qui ressemblent à des grues vont apparaître dans l’eau autour du boss. Il suffit de les attraper et de les amener à un %s pour les nettoyer. Après en avoir nettoyés 5, vous pourrez tuer le boss.",
    ["OperationMechagon_TussleTonks"] = "Pour compléter ce haut-fait, engagez d’abord le boss puis positionnez %s vers %s qui se trouve à gauche du boss sur le rebord de l’arène.\n\n Attendre ensuite que %s touche %s avec %s, ce qui fera tomber %s du rebord. Une fois %s au sol, l'emmener à l’un des %s, attendre qu’il soit touché puis tuer le boss pour valider le haut-fait.",
    ["OperationMechagon_MachinistsGarden"] = "Ce haut-fait est une réalisation personnelle et vous demande d'esquiver les mécaniques suivantes :\n\n %s, %s, %s, %s, %s",
    ["OperationMechagon_KeepDpsingAndNobodyExplodes"] = "Pour réaliser ce haut-fait, vous devrez tuer tous les boss du donjon en hard mode.\n\n Les trois premiers boss doivent être tués alors que l'%s plane au-dessus d'eux. L'%s fera apparaître des %s tout au long des combats. Ils sont immunisés contre les dommages ( mais on peut les CC ) et suivront les joueurs jusqu’à ce qu’ils atteignent 100 points d'énergies et s'autodétruisent.\n\n Pour le combat contre %s, l'%s est remplacé par l'%s. Cela ajoute une mécanique supplémentaire appelée %s dont les dégâts devront être partagés par tous les joueurs (rayon de 6 mètres). Il y aura aussi un rayon (%s) qui devra être évité.\n\n Pour le combat contre %s, vous devrez cliquer sur le %s au sol avant d'engager le boss. Cela ajoutera une mécanique supplémentaire au combat appelé %s qui ajoute un debuff de lenteur au groupe.\n\n Pour le combat contre %s, vous devrez cliquer sur le petit bouton rouge avant de commencer le combat. %s se joindra à la fête, qui, à 0 point énergie, explosera et tuera tout le groupe! Pour éviter cela, il y a 4 panneaux autour de la salle qui s’activent lorsque %s atteintra 35 points d'énergies. Les panneaux affichent une séquence de 4 couleurs dans un ordre aléatoire. Une fois la séquence terminée, 4 joueurs du groupe doivent répéter la séquence en cliquant sur chacun des panneaux dans le même ordre. Si elle est effectuée correctement, l’énergie de l'%s sera complètement rétablie.",
    ["OperationMechagon_HertzLocker"] = "Pour réaliser ce haut-fait, vous devrez tuer tous les boss du donjon en hard mode sans qu'aucun joueur du groupe ne meure.\n\n Les trois premiers boss doivent être tués alors que l'%s plane au-dessus d'eux. L'%s fera apparaître des %s tout au long des combats. Ils sont immunisés contre les dommages ( mais on peut les CC ) et suivront les joueurs jusqu’à ce qu’ils atteignent 100 points d'énergies et s'autodétruisent.\n\n Pour le combat contre %s, l'%s est remplacé par l'%s. Cela ajoute une mécanique supplémentaire appelée %s dont les dégâts devront être partagés par tous les joueurs (rayon de 6 mètres). Il y aura aussi un rayon (%s) qui devra être évité.\n\n Pour le combat contre %s, vous devrez cliquer sur le %s au sol avant d'engager le boss. Cela ajoutera une mécanique supplémentaire au combat appelé %s qui ajoute un debuff de lenteur au groupe.\n\n Pour le combat contre %s, vous devrez cliquer sur le petit bouton rouge avant de commencer le combat. %s se joindra à la fête, qui, à 0 point énergie, explosera et tuera tout le groupe! Pour éviter cela, il y a 4 panneaux autour de la salle qui s’activent lorsque %s atteintra 35 points d'énergies. Les panneaux affichent une séquence de 4 couleurs dans un ordre aléatoire. Une fois la séquence terminée, 4 joueurs du groupe doivent répéter la séquence en cliquant sur chacun des panneaux dans le même ordre. Si elle est effectuée correctement, l’énergie de l'%s sera complètement rétablie.",

    --Chat Output

    -------------------------------------------------------
    --- Atal Dazar - Atal Dazar
    -------------------------------------------------------
    --Tactics
    ["AtalDazar_Other"] = "La IAT_122969 lancera tout au long du donjon des %s sur un joueur aléatoire qui le transformera en petit raptor pendant 5 secondes, et à la fin de sa durée, toute personne qui se tient près de ce joueur sera également transformé.\n\nAvant de pull une IAT_122969, il vous faudra nettoyer tous les trashs du donjon. Vous devrez promener l’add à chaque boss, et si vous avez une classe avec un long cc (comme Moine avec %s, Chasseur avec %s, Mage avec %s) alors vous devrez le garder sous contrôle jusqu’à la fin du combat. Si vous n’avez pas de classe avec CC, vous devrez simplement vous concentrer sur l’interruption de son sort %s tout le long du combat.",
    ["AtalDazar_Priestess_AlunZa"] = "Le boss invoquera un add en lançant %s. Cet add se déplacera vers n’importe quelle flaque %s et les absorbera, et quand il n’y a pas de flaques il se retournera pour attaquer les joueurs. À ce stade, vous deviez CC cet add afin d’éviter des dommages excessifs. L’add devra absorber 8 flaques de %s pour se transformer en IAT_131140. Tuez la IAT_131140 puis le boss et vous validerez le Haut-Fait.",
    ["Atal_Dazar_Yazma"] = "Afin d’allumer les 4 bougeoirs ombreflammes, tout le monde dans le groupe sauf le tank devront se séparer et se placer, chacuns, prêt de l'un des 4 coins lorsque le boss lance %s. Les bougeoirs resteront allumées pendant environ 25 secondes, donc vous ne devrez le faire QUE lorsque les points de vie du boss sont autour de 5 à 10%%.",
    
    --Chat Output
    ["AtalDazar_BringingHexyBack_Hex"] = "Au moins un joueur doit être sous l'effet de Maléfice au moment de la mort du boss!", --Tout doux

    -------------------------------------------------------
    --- Freehold - Port-Liberté
    -------------------------------------------------------
    --Tactics
    ["Freehold_SkycapNKragg"] = "Pour invoquer IAT_138314, vous devez placer un %s avant d'engager le Boss.",
    ["Freehold_RingOfBooty"] = "Pour ce Haut-Fait, vous devrez ramasser 3 objets dans l’instance: \n%s apparaît dans le nid du premier boss après sa défaite,\n%s se trouve au sommet d'une plate-forme du quartier du Rhum, et\n%s se trouve près de Trothak<Le cogneur aux requins>, le troisième boss.",
    ["Freehold_HarlanSweete"] = "%s va cibler un joueur au hasard pour %s, qui devra se positionner près d’un des coffres pour qu’il soit détruit par les explosions.",

    -------------------------------------------------------
    --- Kings Reset - Repos des rois
    -------------------------------------------------------
    --Tactics
    ["KingsRest_Other"] = "Le premier bijou est dans la première salle du donjon, derrière le sarcophage, sous des paniers.\n Le deuxième est dans le couloir là où il y a les 2 colosses, au bout de la plateforme derrière les escaliers du fond.\n Le troisième bijou est dans la salle juste avant le grand couloir, en hauteur sur la corniche de gauche, uniquement accessible en se faisant propulser dans les airs par la Brute spectrale quand il utilisera sa technique Sol écrasé (" .. GetSpellLink(270514) .. ")\n Le quatrième bijou est situé juste avant la salle du dernier boss, en bas des marches, en haut du pilier de droite (il faudra sauter pour pouvoir click dessus).",
    ["KingsRest_MchimbaTheEmbalmer"] = "Pour ce Haut-Fait, vous devrez libérer le joueur ciblé par %s sans qu'il utilise %s plus d’une fois, et avant que le boss finisse son cast %s.\n\n Note : Les joueurs ont signalé un bug mineur avec ce HF, et il est recommandé que le joueur enfermé n’utilise pas %s avant que le boss ne lance %s",
    ["KingsRest_DazarTheFirstKing"] = "Ce Haut-Fait est obtenu sur %s, le dernier boss de l’instance. Demandez à deux joueurs de rester chacun sur le dessus de la dalle de pierre devant les deux sarcophages, et des lumières commenceront à s'allumer autour des dalles. Une fois qu’elles seront toutes allumés, le sarcophage de droite va se secouer, ce qui signifie que vous pouvez tuer le boss pour libérer MiiMii (que vous recevrez par courrier).",

    -------------------------------------------------------
    --- Shrine of the Storm - Sanctuaire des tempêtes
    -------------------------------------------------------
    --Tactics
    ["ShrineOfTheStorm_Other"] = "Les %s sont ramassés au début du donjon, dans la première pièce. Si vous recevez des dommages causés par le gel, alors les flammes de l’esprit s'éteindront, il est donc recommandé de nettoyer d’abord tous les 'trashs' jusqu'au troisième boss, puis de prendre le souffle. Ne pas tuer le premier boss que cela fera le disparaître le souffle. Une fois que vous allumerez les feux de cérémonie au troisième boss, vous obtiendrez le Haut-Fait.",
    ["ShrineOfTheStorm_LordStormsong"] = "Au cours de la rencontre, %s va périodiquement incanter %s qui invoque %s qui va poursuivre les joueurs et tenter d’exploser à l’impact. Pour obtenir ce HF, vous ne devez pas entrer en contact avec l’une des boules et donc de les 'kite' tout au long de la rencontre.",
    ["ShrineOfTheStorm_VolZith"] = "Pour obtenir le %s debuff il vous faudra plonger dans l’eau avant le dernier boss jusqu’à ce que vous voyez des orbes de vide qui flotte, puis nager à travers eux. Le debuff va vous rendre hostile à tous les joueurs pendant 24 secondes, puis disparaître pendant 6 secondes temps pendant lequel votre Heal pourra vous soigner. Ne tuez PAS vos copains car Tout le groupe doit avoir le debuff d'actif à la mort du boss.\n\n %s lancera %s, et vous serez téléportés dans le royaume englouti où vous devrez tuer rapidement les adds (ou temporiser pour attendre les cooldowns). %s incantera %s, et vous aurez à CC les 5 %s de sorte qu’ils n'atteignent le boss. Tuez le boss rapidement",

    -------------------------------------------------------
    --- Siege of Boralus - Siège de Boralus
    -------------------------------------------------------
    --Tactics
    ["SiegeOfBoralus_DreadCaptainLockwood"] = "%s tentera continuellement de battre en retraite sur son bateau utilisant %s à moins qu’elle ne soit piégée ou enracinée. Comme l’indique la description du HF, vous devez la garder piégée ou enracinée. Une récente tactique propose aussi de 'BURST DPS§§§'",
    ["SiegeOfBoralus_ViqGoth"] = "Pendant la rencontre, %s utilisera %s qui provoquera un barrage d'eau tout autour de la zone. Plusieurs poissons (%s) seront rejetés sur le sol que vous aurez à renvoyer à l’eau (15) avant de vaincre le boss.",
    ["SiegeOfBoralus_Other"] = "Comme le nom du Haut-Fait l'implique, il s’agit d’un Haut-Fait basé sur des métiers avec lesquels vous pourrez intéragir avec des éléments du décors pour invoquer des mini-boss. Pour pouvoir activer ces éléments, il faudra un minimum de compétences de 75 dans le métier approprié.\n\n (Forge) %s - L'Auto-marteau est trouvé en bas des escaliers aux quais en 58, 70.\n (Ingénierie) %s - La carcasse (skin de moissoneur) se trouve au début de l’instance en 61, 17.\n (Alchimie) %s - La fiole rouge se trouve sur une table en 54, 74.",

    -------------------------------------------------------
    --- Temple of Sethraliss - Temple de Sephraliss
    -------------------------------------------------------
    --Tactics
    ["TempleOfSethraliss_Merektha"] = "Afin de révéler l'%s qui est caché sur le dessus de l'énorme squelette, vous devrez utiliser %s, %s, %s ou d’autres capacités Aoe visant le sol (pbaoe).\n Pour faire éclore l’œuf (ne pas le détruire), vous devrez faire en sorte que le boss lance %s dans la direction de l'oeuf. Le groupe restera pack entre le boss et lui.\n Une fois que le serpent éclôt de l'%s, vous pouvez le tuer, puis chaque membre du groupe devra cliquer sur son cadavre pour obtenir le buff %s qui vous accordera le HF.\n\n Note : l'%s peut échapper aux attaques mais il se téléportera au sol après quelques secondes(sauf quand çà bug...). Si vous avez un Chevalier de la Mort dans votre groupe, il n'aura qu'à %s l'%s en bas. Un prêtre pourra aussi CM l'oeuf (ce qui l'amusera beaucoup.)",
    ["TempleOfSethraliss_AvatarOfSethraliss"] = "Pour ce Haut-Fait, vous devrez /kiss %s jusqu’à ce que l’un d’eux se transforme en un 'Prince' qui ressemble au %s. Le 'Prince' ne peut pas mourir donc vous n’avez pas à vous soucier d’utiliser les sorts Aoe.",
    ["TempleOfSethraliss_Trash"] = "Pour ce Haut-Fait, vous devrez CC les %s pendant que vous ramennez les deux yeux plus près. Notez qu’il y a plusieurs %s dans la pièce qui vont tenter de voler votre oeil, il y en a un près de chaque oeil, un entre les yeux et le crâne, et quelques autres au milieu de la pièce. Les capacités telles que %s, %s et %s sont idéales, car vous pouvez CC les adds et les ignorer complètement.",

    --Chat Output
    ["TempleOfSethraliss_Merektha_LootSnake"] = "Ramassez le %s maintenant pour compléter le haut-fait", -- %s ?

    -------------------------------------------------------
    --- The Motherlode - Le Filon
    -------------------------------------------------------
    --Tactics
    ["The_Motherlode_CoinOperatedCrowdPummeler"] = "Ramassez les %s avant le boss et lancez-les sur %s après avoir engagé le boss. %s va lancer %s tout au long du combat donc vous devrez interrompre le sort et le tuer, ainsi que les autres adds dès que possible comme ils vous lancera des grogs, vous rendant saoul pendant 10 secondes.",
    ["The_Motherlode_MogulRazdunk"] = "Comme les précédents Hauts-Faits de ce style, il s’agit d’un Haut-Fait personnel qui vous demandera d'éviter la plupart des mécanismes dommageables de la rencontre avec ce boss.",

    -------------------------------------------------------
    --- The Underrot - Les tréfonds Putrides
    -------------------------------------------------------
    --Tactics
    ["TheUnderrot_ElderLeaxa"] = "Les capacités de %s appliquent des %s aux joueurs chaque fois qu’ils subissent des dommages magiques. Cela signifie que toutes ses capacités devront être interrompues et esquivées afin d’empêcher le debuff.\n\n Pour rendre le HF plus facile, vous pouvez faire passer votre healer en dps pour avoir une interruption supplémentaire, et aussi la tuer plus rapidement.",
    ["TheUnderrot_SporecallerZancha"] = "%s est situé dans le coin au fond à gauche de la salle. Pour le rendre actif, vous devrez faire en sorte que le boss lance %s dans sa direction.\n\n Note : Si %s esquive toutes les attaques, aller au milieu de la salle, et il devrait s'y téléporter.",
    ["TheUnderrot_UnboundAbomination"] = "Les flaques de %s se coalisent parfois en une %s qui fixe et poursuit un joueur aléatoire. Vous devrez tuer le boss sans avoir de %s qui meure, ce qui est facilement fait en les 'kitant' dans un grand cercle autour de la pièce.\n\n Faire usage de cc afin de les ralentir, et n’oubliez pas de vérifier vos talents, bijoux et traits azerite afin de ne pas les tuer accidentellement.",

    -------------------------------------------------------
    --- Tol Dagor - Tol Dagor
    -------------------------------------------------------
    --Tactics
    ["TolDagor_KnightCaptainValyri"] = "Pour ce Haut-Fait, vous devrez tank le boss au milieu de la salle, et les 4 autres joueurs déplaceront les barils (chacun le sien) près de %s. Vous devrez déplacer les barils loin du feu :\n %s - Ce sort est lancé sous les joueurs, vous avez simplement à déplacer le baril au loin.\n %s - Lorsque %s lance ce sort, vous devrez déplacer le baril loin de l’endroit vers lequel le boss se tourne.\n %s - Quand un joueur obtient ce debuff, il doit s’éloigner du baril immédiatement et attendre une dissipation.",
    ["TolDagor_OverseerKorgus"] = "Peu de temps après le début de la rencontre, %s tire des balles enduit de %s sur chaque joueur et leur applique le debuff %s. Chaque fois qu’un joueur bouge ses effets deviennent plus forts et finiront par provoquer l'étourdissement du joueur pendant 8 secondes. La tactique consiste à ce que Tout le groupe bouge en même temps jusqu'à être étourdi en début de rencontre car il n’y a pas de capacités à esquiver, puis vous pouvez tuer le boss.",
        
    -------------------------------------------------------
    --- Waycrest Manor - Manoir Malvoie
    -------------------------------------------------------
    --Tactics
    ["WaycrestManor_SoulboundGoliath"] = "%s obtient un buff qui se cumule toutes les 2 secondes appelé %s. Pour obtenir ce HF, vous devrez kite le boss à travers les %s qui apparaissent dans la zone afin de garder les cumul de %s bas.",
    ["WaycrestManor_GorakTul"] = "Pendant la rencontre %s, le boss va périodiquement jeter des %s que vous aurez besoin d’utiliser pour brûler les cadavres des %s, de sorte qu’ils ne pourront pas ressusciter. Une fois que le boss lance %s et invoque le troisième adds, vous devrez tuer les 3 adds, puis rapidement utiliser %s pour brûler les 3 corps en un lancé Avant que le boss ne les ressuscite.",
    ["WaycrestManor_Other"] = "Comme le nom du Haut-Fait l'implique, il s’agit d’un Haut-Fait basé sur des métiers avec lesquels vous pourrez intéragir avec des éléments du décors pour invoquer des mini-boss. Pour pouvoir activer ces éléments, il faudra un minimum de compétences de 75 dans le métier approprié.\n\n (Travail du cuir) %s - La carte pour invoquer ce boss se trouve dans la section pavillon de chasse du Manoir, dans le coin de la salle avec cheminée 'Kraker'??!!.\n (Couture) %s - Le '%s' se trouve dans la salle de banquet, au dernier étage.\n (Herboristerie) %s - Le '%s' se trouve dans la fontaine au milieu de la cour où le %s se trouve.\n (Calligraphie) %s - Le '%s' se trouve dans une étagère au rez-de-chaussée, sur le côté gauche juste avant de descendre à la cave.\n (Cuisine) %s - Le vin se trouve dans la cave, près d’autres fûts de vin.",  


-- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- -- LEGION -- 


    -------------------------------------------------------
    --- The Emerald Nightmare - Le Cauchemar d'émeraude
    -------------------------------------------------------
    --Tactics
    ["TheEmeraldNightmare_Nythendra"] = "Au cours de la phase %s, %s ( des bestioles )  vont apparaîtrent autour des bords de la salle et les joueurs devront leur cliquer dessus pour les écraser. Une fois que 15 bestioles auront étés écrasés, vous pouvez tuer le boss. 5 bestioles apparaissent à chaque phase, vous aurez donc besoin d’un minimum de 3 phases de %s pour valider le haut-fait.",
    ["TheEmeraldNightmare_Ursoc"] = "Tuez les trashs sur le côté droit juste à l’extérieur de l’entrée de la grotte où se trouve le boss. Libérez %s et attendez-le pour atteindre le boss. Tuez le boss tout en gardant les %s en vie pour obtenir la validation du haut-fait.",
    ["TheEmeraldNightmare_DragonsOfNightmare"] = "Il y a 4 portails autour de la salle du boss. Tout le monde dans le groupe doit aller dans chacun des 4 portails et recueillir 1 petit nuage de chaque portail qui leur donnera un buff. Une fois que tous les joueurs du groupe sont affectés des 4 buffs %s %s %s %s, vous pouvez tuer le boss. Vous aurez besoin de laisser au moins un joueur dehors en début du combat pour tanker le boss tandis que tous les autres recueillent les petits nuages.",
    ["TheEmeraldNightmare_EleretheRenferal"] = "Pour ce haut-fait, il y a 7 œufs avec un effet rouge lumineux dispersés dans la zone. Pour valider le haut-fait, il vous faudra détruire les 7 œufs en les écrasant. Une partie des œufs ne peut être atteinte qu’en utilisant des %s ou des joueurs utilisant des abilitées telles que %s, %s ou %s. Une fois que les 7 œufs ont été détruits, vous pouvez tuer le boss. Note : Si vous ne pouvez voir aucun des œufs, ils réapparaîtront après que vous aurez engagé le boss. Notez aussi que les joueurs assignés à casser les œufs les plus éloignés doivent tapper le boss au moins une fois, sinon ils pourraient ne pas obtenir la validation du haut-fait.",
    ["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "Attendre que 20 %s ( voir un peu plus ) apparaîssent en tuant les tentacules. Une fois que avez mini 20 %s en vie, tout le groupe devra se tenir collé à l’œil, puis les AOE pour tous les tuer en moins de 10 Secondes. Une fois que les 20 adds ont explosés à proximité de l’oeil en 10 secondes, vous pouvez tuer le boss.",
    ["TheEmeraldNightmare_Cenarius"] = "Au niveau max, avec assez de dps, vous pouvez tuer le boss avant que l’un des %s ne soit purifié",
    ["TheEmeraldNightmare_Xavius"] = "Pour accomplir ce haut-fait, vous aurez besoin d’un chasseur de démons pour qu'il utilise sa capacité %s. Autour des bords extérieurs de la salle du boss, une %s apparaîtra à 3 points pendant le combat. Le chasseur de démons devra utiliser sa capacité %s pour trouver l’add et l'attirer au centre de la salle. Les adds apparaissent à 100-65%%, 65-30%% et en dessous de 30%%. Une fois que les 3 %s auront été tués, vous pouvez tuer le boss.",

    --Chat Output
    ["TheEmeraldNightmare_NightmareIchors"] = "Ichor cauchemardesque", --Todo
    ["TheEmeraldNightmare_IllgynothComplete"] = "20 Ichors cauchemardesques sont apaprus. Ils peuvent maintenant être tués à proximité de l’oeil", --Todo
    ["TheEmeraldNightmare_NightmareIchorsKilled"] = "Ichors cauchemardesques tués:", --Todo
    ["TheEmeraldNightmare_DragonsOfNightmare_PlayersWithBuffs"] = "Joueurs avec les 4 buffs", --Todo
    ["TheEmeraldNightmare_Xavius_CreaturesKilled"] = "Créatures démentes tués", --Todo
    ["TheEmeraldNightmare_Nythendra_BugsSquished"] = "Insectes lumineux écrasés", --Todo

    -------------------------------------------------------
    --- Trial of Valor - Le Jugement des Valeureux
    -------------------------------------------------------
    --Tactics
    ["TrialOfValor_Odyn"] = "Pour ce haut-fait, vous devrez atteindre la phase 2 en tuant les %s et %s. Ensuite, vous devrez attendre que le boss lance %s, à ce point les runes sur le sol s’allumeront et des adds apparaîtront avec les runes correspondantes au-dessus de leurs têtes. Vous aurez besoin de vous rappeler l’ordre des runes allumés sur le sol et ensuite tuer les adds correspondants sur les runes correspondantes dans cet ordre.\n\n Une fois que les exigences de validation du haut-fait auront été atteints, vous gagnerez %s, ce qui signifie que vous pouvez tuer le boss.",
    ["TrialOfValor_Guarm"] = "Pour ce haut-fait, un joueur devra ramasser %s à côté du boss au début du combat. Cet os devra être amené dans chacuns des 3 souffles (%s, %s, %s) du boss. Note : Ne faites aucunes des choses suivantes en tenant l’os ou vous le laisserez tomber.\n - Ne jetez aucun sort.\n - Ne vous faites pas frapper par %s.\n - Mourir en tenant l’os.\n\n Vous aurez besoin d’un joueur différent pour absorber chaque souffle. Par conséquent, une fois qu’un joueur en a encaissé un, il devra laisser tomber l’os pour qu’un autre joueur puisse le ramasser. Une fois que le boss aura soufflé 3 fois sur le 'jouet à mâcher', vous pouvez tuer le boss.",
    ["TrialOfValor_Helya"] = "Au niveau max, ce haut-fait est plus facile à réaliser en solo. Il suffit de tuer le boss sans avoir le debuff %s. Cela peut être fait en s’assurant que l'add %s soit tué avant de tuer le boss.",

    --Chat Output
    ["TrialOfValor_Guarm_Part1"] = "Mucus ardent (Orange) partie de", --Todo
    ["TrialOfValor_Guarm_Part2"] = "Salive caustique (Vert) partie de", --Todo
    ["TrialOfValor_Guarm_Part3"] = "Décharge sombre (Violet) partie de", --Todo

    -------------------------------------------------------
    --- The Nighthold - Palais Sacrenuit
    -------------------------------------------------------
    --Tactics
    ["TheNighthold_Skorpyron"] = "Au niveau max, demandez à tout votre groupe de se placer dans le cercle au milieu de la salle et de tuer le boss avant qu’il ne lance des %s.",
    ["TheNighthold_ChronomaticAnomaly"] = "Ce haut-fait est plus facile à réaliser en mode héroïque. Des joueurs aléatoires obtiendront le debuff %s. Ces joueurs devront se tenir sur les cercles bleus autour de la salle jusqu’à ce que le debuff %s expire. Une fois expiré, vous verrez un 'projecteur' apparaître à l’endroit où les %s ont explosés. Une fois qu’au moins 8 cercles seront allumés, vous pourrez tuer le boss.",
    ["TheNighthold_SpellbladeAluriel"] = "Ce haut-fait exige que l’on tue %s à divers endroits de la zone.\n\n - la Terrasse Shal'dorei : Situé dans la zone du boss botaniste ( peut être accompli sur le pont ).\n - Pinacle de l’Astromancien : La pièce directement en dessous de Etraeus, l'augure stellaire.\n - Le passage Brisé : Située en face de Krosus.\n\n Ce haut-fait peut-être validé dans les différents modes et pourra donc être complété en une seule journée.",
    ["TheNighthold_StarAugurEtraeus"] = "Pour ce haut-fait, vous devrez attirer l'add %s de la salle du boss %s, jusqu’à %s.\n\n Vous devez ensuite dps le boss jusqu'à 30%% sans endommager l’add. L’add se transformera alors en un %s, que vous pourrez alors tuer, pour terminer par le boss.",
    ["TheNighthold_HighBotanistTelarn"] = "Les Fruits Mystérieux sont éparpillés partout dans la zone du boss. Pour accomplir ce haut-fait, chaque joueur doit manger un de ces fruits avant d'engager le boss et ne doit pas mourir pendant la rencontre. Le fruit mystérieux donnera au joueur le debuff %s. Au niveau max, vous pouvez simplement tuer le boss.\n\n Note : Vous devez avoir au moins 10 joueurs minimum Pour accomplir ce haut-fait.",
    ["TheNighthold_Krosus"] = "Pour compléter ce haut-fait, vous devrez laisser faire tomber 15 %s dans l'eau lorsque le pont se brise. Au niveau max, vous ne ferez tout simplement aucun 'soak' des %s pour maximiser la quantité de %s qui pop.\n\n Note : Le nombre de %s qui apparaissent augmente avec le nombre de joueurs dans le groupe.",
    ["TheNighthold_Tichondrius"] = "Au niveau maximum, vous pouvez simplement tuer le boss avant qu’il ne lance des %s.\n Note : Ce haut-fait est une réalisation personnelle.",
    ["TheNighthold_Elisande"] = "Pour ce haut-fait, vous devrez invoquer la mascotte %s avant d'engager le boss.\n\n Vous devez ensuite attendre que %s et %s apparaîssent, puis tuer les deux adds l'un sur l’autre. Ensuite, faites passer le %s pet dans les bulles qui se chevauchent créées à la mort des élémentaires. Cela permettra au %s d’être tué. Une fois que l’add est mort, vous pouvez tuer le boss.",
    ["TheNighthold_Guldan"] = "Au cours de la phase 2, groupez-vous et attendez que l'%s apparaisse. Les yeux vont se dupliquer (%s) au fil du temps faisant apparaître de plus en plus d’yeux. Une fois que 16 %s sont apparus, tuez-les à 3 secondes d’intervalle, puis tuez le boss.",

    --Chat Output
    ["TheNighthold_Skorpyron_NoPlayersHit"] = "Aucun joueur n’a été touché par Onde de choc",
    ["TheNighthold_Trilliax_ToxicSlices1"] = "Tranche toxique consommée. Vous ne pouvez manger qu'un maximum de",
    ["TheNighthold_Trilliax_ToxicSlices2"] = "Plus de Tranches toxiques",
    ["TheNighthold_StarAugur_KillAdd"] = "Tuez l'Elémentaire du Néant cosmopolite maintenant",
    ["TheNighthold_Spellblade_Location1"] = "'la Terrasse Shal'dorei' partie de",
    ["TheNighthold_Spellblade_Location2"] = "'Le passage Brisé' partie de",
    ["TheNighthold_Spellblade_Location3"] = "'Pinacle de l’Astromancien' partie de",
    ["TheNighthold_Botanist_LostBuff"] = "a PERDU le debuff du Fruit mystérieux",
    ["TheNighthold_Botanist_GainedBuff"] = "a le debuff du Fruit mystérieux",
    ["TheNighthold_Krosus_AddKilled"] = "tué une Braise ardente",
    ["TheNighthold_Krosus_AddKilledTotal"] = "Braises ardentes tuées",
    ["TheNighthold_Guldan_Eyes"] = "Oeil de Gul’dan",
    ["TheNighthold_Guldan_EyesTotal"] = "16 Yeux de Gul’dan sont apparus",

    -------------------------------------------------------
    --- Tomb of Sargeras - Tombe de Sargeras
    -------------------------------------------------------
    --Tactics
    ["TombOfSargeras_Goroth"] = "Pour ce haut-fait, vos dps et vos healers devront se grouper de sorte que %s fasse apparaître les %s en ligne droite pointée vers lui. Une fois que quelqu’un est marqué par %s il devra aller derrière les piliers de sorte que l’étoile entre en collision avec les %s et les détruise.\n\n Une fois que les 30 %s auront été détruites, vous pourrez tuer le boss.",
    ["TombOfSargeras_DemonicInquisition"] = "Dps le boss jusqu'à environ 10-20%%. Maintenant, chaque fois que %s atteindra 100 points d'énergies, il va lancer %s, donc tout le monde devra l’attaquer à ce moment pour obtenir le maximum de tourment rapidement. Une fois que tout le monde a sa barre de tourment au maximum, vous pourrez tuer le boss.",
    ["TombOfSargeras_Harjatan"] = "Pour faire apparaître %s, une personne du raid devra utiliser le jouet %s.\n\n Utiliser le jouet au début du combat, focus l'%s, et après sa mort, vous pourrez tuer le boss.",
    ["TombOfSargeras_MistressSasszine"] = "Pour compléter ce haut-fait, vous devrez alimenter chacun des éléments ci-dessous en %s %s pendant la phase 2 (70 %%).\n\n - 'Essence d’hydre' provient d’un joueur touché par %s dans le cercle extérieur des %s.\n - 'Sauce à l’encre' provient d’un joueur qui 'soak' l'%s qui doit entrer en contact avec le cercle extérieur des %s.\n - 'Personnage-joueur, pour assaisonner le tout' vient d’un joueur mourant dans le cercle intérieur des %s.\n - 'Tartare d’anguille' provient des %s aspirés dans le cercle extérieur des %s.\n - 'Filet de Murloc' provient des %s aspirés dans le cercle extérieur des %s.\n\n Note : Les %s et les %s doivent être aux environs de 10%% de santé avant de pouvoir être aspirés dans les %s. Les %s n'apparaissent que pendant la phase 1, alors ne passez pas le boss à la phase 2 jusqu’à ce qu’au moins un de ces adds soit apparu.",
    -- ["TombOfSargeras_MistressSasszine"] = "Pour compléter ce Haut-Fait, vous devrez alimenter chacun des éléments ci-dessous en %s %s pendant la phase 2 (70 %%).\n\n '" .. (select(1, GetAchievementCriteriaInfo(11676, 1))) .. "' provient d’un joueur touché par %s dans le cercle extérieur des %s.\n '" .. (select(1, GetAchievementCriteriaInfo(11676, 3))) .. "' provient d’un joueur qui 'soak' l'%s qui doit entrer en contact avec le cercle extérieur des %s.\n '" .. (select(1, GetAchievementCriteriaInfo(11676, 5))) .. "' vient d’un joueur mourant dans le cercle intérieur des %s.\n 'Tartare d’anguille' provient des %s aspirés dans le cercle extérieur des %s.\n '" .. (select(1, GetAchievementCriteriaInfo(11676, 4))) .. "' provient des %s aspirés dans le cercle extérieur des %s.\n\n Note : Les %s et les %s doivent être aux environs de 10%% de santé avant de pouvoir être aspirés dans les %s. Les %s n'apparaissent que pendant la phase 1, alors ne passez pas le boss à la phase 2 jusqu’à ce qu’au moins 1 de ces adds soit apparut.",
    ["TombOfSargeras_SistersOfTheMoon"] = "Sur le chemin vers la salle de la %s, vous entrerez dans une grande salle pleine de trashs et à gauche vous trouverez un add isolé appelé %s, que vous devrez emmener à la salle du boss.\n\n Mettez le boss à 20%% de vie et l'%s changera sa couleur en bleu. Maintenant vous pouvez tuer l’add, puis tuer le boss et vous obtiendrez la validation du haut-fait.",
    ["TombOfSargeras_TheDesolateHost"] = "Au début du combat, une âme tombe et un joueur devra l’attraper en se tenant dans le cercle jaune tourbillonnant sous le Moteur des âmes.\n Après cela, toutes les 5 secondes l’âme sera lancée dans une direction aléatoire et un joueur du royaume opposé devra l’attraper.\n\n Vous devrez affecter deux personnes dans chaque royaume parce que la même personne ne peut pas 'soak' deux fois de suite. La raison pour laquelle vous faites cela est parce que si l’un des joueurs a l’âme au-dessus de leur personnage cela signifie qu’ils l’ont récemment attrapé et sont incapables de le faire à nouveau jusqu’à ce que quelqu’un d’autre du même royaume attrape l’âme.\n\n Soak Rotation\n soaker 1 - Monde physique\n soaker 1 - Monde des esprits\n soaker 2 - Monde physique\n soaker 2 - Monde des esprits\n\nAstuce\n Pour rendre les 'soak' plus facile, les joueurs assignés doivent être marqués et une fois qu’ils attrapent l’âme, ils doivent toujours se déplacer vers une position marquée comme le centre de la salle.\n les 'soakers' devront également faire attention au Templier réanimé car il va périodiquement lancer %s, un sort qui les renverseront s’ils sont touchés par les Vagues gangrenées.\n Toute personne affectée par %s doit s’éloigner le plus loin possible pour éviter de laisser une flaque sombre et gluante où l’âme est censée être attrapée.",
    ["TombOfSargeras_MaidenOfVigilance"] = "Il y a un total de 9 Anomalies Titaniques que vous devrez attraper : 5 à l’intérieur du puits et 4 au-dessus de la plate-forme où vous combattez la Damoiselle de vigilance.\n\n Divisez le raid en 2 parties comme d’habitude et ensuite placez un troisième marqueur où les joueurs assignés se grouperont pour déclencher des %s sur eux-mêmes.\n\n La première Anomalie titanesque est assez difficile à capturer car la gravité va vous tirer vers le bas dès que vous obtenez %s. C’est là que vos Chasseurs de Démons, Chasseurs et Chamans sont utiles en raison de leurs capacités de déplacement en plein air et parce que vous ne voulez pas perdre trop de temps avec cette premiere orbe, et vous devrez sacrifier l’un d’eux.\n\n Les quatres Anomalies titanesques suivantes apparaissent dès que la première est capturée et ils tournent dans le sens horaire. Vous devrez faire des essais et des erreurs jusqu’à ce que les gens s’habituent au 'timing'. Sauter quand il vous reste 5 secondes sur le debuff semble être le meilleur moment pour le faire puisque vous allez également revenir sur la plate-forme après avoir capturé l’orbe.\n\n Une fois que vous avez recueillis toutes les orbes à l’intérieur du puit, les quatre dernières Anomalies titanesques apparaîtront au-dessus de la plate-forme et celles-ci sont beaucoup plus faciles à obtenir. Il suffit de dé-zoomer votre caméra et de vous positionner dos aux orbes de sorte que vous l’attrapiez lorsque vous êtes envoyé dans l’air.",
    ["TombOfSargeras_FallenAvatar"] = "Au niveau max, vous pouvez juste tuer le boss avant qu’il ne lance %s.",
    ["TombOfSargeras_Kiljaeden"] = "Préparation :\n Partez avec autant de Chevaliers de la Mort que vous le pouvez puisque leurs %s et %s sont nécessaires pour ce haut-fait.\n Assurez-vous que chaque joueur du raid a son zoom de la minimap au maximum. Dès que quelqu’un trouve Illidan pendant l’'entracte : le voile du trompeur', le joueur peut faire un ping sur la minimap pour informer les autres de son emplacement.\n En raison de leur mobilité, les moines et les guerriers sont extrêmement utiles et ils devraient utiliser leur talent %s / %s.\n\n Stratégie\n Tank Kil’jaeden dans un coin de la plate-forme pour forcer les adds à apparaître près l’un de l’autre.\n Assignez vos Chevaliers de la Mort pour saisir les Ombres. Ils devraient toujours %s d’abord et ensuite %s.\n Tout le monde devrait se disperser dans un demi-cercle autour de Kil’jaeden de sorte qu’au moins 1 personne trouvera instantanément Illdan, obtenir le buff %s puis se précipiter vers les Ombres à AoE stun et les tuer.",

    --Chat Output
	
	-- ["TombOfSargeras_DemonicInquisition_HasGainedUnbearableTorment"] = "a gagné Tourment insupportable", -- *** ADDED.Z
	-- ["TombOfSargeras_MistressSasszine_HydraEssencePartOf"] = "'Essence d’hydre' partie de", -- *** ADDED.Z
	-- ["TombOfSargeras_MistressSasszine_EelTartarePartOf"] = "'Tartare d’anguille' partie de", -- *** ADDED.Z
	-- ["TombOfSargeras_MistressSasszine_InkSaucePartOf"] = "'Sauce à l’encre' partie de", -- *** ADDED.Z
	-- ["TombOfSargeras_MistressSasszineMurlocFilletPartOf"] = "'Filet de Murloc' partie de", -- *** ADDED.Z
	-- ["TombOfSargeras_MistressSasszinePlayerSeasoningPartOf"] = "'Personnage-joueur, pour assaisonner le tout' partie de", -- *** ADDED.Z
	-- ["TombOfSargeras_MistressSasszineCompleted"] = "complété", -- *** ADDED.Z
	-- ["TombOfSargeras_SistersOfTheMoon_KillTheWaxingTwilight"] = "Tuez l'Ame crépusculaire maintenant!", -- *** ADDED.Z

    -------------------------------------------------------
    --- Antorus the Burning Throne - Antorus, le Trône ardent
    -------------------------------------------------------
    --Tactics
    ["AntorusTheBurningThrone_GarothiWorldbreaker"] = "Pour ce haut-fait, le joueur visé par %s devra se déplacer près d’un ver afin de le faire tuer.\n\n Une fois 16 vers tués, le haut-fait deviendra blanc et vous pourrez tuer le boss",
    ["AntorusTheBurningThrone_FelhoundsOfSargeras"] = "Pendant le combat, plusieurs flaques de couleur orange et violette apparaîtront dans toute la salle. Les tanks devront emmener chaque Gangrechien à la flaque qui correspond à leur propre couleur afin d’obtenir un stack d'%s.\n\nNotez que les stacks d'%s disparaissent si les Gangrechiens se rapprochent les uns des autres.\n Une fois que F’harg et Shatug auront 5 stacks chacun, vous pourrez tuer les boss.",
    ["AntorusTheBurningThrone_PortalKeeperHasabel"] = "Pour ouvrir la Faille chaotique, un joueur devra être affecté par les 3 debuffs de chaque plateforme en même temps. Gardez à l’esprit que cela ne peut être fait que dans la phase 1, qui se termine lorsque le boss atteint 90%%, alors assurez-vous de ne PAS dps le boss.\n\nPour rendre la tâche plus facile, vous pouvez avoir un joueur emenner les %s (debuff orange) près de la plate-forme verte. Après cela, un autre joueur peut ramasser les %s (debuff violet) de la plate-forme violette, puis aller sur la plate-forme verte pour ramasser les %s (debuff orange) et les %s (debuff vert).\n\nLa combinaison de ces trois debuffs ouvrira une Faille chaotique qui vous attirera constamment vers l’arrière de la salle.\n Une fois la Faille chaotique ouverte vous pourrez tuer le boss.",
    ["AntorusTheBurningThrone_Eonar"] = "Pour ce haut-fait, vous aurez besoin de recueillir les 5 orbes de la vie dans le Sanctuaire d’Eonar. Ce haut-fait peut être accompli après la rencontre.\n\nLes orbes apparaissent dans l'ordre. Après la collecte de la première Orbe de Vie, vous aurez alors à collecter le reste dans un certain temps ou la séquence sera réinitialisé.\n - Orbe 1 - Apparaît sur la plate-forme qui est reliée aux voies inférieures et supérieures avec des plates-formes de saut. En entrant dans le Sanctuaire, la plate-forme est tout droit.\n - Orbe 2 - Apparaît sur l’un des piliers de la porte près du chemin du milieu, qui est la porte par laquelle vous entrez dans le Sanctuaire.\n - Orbe 3 - Apparaît sous la plate-forme d'Essence d’Eonar, qui est située à gauche de l’entrée du Sanctuaire.\n - Orbe 4 - Apparaît entre les deux piliers sous le sentier supérieur et est proche de la première orbe.\n - Orbe 5 - Apparaît sur un balcon loin de l’entrée du Sanctuaire, que vous pouvez atteindre en utilisant l'extra-bouton.\n\n Une fois les 5 orbes ramassées, tout le monde en obtiendra le crédit et cela validera le haut-fait.",
    ["AntorusTheBurningThrone_ImonarTheShoulhunter"] = "Pour ce haut-fait, vous devrez déclencher tous les pièges sur le pont pendant les 2 entractes. La première se produit à 66% de vie et la deuxième à 33%. Une fois les deux entractes terminées, vous pourrez tuer le boss.",
    ["AntorusTheBurningThrone_Kingaroth"] = "Pour ce haut-fait, votre groupe devra rester collé au boss pour que les %s qui apparaissent explosent uniquement à son contact.\n\n Dps lentement le boss jusqu’à ce qu’au moins 9 %s soient apparus. Attendez bien que les adds viennent au boss pour éviter la détonation des %s",
    ["AntorusTheBurningThrone_Varimathras"] = "%s est déclenché lorsqu’un joueur est éloigné de plus de 8 mètres d’un autre joueur. Varimathras lance des %s toutes les 35 à 40 secondes, ce qui fera reculer la première cible avec laquelle il entre en contact.\n\n La façon la plus simple d’accomplir ce haut-fait au niveau maxamum est de stack votre raid entier contre le mur avec les tanks légèrement en face du groupe. Vous pourrez alors simplement tuer le boss sans que personne dans le groupe ne bouge.",
    ["AntorusTheBurningThrone_CovenOfShivarra"] = "Ce haut-fait est assez simple et facile, mais la façon dont vous devrez gérer les adds dépendra de votre (mal)chance :\nSi vous obtenez le %s comme votre premier ou deuxième tourment alors vous devriez tous les tuer car vos healers pourraient galérer à garder tout le monde en vie, et attendre qu’une autre vague apparaisse.\n\nLes %s peuvent être CC, donc utilisez des capacités telles que %s, %s ou %s et n’oubliez pas de vous disperser pendant que %s est actif ainsi que d'aller dans un endroit sûr pendant %s",
    ["AntorusTheBurningThrone_Aggramar"] = "Pour ce haut-fait, vous devrez transformer une Braise de Taeshalach en une Manifestation de Taeshalach. Pour ce faire, la Braise doit être frappé deux fois par la combo d’Aggramar %s.\n\nD’abord, vous devrez laisser la Braise de Taeshalach s’éloigner du bord de la plate-forme, puis avoir un démoniste qui utilise %s sur elle. Dans le cas où vous n’avez pas de démoniste, vous pouvez utiliser %s, %s ou d’autres CC, cependant assurez-vous que tout le monde arrête de dps le boss pour éviter toute sorte d'accident, qui pourrait finir par casser un CC.\n\nLes %s sont %s - %s - %s - %s - %s - %s\n\nNotez que vous devez transformer la Braise de Taeshalach en une seule phase sinon elle va exploser, et pour cette raison vous devriez le faire en phase 2 : Champion de Sargeras (80%%-40%%).",
    ["AntorusTheBurningThrone_Argus"] = "Pour ce haut-fait, vous devrez d’abord arriver à la phase 4 du combat. Une fois qu’Argus tue le groupe, seuls les healers et les tanks devront ressusciter en utilisant l’arbre. Le reste du groupe doit rester mort et s'éparpiller sur les bords de la salle.\n\n Maintenant, chaque fois qu’Argus fait apparaître au moins 6+ Modules de réorigination, attendre qu’ils explosent pour que les joueurs morts puissent collecter les Particules de puissance titanesque tout autour de la salle. Vous pouvez asssigner une personne à l’intérieur du monde des esprits pour faire un compte à rebours court de sorte que tout le monde commence à ramasser les Particule de puissance au même moment puisque vous avez seulement 5 secondes pour compléter le haut-fait. Une fois que c’est fait, demandez aux joueurs restants d’utiliser l’arbre et de tuer le boss.",

    --Chat Output
	-- ["AntorusTheBurningThrone_FelhoundsOfSargeras_Fharg_FAILED"] = "RATÉ! (F'harg a perdu Imprégnation corruptrice)", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_FelhoundsOfSargeras_Shatug_FAILED"] = "RATÉ!(Shatug a perdu Imprégnation corruptrice)", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_AntoranHighCommand_FelshieldEmitterPlaced"] = "Felshield Emitter Placed. Vous pouvez seulement placer un maximum de", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_AntoranHighCommand_MoreFelshieldEmitters"] = "plus d'Emetteur de gangrebouclier", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_Kingaroth_AbsorbedDiabolicBomb"] = "Bombe diabolique absorbée", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_KingarothAchievementCanStillBeCompleted"] = "Le Haut-Fait peut toujours être complété en attendant plus de Bombes diaboliques", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_Argus_BestAttemptThisPull"] = "Meilleur essai", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_Argus_OrbsCollected"] = "Orbes Collectées", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_Argus_DiabolicBombGained"] = "Bombe(s) diabolique(s) obtenue(s)", -- *** ADDED.Z
	-- ["AntorusTheBurningThrone_Argus_UnableToTrackAchievement"] = " Impossible de suivre le haut-fait. L’énergie de Khaz’Goroth doit être de 20 ou moins pour que IAT puisse suivre ce HF", -- *** ADDED.Z

    -------------------------------------------------------
    --- Seat of the Triumvirate - Siège du triumvirat
    -------------------------------------------------------
    --Tactics
    ["SeatOfTheTriumvirate_ZuraalTheAscended"] = "Environ quarante secondes après le début du combat, le boss ciblera un joueur au hasard et lui lancera %s ce qui l'enverra dans le royaume du vide.\n\n Alors, ce joueur pourra remplir sa barre d’énergie, attaquer %s pour ensuite utiliser l'extra-bouton %s près de lui afin que les deux soient renvoyés dans le monde normal.\n\n À ce moment, vous tuerez %s en premier, puis %s, ce qui validera votre haut-fait.",
    ["SeatOfTheTriumvirate_Saprish"] = "Pour ce haut-fait, vous aurez besoin de vous tenir sur les 4 %s autour de la salle de sorte que %s les brise quand il saute sur l’un des joueurs. Une fois toutes les %s cassées, vous pourrez tuer %s et obtenir la validation du haut-fait.",
    ["SeatOfTheTriumvirate_Lura"] = "Sur le chemin du deuxième au troisième boss, vous trouverez des bassins du vide qui vous attireront vers leur centre où vous y gagnerez un stack de %s à chaque seconde. Une fois que vous obtenez 10 stacks, le debuff est remplacé par un nouveau appelé %s. Tuer %s alors que vous êtes affectés par %s validera le haut-fait.",

    --Chat Output

    -------------------------------------------------------
    --- Assault on Violet Hold - Assaut sur le fort Pourpre
    -------------------------------------------------------
    --Tactics
    ["AssaultOnVioletHold_MillificentManastorm"] = "Pour compléter ce haut-fait, vous devrez activer le jouet %s tout en combattant %s.",
    ["AssaultOnVioletHold_Festerface"] = "Pour qu'une %s puisse apparaître, %s doit accumuler 100 points d'énergies. Son énergie diminue quand il est proche d’un bassin donc le boss devra en être éloigné. Une fois qu'une %s est apparue, tuez la, puis tuez le boss pour obtenir la validation du haut-fait.",

    --Chat Output

    -------------------------------------------------------
    --- Eye of Azshara - L'Œil d'Azshara
    -------------------------------------------------------
    --Tactics
    ["EyeOfAzshara_LadyHatecoil"] = "Lorsque le debuff %s expire ou est dissipé, vous produirez un souffle dans la direction où vous êtes actuellement tourné tuant n’importe quel %s sur sa trajectoire. Pour valider ce haut-fait, vous devrez tuer 11 %s ou plus en un seul souffle. Les %s vont se multiplier au fil du temps mais sont fragiles, donc faites attention à ne pas leur souffler dessus avant qu'il y en ai au moins 11.",

    --Chat Output
	-- ["EyeOfAzshara_LadyHatecoil_KillTheSalseaGlobulesNow"] = "Kill the Salsea Globules with Curse of The Witch Now", -- ** NEW.z things to share(d)
	-- ["EyeOfAzshara_LadyHatecoil_SaltseaGlobulesKilled"] = "Saltsea Globules killed with Curse of the Witch", -- ** NEW.z

    -------------------------------------------------------
    --- Darkheart Thicket - Fourré Sombrecœur
    -------------------------------------------------------
    --Tactics
    ["DarkheartThicket_Dresaron"] = "Après avoir engagé le boss, courir au travers du gros oeuf derrière %s pour le faire éclore. Ensuite, tuer les %s qui apparaissent puis, tuer le boss.",
    ["DarkheartThicket_ShadeOfXavius"] = "Descendez le boss jusqu'à 15-20%% PV, puis attirez le au travers des flaques tourbillonnantes sur le sol jusqu’à ce qu'il ai 10 stacks de %s, puis, le tuer.",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Valor - Salles des Valeureux
    -------------------------------------------------------
    --Tactics
    ["HallsOfValor_Other1"] = "Faites votre route jusqu’à la zone de %s. Nettoyez la zone SAUF les %s et tous les %s. Une fois fait, aggrotez le %s et attirez-le sur les 10 %s de la zone. Une fois que le %s aura 10 stacks de %s, vous pouvez le tuer pour valider le haut-fait.",
    ["HallsOfValor_Other2"] = "Note : Ce haut-fait nécessite un minimum de 4 joueurs.\n\n Après avoir vaincu %s et %s le chemin vers les quatre rois sera maintenant ouvert. Avant de prendre ce chemin, retournez dans la salle à manger et demandez à chaque joueur de cliquer sur une %s sur les tables pour gagner le buff %s.\n\n Une fois ce buff obtenu, les joueurs auront 20 secondes pour monter les escaliers et jeter leur %s à l’un des quatre rois (%s, %s, %s et %s). Note : Chaque joueur devra choisir un boss différent.",

    --Chat Output

    -------------------------------------------------------
    --- Neltharion's Lair - Repaire de Neltharion
    -------------------------------------------------------
    --Tactics
    ["NeltharionsLair_Other"] = "Vous aurez d’abord besoin d’acheter une %s au %s qui se trouve en allant sur le chemin étroit à droite après être entré dans l’instance. Vous aurez ensuite besoin de 'prendre l'empreinte' des escargots tout au long de l’instance à l'aide de la %s. Assurez-vous de ne PAS tuer les escargots avant d'avoir pris leur empreinte avec la %s.\n\n %s se trouve sur un champignon dans la partie de l’instance avec une rivière et des barils. Vous aurez besoin de jeter un poisson vers lui pour le faire bouger. Une fois que vous l’aurez touché avec un poisson, il vous attendra au fond de la cascade.\n\n %s se trouve dans la grotte derrière la cascade où vous venez de trouver %s. Vous aurez besoin de quelqu’un pour taunt %s afin qu’il s’éloigne du champ électrique avant de prendre son empreinte avec la %s.\n\n %s se trouve avant le 2ème boss dans le long chemin vers la 'world-quest des chauve-souris' à l’arrière de la grotte.\n\n %s, %s et %s se trouvent directement après le 2e boss qui tourne en cercle.\n\n %s est juste après les 3 précédents escargots. Vous aurez besoin d’aller dans l’eau sur votre droite pour ensuite nager vers la grotte. %s est accroché au plafond de la grotte et vous aurez besoin de le taper une fois pour qu’il en tombe. Vous serez alors en mesure de prendre son empreinte avec la %s.",
    ["NeltharionsLair_Naraxas"] = "Pour réaliser ce haut-fait, vous devrez attendre que le boss gagne 6 stacks de %s. Ceci peut être fait de la façon suivante :\n\n - Le tank se fait manger par le boss\n - Laissant les adds vivants leur permettant de se faire manger par le boss.\n\n Une fois que les 6 stacks de %s ont été atteintes, vous pouvez tuer le boss pour valdier le haut-fait.",

    --Chat Output

    -------------------------------------------------------
    --- Vault of the Wardens - Caveau des Gardiennes
    -------------------------------------------------------
    --Tactics
	["VaultOfTheWardens_AshGolm"] = "Pour accomplir ce haut-fait, tous les membres du groupe doivent soak les %s qui se baladent autour de la salle jusqu'à d’obtenir le debuff %s. Une fois que tout le monde est affecté par %s, vous pourrez tuer le boss.",
    ["VaultOfTheWardens_Cordana"] = "Pour compléter ce haut-fait, aucun joueur du groupe ne doit être touché par des esprits pendant %s. Pendant cette phase de %s, %s tirera une volée de flèches qui révélera brièvement la position des esprits. Les esprits se déplaceront en rang serré sur la plate-forme, mais avec un trou où les joueurs pourront passer. Il y aura 4 vagues d’esprits à éviter.\n\n Deuxièmement, le joueur portant %s devra la jeter au sol AVANT que %s n’atteigne 40%% de points de vie car c’est à ce moment que commence la première invocation de %s. %s ne peut pas être utilisé pour révéler les esprits car cela ferait échouer le haut-fait.\n\n Une fois que vous avez évité les 4 vagues d'esprits pendant %s et que tous les esprits ont quitté la plate-forme, vous pouvez tuer le boss pour valider le haut-fait.\n\n Note : Pour faciliter les choses, vous pouvez emmener un chasseur de démons qui pourra utiliser sa capacité %s pour révéler la position des esprits.",
    -- ["VaultOfTheWardens_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Black Rook Hold - Bastion du Freux
    -------------------------------------------------------
    --Tactics
    -- ["BlackRookHold_Other"] = "",
    ["BlackRookHold_AmalgamOfSouls"] = "Descendez les points de vie de l'%s à 50%%. Lorsque l'%s apparaît, vous devrez en CC un pour l’empêcher d’atteindre le boss. Après 1 minute l'%s se transformera en %s. Vous pourrez alors tuer l'%s, puis le boss pour obtenir la validation du haut-fait",

    --Chat Output

    -------------------------------------------------------
    --- Maw of Souls - La Gueule des âmes
    -------------------------------------------------------
    --Tactics
    ["MawOfSouls_Ymiron"] = "Avant d’arriver au boss, vous devrez garder au moins 1 %s en vie. Pendant la rencontre avec le boss, %s va invoquer un %s. Vous aurez besoin de tourner le %s vers le %s pour que sa capacité %s les tue. Une fois que 6 %s auront été tués avec la %s, vous pourrez tuer le boss",
    -- ["MawOfSouls_Helya"] = "",
    ["MawOfSouls_Other"] = "Pour compléter ce haut-fait, vous devrez tuer le deuxième boss dans les 3 minutes et 30 secondes après l’embarquement du navire juste après le premier boss.",

    --Chat Output

    -------------------------------------------------------
    --- Court of Stars - Cour des Étoiles
    -------------------------------------------------------
    --Tactics
    ["CourtOfStars_PatrolCaptainGerdo"] = "Pour compléter ce haut-fait, vous devrez d’abord nettoyer tous les trashs de la salle du boss. Tout en tuant les trashs assurez-vous que ni les mobs, ni les joueurs activent les balises car cela ferait échouer le haut-fait.\n\n Une fois les trashs nettoyés, engagez le boss puis attendez qu’il lance %s. Une fois que le boss a lancé cette capacité, vous devrez cliquer sur les 5 balises autour de la salle. Une fois que les 5 balises auront été désactivées, vous pourrez tuer le boss.",
    ["CourtOfStars_Other"] = "Les exigences pour valider ce haut-fait sont les suivantes :\n\n - Ne laissez pas les %s lancer %s\n - Désactivez les 5 balises Avant d’engager le premier boss\n - Assurez-vous de tuer les 3 démons séparément avant d'engager %s\n - Démasquez l'espion au premier essai",

    --Chat Output

    -------------------------------------------------------
    --- Return to Karazhan - Retour à Karazhan
    -------------------------------------------------------
    --Tactics
    -- ["ReturnToKarazhan_Other1"] = "",
    ["ReturnToKarazhan_OperaHall"] = "Ce haut-fait prendra trois semaines pour être réalisé, car les différentes pièces changent selon un calendrier de trois semaines.",
    ["ReturnToKarazhan_ShadeOfMedivh"] = "Ce haut-fait nécessite 5 joueurs. Tous les joueurs du groupe devront cliquer sur un livre qui se trouve au sol à gauche après être entré dans la salle du boss. Cela donnera à tous les membres du groupe le debuff %s. Une fois que tout le monde a obtenu le debuff %s, vous pourrez tuer le boss.",
    -- ["ReturnToKarazhan_ManaDevourer"] = "",
    -- ["ReturnToKarazhan_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Cathedral of Eternal Night - Cathédrale de la Nuit éternelle
    -------------------------------------------------------
    --Tactics
    ["CathedralOfEternalNight_Agronox"] = "Pour ce haut-fait, vous devez vous tenir au-dessus des 4 gousses de semence qui bourgeonnent autour de la salle du boss et attendre qu'un Fulminating Lasher (flagelant) déclenche %s (explose) sur chacun des Budding Seed (bourgeon). Une fois que cela est fait pour chacune des 4 graines, vous pourrez tuer le boss.",
    ["CathedralOfEternalNight_ThrashbiteTheScornful"] = "Autour de la salle il y a 4 bibliothèques. Pour réaliser ce haut-fait, vous devez vous tenir derrière chacune des bibliothèques et attendre que le boss lance %s afin de casser une bibliothèque. Une fois qu’une bibliothèque est cassée, un livre cliquable apparaît sur le plancher. Chaque membre du groupe doit cliquer sur ce livre. Recommencez pour les 3 autres bibliothèques de la salle en vous assurant d’aller dans le sens horaire. Une fois cela fait, tout le monde dans le groupe devrait être %s (avoir le buff) et vous pourrez tuer le boss.\n\n Note : Vous devez avoir un groupe complet, 5 personnes, pour pouvoir valider ce haut-fait.",
    ["CathedralOfEternalNight_Mephistroth"] = "Au début du combat, ramassez l'%s. Vous devez ensuite attendre que le boss atteigne 100 points d'énergies qui fera débuter la phase 2. Pendant la phase 2, positionnez le bouclier que vous avez ramassé en début de rencontre face aux %s. Une fois que 20 %s ont été réfléchis avec le bouclier, vous pourrez tuer le boss.",

    --Chat Output


-- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- -- WARLORDS OF DRAENOR -- 


    -------------------------------------------------------
    --- Highmaul - Cognefort
    -------------------------------------------------------
    --Tactics
    -- ["Highmaul_TheButcher"] = "",
    -- ["Highmaul_Tectus"] = "At 110, just nuke the boss down for the first and second split. On the third split wait for all 8 versions of the boss to spawn, then AOE them down within 10 seconds of one another.",
    -- ["Highmaul_Brackenspore"] = "Before pulling the boss pick up the flamethrower fun. Damage the boss to below 50% health so that the green moss starts growing from the edges of the room. Once the room is full of green moss, start pressing the flamethrower button over the boss. Keep pressing the flamethrower button every time it comes off cooldown until you reach 15 stacks of Burning Infusion. Once you have 15 stacks you can kill the boss. The stacks do need to stay on you once you reach 15.",
    -- ["Highmaul_TwinOgron"] = "At 110, you can simply nuke the bosses down. Make sure they are standing next to each other.",
    -- ["Highmaul_ImperatorMargok"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Blackrock Foundry - Fonderie des Rochenoires
    -------------------------------------------------------
    --Tactics
    -- ["BlackrockFoundry_BeastlordDarmac"] = "Takes 3 kills to complete. Boss will mount the beast that is closest to him. DPS the boss down slowly and wait for boss to mount beast before killing.",
    -- ["BlackrockFoundry_OperatorThogar"] = "Wait 10 seconds after pulling the boss then place Toy train set and then immediately after the wind up train wrecker on the first set of tracks as you enter the boss room. Achievement will be earned as soon as the requirements have been met.",
    -- ["BlackrockFoundry_IronMaidens"] = "Nuke all 3 bosses within 10 seconds of one another",
    -- ["BlackrockFoundry_HansgarFranzok"] = "Nuke boss down as quick as possible without anyone in the group getting hit by a stamping press. The stamping press display an orange glow on the floor a few seconds before stamping.",
    -- ["BlackrockFoundry_FlamebenderKagraz"] = "1 person tank Aknor Stellbringer away from the boss. Everyone else single target the boss down.",
    -- ["BlackrockFoundry_Kromog"] = "Requires atleast 10 players but more players makes achievement easier. Spread out around the room and wait for orange runes to spawn. When they spawn each player stand on their own rune. When hands spawn from runes and grab players nuke hands down as quickly as possible.",
    -- ["BlackrockFoundry_Gruul"] = "1 player tank boss at entrance to room with boss facing into the center of the room. Everyone else stand underneath the ore which is positioned on the ceiling of the boss room. When boss casts overhead smash, players will be flung into the air. Click on the ore on the ceiling to collect it. Once all 3 ores have been collected you can nuke boss.",
    -- ["BlackrockFoundry_Oregorger"] = "",
    -- ["BlackrockFoundry_BlastFurnace"] = "Completed during phase 2. During phase 2, 4 random players will be targeted by slag elementals. If you have a slag elemental following you, run to one of the primal elementalists which doesn’t have a slag elemental already on. Once there is slag elemental on each primal elementalists you can nuke down the slag elemental then primal elementalists as quick as possible. Getting all 4 primal elementalists down within 10 seconds will reward this achievement.",
    -- ["BlackrockFoundry_Blackhand"] = "DPS the boss down to 30% to reach phase 3. Ashes will then start falling from the ceiling. Spread out around the platform and stand underneath the falling ashes until it lands on you. Once the group has collected 20 falling ashes you can nuke boss. The more players you have the easy this achievement is.",

    --Chat Output

    -------------------------------------------------------
    --- Hellfire Citadel - Citadelle des Flammes infernales
    -------------------------------------------------------
    --Tactics
    ["HellfireCitadel_HellfireAssault"] = "Au niveau max, il suffit de détruire tous les engins/véhicules aussi rapidement que possible. Assurez-vous de garder un oeil sur les Ecraseur gangrefeu, les Craches-flammes gangrefeu et particulièrement les Artilleries gangefeu qui tirent de loin.",
    ["HellfireCitadel_IronReaver"] = "Sur les corniches à gauche et à droite du boss, il y a des Gardien des Flammes infernales que l'on ne peux viser. Amenez le boss contre l'un des rebords face aux Gardien des Flammes infernales. L'aoe 'barrage' du boss devrait les tuer, puis, faites pareil de l'autre côté.",
    ["HellfireCitadel_HellfireHighCouncil"] = "Tuez les 3 boss afin qu’ils meurent dans les 10 secondes l'un de l’autre",
    -- ["HellfireCitadel_Gorefiend"] = "Pendant la phase Festin d’âmes, les joueurs qui n’ont pas le debuff " .. GetSpellLink(179867) .. " devront mourir. Cela peut être fait en se tenant dans la piscine où le boss est assis. Une fois morts, les joueurs seront téléportés dans le ventre du boss. Ils devront tuer le Fragment de la Mégère une fois à l’intérieur. Une fois que le Fragment de la Mégère est mort, l’âme de la Mégère va apparaître dans la salle de boss qui peut ensuite être tué par le groupe.",
    ["HellfireCitadel_Gorefiend"] = "Pendant la phase Festin d’âmes, les joueurs qui n’ont pas le debuff 'Corruption de Fielsang' devront mourir. Cela peut être fait en se tenant dans le bassin où le boss se trouve. Une fois morts, les joueurs seront téléportés dans le ventre du boss. Ils devront tuer le Fragment de la Mégère une fois à l’intérieur. Une fois que le Fragment de la Mégère est mort, l’âme de la Mégère va apparaître dans la salle de boss qui peut ensuite être tué par le groupe.",
    ["HellfireCitadel_ShadowLordIskar"] = "Au niveau Max, il suffit de tuer le boss sans ramasser l’Oeil d’Anzu",
    ["HellfireCitadel_SocretharTheEternal"] = "Pendant la phase 2, utilisez le robot pour mettre en place une prison au portail bleu. Continuez à utiliser la prison au portail pour piéger les adds jusqu’à ce que 20 Âmes hanteuses soient piégées. Une fois cela fait, laissez le véhicule et Aoe tous les adds. Les joueurs peuvent également CC les adds. Ne pas tuer les adds avec le robot.",
    ["HellfireCitadel_TyrantVelhari"] = "Un joueur devra tank l’Ancien massacreur loin du groupe pendant que les autres tueront le boss.",
    ["HellfireCitadel_Mannoroth"] = "Au début du combat, tuez les invocateurs vert et violet. Attendez qu’un joueur soit maudit par la légion avant de tuer l'invocateur rouge. Une fois que le debuff de la malédiction de la légion s’épuise ou est dissipé, un seigneur de malheur va apparaître. Descendez le seigneur de malheur à 5% points de vie. Ensuite, dps Mannoroth à 30% points de vie. Une fois que ce sera fait, placez le seigneur de la mort devant le boss et attendez qu’il soit tué par le pouvoir de Mannoroth Visée gangrenée surpuissante. Une fois le seigneur de la mort achevé par le boss, vous pourrez tuer le boss.",
    ["HellfireCitadel_Archimonde"] = "Attendre que l’Esprit du feu funeste apparaisse puis tuez le boss. L’Esprit du feu funeste n’a pas besoin de rester en vie.",

    --Chat Output
    -- ["HellfireCitadel_IronReaver_HellfireGuardiansKilled"] = "Gardien des Flammes infernales tué", -- *** ADDED.Z
	-- ["HellfireCitadel_SocretharTheEternal_HauntingSoul"] = "Âme hanteuse", -- *** ADDED.Z
	-- ["HellfireCitadel_SocretharTheEternal_20HauntingSoulsHaveSpawned"] = " 20 Âmes hanteuses sont apparus. Elles peuvent maintenant être tuées!", -- *** ADDED.Z
	-- ["HellfireCitadel_SocretharTheEternal_TimerStarted"] = "Chrono démarré! 10 seconds restantes", -- *** ADDED.Z
	-- ["HellfireCitadel_SocretharTheEternal_HauntingSoulsKilled"] = "Âmes hanteuses tuées", -- *** ADDED.Z

    -------------------------------------------------------
    --- Bloodmaul Slag Mines - Mine de la Masse-Sanglante
    -------------------------------------------------------
    --Tactics
    -- ["BloodmaulSlagMines_SlaveWatcherCrushto"] = "",
    -- ["BloodmaulSlagMines_Magmolatus"] = "At 110, dps down the boss slowly so that both Calamity and Ruination have a chance to spawn",
    -- ["BloodmaulSlagMines_Gugrokk"] = "At 110, single target the boss down so that no Unstable Slags are killed",

    --Chat Output

    -------------------------------------------------------
    --- Iron Docks - Quais de Fer
    -------------------------------------------------------
    --Tactics
    -- ["IronDocks_FleshrenderNokgar"] = "",
    -- ["IronDocks_Other"] = "",
    -- ["IronDocks_Skulloc"] = "",

    --Chat Output

    -------------------------------------------------------
    --- ? - Auchindoun
    -------------------------------------------------------
    --Tactics
    -- ["Auchindoun_SoulbinderNyami"] = "",
    -- ["Auchindoun_Azzakel"] = "",
    -- ["Auchindoun_Terongor"] = "",

    --Chat Output

    -------------------------------------------------------
    --- ? - Orée-du-Ciel
    -------------------------------------------------------
    --Tactics
    -- ["Skyreach_Ranjit"] = "",
    -- ["Skyreach_Rukhran"] = "",
    -- ["Skyreach_HighSageViryx1"] = "",
    -- ["Skyreach_HighSageViryx2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Grimrail Depot - Dépôt de Tristerail
    -------------------------------------------------------
    --Tactics
    -- ["GrimrailDepot_RocketsparkAndBorka"] = "",
    -- ["GrimrailDepot_NitroggThundertower"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Everbloom - La Flore éternelle
    -------------------------------------------------------
    --Tactics
    -- ["TheEverbloom_Witherbark"] = "",
    -- ["TheEverbloom_ArchmageSol"] = "",
    -- ["TheEverbloom_Yalnu"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Shadowmoon Burial Grounds - Terres sacrées d'Ombrelune
    -------------------------------------------------------
    --Tactics
    -- ["ShadowmoonBurialGrounds_SadanaBloodfury"] = "",
    -- ["ShadowmoonBurialGrounds_Bonemaw"] = "",
    -- ["ShadowmoonBurialGrounds_Nerzhul"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Upper Blackrock Spire - Sommet du pic Rochenoire
    -------------------------------------------------------
    --Tactics
    -- ["UpperBlackrockSpire_OrebenderGorashan"] = "",
    -- ["UpperBlackrockSpire_Other"] = "",
    -- ["UpperBlackrockSpire_RagewingTheUntamed"] = "",
    -- ["UpperBlackrockSpire_WarlordZaela"] = "",

    --Chat Output


-- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- -- MISTS OF PANDARIA -- 


    -------------------------------------------------------
    --- Terrace of Endless Spring
    -------------------------------------------------------
    --Tactics
    ["TerraceOfEndlessSpring_ProtectorsOfTheEndless"] = "Ce Haut-Fait prendra 3 semaines pour être complété. Votre objectif sera de faire une rotation de qui des 3 boss sera tué le dernier chaque semaine",
    ["TerraceOfEndlessSpring_LeiShi"] = "Une fois que vous avez commencé le combat, chaque joueur doit descendre les marches à gauche et à droite du boss dans l’eau et marcher jusqu’à un 'Sha parasitoïde'. Une fois qu’un joueur est assez proche du 'Sha parasitoïde', il s’attachera à la tête de ce joueur. Une fois que tout le monde dans le raid a un 'Sha parasitoïde' sur la tête, vous pouvez 'mono-cibler' le boss et le tuer. Ne pas utiliser de capacités Aoe car les 'Sha parasitoïde' doivent rester en vie.",
    -- ["TerraceOfEndlessSpring_ShaOfFear"] = "At 110 you can simply nuke the boss. Make sure you stand in the light to avoid getting feared", -- Not used

    --Chat Output
    -- ["TerraceOfEndlessSpring_DefeatedLast"] = "'%s Defeated Last' part of",

    -------------------------------------------------------
    --- Throne of Thunder
    -------------------------------------------------------
    --Tactics
    ["ThroneOfThunder_JinrokhTheBreaker"] = "Le boss lancera des orbes d’Éclair focalisé au hasard sur les joueurs. Si l’orbe atteint le joueur, elle explosera. 2 joueurs doivent donc 'kite' une orbe d'Éclair focalisé pour les faire exploser l'une sur l'autre.",
    ["ThroneOfThunder_CouncilOfElders"] = "Au Lvl Max vous pouvez simplement tuer le boss. Assurez-vous que tout le monde soit dans le cercle intérieur avant d'engager le boss.",
    ["ThroneOfThunder_Tortos"] = "Tuez au moins 5 'Tortues tourbillon' sur une ligne. Une fois que vous avez assez de 'Tortues tourbillon', ciblez la carapace de l’une des tortues tourbillonnantes que vous aurez tuée et clickez sur l''extra button' pour la lancer au travers des autres tortues. Assurez-vous que vous faites face à la bonne direction afin qu’elle soit envoyé au travers de 5 'Tortues tourbillon'.",
    ["ThroneOfThunder_Megaera"] = "Ce Haut-Fait prendra 3 rencontres pour être complété. Pendant une rencontre, tuer seulement 2 des têtes en laissant une tête différente vivante à chaque fois.",
    ["ThroneOfThunder_JiKun"] = "L’œuf d’or tombera du nid à la droite du boss d’où vous atterrissez. Pour ce faire, 1 joueur devra sauter sur la droite en bas de la plate-forme 10 secondes après avoir engagé le boss. Une fois que le joueur est en bas, ils doit tuer les 'adds'. Cela lui donnera une capacité d’action spéciale qu’il pourra utiliser pour pouvoir voler jusqu’au nid suivant. Une fois là-bas, il devra faire attention à l’œuf d’or et cliquer dessus le plus rapidement possible. Une fois qu’il a attrapé l’œuf, vous aurez besoin, par exemple, d’un prêtre pour lancer Saut de foi sur ce joueur pour le ramener sur la plate-forme. Une fois que l’œuf est en sécurité sur la plate-forme, le joueur le portant doit éviter Tous les dégâts sinon il le laissera tomber.\n Tuez le boss rapidement dès que l’œuf est sur la plate-forme.",
    ["ThroneOfThunder_DurumuTheForgotten"] = "Pendant le combat, il y aura 3 éclairs de lumière blancs (cercle/petite fumée au sol qui apparait et disparait rapidement) quelque part sur la plate-forme juste avant la phase des lasers. Pour compléter cette réalisation, les 3 joueurs qui sont ciblés avec les rayons (ou le joueur avec les 3 rayons) doivent se tenir au-dessus de ces éclairs furtifs pour révéler l’une des 3 Bête de brume (orange, violette et verte). Si vous ne l'avez pas vu apparaître, il vous faudra chercher. Une fois que les 3 bêtes du brouillard ont été révélées, vous pouvez tuer le boss.",
    ["ThroneOfThunder_DarkAnimus"] = "Ce Haut-Fait peut prendre plus d’un run à compléter bien que vous pouvez avoir plusieurs tentatives pendant la même 'verrouillage'; explications : Si vous tuez les Ritualistes sombres détruire la Sphère au centre, vous pouvez réinitialiser l’instance puisqu’ils sont comptés comme des 'trashs'. Pour ce faire, convertissez le raid en héroïque après avoir tué les ritualistes. Attendez 35 minutes (Blizzard nerf). Une fois que vous êtes hors de l’instance, changez le mode d’instance à la normale puis réinitialisez l’instance.",
    ["ThroneOfThunder_TwinConsorts"] = "Au LvL Max, tuez Lu’lin en premier, puis Suen.",
    ["ThroneOfThunder_LeiShen"] = "Ce Haut-Fait demandera 4 rencontres pour être complété. Dans les coins de la salle il y a 4 conduits. Le boss se téléportera à chaque conduit. Chaque semaine, choisissez un conduit différent pour y engager le boss. Attendez que le conduit atteigne 3 'stacks' se surcharge puis tuez le boss.",

    --Chat Output

    -------------------------------------------------------
    --- Siege of Orgrimmar
    -------------------------------------------------------
    --Tactics
    ["SiegeOfOrgrimmar_Immerseus"] = "Pendant la phase de séparation, Contrôllez (CC) les flaques d’eau du Sha. Gardez-les sous contrôle jusqu’à ce qu’elles se transforment en 'Les larmes du Val'. A ce stade, vous pouvez les tuer. Tuez 10 'Les larmes du Val' pour obtenir le Haut-Fait.",
    ["SiegeOfOrgrimmar_TheFallenProtectors"] = "A 66%%, le boss placera %s sur un joueur aléatoire. Vous devez transférer cette marque à 5 joueurs en utilisant le bouton d’action spéciale qui apparaîtra une fois que vous avez le debuff. Vous devez également transférer la marque d’angoisse au moins 200 mètres autour de la pièce. Répartir le groupe autour de la salle à 40 mètres de distance et continuer à transférer la marque jusqu’à ce que la réalisation passe en blanc.",
    ["SiegeOfOrgrimmar_IronJuggernaut"] = "Pendant la phase de siège, un joueur aléatoire sera ciblé avec %s. Ce joueur doit 'kite' le laser à travers les mines au sol. Une fois que les mines auront été touchés par le laser, elles deviendront surchauffées. À ce stade, cliquez sur les mines pour les piétiner. Marchez sur 6 mines surchauffées pour valider le Haut-fait.",
    ["SiegeOfOrgrimmar_KorkronDarkShaman"] = "Attention : Ne pas AOE les 'trashs' après Mastodonte de fer. 1.) Détruisez 'Oversear' avec la hache pour sauver Ji Patte de Feu (vous n’avez que quelques secondes après être entré dans la pièce pour le faire). 2.) Sauvez les citoyens de Theramore détenus par le Superviseur Thathung (ne pas tuer les citoyens) ou sauvez les orcs détenus par le Superviseur Mojka (ne pas tuer les orcs). 3.) Récupérez une clé de Mokvar le Trésorier et déverrouiller une cage de prisonniers.",
    ["SiegeOfOrgrimmar_GeneralNazgrim"] = "Libérez Gamon de ses chaînes juste à l’extérieur de l’entrée de La Herse. Attendez que Gamon atteigne le boss avant de l'engager, puis, tuez le boss.",
    ["SiegeOfOrgrimmar_Malkorok"] = "Attirez le Casse-crâne corrompu du bas de l’escalier à Malkorok. Placez le Casse-crâne corrompu dans la zone où le boss utilise son abilité en cône (Frappe en arc de cercle). Si le boss ne lance pas cette capacité alors vous devez le dps un peu. Le boss lancera à un moment " .. GetSpellLink(142842) .. " qui transformera le Casse-crâne corrompu en un Amalgame corrompu ( si il a bien été touché par la Frappe en arc de cercle juste avant ). Une fois que cela se produit, Tuez l’add et le boss.",
    ["SiegeOfOrgrimmar_SpoilsOfPandaria"] = "Nécessite au moins 2 joueurs. Diviser le groupe en 2. Un groupe ne devrait tuer QUE les Mantides et l’autre groupe ne devrait tuer QUE les Mogus. Pour ce faire, un groupe nettoie chaque type de groupe d’un côté de la salle, puis utilise le crochet pour remonter et traverser de l’autre côté. Ne franchissez pas la porte au milieu des deux pièces.",
    ["SiegeOfOrgrimmar_ThokTheBloodthirsty"] = "Nécessite au moins 5 joueurs. Tous les joueurs du groupe doivent réduire la santé à 50% ou moins. Une fois que ce sera fait, le boss passera à la phase suivante. Dans cette phase Si vous êtes 'fixé' par le boss, enfuyez-vous sinon vous serez tué instantanément. Tuez le geôlier Kor’Kron qui fraie, prenez la clé qui tombe et ouvrez la cage à gauche de la pièce lorsque vous entrez. Une fois que la cage a été déverrouillée 3 fois, l’escargot va sortir. Tuez le boss et attendre que l’escargot de manger les restes.",
    ["SiegeOfOrgrimmar_ParagonsOfTheKlaxxi"] = "Ce Haut-Fait prendra 3 rencontres pour être complété. Une fois que chacun des boss est tué, cliquez sur le boss pour gagner une des apparences. Votre rôle dictera de quels boss vous gagnerez l'apparence. Tappez les boss lentement pour s’assurer que vous obteniez les 3 apparences.",
    ["SiegeOfOrgrimmar_GarroshHellscream"] = "Attendez que 18 Porteguerre kor’kron apparaissent. En attendant, tuez les ingénieurs de siège pour que les Etoiles de Fer ne soient pas lancés. Tuez aussi les chamans pour qu’ils ne guérissent pas les mobs plus tard. Une fois que vous avez assez de mobs, tenez vous à l’extrémité opposée et face à l’une des étoiles de fer (ceci est fait de sorte que les mobs ne soient pas accidentellement tués par l’autre étoile de fer). Arrêtez de tuer les ingénieurs et attendez que les Porteguerre soient tués.",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    ["HeartOfFear_ImperialVizierZorlok"] = "Les insectes (%s) apparaissent aux quatres piliers autour du centre de la pièce. 2 Insecte Acharné (Bestiole) apparaissent à chaque pilier à la fois. Chaque joueur doit cliquer sur l’un de ces Insecte Acharné pour gagner un debuff. Une fois que chaque joueur du groupe a le debuff, vous pouvez tuer le boss. Tous les joueurs dans le raid doivent être vivants et avoir les debuff pour obtenir le Haut-Fait.",
    ["HeartOfFear_ImperialVizierZorlok_HasGotTheZealousParasiteDebuff"] = "a le debuff de l'Insecte Acharné",
    ["HeartOfFear_BladeLordTayak"] = "Il y a 4 braseros au centre de la salle et 2 braseros à l’extrême gauche et à l’extrême droite de la salle quand vous regardez le boss. Une fois que le boss a atteint 20% de points de vie, vous devez cliquer sur les braseros au milieu de la salle qui sont allumés pour gagner le " .. GetSpellLink(128949) .. " buff qui dure 30 Secondes. Vous devez ensuite courir à l’un des braseros à l’extrême droite / gauche pour les allumer. Une fois les 4 braseros allumés, vous pouvez tuer le boss",
    ["HeartOfFear_Garalon"] = "Au Lvl Max vous pouvez simplement 'mono-cibler' le boss pour obtenir le HF. Évitez les AOE car cela peut 'couper' les pattes",
    ["HeartOfFear_AmberShaperUnsok"] = "Pour ce Haut-Fait, vous aurez besoin d’au moins 2 joueurs. Une fois que vous engagez le boss, tuer les 'Ambre vivant' de sorte que les flaques laissés au sol quand ces 'adds' sont tués soient superposées. Une fois que vous avez 8 flaques empilées l’une sur l’autre, vous pouvez tuer le boss. Si un joueur devient un Monstre Amber alors descendez ce joueur jusqu’à 20% de ses points de vie pour le libérer",
    ["HeartOfFear_GrandEmpressShekzeer"] = "Pour ce Haut-Fait, vous avez besoin d’un moyen de 'taunt' le boss entre 2 cibles pour gérer le %s debuff. 2 joueurs devront 'taunt' une fois 4 piles de debuff atteint pour éviter de mourir. Cela se poursuivra jusqu’à ce que le boss atteigne 0 énergie. A ce moment, des 'adds' vont apparaitrent. Tuez les 2 'Saccageur kor’thik' dans les 10 secondes l'un de l’autre et puis tuer le boss pour obtenir le Haut-Fait",

    --Chat Output

    -------------------------------------------------------
    --- Mogu'shan Vaults
    -------------------------------------------------------
    --Tactics
    ["MogushanVaults_TheStoneGuard"] = "Pour ce Haut-Fait, chaque joueur doit avoir invoqué une mascotte canine. Par exemple: %s %s %s",
    ["MogushanVaults_FengTheAccursed"] = "Pour ce Haut-Fait, vous devez renvoyer les capacités suivantes : %s %s %s %s %s %s.\nPour ce faire, un joueur Tank (Spé Tank Obligatoire) doit ramasser les %s qui se trouvent à gauche du boss et utliser le Voile d'inversion sur l'un des autres joueurs pour voler le sort et l'utiliser sur le boss.\nPhase 1 : 95%%; Épicentre est lancé par le boss; Poings fulgurants doit être volé sur un joueur ayant encaissé le 'stun' (Si Max Lvl, le joueur doit être à poil et/ou 'spam' s'asseoir pendant le 'cast' de Poings fulgurants).\nPhase 2 : 66%%; Etincelle braisière est lancé sur un joueur.\nPhase 3 : À 33%%; Vélocité des Arcanes est lancé par le boss; Résonance des Arcanes est lancé sur un joueur. Une fois que les 5 capacités ont été renvoyé, vous pouvez tuer le boss. Remarque : si vous l’instance en héroïque les phases peuvent être dans un ordre différent",
    -- ["MogushanVaults_GarajalTheSpiritbinder"] = "",
    -- ["MogushanVaults_TheSpiritKings"] = "",
    -- ["MogushanVaults_Elegon"] = "",
    -- ["MogushanVaults_WillOfTheEmperor"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Stormstout Brewery
    -------------------------------------------------------
    --Tactics
    -- ["StormstoutBrewery_OokOok"] = "",
    -- ["StormstoutBrewery_Other1"] = "",
    -- ["StormstoutBrewery_Hoptallus"] = "",
    -- ["StormstoutBrewery_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Scarlet Halls
    -------------------------------------------------------
    --Tactics
    -- ["ScarletHalls_HoundmasterBraun"] = "",
    -- ["ScarletHalls_ArmsmasterHarlan"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Scarlet Monastery
    -------------------------------------------------------
    --Tactics
    -- ["ScarletMonastery_ThalnosTheSoulrender"] = "",
    -- ["ScarletMonastery_BrotherKorloff"] = "",
    -- ["ScarletMonastery_HighInquisitorWhitemane"] = "",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    -- ["Scholomance_JandiceBarov"] = "",
    -- ["Scholomance_Rattlegore"] = "",
    -- ["Scholomance_Other1"] = "",
    -- ["Scholomance_Other2"] = "",
    -- ["Scholomance_Other3"] = "",

    --Chat Output

    -------------------------------------------------------
    --- 
    -------------------------------------------------------
    --Tactics
    -- ["TempleOfTheJadeSerpent_WiseMari"] = "",
    -- ["TempleOfTheJadeSerpent_ShaOfDoubt1"] = "",
    -- ["TempleOfTheJadeSerpent_ShaOfDoubt2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Mogu'Shan Palace
    -------------------------------------------------------
    --Tactics
    -- ["MoguShanPalace_Gekkan"] = "",
    -- ["MoguShanPalace_XinTheWeaponmaster"] = "",
    -- ["MoguShanPalace_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Shado Pan Monastery
    -------------------------------------------------------
    --Tactics
    -- ["ShadoPanMonastery_MasterSnowdrift"] = "",
    -- ["ShadoPanMonastery_ShaOfViolence"] = "",
    -- ["ShadoPanMonastery_TaranZhu"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Siege of Niuazao Temple
    -------------------------------------------------------
    --Tactics
    -- ["SiegeOfNiuazaoTemple_CommanderVojak"] = "",
    -- ["SiegeOfNiuazaoTemple_GeneralPavalak"] = "",
    -- ["SiegeOfNiuazaoTemple_WingLeaderNeronok"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Gate of the Setting Sun -- Porte du Soleil couchant
    -------------------------------------------------------
    --Tactics
    -- ["GateOfTheSettingSun_SaboteurKiptilak"] = "",
    -- ["GateOfTheSettingSun_Other"] = "",
    -- ["GateOfTheSettingSun_Raigonn"] = "",

    --Chat Output


-- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- -- CATACLYSM -- 


    -------------------------------------------------------
    --- Dragon Soul - L'Âme des dragons
    -------------------------------------------------------
    --Tactics
    -- ["DragonSoul_WarlordZonozz"] = "Pull the boss but don’t kill him. When a purple ball spawns, run into it. Every time you run into the purple ball it will change direction. Run into the purple ball 10 times then nuke the boss. Try to aim the purple ball away from the boss so that it doesn’t get absorbed by the boss.",
    -- ["DragonSoul_YorsahjTheUnsleeping"] = "Pull the boss but don’t kill him. Wait for the oozes around the edge of the room to reach the boss. Once all 4 colour combinations have reached the boss (Black & Yellow, Black & Blue, Red & Green & Purple & Yellow) you can kill him. This will take several ooze phases to get all the combinations. It doesn’t matter if the other oozes reach the boss that are not listed as a colour combination. Therefore, you can just AFK until the requirements of the achievement have been met.",
    -- ["DragonSoul_HagaraTheStormbinder"] = "",
    -- ["DragonSoul_WarmasterBlackhorn"] = "For this achievement you will need a ranged dps ability. As soon as Twilight Assault Drakes spawn kill them as soon as they come in range. If you kill these drakes before they reach the ship, then you don’t have to worry about soaking any abilities. This is the only requirements to the achievement, any other damage to the ship such as Twilight Onslaught does not need to be absorbed.",
    -- ["DragonSoul_SpineOfDeathwing"] = "",
    -- ["DragonSoul_MadnessOfDeathwing"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Blackwing Descent
    -------------------------------------------------------
    --Tactics
    -- ["BlackwingDescent_Maloriak"] = "Damage the boss down to 25%. Be careful you don’t 1 shot the boss. Once 12 abbreviations have spawned AOE them down then kill boss. Make sure you don’t kill the boss before the adds have been AOE’d down.",
    -- ["BlackwingDescent_Nefarian"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Bastion of Twilight
    -------------------------------------------------------
    --Tactics
    -- ["BastionOfTwilight_HalfusWyrmbreaker"] = "Pull the boss but kill him. Free 2 of the dragons around the room by interacting with them. The whelps count as 1 dragon as well. Kill the 2 dragons within 10 seconds of one another then kill the boss.",
    -- ["BastionOfTwilight_ValionaAndTheralion"] = "Pull then bosses but don’t kill them. Wait for the spell Dazzling Destruction to cast. Once the boss has cast the spell stand in the pool that was created by the spell so that you get transferred to the shadow realm. Once you are in the shadow realm, kill 6 Twilight Fiends. Once the requirements have been met you can kill boss.",

    --Chat Output

    -------------------------------------------------------
    --- Throne of the Four Winds
    -------------------------------------------------------
    --Tactics
    -- ["ThroneOfTheFourWinds_ConclaveOfWind"] = "",
    -- ["ThroneOfTheFourWinds_AlAkir"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Firelands
    -------------------------------------------------------
    --Tactics
    -- ["Firelands_LordRhyolith"] = "Single target dps down the right leg. Do not touch the left leg.",
    -- ["Firelands_Shannox"] = "",
    -- ["Firelands_MajordomoStaghelm"] = "",
    -- ["Firelands_Ragnaros"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Blackrock Caverns
    -------------------------------------------------------
    --Tactics
    -- ["BlackrockCaverns_RomoggBonecrusher"] = "",
    -- ["BlackrockCaverns_Corla"] = "After pulling the boss wait for the three zealots evolve. This is done by not standing in the way of the beams being channelled to the mobs. Once they have all evolved you can nuke the boss.",
    -- ["BlackrockCaverns_KarshSteelbender"] = "Pull the boss into the fire in the middle of the room until he reaches 15 stacks of Superheated Quicksilver Armor. Once he has 15 stacks you can nuke the boss.",

    --Chat Output
    -- ["BlackrockCaverns_AngeredEarthKilled"] = "Angered Earth Killed",
    -- ["BlackrockCaverns_EvolvedTwilightZealotKilled"] = "Evolved Twilight Zealot Killed",

    -------------------------------------------------------
    --- Throne of the Tides
    -------------------------------------------------------
    --Tactics
    -- ["ThroneOfTheTides_LadyNazJar"] = "Damage the boss down to about 40% health. Be careful that you don’t 1 shot the boss. When the boss transitions to the next phase, kill the 2 caster adds but keep the melee add up. Once the geyser spawns drag the remaining add into the geyser until it gets killed. This may have to done multiple times. Once the add has been killed by the geyser, you can kill the boss.",
    -- ["ThroneOfTheTides_Ozumat"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Stonecore
    -------------------------------------------------------
    --Tactics
    -- ["TheStonecore_HighPriestessAzil"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Vortex Pinnacle
    -------------------------------------------------------
    --Tactics
    -- ["TheVortexPinnacle_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Grim Batol
    -------------------------------------------------------
    --Tactics
    -- ["GrimBatol_GeneralUmbriss"] = "Pull the boss then wait for a Malignant Trogg to spawn. Kill the Malignant Trogg next to the boss. Once the boss has got the Modgud's Malice from the killed add then you can kill the boss.",

    --Chat Output
    -- ["GrimBatol_FailedMessage"] = "Achievement can still be completed by waiting for another Malignant Trogg",

    -------------------------------------------------------
    --- Halls of Origination
    -------------------------------------------------------
    --Tactics
    -- ["HallsOfOrigination_EarthragerPtah"] = "Mount one of the camels to the left or right of the boss before going up the steps. Once you have mounted a camel, just nuke down the boss.",

    --Chat Output
    -- ["HallsOfOrigination_KnockedOffCamel"] = "has been knocked off their camel",

    -------------------------------------------------------
    --- Lost City of the Tol'Vir
    -------------------------------------------------------
    --Tactics
    -- ["LostCityOfTheTolVir_Lockmaw"] = "Pull the boss and wait for 20 Frenzied Crocolisk to spawn. Once they have spawned nuke them down within 10 seconds. Make sure you don’t kill the boss before nuking down the adds.",
    -- ["LostCityOfTheTolVir_HighProphetBarim"] = "",
    -- ["LostCityOfTheTolVir_Siamat"] = "",

    --Chat Output
    -- ["LostCityOfTheTolVir_FrenziedCrocodileCounter"] = "Frenzied Crocolisk Counter",
    -- ["LostCityOfTheTolVir_FrenziedCrocodileKilled"] = "Frenzied Crocolisk killed in time",
    -- ["LostCityOfTheTolVir_BurningSoulsKilled"] = "Burning Souls killed",

    -------------------------------------------------------
    --- Deadmines
    -------------------------------------------------------
    --Tactics
    -- ["Deadmines_HelixGearbreaker"] = "Pull the boss and wait for him to pick you up and charge down the room. Once he has done this Mine Rats will spawn around the room. After you have killed 20 Mine Rats you can kill the boss. The boss will have to do multiple charges so that enough Mine Rats to spawn.",
    -- ["Deadmines_AdmiralRipsnarl"] = "Damage Ripsnarl until he enters the vapour phase. Be careful that you don’t one shot the boss. Once he enters the vapour phase, wait until 3 Freezing Vapors cast Coalesce before killing boss.",
    -- ["Deadmines_CaptainCookie"] = "At 110, Wait for the boss to enter the pot and attempt to cast Throw Food before killing the boss. If you kill the boss before this has happened, the achievement will not get rewarded.",

    --Chat Output

    -------------------------------------------------------
    --- Shadowfang Keep
    -------------------------------------------------------
    --Tactics
    -- ["ShadowfangKeep_LordGodfrey"] = "Pull the boss then wait for the Bloodthirsty Ghouls to spawn. Place the boss in front of the Bloodthirsty Ghouls and wait for the boss to kill the Bloodthirsty Ghouls with his Pistol Barrage ability. Once 12 Ghouls have been killed, you can nuke the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Zul'Gurub
    -------------------------------------------------------
    --Tactics
    -- ["ZulGurub_Other"] = "",
    -- ["ZulGurub_HighPriestVenoxis"] = "Pull the boss and wait for him to turn into the snake. While waiting make sure you avoid green stuff on the floor. Once the boss has turned into a snake you can kill him.",
    -- ["ZulGurub_HighPriestessKilnara"] = "",
    -- ["ZulGurub_Jindo"] = "Damage the boss down to below 70% health. Wait for 20 Twisted Spirts to spawn then nuke them down. Once you have killed 20 Twisted spirits in 15 seconds you can kill boss.",

    --Chat Output

    -------------------------------------------------------
    --- Zul'Aman
    -------------------------------------------------------
    --Tactics
    -- ["ZulAman_Other1"] = "",
    -- ["ZulAman_Other2"] = "",
    -- ["ZulAman_Daakara"] = "At 110, you can simply just nuke the boss down while in the rectangular turquoise stonework.",

    --Chat Output

    -------------------------------------------------------
    --- End Time - La Fin des temps
    -------------------------------------------------------
    --Tactics
    -- ["EndTime_EchoOfTyrande"] = "At 110, run the gauntlet without any player in healing spec. This way you don’t need to worry about a healer taking any damage.",
    -- ["EndTime_EchoOfSylvanas"] = "Pull the boss then wait for the Risen Ghouls to spawn. Once the Risen Ghouls have spawned, kill two of them then kill boss.",

    --Chat Output

    -------------------------------------------------------
    --- Well of Eternity - Puits d'éternité
    -------------------------------------------------------
    --Tactics
    -- ["WellOfEternity_Mannoroth"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Hour of Twilight - L'Heure du Crépuscule
    -------------------------------------------------------
    --Tactics
    -- ["HourOfTwilight_ArchbishopBenedictus"] = "Get the boss health down to 50%. Be careful that you don’t 1 shot the boss. Once the boss has entered his shadow form, run round the edges of the room and kill 10 Twilight Sparks. Once 10 Twilight Sparks have been killed, you can kill the boss.",

    --Chat Output


-- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- -- WRATH OF THE LICH KING -- 


    -------------------------------------------------------
    --- Obsidian Sanctum - Le sanctum Obsidien
    -------------------------------------------------------
    --Tactics
    -- ["ObsidianSanctum_SartharionTheOnyxGuardian"] = "At 110, you can simply just kill Sartharion and ignore all the other bosses to get this achievement.",

    --Chat Output

    -------------------------------------------------------
    --- Eye of Eternity
    -------------------------------------------------------
    --Tactics
    -- ["EyeOfEternity_Malygos"] = "DPS the boss down below 50% health so that he enters phase 2. Once the boss has entered phase 2 kill one of the Nexus Lord then mount the disc the mob was on. Once you are riding on a disk you can kill a scion of eternity to complete the achievement.",

    --Chat Output

    -------------------------------------------------------
    --- Onyxia's Lair
    -------------------------------------------------------
    --Tactics
    -- ["OnyxiasLair_Onyxia"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Trial of the Crusader
    -------------------------------------------------------
    --Tactics
    -- ["TrialOfTheCrusader_Icehowl"] = "At 110, you can simply just nuke the boss down. Make sure you don’t kill the Snobolds that fall of Gormok back after killing him.",
    -- ["TrialOfTheCrusader_LordJaraxxus"] = "At 110, pull the boss then wait for two Mistresses of Pain to spawn. Once they have spawned, single target down the boss.",
    -- ["TrialOfTheCrusader_Anubarak"] = "Pull the boss then wait for 25 Swarm Scarabs to spawn. Once enough adds have spawned. AOE them down. Be careful you don’t kill the boss first.",

    --Chat Output

    -------------------------------------------------------
    --- Vault of Archavon
    -------------------------------------------------------
    --Tactics
    -- ["VaultOfArchavon_ArchavonEmalonKoralon"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Ulduar
    -------------------------------------------------------
    --Tactics
    -- ["Ulduar_Other1"] = "At 110, this achievement is a lot easier to complete without a vehicle. Just run up between 2 of the pillars towards the boss. Wait for 100 adds to attack you then just AOE all the adds down.",
    -- ["Ulduar_Other2"] = "Kill the boss without going over any of the repair pads located at the entrance to the boss room on the right and right.",
    -- ["Ulduar_FlameLeviathan1"] = "This achievement will take 3 runs to complete since you will need to mount a different vehicle each time.",
    -- ["Ulduar_FlameLeviathan2"] = "This achievement requires at least 2 players. The player not going for the achievement needs to drive a demolisher and the player going for the achievements needs to be the passenger of the demolisher. Once you have pulled the boss, load the passenger into the catapult and throw them at the turrets on the boss. Once the player is up on the boss, they need to kill the turret to gain the achievement.",
    -- ["Ulduar_FlameLeviathan3"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least one tower is kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    -- ["Ulduar_FlameLeviathan4"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least two towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    -- ["Ulduar_FlameLeviathan5"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if at least three towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    -- ["Ulduar_FlameLeviathan6"] = "This achievement can only be completed on the hard mode of the encounter. Hard mode is started by talking to Lore Keeper of Norgannon. This achievement will be awarded if all four towers are kept alive. At 110 you can simply ignore all the towers and just kill the boss to get the achievement.",
    -- ["Ulduar_Razorscale"] = "Wait for 25 Dark Rune Guardian Dwarves to spawn then use the harpoons to pull Razorscale down. Once Razorscale is down dps the boss down to below 50% so the boss is permanently grounded. Be careful you don’t one shot the boss. Once the boss is grounded, place the Dark Rune Guardians in front of the boss until they are killed by Razorscale breath ability.",
    -- ["Ulduar_IgnisTheFurnaceMaster1"] = "Pull the boss then wait for 2 Iron Constructs to spawn. Place the 2 Iron Constructs in the fire on the ground until they gain 10 stacks of the Heat Buff. Next drag the 2 Iron Constructs into the water so they turn to stone. Finally nuke down the 2 adds within 5 seconds of one another. Once both adds have died you can kill boss.",
    -- ["Ulduar_IgnisTheFurnaceMaster2"] = "This achievement requires 2 players or a player with a pet class. The boss will randomly pick players to enter the pot that do not have aggro of the boss. Just pull the boss and wait till everyone gets thrown into the pot.",
    -- ["Ulduar_XTDeconstructor1"] = "",
    -- ["Ulduar_XTDeconstructor2"] = "Pull the boss and dps down until you reach 75%, 50% or 25% to start the heart phase. Careful you don’t one shot the boss. Once the heart is exposed nuke it down then kill the boss.",
    -- ["Ulduar_AssemblyOfIron1"] = "At max level, just kill Runemaster Molgeim last",
    -- ["Ulduar_AssemblyOfIron2"] = "At max level, just kill Stormcaller Brundir last",
    -- ["Ulduar_AssemblyOfIron3"] = "At max level, just kill Steelbreaker last.",
    -- ["Ulduar_AssemblyOfIron4"] = "At max level, use the Iron Boot Flask toy then nuke down the boss.",
    -- ["Ulduar_AssemblyOfIron5"] = "After pulling the boss you must interrupt the first cast of Chain Lightning from Stormcaller Brundir before killing him. Once you have interrupted the spell, nuke down Stormcaller Brundir and then kill the other two bosses.",
    -- ["Ulduar_Kologarn1"] = "At max level, just single target down the boss without killing the arms.",
    -- ["Ulduar_Kologarn2"] = "At max level, single target down the two arms then kill the boss.",
    -- ["Ulduar_Kologarn3"] = "After pulling the boss kill the arms until 25 Rubble has spawned. Don’t damage the boss since killing the arms already does a lot of damage to the boss.",
    -- ["Ulduar_Auriaya1"] = "At 110, just single target down the boss.",
    -- ["Ulduar_Auriaya2"] = "After pulling the boss wait for the Feral Defender to spawn. Once the Feral Defender has spawned kill him. He will then respawn after a short amount of time. Once the Feral Defender has been killed 9 times you can kill the boss.",
    -- ["Ulduar_Hodir1"] = "At 110, free the adds from the ice tombs then nuke down the boss.",
    -- ["Ulduar_Hodir2"] = "",
    -- ["Ulduar_Thorim1"] = "At 110, complete the gauntlet part of the encounter to gain this achievement.",
    -- ["Ulduar_Thorim2"] = "",
    -- ["Ulduar_FreyaMiniBosses"] = "Pull Elder Brightleaf, Elder Ironbranch and Elder Stonebark together in the Freya boss room and kill them within 15 seconds of one another.",
    -- ["Ulduar_Freya1"] = "Pull the boss then wait for 2 Ancient Water Spirits, 2 Storm Lashers and 2 Snaplashers to spawn. Once these have spawned aoe them down within 10 seconds of one another. Be careful that you don’t kill the boss first.",
    -- ["Ulduar_Freya2"] = "Defeat Freya leaving at least one of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
    -- ["Ulduar_Freya3"] = "Defeat Freya leaving at least two of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
    -- ["Ulduar_Freya4"] = "Defeat Freya leaving all three of the following mini bosses alive: Elder Brightleaf, Elder Ironbranch and Elder Stonebark. At 110, just nuke down the boss within killing the mini bosses.",
    -- ["Ulduar_Mimiron1"] = "",
    -- ["Ulduar_Mimiron2"] = "Push the red button behind the boss to active hard mode to earn this achievement.",
    -- ["Ulduar_GeneralVezax"] = "Pull the boss then wait for the Saronite Animus to spawn. Once the Saronite Animus has spawned, kill it then kill the boss. The Saronite Animus takes about 5 minutes to spawn.",
    -- ["Ulduar_YoggSaron1"] = "After bring Sara down to 0% at the start of phase one, she will turn angry. Use /kiss on her to complete this achievement at this point.",
    -- ["Ulduar_YoggSaron2"] = "After starting the encounter, run into the clouds around the room to spawn Guardians of Yogg-Saron. Once 9 Guardians of Yogg-Saron have spawned, AOE then down within 12 seconds of one another. You can then kill the boss.",
    -- ["Ulduar_YoggSaron3"] = "This achievement takes multiple runs to complete since it’s random which vision the boss will spawn. You can simply just nuke the boss down.",
    -- ["Ulduar_AlgalonTheObserver"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Naxxramas
    -------------------------------------------------------
    --Tactics
    -- ["Naxxramas_GrandWidowFaerlina"] = "At max level, single target the boss down without touching any of the adds.",
    -- ["Naxxramas_KelThuzad"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Icecrown Citadel
    -------------------------------------------------------
    --Tactics
    -- ["IcecrownCitadel_LadyDeathwhisper"] = "",
    -- ["IcecrownCitadel_ValithriaDreamwalker"] = "This achievement requires a healing class to complete. At 110, the healer can just heal the at the start of the fight. You do not need to wait for the portals to spawn if you can heal the boss to full in under 45 seconds.",
    -- ["IcecrownCitadel_BloodQueenLanathel"] = "This achievement will take 2 kills to complete. At 110 to complete the ‘Defeat Blood-Queen Lana'thel without becoming a vampire’ criteria just simply nuke the boss down. To complete the ‘Defeat Blood-Queen Lana'thel while a vampire’ criteria, wait until you get the Essence of the Blood Queen debuff then nuke the boss down.",
    -- ["IcecrownCitadel_TheLichKing"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Nexus
    -------------------------------------------------------
    --Tactics
    -- ["TheNexus_Anomalus"] = "Damage the boss down to 45%, be careful you don’t 1 shot the boss. Wait for the add to finish casting the indestructible buff on the boss. Once this has finished you can kill the boss. Make sure you don’t kill the chaotic rift.",

    --Chat Output

    -------------------------------------------------------
    --- The Culling of Stratholme
    -------------------------------------------------------
    --Tactics
    -- ["TheCullingOfStratholme_Other1"] = "",
    -- ["TheCullingOfStratholme_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Azjol Nerub
    -------------------------------------------------------
    --Tactics
    -- ["AzjolNerub_KrikthirTheGatewatcher"] = "At 110, just single target the boss down without killing any of the mobs around him.",
    -- ["AzjolNerub_Hadronox"] = "At 110, just go straight down to the boss ignoring all adds in the way. Nuke the boss down as soon as you reach him. Don’t wait for the boss to come to you.",

    --Chat Output

    -------------------------------------------------------
    --- Dark Tharon Keep
    -------------------------------------------------------
    --Tactics
    -- ["DarkTharonKeep_NovosTheSummoner"] = "Stand at the top of the stairs and kill the undead adds and Crystal Handlers until all 4 Crystal Handlers have been killed. At this point phase 2 starts and you can kill the boss.",
    -- ["DarkTharonKeep_KingDred"] = "Pull the boss and pull 6 Drakkari Gutrippers and/or Drakkari Scytheclaw but don’t kill them. Once you in combat with the boss, single target down the raptors 1 by 1 until 6 are killed. Once this is done you can kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Violet Hold
    -------------------------------------------------------
    --Tactics
    -- ["VioletHold_Cyanigosa"] = "For the achievement you must not use any of the red crystal around the room and none of the mobs can reach the entrance.",
    -- ["VioletHold_Other"] = "This achievement will take multiple runs to complete since it’s random which bosses are going to spawn.",

    --Chat Output

    -------------------------------------------------------
    --- Gundrak
    -------------------------------------------------------
    --Tactics
    -- ["Gundrak_Galdarah1"] = "",
    -- ["Gundrak_Galdarah2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Stone
    -------------------------------------------------------
    --Tactics
    -- ["HallsOfStone_SjonnirTheIronshaper"] = "Pull the boss then wait for the Malformed Ooze to form into one Iron Sludge. Once the Iron Sludge is formed, kill it then kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Lightning
    -------------------------------------------------------
    --Tactics
    -- ["HallsOfLightning_GeneralBjarngrim"] = "At 110, just wait for the boss to gain Temporary Electrical Charge buff before pulling him. Once he has the buff pull the boss, wait for him to get his defensive stance up then kill him.",

    --Chat Output

    -------------------------------------------------------
    --- The Oculus
    -------------------------------------------------------
    --Tactics
    -- ["TheOculus_LeyGuardianEregos1"] = "",
    -- ["TheOculus_LeyGuardianEregos2"] = "",
    -- ["TheOculus_LeyGuardianEregos3"] = "",
    -- ["TheOculus_LeyGuardianEregos4"] = "",
    -- ["TheOculus_LeyGuardianEregos5"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Utgarde Pinnacle
    -------------------------------------------------------
    --Tactics
    -- ["UtgardePinnacle_SvalaSorrowgrave"] = "",
    -- ["UtgardePinnacle_SkadiTheRuthless"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Trial of the Champion
    -------------------------------------------------------
    --Tactics
    -- ["TrialOfTheChampion_ArgentConfessorPaletress"] = "This achievement will take multiple runs to complete. At 110, you can simply nuke down the boss to supress one of the memories.",
    -- ["TrialOfTheChampion_EadricThePure"] = "",

    --Chat Output

    -------------------------------------------------------
    --- The Forge of Souls
    -------------------------------------------------------
    --Tactics
    -- ["TheForgeOfSouls_Bronjahm"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Pit of Saron
    -------------------------------------------------------
    --Tactics
    -- ["PitOfSaron_Other"] = "When you run through the tunnel after the 2nd boss, no player in the group can hit by any of the icicles on the floor. The ground is marked where these icicles will fall so just make sure no one is standing in those areas.",

    --Chat Output

}

core:RegisterLocale('frFR', baseLocale)

-- core:RegisterLocale('enUS', baseLocale)