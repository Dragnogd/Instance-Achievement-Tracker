--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Grimrail Depot Bosses
------------------------------------------------------
core._1208 = {}
core._1208.Events = CreateFrame("Frame")

------------------------------------------------------
---- Rocketspark and Borka
------------------------------------------------------
local pricelessParaphernaliaCounter = 0

function core._1208:RocketsparkAndBorka()
    if pricelessParaphernaliaCounter == 4 then
        core:getAchievementSuccess()
    end
end

function core._1208:ClearVariables()
end

function core._1208:InstanceCleanup()
    core._1208.Events:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
end

function core._1208:InitialSetup()
    core._1208.Events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end

core._1208.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._1208.Events:CHAT_MSG_MONSTER_YELL(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, ...)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
        if message == "Gah! That was my last samophlange! Do you know how hard those are to get?" or message == "Hey dummy! How would you like it if I broke all your things?!" or message == "That was my entire collection of Hearthstone cards!" or message == "You big oaf! Quit breaking my things!" then
            pricelessParaphernaliaCounter = pricelessParaphernaliaCounter + 1
            core:sendMessage("Priceless Paraphernalia Counter (" .. pricelessParaphernaliaCounter .. "/4)")
        end
    end
end