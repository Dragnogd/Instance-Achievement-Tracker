if(GetLocale() ~= 'deDE') then return end

local _, core = ...
local baseLocale = {
    ["Onyxia's Lair 10 Man"] = "Onyxias Hort 10 Mann",
    ["Icecrown Citadel 10 Man"] = "Die Eiskronenzitadelle 10 Mann",
    ["Icecrown Citadel 25 Man"] = "Die Eiskronenzitadelle 25 Mann",
}

core:RegisterLocale('deDE', baseLocale)
