local l_TweenService_0 = game:GetService("TweenService");
local v4 = {
    GetDefaultFov = function(_) --[[ Line: 11 ]] --[[ Name: GetDefaultFov ]]
        return 70;
    end, 
    Get = function(_) --[[ Line: 15 ]] --[[ Name: Get ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        while not l_CurrentCamera_0 do
            task.wait();
            l_CurrentCamera_0 = workspace.CurrentCamera;
        end;
        return l_CurrentCamera_0;
    end
};
v4.Fov = function(_, v6, v7, v8) --[[ Line: 24 ]] --[[ Name: Fov ]]
    -- upvalues: v4 (copy), l_TweenService_0 (copy)
    if v8 == true then
        v6 = 70;
    end;
    if v7 == 0 then
        v4:Get().FieldOfView = v6;
        return;
    else
        local v9 = TweenInfo.new(v7, Enum.EasingStyle.Linear);
        l_TweenService_0:Create(v4:Get(), v9, {
            FieldOfView = v6
        }):Play();
        return;
    end;
end;
v4.Blur = function(_, v11, v12) --[[ Line: 39 ]] --[[ Name: Blur ]]
    -- upvalues: v4 (copy), l_TweenService_0 (copy)
    local l_Blur_0 = v4:Get():FindFirstChild("Blur");
    if not l_Blur_0 then
        l_Blur_0 = Instance.new("BlurEffect");
        l_Blur_0.Size = 0;
        l_Blur_0.Parent = v4:Get();
    end;
    if v12 == 0 then
        l_Blur_0.Size = v11;
        return;
    else
        local v14 = TweenInfo.new(v12, Enum.EasingStyle.Linear);
        l_TweenService_0:Create(l_Blur_0, v14, {
            Size = v11
        }):Play();
        return;
    end;
end;
return v4;