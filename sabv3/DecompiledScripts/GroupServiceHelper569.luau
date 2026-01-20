--!native
local l_Players_0 = game:GetService("Players");
local l_GroupService_0 = game:GetService("GroupService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache);
local v4 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v6 = v3.new({
    Callback = function(v5) --[[ Line: 38 ]] --[[ Name: Callback ]]
        -- upvalues: l_GroupService_0 (copy)
        return l_GroupService_0:GetGroupsAsync(v5);
    end, 
    AssertKey = v4.Integer, 
    MaxAge = 1e999
});
l_Players_0.PlayerRemoving:Connect(function(v7) --[[ Line: 44 ]]
    -- upvalues: l_Players_0 (copy), v6 (copy)
    local l_UserId_0 = v7.UserId;
    task.delay(60, function() --[[ Line: 47 ]]
        -- upvalues: l_Players_0 (ref), l_UserId_0 (copy), v6 (ref)
        if not l_Players_0:GetPlayerByUserId(l_UserId_0) then
            v6:Delete(l_UserId_0);
        end;
    end);
end);
if l_RunService_0:IsServer() then
    l_Players_0.PlayerAdded:Connect(function(v9) --[[ Line: 54 ]]
        -- upvalues: v6 (copy)
        v6:GetAsync(v9.UserId);
    end);
else
    task.spawn(function() --[[ Line: 58 ]]
        -- upvalues: v6 (copy), l_Players_0 (copy)
        v6:GetAsync(l_Players_0.LocalPlayer.UserId);
    end);
end;
local v12 = {
    Cache = v6, 
    GetGroupsAsync = function(v10, v11) --[[ Line: 67 ]] --[[ Name: GetGroupsAsync ]]
        -- upvalues: v4 (copy), v6 (copy)
        v4.Integer(v10);
        v4.Optional(v4.Boolean)(v11);
        if v11 then
            return v6:Get(v10);
        else
            return v6:GetAsync(v10);
        end;
    end
};
return table.freeze(v12);