--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

local rc = LibStub("LibRangeCheck-2.0")

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
local colourRed = "|cffFF0000"
local colourGreen = "|cff59FF00"
local colourWhite = "|cffFFFFFF"
local colourOrange = "|cffff6100"

function InfoFrame_UpdatePlayersOnInfoFrame()
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
        core.IATInfoFrame:SetText1(messageStr)
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

function InfoFrame_GetRangeCheck(range)
    local maxChecker = rc:GetFriendMaxChecker(range)
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

function InfoFrame_SetPlayerFailed(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        core.InfoFrame_PlayersTable[player] = 3
    end
end

function InfoFrame_SetPlayerComplete(player)
    --Make sure we remove realm info from player before checking name
    if string.find(player, "-") then
        local name, realm = strsplit("-", player)
        player = name
    end

    if core.InfoFrame_PlayersTable[player] ~= nil then
        core.InfoFrame_PlayersTable[player] = 2
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

function InfoFrame_SetHeaderCounter(message,counter,maximum)
    core.IATInfoFrame:SetSubHeading1(message .. " (" .. counter .. "/" .. maximum .. ")")
end