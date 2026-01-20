local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(script:FindFirstAncestor("Effects").Parent.Types);
local v3 = {};
local _ = script.Name;
local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
l_ColorCorrectionEffect_0.Brightness = 0;
l_ColorCorrectionEffect_0.TintColor = Color3.fromRGB(255, 255, 255);
l_ColorCorrectionEffect_0.Parent = workspace.CurrentCamera;
local v6 = l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
    Brightness = 0
});
v3.Activate = function(_) --[[ Line: 19 ]] --[[ Name: Activate ]]
    -- upvalues: l_ColorCorrectionEffect_0 (copy), l_ReplicatedStorage_0 (copy), v6 (copy)
    l_ColorCorrectionEffect_0.Brightness = l_ReplicatedStorage_0:GetAttribute("WaterEvent") and 2 or 1;
    v6:Cancel();
    v6:Play();
end;
return v3;