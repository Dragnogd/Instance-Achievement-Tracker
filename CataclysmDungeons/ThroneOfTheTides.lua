--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Throne of the Tides Bosses
------------------------------------------------------
core.ThroneOfTheTides = {}

------------------------------------------------------
---- Ozumat
------------------------------------------------------
local requirementsMetAnnounced = false
local unyieldingBehemothAlive = false

function core.ThroneOfTheTides:LadyNazjar()
    if core.type == "SPELL_DAMAGE" and core.spellId == 94046 and core.overkill > 0 then
        core:getAchievementSuccess()
    end
end

function core.ThroneOfTheTides:Ozumat()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 76133 and unyieldingBehemothAlive == true and requirementsMetAnnounced == false then
        core:sendMessage(GetAchievementLink(core.achievementIDs[1]) .. " requirements have been met. Kill the Unyielding Behemoth now")
        requirementsMetAnnounced = true
    end

    if (core.destID == "40792" or core.sourceID == "40792") and core.type ~= "UNIT_DIED" then
        print("Found add : " .. core.sourceID)
        unyieldingBehemothAlive = true
    end

    if core.type == "UNIT_DIED" and core.destID == "40792" and requirementsMetAnnounced == true then
        print("Success")
        core:getAchievementSuccess()
    elseif core.type == "UNIT_DIED" and core.destID == "40792" and requirementsMetAnnounced == false then
        print("Failed")
        core:getAchievementFailed()
    end
end

function core.ThroneOfTheTides:ClearVariables()
    ------------------------------------------------------
    ---- Ozumat
    ------------------------------------------------------
    requirementsMetAnnounced = false
    unyieldingBehemothAlive = false
end