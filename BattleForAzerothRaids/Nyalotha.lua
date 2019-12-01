--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Ny’alotha
------------------------------------------------------
core._2217 = {}

------------------------------------------------------
---- Drest'agath
------------------------------------------------------
local temperTantrumCounter = 0
local timerStarted = false

------------------------------------------------------
---- N'Zoth, the Corruptor
------------------------------------------------------
local giftOfNZothCounter = 0

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
	InfoFrame_SetHeaderCounter(L["Shared_PlayersWithBuff"],parasiteCounter,core.groupSize)

	if core.type == "SPELL_AURA_APPLIED" and core.spellId == 313609 then
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
end


