--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

------------------------------------------------------
---- Trial of Valor Bosses
------------------------------------------------------
core.TrialOfValor = {}

------------------------------------------------------
---- Helya
------------------------------------------------------
local fetidNames = {}
local fetidcount = 0

function core.TrialOfValor:Helya()
    if core.type == "SPELL_AURA_APPLIED" and core.spellId == 193367 then
        if fetidNames[core.destName] == nil then
            fetidNames[core.destName] = core.destName
            fetidcount = fetidcount + 1
            --core:sendMessage(core.destName .. " Gained Fetid Rot (" .. fetidcount .. "/" .. core.groupSize .. ")")
        end
    end

    if core.groupSize == (fetidcount - 1) then
        core:getAchievementSuccess()
    end

    if core.type == "SPELL_AURA_REMOVED" and core.spellId == 193367 then
        if fetidNames[core.destName] ~= nil then
            fetidNames[core.destName] = nil
            fetidcount = fetidcount - 1
            --core:sendMessage(core.destName .. " Lost Fetid Rot (" .. fetidcount .. "/" .. core.groupSize .. ")")
        end
    end  
end

function core.TrialOfValor:ClearVariables()
    ------------------------------------------------------
    ---- Helya
    ------------------------------------------------------
    fetidNames = {}
    fetidcount = 0
end