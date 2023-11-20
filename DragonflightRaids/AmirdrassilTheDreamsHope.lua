--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Amirdrassil, the Dream's Hope Bosses
------------------------------------------------------
core._2549 = {}
core._2549.Events = CreateFrame("Frame")

------------------------------------------------------
---- Volcoross
------------------------------------------------------
local sizzlingSwoggersCounter = 0

------------------------------------------------------
---- Larodar
------------------------------------------------------
local singedCounter = 50

------------------------------------------------------
---- Larodar
------------------------------------------------------
local manifestedMonarchSpawned = false

------------------------------------------------------
---- Smolderon
------------------------------------------------------
local runesDoused = 0

------------------------------------------------------
---- Fyrakk the Blazing
------------------------------------------------------
local wispsHealed = 0
local idrianaHealed = false
local lariiaHealed = false
local denatharionHealed = false
local melynnHealed = false
local dendrythisHealed = false
local fyldanHealed = false

function core._2549:Gnarlroot()
    --Defeat Gnarlroot after igniting 8 Harmless Blossoms in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    if core:getBlizzardTrackingStatus(19322, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:IgiraTheCruel()
    --Defeat Igira after freeing the scorched critters in Amirdrassil, The Dream's Hope on Normal difficulty or higher.

    --Scorched critters spawn from cages. could we use that to track which ones are destroyed?
    --SPELL_DAMAGE,Player-3676-0AEEA135,"Exiledmage-Area52",0x514,0x0,Creature-0-3020-2549-12391-212653-0000D81D3A,"Scorched Critter",0xa28,0x0,342232,"Arcane Echo",0x40,Creature-0-3020-2549-12391-212653-0000D81D3A,Creature-0-3020-2549-12391-212668-0001581CEB,0,5,0,0,27,0,1,0,0,0,3625.29,13052.13,2232,4.9285,1,10123,4820,10118,64,0,0,0,1,nil,nil

    if core:getBlizzardTrackingStatus(19320, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:Volcoross()
    --Defeat Volcoross after he has consumed at least 30 Sizzling Swoggers in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    --Track counter on boss which tells us how many Sizzling Swoggers have been eaten

    --SPELL_AURA_APPLIED,0000000000000000,nil,0xa48,0x0,Creature-0-3020-2549-12391-208478-00005818D4,"Volcoross",0xa48,0x0,427995,"Sizzling Swoggers",0x1,BUFF
    --SPELL_AURA_APPLIED_DOSE,0000000000000000,nil,0xa28,0x0,Creature-0-3020-2549-12391-208478-00005818D4,"Volcoross",0xa48,0x0,427995,"Sizzling Swoggers",0x1,BUFF,2
    --SPELL_AURA_APPLIED,0000000000000000,nil,0x10a48,0x0,Creature-0-3020-2549-12391-208478-00005818D4,"Volcoross",0x10a48,0x0,428049,"Swog Champion",0x1,BUFF

    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.destID == "208478" and core.spellId == 427995 and sizzlingSwoggersCounter < 30 then
        sizzlingSwoggersCounter = sizzlingSwoggersCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(427995) .. " " .. L["Core_Counter"] .. " (" .. sizzlingSwoggersCounter .. "/30)",true)
    end

    if core:getBlizzardTrackingStatus(19321, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:Larodar()
    --Defeat Larodar, Keeper of the Flame with Ivy extinguished and alive in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    --SPELL_AURA_APPLIED,Creature-0-3020-2549-12391-211268-00005820C3,"Ivy",0xa18,0x0,Creature-0-3020-2549-12391-211268-00005820C3,"Ivy",0xa18,0x0,424595,"Singed",0x1,BUFF
    --SPELL_AURA_REMOVED_DOSE,Creature-0-3020-2549-12391-211268-000058221A,"Ivy",0xa18,0x1,Creature-0-3020-2549-12391-211268-000058221A,"Ivy",0xa18,0x1,424595,"Singed",0x1,BUFF,45

    if (core.type == "SPELL_AURA_REMOVED" or core.type == "SPELL_AURA_REMOVED_DOSE") and core.destID == "211268" and core.spellId == 424595 then
        singedCounter = singedCounter - 1
        core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(424595) .. " " .. L["Core_Counter"] .. " " .. singedCounter,true)
    end

    --If Ivy dies, then fail achievement

    if core:getBlizzardTrackingStatus(19089, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:CouncilOfDreams()
    --Defeat the Council of Dreams after recruiting Sergeant Quackers to join the cause in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    --https://www.wowhead.com/spell=425036/looking-for-allies??

    if core:getBlizzardTrackingStatus(19193, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:Nymue()
    --Defeat Nymue, Weaver of the Cycle after successfully collecting 5 Dream Projections while asleep and defeating the Manifested Monarch in Amirdrassil, the Dream's Hope on Normal Difficulty or Higher.

    --Track debuff when the 5 players sleep?
    --SPELL_AURA_REMOVED,Player-1171-0AB15BFE,"Vallashä-WyrmrestAccord",0x514,0x0,Player-1171-0AB15BFE,"Vallashä-WyrmrestAccord",0x514,0x0,429721,"Dreaming",0x1,BUFF

    --Announce when moth has spawned
    --Creature-0-3020-2549-12391-214020-0000582DD8,"Manifested Monarch"
    if (core.destID == "214020" or core.sourceID == "214020") and manifestedMonarchSpawned == false then
        core:sendMessage(format(L["Shared_KillTheAddNow"], getNPCName(214020)),true)
        manifestedMonarchSpawned = true
    end

    if core:getBlizzardTrackingStatus(19394, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:Smolderon()
    --Defeat Smolderon after dousing all 6 Runes of the Firelord in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    --InfoFrame to show who has water?
    --Dreaming Quintessence: 426312

    --Extra action button to douse.
    --SPELL_CAST_SUCCESS,Player-3676-0AEEA135,"Exiledmage-Area52",0x514,0x0,0000000000000000,nil,0x80000000,0x80000000,426342,"Douse!",0x1,Player-3676-0AEEA135,0000000000000000,664200,664200,1864,17005,2599,0,0,392047,397176,0,4065.63,13080.76,2233,1.8352,461

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 426342 then
        runesDoused = runesDoused + 1
        core:sendMessage(core:getAchievement() .. " " .. GetSpellLink(426342) .. " " .. L["Core_Counter"] .. " " .. runesDoused,true)
    end

    if core:getBlizzardTrackingStatus(19319, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:TindralSageswift()
    --Defeat Tindral Sageswift after rescuing 6 Lost Whelps in Amirdrassil, the Dream's Hope on Normal Difficulty or higher.

    --Buff on players https://www.wowhead.com/ptr-2/spell=428781/rescued-whelp#comments. Not in log as room is too big ?
    --Use UNIT_AURA to track when they come back, but if they die while out and about, we won't know who has failed
    --InfoFrame to show who has picked up whelps?

    --Tracking seems to do success and fail, so need to change this
    if core:getBlizzardTrackingStatus(19393) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:FyrakkTheBlazing()
    --Defeat Fyrakk the Blazing after collecting six Memories of Teldrassil and returning their spirits to the Heart of Amirdrassil in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    --Wisps picked up
    --SPELL_AURA_APPLIED,Player-1151-092844BB,"Naturemyth-Misha",0x514,0x0,Player-1151-092844BB,"Naturemyth-Misha",0x514,0x0,429874,"Spirit of Teldrassil",0x1,BUFF

    --SPELL_AURA_APPLIED,Creature-0-3020-2549-12391-214242-0000583E3E,"Fyldan",0xa18,0x0,Creature-0-3020-2549-12391-214242-0000583E3E,"Fyldan",0xa18,0x0,422605,"Lifeforce Barrier",0x8,BUFF

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 422605 then
        if core.destID == "214211" and idrianaHealed == false then
            --Idriana
            wispsHealed = wispsHealed + 1
            idrianaHealed = true
            core:sendMessage(getNPCName(214211) .. " " .. L["Shared_Completed"] .. " (" .. wispsHealed .. "/6)",true)
        elseif core.destID == "214235" and lariiaHealed == false then
            --Lariia
            wispsHealed = wispsHealed + 1
            lariiaHealed = true
            core:sendMessage(getNPCName(214235) .. " " .. L["Shared_Completed"] .. " (" .. wispsHealed .. "/6)",true)
        elseif core.destID == "214236" and denatharionHealed == false then
            --Denatharion
            wispsHealed = wispsHealed + 1
            denatharionHealed = true
            core:sendMessage(getNPCName(214236) .. " " .. L["Shared_Completed"] .. " (" .. wispsHealed .. "/6)",true)
        elseif core.destID == "214240" and melynnHealed == false then
            --Me'lynn
            wispsHealed = wispsHealed + 1
            melynnHealed = true
            core:sendMessage(getNPCName(214240) .. " " .. L["Shared_Completed"] .. " (" .. wispsHealed .. "/6)",true)
        elseif core.destID == "214241" and dendrythisHealed == false then
            --Dendrythis
            wispsHealed = wispsHealed + 1
            dendrythisHealed = true
            core:sendMessage(getNPCName(214241) .. " " .. L["Shared_Completed"] .. " (" .. wispsHealed .. "/6)",true)
        elseif core.destID == "214242" and fyldanHealed == false then
            --Fyldan
            wispsHealed = wispsHealed + 1
            fyldanHealed = true
            core:sendMessage(getNPCName(214242) .. " " .. L["Shared_Completed"] .. " (" .. wispsHealed .. "/6)",true)
        end
    end

    --Wisps to heal
    --Idriana: 214211
    --Lariia: 214235
    --Denatharion: 214236
    --Me'lynn: 214240
    --Dendrythis: 214241
    --Fyldan: 214242

    if core:getBlizzardTrackingStatus(19390, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:InstanceCleanup()
    core._2549.Events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._2549.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2549:InitialSetup()
    core._2549.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2549.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].enabled then
        local name, realm = UnitName(unitID)

        --Volcoross (Swoghorn)
        if spellID == 426753 then
            core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(426753),true)
        end
    end
end

function core._2549:ClearVariables()
    ------------------------------------------------------
    ---- Volcoross
    ------------------------------------------------------
    sizzlingSwoggersCounter = 0

    ------------------------------------------------------
    ---- Larodar
    ------------------------------------------------------
    singedCounter = 50

    ------------------------------------------------------
    ---- Larodar
    ------------------------------------------------------
    manifestedMonarchSpawned = false

    ------------------------------------------------------
    ---- Smolderon
    ------------------------------------------------------
    runesDoused = 0

    ------------------------------------------------------
    ---- Fyrakk the Blazing
    ------------------------------------------------------
    wispsHealed = 0
    idrianaHealed = false
    lariiaHealed = false
    denatharionHealed = false
    melynnHealed = false
    dendrythisHealed = false
    fyldanHealed = false
end