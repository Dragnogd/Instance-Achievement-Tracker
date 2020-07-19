--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- The Necrotic Wake
------------------------------------------------------
core._2286 = {}

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