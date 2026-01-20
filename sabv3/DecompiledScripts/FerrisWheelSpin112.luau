if not script:IsDescendantOf(workspace) then
    return;
else
    local l_RunService_0 = game:GetService("RunService");
    local l_Parent_0 = script.Parent;
    while l_Parent_0:IsDescendantOf(workspace) do
        local v2 = l_RunService_0.Heartbeat:Wait();
        l_Parent_0:PivotTo(l_Parent_0:GetPivot() * CFrame.Angles(math.rad(-0.5 * v2 * 60), 0, 0));
    end;
    return;
end;