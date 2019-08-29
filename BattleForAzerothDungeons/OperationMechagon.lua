--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Operation: Mechagon
------------------------------------------------------
core._2097 = {}
core._2097.Events = CreateFrame("Frame")

------------------------------------------------------
---- Gunker
------------------------------------------------------
local helplessCritersSaved = 0

function core._2097:Gunker()
    --Defeat Gunker in Operation: Mechagon after rescuing 5 Helpless Critters on Mythic Difficulty.

    --If Carrying Helpless Critter removed and player is alive, increment counter by 1
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 302766 and UnitIsDead(core.destName) == false then
        helplessCritersSaved = helplessCritersSaved + 1
    end

    if helplessCritersSaved >= 5 then
        core:getAchievementSuccess()
    end
end

function core._2097:TussleTonks()
    --Defeat the Tussle Tonks in Operation: Mechagon after Deuce Mecha-Buffer has been hit with a Piston Smasher on Mythic Difficulty.

    if core.type == "SPELL_DAMAGE" and core.destID == "151654" and core.spellId == 282943 then
        core:getAchievementSuccess()
    end
end 

function core._2097:MachinistsGarden()
    --Defeat the Machinist's Garden in Operation: Mechagon without being struck by "Hidden" Flame Cannon, Self-Trimming Hedges, Discom-BOMB-ulator, or Roaring Flame on Mythic Difficulty.
    --"Hidden" Flame Cannon (285443)
    --Self-Trimming Hedges (294954)
    --Discom-BOMB-ulator (285460)
    --Roaring Flame (294869)

    if (core.type == "SPELL_AURA_APPLIED" and core.spellId == 285443) or (core.type == "SPELL_DAMAGE" and core.spellId == 294954) or (core.type == "SPELL_AURA_APPLIED" and core.spellId == 285460) or (core.type == "SPELL_DAMAGE" and core.spellId == 294869) then
        --If someone gets hit by the ability, check if they need the achievement or not
        if core.destName ~= nil then
            local name, realm = strsplit("-", core.destName)  
            if UnitIsPlayer(name) then
                --Detect the reason the player has failed the achievement
                local reason = ""
                if core.spellId == 285443 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(285443))
                elseif core.spellId == 294954 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(294954))
                elseif core.spellId == 285460 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(285460))
                elseif core.spellId == 294869 then
                    reason = format(L["Shared_DamageFromAbility"], GetSpellLink(294869))
                end
                if playersHit[core.destName] == nil then
                    --Players has not been hit already
                    --Check if the player actually needs the achievement
                    if core:has_value(core.currentBosses[1].players, core.destName) then
                        --Player needs achievement but has failed it
                        core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), reason))
                    end
                    playersHit[core.destName] = true
                end
            end
        end
    end
end

function core._2097:ClearVariables()
    ------------------------------------------------------
    ---- Gunker
    ------------------------------------------------------
    helplessCritersSaved = 0
end