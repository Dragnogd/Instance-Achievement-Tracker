--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Battle of Dazar'alor Bosses
------------------------------------------------------
core._2096 = {}
core._2096.Events = CreateFrame("Frame")

------------------------------------------------------
---- The Restless Cabal
------------------------------------------------------
local voidCrashesActive = 0

------------------------------------------------------
---- Uu'nat, Harbinger of the Void
------------------------------------------------------
local stopMovingAnnounced = false

function core._2096:TheRestlessCabal()
    --Defeat the Restless Cabal in Crucible of Storms after having at least 10 Void Crashes active simultaneously in Normal Difficulty or higher.

    --Blizzard Tracker has gone white so achievement failed
    if core:getBlizzardTrackingStatus(13501) == true then
        core:getAchievementSuccess()
    end
end

function core._2096:UunatHarbingerOfTheVoid()
        -- --Defeat Uu'nat, Harbinger of the Void in Crucible of Storms without allowing N'Zoth to see your movement in Normal Difficulty or higher.

        -- --When boss starts casing Gift of N'Zoth get the original ranges of all players in the raid
        -- if core.type == "SPELL_CAST_START" and (core.spellId = "285638" or core.spellId == "285685" or core.spellId == "285453") then
        --     local maxChecker = rc:GetFriendChecker(range)
        --     if maxChecker ~= nil then
        --         for player, status in pairs(core.InfoFrame_PlayersTable) do
        --             if not maxChecker(player) then
        --                 --print(player .. " is not in range")
        --                 if core.InfoFrame_PlayersTable[player] ~= 2 then
        --                     core.InfoFrame_PlayersTable[player] = 4            
        --                 end
        --             elseif core.InfoFrame_PlayersTable[player] ~= 2 then
        --                 core.InfoFrame_PlayersTable[player] = 1
        --             end
        --         end
        --     end
        -- end

        -- --When boss has finished casting Gift of N'Zoth get all ranges again then compare to original
        -- --If any of the ranges changed between this time then we can assume that a player has moved
        -- --This way is not hugely accurate but it's the best we can do since blizzard do not allow us to get players positions in the raid

end

function core._2096:ClearVariables()
    ------------------------------------------------------
    ---- The Restless Cabal
    ------------------------------------------------------
    voidCrashesActive = 0

    ------------------------------------------------------
    ---- Uu'nat, Harbinger of the Void
    ------------------------------------------------------
    stopMovingAnnounced = false
end

function core._2096:InstanceCleanup()
    core._2096.Events:UnregisterEvent("UNIT_POWER_UPDATE")
end

core._2096.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._2096:InitialSetup()
    core._2096.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

function core._2096.Events:UNIT_POWER_UPDATE(self, unit, powerType)
    --Defeat Uu'nat, Harbinger of the Void in Crucible of Storms without allowing N'Zoth to see your movement in Normal Difficulty or higher.
    if core.Instances[core.expansion][core.instanceType][core.instance]["boss2"].enabled == true then
        if UnitGUID(unit) ~= nil then
            local unitType, _, _, _, _, destID, spawn_uid_dest = strsplit("-", UnitGUID(unit))
            if destID == "145371" then
                --If power is 95 or higher than warn player to stop moving
                if UnitPower(unit) >= 95 and stopMovingAnnounced == false then
                    stopMovingAnnounced = true
                    core:sendMessage(GetAchievementLink(13506) .. L["CrucibleOfStorms_StopMoving"],true)
                end

                --If power is 0 or message announced is still locked then reset
                if UnitPower(unit) >= 0 and stopMovingAnnounced == true then
                    stopMovingAnnounced = false
                    core:sendMessage(GetAchievementLink(13506) .. L["CrucibleOfStorms_StartMoving"],true)
                end
            end
        end
    end
end