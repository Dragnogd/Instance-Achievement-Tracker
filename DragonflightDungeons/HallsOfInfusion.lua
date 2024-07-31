--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Halls of Infusion Bosses
------------------------------------------------------
core._2527 = {}

function core._2527:GulpingGoliath()
	--Defeat the Gulping Goliath after forcing it to become Hangry and devour 10 Curious Swoglets in Halls of Infusion on Mythic difficulty.

	--TODO: Counter for number of Swoglets alive
	--TODO: Announce when boss is Hangry and when players have enough swoglets alive to bring to boss to get gulped

	if core:getBlizzardTrackingStatus(16426, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2527:PrimalTsunami()
	--Defeat the Primal Tsunami after slaying three Flow Control Units in Halls of Infusion on Mythic difficulty.

	if core:getBlizzardTrackingStatus(16427, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2527:TrackAdditional()
	--Toxicity Strike Team
	if core.Instances[core.expansion][core.instanceType][core.instance]["boss1"].enabled == true then
		if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 391694 then
			if core.sourceName ~= nil then
				core:sendMessage(GetAchievementLink(16517) .. " " .. core.sourceName .. " " .. format(L["Shared_HasPressed"], C_Spell.GetSpellLink(391694)), true)
			end
		end
	end
end