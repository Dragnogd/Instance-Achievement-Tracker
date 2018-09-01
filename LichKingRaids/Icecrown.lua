--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- _631 Citadel Bosses
------------------------------------------------------
core._631 = {}

------------------------------------------------------
---- Lady Deathwhisper
------------------------------------------------------
local CultFanaticFound = false
local CultAdherentFound = false
local DeformedFanaticFound = false
local ReanimatedFanaticFound = false
local ReanimatedAdherentFound = false
local CultFanaticWait = false --When the mobs get transformed, wait 1 second before checking if it's actually dead
local CultAdherentWait = false --When the mobs get transformed, wait 1 second before checking if it's actually dead
local AddCounter = 0

------------------------------------------------------
---- _631 Gunship Battle
------------------------------------------------------
local currentTimestamp = nil

------------------------------------------------------
---- Deathbringer Saurfang
------------------------------------------------------
local markOfTheFallenChampionCounter = 0

------------------------------------------------------
---- Valithria Dreamwalker
------------------------------------------------------
AchievementTracker_portalsSpawned = false
local portalsEntered = 0
local noteDisplayed = false
local noteTwoDisplay = false
local totalPortals = 0
local players = {}

------------------------------------------------------
---- Sindragosa
------------------------------------------------------
local mysticBuffetStack = 0 

------------------------------------------------------
---- Festergut
------------------------------------------------------
local InoculatedStack = 0

------------------------------------------------------
---- BloodQueenLanathel
------------------------------------------------------
local vampires = {}
local nonVampires = {}
local otherPlayers = {}
local playersCompleted = {}

------------------------------------------------------
---- Lich King
------------------------------------------------------
local necroticPlagueStack = 0
local necroticPlagueCompletedAnnounced = false   

function core._631:LordMarrowgar()					
	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 69065 then
        core:sendMessage(core.destName .. " has been Impaled")
        C_Timer.After(8, function()
            for i=1,40 do
                local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(core.destName, i)
                if spellId == 69065 then
                    core:getAchievementFailed()
                end
            end
        end)
    end
end

function core._631:LadyDeathwhisper()
    local CultFanatic = {"Cult Fanatic", "Fanático del Culto"}
    local CultAdherent = {"Cult Adherent", "Partidario del Culto"}
    local DeformedFanatic = {"Deformed Fanatic", "Fanático deformado"}
    local ReanimatedFanatic = {"Reanimated Fanatic", "Fanático reanimado"}
    local ReanimatedAdherent = {"Reanimated Adherent", "Partidario reanimado"} 
    local currentAddSource = nil
    local currentAddDest = nil
    local languages = 2

    for langCount = 1, languages do
        --When a mob has spawned
        if core.sourceName ~= nil then
            if string.find(core.sourceName, CultFanatic[langCount]) then
                currentAddSource = "Cult Fanatic"
            elseif string.find(core.sourceName, CultAdherent[langCount]) then
                currentAddSource = "Cult Adherent"
            elseif string.find(core.sourceName, DeformedFanatic[langCount]) then
                currentAddSource = "Deformed Fanatic"
            elseif string.find(core.sourceName, ReanimatedFanatic[langCount]) then
                currentAddSource = "Reanimated Fanatic"
            elseif string.find(core.sourceName, ReanimatedAdherent[langCount]) then
                currentAddSource = "Reanimated Adherent"
            end         
        end
        --When a mob has died
        if core.destName ~= nil then
            if string.find(core.destName, CultFanatic[langCount]) then
                currentAddDest = "Cult Fanatic"
            elseif string.find(core.destName, CultAdherent[langCount]) then
                currentAddDest = "Cult Adherent"
            elseif string.find(core.destName, DeformedFanatic[langCount]) then
                currentAddDest = "Deformed Fanatic"
            elseif string.find(core.destName, ReanimatedFanatic[langCount]) then
                currentAddDest = "Reanimated Fanatic"
            elseif string.find(core.destName, ReanimatedAdherent[langCount]) then
                currentAddDest = "Reanimated Adherent"
            end   
        end        
    end

    if core.type == "SPELL_DAMAGE" or core.type == "SPELL_CAST_SUCCESS" or core.type == "SWING_MISSED" or core.type == "SPELL_AURA_APPLIED" or core.type == "SWING_DAMAGE" or core.type == "SPELL_PERIODIC_HEAL" or core.type == "SPELL_CAST_START" then
        if currentAddSource == "Cult Fanatic" and CultFanaticFound == false then
            CultFanaticFound = true
            AddCounter = AddCounter + 1
            if CultFanaticWait == false then
                core:sendMessage("Cult Fanatic found (" .. AddCounter .. "/5)")
            end
        elseif currentAddSource == "Cult Adherent" and CultAdherentFound == false then
            CultAdherentFound = true
            AddCounter = AddCounter + 1
            if CultAdherentWait == false then
                core:sendMessage("Cult Adherent found (" .. AddCounter .. "/5)")
            end
        elseif currentAddSource == "Deformed Fanatic" and DeformedFanaticFound == false then
            DeformedFanaticFound = true
            AddCounter = AddCounter + 1
            core:sendMessage("Deformed Fanatic found (" .. AddCounter .. "/5)")
        elseif currentAddSource == "Reanimated Fanatic" and ReanimatedFanaticFound == false then
            ReanimatedFanaticFound = true
            AddCounter = AddCounter + 1
            core:sendMessage("Reanimated Fanatic found (" .. AddCounter .. "/5)")
        elseif currentAddSource == "Reanimated Adherent" and ReanimatedAdherentFound == false then
            ReanimatedAdherentFound = true
            AddCounter = AddCounter + 1
            core:sendMessage("Reanimated Adherent found (" .. AddCounter .. "/5)")
        end
    end

    --Check if the reanimated mobs were killed with overkill damage
    if core.type == "SPELL_DAMAGE" or core.type == "RANGE_DAMAGE" or core.type == "SWING_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" then
        if currentAddDest == "Reanimated Fanatic" or currentAddDest == "Reanimated Adherent" then
            if core.overkill ~= nil then
                if core.overkill > 0 then
                    if currentAddDest == "Reanimated Adherent" then
                        ReanimatedAdherentFound = false
                        AddCounter = AddCounter - 1
                        core:sendMessage("Reanimated Adherent has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    elseif currentAddDest == "Reanimated Fanatic" then
                        ReanimatedFanaticFound = false
                        AddCounter = AddCounter - 1
                        core:sendMessage("[WIP] Reanimated Fanatic has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    end
                end            
            end
        end
     end
    
    if core.type == "UNIT_DIED" then
        if currentAddDest == "Cult Fanatic" and CultFanaticFound == true then
            CultFanaticWait = true
            CultFanaticFound = false
            AddCounter = AddCounter - 1
            C_Timer.After(2, function()
                if CultFanaticFound == false then
                    core:sendMessage("Cult Fanatic has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    CultFanaticWait = false
                end
            end)
        elseif currentAddDest == "Cult Adherent" and CultAdherentFound == true then
            CultAdherentWait = true
            CultAdherentFound = false
            AddCounter = AddCounter - 1
            C_Timer.After(2, function()
                if CultAdherentFound == false then
                    core:sendMessage("Cult Adherent has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")
                    CultAdherentWait = false
                end
            end)
        elseif currentAddDest == "Deformed Fanatic" and DeformedFanaticFound == true then
            DeformedFanaticFound = false
            AddCounter = AddCounter - 1
            core:sendMessage("Deformed Fanatic has died. Looking for another add. DO NOT KILL BOSS (" .. AddCounter .. "/5)")						
        end
    end

    if AddCounter == 5 then
        core:getAchievementSuccess()
    end
end

function core._631:DeathbringerSaurfang()
    --Detect if mark of the fallen champion has been cast
    if core.type == "SPELL_CAST_START" and core.spellId == 72293 and markOfTheFallenChampionCounter ~= 5 then
            markOfTheFallenChampionCounter = markOfTheFallenChampionCounter + 1
    end	

    --if counter reaches 5 then the achievement has failed
    if markOfTheFallenChampionCounter == 5 then
        core:getAchievementFailed()
    end
end

-- function _631_ValithriaDreamwalker(portalsActive)
--     if portalsActive == false then
--         if noteDisplayed == false then
--             SendChatMessage("[WIP] Note: Healing the boss before the portals spawn will also grant the achievement. Portals spawn 45 seconds after the boss is engaged",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             noteDisplayed = true

--             if AchievementTracker_playerCount == 25 then
--                 totalPortals = 8
--             elseif AchievementTracker_playerCount == 10 then
--                 totalPortals = 3
--             end
--         end
--     elseif core.achievementFailed == false then
--         if noteTwoDisplay == false then
--             SendChatMessage("[WIP] Portals have spawned. 35 seconds remaining to enter all portals",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)

--             C_Timer.After(35, function()
--                 AchievementTracker_portalsSpawned = false
--                 if AchievementTracker_playerCount == 25 then
--                     if portalsEntered ~= 8 then
--                         core:getAchievementFailedWrath(4619,4579)
--                         core.achievementFailed = true
--                     else
--                         portalsEntered = 0
--                         players = {}
--                         noteTwoDisplay = false
--                     end
--                 elseif AchievementTracker_playerCount == 10 then
--                     if portalsEntered ~= 3 then
--                         core:getAchievementFailedWrath(4619,4579)
--                         core.achievementFailed = true
--                     else
--                         portalsEntered = 0
--                         players = {}
--                         noteTwoDisplay = false  
--                     end              
--                 end
--             end)

--             noteTwoDisplay = true
--         end

--         --Check for any players who have entered portals
--         for i = 1, GetNumGroupMembers() do
--             local unit = nil
--             if core.chatType == "PARTY" then
--                 if i < GetNumGroupMembers() then
--                     unit = "party" .. i
--                 else
--                     unit = "player"
--             end
--             elseif core.chatType == "RAID" then
--                 unit = "raid" .. i
--             elseif core.chatType == "SAY" then
--                 unit = "player"
--             end
            
--             if unit ~= nil then
--                 --If the player running the addon goes into the dream then only look for debuff. Otherwise look for players not in the same phase
--                 if UnitDebuff("player", "Dream State") then
--                     --Player is in the phase so look for players who have debuff
--                     if UnitDebuff(unit, "Dream State") and players[UnitName(unit)] == nil then
--                         print("Here1")
--                         portalsEntered = portalsEntered + 1
--                         players[UnitName(unit)] = UnitName(unit)
--                         SendChatMessage("[WIP] " .. UnitName(unit) .. " entered portal (" .. portalsEntered .. "/" .. totalPortals .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)                     
--                     end
--                 else
--                     if UnitInPhase(unit) == false and players[UnitName(unit)] == nil then
--                         print("Here2")
--                         portalsEntered = portalsEntered + 1
--                         players[UnitName(unit)] = UnitName(unit)
--                         SendChatMessage("[WIP] " .. UnitName(unit) .. " entered portal (" .. portalsEntered .. "/" .. totalPortals .. ")",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)                    
--                     end                   
--                 end
--             end
--         end
--     end
-- end

function core._631:Sindragosa()
    if core.type == "SPELL_AURA_APPLIED_DOSE" or core.type == "SPELL_AURA_APPLIED" then
        if core.spellId == 70127 and core.unitType ~= "Pet" then
            if core.amount == nil then
                core.amount = 1
            end
            core:sendMessage(core.destName .. " has " .. core.amount .. " stacks of Mystic Buffet")          

            --Get the highest stack of Mystic Buffet and save to variable
            if core.amount > mysticBuffetStack and mysticBuffetStack < 6 then
                mysticBuffetStack = core.amount
            end  

            if mysticBuffetStack > 5 then
                core:getAchievementFailed()
                core.achievementFailed = true
            end
        end
    end
end

function core._631:Festergut()
    if core.type == "SPELL_AURA_APPLIED_DOSE" or core.type == "SPELL_AURA_APPLIED" then
        if core.spellId == 69291 and core.unitType ~= "Pet" then
            if core.amount == nil then
                core.amount = 1
            end  

            --Get the highest stack of Mystic Buffet and save to variable
            if core.amount > InoculatedStack and InoculatedStack < 3 then
                InoculatedStack = core.amount
                core:sendMessage(core.destName .. " has " .. core.amount .. " stacks of Inoculated")     
            end  

            if InoculatedStack > 2 then
                core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
            end
        end
    end
end

function core._631:Rotface()
    if core.type == "SPELL_CAST_START" and core.spellId == 69839 then
        core:getAchievementFailed()
    end
end

function core._631:ProfessorPutricide()
    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 70539 then
        core:getAchievementFailed()
    end
end

-- function core._631:BloodPrinceCouncil()
--     if core.amount ~= nil and UnitIsPlayer(core.destName) and UnitIsPlayer(core.sourceName) ~= true then
--         if core.amount > 23000 and core.type == "SPELL_DAMAGE" or core.type == "SPELL_PERIODIC_DAMAGE" or core.type == "SWING_DAMAGE" then
--             core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
--         end       
--     end
-- end

-- function _631_BloodQueenLanathel(displayPicker, vampireChecker,message,sender,type,spellId,destName)
--     ------------------------------------------------------
--     ---- Blood Prince Council
--     ------------------------------------------------------
--     if displayPicker == true then
-- 		if(AchievementTracker_playerCount == 25) then
-- 			SendChatMessage("[WIP] "  .. GetAchievementLink(4618) .. " Type 'vampire' or 'no vampire' if you would like Achievement Tracker to track your achievement",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
-- 			displayTracked = true
-- 		elseif AchievementTracker_playerCount == 10 then
-- 			SendChatMessage("[WIP] "  .. GetAchievementLink(4539) .. " Type 'vampire' or 'no vampire' if you would like Achievement Tracker to track your achievement",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
-- 			displayTracked = true
-- 		end

--         --Get all members of raid group and save into array
--         for i = 1, GetNumGroupMembers() do
--             local unit = nil
--             if core.chatType == "PARTY" then
--                 if i < GetNumGroupMembers() then
--                     unit = "party" .. i
--                 else
--                     unit = "player"
--             end
--             elseif core.chatType == "RAID" then
--                 unit = "raid" .. i
--             elseif core.chatType == "SAY" then
--                 unit = "player"
--             end

--             local name, realm = UnitName(unit)

--             if has_value(vampires, name) == false and has_value(nonVampires, name) == false and has_value(otherPlayers, name) == false then
--                 table.insert(otherPlayers, name)
--             end
--         end

--         --Print out any players that have no made a selection
--         local noSelectionList = "[WIP] Players who have not made a selection: "
--         local noSelectionListAdded = false

--         for i = 1,#otherPlayers do
--             noSelectionList = noSelectionList .. otherPlayers[i] .. ", "
--             noSelectionListAdded = true
--         end

--         if noSelectionListAdded then
-- 			SendChatMessage(noSelectionList,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)            
--         end

--     elseif vampireChecker == true then
--         if sender ~= nil and message == "vampire" or message == "Vampire" or message == "'vampire'" or message == "'Vampire'" or message == "no vampire" or message == "no Vampire" or message == "No vampire" or message == "No Vampire" or message == "'no vampire'" or message == "'no Vampire'" or message == "'No vampire'" or message == "'No Vampire'" then
--             local name, realm = strsplit("-", sender);
--             local userSelectedRole = false
--             if message == "vampire" or message == "Vampire" or message == "'vampire'" or message == "'Vampire'"  then 
--                 SendChatMessage("[WIP] Tracking " .. sender .. " for becoming a vampire",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
                
--                 if has_value(vampires, name) == false then
--                     --print("Adding player to vampire because has_value returned " .. tostring(has_value(vampires, name)))
-- 			        table.insert(vampires, name)
--                     userSelectedRole = true
--                 end

--                 if has_value(nonVampires, name) then
--                     --print("Removing Player From Non Vampires")                    
--                     for i = 1, #nonVampires do
--                         if nonVampires[i] == name then
--                             nonVampires[i] = nil
--                         end
--                     end
--                 end
--             elseif message == "no vampire" or message == "no Vampire" or message == "No vampire" or message == "No Vampire" or message == "'no vampire'" or message == "'no Vampire'" or message == "'No vampire'" or message == "'No Vampire'" then
--                 SendChatMessage("[WIP] Tracking " .. sender .. " for not becoming a vampire",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)

--                 if has_value(nonVampires, name) == false then
--                     --print("Adding player to non vampire because has_value returned " .. tostring(has_value(nonVampires, name)))
-- 			        table.insert(nonVampires, name)
--                     userSelectedRole = true
--                 end

--                 if has_value(vampires, name) then
--                     --print("Removing Player From Vampires")                    
--                     for i = 1, #vampires do
--                         if vampires[i] == name then
--                             vampires[i] = nil
--                         end
--                     end
--                 end
--             end

--             --Remove player from otherPlayers if they have selected a choice
--             if userSelectedRole then
--                 for i = 1, #otherPlayers do
--                     if name == otherPlayers[i] then
--                         --Found player so remove them from the array
--                         table.remove(otherPlayers, i)
--                     end
--                 end            
--             end


--             --SendChatMessage("---Vampires---",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             --print("---Vampires---")
--             -- for i = 1, #vampires do
--             --     --SendChatMessage(i .. ": " .. vampires[i],core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             --     --print(i .. ": " .. vampires[i])
--             -- end

--             -- --SendChatMessage("---Non Vampires---",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             -- --print("---Non Vampires---")
--             -- for i = 1, #nonVampires do
--             --     --SendChatMessage(i .. ": " .. nonVampires[i],core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             --     --print(i .. ": " .. nonVampires[i])
--             -- end            
--         end       
--     else
--         core:getAchievementsToTrackWrath(4618,4539)

--         --Display players who want to become a vampire, who don't want to be a vampire and people who did not make a selection
--         if noteDisplayed == false then
--             local vampiresList = "[WIP] Players who want to become a vampire: "
--             local nonVampiresList = "[WIP] Players who don't' want to become a vampire: "
--             local playersWithoutSelection = "[WIP] Players who did not make a selection: "
--             local vampiresListPlayerAdded = false
--             local nonVampiresListPlayerAdded = false
--             local playersWithoutSelectionPlayerAdded = false


--             --Announce players who want to become a vampire
--             for i = 1, #vampires do
--                 vampiresList = vampiresList .. vampires[i] .. ", "
--                 vampiresListPlayerAdded = true
--             end

--             --Announce players who don't want to become a vampire
--             for i = 1, #nonVampires do
--                 nonVampiresList = nonVampiresList .. nonVampires[i] .. ", "
--                 nonVampiresListPlayerAdded = true
--             end

--             --Announce players who did not make a selection
--             for i = 1, #otherPlayers do
--                 playersWithoutSelection = playersWithoutSelection .. otherPlayers[i] .. ", "
--                 playersWithoutSelectionPlayerAdded = true
--             end

--             if vampiresListPlayerAdded == true then
--                 SendChatMessage(vampiresList,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             end

--             if nonVampiresListPlayerAdded == true then
--                 SendChatMessage(nonVampiresList,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)   
--             end         
         
--             if playersWithoutSelectionPlayerAdded == true then
--                 SendChatMessage(playersWithoutSelection,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)      
--             end
 
--             noteDisplayed = true
--         end

--         --Detect which players get the Essence of the Blood Queen if they want to become a vampire or not
--         if type == "SPELL_AURA_APPLIED" and spellId == 70867 then
--             --Detect which part of achievement player wants
--             local name, realm = strsplit("-",destName);

--             if has_value(vampires, name) and has_value(playersCompleted, name) == false then
--                 --Player has been bitten and wanted to become a vampire so they have completed the achievement
--                 if(AchievementTracker_playerCount == 25) then
--                     SendChatMessage("[WIP] " .. GetAchievementLink(4618) .. " 'Defeat Blood-Queen Lana'thel while a vampire' COMPLETED for " .. name,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--                 elseif AchievementTracker_playerCount == 10 then
--                     SendChatMessage("[WIP] " .. GetAchievementLink(4539) .. " 'Defeat Blood-Queen Lana'thel while a vampire' COMPLETED for " .. name,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--                 end
--                 table.insert(playersCompleted, name)

--                 --Check if anyone else still needs to become a vampire
--                 local vampireList = "[WIP] " .. destName .. " needs to bite one of the following players: "
--                 local vampireListAdded = false
--                 for i = 1,#vampires do
--                     if has_value(playersCompleted, vampires[i]) == false then
--                         vampireList = vampireList .. vampires[i] .. ", "
--                         vampireListAdded = true
--                     end
--                 end
--                 if vampireListAdded then
--                     SendChatMessage(vampireList,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)                    
--                 end
--             elseif has_value(nonVampires, name) and has_value(playersCompleted, name) == false then
--                 --Player has been bitten but didn't want to become a vampire
--                 if(AchievementTracker_playerCount == 25) then
--                     SendChatMessage("[WIP] " .. GetAchievementLink(4618) .. " 'Defeat Blood-Queen Lana'thel without becoming a vampire' FAILED for " .. name,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--                 elseif AchievementTracker_playerCount == 10 then
--                     SendChatMessage("[WIP] " .. GetAchievementLink(4539) .. " 'Defeat Blood-Queen Lana'thel without becoming a vampire' FAILED for " .. name,core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--                 end
--                 table.insert(playersCompleted, name)                              	
--             end
--         end

--         --Detect if all players that wanted to become a vampire have became a vampire
--         local allPlayersVampires = true
--         local allPlayersNonVampires = true
--         for i = 1,#vampires do
--             if has_value(playersCompleted, vampires[i]) == false then
--                 allPlayersVampires = false
--             end
--         end
--         for i = 1,#nonVampires do
--             if has_value(playersCompleted, nonVampires[i]) then
--                 allPlayersNonVampires = false
--             end
--         end
--         if allPlayersVampires == true and allPlayersNonVampires == true and core.achievementCompleted == false then
--             --Achievement Complete. Boss can now be killed
--             core:getAchievementSuccessWrath(4618, 4539)
--             core.achievementCompleted = true
--         elseif allPlayersVampires == true and allPlayersNonVampires == false and core.achievementCompleted == false then
--             --Everyone who wanted to become a vampire did but people who didn't also became a vampire
--             if(AchievementTracker_playerCount == 25) then
--                 SendChatMessage("[WIP] " .. GetAchievementLink(4618) .. " All players who wanted to become a vampire did. However some players became vampires when they specified they didn't",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             elseif AchievementTracker_playerCount == 10 then
--                 SendChatMessage("[WIP] " .. GetAchievementLink(4539) .. " All players who wanted to become a vampire did. However some players became vampires when they specified they didn't",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
--             end
--             core.achievementCompleted = true                    
--         end
--     end

-- end

function core._631:LichKing()
	for i = 1, core.groupSize do
		local unit = nil
		if core.chatType == "PARTY" then
			if i < core.groupSize then
				unit = "party" .. i
			else
				unit = "player"
			end
		elseif core.chatType == "RAID" then
			unit = "raid" .. i
		elseif core.chatType == "SAY" then
			unit = "player"
        end
        
        if unit ~= nil then
            local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
            for i=1,40 do
                local _, _, count, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
                if (spellId == 70337 or spellId == 70338) and count > necroticPlagueStack and necroticPlagueCompletedAnnounced == false then
                    necroticPlagueStack = count
                    core:sendMessage("Necrotic Plague at " .. necroticPlagueStack .. " stacks")
                end
                local _, _, count, _, _, _, _, _, _, spellId = UnitDebuff(unit .. "target", i)
                if (spellId == 70337 or spellId == 70338) and count > necroticPlagueStack and necroticPlagueCompletedAnnounced == false then
                    necroticPlagueStack = count
                    core:sendMessage("Necrotic Plague at " .. necroticPlagueStack .. " stacks")
                end
            end
        end

        if necroticPlagueStack >= 30 then
            core:getAchievementSuccess()
        end
    end	
end

function core._631:ClearVariables()
    ------------------------------------------------------
    ---- _631 Citadel Bosses
    ------------------------------------------------------
    players = {}

    ------------------------------------------------------
    ---- Lady Deathwhisper
    ------------------------------------------------------
    CultFanaticFound = false
    CultAdherentFound = false
    DeformedFanaticFound = false
    ReanimatedFanaticFound = false
    ReanimatedAdherentFound = false
    CultFanaticWait = false
    CultAdherentWait = false
    AddCounter = 0

    ------------------------------------------------------
    ---- _631 Gunship Battle
    ------------------------------------------------------
    currentTimestamp = nil 

    ------------------------------------------------------
    ---- Deathbringer Saurfang
    ------------------------------------------------------
    markOfTheFallenChampionCounter = 0

    ------------------------------------------------------
    ---- Valithria Dreamwalker
    ------------------------------------------------------
    AchievementTracker_portalsSpawned = false
    portalsEntered = 0
    noteDisplayed = false
    noteTwoDisplay = false
    totalPortals = 0

    ------------------------------------------------------
    ---- Sindragosa
    ------------------------------------------------------
    mysticBuffetStack = 0

    ------------------------------------------------------
    ---- BloodQueenLanathel
    ------------------------------------------------------
    playersCompleted = {}

    ------------------------------------------------------
    ---- Lich King
    ------------------------------------------------------
    necroticPlagueStack = 0 
    necroticPlagueCompletedAnnounced = false  
end

-- function core._631:GunshipBattle()
--     if core.type == "SPELL_DAMAGE" then
--         if (core.spellId == 69192 or core.spellId == 69193) and core.achievementFailed == false then --Rocket Burst
--             if players[core.sourceName] and core.timestamp ~= currentTimestamp then
--                 players[core.sourceName] = players[sourceName] + 1
--                 currentTimestamp = timestamp
--                 core:sendMessage(core.sourceName .. " has gone to the enemy ship " .. players[core.sourceName] .. " times")
--             elseif timestamp ~= currentTimestamp then
--                 players[core.sourceName] = 1
--                 currentTimestamp = core.timestamp
--                 SendChatMessage(core.sourceName .. " has gone to the enemy ship " .. players[sourceName] .. " times")
--             end

--             if players[core.sourceName] ~= nil then
--                 if players[core.sourceName] > 2 then
--                     core:getAchievementFailedWithMessageAfter("(" .. sourceName .. ")")
--                 end           
--             end
--         end
--     end
-- end