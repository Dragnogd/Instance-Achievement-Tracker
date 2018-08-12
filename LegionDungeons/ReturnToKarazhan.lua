--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Return To Karazhan Bosses
------------------------------------------------------
core._1651 = {}

------------------------------------------------------
---- Shade of Medivh
------------------------------------------------------
local paranoidCounter = 0
local paranoidPlayers = {}

function core._1651:ShadeOfMedivh()
    --Defeat the Shade of Medivh while all party members have Paranoid on Mythic difficulty in Return to Karazhan

    --On pull check who in the group has the debuff

    if core.type == "UNIT_DIED" and core.destID ~= nil then
        local name, realm = strsplit("-", core.destID)
        if UnitIsPlayer(name) then
            --If the player was holding a parasite then reduce counter by 1
            if paranoidPlayers[core.spawn_uid_dest_Player] ~= nil then
                paranoidCounter = paranoidCounter - 1
                paranoidPlayers[core.spawn_uid_dest_Player] = nil

                --If achievement had already completed then fail it
                if core.achievementsCompleted[1] == true then
                    core:getAchievementFailedWithMessageAfter("(Reason: " .. core.destName .. " has died) DO NOT KILL BOSS!")
                    core.achievementsCompleted[1] = false
                end
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
                for i=1,40 do
					local _, _, _, _, _, _, _, _, _, spellId = UnitDebuff(unit, i)
					if spellId == 232658 and paranoidPlayers[spawn_uid_dest] == nil then
                        paranoidCounter = paranoidCounter + 1
                        core:sendMessage(UnitName(unit) .. " has got the Paranoid debuff (" .. parasiteCounter .. "/5)")
                        paranoidPlayers[spawn_uid_dest] = spawn_uid_dest
					end
				end
			end
		end
    end

	if paranoidCounter == 5 then --Can only be earned in a group of 5 players
        core:getAchievementSuccess()
        core.achievementsFailed[1] = false
	end
end

function core._1651:ClearVariables()
    paranoidCounter = 0
    paranoidPlayers = {}
end