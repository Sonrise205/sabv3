local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local _ = require(l_Shared_0.ShakePresets);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Trove);
local v10 = require(l_Packages_0.Net);
local _ = require("../CameraController");
local v12 = v10:RemoteEvent("UseItem");
local _ = v9.new();
local _ = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local _ = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local v16 = {};
v12.OnClientEvent:Connect(function(v17, v18) --[[ Line: 28 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_Lighting_0 (copy)
    if v17 ~= "CandyEffect" then
        return;
    else
        l_CurrentCamera_0.FieldOfView = 20;
        local v19 = script.ColorCorrection:Clone();
        v19.Parent = l_Lighting_0;
        task.delay(v18 or 10, function() --[[ Line: 38 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v19 (copy)
            l_CurrentCamera_0.FieldOfView = 70;
            v19:Destroy();
        end);
        return;
    end;
end);
return v16;