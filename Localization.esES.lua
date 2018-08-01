if(GetLocale() ~= 'esES' or GetLocale() ~= 'esMX') then return end

local _, core = ...
local baseLocale = {
    
}

core:RegisterLocale('esES', baseLocale)
