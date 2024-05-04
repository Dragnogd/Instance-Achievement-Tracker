--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- The Everbloom Bosses
------------------------------------------------------
core._1279 = {}
--local events = CreateFrame("Frame")

-- ------------------------------------------------------
-- ---- Yalnu
-- ------------------------------------------------------
-- local enableNameplates = false
-- local npcUID = {}

function core._1279:Witherbark()
    if core.type == "SPELL_ENERGIZE" and core.spellId == 164438 then
        core:getAchievementFailed()
    end
end

-- function core._1279:Yalnu()
--     --print(GetCVar("nameplateShowFriends"))
--     if GetCVar("nameplateShowFriends") == "0" and enableNameplates == false then
--         print("Enabling Friendly Nameplates")
--         SetCVar("nameplateShowFriends", 1-GetCVar("nameplateShowFriends"))
--         events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
--         enableNameplates = true
--     elseif GetCVar("nameplateShowFriends") == "1" and enableNameplates == false then
--         print("Friendly Nameplates already enabled")
--         events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
--         enableNameplates = true
--     end

--     --Loop through each of the UID and check whether the unit exists. If they don't then one of the npc must have died
--     for i = 1, #npcUID do
--         --
--         local name, realm = UnitName(npcUID[i])
--         if name ~= nil and UnitHealth(npcUID[i]) == 0 then
--             core:getAchievementFailed()
--         elseif name ~= nil then
--             print(UnitName(npcUID[i]) .. " : " .. UnitHealth(npcUID[i]))
--         end
--     end
-- end

function core._1279:ClearVariables()
    -- ------------------------------------------------------
    -- ---- Yalnu
    -- ------------------------------------------------------
    -- enableNameplates = false
    -- npcUID = {}
    -- events:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

-- events:SetScript("OnEvent", function(self, event, ...)
--     return self[event] and self[event](self, event, ...) 	--Allow event arguments to be called from seperate functions
-- end)

-- function events:UNIT_SPELLCAST_SUCCEEDED(self, ...)
--     local unitID, spell, rank, lineID, spellID = ...

--     local unitTypeSrc, _, _, _, _, sourceID, spawn_uid = strsplit("-", UnitGUID(unitID))
--     if unitTypeSrc == "Creature" and sourceID == "84329" then
--         if core:has_value(npcUID, unitID) == false then
--             print(UnitGUID(unitID) .. " : " .. UnitName(unitID) .. " : " .. spell .. " : " .. spellID)
--             table.insert(npcUID, unitID)
--         end			
--     end

--     -- if spellID == 166930 then
--     --     print("Battle Mage Died")
--     -- end
-- end