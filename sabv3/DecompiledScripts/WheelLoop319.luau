local l_WheelLoop_0 = script.WheelLoop;
local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_WheelLoop_0);
v1.Looped = true;
v1:Play();