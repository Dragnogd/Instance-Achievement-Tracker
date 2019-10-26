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

function core._2217:WrathionTheBlackEmperor()
    --Blizzard tracking gone white so achievement completed
	if core:getBlizzardTrackingStatus(14019) == true then
		core:getAchievementSuccess()
	end
end

-- function core._2217:Drestagath()
-- 	--Defeat Drest'agath after triggering Throes of Agony twice within 60 seconds, on Normal difficulty or higher.
-- 	if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 308947 then
-- 		temperTantrumCounter = temperTantrumCounter + 1
-- 		if temperTantrumCounter == 2 then
-- 			core:getAchievementSuccess()
-- 		end
-- 	end
-- end

