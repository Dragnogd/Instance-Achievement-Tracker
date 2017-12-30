--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Grimrail Depot Bosses
------------------------------------------------------
core.GrimrailDepot = {}
local events = CreateFrame("Frame")

------------------------------------------------------
---- Rocketspark and Borka
------------------------------------------------------
local pricelessParaphernaliaCounter = 0

function core.GrimrailDepot:RocketsparkAndBorka()
    if events:IsEventRegistered("CHAT_MSG_MONSTER_YELL") ~= true then
        events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
    end

    if pricelessParaphernaliaCounter == 4 then
        core:getAchievementSuccess()
    end
end

function core.GrimrailDepot:ClearVariables()
    if events:IsEventRegistered("CHAT_MSG_MONSTER_YELL") == true then
        events:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
    end
end

events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...) 	--Allow event arguments to be called from seperate functions
end)

function events:CHAT_MSG_MONSTER_YELL(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, ...)
    if message == "Gah! That was my last samophlange! Do you know how hard those are to get?" or message == "Hey dummy! How would you like it if I broke all your things?!" or message == "That was my entire collection of Hearthstone cards!" or message == "You big oaf! Quit breaking my things!" then
        pricelessParaphernaliaCounter = pricelessParaphernaliaCounter + 1
        core:sendMessage("Priceless Paraphernalia Counter (" .. pricelessParaphernaliaCounter .. "/4)")
    end
end