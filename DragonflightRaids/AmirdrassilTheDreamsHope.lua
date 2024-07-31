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
local singedCounter = 70

------------------------------------------------------
---- Nymue
------------------------------------------------------
local manifestedMonarchSpawned = false
local projectedDreamCounter = 0
local dreamProjectionUID = {}

------------------------------------------------------
---- Smolderon
------------------------------------------------------
local runesDoused = 0
local overloadedRunePlayersUID = {}

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

------------------------------------------------------
---- Tindral Sageswift
------------------------------------------------------
local playersWithRescuedWhelps = {}
local rescuedWhelpCounter = 0

------------------------------------------------------
---- Council of Dreams
------------------------------------------------------
local trackPolymorphBomb = false
local polymorphBombCounter = 0

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
        core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(427995) .. " " .. L["Core_Counter"] .. " (" .. sizzlingSwoggersCounter .. "/30)",true)
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
        if singedCounter % 5 == 0 then
            core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(424595) .. " " .. L["Core_Counter"] .. " " .. singedCounter,true)
        end
    end

    --If Ivy dies, then fail achievement
    if core.type == "UNIT_DIED" and core.destID == "211268" then
       core:getAchievementFailed()
    end

    if core:getBlizzardTrackingStatus(19089, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:CouncilOfDreams()
    --Defeat the Council of Dreams after recruiting Sergeant Quackers to join the cause in Amirdrassil, the Dream's Hope on Normal difficulty or higher.

    InfoFrame_UpdatePlayersOnInfoFrame()
    InfoFrame_SetHeaderCounter(C_Spell.GetSpellLink(425410) .. " " .. L["Core_Counter"],polymorphBombCounter,core.groupSize)

    --When player casts preen, check who has been turned in ducks
    --SPELL_CAST_SUCCESS,Player-3676-0E0171A2,"Chrusvoker-Area52",0x514,0x1,0000000000000000,nil,0x80000000,0x80000000,422372,"Preen",0x1,Player-3676-0E0171A2,0000000000000000,642977,723760,3688,14301,10747,0,0,250000,250000,0,4070.15,12620.02,2240,1.9152,462
    -- if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 8936 then --422372
    --     --Set all players back to white
    --     local playerWhoCastSpell = core.sourceName
    --     if string.find(playerWhoCastSpell, "-") then
    --         local name, realm = strsplit("-", playerWhoCastSpell)
    --         playerWhoCastSpell = name
    --     end

    --     trackPolymorphBomb = true
    --     C_Timer.After(2, function()
    --         trackPolymorphBomb = false

    --         --Announce players who did not get hit by polymorph bomb
    --         local playerStr = ""
    --         local playerFailed = false
    --         for player,status in pairs(core.InfoFrame_PlayersTable) do
    --             if core.InfoFrame_PlayersTable[player] == 1 or core.InfoFrame_PlayersTable[player] == 3 then
    --                 --Make sure it's not the player who cast the spell
    --                 if player ~= playerWhoCastSpell then
    --                     InfoFrame_SetPlayerFailed(player)
    --                     playerStr = playerStr .. player .. ", "
    --                     playerFailed = true;
    --                 end
    --             end
    --         end
    --         if playerFailed == true then
    --             core:sendMessageSafe(core:getAchievement() .. " " .. L["Shared_PlayersMissing"] .. " " .. C_Spell.GetSpellLink(425410) .. " " .. playerStr,false,true)
    --         end
    --     end)
    -- end

    if (core.type == "SPELL_AURA_REFRESH" or core.type == "SPELL_AURA_APPLIED") and core.spellId == 425410 then
        if InfoFrame_GetPlayerComplete(core.destName) == false then
            polymorphBombCounter = polymorphBombCounter + 1
            InfoFrame_SetPlayerComplete(core.destName)
        end
    elseif core.type == "SPELL_AURA_REMOVED" and core.spellId == 425410 then
        if InfoFrame_GetPlayerFailed(core.destName) == false then
            polymorphBombCounter = polymorphBombCounter - 1
            InfoFrame_SetPlayerFailed(core.destName)
        end
    end

    --https://www.wowhead.com/spell=425036/looking-for-allies??

    if core:getBlizzardTrackingStatus(19193, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2549:Nymue()
    --Defeat Nymue, Weaver of the Cycle after successfully collecting 5 Dream Projections while asleep and defeating the Manifested Monarch in Amirdrassil, the Dream's Hope on Normal Difficulty or Higher.

    --Track debuff when the 5 players sleep?
    --SPELL_AURA_REMOVED,Player-1171-0AB15BFE,"Vallashä-WyrmrestAccord",0x514,0x0,Player-1171-0AB15BFE,"Vallashä-WyrmrestAccord",0x514,0x0,429721,"Dreaming",0x1,BUFF
    --SPELL_AURA_APPLIED,Player-3676-0E0171A2,"Chrusvoker-Area52",0x514,0x1,Player-3676-0E0171A2,"Chrusvoker-Area52",0x514,0x1,429721,"Dreaming",0x1,BUFF

    --SPELL_CAST_SUCCESS,Player-3676-0E45093F,"Spiritlinker-Area52",0x514,0x0,Creature-0-3020-2549-12391-213127-0001D82D74,"Dream Projection",0xa18,0x0,427352,"Dream Attunement",0x8,Player-3676-0E45093F,0000000000000000,426023,577540,1135,12077,2431,0,0,241959,262500,0,4428.45,12268.62,2240,3.3395,445
    --SPELL_AURA_APPLIED,Creature-0-3020-2549-12391-213127-0001D82D74,"Dream Projection",0xa18,0x0,Player-3676-0E45093F,"Spiritlinker-Area52",0x514,0x0,427358,"Projected Dream",0x8,DEBUFF

    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 427358 and core.sourceID == "213127" then
        if dreamProjectionUID[core.spawn_uid] == nil then
            projectedDreamCounter = projectedDreamCounter + 1
            dreamProjectionUID[core.spawn_uid] = core.spawn_uid
            core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(427358) .. " " .. L["Core_Counter"] .. " (" .. projectedDreamCounter .. "/5)",true)
        end
    end

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
    --SPELL_AURA_APPLIED,Player-3676-0DA97324,"Yarini-Area52",0x511,0x40,Creature-0-3020-2549-12391-212432-0001D818D4,"Rune of the Firelord",0xa18,0x0,426342,"Douse!",0x1,BUFF
    --SPELL_AURA_REMOVED,Player-3676-0DA97324,"Yarini-Area52",0x511,0x40,Creature-0-3020-2549-12391-212432-0001D818D4,"Rune of the Firelord",0xa18,0x0,426342,"Douse!",0x1,BUFF

    --SPELL_DAMAGE,Creature-0-3020-2549-12391-200927-00005818D4,"Smolderon",0x10a48,0x0,Player-3676-0E019383,"Selbink-Area52",0x514,0x4,426484,"Overloaded Rune",0x4,Player-3676-0E019383,0000000000000000,336266,647340,3,13528,2583,0,0,243205,250000,0,4079.63,13133.19,2233,2.4292,457,100582,208721,-1,4,0,0,76582,nil,nil,nil

    --We will track each time a player get damage from Overloaded Rune and use the highest hit count from any player as number of runes doused

    if core.type == "SPELL_DAMAGE" and core.sourceID == "200927" and core.spellId == 426484 then
        if overloadedRunePlayersUID[core.spawn_uid_dest_Player] == nil then
            overloadedRunePlayersUID[core.spawn_uid_dest_Player] = 1
        else
            overloadedRunePlayersUID[core.spawn_uid_dest_Player] = overloadedRunePlayersUID[core.spawn_uid_dest_Player] + 1
        end

        --Check if we need to announce a new rune being doused
        if overloadedRunePlayersUID[core.spawn_uid_dest_Player] > runesDoused then
            runesDoused = runesDoused + 1
            core:sendMessage(core:getAchievement() .. " " .. C_Spell.GetSpellLink(426342) .. " " .. L["Core_Counter"] .. " (" .. runesDoused .. "/6)",true)
        end
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
    if core.type == "UNIT_DIED" and core.currentDest == "Player" and core.destName ~= nil then
        local playerWhoDied = core.destName
        if string.find(playerWhoDied, "-") then
            local name, realm = strsplit("-", playerWhoDied)
            playerWhoDied = name

            if playersWithRescuedWhelps[name] ~= nil then
                --Player who had rescued whelp has died so fail achievement
                core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
            end
        end
    end

    --Tracking seems to do success and fail, so need to change this
    if core:getBlizzardTrackingStatus(19393) == true and rescuedWhelpCounter == 6 then
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

    --Not sure a UNIT_DIED event is ever fired
    if (core.type == "UNIT_DIED") and (core.destID == "214211" or core.destID == "214235" or core.destID == "214236" or core.destID == "214240" or core.destID == "214241" or core.destID == "214242") then
        core:getAchievementFailed()
    end

    --Check overkill on mob too in case
    if(core.overkill ~= nil and (core.destID == "214211" or core.destID == "214235" or core.destID == "214236" or core.destID == "214240" or core.destID == "214241" or core.destID == "214242")) then
        if(core.overkill > 0) then
            core:getAchievementFailed()
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
    core._2549.Events:UnregisterEvent("UNIT_AURA")
end

core._2549.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2549:InitialSetup()
    core._2549.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    core._2549.Events:RegisterEvent("UNIT_AURA")
end

function core._2549.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss3"].enabled then
        local name, realm = UnitName(unitID)

        --Volcoross (Swoghorn)
        if spellID == 426753 then
            core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(426753),true)
        end
    end
end

function core._2549.Events:UNIT_AURA(self, unitID)
    --Tindral Sageswift Achievement
    if next(core.currentBosses) ~= nil then
        if core.currentBosses[1].encounterID == 2786 then
            local name, realm = UnitName(unitID)
            for i=1,40 do
                local auraData = C_UnitAuras.GetDebuffDataByIndex(unitID, i)
                if name ~= nil then
                    if auraData ~= nil and auraData.spellId == 428781 and playersWithRescuedWhelps[name] == nil then
                        --Rescued Whelp
                        playersWithRescuedWhelps[name] = true
                        rescuedWhelpCounter = rescuedWhelpCounter + 1
                        core:sendMessage(name .. " " .. L["Shared_HasGained"] .. " " .. C_Spell.GetSpellLink(428781) .. " " .. L["Core_Counter"] .. " (" .. rescuedWhelpCounter .. "/6)",true)
                    end
                end
            end
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
    singedCounter = 70

    ------------------------------------------------------
    ---- Nymue
    ------------------------------------------------------
    manifestedMonarchSpawned = false
    projectedDreamCounter = 0
    dreamProjectionUID = {}

    ------------------------------------------------------
    ---- Smolderon
    ------------------------------------------------------
    runesDoused = 0
    overloadedRunePlayersUID = {}

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

    ------------------------------------------------------
    ---- Council of Dreams
    ------------------------------------------------------
    trackPolymorphBomb = false
    polymorphBombCounter = 0

    ------------------------------------------------------
    ---- Tindral Sageswift
    ------------------------------------------------------
    playersWithRescuedWhelps = {}
    rescuedWhelpCounter = 0
end