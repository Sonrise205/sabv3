local _ = game:GetService("Debris");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v8 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_Main_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Main");
local v11 = {};
v8:RemoteEvent("UseItem").OnClientEvent:Connect(function(v12, v13) --[[ Line: 20 ]]
    -- upvalues: l_Main_0 (copy), l_TweenService_0 (copy)
    if v12 ~= "PaintballHitted" then
        return;
    else
        local v14 = 1;
        local v15 = v13 or math.random(1, 2);
        for _ = v14, v15 do
            local v17 = script:GetChildren()[math.random(#script:GetChildren())]:Clone();
            v17.Parent = l_Main_0;
            v17.Rotation = math.random(360);
            v17.Position = UDim2.new(math.random(10, 90) / 100, 0, math.random(10, 90) / 100, 0);
            v17.ImageColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255));
            task.delay(v13 and 2 or 4, function() --[[ Line: 31 ]]
                -- upvalues: l_TweenService_0 (ref), v17 (copy)
                local v18 = l_TweenService_0:Create(v17, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Size = UDim2.new()
                });
                v18:Play();
                v18.Completed:Wait();
                v17:Destroy();
            end);
        end;
        return;
    end;
end);
return v11;