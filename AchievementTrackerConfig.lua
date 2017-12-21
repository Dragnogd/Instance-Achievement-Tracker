------------------------------------------------------
---- Namespaces
------------------------------------------------------
local _, core = ...
core.Config = {}

local Config = core.Config
local UIConfig

------------------------------------------------------
---- Config Functions
------------------------------------------------------
function Config:Toggle()
    local menu = UIConfig or Config:CreateMenu()
    menu:SetShown(not menu:IsShown())
end

function Config:CreateMenu()
    UIConfig = CreateFrame ("Frame", "AchievementTracker", UIParent, "BasicFrameTemplateWithInset")
    UIConfig:SetSize(1000,500)
    UIConfig:SetPoint("CENTER", UIParent, "CENTER")

    --Title
    UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    UIConfig.title:SetPoint("CENTER", UIConfig.TitleBg, "CENTER")
    UIConfig.title:SetText("Achievement Tracker")

    UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    UIConfig.title:SetPoint("TOPLEFT", UIConfig.InsetBg, "TOPLEFT", 15, -15)
    UIConfig.title:SetText("Icecrown Citadel" .. "\n\n" .. GetAchievementLink(4610) .. "\n\n" .. "Achievement 2" .. "\n\n" .. "Achievement 3")
    UIConfig.title:SetFont("Fonts\\ARIALN.TTF", 17, "OUTLINE")



    --Button
    UIConfig.saveButton = CreateFrame("Button", nil, UIConfig, "GameMenuButtonTemplate")
    UIConfig.saveButton:SetPoint("CENTER", UIConfig, "TOP", 0, -70)
    UIConfig.saveButton:SetSize(140,40)
    UIConfig.saveButton:SetText("Save")
    UIConfig.saveButton:SetNormalFontObject("GameFontNormalLarge")
    UIConfig.saveButton:SetHighlightFontObject("GameFontHighlightLarge")

    UIConfig:Hide()
    return UIConfig
end