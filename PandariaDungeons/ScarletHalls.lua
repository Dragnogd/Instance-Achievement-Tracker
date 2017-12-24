--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Scarlet Halls Bosses
------------------------------------------------------
core.ScarletHalls = {}

function core.ScarletHalls:HoundmasterBraun()
    if core.type == "UNIT_DIED" and core.destID == "58876" then
        print("Achievement Failed")
    elseif core.destID == "58876" and core.overkill > 0 then
        print("Achievement Failed")
    end

    if core.type == "UNIT_DIED" then
        print(core.destName .. " : " .. core.destID)
    end
end

function core.ScarletHalls:ClearVariables()

end