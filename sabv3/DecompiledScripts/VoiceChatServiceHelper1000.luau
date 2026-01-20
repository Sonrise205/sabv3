--!native
local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local v2 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache);
local v3 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v5 = v2.new({
    Callback = function(v4) --[[ Line: 27 ]] --[[ Name: Callback ]]
        -- upvalues: l_VoiceChatService_0 (copy)
        return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(v4);
    end, 
    AssertKey = v3.Integer, 
    MaxAge = 1e999
});
l_Players_0.PlayerRemoving:Connect(function(v6) --[[ Line: 34 ]]
    -- upvalues: l_Players_0 (copy), v5 (copy)
    local l_UserId_0 = v6.UserId;
    task.delay(60, function() --[[ Line: 37 ]]
        -- upvalues: l_Players_0 (ref), l_UserId_0 (copy), v5 (ref)
        if not l_Players_0:GetPlayerByUserId(l_UserId_0) then
            v5:Delete(l_UserId_0);
        end;
    end);
end);
task.spawn(function() --[[ Line: 43 ]]
    -- upvalues: v5 (copy), l_Players_0 (copy)
    v5:GetAsync(l_Players_0.LocalPlayer.UserId);
end);
local v10 = {
    IsVoiceEnabledForUserIdAsync = function(v8, v9) --[[ Line: 49 ]] --[[ Name: IsVoiceEnabledForUserIdAsync ]]
        -- upvalues: v3 (copy), v5 (copy)
        v3.Integer(v8);
        v3.Optional(v3.Boolean)(v9);
        if v9 then
            return v5:Get(v8);
        else
            return v5:GetAsync(v8);
        end;
    end
};
return table.freeze(v10);