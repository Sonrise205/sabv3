if not script:IsDescendantOf(workspace) then
    return;
else
    local l_WaveLoop_0 = script.Parent.AnimationController.WaveLoop;
    local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_WaveLoop_0);
    v1.Looped = true;
    v1:Play();
    v1:AdjustSpeed(0.33);
    return;
end;