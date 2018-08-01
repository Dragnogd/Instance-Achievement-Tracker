if(GetLocale() ~= 'zhCN') then return end

local _, core = ...
local baseLocale = {
    
}

core:RegisterLocale('zhCN', baseLocale)
