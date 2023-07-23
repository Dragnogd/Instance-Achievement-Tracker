--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Dawn of the Infinite Bosses
------------------------------------------------------
core._2579 = {}

function core._2579:Chronikar()
    --Defeat Chronikar after she shatters an Infused Hourglass with Eon Shatter in Dawn of the Infinite on Mythic difficulty.

    if core:getBlizzardTrackingStatus(18589, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2579:ManifestedTimeways()
    --Defeat Manifested Timeways after activating 3 Chaotic Time portals in Dawn of the Infinite on Mythic difficulty.

    if core:getBlizzardTrackingStatus(18556, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2579:BlightOfGalarond()
    --Defeat Blight of Galakrond after allowing a lost slime to hop on your back and then getting hit by Blight Reclamation in Dawn of the Infinites on Mythic difficulty.

    if core:getBlizzardTrackingStatus(18612, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2579:TyrTheInfiniteKeeper()
    --Defeat Tyr, the Infinite Keeper after closing 18 Time Rifts in Dawn of the Infinite on Mythic difficulty.

    if core:getBlizzardTrackingStatus(18539, 1) == true then
		core:getAchievementSuccess()
	end
end