--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L
local HBD = LibStub("HereBeDragons-2.0")

core.Navigation = {}
core.Navigation.Waypoints = {}
core.Navigation.ActiveWaypoint = nil
core.Navigation.DistanceTicker = nil
core.Navigation.ArriveDistance = 50


--------------------------------------
-- Helpers
--------------------------------------

-- Check if two maps are on the same continent
-- Used for coarse zone-to-zone distance comparison only
local function AreMapsOnSameContinent(mapA, mapB)
    local infoA = C_Map.GetMapInfo(mapA)
    local infoB = C_Map.GetMapInfo(mapB)

    return infoA and infoB and infoA.parentMapID == infoB.parentMapID
end


--------------------------------------
-- Main Route Logic
--------------------------------------

function core.Navigation:PlotRoute()
    if #core.Navigation.Waypoints == 0 then
        print("No waypoints to plot.")
        self.ActiveWaypoint = nil
        return
    end

    local nextWP = self:FindNextWaypoint()
    if not nextWP then return end

    -- Set active waypoint
    self.ActiveWaypoint = nextWP

    -- Set the next waypoint on the tracker
    self:SetNextWaypoint(nextWP)

    -- Start distance ticker to update distance to next waypoint
    self:StartDistanceTicker(nextWP)
end


--------------------------------------
-- Waypoint Selection
--------------------------------------

function core.Navigation:FindNextWaypoint()
    -- Get the map ID for the player's current zone
    local playerMap = C_Map.GetBestMapForUnit("player")
    if not playerMap then return nil end

    -- Group waypoints by map
    local byMap = {}
    for _, wp in ipairs(self.Waypoints) do
        byMap[wp.mapID] = byMap[wp.mapID] or {}
        table.insert(byMap[wp.mapID], wp)
    end

    -- 1) Prefer waypoints in the current player zone
    if byMap[playerMap] then
        return self:FindNearestWaypointInMap(playerMap, byMap[playerMap])
    end

    -- 2) No waypoints in current zone
    -- Try to find the nearest zone on the same continent
    local bestMap, bestDist = nil, math.huge

    local px, py = C_Map.GetPlayerMapPosition(playerMap, "player")
    if px then
        for mapID, wps in pairs(byMap) do
            -- Only compare zones on the same continent
            if AreMapsOnSameContinent(playerMap, mapID) then
                -- Use the first waypoint in the zone as a representative point
                local wp = wps[1]

                -- Coarse zone distance (valid across zones on same continent)
                local dist = HBD:GetZoneDistance(
                    playerMap, px, py,
                    mapID, wp.x / 100, wp.y / 100
                )

                if dist and dist < bestDist then
                    bestDist = dist
                    bestMap = mapID
                end
            end
        end
    end

    if bestMap then
        return self:FindNearestWaypointInMap(bestMap, byMap[bestMap])
    end

    -- 3) Fallback
    -- No distance comparison possible, just pick any remaining zone
    for mapID, wps in pairs(byMap) do
        return self:FindNearestWaypointInMap(mapID, wps)
    end

    return nil
end


--------------------------------------
-- Distance Logic (Per Map Only)
--------------------------------------

function core.Navigation:FindNearestWaypointInMap(mapID, waypoints)
    -- Get player position in world space
    local px, py, pInstance = HBD:GetPlayerWorldPosition()
    if not px then return nil end

    local nearest, minDist = nil, math.huge

    for _, wp in ipairs(waypoints) do
        -- Convert waypoint coordinates to world coordinates
        local wx, wy, wInstance = HBD:GetWorldCoordinatesFromZone(
            wp.x / 100,
            wp.y / 100,
            mapID
        )

        -- World distance is only valid within the same instance
        if wx and wInstance == pInstance then
            local dist = HBD:GetWorldDistance(pInstance, px, py, wx, wy)
            if dist and dist < minDist then
                minDist = dist
                nearest = wp
            end
        end
    end

    -- If we cannot measure distance (teleport, phase, etc),
    -- just return the first waypoint in the zone
    return nearest or waypoints[1]
end


--------------------------------------
-- Waypoint / Arrow Handling
--------------------------------------

function core.Navigation:SetNextWaypoint(wp)
    if not wp then return end

    local x = wp.x / 100
    local y = wp.y / 100

    -- Validate range
    if x <= 0 or x >= 1 or y <= 0 or y >= 1 then return end
    if not wp.mapID then return end

    -- Create the waypoint
    local point = UiMapPoint.CreateFromCoordinates(wp.mapID, x, y)
    C_Map.SetUserWaypoint(point)

    -- Force arrow / supertracking
    C_SuperTrack.SetSuperTrackedUserWaypoint(true)

    -- Update UI
    local info = C_Map.GetMapInfo(wp.mapID)
    core.InfoFramev2.UI.Navigation.NextStopName:SetText(
        (info and info.name or "Unknown Location") ..
        " - " ..
        (wp.title or "Unknown Criteria")
    )
end


--------------------------------------
-- Distance Ticker
--------------------------------------

function core.Navigation:StartDistanceTicker(wp)
    if not wp then return end

    -- Kill existing ticker
    if self.DistanceTicker then
        self.DistanceTicker:Cancel()
        self.DistanceTicker = nil
    end

    self.DistanceTicker = C_Timer.NewTicker(1, function()
        local px, py, pInstance = HBD:GetPlayerWorldPosition()
        if not px then return end

        local wx, wy, wInstance = HBD:GetWorldCoordinatesFromZone(
            wp.x / 100,
            wp.y / 100,
            wp.mapID
        )

        -- If we can't calculate world distance yet (wrong zone),
        -- just show a generic travel state
        if not wx or wInstance ~= pInstance then
            core.InfoFramev2.UI.Navigation.NextStopDistanceETA:SetText("Travel")
            return
        end

        local dist = HBD:GetWorldDistance(pInstance, px, py, wx, wy)
        if not dist then return end

        -- Round to nearest whole number
        local yards = math.floor(dist + 0.5)
        core.InfoFramev2.UI.Navigation.NextStopDistanceETA:SetText(yards .. " yards")

        -- Arrival check
        if yards <= self.ArriveDistance then
            self:OnArriveAtWaypoint(wp)
        end
    end)
end


--------------------------------------
-- Arrival Handling
--------------------------------------

function core.Navigation:OnArriveAtWaypoint(wp)
    -- Stop ticker
    if self.DistanceTicker then
        self.DistanceTicker:Cancel()
        self.DistanceTicker = nil
    end

    core.InfoFramev2.UI.Navigation.NextStopDistanceETA:SetText("Arrived")

    -- Mark waypoint as active / waiting
    self.ActiveWaypoint = wp

    -- DO NOT auto-advance here
    -- Criteria completion should trigger PlotRoute() again

    -- For Debug Purposes we auto advance at 50 yards or less
    -- Remove the criteria from the list then plot the route again
    for i, waypoint in ipairs(self.Waypoints) do
        if waypoint == wp then
            table.remove(self.Waypoints, i)
            break
        end
    end

    self:PlotRoute()
end
