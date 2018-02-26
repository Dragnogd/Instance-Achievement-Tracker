--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Nighthold Bosses
------------------------------------------------------
core.TheNighthold = {}

------------------------------------------------------
---- Trilliax
------------------------------------------------------
local toxicSliceCounter = 0

------------------------------------------------------
---- Star Augur Etraeus
------------------------------------------------------
local healthPercentageReached = false

------------------------------------------------------
---- Krosus
------------------------------------------------------
local burningEmbersKilled = 0

------------------------------------------------------
---- Gul'dan
------------------------------------------------------
local eyeOfGuldanKilled = 0
local timerStarted = false

------------------------------------------------------
---- High Botanist Tel'arn
------------------------------------------------------
local mysteriousFruitCounter = 0
local mysteriousFruitPlayers = {}


function core.TheNighthold:Skorpyron()
    if core.type == "SPELL_DAMAGE" and core.spellId == 210074 then
        core:getAchievementFailedWithMessageAfter("(" .. core.destName .. ")")
        print(core.destName .. " got hit")
    end
end

function core.TheNighthold:Trilliax()
    if (core.type == "SPELL_AURA_APPLIED" or core.type == "SPELL_AURA_APPLIED_DOSE") and core.spellId == 206798 then
        toxicSliceCounter = toxicSliceCounter + 1
        core:sendMessage(core:getAchievement() .. " Toxic Slice Counter " .. toxicSliceCounter)
    end			

    if toxicSliceCounter >= 20 then
        core:getAchievementFailed()
    end
end

function core.TheNighthold:StarAugurEtraeus()
    --Check if boss has reached phase 3
    if UnitHealth("boss1") / UnitHealthMax("boss") *100 <= 30 then
        healthPercentageReached = true

        if healthPercentageReached == false then
            --print("Health Percentage Reached")
        end
    end

    --Add has died
    if core.type == "UNIT_DIED" and core.destID == "111595" then
        if healthPercentageReached == true then
            core:getAchievementSuccess()
        else
            core:getAchievementFailed()
        end
    end
end

function core.TheNighthold:HighBotanistTelarn()
	if core.type == "UNIT_DIED" and core.unitTypePlayer == "Player" then
		--If the player was holding a parasite then reduce counter by 1
		if mysteriousFruitPlayers[core.spawn_uid_dest_Player] ~= nil then
			mysteriousFruitCounter = mysteriousFruitCounter - 1
			mysteriousFruitPlayers[core.spawn_uid_dest_Player] = nil

			--If achievement had already completed then fail it
			if core.achievementsCompleted[1] == true then
				core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died) DO NOT KILL BOSS!")
				core.achievementsCompleted[1] = false
			end
		end
	end

	--If player is in a group
	if core.groupSize > 1 then
		for i = 1, core.groupSize do
			local unit = nil
			if core.chatType == "PARTY" then
				if i < core.groupSize then
					unit = "party" .. i
				else
					unit = "player"
			end
			elseif core.chatType == "RAID" then
				unit = "raid" .. i
			end
			
			if unit ~= nil then
				local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID(unit));
				if UnitDebuff(unit, GetSpellInfo(220114)) and mysteriousFruitPlayers[spawn_uid_dest] == nil then
					mysteriousFruitCounter = mysteriousFruitCounter + 1
					--core:sendMessage(UnitName(unit) .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
					mysteriousFruitPlayers[spawn_uid_dest] = spawn_uid_dest
				end
			end
		end
	else
		--Player is not in a group
		local unitType, destID, spawn_uid_dest = strsplit("-",UnitGUID("Player"));
		if UnitDebuff("Player", GetSpellInfo(220114)) and mysteriousFruitPlayers[spawn_uid_dest] == nil then
			mysteriousFruitCounter = mysteriousFruitCounter + 1
			--core:sendMessage(UnitName("Player") .. " has got the Zealous Parasite debuff (" .. parasiteCounter .. "/" .. core.groupSize .. ")")
			mysteriousFruitPlayers[spawn_uid_dest] = spawn_uid_dest
		end
	end

	if mysteriousFruitCounter == core.groupSize then
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
	end
end

function core.TheNighthold:Krosus()
    if core.type == "UNIT_DIED" and core.destID == "104262" and core.destFlags ~= 0xa48 then
        --If burning embers were not killed by a player than increment counter by 1
        burningEmbersKilled = burningEmbersKilled + 1
        --print(burningEmbersKilled)
        core:sendMessageDelay(core:getAchievement() .. " Burning Embers Killed (" .. burningEmbersKilled .. "/15)", burningEmbersKilled, 5)
    end
end

function core.TheNighthold:Elisande()
    if core.type == "UNIT_DIED" and core.destID == "108802" then
        core:getAchievementSuccess()
    end
end

function core.TheNighthold:Tichondrius()
    if core.type == "SPELL_DAMAGE" and core.spellId == 213534 then
        core:getAchievementFailedPersonal()
    end
end

function core.TheNighthold:Guldan()
    core:trackMob("105630", "Eye of Gul'dan", 16, "16 Eye of Gul'dan have spawned. AOE them down now", 4, nil, nil)

    if core.type == "UNIT_DIED" and core.destID == "105630" then
        eyeOfGuldanKilled = eyeOfGuldanKilled + 1
        if timerStarted == false and core.mobCounter >= 16 then
            timerStarted = true
            core:sendMessage(core:getAchievement() .. " Timer Started! 3 seconds remaining")
            C_Timer.After(3, function()
                if core.inCombat == true then
                    if eyeOfGuldanKilled >= 16 then
                        core:getAchievementSuccess()
                    else
                        core:sendMessage(core:getAchievement() .. "(" .. eyeOfGuldanKilled .. "/16) Eyes of Gul'dan Killed in time")
                        timerStarted = false
                        eyeOfGuldanKilled = 0
                    end
                end
            end)
        end
    end
end

function core.TheNighthold:ClearVariables()
    ------------------------------------------------------
    ---- Trilliax
    ------------------------------------------------------
    toxicSliceCounter = 0

    ------------------------------------------------------
    ---- Trilliax
    ------------------------------------------------------
    healthPercentageReached = false

    ------------------------------------------------------
    ---- Krosus
    ------------------------------------------------------
    burningEmbersKilled = 0

    ------------------------------------------------------
    ---- Gul'dan
    ------------------------------------------------------
    eyeOfGuldanKilled = 0
    timerStarted = false

    ------------------------------------------------------
    ---- High Botanist Tel'arn
    ------------------------------------------------------
    mysteriousFruitCounter = 0
    mysteriousFruitPlayers = {}
end