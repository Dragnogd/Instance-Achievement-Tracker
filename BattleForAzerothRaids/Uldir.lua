--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Uldir Bosses
------------------------------------------------------
core._1861 = {}

------------------------------------------------------
---- Fetid Devourer
------------------------------------------------------
local fetidDevourerKilled = false
local playersFetidTable = {}
local playersFetid = 0

function core._1861:FetidDevourer()
    --Defeat the Fetid Devourer in Uldir after having all players hit by Terrible Thrash at least once on Normal difficulty or higher.
    if core.type == "UNIT_DIED" and core.destID == "133298" then
        fetidDevourerKilled = true
    end

    if fetidDevourerKilled == false then
        --Player has been hit by terrible thrash
        if core.spellId == 262277 then
            local name, realm = strsplit("-", core.destID)
            if UnitIsPlayer(name) and playersFetidTable[core.destName] == nil then
                playersFetid = playersFetid + 1
                playersFetidTable[core.destName] = core.destName
                core:sendMessage(core.destName .. " has been hit with Terrible Thrash (" .. playersFetid .. "/" .. core.groupSize .. ")")
            end
        end

        if playersFetid == core.groupSize then
            core:getAchievementSuccess()
            core.achievementsFailed[1] = false
        end
    end
end

function core._1861:Vectis()
    --Defeat Vectis in Uldir after infecting Warmother Rakkali with Plague Bomb on Normal difficulty or higher.
    --Warmother Rakkali 142148
    --Plague Bomb 266948

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 266948 and core.destID == "142148" then
        core:getAchievementSuccess()
    end
end

function core._1861:Zekvoz()
    --Defeat Zek'voz in Uldir after exposing the Puzzle Box of Yogg-Saron to the Projection of Yogg-Saron on Normal difficulty or higher.
    --Void Barrage 278068

    if core.type == "SPELL_DAMAGE" and core.spellId == 278068 then
        core:getAchievementSuccess()
    end
end