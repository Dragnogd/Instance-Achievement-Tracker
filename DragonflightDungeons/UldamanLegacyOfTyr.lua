--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Uldaman: Legacy of Tyr Bosses
------------------------------------------------------
core._2451 = {}

------------------------------------------------------
---- Sentinel Talondras
------------------------------------------------------
local stunCounter = 0
local stunUID = {}

function core._2451:Bromach()
    --Defeat Bromach while 10 or more Stonevault Troggs are still alive in Uldaman: Legacy of Tyr on Mythic difficulty.

    --TODO: InfoFrame to show how many Stonevault Troggs are alive

    if core:getBlizzardTrackingStatus(16337, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2451:SentinelTalondras()
    --Defeat Sentinel Talondras after simultaneously stunning both Sentinel Talondras and all party members in Uldaman: Legacy of Tyr on Mythic difficulty.

    --TODO: Set all players green when completed
    --TODO: Show boss on the InfoFrame

	-- InfoFrame_UpdatePlayersOnInfoFrame()
	-- InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],stunCounter,core.groupSize)

    -- if core.type == "SPELL_AURA_APPLIED" and core.spellId == 372652 and core.destID ~= nil then
    --     if stunUID[core.destName] == nil then
    --         stunCounter = stunCounter + 1
    --         stunUID[core.destName] = core.destName
    --         InfoFrame_SetPlayerComplete(core.destName)
    --     end
    -- end

    -- if core.type == "SPELL_AURA_REMOVED" and core.spellId == 372652 then
    --     if stunUID[core.destName] ~= nil then
    --         stunCounter = stunCounter - 1
    --         stunUID[core.destName] = nil
    --         InfoFrame_SetPlayerFailed(core.destName)
    --     end
    -- end

    if core:getBlizzardTrackingStatus(16282, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2451:ChronoLordDeios()
    --Defeat Chrono-Lord Deios after catching every Eternity Orb as it falls to the ground in Uldaman: Legacy of Tyr on Mythic difficulty.
    if core:getBlizzardTrackingStatus(16281, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2451:ClearVariables()
    ------------------------------------------------------
    ---- Sentinel Talondras
    ------------------------------------------------------
    stunCounter = 0
    stunUID = {}
end