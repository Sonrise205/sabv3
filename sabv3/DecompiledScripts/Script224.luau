if not script:IsDescendantOf(workspace) then
    return;
else
    local l_Parent_0 = script.Parent;
    while script:IsDescendantOf(workspace) do
        l_Parent_0.Visible = not l_Parent_0.Visible;
        task.wait(0.5);
    end;
    return;
end;