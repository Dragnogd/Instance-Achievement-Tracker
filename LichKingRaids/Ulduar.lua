------------------------------------------------------
---- Ulduar Bosses
------------------------------------------------------

local f = CreateFrame ("Frame")
f:RegisterEvent("UNIT_ENTERED_VEHICLE")
f:RegisterEvent("UNIT_EXITED_VEHICLE")
f:RegisterEvent("CHAT_MSG_MONSTER_YELL")
f:RegisterEvent("UNIT_HEALTH")

------------------------------------------------------
---- Flame Leviathan
------------------------------------------------------
local hardModeActivated =  false
local towerOfFrostFound = false
local towerOfLifeFound = false
local towerOfStormsFound = false
local towerOfFlamesFound = false
local buffCount = 0
local steelforgedDefenderList = {}
local steelforgedDefenderCounter = 0
local steelforgedDefenderCounterKilled = 0
local timerStarted = false

------------------------------------------------------
---- EVENTS
------------------------------------------------------
f:SetScript("OnEvent", function(self, event, ...)
    AchievementTracker_detectGroupType()

	if event == "CHAT_MSG_MONSTER_YELL" then
		local message, sender = select(1,...)

		if string.find(message, "Orbital countermeasures enabled") then
			hardModeActivated = true
		end
    end

    if event == "UNIT_HEALTH" then
		local unitID = select(1,...)

        local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellID, canApplyAura, isBossDebuff, _, nameplateShowAll, timeMod, value1, value2, value3 = UnitBuff(unitID, "Auto-repair")

        if spellID == 62705 and AchievementTracker_achievementFailed == false then
            AchievementTracker_achievementFailed = true
            AchievementTracker_getAchievementFailedWrath(2906,2905)
        end
    end
end)



function Ulduar_FlameLeviathanTrash(spawn_uid, sourceID, type, spawn_uid_dest)
    --Achievements to track for trash
    if AchievementTracker_displayTracked2 == false then
        AchievementTracker_getAchievementsToTrackWrathNew(3098,3097) --Dwarfageddon
        AchievementTracker_getAchievementsToTrackWrathNew(2906,2905) --Unbroken
        AchievementTracker_displayTracked2 = true
    end

    --Dwarfageddon
    if type == "UNIT_DIED" then
        steelforgedDefenderList[spawn_uid_dest] = nil
        steelforgedDefenderCounter = steelforgedDefenderCounter - 1
        if steelforgedDefenderCounter - math.floor(steelforgedDefenderCounter/10)*10 == 0 and timerStarted == false then
            SendChatMessage("[WIP] Steelforged Defenders: " .. steelforgedDefenderCounter,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        end
        steelforgedDefenderCounterKilled = steelforgedDefenderCounterKilled + 1

        if AchievementTracker_achievementCompleted == true and timerStarted == false then
            --Check that the adds were killed in time
            SendChatMessage("[WIP] Timer Started!" ,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
            timerStarted = true
            C_Timer.After(10, function()
                if steelforgedDefenderCounterKilled >= 100 then
                    SendChatMessage("[WIP] COMPLETED! Steelforged Defenders were killed in time (" .. steelforgedDefenderCounterKilled .. "/100)" ,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
                else
                    SendChatMessage("[WIP] FAILED! Steelforged Defenders were not killed in time (" .. steelforgedDefenderCounterKilled .. "/100). This achievement can be attempted again." ,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID) 
                    steelforgedDefenderCounterKilled = 0
                    AchievementTracker_achievementCompleted = false
                    timerStarted = false
                end
            end)
        end
    end
    if sourceID == "33572" and AchievementTracker_achievementCompleted == false then
        if steelforgedDefenderList[spawn_uid] == nil then
            steelforgedDefenderList[spawn_uid] = spawn_uid
            steelforgedDefenderCounter = steelforgedDefenderCounter + 1
            if steelforgedDefenderCounter - math.floor(steelforgedDefenderCounter/10)*10 == 0 then
                SendChatMessage("[WIP] Steelforged Defenders: " .. steelforgedDefenderCounter,AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)            
            end
        end
    end
    if steelforgedDefenderCounter == 100 and AchievementTracker_achievementCompleted == false then
        if(AchievementTracker_playerCount == 25) then
            SendChatMessage("[WIP] "  .. GetAchievementLink(3098) .. " requirements have been met. Adds can now be killed!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        elseif AchievementTracker_playerCount == 10 then
            SendChatMessage("[WIP] " .. GetAchievementLink(3097) .. " requirements have been met. Adds can now be killed!",AchievementTracker_chatType,DEFAULT_CHAT_FRAME.editBox.languageID)
        end
        AchievementTracker_achievementCompleted = true
    end
end

function Ulduar_FlameLeviathan(type, spellId, destID, sourceName)
    ------------------------------------------------------
    ---- Flame Leviathan
    ------------------------------------------------------

    --Achievements to track if hardmode is activated
    if AchievementTracker_displayTracked3 == false then
        AchievementTracker_getAchievementsToTrackWrathNew(2912,2911) --Shutout
        AchievementTracker_getAchievementsToTrackWrathNew(2910,2909) --Take Out Those Turrets
        AchievementTracker_displayTracked3 = true
    end

    --Orbital Defence Achievements
    if hardModeActivated == true then
        if AchievementTracker_displayTracked == false then
            AchievementTracker_getAchievementsToTrackWrathNew(3057,3056) --Orbit-uary
            AchievementTracker_getAchievementsToTrackWrathNew(2917,2915) --Nuked from Orbit
            AchievementTracker_getAchievementsToTrackWrathNew(2918,2913) --Orbital Bombardment
            AchievementTracker_getAchievementsToTrackWrathNew(2916,2914) --Orbital Devastation
            AchievementTracker_displayTracked = true
        end

        for i = 1, 5 do
            if UnitName("boss1") ~= nil then
                local name, realm = UnitName("boss" .. i)
                if UnitBuff("boss1", GetSpellInfo(65077)) and towerOfFrostFound == false then
                    towerOfFrostFound = true
                    buffCount = buffCount  + 1
                elseif UnitBuff("boss1", GetSpellInfo(64482)) and towerOfLifeFound == false then
                    towerOfLifeFound = true
                    buffCount = buffCount  + 1
                elseif UnitBuff("boss1", GetSpellInfo(65076)) and towerOfStormsFound == false then
                    towerOfStormsFound = true
                    buffCount = buffCount  + 1
                elseif UnitBuff("boss1", GetSpellInfo(65075)) and towerOfFlamesFound == false then
                    towerOfFlamesFound = true
                    buffCount = buffCount  + 1
                end
            end
        end


        --print(AchievementTracker_inCombat)
        if AchievementTracker_inCombat then
            if buffCount < 4 and AchievementTracker_achievementFailed == false then
                --1 Achievemnt failed
                AchievementTracker_getAchievementFailedWrath(3057,3056)
                AchievementTracker_achievementFailed = true
            end

            if buffCount < 3 and AchievementTracker_achievementFailed2 == false then
                --2 Achievements failed
                AchievementTracker_getAchievementFailedWrath(2917,2915)
                AchievementTracker_achievementFailed2 = true
            end

            if buffCount < 2 and AchievementTracker_achievementFailed3 == false then
                --3 Achievements failed
                AchievementTracker_getAchievementFailedWrath(2916,2914)
                AchievementTracker_achievementFailed3 = true
            end

            if buffCount < 1 and AchievementTracker_achievementFailed4 == false then
                --4 Achievements failed
                AchievementTracker_getAchievementFailedWrath(2918,2913)
                AchievementTracker_achievementFailed4 = true
            end  
        end 
    end

    --Shutout
    if type == "SPELL_AURA_APPLIED" and AchievementTracker_achievementFailed5 == false then
        print(spellID)
        if spellID == 62475 then
            AchievementTracker_getAchievementFailedWrath(2912,2911)
            AchievementTracker_achievementFailed5 = true
        end
    end

    -- --Take Out Those Turrets
    -- if type == "PARTY_KILL" then
    --     print(destID)
    --     if destID == 33142 then
    --         AchievementTracker_getAchievementSuccessWrathPersonal(2912,2911,sourceName)
    --     end
    -- end
end

function Ulduar_ClearVariables()
    ------------------------------------------------------
    ---- Flame Leviathan
    ------------------------------------------------------
    towerOfFrostFound = false
    towerOfLifeFound = false
    towerOfStormsFound = false
    towerOfFlamesFound = false
    buffCount = 0
    steelforgedDefenderList = {}
    steelforgedDefenderCounter = 0
    steelforgedDefenderCounterKilled = 0
    timerStarted = false

end