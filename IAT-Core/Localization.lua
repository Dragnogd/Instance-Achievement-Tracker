
--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

--------------------------------------
-- Localization
--------------------------------------
core.L = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })

function core:RegisterLocale(locale, tbl)
    if locale == "enUS" or locale == GetLocale()then
        for k,v in pairs(tbl) do
            if v == true then
                self.L[k] = k
            elseif type(v) == "string" then
                self.L[k] = v
            else
                self.L[k] = k
            end
        end
    end
end