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
---- Champion of the Light
------------------------------------------------------
local crusadersCounter = 0
local disciplesCounter = 0
local championOfTheLightCounter = 0

------------------------------------------------------
---- Grong  
------------------------------------------------------
local barrelCounter = 0

------------------------------------------------------
---- Opulence  
------------------------------------------------------
local playersCompletedAchievement = 0

function core._2070:ChampionOfTheLight()
    --Defeat the Champion of the Light in the Battle of Dazar'alor after stealing 3 shinies from each of the Crusaders, Disciples and Champion of the Light on Normal Difficulty or higher.

    --Everyone must have the Jani's Favor debuff
    --3 Shinies From Crusaders
    --6 Shinies From Disciples
    --3 Shinies From Champion of the Light

    --Player has picked up shiny. Check if this is shiny we need
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 288626 then
        --Get the players target and check which mob they stole the shiny from is one we want
        local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(core.destName .. "-target"))
        
        if destID == "145903" then
            --Darkforged Crusader
            crusadersCounter = crusadersCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(145903) .. " " .. L["Core_Counter"] .. "(" .. crusadersCounter .. "/3)")
        elseif destID == "145898" then
            --Anointed Disciple
            disciplesCounter = disciplesCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(145898) .. " " .. L["Core_Counter"] .. "(" .. disciplesCounter .. "/6)")
        elseif destID == "144680" then
            --Frida Ironbellows
            championOfTheLightCounter = championOfTheLightCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(144680) .. " " .. L["Core_Counter"] .. "(" .. championOfTheLightCounter .. "/3)")
        elseif destID == "147895" then
            --Rezani Disciple
            disciplesCounter = disciplesCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(147895) .. " " .. L["Core_Counter"] .. "(" .. disciplesCounter .. "/6)")
        elseif destID == "147896" then
            --Zandalari Crusader
            crusadersCounter = crusadersCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(147896) .. " " .. L["Core_Counter"] .. "(" .. crusadersCounter .. "/3)")
        elseif destID == "144683" then
            --Ra'wani Kanae
            championOfTheLightCounter = championOfTheLightCounter + 1
            core:sendMessage(core:getAchievement() .. " " .. getNPCName(144683) .. " " .. L["Core_Counter"] .. "(" .. championOfTheLightCounter .. "/3)")
        end
    end

    if crusadersCounter >= 3 and disciplesCounter >=6 and championOfTheLightCounter >= 3 then
        core:getAchievementSuccess()
    end
end

function core._2070:JadefireMasters()
    --Hatch the cloud serpent egg during the Jadefire Masters encounter in the Battle of Dazar'alor on Normal difficulty or higher.
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 289547 then
        core:getAchievementFailed()
    end
end

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
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)
end

function core._2070:JainaProudmoore()
    --Build a Frosty Snowmon then destroy it before defeating Jaina Proudmoore in the Battle of Dazar'alor on Normal Difficulty or higher.
    if core:getBlizzardTrackingStatus(13410, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2070:ClearVariables()
    ------------------------------------------------------
    ---- Champion of the Light
    ------------------------------------------------------
    crusadersCounter = 0
    disciplesCounter = 0
    championOfTheLightCounter = 0

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