local l_CarAnimationLoop_0 = script.CarAnimationLoop;
local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_CarAnimationLoop_0);
v1.Looped = true;
v1:Play();
v1:AdjustSpeed(0.33);