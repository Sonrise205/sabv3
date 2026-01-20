if not script:IsDescendantOf(workspace) then
    return;
else
    local l_Parent_0 = script.Parent;
    local function v1() --[[ Line: 6 ]] --[[ Name: Spin ]]
        -- upvalues: l_Parent_0 (copy), v1 (copy)
        l_Parent_0.Rotation = 0;
        local v2 = game:GetService("TweenService"):Create(l_Parent_0, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            Rotation = 360
        });
        v2.Completed:Connect(v1);
        v2:Play();
    end;
    v1();
    return;
end;