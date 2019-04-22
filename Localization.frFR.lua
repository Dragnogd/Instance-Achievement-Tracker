if(GetLocale() ~= 'frFR') then return end

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["GUI_Achievements"] = "Hauts-faits", --["Achievements"]
    ["GUI_Tactics"] = "|cffFF4000Tactique|r", --["Tactics"]
    ["GUI_TrackingNumber"] = "Actuellement suivi", --["Currently Tracking:"]
    ["GUI_Options"] = "Options", --["Options:"] --["Main"]
    ["GUI_EnableAddon"] = "Activer l'Addon", --["Enable Addon"]
    ["GUI_Enabled"] = "Activé", --["Enabled"]
    ["GUI_Disabled"] = "Désactivé", --["Disabled"]
    ["GUI_ToggleMinimap"] = "Afficher l'icone de la MiniMap", --["Show Minimap Button"]
    ["GUI_MinimapEnabled"] = "Icone de la MiniMap Activé", -- "Minimap icon enabled"
    ["GUI_MinimapDisabled"] = "Icone de la MiniMap Désactivé", -- Minimap icon disabled"
    ["GUI_AnnounceTracking"] = "Annoncer les Hauts-faits pistés au groupe", --L["Announce Achievements Being Tracked To Group"]
    ["GUI_OnlyTrackMissingAchievements"] = "Ne traquer que les Hauts-faits manquants", --["Only track missing achievements"]
    ["GUI_AnnounceMessagesToRaidWarning"] = "Envoyer les annonces sur l'Alerte Raid", --["Announce messages to Raid Warning"]
    -- ["GUI_AchievementsDiscordTitle"] = "Achievements Discord", -- "Achievements Discord"
    ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements. \n\nTactiques gentiment contribué par le 'Achievements Discord Server', une communauté où les membres peuvent rencontrer des chasseurs de HF aux vues similaires et former des groupes pour une variété de Hauts-Faits.", -- "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements."
    ["GUI_PlaySoundOnSuccess"] = "Jouer un son quand un Haut-Fait est accompli", -- "Play a sound when a achievement is completed"
    ["GUI_PlaySoundOnFailed"] = "Jouer un son quand un Haut-Fait est raté", -- "Play a sound when an achievement fails"
    ["GUI_SelectSound"] = "Selectionner un son", -- "Select Sound"
    ["GUI_TrackingDisabled"] = "Pistage des Hauts-Faits désactivé", --["(Achievement Tracking Disabled)"]
    ["GUI_EnterInstanceToStartScanning"] = "Entrez dans l'instance pour commencer le scan", --["Enter instance to start scanning"]
    -- ["GUI_BattleForAzeroth"] = "Battle for Azeroth", --["Battle for Azeroth"]
    -- ["GUI_Legion"] = "Legion", --["Legion"]
    -- ["GUI_WarlordsOfDraenor"] = "Warlords of Draenor", --["Warlords of Draenor"]
    -- ["GUI_MistsOfPandaria"] = "Mists of Pandaria", --["Mists of Pandaria"]
    -- ["GUI_Cataclysm"] = "Cataclysm", --["Cataclysm"]
    -- ["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King", --["Wrath of the Lich King"]
    ["GUI_Players"] = "Joueurs", --["Players"]
    ["GUI_Achievement"] = "Haut-Fait", --["Achievement"]
    ["GUI_NoPlayersNeedAchievement"] = "Aucun joueur du groupe n'a besoin de ce Haut-Fait", --["No players in the group need this achievement"]
    ["GUI_PlayersWhoNeedAchievement"] = "Joueurs qui ont besoin du Haut-Fait", --["Players who need Achievement"]
    ["GUI_ScanInProgress"] = "scan toujours en cours", --["scan still in progress"]
    ["GUI_Tracking"] = "Pistage", --["Tracking"]
    ["GUI_Track"] = "Suivi", --["Track"]
    ["GUI_OutputPlayers"] = "Annoncer les joueurs", --["Output Players"]
    ["GUI_OutputTactics"] = "Annoncer la tactique", --Output Tactics
    ["GUI_OnlyDisplayMissingAchievements"] = "Ne montrer que les hauts-faits manquants", -- "Only display missing achievements"
    ["GUI_GreyOutCompletedAchievements"] = "Griser les Hauts-Faits complétés", -- "Grey out completed achievements"
    ["GUI_HideCompletedAchievements"] = "Cacher les Hauts-Faits complétés", -- "Hide completed achievements",
    ["GUI_AchievementsCompletedForInstance"] = "Tous les Hauts-Faits ont étés achevés pour", -- "All achievements have been completed for"
    ["GUI_EnableAutomaticCombatLogging"] = "Activer automatiquement l'Enregistrement du combat", -- Enable automatic combat logging
	["GUI_Author"] = "Auteur", -- "Author"
    ["GUI_Translators"] = "Traducteur", -- "Translators"
    ["Gui_TranslatorNames"] = "<Les Frères Talbuk> Feant",
    ["GUI_BlockDisableAddon"] = "Vous ne pouvez pas désactiver l’addon pendant que vous êtes en combat. Attendez jusqu’à ce que vous soyez hors de combat puis essayez à nouveau", -- "You cannot disable the addon while you are are in combat. Wait till you are out of combat then try again"

    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    ["Core_StartingAchievementScan"] = "Démarrage du scan pour les Hauts-Faits", --["Starting Achievement Scan For"]
    ["Core_GameFreezeWarning"] = "Cela peut geler votre jeu pour quelques secondes", --["This may freeze your game for a few seconds"]
    ["Core_AchievementScanFinished"] = "Scan des Hauts-Faits achevé", --["Achievement Scanning Finished"]
    ["Core_EnableAchievementTracking"] = "Voulez-vous activer le pistage des hauts-faits pour", --["Do you want to enable achievement tracking for"]
    ["Core_TrackAchievements"] = "Pistage des Hauts-Faits", --["Track Achievements"]
    ["Core_Yes"] = "Oui", --["Core_Yes"]
    ["Core_No"] = "Non", --["Core_No"]
    ["Core_AchievementTrackingEnabledFor"] = "Pistage des Hauts-faits activé pour", --["Achievement Tracking Enabled for"]
    ["Core_help"] = "aide", --["help"]
    ["Core_Commands"] = "Liste des commandes 'slash'", --["List of slash commands"]
    ["Core_ListCommands"] = "Montre une liste des commandes 'slash' disponibles", --["shows a list of avaliable slash commands"]
    ["Core_CommandEnableTracking"] = "active/désactive le Pistage des Hauts-Faits IAT", --["enable/disable IAT achievement tracking"]
    ["Core_Enable"] = "active", --["enable"]
    ["Core_NoTrackingForInstance"] = "IAT ne peut pas suivre les Haits-Faits de cette rencontre.", -- "IAT cannot track any achievements for this encounter"
    ["Core_Failed"] = "RATÉ!", -- "FAILED!"
    ["Core_PersonalAchievement"] = "Haut-Fait personnel", -- "Personal Achievement"
    ["Core_Reason"] = "Raison", -- "Reason"
    ["Core_CriteriaMet"] = "Les critères ont été remplis. Le Boss peut maintenant être tué!", -- "Criteria has been met. Boss can now be killed!"
    ["Core_Counter"] = "Compteur", -- "Counter",
    ["Core_CombatLogEnabled"] = "Enregistrement du combat activé", -- "Combat Logging enabled"
    ["Core_CombatLogDisabled"] = "Enregistrement du combat désactivé", -- "Combat Logging disabled"
    -- ["Core_TranscriptorLogEnabled"] = "Transcriptor Log enabled", -- "Transcriptor Log enabled"
    -- ["Core_TranscriptorLogDisabled"] = "Transcriptor Log disabled", -- "Transcriptor Log disabled"
    ["Core_Toggle"] = "bascule", -- "toggle"
    ["Core_CommandToggleTracking"] = "Bascule la fenêtre pour activer ou désactiver le suivi des Hauts-Faits pour l’instance actuelle", -- "Toggles the window to enable or disable achievement tracking for the current instance"
    ["Core_AlreadyEnabled"] = "IAT est déjà activé pour cette instance", -- "IAT is already enabled for this instance"
    ["Core_EnableAddonFirst"] = "Veuillez d’abord activer IAT dans les options avant d’essayer de basculer le suivi des Hauts-Faits.", -- "Please enable IAT in the options first before trying to toggle achievement tracking"
    ["Core_CompletedAllAchievements"] = "Vous avez terminé toutes les Hauts-Faits pour cette instance", -- "You have completed all achievements for this instance"
    ["Core_IncompletedAchievements"] = "Hauts-Faits non-accomplis pour cette instance :", -- "Incomplete achievements for this instance"

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    ["Instances_Other"] = "Autre", 
    ["Instances_TrashAfterThirdBoss"] = "Trash aprés le 3ème boss", --L["Trash after the third boss"]

    ["Features:"] = " Fonctionnalités:",
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
    ["Shared_PlayersWhoStillNeedToGetHit"] = "Joueurs qui ont encore besoin d'être touché:", -- "Players who still need to get hit:"
    ["Shared_PlayersWithBuff"] = "Joueurs avec 'buff'", -- "Players with buff"
    ["Shared_PlayersWhoStillNeedToGetResurrected"] = "Les joueurs suivants doivent être ressuscités pour recevoir le Haut-Fait :", -- "The following players need to be resurrected in order to receive the achievement:"
    ["Shared_HasGained"] = "a gagné", -- "has gained"
    ["Shared_HasLost"] = "a perdu", -- "has lost"
    ["Shared_HasFailed"] = "a échoué", -- "has failed"
    ["Shared_HasCompleted"] = "a achevé", -- "has completed"
    ["Shared_Reason"] = "raison:", -----TODO duplicate -- "reason:"
    ["Shared_PersonalAchievement"] = "Haut-Fait personnel", -----------TODO duplicate -- "Personal Achievement"
    ["Shared_Timer10"] = "Compte à rebours démarré! Il reste 10 secondes", --TODO insert number of seconds remaining -- "Timer Started!. 10 seconds remaining"
    ["Completed"] = "Achevé", --TODO wrong format -- "Completed"
    ["Shared_JustKillBoss"] = "Au niveau max, vous pouvez simplement tuer le boss pour obtenir ce Haut-Fait", -- "At max level, you can simply just kill the boss to get this achievement"
    ["Shared_JustKillBossSingleTarget"] = "Au niveau max, vous pouvez simplement tuer le boss avec des capacités à ciblage unique pour obtenir ce Haut-Fait", -- "At max level, you can simply just kill the boss with single target abilities to get this achievement"
    ["Shared_GotHit"] = "a été touché", -- "got hit"
    ["Shared_NotHit"] = "n'a pas été touché", -- "did not get hit"
    ["Shared_PlayersHit"] = "Joueurs touchés:", -- "players hit:"
    ["Shared_CompletedBossKill"] = "sera complété une fois que le boss est tué", -- "will be completed once boss is killed"
    ["Shared_Timer3"] = "Compte à rebours démarré! 3 secondes restantes", --TODO insert number of seconds remaining -- "Timer Started! 3 seconds remaining"
    ["Shared_Countdown20"] = "20 secondes restantes", -- "20 seconds remaining"
    ["Shared_MeetsCritera"] = "répond aux critères de", -- "meets the criteria for"
    ["Shared_DoesNotMeetCritera"] = "ne répond pas aux critères pour", -- "does not meet the critera for"
    ["Shared_HasBeenInfectedWith"] = "a été infecté par", -- "has been infected with"
    ["Shared_SheCanNowBeKilled"] = "Elle peut maintenant être tuée", -- "She can now be killed"
    ["Shared_HeCanNowBeKileld"] = "Il peut maintenant être tué", -- "He can now be killed"
    ["Shared_KillTheAddNow"] = "Tuer les %s maintenant", -- "Kill the %s now"
    ["Shared_FailedPersonalAchievement"] = "%s a raté %s (Raison: %s)(Haut-Fait personnel)", -- "%s has failed %s (Reason: %s)(Personal Achievement)"
    ["Shared_DamageFromAbility"] = "%s Dégât", -- %s Damage"
    ["Shared_DirectHitFromAbility"] = "%s Coup Direct", -- "%s Direct Hit"
    ["Shared_AddKillCounter"] = "%s compteur de 'kill'", -- "%s kill counter"
    -- ["Shared_One"] = "1",
    -- ["Shared_Two"] = "2",
    -- ["Shared_Three"] = "3",
    -- ["Shared_Four"] = "4",
    -- ["Shared_Five"] = "5",
    -- ["Shared_Six"] = "6",
    -- ["Shared_Seven"] = "7",
    -- ["Shared_Eight"] = "8",
    -- ["Shared_Nine"] = "9",
    -- ["Shared_Ten"] = "10",
    -- ["Shared_Eleven"] = "11",
    -- ["Shared_Twelve"] = "12",
    -- ["Shared_Thirteen"] = "13",
    -- ["Shared_Fourteen"] = "14",
    -- ["Shared_Fifteen"] = "15",
    -- ["Shared_Sixteen"] = "16",
    -- ["Shared_Seventeen"] = "17",
    -- ["Shared_Eighteen"] = "18",
    -- ["Shared_Nineteen"] = "19",
    -- ["Shared_Twenty"] = "20",
    ["Shared_WasKilled"] = "a été tué", -- "was killed"
    ["Shared_Found"] = "trouvé", -- "found"
    -- ["Shared_ReportString"] = "Please report the following string to the IAT author", -- "Please report the following string to the IAT author"
    ["Shared_PlayersWhoNeedAchievement"] = "Joueurs qui ont besoins de ce HF", -- "Players who need achievement"
    ["Shared_HasStolenFrom"] = "a volé de", -- "has stolen from"
    ["Shared_WaitForAnother"] = "Attendre %s pour collecter un autre %s", -- "Wait for %s to collect another %s"

--[[     ------------------------------------------------------- BATTLE FOR AZEROTH -------------------------------------------------------
▄▄▄▄·  ▄▄▄·▄▄▄▄▄▄▄▄▄▄▄▄▌  ▄▄▄ .    ·▄▄▄      ▄▄▄       ▄▄▄· ·▄▄▄▄•▄▄▄ .▄▄▄       ▄▄▄▄▄ ▄ .▄
▐█ ▀█▪▐█ ▀█•██  •██  ██•  ▀▄.▀·    ▐▄▄·▪     ▀▄ █·    ▐█ ▀█ ▪▀·.█▌▀▄.▀·▀▄ █·▪    •██  ██▪▐█
▐█▀▀█▄▄█▀▀█ ▐█.▪ ▐█.▪██▪  ▐▀▀▪▄    ██▪  ▄█▀▄ ▐▀▀▄     ▄█▀▀█ ▄█▀▀▀•▐▀▀▪▄▐▀▀▄  ▄█▀▄ ▐█.▪██▀▐█
██▄▪▐█▐█ ▪▐▌▐█▌· ▐█▌·▐█▌▐▌▐█▄▄▌    ██▌.▐█▌.▐▌▐█•█▌    ▐█ ▪▐▌█▌▪▄█▀▐█▄▄▌▐█•█▌▐█▌.▐▌▐█▌·██▌▐▀
·▀▀▀▀  ▀  ▀ ▀▀▀  ▀▀▀ .▀▀▀  ▀▀▀     ▀▀▀  ▀█▄▀▪.▀  ▀     ▀  ▀ ·▀▀▀ • ▀▀▀ .▀  ▀ ▀█▄▀▪▀▀▀ ▀▀▀ · 
]]--                                                                                                                                                                                                               

    -------------------------------------------------------
    --- Crucible Of Storms - Creuset des Tempêtes
    -------------------------------------------------------
    --Tactics
    -- ["CrucibleOfStorms_TheRestlessCabal"] = "During the fight, Fa'thuul the Feared will spawn Void Crashes in pairs of 2. These are large purple meteors that will bounce around the room until it hits a player. The impact radius will reduce everytime it bounces without being soaked. (this will only occur twice). Simply avoid all crashes until you have 10 and then kill the boss. You only need to have 10 crashes active at some point during the fight. I highly recommend doing it at the start.",
    ["CrucibleOfStorms_TheRestlessCabal"] = "Pendant le combat, Fa’thuul le craint va faire apparaître des 'Déferlante du Vide' par paire de 2. Ce sont de grands météores violets qui rebondiront autour de la salle jusqu’à ce qu’il frappe un joueur. Le rayon d’impact réduit chaque fois qu’il rebondit sans être touché. (Cela ne se produira que deux fois). Il suffit d’éviter tous les 'crashes' jusqu’à ce que vous en ayez 10, puis tuer le boss.\n\n Vous avez seulement besoin d’avoir 10 'accidents' actifs à un moment donné pendant le combat. Je recommande fortement de le faire au départ.",
    -- ["CrucibleOfStorms_UunatHarbingerOfTheVoid"] = "For this achievement you must not move while N'Zoth's eye is open. This achievement is personal, and you can also get it while you are dead.\nN'Zoth's eye opens for a few seconds when Uu'nat casts Gift of N'Zoth, so stop moving completely once the boss gets close to 90 energy.\n Just assign a person to call out 'do not move' and 'you can move now'.",
    ["CrucibleOfStorms_UunatHarbingerOfTheVoid"] = "Pour ce Haut-Fait, vous ne devez pas bouger tant que l’œil de N’zoth est ouvert. Ce Haut-Fait est personnel, et vous pouvez également l’obtenir pendant que vous êtes mort.\n\nL’œil de nn’zoth s’ouvre pendant quelques secondes quand uu’nat lance 'Don de N’Zoth', alors arrêtez de bouger complètement une fois que le boss se rapproche de 90 d’énergie.\n Il suffit d’assigner une personne pour prévenir 'ne pas bouger!' et 'vous pouvez bouger'.",

    --Chat Output
   -------------------------------------------------------
    --- Battle of Dazar'alor - Bataille de Dazar'alor
    -------------------------------------------------------
    ["BattleOfDazaralor_ChampionOfTheLight_Alliance"] = "Pour réaliser ce Haut-Fait, vous devrez voler 3 objets à chacun des ennemis de la rencontre et les amener au Tas de déchets mystérieux. Vous devrez voler 9 objets au total: 3 de %s, 3 de %s et 3 de %s.\n\n En outre, ce Haut-Fait requiert que tout le monde dans le raid interagisse avec le Tas de déchets mystérieux pour obtenir le debuff %s. Pendant le combat contre le boss, les joueurs seront transformés en %s et recevront un bouton d’action supplémentaire à utiliser sur les ennemis pour voler un objet.\n\n Une fois que votre groupe de raid aura remis les 9 objets (3 de chaque type de PNJ) ) vous pouvez tuer le boss et obtenir le haut-fait.",
    ["BattleOfDazaralor_ChampionOfTheLight_Horde"] = "Pour réaliser ce Haut-Fait, vous devrez voler 3 objets à chacun des ennemis de la rencontre et les amener au Tas de déchets mystérieux. Vous devrez voler 9 objets au total: 3 de %s, 3 de %s et 3 de %s \n\n. En outre, ce Haut-Fait requiert que tout le monde dans le raid interagisse avec le Tas de déchets mystérieux pour obtenir le debuff %s. Pendant le combat contre le boss, les joueurs seront transformés en %s et recevront un bouton d’action supplémentaire à utiliser sur les ennemis pour voler un objet.\n\n Une fois que votre groupe de raid aura remis les 9 objets (3 de chaque type de PNJ) ) vous pouvez tuer le boss et obtenir le haut-fait.",
    ["BattleOfDazaralor_JadefireMasters"] = "Pour cette réalisation, vous devrez récupérer les %s cachés dans l'arène des boss, les protéger des incendis et laisser le moine lancer %s dessus. \n\n Vous devriez récupérer l'œuf après la première série de %s, ainsi vous ne risquez pas de perdre l’œuf en %s. Assurez-vous de le récupérer avant le début de la phase 2, car %s le rompra. \n\n Le moine se transformera en %s à 100 énergies. Après que %s ait atteint le joueur qui tient l'œuf, vous pouvez tuer le boss pour obtenir le haut-fait. \n\n Les emplacements des %s sont différents pour la Horde et l'Alliance.",
    ["BattleOfDazaralor_Grong_Alliance"] = "Pour ce Haut-Fait, vous devrez transporter et placer 6 barils au sol avant le combat contre %s. Vous pouvez trouver les %s à côté des escaliers avant de monter à la zone du boss.\n\n Placer les %s sur le sol, engager le boss, et s’assurer que les barils soient touchés par %s.\n\n Une fois que les %s sont détruits, le boss gagnera un buff de 20%% des dégâts pour 30 secondes par baril détruit (%s). Une fois que tous les barils sont détruits, tuez le boss et vous obtiendrez le Haut-Fait.",
    ["BattleOfDazaralor_Grong_Horde"] = "Pour ce Haut-Fait, vous devrez transporter et placer 6 barils au sol avant le combat contre %s. Vous pouvez trouver les %s à côté des escaliers avant de monter à la zone du boss.\n\n Placer les %s sur le sol, engager le boss, et s’assurer que les barils soient touchés par %s.\n\n Une fois que les %s sont détruits, le boss gagnera un buff de 20%% des dégâts pour 30 secondes par baril détruit (%s). Une fois que tous les barils sont détruits, tuez le boss et vous obtiendrez le Haut-Fait.",
    ["BattleOfDazaralor_Opulence"] = "Pour obtenir ce Haut-Fait, vous devrez d’abord vous assurer qu’au moins un joueur a la mascotte %s.\n\n La réalisation est personnelle et exige que le joueur utilise une commande /praise sur la mascotte %s, sous l’effet d’un %s. La mascotte n’a pas besoin d’être le vôtre. \n\n Pour passer sous les %s, un ou plusieurs joueurs devront ramasser des %s. Ce bijou donnera au joueur une pile de %s alors qu’ils sont seuls. En atteignant 100 piles, ils gagneront l'aura %s pendant 20 secondes, accordant au joueur et à tous les joueurs voisins %s, augmentant le taux critique de 100%%. Le buff prendra environ 100 secondes pour apparaître, et une fois qu’il est actif /praise la mascotte %s pour obtenir le crédit de ce Haut-Fait.",
    ["BattleOfDazaralor_ConclaveOfTheChosen"] = "Pour obtenir ce Haut-Fait, vous devrez laisser l’un des trois raptors initiaux en vie jusqu’à la fin du combat. Vous pouvez tuer le reste, mais puisque vous ne pouvez pas les CC, vous aurez besoin d'en 'kite' un pour toute la durée du combat.\n\n Un joueur différent sera fixé par le %s toutes les 20 secondes (%s), donc vous devrez vous assurer que le joueur le 'kite' loin du raid pour éviter tout dommage AoE.\n\n Un ou deux DK peuvent être utiles dans ce combat car ils peuvent %s le raptor loin du raid.",
    ["BattleOfDazaralor_KingRastakhan"] = "Pour faire ce Haut-Fait, vous aurez besoin de garder les 'adds' fantômes vivants jusqu’à la fin du combat. Il suffit de les éloigner du raid pour éviter des dommages inutiles.\n\n Un troisième Tank est idéal pour cette réalisation",
    ["BattleOfDazaralor_HighTinkerMekkatorque"] = "Pour ce Haut-Fait, vous aurez besoin d’un ingénieur avec %s et %s.\n\n Invoquer les deux Blingotrons avant de commencer le combat et ils vont commencer un duel. Peu de temps après le Boss est engagé, le %s va 'spawn'. C’est facile à tuer, alors tuez le et finissez le combat du boss et vous devriez avoir le HF.\n\n %s a deux capacités :\n %s -capacité AoE de  8 mètres autour du npc, éloignez-vous si vous êtes au CaC.\n %s - Chaîne foudroyante, rester écarté ou interrompre le 'cast'.",
    ["BattleOfDazaralor_StormwallBlockade"] = "Pour accomplir ce Haut-Fait, vous devrez invoquer des %s pendant le combat du Boss. Vous n’avez pas besoin de battre des %s.\n\n Pour invoquer %s vous devez cliquer sur un ban de poissons à gauche des quais après que le boss a été engagé. Idéalement, vous voulez qu’un seul joueur reste derrière sur les quais pour l’invoquer. Ce joueur devra faire face à quelques mécaniciens pendant 2 minutes.\n\n -Après avoir cliqué sur le ban de poisson, le joueur va commencer à tirer une corde hors de l’eau, et ils vont commencer à se faire tirer hors de l’eau. Marchez dans la direction opposée pour rester sur les quais, mais ne marchez pas trop loin du bord ou la corde se brisera.\n -Peu de temps après, %s va commencer à tomber sur le joueur, qui devra les esquiver pour rester en vie.\n -Après cela, les vagues vont s’écraser sur les quais, et le joueur tirant la corde devra les esquiver.\n\n Ceci se poursuivra jusqu’à la fin de la course de 2 minutes. Le reste du raid doit effectuer le combat du boss comme d’habitude.\n\n Une fois que les %s sont générés, le joueur invoquant, et plus tard le raid, devra faire face à ses deux capacités aux côtés des capacités normales du boss :\n %s - Un cône frontal qui repoussera n’importe qui, les tirant dans l’eau\n %s - Tire tous les joueurs vers %s, tuant instantanément ceux qui deviennent trop proches.\n\n Pour traiter avec %s, vous aurez besoin d’un Voleur uniquement se concentrant sur l’étourdissement chaque fois qu’il lance %s. Si vous n’avez pas de Voleur, alors vous devrez faire une rotation de cc. Le reste du raid devra tuer le boss avant son 'enrage', tout en traitant des %s en plus de la mécanique.",
    ["BattleOfDazaralor_JainaProudmoore"] = "Pour accomplir ce Haut-Fait, vous aurez d’abord besoin de 3 joueurs pour collecter des monticules de neige pendant la lutte contre %s.\n\n Les monticules de neige ne peuvent être trouvés que lors du premier entracte. Les monticules de neige seront uniformément répartis autour de la zone circulaire de sorte que vous aurez besoin d’au moins 3 joueurs 'rapide' pour commencer à courir dès que la phase commence.\n\n Marchez à travers un monticule de neige et un petit flocon de neige apparaîtra à côté de votre personnage. Une fois que les 3 ont été trouvés, interrompez le boss pour entrer dans la phase suivante. Les joueurs qui ont le flocon de neige doivent empiler près de l’un des barils pour créer les %s.\n\n Utiliser des %s pour retirer les %s du baril à côté des %s, puis attaquer le baril. L’explosion fera fondre les %s, ce qui a permettra d’atteindre les critères de ce HF.",

    --Chat Output
    ["BattleOfDazaralor_PraiseEmote"] = "Vous louez %s", -- "You praise %s"
    ["BattleOfDazzarlor_BarrelsDestroyed"] = "Barils détruits", -- "barrels destroyed"
    ["BattleOfDazzarlor_PraiseSelf"] = "Vous prodigez l'éloge sur", -- "You lavish praise upon"
    ["BattleOfDazzarlor_PraiseOther"] = "prodigue l'éloge", -- "lavishes praise upon"
    ["BattleOfDazzarlor_PlayersTransformed"] = "Certains joueurs sont actuellement transformés. Ne pas tuer le boss encore", -- "Some players are currently transformed. Do not kill boss yet"
    ["BattleOfDazzarlor_OpulenceRangeWarning"] = "Avertissement : Pour que IAT suive correctement ce HF, %s doit être dans un rayon de 25 mètres des joueurs 'praising' les %s. Les joueurs avec les %s devraient se tenir ensemble pour rendre cela plus facile", -- "Warning: For IAT to track this achievement correctly, %s must be within 25 yards of players praising the %s. Players with the %s should stand together to make this easier"

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
    -- ["Freehold_RingOfBooty"] = "Pour ce Haut-Fait, vous devrez ramasser 3 objets dans l’instance: \n|cffFFA888%s|r apparaît dans le nid du premier boss après sa défaite, \n|cffFFA888%s|r se trouve au sommet d'une plate-forme du quartier du Rhum, et \n|cffFFA888%s|r se trouve près de Trothak<Le cogneur aux requins> après le troisième boss.",
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
    -- ["TempleOfSethraliss_Merektha_LootSnake"] = "Loot the %s now to complete the achievement", 
    ["TempleOfSethraliss_Merektha_LootSnake"] = "Ramassez le %s maintenant pour compléter le Haut-Fait", -- %s ?

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

--[[    ------------------------------------------------------------- LEGION -------------------------------------------------------------
▄▄▌  ▄▄▄ . ▄▄ • ▪         ▐ ▄ 
██•  ▀▄.▀·▐█ ▀ ▪██ ▪     •█▌▐█
██▪  ▐▀▀▪▄▄█ ▀█▄▐█· ▄█▀▄ ▐█▐▐▌
▐█▌▐▌▐█▄▄▌▐█▄▪▐█▐█▌▐█▌.▐▌██▐█▌
.▀▀▀  ▀▀▀ ·▀▀▀▀ ▀▀▀ ▀█▄▀▪▀▀ █▪
]]--

    -------------------------------------------------------
    --- The Emerald Nightmare - Le Cauchemar d'émeraude
    -------------------------------------------------------
    --Tactics
    -- ["TheEmeraldNightmare_Nythendra"] = "During the %s phase, %s will spawn around the edges of the room. Once they spawn players need to click on the bugs to squish them. Once 15 bugs have been squished you can kill the boss. 5 bugs spawn each phase so you will need a minimum of 3 %s phases to complete this achievement.",
    -- ["TheEmeraldNightmare_Ursoc"] = "Kill the trash to the right hand side just outside the entrance to the cave where the boss is located. Free %s and wait for him to reach the boss. Kill the boss while keeping %s alive to get this achievement.",
    -- ["TheEmeraldNightmare_DragonsOfNightmare"] = "There are 4 portals around the boss room. Everyone in the group must go into each of the 4 portals and collect 1 mist from each portal which gives them a buff. Once all players in the group have 4 buffs %s %s %s %s you can kill the boss. You will need to leave atleast one player out at the start of the fight to tank the bosses while everyone else is collecting mists.",
    -- ["TheEmeraldNightmare_EleretheRenferal"] = "For this achievement, there are 7 eggs with a glowing red effect located around the room. To complete this achievement all 7 eggs need to be destroyed by running over them. Some of the eggs can only be reached by using %s or players using effects such as %s, %s or %s. Once all 7 eggs have been destroyed you can kill the boss.\n\n Note: If you cannot see any of the eggs, they will respawn after you have engaged the boss.",
    -- ["TheEmeraldNightmare_IllgynothHeartOfCorruption"] = "Wait for 20 %s to spawn by killing the tentacles that spawn. Once you have 20 %s alive, everyone in the group will need to stand in front of the eye, then AOE down all the adds together. Once 20 adds have been killed in 10 seconds on top of the eye, you can kill the boss.",
    -- ["TheEmeraldNightmare_Cenarius"] = "At max level, with enough dps you can kill the boss before any of the %s are cleansed.",
    -- ["TheEmeraldNightmare_Xavius"] = "To complete this achievement, you will need a Demon Hunter to use his %s ability. Around the outer edges of the boss room, a %s will spawn at 3 points during the fight. The Demon Hunter will need to use his %s ability to find the add and drag it into the centre of the room. The adds spawn at 100-65%%, 65%%-30%% and below 30%%. Once all 3 %s have been killed, you can kill the boss.",

    --Chat Output
    -- ["TheEmeraldNightmare_NightmareIchors"] = "Nightmare Ichors", --Todo
    -- ["TheEmeraldNightmare_IllgynothComplete"] = "20 Nightmare Ichors have spawned. They can now be killed at the eye", --Todo
    -- ["TheEmeraldNightmare_NightmareIchorsKilled"] = "Nightmare Ichors Killed:", --Todo
    -- ["TheEmeraldNightmare_DragonsOfNightmare_PlayersWithBuffs"] = "Players with all 4 buffs", --Todo
    -- ["TheEmeraldNightmare_Xavius_CreaturesKilled"] = "Creature of Madness Killed", --Todo
    -- ["TheEmeraldNightmare_Nythendra_BugsSquished"] = "Glow Bugs Squished", --Todo

    -------------------------------------------------------
    --- Trial of Valor - Le Jugement des Valeureux
    -------------------------------------------------------
    --Tactics
    -- ["TrialOfValor_Odyn"] = "For this achievement you will need to reach phase 2 by killing %s and %s. Next you will need to wait for the boss to cast %s, at which point the runes on the floor will light up and adds will spawn with the corresponding runes above their heads. You will need to remember the order the runes lite up on the floor and then kill the corresponding adds on the matching runes in that order.\n\n Once the requirements of the achievement have been met you will gain %s which means you can kill the boss.",
    -- ["TrialOfValor_Guarm"] = "For this achievement, a player will need to pick up %s next to the boss at the start of the fight. This bone will need to be dragged into each of the 3 breaths cast by the boss (%s, %s, %s).\n\n Note: Do not do any of the following while holding the bone or you will drop it.\n Do not cast any spells.\n Do not get hit by %s.\n Dying while holding the bone.\n\n You will need a separate player to soak each of the breaths. Therefore once one player has soaked a breath, they will need to drop the bone so another player can pick it up. Once all 3 breaths have been soaked while holding the chew toy you can kill the boss.",
    -- ["TrialOfValor_Helya"] = "At max level, this achievement is easier to complete solo. Simply kill the boss without having the %s debuff. This can be done by making sure the %s add is killed before killing the boss.",

    --Chat Output
    -- ["TrialOfValor_Guarm_Part1"] = "Fiery Phelgm (Orange) part of", --Todo
    -- ["TrialOfValor_Guarm_Part2"] = "Salty Spittle (Green) part of", --Todo
    -- ["TrialOfValor_Guarm_Part3"] = "Dark Discharge (Purple) part of", --Todo

    -------------------------------------------------------
    --- The Nighthold - Palais Sacrenuit
    -------------------------------------------------------
    --Tactics
    -- ["TheNighthold_Skorpyron"] = "At max level, have your whole group stand in the circle in the middle of the room and kill the boss before he casts %s.",
    -- ["TheNighthold_ChronomaticAnomaly"] = "This achievement is easier to complete in heroic mode. Random players will get a %s debuff. These players need to stand on the blue circles around the boss room until the %s debuff expires. Once it expires you will see a spotlight appear at the location the %s exploded at. Once at least 8 circles around the room have spotlights, you can kill the boss.",
    -- ["TheNighthold_SpellbladeAluriel"] = "This achievement requires dragging %s to various locations around the instance.\n\n The Shal’dorei Terrace: Located in the Botanist boss area. This can be completed on the bridge.\n Astromancer’s Rise: The room directly below Star Augar Etraeus.\n The Shattered Walkway: Located in front of Krosus.\n\n This achievement will take 3 lockouts to complete and can be completed in a single day.", --TODO
    -- ["TheNighthold_StarAugurEtraeus"] = "For this achievement, you will need to drag the %s add in the %s boss room up to %s.\n\n You then need to dps the boss down to 30%% without damaging the add. The add will then transform into a %s at which point you can kill the add and then kill the boss.",
    -- ["TheNighthold_HighBotanistTelarn"] = "Scattered around the boss area are Mysterious Fruits. To complete this achievement every player needs to eat one of these fruits before pulling the boss and must not die during the encounter. The mysterious fruit will give the player the %s debuff. At max level you can simply nuke down the boss.\n\n Note: You must have at least 10 players minimum to complete this achievement.",
    -- ["TheNighthold_Krosus"] = "To complete this achievement, you must let 15 %s fall in the water when the bridge breaks. At max level you can simply not soak any of the %s to maximise the amount of %s falling into the water.\n\n Note: The amount of %s that spawn increases with more players in the group.",
    -- ["TheNighthold_Tichondrius"] = "At max level, you can simply kill the boss before he casts %s.\n\n Note: This achievement is a personal achievement.",
    -- ["TheNighthold_Elisande"] = "For this achievement you will need to summon a %s pet before pulling the boss.\n\n You then to wait for the %s and %s to spawn, then kill both of the adds on top of one another. Next drag the %s pet into the overlapping bubbles created from the elementals dying. This will spawn allow the %s to be killed. Once the add is dead you can kill the boss.",
    -- ["TheNighthold_Guldan"] = "During phase 2, group up and wait for %s to spawn. The eyes will %s themselves over time spawning more and more eyes. Once 16 %s have spawned, kill them within 3 seconds of one another then kill the boss.",

    --Chat Output
    -- ["TheNighthold_Skorpyron_NoPlayersHit"] = "No players were hit by Shockwave",
    -- ["TheNighthold_Trilliax_ToxicSlices1"] = "Toxic slice eaten. You can only eat a maximum of",
    -- ["TheNighthold_Trilliax_ToxicSlices2"] = "more toxic slices",
    -- ["TheNighthold_StarAugur_KillAdd"] = "Kill the Well-Traveled Nether Elemental now",
    -- ["TheNighthold_Spellblade_Location1"] = "'The Shal'dorei Terrace part of'",
    -- ["TheNighthold_Spellblade_Location2"] = "'Shattered Walkway part of'",
    -- ["TheNighthold_Spellblade_Location3"] = "'Astomancers Rise part of'",
    -- ["TheNighthold_Botanist_LostBuff"] = "has LOST the Mysterious Fruit debuff",
    -- ["TheNighthold_Botanist_GainedBuff"] = "has got the Mysterious Fruit debuff",
    -- ["TheNighthold_Krosus_AddKilled"] = "killed a Burning Ember",
    -- ["TheNighthold_Krosus_AddKilledTotal"] = "Burning Embers Killed",
    -- ["TheNighthold_Guldan_Eyes"] = "Eye of Gul'dan",
    -- ["TheNighthold_Guldan_EyesTotal"] = "16 Eye of Gul'dan have spawned",

    -------------------------------------------------------
    --- Tomb of Sargeras - Tombe de Sargeras
    -------------------------------------------------------
    --Tactics
    -- ["TombOfSargeras_Goroth"] = "For this achievement have your ranged dps and healers stack up together so that %s spawns the %s in a straight line pointed towards him. Once someone is marked by %s they will have to go behind the pillars so that the star collides with the %s and destroys them.\n\n Once 30 %s have been destroyed you can kill the boss.",
    -- ["TombOfSargeras_DemonicInquisition"] = "Dps the boss down to around 20%%. Now whenever %s reaches one hundred energy he will cast %s, so everyone in the raid should attack him to get max torment really fast.\n\n Once everyone in the group has max torment you can kill the boss.",
    -- ["TombOfSargeras_Harjatan"] = "To spawn %s someone in the raid has to use the %s toy.\n\n Use the toy at the start of the fight, focus %s, and after he dies you can kill the boss.",
    -- ["TombOfSargeras_MistressSasszine"] = "To complete this achievement, you need to feed each of the items below into %s %s during Phase 2 (70%%) of the encounter.\n\n 'Hydra Essence' comes from a player being hit by %s in the outer circle of the %s.\n 'Ink Sauce' comes from a player soaking the %s patch which has to come in contact with the outer circle of the %s.\n 'Player Seasoning' comes from a player dying in the inner circle of %s.\n 'Eel Tartare' comes from the %s being sucked into the outer circle of the %s.\n 'Murloc Fillet' comes from the %s being sucked into the outer circle of the %s.\n\n Note: The %s and the %s need to be around 10%% health before they can be sucked into the %s. The %s only spawns during phase 1 so do not push the boss to phase 2 till at least 1 of those adds have spawned.",
    -- ["TombOfSargeras_SistersOfTheMoon"] = "On your way to the %s room you'll enter a large room full of trash and to the left you will find an isolated add called %s, which you will have to drag to the boss room.\n\n Bring the boss down to 20%% health and the %s will change its color to blue. Now you can kill the add, then kill the boss and you'll get the achievement.",
    -- ["TombOfSargeras_TheDesolateHost"] = "At the start of the fight a soul falls down and a player has to catch it by standing in the swirly yellow circle underneath the Engine of Souls.\n After that, every 5 seconds the soul will be launched in a random direction and a player from the opposite realm has to catch it. \n\n You will have to assign two people in each realm because the same person cannot soak two times in a row. The reason you do that is because if one of the players has the 'soul' above their character that means they recently caught it and are unable to do it again until someone else from the same realm catches the soul.\n\n Soak Rotation\n Soaker 1 - Corporeal Realm\n Soaker 1 - Spirit Realm\n Soaker 2 - Corporeal Realm\n Soaker 2 - Spirit Realm\n\nTips\n To make soaking easier, assigned players have to be marked and once they catch the soul they should always move towards a marked position such as the center of the room.\n Soakers should also watch out for the Reanimated Templar as as he will periodically cast %s, a spell that will knock them back if they get hit by the fel waves.\n Everyone affected by %s should move as far away as possible to avoid placing a wedge of shadow goo on the ground where the soul is supposed to be caught.",
    -- ["TombOfSargeras_MaidenOfVigilance"] = "There are a total of 9 Titanic Anomalies that you have to catch: 5 inside the well and 4 above the platform where you fight the Maiden of Vigilance.\n\n Split the raid into 2 parts as usual and then place a third world marker where assigned players will stack up to cause %s on themselves.\n\n The first Titanic Anomaly is pretty hard to capture since the gravity will pull you down as soon as you get %s. This is where your Demon Hunters, Hunters and Shamans come in handy due to their mid-air displacement abilities and because you don't want to waste too much time with this first orb you should sacrifice one of them.\n\n The next four Titanic Anomalies spawn as soon as the first one is captured and they rotate in a clockwise direction. You will have to go by trial and error until people get used to the timings. Jumping when you have 5 seconds left on the debuff seems to be the best moment to do it since you'll also make it back on the platform after you've captured the orb.\n\n Once you've collected all the orbs inside the well, the last four Titanic Anomalies will spawn above the platform and these ones are much easier to get. Just zoom out your camera and position your back towards the orbs so that you will catch it when you get knocked up into the air.",
    -- ["TombOfSargeras_FallenAvatar"] = "At max level you can just kill the boss before he cast %s.",
    -- ["TombOfSargeras_Kiljaeden"] = "Preparation:\n Get as many Death Knights as you possibly can since their %s and %s are necessary for this achievement.\n Make sure every single player in the raid has their minimap zoomed in. As soon as someone finds Illidan during 'Intermission: Deceiver's Veil' that player can ping on the minimap to let others know of his location.\n Due to their insane mobility, Monks and Warriors are extremely helpful and they should talent %s / %s.\n\n Strategy\n Tank Kil'jaeden in a corner of the platform to force the adds to spawn close to each other.\n Assign your Death Knights to grip the Shadowsouls. They should always %s first and then %s.\n Everyone should spread out in a semicircle around Kil'jaeden so that at least 1 person will instantly find Illdan, get the %s buff and then rush towards the Shadowsouls to AoE stun and kill them.",

    --Chat Output

    -------------------------------------------------------
    --- Antorus the Burning Throne - Antorus, le Trône ardent
    -------------------------------------------------------
    --Tactics
    -- ["AntorusTheBurningThrone_GarothiWorldbreaker"] = "For this achievement once someone is targeted by %s, that player will have to move near a worm in order to get it killed.\n\n Once you have killed 16 worms, the achievement will turn white and you can kill the boss",
    -- ["AntorusTheBurningThrone_FelhoundsOfSargeras"] = "During the fight several pools of orange and purple color will spawn throughout the room. The tanks will have to bring each felhound to the pool that matches their own color in order to get a stack of %s. \n\nNote that the %s stacks get removed if the felhounds come close to each other. \n\nOnce both F'harg and Shatug have 5 stacks each you can kill the bosses.",
    -- ["AntorusTheBurningThrone_AntoranHighCommand"] = "At max level, you can just nuke the boss down without placing any %s",
    -- ["AntorusTheBurningThrone_PortalKeeperHasabel"] = "To open the Chaotic Rift, one player must be affected by all 3 debuffs from each platform at the same time. Bear in mind that this can only be done in Phase 1, which ends when the boss reaches 90%%, so make sure not to dps the boss at all.\n\nTo make this achievement easier, you can have one player bring the %s (orange debuff) close to the green platform. After that, another player can pick up the %s (purple debuff) from the purple platform, and then go to the green platform to pick up the %s (orange debuff) and the %s (green debuff).\n\nCombining these three debuffs will open a chaotic rift which will pull you constantly towards the back of the room.\n\nOnce the Chaotic Rift is open you can kill the boss",
    -- ["AntorusTheBurningThrone_Eonar"] = "For this achievement, you will need to collect the 5 orbs of life within Eonar's Sanctuary. This achievement can be obtained only after you defeat the encounter. \n\nThe orbs spawn in a fixed pattern. After collecting the first  Orb of Life, you will then have to collect the rest within a certain amount of time or the orb sequence will reset.\nOrb 1 - Spawns on the platform which is connected to the lower and upper tracks with jump pads. Upon entering the Sanctuary, the platform is straight ahead.\nOrb 2 - Spawns on one of the pillars at the door near the middle path, which is the door you enter the Sanctuary through.\nOrb 3 - Spawns underneath Eonar's Essence platform, which is located to the left upon entering the Sanctuary.\nOrb 4 - Spawns between the two pillars underneath the upper path and is close to the first orb.\nOrb 5 - Spawns on a balcony far forward from the entrance to the Sanctuary, which you can reach by using the Extra Action Button.\n\n Once all 5 orbs are picked up, everyone in the raid group will get credit for it and obtain the achievement.",
    -- ["AntorusTheBurningThrone_ImonarTheShoulhunter"] = "For this achievement, you have to trigger all the traps on the bridge during the 2 intermissions. Intermission one happens at 66% health and Intermission two happens at 33% health. Once both intermissions are complete you can kill the boss",
    -- ["AntorusTheBurningThrone_Kingaroth"] = "For this achievement you will want to have your entire raid group stay in melee range of the boss and only detonate the %s that spawn in melee.\n\n Slowly dps the boss down until atleast 9 %s have spawned. Wait for the adds to come to the boss to avoid detonating %s",
    -- ["AntorusTheBurningThrone_Varimathras"] = "%s is triggered whenever a player is not within 8 yards of another player. Varimathras casts %s every 35 to 40 seconds, which will knock back the first target that he gets in contact with.\n\n The easiest way to complete this achievement at max level is to have your entire raid stack up against the wall with the tanks slightly in front of the group. You can then just kill the boss without anyone in the group moving.",
    -- ["AntorusTheBurningThrone_CovenOfShivarra"] = "This achievement is pretty straightforward and easy, however how you deal with the adds depends on your RNG:\nIf you get the %s as your first or second torment then you should kill all of them since your healers might struggle keeping everyone alive, and then wait for another wave to spawn.\n\nThe %s can be crowd controlled, so use abilities such as %s, %s or %s\n\nDon't forget to spread out while %s is active and move into a safe spot from the %s",
    -- ["AntorusTheBurningThrone_Aggramar"] = "For this achievement you will have to transform an Ember of Taeshalach into a Manifestation of Taeshalach. To accomplish that, the Ember has to get hit twice by Aggramar's %s combo.\n\nFirst you will want to let the Ember of Taeshalach move away from the edge of the platform, and then have a  Warlock %s it. In case you don't have any warlocks, you can use %s, %s or other crowd controls, however make sure that everyone stops dps on the boss to avoid any kind of accidental cleave, which might end up breaking the crowd control.\n\nThe %s is %s - %s - %s - %s - %s\n\nNote that you have to transform the Ember of Taeshalach within a single phase or else it will detonate, and because of this you should do it in Stage 2: Champion of Sargeras (80%%-40%%).",
    -- ["AntorusTheBurningThrone_Argus"] = "For this achievement you will first have to get to Phase 4 of the fight. Once Argus kills the group only have the healers and tanks respawn using the tree. The rest of the group should stay dead and spread around the edges of the room.\n\nNow whenever Argus spawns atleast 6+ Reorigination Modules, wait for them to explode then have the players dead collect the Motes of Titanic Power around the room. You may wish to asssign one person inside the spirit world to make a short countdown so that everyone starts picking up the motes at the exact same time since you only have 5 seconds to complete the achievement. Once this is done, have the remaining players respawn using the tree and kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Seat of the Triumvirate - Siège du triumvirat
    -------------------------------------------------------
    --Tactics
    -- ["SeatOfTheTriumvirate_ZuraalTheAscended"] = "About forty seconds into the fight the boss will target a random player and cast %s which will knock that player backwards into the void realm.\n\n Now that player will want to fill up their energy bar, attack %s and then use the extra action button %s near him so that both of them will get sent back to the normal realm.\n\n From there you just kill %s, then %s and there's your achievement.",
    -- ["SeatOfTheTriumvirate_Saprish"] = "For this achievement you will need to stand on top of the 4 %s around the room so that %s breaks it when he jumps to one of the players. Once all the %s have been broken you can kill %s and get the achievement.",
    -- ["SeatOfTheTriumvirate_Lura"] = "On your way from the second to the third boss you will find pools of void that pull you towards the center of them where you will get a stack of %s every second. Once you get 10 stacks, the debuff gets replaced by a new one called %s. Killing %s while affected by %s will award the achievement.",

    --Chat Output

    -------------------------------------------------------
    --- Assault on Violet Hold - Assaut sur le fort Pourpre
    -------------------------------------------------------
    --Tactics
    -- ["AssaultOnVioletHold_MillificentManastorm"] = "To complete this achievement you will need to use the %s toy while fighting %s",
    -- ["AssaultOnVioletHold_Festerface"] = "In order to get the %s to spawn, %s needs to reach 100 energy. His energy decreases when he is near a pool on the floor so the boss will need to be kited away from the pools. Once the %s has spawned kill it then kill the boss to get this achievement.",

    --Chat Output

    -------------------------------------------------------
    --- Eye of Azshara - L'Œil d'Azshara
    -------------------------------------------------------
    --Tactics
    -- ["EyeOfAzshara_LadyHatecoil"] = "When the %s debuff expires or is dispelled you will do a breath in the direction that you are currently facing killing any %s in its path. In order to get the achievement you need to do 1 breath on 11 or more %s. The %s will spawn over time so face yourself away from the adds until 11 or more have spawned.",

    --Chat Output

    -------------------------------------------------------
    --- Darkheart Thicket - Fourré Sombrecœur
    -------------------------------------------------------
    --Tactics
    -- ["DarkheartThicket_Dresaron"] = "After pulling the boss, run through the big egg behind %s to hatch it. Next kill the %ss that spawns then kill the boss.",
    -- ["DarkheartThicket_ShadeOfXavius"] = "DPS the boss down to 15%%-20%% health. Drag the boss through the swirly puddles on the ground until the boss has 10 stacks of %s then kill the boss.",

    --Chat Output

    -------------------------------------------------------
    --- Halls of Valor - Salles des Valeureux
    -------------------------------------------------------
    --Tactics
    -- ["HallsOfValor_Other1"] = "Make your way over to the %s area. Clear the entire area except for the %s you see when you teleport in and any %s. Once you're done, aggro the %s and kite him over to the 10 %s in the area. Once the %s has 10 stacks of %s you can kill it to get the achievement.",
    -- ["HallsOfValor_Other2"] = "Note: This achievement requires a minimum of 4 players to complete.\n\n After you defeated both %s and %s the path to the four kings will now be open. Before you take the path, head back to the dining hall and have every player click on a %s on the table to gain the %s buff.\n\n Once you pick up the buff players will have 20 seconds to head up the stairs and throw their %s to one of the four kings (%s, %s, %s and %s). Note: Each player will need to pick a different boss.",

    --Chat Output

    -------------------------------------------------------
    --- Neltharion's Lair - Repaire de Neltharion
    -------------------------------------------------------
    --Tactics
    -- ["NeltharionsLair_Other"] = "",
    -- ["NeltharionsLair_Naraxas"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Vault of the Wardens - Caveau des Gardiennes
    -------------------------------------------------------
    --Tactics
    -- ["VaultOfTheWardens_AshGolm"] = "To complete this achievement everyone in your group needs to soak %s around the room in order to get the %s debuff. Once everyone in the group has the %s debuff you can kill the boss.",
    -- ["VaultOfTheWardens_Cordana"] = "",
    -- ["VaultOfTheWardens_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Black Rook Hold - Bastion du Freux
    -------------------------------------------------------
    --Tactics
    -- ["BlackRookHold_Other"] = "",
    -- ["BlackRookHold_AmalgamOfSouls"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Maw of Souls - La Gueule des âmes
    -------------------------------------------------------
    --Tactics
    -- ["MawOfSouls_Ymiron"] = "",
    -- ["MawOfSouls_Helya"] = "",
    -- ["MawOfSouls_Other"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Court of Stars - Cour des Étoiles
    -------------------------------------------------------
    --Tactics
    -- ["CourtOfStars_PatrolCaptainGerdo"] = "",
    -- ["CourtOfStars_Other"] = "For this achievement, it is suggested that you follow the steps below to increase your chances of the conversation procing.\n\n - Kill all 5 Duskwatch Sentries before engaging the first boss\n - Disable all 5 Arcane Beacons before engaging the first boss\n - Guess the Spy on first try\n\n Check out https://www.wowhead.com/achievement=10611/dropping-some-eaves#comments:id=2622946 for more info on this achievement",

    --Chat Output

    -------------------------------------------------------
    --- Return to Karazhan - Retour à Karazhan
    -------------------------------------------------------
    --Tactics
    -- ["ReturnToKarazhan_Other1"] = "",
    -- ["ReturnToKarazhan_OperaHall"] = "",
    -- ["ReturnToKarazhan_Moroes"] = "",
    -- ["ReturnToKarazhan_ShadeOfMedivh"] = "",
    -- ["ReturnToKarazhan_ManaDevourer"] = "",
    -- ["ReturnToKarazhan_Other2"] = "",

    --Chat Output

    -------------------------------------------------------
    --- Cathedral of Eternal Night - Cathédrale de la Nuit éternelle
    -------------------------------------------------------
    --Tactics
    -- ["CathedralOfEternalNight_Agronox"] = "For this achievement, you need to stand on top of the 4 Budding Seed pods around the boss room and wait for a Fulminating Lasher to %s onto each of the Budding Seed. Once this is done for each of the 4 seeds you can kill the boss.",
    -- ["CathedralOfEternalNight_ThrashbiteTheScornful"] = "Around the room there are 4 bookcases. To complete this achievement, you need to stand behind each of the bookcases and wait for the boss to cast %s in order to break a bookcase. Once a bookcase is broken, a clickable book appears on the floor. Each member in the group needs to click on this book. Rinse and repeat this for the other 3 bookcases in the boss room making sure you go in a clockwise direction. Once this is done, everyone in the group should have the %s buff and you can kill the boss.\n\n Note: You must have a full 5 man party to complete this achievement.",
    -- ["CathedralOfEternalNight_Mephistroth"] = "At the start of the fight pick up the %s. You then need to wait for the boss to reach 100 energy which will begin phase 2. During phase 2 face the shield you picked up at the start of the fight towards the %s. Once 20 %s have been reflected with the shield, you can kill the boss.",

    --Chat Output

--[[    ------------------------------------------------------ WARLORDS OF DRAENOR -------------------------------------------------------
▄▄▌ ▐ ▄▌ ▄▄▄· ▄▄▄  ▄▄▌        ▄▄▄  ·▄▄▄▄  .▄▄ ·           ·▄▄▄    ·▄▄▄▄  ▄▄▄   ▄▄▄· ▄▄▄ . ▐ ▄       ▄▄▄  
██· █▌▐█▐█ ▀█ ▀▄ █·██•  ▪     ▀▄ █·██▪ ██ ▐█ ▀.     ▪     ▐▄▄·    ██▪ ██ ▀▄ █·▐█ ▀█ ▀▄.▀·•█▌▐█▪     ▀▄ █·
██▪▐█▐▐▌▄█▀▀█ ▐▀▀▄ ██▪   ▄█▀▄ ▐▀▀▄ ▐█· ▐█▌▄▀▀▀█▄     ▄█▀▄ ██▪     ▐█· ▐█▌▐▀▀▄ ▄█▀▀█ ▐▀▀▪▄▐█▐▐▌ ▄█▀▄ ▐▀▀▄ 
▐█▌██▐█▌▐█ ▪▐▌▐█•█▌▐█▌▐▌▐█▌.▐▌▐█•█▌██. ██ ▐█▄▪▐█    ▐█▌.▐▌██▌.    ██. ██ ▐█•█▌▐█ ▪▐▌▐█▄▄▌██▐█▌▐█▌.▐▌▐█•█▌
 ▀▀▀▀ ▀▪ ▀  ▀ .▀  ▀.▀▀▀  ▀█▄▀▪.▀  ▀▀▀▀▀▀•  ▀▀▀▀      ▀█▄▀▪▀▀▀     ▀▀▀▀▀• .▀  ▀ ▀  ▀  ▀▀▀ ▀▀ █▪ ▀█▄▀▪.▀  ▀
]]--

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
    -- ["HellfireCitadel_HellfireAssault"] = "At 110, simply nuke down all the mobs/vehicles as quick as possible. Make sure to keep an eye on the Felfire Crushers and Artillery especially",
    -- ["HellfireCitadel_IronReaver"] = "On the ledges to the left and right of the boss there are untargetable Hellfire Guardians. Bring the boss up against these ledges facing the boss towards the Hellfire Guardians. When the boss casts barrage, this should kill the mobs.",
    -- ["HellfireCitadel_HellfireHighCouncil"] = "Nuke down all 3 bosses so that they die within 10 seconds of one another",
    -- ["HellfireCitadel_Gorefiend"] = "During Feasts of Soul phase, players who do not have the Gorefiends Corruption debuff need to die. This can be done by standing in the pool the boss is sitting in. Once dead the players will get teleported into the belly of the boss. They need to kill the Fragment of the crone once inside. Once the fragment of the crone is dead, the soul of the crone will spawn in the boss room which can then be killed by the group.",
    -- ["HellfireCitadel_ShadowLordIskar"] = "At 110, just simply nuke down the boss without picking up the Eye of Anzu",
    -- ["HellfireCitadel_SocretharTheEternal"] = "During phase 2. Use the robot to put up a prison at the blue portal. Continue to use the prison at the portal to trap the adds until 20 Haunting Souls are trapped. Once this is done, leave the vehicle and aoe all the adds down. Players can also cc the adds to keep them in place. Do not kill the adds with the robot.",
    -- ["HellfireCitadel_TyrantVelhari"] = "1 person tank the Ancient Enforcer away from the group. Everyone else nuke the boss down",
    -- ["HellfireCitadel_Mannoroth"] = "At the start of the fight kill the green & purple summoner. Wait for a player to get curse of the legion debuff before killing the red summoner. Once the curse of the legion debuff runs out or is dispelled, a doom lord will spawn. Get the doom lord down to 5% health. Next dps down Mannoroth to 30% health. Once this is done place the doom lord in front of the boss and wait for it to get killed by Mannoroth Empowered Fel Seeker ability. Once the doom lord has been killed by the boss, you can kill the boss.",
    -- ["HellfireCitadel_Archimonde"] = "Wait for the Doomfire Spirit to spawn then nuke down boss. The Doomfire Spirit does not need to stay alive",

    --Chat Output

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

--[[    -------------------------------------------------------- MISTS OF PANDARIA -------------------------------------------------------
,---.    ,---..-./`)    .-'''-. ,---------.   .-'''-.             ,-----.     ________         .-------.    ____    ,---.   .--. ______        ____    .-------.   .-./`)    ____     
|    \  /    |\ .-.')  / _     \\          \ / _     \          .'  .-,  '.  |        |        \  _(`)_ \ .'  __ `. |    \  |  ||    _ `''.  .'  __ `. |  _ _   \  \ .-.') .'  __ `.  
|  ,  \/  ,  |/ `-' \ (`' )/`--' `--.  ,---'(`' )/`--'         / ,-.|  \ _ \ |   .----'        | (_ o._)|/   '  \  \|  ,  \ |  || _ | ) _  \/   '  \  \| ( ' )  |  / `-' \/   '  \  \ 
|  |\_   /|  | `-'`"`(_ o _).       |   \  (_ o _).           ;  \  '_ /  | :|  _|____         |  (_,_) /|___|  /  ||  |\_ \|  ||( ''_'  ) ||___|  /  ||(_ o _) /   `-'`"`|___|  /  | 
|  _( )_/ |  | .---.  (_,_). '.     :_ _:   (_,_). '.         |  _`,/ \ _/  ||_( )_   |        |   '-.-'    _.-`   ||  _( )_\  || . (_) `. |   _.-`   || (_,_).' __ .---.    _.-`   | 
| (_ o _) |  | |   | .---.  \  :    (_I_)  .---.  \  :        : (  '\_/ \   ;(_ o._)__|        |   |     .'   _    || (_ o _)  ||(_    ._) '.'   _    ||  |\ \  |  ||   | .'   _    | 
|  (_,_)  |  | |   | \    `-'  |   (_(=)_) \    `-'  |         \ `"/  \  ) / |(_,_)            |   |     |  _( )_  ||  (_,_)\  ||  (_.\.' / |  _( )_  ||  | \ `'   /|   | |  _( )_  | 
|  |      |  | |   |  \       /     (_I_)   \       /           '. \_/``".'  |   |             /   )     \ (_ o _) /|  |    |  ||       .'  \ (_ o _) /|  |  \    / |   | \ (_ o _) / 
'--'      '--' '---'   `-...-'      '---'    `-...-'              '-----'    '---'             `---'      '.(_,_).' '--'    '--''-----'`     '.(_,_).' ''-'   `'-'  '---'  '.(_,_).'  
]]--

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

--[[    ------------------------------------------------------------ CATACLYSM -----------------------------------------------------------
 ▄████▄   ▄▄▄     ▄▄▄█████▓ ▄▄▄       ▄████▄   ██▓   ▓██   ██▓  ██████  ███▄ ▄███▓
▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▒████▄    ▒██▀ ▀█  ▓██▒    ▒██  ██▒▒██    ▒ ▓██▒▀█▀ ██▒
▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░▒██  ▀█▄  ▒▓█    ▄ ▒██░     ▒██ ██░░ ▓██▄   ▓██    ▓██░
▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▒██░     ░ ▐██▓░  ▒   ██▒▒██    ▒██ 
▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░  ▓█   ▓██▒▒ ▓███▀ ░░██████▒ ░ ██▒▓░▒██████▒▒▒██▒   ░██▒
░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░    ▒▒   ▓▒█░░ ░▒ ▒  ░░ ▒░▓  ░  ██▒▒▒ ▒ ▒▓▒ ▒ ░░ ▒░   ░  ░
  ░  ▒     ▒   ▒▒ ░   ░      ▒   ▒▒ ░  ░  ▒   ░ ░ ▒  ░▓██ ░▒░ ░ ░▒  ░ ░░  ░      ░
░          ░   ▒    ░        ░   ▒   ░          ░ ░   ▒ ▒ ░░  ░  ░  ░  ░      ░   
░ ░            ░  ░              ░  ░░ ░          ░  ░░ ░           ░         ░   
░                                    ░                ░ ░                         
]]--

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

--[[    ----------------------------------------------------- WRATH OF THE LICH KING -----------------------------------------------------
▄▄▌ ▐ ▄▌▄▄▄   ▄▄▄·▄▄▄▄▄ ▄ .▄          ·▄▄▄    ▄▄▄▄▄ ▄ .▄▄▄▄ .    ▄▄▌  ▪   ▄▄·  ▄ .▄    ▄ •▄ ▪   ▐ ▄  ▄▄ • 
██· █▌▐█▀▄ █·▐█ ▀█•██  ██▪▐█    ▪     ▐▄▄·    •██  ██▪▐█▀▄.▀·    ██•  ██ ▐█ ▌▪██▪▐█    █▌▄▌▪██ •█▌▐█▐█ ▀ ▪
██▪▐█▐▐▌▐▀▀▄ ▄█▀▀█ ▐█.▪██▀▐█     ▄█▀▄ ██▪      ▐█.▪██▀▐█▐▀▀▪▄    ██▪  ▐█·██ ▄▄██▀▐█    ▐▀▀▄·▐█·▐█▐▐▌▄█ ▀█▄
▐█▌██▐█▌▐█•█▌▐█ ▪▐▌▐█▌·██▌▐▀    ▐█▌.▐▌██▌.     ▐█▌·██▌▐▀▐█▄▄▌    ▐█▌▐▌▐█▌▐███▌██▌▐▀    ▐█.█▌▐█▌██▐█▌▐█▄▪▐█
 ▀▀▀▀ ▀▪.▀  ▀ ▀  ▀ ▀▀▀ ▀▀▀ ·     ▀█▄▀▪▀▀▀      ▀▀▀ ▀▀▀ · ▀▀▀     .▀▀▀ ▀▀▀·▀▀▀ ▀▀▀ ·    ·▀  ▀▀▀▀▀▀ █▪·▀▀▀▀ 
]]--

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