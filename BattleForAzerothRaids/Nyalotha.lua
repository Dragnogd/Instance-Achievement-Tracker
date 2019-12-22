--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Ny’alotha
------------------------------------------------------
core._2217 = {}
core._2217.Events = CreateFrame("Frame")

------------------------------------------------------
---- Drest'agath
------------------------------------------------------
local temperTantrumCounter = 0
local timerStarted = false

------------------------------------------------------
---- N'Zoth, the Corruptor
------------------------------------------------------
local giftOfNZothCounter = 0
local giftOfNZothUID = {}

------------------------------------------------------
---- Shad'har the Insatiable
------------------------------------------------------
local playersCompletedAchievement = 0
local initialScan = false

function core._2217:WrathionTheBlackEmperor()
    --Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14019) == true then
		core:getAchievementSuccess()
	end
end

function core._2217:DrestAgath()
	--Defeat Drest'agath after triggering Throes of Agony twice within 60 seconds, on Normal difficulty or higher.
	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 308941 then
		temperTantrumCounter = temperTantrumCounter + 1
		if timerStarted == false then
			timerStarted = true
			C_Timer.After(60, function()
				if temperTantrumCounter == 2 then
					core:getAchievementSuccess()
				end
				timerStarted = false
			end)
		else	
			if temperTantrumCounter == 2 then
				core:getAchievementSuccess()
			end
		end	
	end
end

function core._2217:ShadharTheInsatiable()
	--Defeat Shad'har the Insatiable in Ny'alotha, the Waking City after having everyone /pet him on Normal difficulty or higher.
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersMetCriteria"],playersCompletedAchievement,core.groupSize)
	core.IATInfoFrame:SetSubHeading2(L["Shared_Notes"],"GameFontHighlight")
	core.IATInfoFrame:SetText2(L["Shared_Players25Yards"],200)
	
	if initialScan == false then
		initialScan = true
		core:sendMessage(L["Shared_Players25Yards"],true)
	end

	if playersCompletedAchievement == core.groupSize then
		core:getAchievementSuccess()
	end

	--Check for message in the sync queue
	for k, player in ipairs(core.syncMessageQueue) do
		if player ~= nil then
			--If someone is found then update InfoFrame
			if InfoFrame_GetPlayerComplete(player) == false then
				InfoFrame_SetPlayerComplete(player)
				playersCompletedAchievement = playersCompletedAchievement + 1
			end
			core.syncMessageQueue[k] = nil
		end
	end
end

function core._2217:Vexiona()
	--Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14139) == true then
		core:getAchievementSuccess()
	end
end

function core._2217:CarapaceOfNZoth()
	--Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14147, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2217:NZothTheCorruptor()
	--Defeat N'Zoth, the Corruptor in Ny'alotha, the Waking City while all players have accepted the Gift of N'Zoth on Normal difficulty or higher
	InfoFrame_UpdatePlayersOnInfoFrame()
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],giftOfNZothCounter,core.groupSize)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 313609 and giftOfNZothUID[core.spawn_uid_dest_Player] == nil then
		giftOfNZothCounter = giftOfNZothCounter + 1
		giftOfNZothUID[core.spawn_uid_dest_Player] = core.spawn_uid_dest_Player
		core:sendMessage(core.destName .. " " .. L["Shared_HasGained"] .. " " .. GetSpellLink(313609) .. " (" .. giftOfNZothCounter .. "/" .. core.groupSize .. ")",true)
		InfoFrame_SetPlayerComplete(UnitName(core.destName))
	end
end

function core._2217:ClearVariables()
	------------------------------------------------------
	---- Drest'agath
	------------------------------------------------------
	temperTantrumCounter = 0
	timerStarted = false

	------------------------------------------------------
	---- N'Zoth, the Corruptor
	------------------------------------------------------
	giftOfNZothCounter = 0
	giftOfNZothUID = {}

	------------------------------------------------------
	---- Shad'har the Insatiable
	------------------------------------------------------
	playersCompletedAchievement = 0
	initialScan = false
end

function core._2217:InstanceCleanup()
    core._2217.Events:UnregisterEvent("CHAT_MSG_TEXT_EMOTE")
end

core._2217.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2217:InitialSetup()
    core._2217.Events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
end

function core._2217.Events:CHAT_MSG_TEXT_EMOTE(self, message, sender, lineID, senderGUID)
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss6"].enabled == true then
        --Lets get the target they petted
        if UnitIsPlayer(sender) then
            if sender == UnitName("Player") then
                if string.match(message, L["Nyalotha_PetSelf"]) then
                    core:sendDebugMessage("Detected Pet Self")
                    if string.match(message, getNPCName(157231)) then
                        core:sendDebugMessage("Detected Shad'har in self")
						--They have petted the correct npc
						if InfoFrame_GetPlayerComplete(sender) == false then
							InfoFrame_SetPlayerComplete(sender)
							playersCompletedAchievement = playersCompletedAchievement + 1

							--Send message to other addon users
							C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. sender, "RAID")
						end
                    end
                end
            else
                if string.match(message, L["Nyalotha_PetOther"]) then
                    core:sendDebugMessage("Detected Pet Other")
                    if string.match(message, getNPCName(157231)) then
                        core:sendDebugMessage("Detected Shad'har in other")
                        --They have petted the correct npc
						if InfoFrame_GetPlayerComplete(sender) == false then
							InfoFrame_SetPlayerComplete(sender)
							playersCompletedAchievement = playersCompletedAchievement + 1

							--Send message to other addon users
							C_ChatInfo.SendAddonMessage("Whizzey", "syncMessage" .. "-" .. sender, "RAID")
						end
                    end
                end 
            end
        end
    end
end