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
local playersAspect1 = nil
local playersAspect2 = nil
local playersAspect3 = nil
local playersAspect1Tribute = false
local playersAspect2Tribute = false
local playersAspect3Tribute = false
local playersAspect1Timer = nil
local playersAspect2Timer = nil
local playersAspect3Timer = nil

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
    --Shinies have to be deposited at the trashpile
    
    --Player has gained Aspect of Jani debuff. They need to loose the debuff within 30 seconds with the tribute for counter to increment
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 288610 then
        --Set the player status to false since they don't have tribute yet
        core:sendDebugMessage("Aspect of Jani Found")
        if core.destName ~= nil then
            core:sendDebugMessage(core.destName)
        end
        if playersAspect1 == nil then
            core:sendDebugMessage("Setting to player 1")
            playersAspect1 = core.destName
            playersAspect1Timer = C_Timer.NewTimer(30, function() 
                playersAspect1Timer = nil
                playersAspect1 = nil
                playersAspect1Tribute = nil
            end)
        elseif playersAspect2 == nil then
            core:sendDebugMessage("Setting to player 2")
            playersAspect2 = core.destName
            playersAspect2Timer = C_Timer.NewTimer(30, function() 
                playersAspect2Timer = nil
                playersAspect2 = nil
                playersAspect2Tribute = nil
            end)
        elseif playersAspect3 == nil then
            core:sendDebugMessage("Setting to player 3")
            playersAspect3 = core.destName
            playersAspect3Timer = C_Timer.NewTimer(30, function() 
                playersAspect3Timer = nil
                playersAspect3 = nil
                playersAspect3Tribute = nil
            end)
        end
    end

    --Player has stolen a shiny
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 288630 then
        core:sendDebugMessage("Stolen Shiny")
        if core.destName ~= nil then
            core:sendDebugMessage(core.destName)
            core:sendDebugMessage(core.destID)
        end
        --Get mob which had stolen shiny from
        if core.destID == "145903" or core.destID == "147896" or core.destID == "145898" or core.destID == "147895" or core.destID == "144680" or core.destID == "144683" then
             --Set the stolen shiny to the player
            if core.sourceName == playersAspect1 then
                core:sendDebugMessage("Found player 1")
                playersAspect1Tribute = core.destID
            elseif core.sourceName == playersAspect2 then
                core:sendDebugMessage("Found player 2")
                playersAspect2Tribute = core.destID
            elseif core.sourceName == playersAspect3 then
                core:sendDebugMessage("Found player 3")
                playersAspect3Tribute = core.destID
            end
        end
    end

    --Player has lost aspect
    --Check if this was because they handed it in or ran out of time
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 288610 then
        core:sendDebugMessage("Aspect Lost")
        if core.destName ~= nil then
            core:sendDebugMessage(core.destName)
        end
        --If player found then they handed shiny in on time
        local playerFound = false
        local shinyID = nil
        if core.destName == playersAspect1 then
            core:sendDebugMessage("Player 1 Found")
            --Stop timer and increment counter
            if playersAspect1Timer ~= nil then
                playersAspect1Timer:Cancel()
            end
            shinyID = playersAspect1Tribute
            playersAspect1 = nil
            playersAspect1Tribute = nil
            playerFound = true    
        elseif core.destName == playersAspect2 then
            core:sendDebugMessage("Player 2 found")
            --Stop timer and increment counter
            if playersAspect2Timer ~= nil then
                playersAspect2Timer:Cancel()
            end
            shinyID = playersAspect2Tribute
            playersAspect2 = nil
            playersAspect2Tribute = nil
            playerFound = true
        elseif core.destName == playersAspect3 then
            core:sendDebugMessage("Player 3 found")
            --Stop timer and increment counter
            if playersAspect3Timer ~= nil then
                playersAspect3Timer:Cancel()
            end
            shinyID = playersAspect3Tribute
            playersAspect3 = nil
            playersAspect3Tribute = nil
            playerFound = true  
        end

        if playerFound == true then   
            core:sendDebugMessage("Found Player")
            if shinyID == "145903" or shinyID == "147896" then
                core:sendDebugMessage("Crusader found")
                crusadersCounter = crusadersCounter + 1
                core:sendMessage(core:getAchievement() .. " " .. getNPCName(shinyID) .. " " .. L["Core_Counter"] .. "(" .. crusadersCounter .. "/3)") 
            elseif shinyID == "147895" or shinyID == "145898" then
                core:sendDebugMessage("Disciple Found")
                disciplesCounter = disciplesCounter + 1
                core:sendMessage(core:getAchievement() .. " " .. getNPCName(shinyID) .. " " .. L["Core_Counter"] .. "(" .. disciplesCounter .. "/6)") 
            elseif shinyID == "144683" or shinyID == "144680" then
                core:sendDebugMessage("Champion found")
                championOfTheLightCounter = championOfTheLightCounter + 1
                core:sendMessage(core:getAchievement() .. " " .. getNPCName(shinyID) .. " " .. L["Core_Counter"] .. "(" .. championOfTheLightCounter .. "/3)") 
            end
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
        core:sendDebugMessage("Incrementing barrel counter")
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
        core:sendDebugMessage("Retribtuion died")
        core:getAchievementFailed()
    end

    --Phantom of Rage
    if (core.type == "UNIT_DIED" and core.destID == "146492") or (core.overkill > 0 and core.destID == "146492") then
        core:sendDebugMessage("Rage died")
        core:getAchievementFailed()
    end

    --Phantom of Slaughter
    if (core.type == "UNIT_DIED" and core.destID == "146493") or (core.overkill > 0 and core.destID == "146493") then
        core:sendDebugMessage("Slaughter died")
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
    playersAspect1 = nil
    playersAspect2 = nil
    playersAspect3 = nil
    playersAspect1Tribute = false
    playersAspect2Tribute = false
    playersAspect3Tribute = false
    playersAspect1Timer = nil
    playersAspect2Timer = nil
    playersAspect3Timer = nil

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
                                core:sendDebugMessage("Found player who hugged singing sunflower")
                                core:sendDebugMessage(sender)
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
                                core:sendDebugMessage("Found player who hugged singing sunflower")
                                core:sendDebugMessage(sender)
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