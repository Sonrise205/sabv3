--!native
local l_Players_0 = game:GetService("Players");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache);
local v4 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v5 = {
    Discord = 0, 
    Facebook = 1, 
    Twitch = 2, 
    YouTube = 3, 
    X = 4, 
    GitHub = 5, 
    Guilded = 6
};
table.freeze(v5);
local v8 = v3.new({
    Callback = function(v6) --[[ Line: 50 ]] --[[ Name: Callback ]]
        -- upvalues: l_Players_0 (copy), l_PolicyService_0 (copy)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v6);
        assert(l_l_Players_0_PlayerByUserId_0, "PlayerNotOnline");
        return l_PolicyService_0:GetPolicyInfoForPlayerAsync(l_l_Players_0_PlayerByUserId_0);
    end, 
    AssertKey = v4.Integer
});
l_Players_0.PlayerRemoving:Connect(function(v9) --[[ Line: 57 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy)
    local l_UserId_0 = v9.UserId;
    task.delay(60, function() --[[ Line: 60 ]]
        -- upvalues: l_Players_0 (ref), l_UserId_0 (copy), v8 (ref)
        if not l_Players_0:GetPlayerByUserId(l_UserId_0) then
            v8:Delete(l_UserId_0);
        end;
    end);
end);
if l_RunService_0:IsServer() then
    l_Players_0.PlayerAdded:Connect(function(v11) --[[ Line: 67 ]]
        -- upvalues: v8 (copy)
        v8:GetAsync(v11.UserId);
    end);
end;
local v19 = {
    ExternalLinkReference = v5, 
    ExternalLinkReferencesToInts = function(v12) --[[ Line: 77 ]] --[[ Name: ExternalLinkReferencesToInts ]]
        -- upvalues: v5 (copy)
        local v13 = {};
        for _, v15 in ipairs(v12) do
            local v16 = v5[v15];
            if v16 then
                table.insert(v13, v16);
            end;
        end;
        return v13;
    end, 
    GetPolicyInfoForPlayerAsync = function(v17, v18) --[[ Line: 90 ]] --[[ Name: GetPolicyInfoForPlayerAsync ]]
        -- upvalues: v4 (copy), v8 (copy)
        v4.Player(v17);
        v4.Optional(v4.Boolean)(v18);
        if v18 then
            return v8:Get(v17.UserId);
        else
            return v8:GetAsync(v17.UserId);
        end;
    end
};
return table.freeze(v19);