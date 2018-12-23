if(GetLocale() ~= 'esES' and GetLocale() ~= 'esMX') then return end

local _, core = ...
local baseLocale = {
    -------------------------------------------------------
    --- GUI
    -------------------------------------------------------
    ["GUI_Achievements"] = "Logros",
    ["GUI_Tactics"] = "Tácticas",
    ["GUI_TrackingNumber"] = "Realizando Seguimiento",
    ["GUI_Options"] = "Opciones",
    ["GUI_EnableAddon"] = "Activar Addon",
    ["GUI_Enabled"] = "Activado",
    ["GUI_Disabled"] = "Desactivado",
    ["GUI_ToggleMinimap"] = "Muestra el Botón del Minimapa",
    ["GUI_MinimapEnabled"] = "Icono de minimapa activado",
    ["GUI_MinimapDisabled"] = "Icono de minimapa desactivado",
    ["GUI_AnnounceTracking"] = "Anunciar qué logros están siendo rastreados para el grupo", --L["Announce Achievements Being Tracked To Group"]
    ["GUI_OnlyTrackMissingAchievements"] = "Rastrea sólo los logros faltantes", --["Only track missing achievements"]
    ["GUI_AnnounceMessagesToRaidWarning"] = "Anunciar mensajes como Aviso de Banda", --["Announce messages to Raid Warning"]
    ["GUI_AchievementsDiscordTitle"] = "Discord de Logros",
    ["GUI_AchievementsDiscordDescription"] = "Puedes contribuir amablemente con tácticas a través del Servidor de Discord, la comunidad donde los miembros pueden reunirse con coleccionistas de logros y formar grupos para una variedad de ellos.",
    ["GUI_PlaySoundOnSuccess"] = "Reproduce un sonido cuando un logro se complete",
    ["GUI_PlaySoundOnFailed"] = "Reproduce un sonido cuando un logro falle",
    ["GUI_SelectSound"] = "Selecciona Sonido",
    ["GUI_TrackingDisabled"] = "Seguimiento de Logros Desactivado",
    ["GUI_EnterInstanceToStartScanning"] = "Entra en la mazmorra para comenzar a escanear",
    ["GUI_BattleForAzeroth"] = "Battle for Azeroth",
    ["GUI_Legion"] = "Legión",
    ["GUI_WarlordsOfDraenor"] = "Warlords of Draenor",
    ["GUI_MistsOfPandaria"] = "Mists of Pandaria",
    ["GUI_Cataclysm"] = "Cataclismo",
    ["GUI_WrathOfTheLichKing"] = "Wrath of the Lich King",
    ["GUI_Players"] = "Jugadores",
    ["GUI_Achievement"] = "Logro",
    ["GUI_NoPlayersNeedAchievement"] = "Ningún jugador del grupo necesita este logro",
    ["GUI_PlayersWhoNeedAchievement"] = "Jugadores que necesitan ese Logro",
    ["GUI_ScanInProgress"] = "escaneo todavía en proceso",
    ["GUI_Tracking"] = "Seguimiento",
    ["GUI_Track"] = "Seguir",
    ["GUI_OutputPlayers"] = "Informar a Jugadores",
    ["GUI_OutputTactics"] = "Informar Táctica",
    ["GUI_OnlyDisplayMissingAchievements"] = "Muestra sólo los logros que faltan",
    ["GUI_GreyOutCompletedAchievements"] = "Ensombrece los logros completados",
    ["GUI_HideCompletedAchievements"] = "Oculta los logros completados",

    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    ["Core_StartingAchievementScan"] = "Comenzando exploración de logro para", --["Starting Achievement Scan For"]
    ["Core_GameFreezeWarning"] = "Esto puede congelar el juego unos segundos", --["This may freeze your game for a few seconds"]
    ["Core_AchievementScanFinished"] = "Escaneo de Logros Acabado", --["Achievement Scanning Finished"]
    ["Core_EnableAchievementTracking"] = "¿Quieres activar el seguimiento de logros para", --["Do you want to enable achievement tracking for"]
    ["Core_TrackAchievements"] = "Seguimiento de Logros", --["Track Achievements"]
    ["Core_Yes"] = "Sí", --["Core_Yes"]
    ["Core_No"] = "No", --["Core_No"]
    ["Core_AchievementTrackingEnabledFor"] = "Escaneo de Logros Activado para", --["Achievement Tracking Enabled for"]
    ["Core_help"] = "ayuda", --["help"]
    ["Core_Commands"] = "Lista de comandos de texto", --["List of slash commands"]
    ["Core_ListCommands"] = "muestra una lista de comandos de texto disponibles", --["shows a list of avaliable slash commands"]
    ["Core_CommandEnableTracking"] = "activar/desactivar IAT escaneo de logros", --["enable/disable IAT achievement tracking"]
    ["Core_Enable"] = "activar", --["enable"]
    ["Core_NoTrackingForInstance"] = "IAT no puede rastrear ningún logro para este encuentro",
    ["Core_Failed"] = "¡FALLADO!",
    ["Core_PersonalAchievement"] = "Logro Personal",
    ["Core_Reason"] = "Razón",
    ["Core_CriteriaMet"] = "Requerimiento conseguido. ¡Puedes matar al Boss!",
    ["Core_Counter"] = "Contrarresta",

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    ["Instances_Other"] = "Otros", 
    ["Instances_TrashAfterThirdBoss"] = "Pulls después del tercer boss", --L["Trash after the third boss"]    
}

if(GetLocale() == "esES") then
    core:RegisterLocale('esES', baseLocale)
else
    core:RegisterLocale('esMX', baseLocale)
end