--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Ulduar Bosses
------------------------------------------------------
core.Ulduar = {}
core.Ulduar.Events = CreateFrame("Frame")

------------------------------------------------------
---- Dwarfageddon
------------------------------------------------------
local steelforgedDefenderUID = {}
local steelforgedDefenderCounter = 0
local steelforgedDefenderKilled = 0
local timerStarted = false
local steelforgedDefenderAnnounced = false

------------------------------------------------------
---- Unbroken
------------------------------------------------------
local repairedAnnounced = false


function core.Ulduar:Dwarfageddon()
    --Add killed
    if core.type == "UNIT_DIED" then
        steelforgedDefenderUID[core.spawn_uid_dest] = nil
        steelforgedDefenderCounter = steelforgedDefenderCounter - 1

        --Only start the timer if enough adds have been collected.
        if steelforgedDefenderAnnounced == true then
            steelforgedDefenderKilled = steelforgedDefenderKilled + 1
            if timerStarted == false then
                timerStarted = true
                core:sendMessage("Timer Started! 10 seconds remaining" ,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
                C_Timer.After(10, function()
                    if steelforgedDefenderKilled >= 100 then
                        core:sendMessage(core:getAchievement() .. " COMPLETED! Steelforged Defenders were killed in time (" .. steelforgedDefenderKilled .. "/100)") 
                    else
                        core:sendMessage(core.getAchievement() .. " FAILED! Steelforged Defenders were not killed in time (" .. steelforgedDefenderKilled .. "/100). This achievement can be attempted again.")
                        steelforgedDefenderKilled = 0
                        timerStarted = false
                        steelforgedDefenderAnnounced = false
                    end
                end)
            end
        end
    end

    --Add detected
    if core.sourceID == "33572" and steelforgedDefenderCounter <= 100 and steelforgedDefenderAnnounced == false then
        if steelforgedDefenderUID[core.spawn_uid] == nil then
            steelforgedDefenderUID[core.spawn_uid] = core.spawn_uid
            steelforgedDefenderCounter = steelforgedDefenderCounter + 1
            core:sendMessageDelay("Steelforged Defender Counter (" .. steelforgedDefenderCounter .. "/100)",steelforgedDefenderCounter,10)
        end
    end
    if core.destID == "33572" and steelforgedDefenderCounter <= 100 and steelforgedDefenderAnnounced == false then
        if steelforgedDefenderUID[core.spawn_uid_dest] == nil then
            steelforgedDefenderUID[core.spawn_uid_dest] = core.spawn_uid_dest
            steelforgedDefenderCounter = steelforgedDefenderCounter + 1
            core:sendMessageDelay("Steelforged Defender Counter (" .. steelforgedDefenderCounter .. "/100)",steelforgedDefenderCounter,10)
        end
    end

    --Requirements Met
    if steelforgedDefenderCounter >= 100 and steelforgedDefenderAnnounced == false then
        steelforgedDefenderAnnounced = true
        if core.difficultyID == 4 then
            core:sendMessage("[WIP] "  .. core:getAchievement() .. " requirements have been met. Adds can now be killed!")
        elseif core.difficultyID == 3 then
            core:sendMessage("[WIP] " .. core:getAchievement() .. " requirements have been met. Adds can now be killed!")
        end
    end
end


function core.Ulduar:ClearVariables()
end

function core.Ulduar:InitialSetup()
    print("Setting up Ulduar")
    core.Ulduar.Events:RegisterEvent("UNIT_AURA")
end

core.Ulduar.Events:SetScript("OnEvent", function(self, event, ...)
    return self[event] and self[event](self, event, ...)
end)

function core.Ulduar.Events:UNIT_AURA(self, unitID, ...)
    if UnitBuff(unitID, GetSpellInfo(62705)) ~= nil and repairedAnnounced == false then
        core:sendMessage(GetAchievementLink(2905) .. " FAILED! A player has repaired their vechile")
        repairedAnnounced = true
    end
end

























-- 
-- f:RegisterEvent("UNIT_ENTERED_VEHICLE")
-- f:RegisterEvent("UNIT_EXITED_VEHICLE")
-- f:RegisterEvent("CHAT_MSG_MONSTER_YELL")
-- f:RegisterEvent("UNIT_HEALTH")

-- ------------------------------------------------------
-- ---- Flame Leviathan
-- ------------------------------------------------------
-- local hardModeActivated =  false
-- local towerOfFrostFound = false
-- local towerOfLifeFound = false
-- local towerOfStormsFound = false
-- local towerOfFlamesFound = false
-- local buffCount = 0


-- ------------------------------------------------------
-- ---- EVENTS
-- ------------------------------------------------------
-- f:SetScript("OnEvent", function(self, event, ...)

-- 	if event == "CHAT_MSG_MONSTER_YELL" then
-- 		local message, sender = select(1,...)

-- 		if string.find(message, "Orbital countermeasures enabled") then
-- 			hardModeActivated = true
-- 		end
--     end


-- end)


-- function Ulduar_FlameLeviathan(type, spellId, destID, sourceName)
--     ------------------------------------------------------
--     ---- Flame Leviathan
--     ------------------------------------------------------

--     --Achievements to track if hardmode is activated
--     if AchievementTracker_displayTracked3 == false then
--         AchievementTracker_getAchievementsToTrackWrathNew(2912,2911) --Shutout
--         AchievementTracker_getAchievementsToTrackWrathNew(2910,2909) --Take Out Those Turrets
--         AchievementTracker_displayTracked3 = true
--     end

--     --Orbital Defence Achievements
--     if hardModeActivated == true then
--         if AchievementTracker_displayTracked == false then
--             AchievementTracker_getAchievementsToTrackWrathNew(3057,3056) --Orbit-uary
--             AchievementTracker_getAchievementsToTrackWrathNew(2917,2915) --Nuked from Orbit
--             AchievementTracker_getAchievementsToTrackWrathNew(2918,2913) --Orbital Bombardment
--             AchievementTracker_getAchievementsToTrackWrathNew(2916,2914) --Orbital Devastation
--             AchievementTracker_displayTracked = true
--         end

--         for i = 1, 5 do
--             if UnitName("boss1") ~= nil then
--                 local name, realm = UnitName("boss" .. i)
--                 if UnitBuff("boss1", GetSpellInfo(65077)) and towerOfFrostFound == false then
--                     towerOfFrostFound = true
--                     buffCount = buffCount  + 1
--                 elseif UnitBuff("boss1", GetSpellInfo(64482)) and towerOfLifeFound == false then
--                     towerOfLifeFound = true
--                     buffCount = buffCount  + 1
--                 elseif UnitBuff("boss1", GetSpellInfo(65076)) and towerOfStormsFound == false then
--                     towerOfStormsFound = true
--                     buffCount = buffCount  + 1
--                 elseif UnitBuff("boss1", GetSpellInfo(65075)) and towerOfFlamesFound == false then
--                     towerOfFlamesFound = true
--                     buffCount = buffCount  + 1
--                 end
--             end
--         end


--         --print(AchievementTracker_inCombat)
--         if AchievementTracker_inCombat then
--             if buffCount < 4 and AchievementTracker_achievementFailed == false then
--                 --1 Achievemnt failed
--                 AchievementTracker_getAchievementFailedWrath(3057,3056)
--                 AchievementTracker_achievementFailed = true
--             end

--             if buffCount < 3 and AchievementTracker_achievementFailed2 == false then
--                 --2 Achievements failed
--                 AchievementTracker_getAchievementFailedWrath(2917,2915)
--                 AchievementTracker_achievementFailed2 = true
--             end

--             if buffCount < 2 and AchievementTracker_achievementFailed3 == false then
--                 --3 Achievements failed
--                 AchievementTracker_getAchievementFailedWrath(2916,2914)
--                 AchievementTracker_achievementFailed3 = true
--             end

--             if buffCount < 1 and AchievementTracker_achievementFailed4 == false then
--                 --4 Achievements failed
--                 AchievementTracker_getAchievementFailedWrath(2918,2913)
--                 AchievementTracker_achievementFailed4 = true
--             end  
--         end 
--     end

--     --Shutout
--     if type == "SPELL_AURA_APPLIED" and AchievementTracker_achievementFailed5 == false then
--         print(spellID)
--         if spellID == 62475 then
--             AchievementTracker_getAchievementFailedWrath(2912,2911)
--             AchievementTracker_achievementFailed5 = true
--         end
--     end

--     -- --Take Out Those Turrets
--     -- if type == "PARTY_KILL" then
--     --     print(destID)
--     --     if destID == 33142 then
--     --         AchievementTracker_getAchievementSuccessWrathPersonal(2912,2911,sourceName)
--     --     end
--     -- end
-- end

-- function Ulduar_ClearVariables()
--     ------------------------------------------------------
--     ---- Flame Leviathan
--     ------------------------------------------------------
--     towerOfFrostFound = false
--     towerOfLifeFound = false
--     towerOfStormsFound = false
--     towerOfFlamesFound = false
--     buffCount = 0
--     steelforgedDefenderUID = {}
--     steelforgedDefenderCounter = 0
--     steelforgedDefenderKilled = 0
--     timerStarted = false

-- end