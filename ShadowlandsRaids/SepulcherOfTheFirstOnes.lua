--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Sepulcher of the First Ones
------------------------------------------------------
core._2481 = {}
core._2481.Events = CreateFrame("Frame")

------------------------------------------------------
---- Rygelon
------------------------------------------------------
local heraldOfTheCosmosCounter = 0
local heraldOfTheCosmosUID = {}
local announceRygelonCompleted = false

------------------------------------------------------
---- Prototype Pantheon
------------------------------------------------------

function core._2481:VigilantGuardian()
    --Defeat the Vigilant Guardian after defeating the Depleted Automa in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15381,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Skolex()
    --Defeat Skolex, the Insatiable Ravener after getting it to burrow under and destroy all four Memorial Pylons in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15401) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Xymox()
    --Defeat Xy'mox with all players under the effects of pilfered artifacts in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15398,1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Dausegne()
    --Defeat Dausegne, the Fallen Oracle, while a player is carrying the Afterlife Core in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15397) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:PrototypePantheon()
    --Defeat the Prototype Pantheon after each player has petted 5 Corgis during Wild Stampede in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15400, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Lihuvim()
    --Defeat Lihuvim after synthesizing and defeating a Reaving Automa: Neo in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15419) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:HalondrusTheReclaimer()
    --Defeat Halondrus the Reclaimer after collecting six strange artifacts and defeating their constructs in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15386, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:AnduinWrynn()
    --Defeat Anduin Wrynn after defeating Anduin's Grief in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15399, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:LordsOfDread()
    --Defeat the Lords of Dread after finding and completing one simple task during Infiltration of Dread in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15315) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:Rygelon()
    --Defeat Rygelon with all players under the effects of Herald of the Cosmos in the Sepulcher of the First Ones on Normal Difficulty or higher.

    --Achievement Criteria White
    if core:getBlizzardTrackingStatus(15396, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:TheJailer()
    --Defeat the Jailer after collecting 6 Progenitor Orbs in the Sepulcher of the First Ones on Normal difficulty or higher.

    --Achievement tracker white
    if core:getBlizzardTrackingStatus(15494, 1) == true then
        core:getAchievementSuccess()
    end
end

function core._2481:ClearVariables()
    ------------------------------------------------------
    ---- Rygelon
    ------------------------------------------------------
    heraldOfTheCosmosCounter = 0
    heraldOfTheCosmosUID = {}
    announceRygelonCompleted = false
end