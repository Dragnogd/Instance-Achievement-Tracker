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
local playersWithFavour = {}
local aspectCounter = 0

------------------------------------------------------
---- Grong  
------------------------------------------------------
local barrelCounter = 0

------------------------------------------------------
---- Opulence  
------------------------------------------------------
local playersCompletedAchievement = 0

------------------------------------------------------
---- Jaina
------------------------------------------------------
local snowCounter = 0
local snowComplete = false

function core._2070:ChampionOfTheLight()
    --Defeat the Champion of the Light in the Battle of Dazar'alor after stealing 3 shinies from each of the Crusaders, Disciples and Champion of the Light on Normal Difficulty or higher.

    --Everyone must have the Jani's Favor debuff
    --3 Shinies From Crusaders
    --3 Shinies From Disciples
    --3 Shinies From Champion of the Light
    --Shinies have to be deposited at the trashpile
    --All players must pick up debuff before pull
    --Boss must not be killed while people are raptors

    --Player has gained Aspect of Jani debuff. They need to loose the debuff within 30 seconds with the tribute for counter to increment
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 288610 then --288610
        if core.destName ~= nil then
            core:sendDebugMessage("Found the following player with the Aspect of Jani Debuff: " .. core.destName)
            --Check if player is already in the table
            if playersWithFavour[core.destName] == nil then
                --Player was not found. Add new entry
                --{Timer,npcName}
                local playerAspect = core.destName
                aspectTimer = C_Timer.NewTimer(29, function() 
                    core:sendDebugMessage(playerAspect)
                    playersWithFavour[playerAspect] = nil
                    aspectCounter = aspectCounter - 1
                    core:sendDebugMessage("Aspect Counter: " .. aspectCounter)
                    core:sendDebugMessage("Stopped timer as player did not return shiny in time: " .. playerAspect)
                end)
                playersWithFavour[core.destName] = {aspectTimer, nil}
                aspectCounter = aspectCounter + 1
                core:sendDebugMessage("Aspect Counter: " .. aspectCounter)
                core:sendDebugMessage("Inserted new entry into playersWithFavour for and started timer: " .. core.destName)
            else
                --Player removed debuff before it had expired (in case this is possible)
                core:sendDebugMessage("Error unexpected entry was found for: " .. core.destName)
            end
        end
    end

    --Player has stolen a shiny
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 288630 then --288630
        if core.destName ~= nil then
            core:sendDebugMessage("The following player has stolen a shiny: " .. core.sourceName)
            --Get mob which had stolen shiny from
            if core.destID == "145903" or core.destID == "147896" or core.destID == "145898" or core.destID == "147895" or core.destID == "144680" or core.destID == "144683" then
                -- core.destID = "145903"
                if playersWithFavour[core.sourceName] ~= nil then
                    --Assigned shiny picked up to player
                    if playersWithFavour[core.sourceName][1] ~= nil then
                        --Player still has time left on counter so assigned shiny to that player
                        playersWithFavour[core.sourceName][2] = core.destID
                        core:sendDebugMessage("The NPC the shiny was stolen from was: " .. playersWithFavour[core.sourceName][2])
                    end
                end
            end
        end            
    end

    --Player has lost aspect
    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 288610 then --288610
        if core.destName ~= nil then
            core:sendDebugMessage("The following player has lost Aspect of Jani: " .. core.destName)
            if playersWithFavour[core.destName] ~= nil then
                --Check if the timer has not finished
                core:sendDebugMessage("Found the following player in the table: " .. core.destName)
                if playersWithFavour[core.destName][1] ~= nil then
                    --Check if player had a shiny
                    if playersWithFavour[core.destName][2] ~= nil then
                        --Lets stop the timer since we now know player has met the requirements so far, unless player had died
                        core:sendDebugMessage("Cancelling Aspect of Jani timer for: " .. core.destName)
                        playersWithFavour[core.destName][1]:Cancel()

                        --Now wait 1 second to make sure player has not died as this does not count
                        local playerName = core.destName
                        C_Timer.After(1, function() 
                            if UnitIsDeadOrGhost(playerName) ~= true then
                                if core.inCombat == true then
                                    --Player is still alive so lets increment the counter
                                    core:sendDebugMessage("The following player was alive so we can increment counter: " .. playerName)
                                    if playersWithFavour[playerName][2] == "145903" or playersWithFavour[playerName][2] == "147896" then
                                        core:sendDebugMessage("Crusader found")                                
                                        crusadersCounter = crusadersCounter + 1
                                        core:sendMessage(core:getAchievement() .. " " .. playerName .. " " .. L["Shared_HasStolenFrom"] .. " " .. getNPCName(tonumber(playersWithFavour[playerName][2])) .. " " .. L["Core_Counter"] .. "(" .. crusadersCounter .. "/3)") 
                                    elseif playersWithFavour[playerName][2] == "147895" or playersWithFavour[playerName][2] == "145898" then
                                        core:sendDebugMessage("Disciple Found")
                                        disciplesCounter = disciplesCounter + 1
                                        core:sendMessage(core:getAchievement() .. " " .. playerName .. " " .. L["Shared_HasStolenFrom"] .. " " .. getNPCName(tonumber(playersWithFavour[playerName][2])) .. " " .. L["Core_Counter"] .. "(" .. disciplesCounter .. "/3)") 
                                    elseif playersWithFavour[playerName][2] == "144683" or playersWithFavour[playerName][2] == "144680" then
                                        core:sendDebugMessage("Champion found")
                                        championOfTheLightCounter = championOfTheLightCounter + 1
                                        core:sendMessage(core:getAchievement() .. " " .. playerName .. " " .. L["Shared_HasStolenFrom"] .. " " .. getNPCName(tonumber(playersWithFavour[playerName][2])) .. " " .. L["Core_Counter"] .. "(" .. championOfTheLightCounter .. "/3)") 
                                    end
                                end
                            else
                                core:sendDebugMessage("The following player has died but had the shiny debuff so do not count: " .. playerName)
                            end

                            --Cleanup variables
                            playersWithFavour[playerName][1] = nil
                            playersWithFavour[playerName][2] = nil
                            playersWithFavour[playerName] = nil
                            aspectCounter = aspectCounter - 1
                            core:sendDebugMessage("Aspect Counter: " .. aspectCounter)
                        end)
                    end                    
                end
            end
        end
    end

    if crusadersCounter >= 3 and disciplesCounter >=3 and championOfTheLightCounter >= 3 and aspectCounter <= 0 then
        --Only announce success once we have enough mobs and no one is currently a raptor. Set achievement failed back to false
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
    end

    --If achievement was completed but aspect counter has increased again then achievement has failed till raptors despawn
    if core.achievementsCompleted[1] == true and aspectCounter > 0 then
        core:getAchievementFailedWithMessageAfter(L["BattleOfDazzarlor_PlayersTransformed"])
        core.achievementsCompleted[1] = false
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
	if core:has_value(core.currentBosses[1].players, L["GUI_NoPlayersNeedAchievement"]) == false then
		InfoFrame_UpdatePlayersOnInfoFramePersonal()
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,#core.currentBosses[1].players)
		InfoFrame_GetRangeCheck(25)
	else
		InfoFrame_SetHeaderCounter(L["Shared_PlayersWhoNeedAchievement"],playersCompletedAchievement,0)
		core.IATInfoFrame:SetText1(L["GUI_NoPlayersNeedAchievement"])
	end

	--Check for message in the sync queue
	for k,sender in ipairs(core.syncMessageQueue) do
		if sender ~= nil then
			core:sendDebugMessage("Found Message:" .. sender)
			--If someone is found then they have completed the achievement.
			if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
				InfoFrame_SetPlayerComplete(sender)
				playersCompletedAchievement = playersCompletedAchievement + 1
				core:getAchievementSuccessPersonalWithName(1, sender)
			end
			core.syncMessageQueue[k] = nil
		end
	end

	if #core.currentBosses[1].players == playersCompletedAchievement then
		core:getAchievementSuccess()
	end
end

function core._2070:JainaProudmoore()
    --Build a Frosty Snowmon then destroy it before defeating Jaina Proudmoore in the Battle of Dazar'alor on Normal Difficulty or higher.

    --Player has collected a snow mound. Output player to chat.
    if core.type == "SPELL_AURA_APPLIED" and (core.spellId == 289408 or core.spellId == 289405) then
        snowCounter = snowCounter + 1
        core:sendMessage(core:getAchievement() .. " " .. core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(289408) .. " (" .. snowCounter .. "/3)")

        if snowCounter == 3 then
            snowComplete = true
        end
    end

    --Player has lost snow mound. If counter does not equal 3 then fail achievement. Otherwise wait 3 seconds to see if counter reaches 0. If not also fail achievement
    --If counter did reach 0 in allocated time this means that snowman was built successfully
    if core.type == "SPELL_AURA_REMOVED" and (core.spellId == 289408 or core.spellId == 289405) then
        if snowCounter ~= 3 and snowComplete == false then
            --Since we lost one before even reaching 3 then this must be a fail
            core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
            snowCounter = snowCounter - 1
        else
            --We had met the requirements but a snow mound has been lost. Lets check if this was because achievement was success or players failed it
            snowCounter = snowCounter - 1
            C_Timer.After(3, function() 
                if snowCounter ~= 0 then
                    --This is a fail since snow counter would be 0 if achievement was a success
                    core:getAchievementFailed()
                end
            end)
        end
    end

    --Achievement Completed
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
    playersWithFavour = {}
    aspectCounter = 0

    ------------------------------------------------------
    ---- Grong  
    ------------------------------------------------------
    barrelCounter = 0

    ------------------------------------------------------
    ---- Opulence  
    ------------------------------------------------------
    playersCompletedAchievement = 0

    ------------------------------------------------------
    ---- Jaina
    ------------------------------------------------------
    snowCounter = 0
    snowComplete = false
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
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
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
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									InfoFrame_SetPlayerComplete(sender)
									playersCompletedAchievement = playersCompletedAchievement + 1
									core:getAchievementSuccessPersonalWithName(1, sender)

									--Send message to other addon users
									C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. sender, "RAID")
								end
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
								if core.playersSuccessPersonal[sender] == nil and core:has_value(core.currentBosses[1].players, sender) then
									InfoFrame_SetPlayerComplete(sender)
									playersCompletedAchievement = playersCompletedAchievement + 1
									core:getAchievementSuccessPersonalWithName(1, sender)
									
									--Send message to other addon users
									C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. sender, "RAID")
								end
                            end
                        end
                    end
                end 
            end
        end
    end
end