--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- The Azure Vault Bosses
------------------------------------------------------
core._2515 = {}

------------------------------------------------------
---- The Azure Vault Bosses
------------------------------------------------------
local geodeChunksKilled = 0

function core._2515:Umbrelskul()
    --Defeat Umbrelskul without being hit by a polymorph trap or triggering a Shriek in The Azure Vault on Mythic difficulty.

    --TODO: Bruser says this is a group achievement
end

function core._2515:Umbrelskul2()
    --Defeat Umbrelskul after smashing Shimmering Geodes with Dragon Strike and destroying 9 Geode Chunks in The Azure Vault on Mythic difficulty.

    if core.type == "UNIT_DIED" and core.destID == "196696" then
        geodeChunksKilled = geodeChunksKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(196696) .. " " .. L["Shared_Killed"] .. " (" .. disciplesKilled .. "/3)",true)
    end

    if core:getBlizzardTrackingStatus(16331, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2515:TelashGreywing()
    --Defeat Telash Greywing after using Icy Devastator 12 times on an Icy Crystal to create a Very Icy Crystal in The Azure Vault on Mythic difficulty.

    --TODO: Can we track the 12 stacks?

    if core:getBlizzardTrackingStatus(16445, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2515:ClearVariables()
    ------------------------------------------------------
    ---- The Azure Vault Bosses
    ------------------------------------------------------
    geodeChunksKilled = 0
end