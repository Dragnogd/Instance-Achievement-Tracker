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

    --Comet Storm: 321956 (DEBUFF)
    --Blizzard: 287294 (SPELL_DAMAGE)
        --Chilled: 287295 (DEBUFF)
    --Frozen Blinds (Secondary Effect): 320788

    if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 321956) or (core.type == "SPELL_DAMAGE" and core.spellId == 287294) or (core.type == "SPELL_AURA_APPLIED" and core.spellId == 287295) or (core.type == "SPELL_AURA_APPLIED" and core.spellId == 320788 and core.currentSource == "Player") then
        --If someone gets hit by the ability, check if they need the achievement or not
        if core.destName ~= nil then
            local name, realm = strsplit("-", core.destName)
            if UnitIsPlayer(name) then
                --Detect the reason the player has failed the achievement
                local reason = ""
                if core.spellId == 321956 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(321956))
                elseif core.spellId == 287294 or core.spellId == 287295 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(287294))
                elseif core.spellId == 320788 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(320788))
                end
                if playersHit[core.destName] == nil then
                    --Players has not been hit already
                    --Check if the player actually needs the achievement
                    if core:has_value(core.currentBosses[1].players, core.destName) then
                        --Player needs achievement but has failed it
                        core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), reason),true)
                    end
                    playersHit[core.destName] = true
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
