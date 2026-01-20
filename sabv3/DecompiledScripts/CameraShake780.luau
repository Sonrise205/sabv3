local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Shake);
local v2 = require(l_ReplicatedStorage_0.Packages.Net);
local v3 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
v2:RemoteEvent("CameraShakeService/Shake").OnClientEvent:Connect(function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v5 = v1.new();
    for v6, v7 in pairs(v4) do
        v5[v6] = v7;
    end;
    local _ = v3.BindShakeToCamera(v5, workspace.CurrentCamera);
    v5:Start();
end);