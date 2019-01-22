--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Uldir Bosses
------------------------------------------------------
core._1861 = {}

------------------------------------------------------
---- Taloc
------------------------------------------------------
local orbCounter = 0

------------------------------------------------------
---- Fetid Devourer
------------------------------------------------------
local fetidDevourerKilled = false
local playersFetidTable = {}
local playersFetid = 0
local getListOfPlayers = false
local playersInGroup = {}
local setupTable = false
-- local deadPlayers = {}
-- local deadPlayerFound = false
-- local deadPlayersAnnounced = false

------------------------------------------------------
---- Vectis
------------------------------------------------------
local warmotherInfected = false

------------------------------------------------------
---- Mythrax the Unraveler
------------------------------------------------------
local lastPlayerToAbsorbOrb = ""

------------------------------------------------------
---- Ghuun
------------------------------------------------------
local achievementRedForAttempt = false

function core._1861:Taloc()
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 280461 and orbCounter < 4 then
        orbCounter = orbCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(280461) .. " " .. L["Core_Counter"] .. " (" .. orbCounter .. "/4)")
    end

    if orbCounter == 4 then
        core:getAchievementSuccess()
    end
end

function core._1861:FetidDevourer()
    core.IATInfoFrame:SetSubHeading1(GetSpellLink(262277) .. " (" .. playersFetid .. "/" .. core.groupSizeInInstance .. ")")
    
    if setupTable == false then
        setupTable = true
        playersInGroup = core:getPlayersInGroupForAchievement()
        getListOfPlayers = true

        local messageStr = nil
        for k, v in pairs(playersInGroup) do
			if messageStr ~= nil then
				messageStr = messageStr .. "\n" .. v
			else
				messageStr = v
			end
        end
		core.IATInfoFrame:SetText1(messageStr)
    end

    --Player has been hit by terrible thrash
    if core.type == "SPELL_DAMAGE" and core.spellId == 262277 and core.destName ~= nil then
        local name, realm = strsplit("-", core.destName)
        --core:sendDebugMessage(name .. " was hit")
        if UnitIsPlayer(name) and playersFetidTable[core.spawn_uid_dest_Player] == nil then
            --Check if player has any immunities on.
            --Known immunties as of 8.0.1
            --Ice block: 45438
            --Netherwalk: 196555
            --Aspect of the Turtle: 186265
            --Blessing of Protection: 1022
            --Blessing of Spellwarding: 204018
            --Divine Shield: 642
            local immunityFound = false
            local immunityName = nil
            for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitBuff(name, i)
                if spellId == 45438 then
                    immunityFound = true
                    immunityName = "Ice Block"
                elseif spellId == 196555 then
                    immunityFound = true
                    immunityName = "Netherwalk"
                elseif spellId == 186265 then
                    immunityFound = true
                    immunityName = "Aspect of the Turtle"
                elseif spellId == 1022 then
                    immunityFound = true
                    immunityName = "Blessing of Protection"
                elseif spellId == 204018 then
                    immunityFound = true
                    immunityName = "Blessing of Spellwarding"
                elseif spellId == 642 then
                    immunityFound = true
                    immunityName = "Divine Shield"                                                                                                                   
                end
            end

            if immunityFound == false then
                --core:sendDebugMessage("Added player to table")
                playersFetid = playersFetid + 1
                playersFetidTable[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player

                core:sendMessage(core.destName .. L["Shared_HasBeenHitWith"] .. " " .. GetSpellLink(262277) .. " (" .. playersFetid .. "/" .. core.groupSizeInInstance .. ")")

                --Remove player from list of players needing to get hit
                if core:has_value(playersInGroup, name) then
                    table.remove(playersInGroup, core:getTableIndexByValue(playersInGroup, name))
                    --core:sendDebugMessage("Removing " .. name)

                    --Rebuild list of players that still need to get hit
                    local messageStr = L["Shared_PlayersWhoStillNeedToGetHit"]
                    for k, v in pairs(playersInGroup) do
                        messageStr = messageStr .. ", " .. v
                    end
                    core:sendMessageSafe(messageStr, true)
                    local messageStr2 = nil
                    for k, v in pairs(playersInGroup) do
                        if messageStr2 ~= nil then
                            messageStr2 = messageStr2 .. "\n" .. v
                        else
                            messageStr2 = v
                        end
                    end
                    core.IATInfoFrame:SetText1(messageStr2)
                end
            end
        end
    end

    if playersFetid == core.groupSizeInInstance then
        core:getAchievementSuccess()

        -- --All players have got hit by terrible thrash but if they are not alive then they will not get achievement on kill
        -- --We need to check if everyone is alive then announce success. Otherwise list players who need to be ressed before end of fight
        
        -- --Search for dead players
        -- if core.groupSizeInInstance > 1 then
		-- 	for i = 1, core.groupSizeInInstance do
		-- 		local unit = nil
		-- 		if core.chatType == "PARTY" then
		-- 			if i < core.groupSizeInInstance then
		-- 				unit = "party" .. i
		-- 			else
		-- 				unit = "player"
		-- 			end
		-- 		elseif core.chatType == "RAID" then
		-- 			unit = "raid" .. i
        --         end
                
        --         --Check if the player is dead
        --         if UnitIsDead(unit) and UnitIsPlayer(unit) and core:has_value(deadPlayers, name) then
        --             table.insert(deadPlayers, UnitName(unit))
        --             deadPlayerFound = true
        --         end
		-- 	end
		-- else
        --     --Check if requirements are met else output dead players
        --     if deadPlayerFound == true and deadPlayersAnnounced = false then
        --         deadPlayersAnnounced = true
        --         --build list of players that still need to be ressed
        --         local messageStr = L["Shared_PlayersWhoStillNeedToGetResurrected"]
        --         for k, v in pairs(playersInGroup) do
        --             messageStr = messageStr .. ", " .. v
        --         end
        --         core:sendMessageSafe(messageStr)
        --     elseif deadPlayerFound == false
        --         core:getAchievementSuccess()
        --     end
        -- end
    end
end

function core._1861:Vectis()
    --Defeat Vectis in Uldir after infecting Warmother Rakkali with Plague Bomb on Normal difficulty or higher.
    --Warmother Rakkali 142148
    --Plague Bomb 266948

    --If warmother casts blood ritual then she has been infected
    if core.type == "SPELL_CAST_START" and core.spellId == 277813 and core.sourceID == "142148" and warmotherInfected == false then
        core:sendMessage(getNPCName(142148) .. " " .. L["Shared_HasBeenInfectedWith"] .. GetSpellLink(266948) .. ". " .. L["Shared_SheCanNowBeKilled"])
        warmotherInfected = true
    end

    if core.type == "UNIT_DIED" and core.destID == "142148" and warmotherInfected == true then
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
    if core:getBlizzardTrackingStatus(12551) == false and achievementRedForAttempt == false then
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
                    
                    --Stop tracker for working for remainder of fight to reduce lag
                    achievementRedForAttempt = true
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
    ---- Taloc
    ------------------------------------------------------
    orbCounter = 0

    ------------------------------------------------------
    ---- Fetid Devourer
    ------------------------------------------------------
    playersFetidTable = {}
    playersFetid = 0
    getListOfPlayers = false
    playersInGroup = {}
    setupTable = false

    ------------------------------------------------------
    ---- Vectis
    ------------------------------------------------------
    warmotherInfected = false

    ------------------------------------------------------
    ---- Mythrax the Unraveler
    ------------------------------------------------------
    lastPlayerToAbsorbOrb = ""
    
    ------------------------------------------------------
    ---- Ghuun
    ------------------------------------------------------
    achievementRedForAttempt = false
end