if(GetLocale() ~= 'enUS') then return end

local _, core = ...
local baseLocale = {
    ["Onyxia's Lair 10 Man"] = "Onyxia's Lair 10 Man",
    ["Icecrown Citadel 10 Man"] = "Icecrown Citadel 10 Man",
    ["Icecrown Citadel 25 Man"] = "Icecrown Citadel 25 Man",
}

core:RegisterLocale('enUS', baseLocale)
