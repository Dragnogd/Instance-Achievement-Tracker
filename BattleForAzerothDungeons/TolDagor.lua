--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Tol Dagor Bosses
------------------------------------------------------
core._1771 = {}

------------------------------------------------------
---- Overseer Korgus
------------------------------------------------------
local heartstopperVenomCounter = 0

function core._1771:OverseerKorgus()
    --Gained Heartstopper venom stun
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 256474 then
        heartstopperVenomCounter = heartstopperVenomCounter + 1

        if heartstopperVenomCounter == core.groupSize then
            core:getAchievementSuccess()
        end
    end

    --Lost Heartstopper venom stun
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 256474 then
        heartstopperVenomCounter = heartstopperVenomCounter - 1
    end
end

function core._1771:KnightCaptainValyri()
    if core.type == "SPELL_DAMAGE" and core.spellId == 256710 then
        core:getAchievementFailed()
    end
end

function core._1771:ClearVariables()
end