local _ = game:GetService("RunService");
local _ = game:GetService("ReplicatedStorage");
local _ = require(script.ABTestTypes);
local v3 = {};
for _, v5 in script.Experiments:GetChildren() do
    if v5:IsA("ModuleScript") then
        local v6 = require(v5);
        local l_RemoteConfig_0 = v6.RemoteConfig;
        if #l_RemoteConfig_0 > 16 then
            warn((("RemoteConfig '%*' is longer than the maximum of 15 characters, skipping '%*' experiment."):format(l_RemoteConfig_0, v5.Name)));
        else
            v3[v5.Name] = v6;
        end;
    end;
end;
return v3;