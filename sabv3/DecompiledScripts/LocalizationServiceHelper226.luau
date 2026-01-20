--!native
local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Cache);
local v5 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v8 = v4.new({
    Callback = function(v6) --[[ Line: 29 ]] --[[ Name: Callback ]]
        -- upvalues: l_Players_0 (copy), l_LocalizationService_0 (copy)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v6);
        assert(l_l_Players_0_PlayerByUserId_0, "PlayerNotOnline");
        return l_LocalizationService_0:GetCountryRegionForPlayerAsync(l_l_Players_0_PlayerByUserId_0);
    end, 
    AssertKey = v5.Integer
});
l_Players_0.PlayerRemoving:Connect(function(v9) --[[ Line: 36 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy)
    local l_UserId_0 = v9.UserId;
    task.delay(60, function() --[[ Line: 39 ]]
        -- upvalues: l_Players_0 (ref), l_UserId_0 (copy), v8 (ref)
        if not l_Players_0:GetPlayerByUserId(l_UserId_0) then
            v8:Delete(l_UserId_0);
        end;
    end);
end);
if l_RunService_0:IsServer() then
    l_Players_0.PlayerAdded:Connect(function(v11) --[[ Line: 46 ]]
        -- upvalues: v8 (copy)
        v8:GetAsync(v11.UserId);
    end);
else
    task.spawn(function() --[[ Line: 50 ]]
        -- upvalues: v8 (copy), l_Players_0 (copy)
        v8:GetAsync(l_Players_0.LocalPlayer.UserId);
    end);
end;
local v14 = {
    GetCountryRegionForPlayerAsync = function(v12, v13) --[[ Line: 57 ]] --[[ Name: GetCountryRegionForPlayerAsync ]]
        -- upvalues: v5 (copy), v8 (copy)
        v5.Player(v12);
        v5.Optional(v5.Boolean)(v13);
        if v13 then
            return v8:Get(v12.UserId);
        else
            return v8:GetAsync(v12.UserId);
        end;
    end
};
return table.freeze(v14);