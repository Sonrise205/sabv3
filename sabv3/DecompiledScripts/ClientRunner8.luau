local v0 = require(game.ReplicatedStorage.UserGenerated.FastFlags);
local v1 = require(script.Parent);
local v2 = v0.Replicated("UserGenerated.Logging.ClientLevel", v1.AssertLevel, "Warn");
v1.SetLevel(v2:Get());
v2.Changed:Connect(function(v3) --[[ Line: 27 ]]
    -- upvalues: v1 (copy)
    v1.SetLevel(v3);
end);