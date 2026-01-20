local l_SlapHandRotate_0 = script.SlapHandRotate;
local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_SlapHandRotate_0);
v1.Looped = true;
v1:Play();
v1:AdjustSpeed(0.5);