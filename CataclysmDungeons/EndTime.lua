--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- End Time Bosses
------------------------------------------------------
core.EndTime = {}

------------------------------------------------------
---- Echo of Sylvanas
------------------------------------------------------
local risenGhoulCounter = 0

function core.EndTime:EchoOfSylvanas()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 100686 then
        risenGhoulCounter = 0
    end

    if core.type == "PARTY_KILL" and core.destID == "54191" then
        risenGhoulCounter = risenGhoulCounter + 1
    end

    if risenGhoulCounter == 2 then
        core:getAchievementSuccess()
    end
end

function core.EndTime:EchoOfTyrande()
	-- if core.groupSize > 1 then
	-- 	--We are in a group
	-- 	local currentUnit
	-- 	core:detectGroupType()
	-- 	for i = 1, core.groupSize do
	-- 		if core.chatType == "PARTY" then
	-- 			if i < core.groupSize then
	-- 				currentUnit = "party" .. i
	-- 			else
	-- 				currentUnit = "player"				
	-- 			end
	-- 		elseif core.chatType == "RAID" then
	-- 			currentUnit = "raid" .. i
	-- 		end


	-- 	end
	-- else
    --     currentUnit = "player"
        
    --     GetInspectSpecialization()
	-- end
end

function core.EndTime:ClearVariables()
    ------------------------------------------------------
    ---- Echo of Sylvanas
    ------------------------------------------------------
    risenGhoulCounter = 0
end