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
---- Eranog
------------------------------------------------------
local frozenSolidCounter = 8
local frozenBehmeothAnnounce = false

------------------------------------------------------
---- Dathea, Ascended
------------------------------------------------------
local condensedGaleCounter = 0
local condensedGaleUID = {}

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

    if (core.type == "SPELL_AURA_REMOVED_DOSE" or core.type == "SPELL_AURA_REMOVED") and core.spellId == 389203 then
        frozenSolidCounter = frozenSolidCounter - 1
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(389203) .. " " .. L["Shared_StacksRemaining"] .. " " .. frozenSolidCounter,true)
    end

    if frozenSolidCounter == 0 and frozenBehmeothAnnounce == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(196845)),true)
        frozenBehmeothAnnounce = true
    end

    if core.type == "UNIT_DIED" and core.destID == "196845" and frozenSolidCounter > 0 then
        core:getAchievementFailedWithMessageAfter("(" .. L["Shared_StacksRemaining"] .. " " .. frozenSolidCounter .. ")")
    end

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

    if core:getBlizzardTrackingStatus(16364, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:SennarthTheColdBreath()
    --Defeat Sennarth, The Cold Breath after finding and freeing 5 mysterious captives using Caustic Eruption, then witnessing their demise in Vault of the Incarnates on Normal difficulty or higher.

    --Freed Strange Chicken
    if core.type == "SPELL_SUMMON" and core.destID == "197396" then
        strangeChickensFreed = strangeChickensFreed + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(197396) .. " " .. L["Shared_Freed"] .. " (" .. strangeChickensFreed .. "/5)" .. " " .. L["Shared_Killed"] .. " (" .. strangeChickensKilled .. "/5)",true)
    end

    --Killed Strange Chicken
    if core.type == "UNIT_DIED" and core.destID == "197396" then
        strangeChickensKilled = strangeChickensKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(197396) .. " " .. L["Shared_Freed"] .. " (" .. strangeChickensFreed .. "/5)" .. " " .. L["Shared_Killed"] .. " (" .. strangeChickensKilled .. "/5)",true)
    end

    if core:getBlizzardTrackingStatus(16419, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2522:DatheaAscended()
    --Defeat Dathea, Ascended after collecting 8 Condensed Gales in Vault of the Incarnates on Normal difficulty or higher.

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 392036 and core.destName ~= nil then
        if condensedGaleUID[core.destName] == nil then
            condensedGaleCounter = condensedGaleCounter + 1
            condensedGaleUID[core.destName] = core.destName
            core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(392036) .. " (" .. condensedGaleCounter .. "/8)",true)
        end
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

	-- core.MobCounter:Setup(4, 10, "197298")
	-- core.MobCounter:DetectSpawnedMob()
	-- core.MobCounter:DetectKilledMob()

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
    ---- Eranog
    ------------------------------------------------------
    frozenSolidCounter = 8
    frozenBehmeothAnnounce = false

    ------------------------------------------------------
    ---- Dathea, Ascended
    ------------------------------------------------------
    condensedGaleCounter = 0
    condensedGaleUID = {}

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
    core._2522.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2522.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2522:InitialSetup()
    core._2522.Events:RegisterEvent("UNIT_AURA")
    core._2522.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2522.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitTarget, castGUID, spellID)
	if spellID == 389209 then
        local name, realm = UnitName(unitTarget)
		core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(389209),true)
	end
end

function core._2522.Events:UNIT_AURA(self, unitID)
    --Raszageth The Storm Eater Achievement
    if next(core.currentBosses) ~= nil then
        if core.currentBosses[1].encounterID == 2607 then
            local name, realm = UnitName(unitID)
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(unitID, i)
                if name ~= nil then
                    if auraData ~= nil and auraData.spellId == 393365 and concetratedStormEssencePlayers[name] == nil then
                        --Concentrated Storm Essence
                        core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(393365),true)
                        concetratedStormEssencePlayers[name] = true
                    end
                end
            end
        end
    end
end