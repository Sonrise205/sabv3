local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Component);
local v5 = require(l_Packages_0.Trove);
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v7 = require(l_Controllers_0.DialogController);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v9 = require(l_Utils_0.StringUtils);
local v10 = TweenInfo.new(0.5, Enum.EasingStyle.Linear);
local _ = l_Players_0.LocalPlayer;
local v12 = v4.new({
    Tag = "Npc"
});
v12.Construct = function(v13) --[[ Line: 44 ]] --[[ Name: Construct ]]
    -- upvalues: v5 (copy), l_TweenService_0 (copy), v10 (copy), v7 (copy), v9 (copy), l_ReplicatedStorage_0 (copy)
    v13.Collector = v5.new();
    v13.Hightlight = Instance.new("Highlight");
    v13.Hightlight.FillTransparency = 1;
    v13.Hightlight.OutlineColor = Color3.fromRGB(255, 255, 255);
    v13.Hightlight.OutlineTransparency = 1;
    v13.Hightlight.DepthMode = Enum.HighlightDepthMode.Occluded;
    v13.Hightlight.Parent = v13.Instance;
    v13.ProximityPrompt = Instance.new("ProximityPrompt", v13.Instance);
    v13.ProximityPrompt.ActionText = "Talk";
    v13.ProximityPrompt.ObjectText = v13.Instance:GetAttribute("PromptObjectText") or "";
    v13.ShownTween = l_TweenService_0:Create(v13.Hightlight, v10, {
        OutlineTransparency = 0
    });
    v13.HiddenTween = l_TweenService_0:Create(v13.Hightlight, v10, {
        OutlineTransparency = 1
    });
    v13.DialogText = v7:GetDialogText();
    v13.DialogText.Parent = v13.Instance.PrimaryPart;
    if v13.Instance:GetAttribute("IdlePath") then
        local v14 = v9:ReadPath(l_ReplicatedStorage_0, v13.Instance:GetAttribute("IdlePath"));
        local v15 = v13.Instance:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(v14);
        v15.Looped = true;
        v15:Play();
    end;
end;
v12.Start = function(v16) --[[ Line: 74 ]] --[[ Name: Start ]]
    -- upvalues: v7 (copy)
    v16.Collector:Add(v16.ProximityPrompt.Triggered:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v7 (ref), v16 (copy)
        v7:StartDialog(v16.Instance:GetAttribute("Dialog"), v16.Instance:GetAttribute("Index"), v16.DialogText);
    end));
    v16.Collector:Add(v16.ProximityPrompt.PromptShown:Connect(function() --[[ Line: 80 ]]
        -- upvalues: v16 (copy)
        v16.ShownTween:Play();
    end));
    v16.Collector:Add(v16.ProximityPrompt.PromptHidden:Connect(function() --[[ Line: 84 ]]
        -- upvalues: v16 (copy)
        v16.HiddenTween:Play();
    end));
end;
v12.Stop = function(v17) --[[ Line: 90 ]] --[[ Name: Stop ]]
    v17.Collector:Destroy();
end;
return v12;