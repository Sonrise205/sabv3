if not script:IsDescendantOf(workspace) then
    return;
else
    local l_LeavesSway_0 = script.Parent.AnimationController.LeavesSway;
    local v1 = script.Parent.AnimationController:WaitForChild("Animator"):LoadAnimation(l_LeavesSway_0);
    v1.Looped = true;
    v1:Play();
    return;
end;