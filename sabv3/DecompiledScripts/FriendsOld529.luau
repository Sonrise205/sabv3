local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v3 = require(l_Packages_0.Signal);
local v4 = {};
local v5 = {
    OnFriendsUpdate = v3.new()
};
local function _(v6, v7) --[[ Line: 17 ]] --[[ Name: SafeIsFriends ]]
    -- upvalues: l_Players_0 (copy)
    if not v6 or not v6:IsDescendantOf(l_Players_0) then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
            -- upvalues: v6 (copy), v7 (copy)
            return v6:IsFriendsWith(v7);
        end);
        return l_status_0 and l_result_0;
    end;
end;
local function v22() --[[ Line: 27 ]] --[[ Name: RefreshFriends ]]
    -- upvalues: v4 (copy), l_Players_0 (copy), v5 (copy)
    for _, v12 in pairs(v4) do
        table.clear(v12);
    end;
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    for v14 = 1, #l_l_Players_0_Players_0 - 1 do
        local v15 = l_l_Players_0_Players_0[v14];
        for v16 = v14 + 1, #l_l_Players_0_Players_0 do
            local v17 = l_l_Players_0_Players_0[v16];
            local l_UserId_0 = v17.UserId;
            local v19;
            if not v15 or not v15:IsDescendantOf(l_Players_0) then
                v19 = false;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 21 ]]
                    -- upvalues: v15 (copy), l_UserId_0 (copy)
                    return v15:IsFriendsWith(l_UserId_0);
                end);
                v19 = l_status_1 and l_result_1;
            end;
            if v19 then
                v4[v15] = v4[v15] or {};
                v4[v17] = v4[v17] or {};
                table.insert(v4[v15], v17);
                table.insert(v4[v17], v15);
            end;
        end;
    end;
    v5.OnFriendsUpdate:Fire();
end;
local function v24(_) --[[ Line: 48 ]] --[[ Name: OnPlayerAdded ]]
    -- upvalues: v22 (copy)
    v22();
end;
local function v26(_) --[[ Line: 52 ]] --[[ Name: OnPlayerRemoving ]]
    -- upvalues: v22 (copy)
    v22();
end;
v5.GetFriendBoostPercentage = function(_, v28) --[[ Line: 58 ]] --[[ Name: GetFriendBoostPercentage ]]
    -- upvalues: v5 (copy)
    if not v28 then
        return 0;
    else
        return math.clamp(v5:GetAmountOfFriendsOnline(v28), 0, 3) * 10;
    end;
end;
v5.GetFriendBoostModifier = function(_, v30) --[[ Line: 63 ]] --[[ Name: GetFriendBoostModifier ]]
    -- upvalues: v5 (copy)
    if not v30 then
        return 0;
    else
        return math.clamp(v5:GetAmountOfFriendsOnline(v30), 0, 3) / 10;
    end;
end;
v5.GetAmountOfFriendsOnline = function(_, v32) --[[ Line: 68 ]] --[[ Name: GetAmountOfFriendsOnline ]]
    -- upvalues: v4 (copy)
    local v33 = v4[v32];
    return v33 and #v33 or 0;
end;
v5.GetInGameFriends = function(_, v35) --[[ Line: 73 ]] --[[ Name: GetInGameFriends ]]
    -- upvalues: v4 (copy)
    return v4[v35] or {};
end;
v5.Start = function(_) --[[ Line: 77 ]] --[[ Name: Start ]]
    -- upvalues: l_Players_0 (copy), v24 (copy), v26 (copy), v22 (copy)
    l_Players_0.PlayerAdded:Connect(v24);
    l_Players_0.PlayerRemoving:Connect(v26);
    v22();
    task.spawn(function() --[[ Line: 83 ]]
        -- upvalues: v22 (ref)
        while true do
            task.wait(20);
            v22();
        end;
    end);
end;
v5:Start();
return v5;