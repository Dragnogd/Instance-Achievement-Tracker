--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Theater of Pain
------------------------------------------------------
core._2293 = {}

------------------------------------------------------
---- Mordretha
------------------------------------------------------
local announceChallenge = false
local ghostlyContenderCounter = 0

------------------------------------------------------
---- Affront of Challengers
------------------------------------------------------
local parceranKilled = false
local sathelKilled = false
local dessiaKilled = false

function core._2293:Gorechop()
    --Defeat Gorechop after tenderizing 2 hunks of meat with Tenderizing Smash in the Theater of Pain on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14607, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2293:Mordretha()
    --Defeat Mordretha, the Endless Empress, after performing a /challenge and defeating 2 Ghostly Contenders in the Theater of Pain on Mythic difficulty.

    if core:getHealthPercent("boss1") <= 50 and announceChallenge == false then
        core:sendMessage(format(L["TheaterOfPain_ChallengeNow"], getNPCName(173675)),true)
        announceChallenge = true
    end

    if core.type == "UNIT_DIED" and (core.destID == "173675" or core.destID == "173667") then
        ghostlyContenderCounter = ghostlyContenderCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(173675) .. " " .. L["Shared_Killed"] .. " (" .. ghostlyContenderCounter .. "/2)",true)
    end

    if core:getBlizzardTrackingStatus(14533, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2293:AffrontOfChallengers()
    --Defeat each of the combatants last throughout multiple completions of the Affront of Challengers encounter in the Theater of Pain on Mythic difficulty.

	if core.type == "UNIT_DIED" and core.destID == "164463" then
		parceranKilled = true
	elseif core.type == "UNIT_DIED" and core.destID == "164461" then
		sathelKilled = true
	elseif core.type == "UNIT_DIED" and core.destID == "164451" then
		dessiaKilled = true
	end

	if parceranKilled == true and sathelKilled == true then
		core:getAchievementSuccessWithCustomMessage(format(L["TerraceOfEndlessSpring_DefeatedLast"], getNPCName(164451)), L["Shared_CompletedBossKill"])
	elseif parceranKilled == true and dessiaKilled == true then
		core:getAchievementSuccessWithCustomMessage(format(L["TerraceOfEndlessSpring_DefeatedLast"], getNPCName(164461)), L["Shared_CompletedBossKill"])
	elseif sathelKilled == true and dessiaKilled == true then
		core:getAchievementSuccessWithCustomMessage(format(L["TerraceOfEndlessSpring_DefeatedLast"], getNPCName(164463)), L["Shared_CompletedBossKill"])
	end
end

function core._2293:ClearVariables()
    ------------------------------------------------------
    ---- Mordretha
    ------------------------------------------------------
    announceChallenge = false
    ghostlyContenderCounter = 0

    ------------------------------------------------------
    ---- Affront of Challengers
    ------------------------------------------------------
    parceranKilled = false
    sathelKilled = false
    dessiaKilled = false
end