local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = script.Parent.AnimationController.Animator:LoadAnimation(l_ReplicatedStorage_0.Animations.Animals["Festive Lucky Block"].Idle);
v1.Looped = true;
v1:Play();