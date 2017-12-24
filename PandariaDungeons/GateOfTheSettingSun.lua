--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Gate of the Setting Sun Bosses
------------------------------------------------------
core.GateOfTheSettingSun = {}

local f = CreateFrame("Frame")

------------------------------------------------------
---- Saboteur Kip'tilak
------------------------------------------------------
local stableMunitionsCounter = 0
local tempStore = {}

f:SetScript("OnEvent", function(self, event, unitID, spell, rank, lineID, spellID)
    if event == "UNIT_SPELLCAST_SUCCEEDED" then
        --Plant Munitions
        if spellID == 114288 then
            stableMunitionsCounter = stableMunitionsCounter + 1
            print(stableMunitionsCounter)
        end            
    end
end)

function core.GateOfTheSettingSun:SaboteurKiptilak()
    if f:IsEventRegistered("UNIT_SPELLCAST_SUCCEEDED") ~= true then
        print("Regestering Event")
        f:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    end

    if core.type == "SPELL_CAST_SUCCESS" and core.spellId == 107215 and core.spawn_uid_dest ~= nil then
        if core:has_value(tempStore, core.spawn_uid_dest) == false then
            if stableMunitionsCounter > 0 then
                stableMunitionsCounter = stableMunitionsCounter - 1
            end
            print(stableMunitionsCounter)
            table.insert(tempStore, core.spawn_uid_dest)  
        end
    end

    if stableMunitionsCounter >= 15 then
        core:getAchievementSuccessWithCustomMessage("","15 Stable Munitions Bombs Active. DPS boss down to 70% to complete achievement")
    end
end

function core.GateOfTheSettingSun:Raigonn()
    if core.type == "UNIT_DIED" and (core.destID == "56929" or core.destID == "56930" or core.destID == "56912") then
        core:getAchievementFailed()
    end
end

function core.GateOfTheSettingSun:ClearVariables()
    ------------------------------------------------------
    ---- Saboteur Kip'tilak
    ------------------------------------------------------
    stableMunitionsCounter = 0
    tempStore = {}

	if f:IsEventRegistered("UNIT_SPELLCAST_SUCCEEDED") == true then
		f:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	end
end

