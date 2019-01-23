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

function core._2070:ClearVariables()
    ------------------------------------------------------
    ---- Grong  
    ------------------------------------------------------
    barrelCounter = 0
end

-- function core._2070:InstanceCleanup()
--     core._2070.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
-- end

-- core._2070.Events:SetScript("OnEvent", function(self, event, ...)
--     return self[event] and self[event](self, event, ...)
-- end)

-- function core._2070:InitialSetup()
--     core._2070.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
-- end

-- function core._2070.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
--     if core.Instances[core.expansion][core.instanceType][core.instance]["boss4"].enabled == true then
--         if core.emoteType == "HUG" then
--             print("FOUND A HUG FOR UNIT ")
--             print(message)
--         end
--     end
-- end

-- events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")

-- function core._1466:InstanceCleanup()
--     core._1466.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
--     core._1466.Events:UnregisterEvent("UNIT_TARGET")
-- end

-- core._1466.Events:SetScript("OnEvent", function(self, event, ...)
--     return self[event] and self[event](self, event, ...)
-- end)

-- function core._1466:InitialSetup()
--     core._1466.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
--     core._1466.Events:RegisterEvent("UNIT_TARGET")
-- end

-- local emoteType = nil
-- local praiseString1 = nil
-- local praiseString2 = nil
-- local praiseString3 = nil
-- local praiseString4 = nil
-- local praiseString5 = nil
-- local praiseStringFinal = nil

-- hooksecurefunc("DoEmote", function(token, unit)
-- 	token = token:upper() -- Convert token to uppercase

-- 	emoteType = token
-- end)

-- function core._1466.Events:UNIT_TARGET(self, unitID)
--     if praiseStringFinal == nil and UnitIsUnit("target", "player") == false and L["BattleOfDazaralor_PraiseEmote"] == "BattleOfDazaralor_PraiseEmote" then
--         local blockpraise = false
--         if praiseString1 ~= nil then
--             if string.find(praiseString1, UnitName("target")) then
--                 blockpraise = true
--             end 
--         end
--         if praiseString2 ~= nil then
--             if string.find(praiseString2, UnitName("target")) then
--                 blockpraise = true
--             end 
--         end
--         if praiseString3 ~= nil then
--             if string.find(praiseString3, UnitName("target")) then
--                 blockpraise = true
--             end 
--         end
--         if praiseString4 ~= nil then
--             if string.find(praiseString4, UnitName("target")) then
--                 blockpraise = true
--             end 
--         end
--         if praiseString5 ~= nil then
--             if string.find(praiseString5, UnitName("target")) then
--                 blockpraise = true
--             end 
--         end
        
--         if blockpraise == false then
--             DoEmote("PRAISE")       
--         end 
--     end
-- end

-- function core._1466.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
--     if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
--         if emoteType == "PRAISE" then
--             emoteType = nil
--             if praiseString1 == nil then
--                 praiseString1 = message
--             elseif praiseString2 == nil and praiseString1 ~= message then
--                 praiseString2 = message
--             elseif praiseString3 == nil and praiseString1 ~= message and praiseString2 ~= message then
--                 praiseString3 = message
--             elseif praiseString4 == nil and praiseString1 ~= message and praiseString2 ~= message and praiseString3 ~= message then
--                 praiseString4 = message
--             elseif praiseString5 == nil and praiseString1 ~= message and praiseString2 ~= message and praiseString3 ~= message and praiseString4 ~= message then
--                 praiseString5 = message 
--             end

--             if praiseString1 ~= nil and praiseString2 ~= nil and praiseString3 ~= nil and praiseString4 ~= nil and praiseString5 ~= nil and praiseStringFinal == nil then
--                 praiseStringFinal = getCommonWordsInString(praiseString1, praiseString2, praiseString3, praiseString4, praiseString5)
--                 core:printMessage(L["Shared_ReportString"] .. " " .. core.instance .. " '" .. praiseStringFinal .. "'")

--                 L["BattleOfDazaralor_PraiseEmote"] = praiseStringFinal
--             end 
--         end
--     end
-- end

-- function getCommonWordsInString(word1, word2, word3, word4, word5)
-- 	local newWord = ""
-- 	for i = 1, #word1 do
-- 		local c = word1:sub(i,i)
-- 		if c == word2:sub(i, i) and c == word3:sub(i, i) and c == word4:sub(i, i) and c == word5:sub(i, i) then
--             newWord = newWord .. c
--         else
--             break     
-- 		end
-- 	end
-- 	return newWord
-- end



