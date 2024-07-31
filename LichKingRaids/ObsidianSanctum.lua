--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Obsidian Sanctum Bosses
------------------------------------------------------
core._615 = {}
core._615.Events = CreateFrame("Frame")

------------------------------------------------------
---- Gonna Go When The Volcano Blows
------------------------------------------------------
local playersWhoHaveNotFailed = nil
local initialSetup = false

function core._615:GonnaGoWhenTheVolcanoBlows()
    --Defeat Sartharion the Onyx Guardian without getting hit by Lava Strike.

    if playersWhoHaveNotFailed == nil then
        playersWhoHaveNotFailed = #core.currentBosses[1].players,#core.currentBosses[1]
    end

    InfoFrame_UpdatePlayersOnInfoFramePersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersWhoHaveNotFailed,#core.currentBosses[1].players)

    if initialSetup == false then
        --Set every player to complete on pulling the boss
        print("HERE")
        initialSetup = true
        for player,status in pairs(core.InfoFrame_PlayersTable) do
            InfoFrame_SetPlayerComplete(player)
		end
    end

    if core.destName ~= nil then
        local name, realm = UnitName(core.destName)
        if core:has_value(core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].players, name) == true then
            if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED" or core.type == "SPELL_ABSORBED") and core.spellId == 57591 then
                if core.destName ~= nil then
                    if UnitIsPlayer(core.destName) then
                        if InfoFrame_GetPlayerFailed(core.destName) == false then
                            InfoFrame_SetPlayerFailed(core.destName)
                            if core.gameVersionMajor > 4 then
                                core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], C_Spell.GetSpellLink(57591))),true)
                            else
                                core:sendMessage(format(L["Shared_FailedPersonalAchievement"], core.destName, GetAchievementLink(core.achievementIDs[1]), format(L["Shared_DamageFromAbility"], GetSpellLink(57591))),true)
                            end
                            playersWhoHaveNotFailed = playersWhoHaveNotFailed - 1
                        end
                    end
                end
            end
        end
    end
end

function core._615:ClearVariables()
    ------------------------------------------------------
    ---- Gonna Go When The Volcano Blows
    ------------------------------------------------------
    playersWhoHaveNotFailed = nil
    initialSetup = false
end