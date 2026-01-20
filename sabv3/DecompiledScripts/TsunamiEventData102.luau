local l_TsunamiSpawnPart_0 = script.TsunamiSpawnPart;
local function v2(v1) --[[ Line: 8 ]] --[[ Name: getExtraSpeed ]]
    return v1;
end;
local function v4(v3) --[[ Line: 13 ]] --[[ Name: getTotalSpeed ]]
    return 20 + v3;
end;
local function v7(v5, v6) --[[ Line: 17 ]] --[[ Name: getUpgradeCost ]]
    return (math.max(math.floor(1.1525 ^ (v5 + v6) * 1000), 1));
end;
local l_Rotation_0 = l_TsunamiSpawnPart_0:GetPivot().Rotation;
return {
    tsunamiSpawnPart = l_TsunamiSpawnPart_0, 
    initialUpgradeCost = 1000, 
    initialSpeed = 20, 
    getUpgradeCost = v7, 
    getTotalSpeed = v4, 
    getExtraSpeed = v2, 
    upgrades = {
        1, 
        5, 
        10
    }, 
    getTsunamiPositionAtTime = function(v9, v10) --[[ Line: 22 ]] --[[ Name: getTsunamiPositionAtTime ]]
        -- upvalues: l_Rotation_0 (copy)
        local v11 = v9.despawnsAt - v9.spawnedAt;
        return CFrame.new(v9.initialPosition + Vector3.new(0, 0, v9.distance * math.clamp((v10 - v9.spawnedAt) / v11, 0, 1))) * l_Rotation_0;
    end
};