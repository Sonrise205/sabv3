if not script:IsDescendantOf(workspace) then
    return;
else
    local l_FlagWind_0 = script.Parent.AnimationController.FlagWind;
    local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_FlagWind_0);
    v1.Looped = true;
    v1:Play();
    v1:AdjustSpeed(0.9);
    return;
end;