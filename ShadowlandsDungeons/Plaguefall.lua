--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Plaguefall
------------------------------------------------------
core._2289 = {}

------------------------------------------------------
---- Globgrog
------------------------------------------------------
local AppetizerCompleted = false
local EntreeCompleted = false
local DessertCompleted = false
local MealsCompleted = 0

------------------------------------------------------
---- Riding With My Slimes
------------------------------------------------------
local playersCompletedAchievement = 0
local timerStarted = false
local initialSetup = false

------------------------------------------------------
---- Doctor Ickus
------------------------------------------------------
local volatilePlagueBombsKilled = 0

function core._2289:Globgrog()
    --Defeat Globgrog after feeding him a three course meal in Plaguefall on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14347, 1) == true and AppetizerCompleted == false then
        core:sendMessage(GetAchievementCriteriaInfo(14347,1) .. " " .. L["Shared_Completed"] .. " (" .. MealsCompleted .. "/3)",true)
        AppetizerCompleted = true
        MealsCompleted = MealsCompleted + 1
    end
    if core:getBlizzardTrackingStatus(14347, 2) == true and EntreeCompleted == false then
        core:sendMessage(GetAchievementCriteriaInfo(14347,2) .. " " .. L["Shared_Completed"] .. " (" .. MealsCompleted .. "/3)",true)
        EntreeCompleted = true
        MealsCompleted = MealsCompleted + 1
    end
    if core:getBlizzardTrackingStatus(14347, 3) == true and DessertCompleted == false then
        core:sendMessage(GetAchievementCriteriaInfo(14347,3) .. " " .. L["Shared_Completed"] .. " (" .. MealsCompleted .. "/3)",true)
        DessertCompleted = true
        MealsCompleted = MealsCompleted + 1
    end

    if core:getBlizzardTrackingStatus(14347, 1) == true and core:getBlizzardTrackingStatus(14347, 2) == true and core:getBlizzardTrackingStatus(14347, 3) == true then
        core:getAchievementSuccess()
    end
end

function core._2289:DoctorIckus()
    --Defeat Doctor Ickus after destroying 2 Volatile Plague Bombs in Plaguefall on Mythic difficulty.
    if core.type == "UNIT_DIED" and core.destID == "170851" then
        volatilePlagueBombsKilled = volatilePlagueBombsKilled + 1
        core:sendMessage(core:getAchievement() .. " " .. getNPCName(170851) .. " " .. L["Core_Counter"] .. " (" .. volatilePlagueBombsKilled .. "/2)",true)
    end

    if core:getBlizzardTrackingStatus(14296, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2289:InstanceCleanup()
    playersCompletedAchievement = 0
end

function core._2289:InstanceCleanup()
    initialSetup = false
    playersCompletedAchievement = 0
    timerStarted = false
    core.IATInfoFrame:ToggleOff()
end

function core._2289:InitialSetup()
    --Defeat all bosses while affected by Plaguefallen within a single visit in Plaguefall on Mythic difficulty.
    C_Timer.After(5, function()
        table.insert(core.currentBosses, core.Instances[core.expansion][core.instanceType][core.instance]["boss1"])
        table.insert(core.achievementIDs, core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].achievement)
        core.IATInfoFrame:ToggleOn()
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)
        core.IATInfoFrame:SetHeading(GetAchievementLink(14292))
        initialSetup = true
        core._2289:TrackAdditional()
    end)
end

function core._2289:TrackAdditional()
    --Defeat all bosses while affected by Plaguefallen within a single visit in Plaguefall on Mythic difficulty.
    InfoFrame_RefreshPlayersOnInfoFrameWithAdditionalInfoPersonal()
    InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players)

    --Concentrated Plague (Applied)
    if core.type == "SPELL_AURA_APPLIED_DOSE" and core.spellId == 330069 and UnitIsPlayer(core.destName) and core:hasDebuff(core.destName, 330092) == false then
        InfoFrame_SetPlayerNeutralWithMessage(core.destName, core.amount)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
    elseif core.type == "SPELL_AURA_APPLIED" and core.spellId == 330069 and UnitIsPlayer(core.destName) and core:hasDebuff(core.destName, 330092) == false then
        InfoFrame_SetPlayerNeutralWithMessage(core.destName, 1)
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
    end

    --Concentrated Plague (Removed)
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 330069 and UnitIsPlayer(core.destName) and core:hasDebuff(core.destName, 330092) == false then
        InfoFrame_SetPlayerFailedWithMessage(core.destName, "")
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
    end

    --Plagufallen (Applied)
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 330092 and UnitIsPlayer(core.destName) then
        if InfoFrame_GetPlayerStatusWithMessage(core.destName) ~= 2 then
            playersCompletedAchievement = playersCompletedAchievement + 1
        end
        InfoFrame_SetPlayerCompleteWithMessage(core.destName, "")
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players)
    end

    --Plagufallen (Removed)
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 330092 and UnitIsPlayer(core.destName) then
        if InfoFrame_GetPlayerStatusWithMessage(core.destName) ~= 3 then
            playersCompletedAchievement = playersCompletedAchievement - 1
        end
        InfoFrame_SetPlayerFailedWithMessage(core.destName, "")
        InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
        InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players)
    end

    if timerStarted == false and playersCompletedAchievement > 0 then
        timerStarted = true
        C_Timer.After(1, function()
            for k,player in ipairs(core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].players) do
                if InfoFrame_GetPlayerStatusWithMessage(player) == 2 then
                    for i=1,40 do
                        local _, _, _, _, _, expirationTime, _, _, _, spellId = UnitDebuff(player, i)
                        if spellId == 330092 then
                            core.InfoFrame_PlayersTable[player] = {2, math.floor(expirationTime - GetTime())}
                            InfoFrame_UpdatePlayersOnInfoFrameWithAdditionalInfoPersonal()
                        end
                    end
                end
            end
            timerStarted = false
            core._2289:TrackAdditional()
        end)
    end
end

function core._2289:ClearVariables()
	------------------------------------------------------
    ---- Globgrog
    ------------------------------------------------------
    AppetizerCompleted = false
    EntreeCompleted = false
    DessertCompleted = false
    MealsCompleted = 0

    ------------------------------------------------------
    ---- Doctor Ickus
    ------------------------------------------------------
    volatilePlagueBombsKilled = 0
end