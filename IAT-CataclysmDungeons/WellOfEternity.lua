--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Well of Eternity Bosses
------------------------------------------------------
core._939 = {}

function core._939:Perotharn()
    if core.type == "UNIT_DIED" and core.destID == "55868" then
        core:getAchievementFailed()
    end
end

function core._939:Mannoroth()
    if core.type == "UNIT_DIED" and core.destID == "55419" and core.destFlags == 0x10a48 then
        core:getAchievementFailed()
    end

    if core.type == "SPELL_INSTAKILL" and core.destID == "55419" then
        core:getAchievementSuccess()
    end
end

function core._939:ClearVariables()
end