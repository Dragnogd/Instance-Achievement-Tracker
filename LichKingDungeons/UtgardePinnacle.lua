--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Utgarde Pinnacle Bosses
------------------------------------------------------
core._575 = {}
core._575.Events = CreateFrame("Frame")

------------------------------------------------------
---- Skadi the Ruthless
------------------------------------------------------
local timer
local harpoonRange = false
local harpoonFired = false

function core._575:SvalaSorrowgrave()
    --TODO: have another look at this one. Not working
    -- if (core.type == "SPELL_PERIODIC_DAMAGE" or core.type == "SPELL_DAMAGE") and core.destID == "26555" and core.spellId == 59930 and core.overkill > 0 then
    --     core:getAchievementSuccess()
    -- end
end

function core._575:SkadiTheRuthless()
    core:getAchievementToTrack()
end

function core._575:KingYmiron()
    if (core.type == "SPELL_DAMAGE" or core.type == "SPELL_MISSED") and (core.spellId == 48295 or core.spellId == 59302) then
        --print("Failed")
        core:getAchievementFailed()
    end
end

function core._575:ClearVariables()
    ------------------------------------------------------
    ---- Skadi the Ruthless
    ------------------------------------------------------
    if timer ~= nil then
        --print("Timer Cancelled")
        timer:Cancel()
    end
end

function core._575:InstanceCleanup()
    core._575.Events:UnregisterEvent("CHAT_MSG_MONSTER_YELL")
end

function core._575:InitialSetup()
    core._575.Events:RegisterEvent("CHAT_MSG_MONSTER_YELL")
    --core._575.Events:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
    --core._575.Events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
end

core._575.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core._575.Events:CHAT_MSG_MONSTER_YELL(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, ...)
    if string.match(message, "What mongrels dare intrude here") then
        timer = C_Timer.NewTimer(180, function() 
            core:getAchievementFailed()
        end)
    end
end

function core._575.Events:CHAT_MSG_RAID_BOSS_EMOTE(self, message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, ...)
    -- print(message)

    --If boss is in range of harpoons
    --If player launches harpoon
    --If boss comes down before next message
    --Complete achievement

    -- if string.match(message, "range of the harpoon launchers!") then
    --     harpoonRange = true
    -- end

    -- if string.match(message, "takes a deep breath") and harpoonFired == true then
    --     core:getAchievementFailed()
    -- end
end

function core._575.Events:UNIT_SPELLCAST_SUCCEEDED(self, unitID, lineID, spellID, ...)
    -- if spell == "Summon Harpoon" and harpoonRange == true then
    --     harpoonFired = true
    -- end
end

