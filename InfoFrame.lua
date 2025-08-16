--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

local rc = LibStub("LibRangeCheck-3.0")
core.InfoFrame = {}
core.InfoFrame.Events = CreateFrame("Frame")

core.InfoFrame.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

--Info Frame Ideas

--Show a list of players in the group and each player should have a flag on the current status
--Green - Player has met the requirements for the achievment
--White - Player has not met the requirements for the current
--Red - Player had met the requirements for the achievment, the group can get the achievment but that particular player will not get achievement. Eg player has died

--UpdatePlayersOnInfoFrame()
-- if not already generate then generate players & table
-- Else update players with array values

--SetPlayerFailedOnInfoFrame(player)
--  If player exits in array then update array
--  Update table

core.InfoFrame_PlayersTable = {}    --List of all players in the group and the current status of the achievement for the player.
core.InfoFrame_RangeCheckCooldown = false   --Cooldown for checking range of players for 5 seconds to reduce lag in game for expensive operation
local colourRed = "|cffFF0000"
local colourGreen = "|cff59FF00"
local colourWhite = "|cffFFFFFF"
local colourOrange = "|cffff6100"

core.InfoFrame_DynamicTable = {}

function InfoFrame_UpdatePlayersOnInfoFrame(updateInfoFrame)
    --This will update list of players on the info frame
    if next(core.InfoFrame_PlayersTable) == nil then
        --If table is empty then generate players
        for k,player in pairs(core:getPlayersInGroupForAchievement()) do
            core.InfoFrame_PlayersTable[player] = 1
        end
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            --1 = incomplete, 2 = complete, 3 = failed
            if status == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. "|r\n"
            elseif status == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. "|r\n"
            elseif status == 3 then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. "|r\n"
            end
        end
        if updateInfoFrame ~= false then
            core.IATInfoFrame:SetText1(messageStr)
        end
    end
end

function InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfo()
    --This will update list of players on the info frame
    if next(core.InfoFrame_PlayersTable) == nil then
        --If table is empty then generate players and place to store additional message
        core:sendDebugMessage("Setting up InfoFrame with Additional Info")
        for k,player in pairs(core:getPlayersInGroupForAchievement()) do
            core.InfoFrame_PlayersTable[player] = {1,""}
        end
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            --1 = incomplete, 2 = complete, 3 = failed
            if status[1] == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] == 4 then
                --Player requirements are currently in progress
                messageStr = messageStr .. colourOrange .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. " (" .. status[2] .. ")|r\n"
            end
        end
        core.IATInfoFrame:SetText1(messageStr)
    end
end

function InfoFrame_GetHighestDynamicPlayer()
    local highCounter = 0
    local highPlayer = ""
    for player, status in pairs(core.InfoFrame_DynamicTable) do
        if status[2] > highCounter then
            highCounter = status[2]
        end
    end
    return highCounter
end

function InfoFrame_UpdateDynamicPlayerList()
    if next(core.InfoFrame_DynamicTable) == nil then
        --Table is empty. Do nothing
        core.IATInfoFrame:SetText1("")
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_DynamicTable) do
            --1 = incomplete, 2 = complete, 3 = failed
            if status[1] == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] == 4 then
                --Player requirements are currently in progress
                messageStr = messageStr .. colourOrange .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. " (" .. status[2] .. ")|r\n"
            end
        end
        core.IATInfoFrame:SetText1(messageStr)
    end
end

function InfoFrame_AddNPCToInfoFrame(npcName)
    if npcName ~= nil then
        --Only add additional npc's once we the players have been added
        if next(core.InfoFrame_PlayersTable) ~= nil then
            --If table is empty then generate players
            if core.InfoFrame_PlayersTable[npcName] == nil then
                core.InfoFrame_PlayersTable[npcName] = 1
            end
        end
    end
end

function InfoFrame_IncrementDynamicPlayer(player,count)
    if core.InfoFrame_DynamicTable[player] == nil then
        --Setup new player in table
        core.InfoFrame_DynamicTable[player] = {1,count}
    else
        if count ~= nil then
            --Increment player counter in table
            core.InfoFrame_DynamicTable[player][2] = core.InfoFrame_DynamicTable[player][2] + count

            if core.InfoFrame_DynamicTable[player][2] >= 9 then
                core.InfoFrame_DynamicTable[player] = {2,core.InfoFrame_DynamicTable[player][2]}
            else
                core.InfoFrame_DynamicTable[player] = {1,core.InfoFrame_DynamicTable[player][2]}
            end
        end
    end
end

function InfoFrame_SetDynamicPlayer(player,count)
    if core.InfoFrame_DynamicTable[player] == nil then
        --Setup new player in table
        core.InfoFrame_DynamicTable[player] = {1,count}
    else
        if count ~= nil then
            --Increment player counter in table
            core.InfoFrame_DynamicTable[player][2] = count

            if core.InfoFrame_DynamicTable[player][2] >= 9 then
                core.InfoFrame_DynamicTable[player] = {2,core.InfoFrame_DynamicTable[player][2]}
            else
                core.InfoFrame_DynamicTable[player] = {1,core.InfoFrame_DynamicTable[player][2]}
            end
        end
    end
end

function InfoFrame_DecrementDynamicPlayer(player,count)
    if core.InfoFrame_DynamicTable[player] ~= nil then
        if count == nil then
            count = core.InfoFrame_DynamicTable[player][2]
        end

        core.InfoFrame_DynamicTable[player][2] = core.InfoFrame_DynamicTable[player][2] - count
        if core.InfoFrame_DynamicTable[player][2] <= 0 then
            core.InfoFrame_DynamicTable[player] = nil
        else
            core.InfoFrame_DynamicTable[player] = {1,core.InfoFrame_DynamicTable[player][2]}
        end
    end


    if core.InfoFrame_PlayersTable[player] == 3 then
        core.InfoFrame_PlayersTable[player] = 3
        return false
    else
        core.InfoFrame_PlayersTable[player] = 3
        return true
    end
end

function InfoFrame_GetDynamicPlayer(player)
    if core.InfoFrame_DynamicTable[player] ~= nil then
        return core.InfoFrame_DynamicTable[player][2]
    else
        return nil
    end
end

function InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
    --This will update list of players on the info frame for personal achievements.
    --This will only display names of players who still need the achievement
    --This will also display an additional message

    if next(core.InfoFrame_PlayersTable) == nil then
        --If table is empty then generate players
        for k,player in ipairs(core.currentBosses[1].players) do
            core.InfoFrame_PlayersTable[player] = {1,""}
        end
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            --1 = incomplete, 2 = complete, 3 = failed 4 = In Progress
            if status[1] == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. " (" .. status[2] .. ")|r\n"
            end
        end
        core.IATInfoFrame:SetText1(messageStr)
    end
end

function InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonalArgs(playerTable)
    --This will update list of players on the info frame for personal achievements.
    --This will only display names of players who still need the achievement
    --This will also display an additional message

    if next(core.InfoFrame_PlayersTable) == nil then
        --If table is empty then generate players
        for k,player in ipairs(playerTable.players) do
            if player ~= L["GUI_NoPlayersNeedAchievement"] then
                core.InfoFrame_PlayersTable[player] = {1,""}
            end
        end
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            --1 = incomplete, 2 = complete, 3 = failed
            if status[1] == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. " (" .. status[2] .. ")|r\n"
            elseif status[1] then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. " (" .. status[2] .. ")|r\n"
            end
        end
        core.IATInfoFrame:SetText1(messageStr)
    end
end

function InfoFrame_RefreshPlayersOnInfoFrameWithAdditionalInfoPersonal(boss)
    for k,player in ipairs(boss.players) do
        if core.InfoFrame_PlayersTable[player] == nil then
            core.InfoFrame_PlayersTable[player] = {1,""}
        end
    end
end

function InfoFrame_RefreshPlayersOnInfoFrame()
    for k,player in pairs(core:getPlayersInGroupForAchievement()) do
        if core.InfoFrame_PlayersTable[player] == nil then
            core.InfoFrame_PlayersTable[player] = 1
        end
    end
end

function InfoFrame_RefreshPlayersOnInfoFrameTable()
    for player,status in pairs(core:getPlayersInGroupForAchievement()) do
        if core.InfoFrame_PlayersTable[player] == nil then
            core.InfoFrame_PlayersTable[status][1] = 1
        end
    end
end

function InfoFrame_UpdatePlayersOnInfoFramePersonal()
    --This will update list of players on the info frame for personal achievements.
    --This will only display names of players who still need the achievement

    if next(core.InfoFrame_PlayersTable) == nil then
        --If table is empty then generate players
        for k,player in ipairs(core.currentBosses[1].players) do
            core.InfoFrame_PlayersTable[player] = 1
        end
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            if status == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. "|r\n"
            elseif status == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. "|r\n"
            elseif status == 3 then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. "|r\n"
            elseif status == 4 then
                --Player is out of tracking range
                messageStr = messageStr .. colourOrange .. player .. "|r\n"
            end
        end
        core.IATInfoFrame:SetText1(messageStr)
    end
end

function InfoFrame_UpdatePlayersOnInfoFramePersonal2(boss, checkForAllPlayers)
    --This will update list of players on the info frame for personal achievements.
    --This will only display names of players who still need the achievement

    --Check that we have all players
    if checkForAllPlayers == true then
        if core.InfoFrame_PlayersTable ~= nil then
            local playersTableLength = 0
            for k,v in pairs(core.InfoFrame_PlayersTable) do
                if v ~= nil then
                    playersTableLength = playersTableLength + 1
                end
            end

            if playersTableLength ~= #core.Instances[core.expansion][core.instanceType][core.instance][boss].players then
                --Group composition has changed, let reset the InfoFrame and rescan
                core.InfoFrame_PlayersTable = {}
                for k,player in ipairs(core.Instances[core.expansion][core.instanceType][core.instance][boss].players) do
                    core.InfoFrame_PlayersTable[player] = 1
                end
            end
        end
    end

    if next(core.InfoFrame_PlayersTable) == nil then
        --If table is empty then generate players
        for k,player in ipairs(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players) do
            core.InfoFrame_PlayersTable[player] = 1
        end
    else
        --Update Info Frame with values from table
        local messageStr = ""
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            if status == 1 then
                --Player has not completed the requirements for the achievement yet
                messageStr = messageStr .. colourWhite .. player .. "|r\n"
            elseif status == 2 then
                --Player has completed the requirements for the achievement
                messageStr = messageStr .. colourGreen .. player .. "|r\n"
            elseif status == 3 then
                --Player had completed the requirements for the achievement but has since failed it
                messageStr = messageStr .. colourRed .. player .. "|r\n"
            elseif status == 4 then
                --Player is out of tracking range
                messageStr = messageStr .. colourOrange .. player .. "|r\n"
            end
        end
        core.IATInfoFrame:SetText1(messageStr)
    end
end

function InfoFrame_GetRangeCheck(range)
    local maxChecker = rc:GetFriendChecker(range)
    if maxChecker ~= nil then
        for player, status in pairs(core.InfoFrame_PlayersTable) do
            if not maxChecker(player) then
                --print(player .. " is not in range")
                if core.InfoFrame_PlayersTable[player] ~= 2 then
                    core.InfoFrame_PlayersTable[player] = 4
                end
            elseif core.InfoFrame_PlayersTable[player] ~= 2 then
                core.InfoFrame_PlayersTable[player] = 1
            end
        end
    end
end

function InfoFrame_SetPlayerFailed(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player] == 3 then
            core.InfoFrame_PlayersTable[player] = 3
            return false
        else
            core.InfoFrame_PlayersTable[player] = 3
            return true
        end
    end
end

function InfoFrame_SetPlayerFailedWithMessage(player,additionalInfo)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player][1] == 3 or core.InfoFrame_PlayersTable[player][1] == 1 then
            core.InfoFrame_PlayersTable[player][1] = 3
            core.InfoFrame_PlayersTable[player][2] = additionalInfo
            return false
        else
            core.InfoFrame_PlayersTable[player][1] = 3
            core.InfoFrame_PlayersTable[player][2] = additionalInfo
            return true
        end
    end
end

function InfoFrame_GetPlayerStatusWithMessage(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    return core.InfoFrame_PlayersTable[player][1]
end

function InfoFrame_GetPlayerFailed(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] == 3 then
        return true
    else
        return false
    end
end

function InfoFrame_GetPlayerFailedWithMessage(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player][1] == 3 then
        return true
    else
        return false
    end
end

function InfoFrame_GetPlayerComplete(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] == 2 then
        return true
    else
        return false
    end
end

function InfoFrame_GetPlayerCompleteWithMessage(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player][1] == 2 then
        return true
    else
        return false
    end
end

function InfoFrame_GetIncompletePlayers()
    --Returns a string with all players who are marked as incomplete
    local playerStr = ""
    for player,status in pairs(core.InfoFrame_PlayersTable) do
        if core.InfoFrame_PlayersTable[player] == 1 or core.InfoFrame_PlayersTable[player] == 3 then
            playerStr = playerStr .. player .. ", "
        end
    end
    return playerStr
end


function InfoFrame_IsAnyPlayerComplete()
    --Check whether atleast one player is marked as complete
    local playerComplete = false
    for player,status in pairs(core.InfoFrame_PlayersTable) do
        if core.InfoFrame_PlayersTable[player][1] == 2 then
            playerComplete = true
        end
    end
    return playerComplete
end

function InfoFrame_GetIncompletePlayersWithAdditionalInfo()
    --Returns a string with all players who are marked as incomplete
    local playerStr = ""
    for player,status in pairs(core.InfoFrame_PlayersTable) do
        if core.InfoFrame_PlayersTable[player][1] == 1 or core.InfoFrame_PlayersTable[player][1] == 3 then
            playerStr = playerStr .. player .. ", "
        end
    end
    return playerStr
end

function InfoFrame_SetPlayerComplete(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player] == 2 then
            core.InfoFrame_PlayersTable[player] = 2
            return false
        else
            core.InfoFrame_PlayersTable[player] = 2
            return true
        end
    end
end

function InfoFrame_SetPlayerNeutral(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player] == 1 then
            core.InfoFrame_PlayersTable[player] = 1
            return false
        else
            core.InfoFrame_PlayersTable[player] = 1
            return true
        end
    end
end

function InfoFrame_SetPlayerCompleteWithMessage(player,additionalInfo)
    --core:sendDebugMessage("Inside SetPlayerCompletedMessage")
    --core:sendDebugMessage(additionalInfo)
    --core:sendDebugMessage(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player][1] == 2 then
            core.InfoFrame_PlayersTable[player][1] = 2
            core.InfoFrame_PlayersTable[player][2] = additionalInfo

            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][1])
            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][2])

            return false
        else
            core.InfoFrame_PlayersTable[player][1] = 2
            core.InfoFrame_PlayersTable[player][2] = additionalInfo

            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][1])
            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][2])

            return true
        end
    end
end

function InfoFrame_SetPlayerNeutralWithMessage(player,additionalInfo)
    --core:sendDebugMessage("Inside SetPlayerNeutralMessage")
    --core:sendDebugMessage(additionalInfo)
    --core:sendDebugMessage(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player][1] == 1 then
            core.InfoFrame_PlayersTable[player][1] = 1
            core.InfoFrame_PlayersTable[player][2] = additionalInfo

            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][1])
            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][2])

            return false
        else
            core.InfoFrame_PlayersTable[player][1] = 1
            core.InfoFrame_PlayersTable[player][2] = additionalInfo

            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][1])
            --core:sendDebugMessage(core.InfoFrame_PlayersTable[player][2])

            return true
        end
    end
end

function InfoFrame_SetPlayerInProgressWithMessage(player,additionalInfo)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        if core.InfoFrame_PlayersTable[player][1] == 4 then
            core.InfoFrame_PlayersTable[player][1] = 4
            core.InfoFrame_PlayersTable[player][2] = additionalInfo

            return false
        else
            core.InfoFrame_PlayersTable[player][1] = 4
            core.InfoFrame_PlayersTable[player][2] = additionalInfo

            return true
        end
    end
end

function InfoFrame_SetPlayerIncomplete(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        core.InfoFrame_PlayersTable[player] = 1
    end
end

function InfoFrame_SetHeaderMessage(message)
    core.IATInfoFrame:SetSubHeading1(message)
end

function InfoFrame_SetHeaderCounter(message,counter,maximum)
    core.IATInfoFrame:SetSubHeading1(message .. " (" .. counter .. "/" .. maximum .. ")")
end

function InfoFrame_SetHeaderCounterWithAdditionalMessage(message,counter,maximum, message2)
    core.IATInfoFrame:SetSubHeading1(message .. " (" .. counter .. "/" .. maximum .. ")\n" .. message2)
end

function InfoFrame_SetHeaderWithColour(message,colour)
    if colour == "red" then
        core.IATInfoFrame:SetSubHeading1(colourRed .. message .. "|r")
    elseif colour == "green" then
        core.IATInfoFrame:SetSubHeading1(colourGreen .. message .. "|r")
    else
        core.IATInfoFrame:SetSubHeading1(message)
    end
end

function InfoFrame_SetupManualCounter(totalCount)
    if core.manualCountSetup == false then
        core.manualCountMaxSize = totalCount

        core.InfoFrame.Events:RegisterEvent("CHAT_MSG_RAID")
        core.InfoFrame.Events:RegisterEvent("CHAT_MSG_RAID_LEADER")
        core.InfoFrame.Events:RegisterEvent("CHAT_MSG_PARTY")
        core.InfoFrame.Events:RegisterEvent("CHAT_MSG_PARTY_LEADER")
        core.InfoFrame.Events:RegisterEvent("CHAT_MSG_SAY")

        core.manualCountSetup = true
    end
end

function InfoFrame_IncrementManualCounter(count)
    core.manualCountCurrentSize = core.manualCountCurrentSize + count
    core:sendMessage(core:getAchievement() .. " Manual Counter (" .. core.manualCountCurrentSize .. "/" .. core.manualCountMaxSize .. ")")

    if core.manualCountCurrentSize >= core.manualCountMaxSize then
        core:getAchievementSuccessManual()
    end
end

function InfoFrame_DecrementManualCounter(count)
    if core.manualCountCurrentSize - count >= 0 then
        core.manualCountCurrentSize = core.manualCountCurrentSize - count
        core:sendMessage(core:getAchievement() .. " Manual Counter (" .. core.manualCountCurrentSize .. "/" .. core.manualCountMaxSize .. ")")
    elseif core.manualCountCurrentSize - count < 0 then
        core.manualCountCurrentSize = 0
        core:sendMessage(core:getAchievement() .. " Manual Counter (" .. core.manualCountCurrentSize .. "/" .. core.manualCountMaxSize .. ")")
    end
end

function InfoFrame_GetManualCounterCount()
    return core.manualCountCurrentSize
end

function InfoFrame_SetCustomMessage(message)
    core.IATInfoFrame:SetText1(message)
end

function core.InfoFrame.Events:CHAT_MSG_RAID(self, text, playerName)
    if text ~= nil then
        if not string.find(text, '[IAT]') then
            if string.match(text, '[+]%d+') then
                InfoFrame_IncrementManualCounter(string.sub(string.match(text, '[+]%d+'), 2))
            elseif string.match(text, '[-]%d+') then
                InfoFrame_DecrementManualCounter(string.sub(string.match(text, '[-]%d+'), 2))
            end
        end
    end
end

function core.InfoFrame.Events:CHAT_MSG_RAID_LEADER(self, text, playerName)
    if text ~= nil then
        if not string.find(text, '[IAT]') then
            if string.match(text, '[+]%d+') then
                InfoFrame_IncrementManualCounter(string.sub(string.match(text, '[+]%d+'), 2))
            elseif string.match(text, '[-]%d+') then
                InfoFrame_DecrementManualCounter(string.sub(string.match(text, '[-]%d+'), 2))
            end
        end
    end
end

function core.InfoFrame.Events:CHAT_MSG_PARTY(self, text, playerName)
    if text ~= nil then
        if not string.find(text, '[IAT]') then
            if string.match(text, '[+]%d+') then
                InfoFrame_IncrementManualCounter(string.sub(string.match(text, '[+]%d+'), 2))
            elseif string.match(text, '[-]%d+') then
                InfoFrame_DecrementManualCounter(string.sub(string.match(text, '[-]%d+'), 2))
            end
        end
    end
end

function core.InfoFrame.Events:CHAT_MSG_PARTY_LEADER(self, text, playerName)
    if text ~= nil then
        if not string.find(text, '[IAT]') then
            if string.match(text, '[+]%d+') then
                InfoFrame_IncrementManualCounter(string.sub(string.match(text, '[+]%d+'), 2))
            elseif string.match(text, '[-]%d+') then
                InfoFrame_DecrementManualCounter(string.sub(string.match(text, '[-]%d+'), 2))
            end
        end
    end
end

function core.InfoFrame.Events:CHAT_MSG_SAY(self, text, playerName)
    if text ~= nil then
        if not string.find(text, '[IAT]') then
            if string.match(text, '[+]%d+') then
                InfoFrame_IncrementManualCounter(string.sub(string.match(text, '[+]%d+'), 2))
            elseif string.match(text, '[-]%d+') then
                InfoFrame_DecrementManualCounter(string.sub(string.match(text, '[-]%d+'), 2))
            end
        end
    end
end