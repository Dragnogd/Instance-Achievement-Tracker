print("HERE 2")
if(GetLocale() ~= 'esES' and GetLocale() ~= 'esMX') then return end
print("HERE 3")

local _, core = ...
local baseLocale = {
    ["Main"] = "Menú Principal",
    ["Legion"] = "Legión",
    ["Warlords of Draenor"] = "Warlords of Draenor",
    ["Mists of Pandaria"] = "Mists of Pandaria",
    ["Cataclysm"] = "Cataclismo",
    ["Wrath of the Lich King"] = "Wrath of the Lich King",
    ["Instance Achievement Tracker"] = "Instance Achievement Tracker",
    ["Currently Tracking:"] = "Realizando Seguimiento:",
    ["Achievements"] = "Logros",
    ["Achievement"] = "Logro",
    ["Tactics"] = "Tácticas",
    ["Features:"] = "Características:",
    ["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- Realiza un seguimiento cuando el requisito de los logros de la mazmorra ha sido conseguido y lo envía al chat",
    ["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- Realiza un seguimiento cuando el requisito de los logros de la mazmorra ha sido fallado y lo envía al chat",
    ["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- Realiza el seguimiento de los logros que requieran matar varios bichos en un tiempo determinado. Se anunciará por chat cuando hayan aparecido los bichos suficientes y si se mataron en el tiempo requerido.",
    ["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- Escanea a todos los jugadores del grupo para ver qué logros les falta a cada uno para la mazmorra actual",
    ["- Announce to chat players who are missing achievements for certain bosses"] = "- Informar por chat a los jugadores que no tengan los logros de ciertos bossess",
    ["- Announce to chat tactics for a certain boss"] = "- Informar por chat a los jugadores la mecánica del logro de un boss",
    ["Options:"] = "Opciones:",
    ["Enable Addon"] = "Activar Addon",
    ["Show Minimap Button"] = "Muestra el Botón del Minimapa",
    ["(Achievement Tracking Disabled)"] = "(Seguimiento de Logros Desactivado)",
    ["Output Tactics"] = "Informar las Tácticas",
    ["Output Players"] = "Informar de Jugadores",
    ["Track"] = "Seguir",
    ["Players"] = "Jugadores",
    ["No players in the group need this achievement"] = "Ningún jugador del grupo necesita este logro",
    ["scan still in progress"] = "escaneo todavía en proceso",
    ["Enter instance to start scanning"] = "(Entra en la mazmorra para comenzar a escanear)",
    ["Players who need Achievement"] = "Jugadores que necesitan ese Logro",
    ["Disabled"] = "Desactivado",
    ["Enabled"] = "Activado",
    ["Tracking"] = "Seguimiento",
}

print("MADE IT HERE")

if(GetLocale() == "esES") then
    core:RegisterLocale('esES', baseLocale)
else
    core:RegisterLocale('esMX', baseLocale)
end