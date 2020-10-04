--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- The Necrotic Wake
------------------------------------------------------
core._2286 = {}

------------------------------------------------------
---- Surgeon Stitchflesh
------------------------------------------------------
local barrel1Destroyed = false
local barrel2Destroyed = false
local barrelCounter = 0

function core._2286:AmarthTheHarvester()
    --Defeat Amarth the Harvester after he's consumed the corpse of a Grisly Colossus using Final Harvest in the Necrotic Wake on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14295, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2286:SurgeonStitchflesh()
    --Defeat Surgeon Stitchflesh after destroying two barrels of spare parts in the Necrotic Wake on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14320, 1) == true and barrel1Destroyed == false then
        core:sendMessage(GetAchievementCriteriaInfo(14320,1) .. " " .. L["Shared_Completed"] .. " (" .. barrelCounter .. "/3)")
        barrel1Destroyed = true
        barrelCounter = barrelCounter + 1
    end
    if core:getBlizzardTrackingStatus(14320, 2) == true and barrel2Destroyed == false then
        core:sendMessage(GetAchievementCriteriaInfo(14320,2) .. " " .. L["Shared_Completed"] .. " (" .. barrelCounter .. "/3)")
        barrel2Destroyed = true
        barrelCounter = barrelCounter + 1
    end

    if core:getBlizzardTrackingStatus(14320, 1) == true and core:getBlizzardTrackingStatus(14320, 2) then
        core:getAchievementSuccess()
    end
end

function core._2286:NalthorTheRimebinder()
    --Defeat Nalthor the Rimebinder in the Necrotic Wake without being struck by Comet Storm, Blizzard, or the secondary effect of Frozen Binds on Mythic difficulty.
    InfoFrame_UpdatePlayersOnInfoFramePersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],#core.currentBosses[1].players,#core.currentBosses[1].players)

    --Comet Storm
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 320784 then
        if core.destName ~= nil then
            if UnitIsPlayer(core.destName) then
                if InfoFrame_GetPlayerComplete(core.destName) == true then
                    InfoFrame_SetPlayerFailed(core.destName)
                    core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(320784))),true)
                end
            end
        end
    end

    --Frozen Blinds (Secondary Effect)
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 323730 then
        if core.destName ~= nil then
            if UnitIsPlayer(core.destName) then
                if InfoFrame_GetPlayerComplete(core.destName) == true then
                    InfoFrame_SetPlayerFailed(core.destName)
                    core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(323730))),true)
                end
            end
        end
    end

    --Blizzard
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and core.spellId == 287294 then
        if core.destName ~= nil then
            if UnitIsPlayer(core.destName) then
                if InfoFrame_GetPlayerComplete(core.destName) == true then
                    InfoFrame_SetPlayerFailed(core.destName)
                    core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(287294))),true)
                end
            end
        end
    end
end

function core._2285:ClearVariables()
    ------------------------------------------------------
    ---- Surgeon Stitchflesh
    ------------------------------------------------------
    barrel1Destroyed = false
    barrel2Destroyed = false
    barrelCounter = 0
end
