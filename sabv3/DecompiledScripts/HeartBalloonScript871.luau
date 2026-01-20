local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent;
l_Parent_0.Handle:GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 8 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Parent_0 (copy)
    local v2 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    if not l_Parent_0:IsDescendantOf(v2) then
        workspace.Gravity = 196.2;
        return;
    elseif l_Parent_0.Handle.Transparency == 1 then
        workspace.Gravity = 196.2;
        return;
    else
        workspace.Gravity = 29.429999999999996;
        return;
    end;
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 22 ]]
    -- upvalues: l_Parent_0 (copy)
    if l_Parent_0.Handle.Transparency == 1 then
        workspace.Gravity = 196.2;
        return;
    else
        workspace.Gravity = 29.429999999999996;
        return;
    end;
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 33 ]]
    workspace.Gravity = 196.2;
end);