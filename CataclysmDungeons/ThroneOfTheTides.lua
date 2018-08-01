--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Throne of the Tides Bosses
------------------------------------------------------
core._643 = {}

------------------------------------------------------
---- Ozumat
------------------------------------------------------
local requirementsMetAnnounced = false
local unyieldingBehemothAlive = false

function core._643:LadyNazjar()
    if core.type == "SPELL_DAMAGE" and core.spellId == 94046 and core.overkill > 0 then
        core:getAchievementSuccess()
    end
end

function core._643:Ozumat()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 76133 and unyieldingBehemothAlive == true and requirementsMetAnnounced == false then
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " requirements have been met. Kill the Unyielding Behemoth now")
        requirementsMetAnnounced = true
    end

    if core.destName == "Unyielding Behemoth" then
        --print(core.type)
    end

    if core.destName == "Unyielding Behemoth" and core.type ~= "UNIT_DIED" then
        --print("Found")
        unyieldingBehemothAlive = true
    end

    if core.type == "UNIT_DIED" and core.destName == "Unyielding Behemoth" and requirementsMetAnnounced == true then
        --print("Success")
        core:getAchievementSuccess()
    elseif core.type == "UNIT_DIED" and core.destName == "Unyielding Behemoth" and requirementsMetAnnounced == false then
        unyieldingBehemothAlive = false
        core:getAchievementFailed()
    end
    
end

function core._643:ClearVariables()
    ------------------------------------------------------
    ---- Ozumat
    ------------------------------------------------------
    requirementsMetAnnounced = false
    unyieldingBehemothAlive = false
end