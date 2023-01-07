--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Vault of the Incarnates Bosses
------------------------------------------------------
core._2522 = {}
core._2522.Events = CreateFrame("Frame")

------------------------------------------------------
---- Dathea, Ascended
------------------------------------------------------
local condensedGaleCounter = 0

------------------------------------------------------
---- Terros
------------------------------------------------------
local energizedEarthCounter = 0

------------------------------------------------------
---- Sennarth, The Cold Breath
------------------------------------------------------
local strangeChickensFreed = 0
local strangeChickensKilled = 0

------------------------------------------------------
---- Kurog Grimtotem
------------------------------------------------------
local primalAvaterSpawned = false

------------------------------------------------------
---- Raszageth The Storm Eater
------------------------------------------------------
local concetratedStormSpawned = false
local concetratedStormEssencePlayers = {}

function core._2522:Eranog()
    --Defeat Eranog after finding a Frozen Portal Stone and defeating a Burning Behemoth in Vault of the Incarnates on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(16335, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:Terros()
    --Defeat Terros after hitting the three Dormant Earth nodes in his chamber with Awakened Earth and then defeating the resultant Energized Earth creatures in Vault of the Incarnates on Normal difficulty or higher.

    if core.type == "UNIT_DIED" and core.destID == "196993" then
        energizedEarthCounter = energizedEarthCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(196993) .. " " .. L["Shared_Killed"] .. " (" .. energizedEarthCounter .. "/3)",true)
    end
end

function core._2522:ThePrimalCouncil()
    --Use fishing to lure the Lurking Lunker living in the lava out, then engage and defeat the Primal Council in the Vault of the Incarnates on Normal difficulty or higher.

    --TODO: Check in game for this
    if core:getBlizzardTrackingStatus(16364, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:SennarthTheColdBreath()
    --Defeat Sennarth, The Cold Breath after finding and freeing 5 mysterious captives using Caustic Eruption, then witnessing their demise in Vault of the Incarnates on Normal difficulty or higher.

    --Freed Strange Chicken
    if core.type == "SPELL_SUMMON" and core.destID == "197396" then
        strangeChickensFreed = strangeChickensFreed + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(197396) .. " " .. L["Shared_Killed"] .. " (" .. strangeChickensFreed .. "/5)",true)
    end

    --Killed Strange Chicken
    if core.type == "UNIT_DIED" and core.destID == "197396" then
        strangeChickensKilled = strangeChickensKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(197396) .. " " .. L["Shared_Killed"] .. " (" .. strangeChickensKilled .. "/5)",true)
    end

    if core:getBlizzardTrackingStatus(16419, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:DatheaAscended()
    --Defeat Dathea, Ascended after collecting 8 Condensed Gales in Vault of the Incarnates on Normal difficulty or higher.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 392036 then
        condensedGaleCounter = condensedGaleCounter + 1
        core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(392036) .. " (" .. condensedGaleCounter .. "/8)",true)
    end

    if core:getBlizzardTrackingStatus(16458, 1) == true and condensedGaleCounter >= 8 then
		core:getAchievementSuccess()
	end
end

function core._2522:KurogGrimtotem()
    --Defeat Kurog Grimtotem after destroying the Primal Avatar in Vault of the Incarnates on Normal difficulty or higher.

	--Announce when Primal Avater has spawned
	if (core.destID == 198038 or core.sourceID == 198038) and primalAvaterSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(198038)),true)
        primalAvaterSpawned = true
    end

    if core:getBlizzardTrackingStatus(16450, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:BroodkeeperDiurna()
    --Defeat Broodkeeper Diurna after successfully hatching and defeating lieutenants from each Primal element's eggs within 10 seconds of each other in Vault of the Incarnates on Normal difficulty or higher.

	core.MobCounter:Setup(4, 10, "197298")
	core.MobCounter:DetectSpawnedMob()
	core.MobCounter:DetectKilledMob()

    if core:getBlizzardTrackingStatus(16442, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:RaszagethTheStormEater()
    --Defeat Raszageth the Storm-Eater after successfully gathering two Concentrated Storm Essences and defeating the Concentrated Storm in Vault of the Incarnates on Normal difficulty or higher.

    --Concetrated Storm spawned
    if (core.destID == "198370" or core.sourceID == "198370") and concetratedStormSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(198370)),true)
        concetratedStormSpawned = true
    end

    --Check if player with Concetrated Storm Essence has died and fail if mob has not spawned
    if core.type == "UNIT_DIED" and core.destName ~= nil then
        if UnitIsPlayer(core.destName) then
            local player = core.destName
            C_Timer.After(1, function()
                if concetratedStormSpawned == false then
                    if string.find(player, "-") then
                        local name, realm = strsplit("-", player)
                        player = name

                        if concetratedStormEssencePlayers[player] then
                            core:getAchievementFailedWithMessageAfter("(" .. player .. ")")
                        end
                    end
                end
            end)
        end
    end


    if core:getBlizzardTrackingStatus(16451, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:ClearVariables()
    ------------------------------------------------------
    ---- Dathea, Ascended
    ------------------------------------------------------
    condensedGaleCounter = 0

    ------------------------------------------------------
    ---- Terros
    ------------------------------------------------------
    energizedEarthCounter = 0

    ------------------------------------------------------
    ---- Sennarth, The Cold Breath
    ------------------------------------------------------
    strangeChickensFreed = 0
    strangeChickensKilled = 0

    ------------------------------------------------------
    ---- Kurog Grimtotem
    ------------------------------------------------------
    primalAvaterSpawned = false

    ------------------------------------------------------
    ---- Raszageth The Storm Eater
    ------------------------------------------------------
    concetratedStormSpawned = false
    concetratedStormEssencePlayers = {}
end

function core._2522:InstanceCleanup()
    core._2522.Events:UnregisterEvent("UNIT_AURA")
end

core._2522.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2522:InitialSetup()
    core._2522.Events:RegisterEvent("UNIT_AURA")
end

function core._2522.Events:UNIT_AURA(self, unitID)
    --Raszageth The Storm Eater Achievement
    if next(core.currentBosses) ~= nil then
        if core.currentBosses[1].encounterID == 2607 then
            local name, realm = UnitName(unitID)
            for i=1,40 do
                local _, _, count2, _, _, _, _, _, _, spellId = UnitDebuff(unitID, i)
                if name ~= nil then
                    if spellId == 393365 then
                        --Concentrated Storm Essence
                        core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(393365),true)
                        concetratedStormEssencePlayers[name] = true
                    end
                end
            end
        end
    end
end