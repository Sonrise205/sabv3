local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_PlayerScripts_0 = l_Players_0.LocalPlayer.PlayerScripts;
local _ = workspace.CurrentCamera;
local l_Controls_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local _ = require(l_Shared_0.ShakePresets);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local _ = require(l_Packages_0.Trove);
local v11 = require(l_Packages_0.Net);
local _ = require("../CameraController");
local v13 = require("../CharacterController");
local v14 = v11:RemoteEvent("UseItem");
local l_originalMoveFunction_0 = v13.originalMoveFunction;
local v16 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v17 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v18 = {};
v14.OnClientEvent:Connect(function(v19) --[[ Line: 32 ]]
    -- upvalues: l_Lighting_0 (copy), l_Controls_0 (copy), v13 (copy), l_TweenService_0 (copy), v16 (copy), v17 (copy), l_originalMoveFunction_0 (copy)
    if v19 ~= "Flashbang" then
        return;
    else
        local l_ColorCCorrection_0 = l_Lighting_0:FindFirstChild("ColorCCorrection");
        if l_ColorCCorrection_0 then
            l_ColorCCorrection_0.Enabled = false;
        end;
        l_Controls_0.moveFunction = function(v21, v22, v23) --[[ Line: 41 ]]
            -- upvalues: v13 (ref)
            v13:RequestMove(v21, -(v22 * (1 + math.random())), v23);
        end;
        local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
        l_ColorCorrectionEffect_0.TintColor = Color3.fromRGB(255, 255, 255);
        l_ColorCorrectionEffect_0.Name = "Flashbang";
        l_ColorCorrectionEffect_0.Saturation = -0.2;
        l_ColorCorrectionEffect_0.Brightness = 0.1;
        l_ColorCorrectionEffect_0.Contrast = 0.1;
        l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
        local v25 = l_TweenService_0:Create(l_ColorCorrectionEffect_0, v16, {
            Brightness = 1
        });
        v25:Play();
        v25.Completed:Wait();
        task.wait(1);
        local v26 = l_TweenService_0:Create(l_ColorCorrectionEffect_0, v17, {
            Brightness = 0
        });
        v26:Play();
        v26.Completed:Wait();
        l_ColorCorrectionEffect_0:Destroy();
        task.wait();
        l_Lighting_0.Ambient = Color3.fromRGB(255, 255, 255);
        l_Lighting_0.OutdoorAmbient = Color3.fromRGB(212, 212, 212);
        if l_ColorCCorrection_0 then
            l_ColorCCorrection_0.Enabled = true;
        end;
        task.delay(1, function() --[[ Line: 71 ]]
            -- upvalues: l_Controls_0 (ref), l_originalMoveFunction_0 (ref)
            l_Controls_0.moveFunction = l_originalMoveFunction_0;
        end);
        return;
    end;
end);
return v18;