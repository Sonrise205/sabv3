local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v7 = require(l_Shared_0.ShakePresets);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Trove);
local v10 = require(l_Packages_0.Net);
local v11 = require("../CameraController");
local v12 = v10:RemoteEvent("UseItem");
local v13 = v9.new();
local l_BOOM_0 = script.BOOM;
local v15 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local v16 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local v17 = {};
v12.OnClientEvent:Connect(function(v18) --[[ Line: 28 ]]
    -- upvalues: l_Lighting_0 (copy), l_BOOM_0 (copy), l_TweenService_0 (copy), l_CurrentCamera_0 (copy), v16 (copy), v15 (copy), v7 (copy), v13 (copy), v11 (copy)
    if v18 ~= "Boogie" then
        return;
    else
        local l_ColorCCorrection_0 = l_Lighting_0:FindFirstChild("ColorCCorrection");
        if l_ColorCCorrection_0 then
            l_ColorCCorrection_0.Enabled = false;
        end;
        l_BOOM_0:Play();
        local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
        l_ColorCorrectionEffect_0.TintColor = Color3.fromRGB(255, 255, 255);
        l_ColorCorrectionEffect_0.Name = "DiscoEffect";
        l_ColorCorrectionEffect_0.Saturation = -0.2;
        l_ColorCorrectionEffect_0.Brightness = 0.1;
        l_ColorCorrectionEffect_0.Contrast = 0.1;
        l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
        local l_BlurEffect_0 = Instance.new("BlurEffect");
        l_BlurEffect_0.Size = 3;
        l_BlurEffect_0.Parent = l_Lighting_0;
        local v22 = l_TweenService_0:Create(l_CurrentCamera_0, v16, {
            FieldOfView = 80
        });
        local v23 = l_TweenService_0:Create(l_ColorCorrectionEffect_0, v15, {
            Brightness = 0.25
        });
        v23:Play();
        v22:Play();
        local v24 = v7.Bump:Clone();
        v13:Add(v24);
        v24.Sustain = true;
        v13:Add(v7.BindShakeToCamera(v24, l_CurrentCamera_0));
        v24:Start();
        v13:Add(task.delay(10, function() --[[ Line: 61 ]]
            -- upvalues: v24 (copy)
            v24:StopSustain();
        end));
        task.delay(10, function() --[[ Line: 65 ]]
            -- upvalues: v23 (copy), l_ColorCorrectionEffect_0 (copy), v22 (copy), l_BOOM_0 (ref), l_BlurEffect_0 (copy), l_CurrentCamera_0 (ref), v11 (ref), l_Lighting_0 (ref), l_ColorCCorrection_0 (copy), v13 (ref)
            v23:Cancel();
            l_ColorCorrectionEffect_0:Destroy();
            v22:Cancel();
            l_BOOM_0:Stop();
            l_BlurEffect_0:Destroy();
            task.wait();
            l_CurrentCamera_0.FieldOfView = v11:GetDefaultFov();
            l_Lighting_0.Ambient = Color3.fromRGB(255, 255, 255);
            l_Lighting_0.OutdoorAmbient = Color3.fromRGB(212, 212, 212);
            if l_ColorCCorrection_0 then
                l_ColorCCorrection_0.Enabled = true;
            end;
            v13:Clean();
        end);
        return;
    end;
end);
return v17;