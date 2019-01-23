--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle of Dazar'alor Bosses
------------------------------------------------------
core._2070 = {}
core._2070.Events = CreateFrame("Frame")

------------------------------------------------------
---- Grong  
------------------------------------------------------
local barrelCounter = 0

------------------------------------------------------
---- Opulence  
------------------------------------------------------
local playersCompletedAchievement = 0

function core._2070:Grong()
    --Defeat Grong in the Battle of Dazar'alor after destroying 6 Barrels on Normal Difficulty or higher.

    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 289050 then
        barrelCounter = barrelCounter + 1
        core:sendMessage(core:getAchievement() .. L["BattleOfDazzarlor_BarrelsDestroyed"] .. " (" .. barrelCounter .. "/6)")
    end

    if barrelCounter == 6 then
        core:getAchievementSuccess()
    end
end

function core._2070:KingRastakhan()
    --Defeat King Rastakhan with the Phantom of Retribution, Phantom of Rage and Phantom of Slaughter still alive on Normal difficulty or higher.

    --Phantom of Retribution
    if (core.type == "UNIT_DIED" and core.destID == "146491") or (core.overkill > 0 and core.destID == "146491") then
        core:getAchievementFailed()
    end

    --Phantom of Rage
    if (core.type == "UNIT_DIED" and core.destID == "146492") or (core.overkill > 0 and core.destID == "146492") then
        core:getAchievementFailed()
    end

    --Phantom of Slaughter
    if (core.type == "UNIT_DIED" and core.destID == "146493") or (core.overkill > 0 and core.destID == "146493") then
        core:getAchievementFailed()
    end
end

function core._2070:ConclaveOfTheChosen()
    --Defeat the Conclave of the Chosen in the Battle of Dazar'alor without killing all the initial raptors summoned by Gonk's Wrath on Normal difficulty or higher.
    if core:getBlizzardTrackingStatus(13325) == false then
        core:getAchievementFailed()
    end
end

function core._2070:HighTinkerMekkatorque()
    --Defeat High Tinker Mekkatorque in the Battle of Dazar'alor after defeating the Blingtron MK2 on Normal Difficulty or higher.
    if core:getBlizzardTrackingStatus(13401, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2070:StormwallBlockade()
    --Fish up the De Lurker Be'loa, then defeat the Stormwall Blockade on Normal Difficulty or higher.
    if core:getBlizzardTrackingStatus(13430) == true then
        core:getAchievementSuccess()
    end
end

function core._2070:Opulence()
    --Defeat the Opulence in Battle of Dazar'alor after /praising a Singing Sunflower while under the effects of Brilliant Aura on Normal Difficulty or higher.
    InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,core.currentBosses[1].players)
end

function core._2070:JainaProudmoore()
    --Build a Frosty Snowmon then destroy it before defeating Jaina Proudmoore in the Battle of Dazar'alor on Normal Difficulty or higher.
    if core:getBlizzardTrackingStatus(13410, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2070:ClearVariables()
    ------------------------------------------------------
    ---- Grong  
    ------------------------------------------------------
    barrelCounter = 0

    ------------------------------------------------------
    ---- Opulence  
    ------------------------------------------------------
    playersCompletedAchievement = 0
end

function core._2070:InstanceCleanup()
    core._2070.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
end

core._2070.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2070:InitialSetup()
    core._2070.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
end

function core._2070.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss4"].enabled == true then
        --Lets get the target they praised
        if UnitIsPlayer(sender) then
            if sender == UnitName("Player") then
                if string.match(message, L["BattleOfDazzarlor_PraiseSelf"]) then
                    if string.match(message, getNPCName(51090)) then
                        --They have praised the correct npc. Check if they have the correct buff
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitAura(sender, i)
                            if spellId == 284802 then
                                --Check if the player actually needs the achievement since it is personal
                                
                                InfoFrame_SetPlayerComplete(sender)
                                playersCompletedAchievement = playersCompletedAchievement + 1
                                core:getAchievementSuccessPersonalWithName(1, sender)	
                            end
                        end
                    end
                end
            else
                if string.match(message, L["BattleOfDazzarlor_PraiseOther"]) then
                    if string.match(message, getNPCName(51090)) then
                        --They have praised the correct npc. Check if they have the correct buff
                        for i=1,40 do
                            local _, _, _, _, _, _, _, _, _, spellId = UnitAura(sender, i)
                            if spellId == 284802 then
                                --Check if the player actually needs the achievement since it is personal
                                
                                InfoFrame_SetPlayerComplete(sender)
                                playersCompletedAchievement = playersCompletedAchievement + 1
                                core:getAchievementSuccessPersonalWithName(1, sender)	
                            end
                        end
                    end
                end 
            end
        end
    end
end