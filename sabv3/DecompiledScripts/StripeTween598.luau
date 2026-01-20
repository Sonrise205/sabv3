if not script:IsDescendantOf(workspace) then
    return;
else
    local l_Parent_0 = script.Parent;
    local function v1() --[[ Line: 6 ]] --[[ Name: Play ]]
        -- upvalues: l_Parent_0 (copy), v1 (copy)
        l_Parent_0.Position = UDim2.new(0.5, 0, l_Parent_0.Position.Y.Scale, l_Parent_0.Position.Y.Offset);
        local v2 = game:GetService("TweenService"):Create(l_Parent_0, TweenInfo.new(3, Enum.EasingStyle.Linear), {
            Position = UDim2.new(1, 0, l_Parent_0.Position.Y.Scale, l_Parent_0.Position.Y.Offset)
        });
        v2.Completed:Connect(function() --[[ Line: 12 ]]
            -- upvalues: v1 (ref)
            v1();
        end);
        v2:Play();
    end;
    v1();
    return;
end;