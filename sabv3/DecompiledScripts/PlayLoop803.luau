local l_OrbAnimation_0 = script.OrbAnimation;
local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_OrbAnimation_0);
v1.Looped = true;
v1:Play();