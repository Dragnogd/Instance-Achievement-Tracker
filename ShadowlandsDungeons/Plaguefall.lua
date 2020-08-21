--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Plaguefall
------------------------------------------------------
core._2289 = {}

------------------------------------------------------
---- Globgrog
------------------------------------------------------
local AppetizerCompleted = false
local EntreeCompleted = false
local DessertCompleted = false
local MealsCompleted = 0

function core._2289:Globgrog()
    --Defeat Globgrog after feeding him a three course meal in Plaguefall on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14347, 1) == true and AppetizerCompleted == false then
        core:sendMessage(GetAchievementCriteriaInfo(14347,1) .. " " .. L["Shared_Completed"] .. " (" .. MealsCompleted .. "/3)")
        AppetizerCompleted = true
        MealsCompleted = MealsCompleted + 1
    end
    if core:getBlizzardTrackingStatus(14347, 2) == true and EntreeCompleted == false then
        core:sendMessage(GetAchievementCriteriaInfo(14347,2) .. " " .. L["Shared_Completed"] .. " (" .. MealsCompleted .. "/3)")
        EntreeCompleted = true
        MealsCompleted = MealsCompleted + 1
    end
    if core:getBlizzardTrackingStatus(14347, 3) == true and DessertCompleted == false then
        core:sendMessage(GetAchievementCriteriaInfo(14347,3) .. " " .. L["Shared_Completed"] .. " (" .. MealsCompleted .. "/3)")
        DessertCompleted = true
        MealsCompleted = MealsCompleted + 1
    end

    if core:getBlizzardTrackingStatus(14347, 1) == true and core:getBlizzardTrackingStatus(14347, 2) == true and core:getBlizzardTrackingStatus(14347, 3) == true then
        core:getAchievementSuccess()
    end
end

function core._2289:DoctorIckus()
    --Defeat Doctor Ickus after destroying 2 Volatile Plague Bombs in Plaguefall on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14296, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2289:ClearVariables()
	------------------------------------------------------
    ---- Globgrog
    ------------------------------------------------------
    AppetizerCompleted = false
    EntreeCompleted = false
    DessertCompleted = false
    MealsCompleted = 0
end