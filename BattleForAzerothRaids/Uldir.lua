--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Uldir Bosses
------------------------------------------------------
core.Uldir = {}

------------------------------------------------------
---- Fetid Devourer
------------------------------------------------------
local fetidDevourerKilled = false
local playersFetidTable = {}
local playersFetid = 0

function core.Uldir:FetidDevourer()
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