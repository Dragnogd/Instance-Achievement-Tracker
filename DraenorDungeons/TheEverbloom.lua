--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Everbloom Bosses
------------------------------------------------------
core.TheEverbloom = {}

------------------------------------------------------
---- Yalnu
------------------------------------------------------
local enableNameplates = false

function core.TheEverbloom:Witherbark()
    if core.type == "SPELL_ENERGIZE" and core.spellId == 164438 then
        core:getAchievementFailed()
    end
end

function core.TheEverbloom:Yalnu()
    GetCVar("nameplateShowFriends")
    if GetCVar("nameplateShowFriends") == 0 and enableNameplates == false then
        print("Enabling Friendly Nameplates")
        SetCVar("nameplateShowFriends", 1-GetCVar("nameplateShowFriends"))
        enableNameplates = true
    end

    --Loop through each of the UID and check whether the unit exists. If they don't then one of the npc must have died
end

function core.TheEverbloom:ClearVariables()
    ------------------------------------------------------
    ---- Yalnu
    ------------------------------------------------------
    local enableNameplates = false
end