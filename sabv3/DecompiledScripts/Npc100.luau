local l_Controllers_0 = game:GetService("ReplicatedStorage"):WaitForChild("Controllers");
local v1 = require(l_Controllers_0.InterfaceController);
local l_Parent_0 = script.Parent;
local l_Animator_0 = l_Parent_0.AnimationController.Animator;
local l_Animation_0 = Instance.new("Animation");
l_Animation_0.AnimationId = "rbxassetid://101584462565852";
local v5 = l_Animator_0:LoadAnimation(l_Animation_0);
v5:Play();
v5.Looped = true;
l_Parent_0.OpenInterface.Triggered:Connect(function() --[[ Line: 23 ]]
    -- upvalues: v1 (copy)
    v1:Toggle("CoinsShop");
end);