--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Ruby Life Pools Bosses
------------------------------------------------------
core._2521 = {}

------------------------------------------------------
---- Melidrussa
------------------------------------------------------
local infusedWhelpCounter = 0

function core._2521:KyrakkaAndErkhartStormvein()
    --Defeat Kyrakka and Erkhart Stormvein after chilling, searing, tempering, and keeping alive the Nascent Ruby Egg in Ruby Life Pools on Mythic difficulty.

    --TODO: This is done throughout the whole dungeon so we need to add tracking for other fights too.

    if core:getBlizzardTrackingStatus(16440, 1) == false then
		core:getAchievementFailed()
	end
end

function core._2521:Melidrussa()
    --Defeat Melidrussa after defeating 40 of her chamber's Infused Whelps in Ruby Life Pools on Mythic difficulty.

    if core.type == "UNIT_DIED" and core.destID == "189893" then
        infusedWhelpCounter = infusedWhelpCounter + 1
        core:sendMessageDelay(getNPCName(189893) .. " " .. L["Shared_Killed"] .. " (" .. infusedWhelpCounter .. "/40)", infusedWhelpCounter, 5)

        core.IATInfoFrame:SetSubHeading1(L["MobCounter_TimeReamining"] .. ": " .. L["MobCounter_TimerNotApplicable"])
        core.IATInfoFrame:SetText1(format(L["MobCounter_MobsKilled"], getNPCName(tonumber(189893))) .. " (" .. infusedWhelpCounter .. "/40))","GameFontHighlightLarge")
    end

    if core:getBlizzardTrackingStatus(16402, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2521:KokiaBlazehoof()
    --Defeat Kokia Blazehoof after heating up 4 life pools with Molten Boulder in Ruby Life Pools on Mythic difficulty.

    if core:getBlizzardTrackingStatus(16320, 1) == true then
		core:getAchievementSuccess()
	end
end

function core._2521:ClearVariables()
    ------------------------------------------------------
    ---- Melidrussa
    ------------------------------------------------------
    infusedWhelpCounter = 0
end