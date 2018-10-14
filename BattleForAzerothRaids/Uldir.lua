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
local getListOfPlayers = false
local playersInGroup = {}

------------------------------------------------------
---- Mythrax the Unraveler
------------------------------------------------------
local lastPlayerToAbsorbOrb = ""

function core._1861:FetidDevourer()
    --Defeat the Fetid Devourer in Uldir after having all players hit by Terrible Thrash at least once on Normal difficulty or higher.
    if core.type == "UNIT_DIED" and core.destID == "133298" then
        fetidDevourerKilled = true
    end
    
    if getListOfPlayers == false then
        playersInGroup = core:getPlayersInGroupForAchievement()
        getListOfPlayers = true
    end

    if fetidDevourerKilled == false then
        --Player has been hit by terrible thrash
        if core.type == "SPELL_DAMAGE" and core.spellId == 262277 and core.destName ~= nil and core.spawn_uid_dest_Player ~= nil then
            core:sendDebugMessage(core.destName .. " Hit By Terrible Thrash")
            local name, realm = strsplit("-", core.destName)
            core:sendDebugMessage(name)
            if UnitIsPlayer(name) and playersFetidTable[core.spawn_uid_dest_Player] == nil then
                core:sendDebugMessage("Added player to table")
                playersFetid = playersFetid + 1
                playersFetidTable[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player

                core:sendMessage(core.destName .. " has been hit with Terrible Thrash (" .. playersFetid .. "/" .. core.groupSize .. ")")

                --Remove player from list of players needing to get hit
                if core:has_value(playersInGroup, name) then
                    table.remove(playersInGroup, core:getTableIndexByValue(playersInGroup, name))
                    core:sendDebugMessage("Removing " .. name)

                    --Rebuild list of players that still need to get hit
                    local messageStr = "Players who still need to get hit: "
                    for k, v in pairs(playersInGroup) do
                        messageStr = messageStr .. ", " .. v
                    end
                    core:sendMessageSafe(messageStr)
                end
            end
        end

        if playersFetid == core.groupSize then
            core:getAchievementSuccess()
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

function core._1861:ZulReborn()
    --Blizzard Tracker has gone red so achievement failed
    if core:getBlizzardTrackingStatus(12830) == false then
        core:getAchievementFailed()
    end
end

function core._1861:MythraxTheUnraveler()
    --Defeat Mythrax the Unraveler in Uldir with no player touching an Existence Fragment spawned by another player on Normal difficulty or higher

    --Check who the last player was to pick up an orb
    if (core.type == "SPELL_AURA_REMOVED_DOSE" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 272146 then
        lastPlayerToAbsorbOrb = core.destName
        core:sendDebugMessage(lastPlayerToAbsorbOrb)
    end

    --Blizzard Tracker has gone red so achievement failed
    if core:getBlizzardTrackingStatus(12836) == false then
        core:getAchievementFailedWithMessageAfter("(" .. lastPlayerToAbsorbOrb .. ")")
    end
end

function core._1861:Ghuun()
    --Blizzard Tracker has gone red so achievement failed
    if core:getBlizzardTrackingStatus(12551) == false then
        --Find the player who currently has the power matrix
        if core.groupSize > 1 then
            for i = 1, core.groupSize do
                local unit = nil
                if core.chatType == "PARTY" then
                    if i < core.groupSize then
                        unit = "party" .. i
                    else
                        unit = "player"
                    end
                elseif core.chatType == "RAID" then
                    unit = "raid" .. i
                end
                
                if unit ~= nil then
                    local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
                    for i=1,40 do
                        local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
                        if spellId == 263420 then
                            core:getAchievementFailedWithMessageAfter("(" .. UnitName(unit) .. ")")
                        end 
                    end
                end
            end
        else
            --Player is not in a group
            local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
            for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff("Player", i)
                if spellId == 263420 then
                    core:getAchievementFailedWithMessageAfter("(" .. UnitName("Player") .. ")")
                end
            end
        end
    end
end 

function core._1861:InstanceCleanup()
    fetidDevourerKilled = false
end

function core._1861:ClearVariables()
    ------------------------------------------------------
    ---- Fetid Devourer
    ------------------------------------------------------
    playersFetidTable = {}
    playersFetid = 0
    getListOfPlayers = false
    playersInGroup = {}

    ------------------------------------------------------
    ---- Mythrax the Unraveler
    ------------------------------------------------------
    lastPlayerToAbsorbOrb = ""
end