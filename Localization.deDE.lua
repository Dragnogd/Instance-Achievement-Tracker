if(GetLocale() ~= 'deDE') then return end

local _, core = ...
local baseLocale = {
    ["Onyxia's Lair 10 Man"] = "Onyxias Hort 10 Mann",
}

core:RegisterLocale('deDE', baseLocale)
