--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.FastFlags);
local v3 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v4 = v2.Replicated("UserGenerated.ABTestDefaults", v3.Map(v3.String, v3.Any), {});
return table.freeze({
    UpdateRemote = script:WaitForChild("Update"), 
    ABTestDefaults = v4
});