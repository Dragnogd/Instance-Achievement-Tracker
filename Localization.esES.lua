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
    -- ["GUI_MinimapEnabled"] = "Minimap icon enabled",
    -- ["GUI_MinimapDisabled"] = "Minimap icon disabled",
    -- ["GUI_AnnounceTracking"] = "Announce achievements being tracked to group", --L["Announce Achievements Being Tracked To Group"]
    -- ["GUI_OnlyTrackMissingAchievements"] = "Only track missing achievements", --["Only track missing achievements"]
    -- ["GUI_AnnounceMessagesToRaidWarning"] = "Announce messages to Raid Warning", --["Announce messages to Raid Warning"]
    -- ["GUI_AchievementsDiscordTitle"] = "Achievements Discord",
    -- ["GUI_AchievementsDiscordDescription"] = "Tactics kindly contributed by the Achievements Discord Server, the community where members can meet like-minded completionists and form groups for a variety of achievements.",
    -- ["GUI_PlaySoundOnSuccess"] = "Play a sound when a achievement is completed",
    -- ["GUI_PlaySoundOnFailed"] = "Play a sound when an achievement fails",
    -- ["GUI_SelectSound"] = "Select Sound",
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
    -- ["GUI_OnlyDisplayMissingAchievements"] = "Only display missing achievements",
    -- ["GUI_GreyOutCompletedAchievements"] = "Grey out completed achievements",
    -- ["GUI_HideCompletedAchievements"] = "Hide completed achievements",

    -------------------------------------------------------
    --- Core
    -------------------------------------------------------    
    -- ["Core_StartingAchievementScan"] = "Starting acchievement scan for", --["Starting Achievement Scan For"]
    -- ["Core_GameFreezeWarning"] = "This may freeze your game for a few seconds", --["This may freeze your game for a few seconds"]
    -- ["Core_AchievementScanFinished"] = "Achievement Scanning Finished", --["Achievement Scanning Finished"]
    -- ["Core_EnableAchievementTracking"] = "Do you want to enable achievement tracking for", --["Do you want to enable achievement tracking for"]
    -- ["Core_TrackAchievements"] = "Track Achievements", --["Track Achievements"]
    -- ["Core_Yes"] = "Yes", --["Core_Yes"]
    -- ["Core_No"] = "No", --["Core_No"]
    -- ["Core_AchievementTrackingEnabledFor"] = "Achievement Tracking Enabled for", --["Achievement Tracking Enabled for"]
    -- ["Core_help"] = "help", --["help"]
    -- ["Core_Commands"] = "List of slash commands", --["List of slash commands"]
    -- ["Core_ListCommands"] = "shows a list of avaliable slash commands", --["shows a list of avaliable slash commands"]
    -- ["Core_CommandEnableTracking"] = "enable/disable IAT achievement tracking", --["enable/disable IAT achievement tracking"]
    -- ["Core_Enable"] = "enable", --["enable"]
    -- ["Core_NoTrackingForInstance"] = "IAT cannot track any achievements for this encounter.",
    -- ["Core_Failed"] = "FAILED!",
    -- ["Core_PersonalAchievement"] = "Personal Achievement",
    -- ["Core_Reason"] = "Reason",
    -- ["Core_CriteriaMet"] = "Criteria has been met. Boss can now be killed!",
    -- ["Core_Counter"] = "Counter",

    -------------------------------------------------------
    --- Instances
    -------------------------------------------------------  
    -- ["Other"] = "Other", 
    -- ["Instances_TrashAfterThirdBoss"] = "Trash after the third boss", --L["Trash after the third boss"]    
}

if(GetLocale() == "esES") then
    core:RegisterLocale('esES', baseLocale)
else
    core:RegisterLocale('esMX', baseLocale)
end