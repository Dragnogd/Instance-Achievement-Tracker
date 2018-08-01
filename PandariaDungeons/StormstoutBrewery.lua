--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Stormstout Brewery Bosses
------------------------------------------------------
core._961 = {}

------------------------------------------------------
---- Ook-Ook
------------------------------------------------------
local brewExplosion = 0

------------------------------------------------------
---- Trash (Hopocalypse Now!)
------------------------------------------------------
local virmenCounter = 0
local virmenTable = {}
local virmenKilled = 0
local startCountingVirmen = false
local hammerUsedAmount = 0

function core._961:OokOok()
	if core.type == "SPELL_DAMAGE" and core.spellId == 106784 then
		brewExplosion = brewExplosion + 1
		core:sendMessage("Rolling Brew Barrels (" .. brewExplosion .. "/20)")
	end

	if brewExplosion >= 20 then
		core:getAchievementSuccess()
	end
end


function core._961:Hoptallus()
	--Detect amount of virmen currently on target
	if (core.type == "SWING_DAMAGE" or core.type == "SWING_MISSED") and (core.sourceID == "59426" or core.sourceID == "59460" or core.sourceID == "56718" or core.sourceID == "59459" or core.sourceID == "59461" or core.sourceID == "59551") and (core.spawn_uid ~= nil) then
		if virmenTable[core.spawn_uid] == nil then
			virmenTable[core.spawn_uid] = core.spawn_uid
			virmenCounter = virmenCounter + 1
			--Only display every 5 to reduce spam
			if virmenCounter - math.floor(virmenCounter/10)*10 == 0 then
				SendChatMessage("[WIP] Virmen Counter (" .. virmenCounter .. "/100)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end
		end
	end

	--Detect when virmen die
	if core.type == "UNIT_DIED" and (core.destID == "59426" or core.destID == "59460" or core.destID == "56718" or core.destID == "59459" or core.destID == "59461" or core.destID == "59551") then
		if virmenTable[core.spawn_uid_dest] ~= nil then
			virmenTable[core.spawn_uid_dest] = nil
			virmenCounter = virmenCounter - 1
			if virmenCounter - math.floor(virmenCounter/10)*10 == 0 then
				--SendChatMessage("[WIP] Virmen Counter (" .. virmenCounter .. "/100)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
			end
		end

		-- if startCountingVirmen == true then
		-- 	SendChatMessage("[WIP] Virmen Killed (" .. virmenKilled .. "/100)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
		-- 	virmenKilled = virmenKilled + 1
		-- end
	end

	--Detect when user can kill virmen with hammer
	if virmenCounter >= 100 and core.achievementCompleted == false then
		core:getAchievementSuccess()
	end

	-- --Detect how many virmen player has killed with hammer
	-- if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 111666 and hammerUsedAmount < 3 then
	-- 	--Wait 1 second and see how many virmen were killed
	-- 	hammerUsedAmount = hammerUsedAmount + 1
	-- 	startCountingVirmen = true
	-- 	C_Timer.After(0.5, function()
	-- 		startCountingVirmen = false
	-- 		if hammerUsedAmount == 3 and virmenKilled >= 100 then
	-- 			SendChatMessage("[WIP] Virmen Killed with hammer (" .. virmenKilled .. "/100)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	-- 		elseif hammerUsedAmount == 3 and virmenKilled < 100 then
	-- 			SendChatMessage("[WIP] Virmen Killed with hammer (" .. virmenKilled .. "/100)",core.chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
	-- 			hammerUsedAmount = 0
	-- 			virmenKilled = 0
	-- 		end
	-- 	end)
	-- end
end


function core._961:ClearVariables()
	------------------------------------------------------
	---- Ook-Ook
	------------------------------------------------------
	brewExplosion = 0

	------------------------------------------------------
	---- Trash (Hopocalypse Now!)
	------------------------------------------------------
	virmenCounter = 0
	virmenTable = {}
end
