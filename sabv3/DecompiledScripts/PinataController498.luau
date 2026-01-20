local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
local v5 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v6 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v7 = require(l_ReplicatedStorage_0.Packages.Net);
local v8 = require(l_ReplicatedStorage_0.Shared.VFX);
local v9 = v7:RemoteEvent("PinataService/DestroyGear");
local v10 = v7:RemoteEvent("PinataService/SpawnGear");
local v11 = v7:RemoteEvent("PinataService/PickGear");
local v12 = v7:RemoteEvent("PinataService/Blink");
local v13 = v7:RemoteEvent("PinataService/Burst");
local v14 = v7:RemoteEvent("PinataService/Hit");
local v15 = RaycastParams.new();
v15.FilterType = Enum.RaycastFilterType.Include;
v15.FilterDescendantsInstances = {
    workspace.Map, 
    workspace.Plots
};
return {
    Start = function(_) --[[ Line: 26 ]] --[[ Name: Start ]]
        -- upvalues: l_ContentProvider_0 (copy), v12 (copy), v5 (copy), v13 (copy), v8 (copy), l_Debris_0 (copy), v14 (copy), v10 (copy), v15 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v6 (copy), v11 (copy), v9 (copy)
        task.spawn(pcall, l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, script:GetChildren());
        v12.OnClientEvent:Connect(function() --[[ Line: 29 ]]
            -- upvalues: v5 (ref)
            v5:Activate("Blink");
        end);
        v13.OnClientEvent:Connect(function(v17) --[[ Line: 33 ]]
            -- upvalues: v5 (ref), v8 (ref), l_Debris_0 (ref)
            v5:Activate("Blink");
            local v18 = script.Burst:Clone();
            v18.Position = v17;
            v18.Parent = workspace;
            v8.emit(v18);
            l_Debris_0:AddItem(v18, 7);
        end);
        v14.OnClientEvent:Connect(function(v19) --[[ Line: 45 ]]
            -- upvalues: v8 (ref), l_Debris_0 (ref)
            local v20 = script.Hit:Clone();
            v20.Position = v19;
            v20.Parent = workspace;
            v8.emit(v20);
            l_Debris_0:AddItem(v20, 7);
        end);
        local v21 = {};
        v10.OnClientEvent:Connect(function(v22, v23, v24, v25, v26, v27) --[[ Line: 57 ]]
            -- upvalues: v21 (copy), v15 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v6 (ref), v11 (ref)
            local v28 = script.GearVisuals[v23]:Clone();
            v28.Name = v22;
            v21[v22] = v28;
            local v29 = v28.PrimaryPart or v28:FindFirstChild("Handle");
            if v29 then
                v29.Anchored = true;
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Name = "Attachment0";
                l_Attachment_0.Position = Vector3.new(0, 1, 0, 0);
                l_Attachment_0.Parent = v29;
                local l_Attachment_1 = Instance.new("Attachment");
                l_Attachment_1.Name = "Attachment1";
                l_Attachment_1.Position = Vector3.new(0, -1, 0, 0);
                l_Attachment_1.Parent = v29;
                local l_Trail_0 = Instance.new("Trail");
                l_Trail_0.Name = "Trail";
                l_Trail_0.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 248)), 
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 255, 243))
                });
                l_Trail_0.Attachment0 = l_Attachment_0;
                l_Trail_0.Attachment1 = l_Attachment_1;
                l_Trail_0.Lifetime = 0.35;
                l_Trail_0.LightInfluence = 1;
                l_Trail_0.Parent = v28;
            end;
            v28.Parent = workspace;
            local l_ProximityPrompt_0 = Instance.new("ProximityPrompt");
            l_ProximityPrompt_0.Name = "ProximityPrompt";
            l_ProximityPrompt_0.ActionText = "Grab";
            l_ProximityPrompt_0.RequiresLineOfSight = false;
            l_ProximityPrompt_0.Enabled = false;
            l_ProximityPrompt_0.Parent = v29;
            local l_v28_Scale_0 = v28:GetScale();
            local v35 = workspace:Raycast(v25 + Vector3.new(0, 10, 0, 0), Vector3.new(-0, -30, -0, -0), v15);
            v25 = v35 and v35.Position or v25;
            local v36 = v24 + (v25 - v24) * 0.6 + Vector3.new(0, (v25 - v24).Magnitude, 0);
            local v37 = v25 + Vector3.new(0, v28:GetExtentsSize().Y * 0.5, 0);
            local v38 = math.random(0, 10000);
            local v44 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 110 ]]
                -- upvalues: v26 (copy), v27 (copy), l_TweenService_0 (ref), v6 (ref), v24 (copy), v36 (copy), v37 (copy), v28 (copy), l_v28_Scale_0 (copy), v38 (copy), l_ProximityPrompt_0 (copy)
                local v40 = workspace:GetServerTimeNow() - v26;
                local v41 = v27 == 0 and 1 or math.clamp(l_TweenService_0:GetValue(v40 / v27, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), 0, 1);
                local v42 = v6.quadBezier(v41, v24, v36, v37);
                v28:ScaleTo((math.lerp(l_v28_Scale_0 * 2, l_v28_Scale_0, v41)));
                local v43 = os.clock() + v38;
                v28:PivotTo(CFrame.new(v42 + Vector3.new(0, math.sin(v43 * 2) + 1.5, 0)) * CFrame.Angles(0, v43 % 6.283185307179586, 0));
                if v41 >= 1 then
                    l_ProximityPrompt_0.Enabled = true;
                end;
            end);
            v28.Destroying:Connect(function() --[[ Line: 125 ]]
                -- upvalues: v44 (copy)
                v44:Disconnect();
            end);
            l_ProximityPrompt_0.Triggered:Connect(function() --[[ Line: 129 ]]
                -- upvalues: v11 (ref), v22 (copy)
                v11:FireServer(v22);
            end);
        end);
        v9.OnClientEvent:Connect(function(v45) --[[ Line: 134 ]]
            -- upvalues: v21 (copy)
            local v46 = v21[v45];
            if not v46 then
                return;
            else
                v46:Destroy();
                v21[v45] = nil;
                return;
            end;
        end);
    end
};