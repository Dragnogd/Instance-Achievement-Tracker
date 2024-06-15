-- SPDX-License-Identifier: Unlicense

local LibDBCompartment = LibStub:NewLibrary("LibDBCompartment-1.0", 4);

if not LibDBCompartment then
    return;
end

local LibDataBroker = LibStub:GetLibrary("LibDataBroker-1.1");

--
-- Button management functions
--

function LibDBCompartment:GetDataObject(name)
    return self.objects[name];
end

function LibDBCompartment:GetDropDownButtonInfo(name)
    return self.buttons[name];
end

function LibDBCompartment:GetNameByDataObject(dataObject)
    return self.names[dataObject];
end

function LibDBCompartment:GetNameByDropDownButtonInfo(buttonInfo)
    return self.names[buttonInfo];
end

function LibDBCompartment:IsRegistered(name)
    return self:GetDropDownButtonInfo(name) ~= nil;
end

function LibDBCompartment:Register(name, dataObject)
    assert(type(name) == "string", "bad argument #1 to 'Register': expected string");
    assert(not self:IsRegistered(name), "bad argument #1 to 'Register': name is already registered");
    assert(LibDataBroker:GetNameByDataObject(dataObject), "bad argument #2 to 'Register': invalid data object");

    local buttonInfo = {};
    self.buttons[name] = buttonInfo;
    self.objects[name] = dataObject;

    self.names[buttonInfo] = name;
    self.names[dataObject] = name;

    self:Refresh(name);
    self:Show(name);
end

function LibDBCompartment:Refresh(name)
    local buttonInfo = assert(self:GetDropDownButtonInfo(name), "bad argument #1 to 'Refresh': name not registered");
    local dataObject = self:GetDataObject(name);

    -- The following fields are dynamic and are always replaced when this
    -- function is called based on object attributes, or if a refresh is
    -- triggered through object attribute modifications.

    buttonInfo.text = self:GetDataObjectLabel(dataObject);
    buttonInfo.icon = self:GetDataObjectIcon(dataObject);

    -- The following fields are only set if not already present. Callers may
    -- obtain a reference to the info table via GetDropDownButtonInfo and
    -- replace these if desired.

    if not buttonInfo.func then
        buttonInfo.func = function(...) self:OnDropDownButtonClick(dataObject, ...); end;
    end

    if not buttonInfo.funcOnEnter then
        buttonInfo.funcOnEnter = function(...) self:OnDropDownButtonEnter(dataObject, ...); end;
    end

    if not buttonInfo.funcOnLeave then
        buttonInfo.funcOnLeave = function(...) self:OnDropDownButtonLeave(dataObject, ...); end;
    end

    if buttonInfo.notCheckable == nil then
        buttonInfo.notCheckable = true;
    end

    if buttonInfo.registerForAnyClick == nil then
        buttonInfo.registerForAnyClick = true;
    end
end

--
-- Button visibility functions
--
-- These functions will add or remove your registered compartment button from
-- the addon compartment dropdown. Unlike LibDBIcon, calling these functions
-- does *not* persist any state in saved variables.
--

function LibDBCompartment:Show(name)
    assert(self:IsRegistered(name), "bad argument #1 to 'Show': name not registered");
    self:SetShown(name, true);
end

function LibDBCompartment:Hide(name)
    assert(self:IsRegistered(name), "bad argument #1 to 'Hide': name not registered");
    self:SetShown(name, false);
end

function LibDBCompartment:IsShown(name)
    if not AddonCompartmentFrame then
        return false;
    end

    local buttonInfo = self:GetDropDownButtonInfo(name);
    local index = tIndexOf(AddonCompartmentFrame.registeredAddons, buttonInfo);

    return index ~= nil;
end

function LibDBCompartment:SetShown(name, shown)
    local buttonInfo = assert(self:GetDropDownButtonInfo(name), "bad argument #1 to 'SetShown': name not registered");

    if not AddonCompartmentFrame then
        return;
    end

    local index = tIndexOf(AddonCompartmentFrame.registeredAddons, buttonInfo);

    if shown and not index then
        AddonCompartmentFrame:RegisterAddon(buttonInfo);
    elseif not shown and index then
        table.remove(AddonCompartmentFrame.registeredAddons, index);
        AddonCompartmentFrame:UpdateDisplay();
    end
end

--
-- Tooltip anchor functions
--
-- These functions are provided for any minimap addons that may be relocating
-- the addon compartment to a location that's incompatible with our internal
-- tooltip.
--
-- These work with Blizzards' AnchorMixin objects; see SharedXML\AnchorUtil.lua.
--
-- The special token "$button" can be set as the "relativeTo" frame to hint to
-- the library that a tooltip should be anchored to the dropdown button.

function LibDBCompartment:GetTooltipAnchor()
    return self.tooltipAnchor;
end

function LibDBCompartment:SetTooltipAnchor(anchor)
    assert(type(anchor) == "table", "bad argument #1 to 'SetTooltipAnchor': expected table");
    assert(type(anchor.Get) == "function", "bad argument #1 to 'SetTooltipAnchor': invalid 'Get' field on anchor");

    self.tooltipAnchor = anchor;
end

--
-- Internal functions
--
-- "Cor blimey mate, what are ye doing in me pockets?"
--

function LibDBCompartment:OnLoad()
    if not self.buttons then
        self.buttons = {};  -- { ["name"] = <uidropdownmenu button info>, ... }
    end

    if not self.objects then
        self.objects = {};  -- { ["name"] = <ldb object>, ... }
    end

    if not self.names then
        self.names = {};  -- { [<any>] = "name" };
    end

    if not self.tooltip then
        self.tooltip = CreateFrame("GameTooltip", "LibDBCompartmentTooltip", UIParent, "GameTooltipTemplate");
    end

    if not self.tooltipAnchor then
        self.tooltipAnchor = AnchorUtil.CreateAnchor("TOPRIGHT", "$button", "TOPLEFT", -20, 0);
    end

    LibDataBroker.RegisterCallback(self, "LibDataBroker_AttributeChanged__label", "OnDataObjectAttributeChanged");
    LibDataBroker.RegisterCallback(self, "LibDataBroker_AttributeChanged__icon", "OnDataObjectAttributeChanged");
    LibDataBroker.RegisterCallback(self, "LibDataBroker_AttributeChanged__tocname", "OnDataObjectAttributeChanged");
end

function LibDBCompartment:OnDataObjectAttributeChanged(_, _, _, _, dataObject)
    local name = self:GetNameByDataObject(dataObject);

    if name then
        self:Refresh(name);
    end
end

function LibDBCompartment:OnDropDownButtonClick(dataObject, button, _, _, _, mouseButtonName)
    local OnClick = dataObject.OnAddonCompartmentClick or dataObject.OnClick;

    if OnClick then
        OnClick(button, mouseButtonName);
    end
end

function LibDBCompartment:OnDropDownButtonEnter(dataObject, button)
    local OnEnter = dataObject.OnAddonCompartmentEnter or dataObject.OnEnter;
    local OnTooltipShow = dataObject.OnAddonCompartmentTooltipShow or dataObject.OnTooltipShow;

    if OnTooltipShow then
        self.tooltip:SetOwner(button, "ANCHOR_NONE");
        self.tooltip:ClearAllPoints();
        self.tooltip:SetPoint(self:GetTooltipAnchorPoint(button));
        OnTooltipShow(self.tooltip);
        self.tooltip:Show();
    elseif OnEnter then
        OnEnter(button);
    end
end

function LibDBCompartment:OnDropDownButtonLeave(dataObject, button)
    local OnLeave = dataObject.OnAddonCompartmentLeave or dataObject.OnLeave;

    self.tooltip:Hide();

    if OnLeave then
        OnLeave(button);
    end
end

function LibDBCompartment:GetDataObjectLabel(dataObject)
    local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata;
    local label;

    if type(dataObject.label) == "string" then
        label = dataObject.label;
    elseif type(dataObject.tocname) == "string" then
        label = GetAddOnMetadata(dataObject.tocname, "Title");
    end

    -- Two fallbacks; use the data object name first, and if that is for
    -- whatever reason not a string use whatever name the caller registered
    -- into us with. This is to ensure that one bad entry doesn't brick the
    -- sort comparator in patch 10.1.

    if type(label) ~= "string" then
        label = LibDataBroker:GetNameByDataObject(dataObject);
    end

    if type(label) ~= "string" then
        label = self.names[dataObject];
    end

    return label;
end

function LibDBCompartment:GetDataObjectIcon(dataObject)
    local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata;
    local icon;

    if dataObject.icon then
        icon = dataObject.icon;
    elseif type(dataObject.tocname) == "string" then
        local tocname = dataObject.tocname;
        icon = GetAddOnMetadata(tocname, "IconTexture") or GetAddOnMetadata(tocname, "IconAtlas");
    end

    return icon;
end

function LibDBCompartment:GetTooltipAnchorPoint(button)
    local point, relativeTo, relativePoint, offsetX, offsetY = self.tooltipAnchor:Get();

    if relativeTo == "$button" then
        relativeTo = button;
    end

    return point, relativeTo, relativePoint, offsetX, offsetY;
end

LibDBCompartment:OnLoad();

