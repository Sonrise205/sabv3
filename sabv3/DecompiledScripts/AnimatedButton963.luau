local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v3 = require(l_Controllers_0.SoundController);
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v5 = require(l_Packages_0.Signal);
local v6 = require(l_Packages_0.Trove);
local v7 = {};
v7.__index = v7;
v7.Rotate = function(v8, v9, v10) --[[ Line: 48 ]] --[[ Name: Rotate ]]
    -- upvalues: l_TweenService_0 (copy)
    local v11 = v8.Target or v8.Instance;
    local v12 = TweenInfo.new(v10, Enum.EasingStyle.Quint);
    local v13 = l_TweenService_0:Create(v11, v12, {
        Rotation = v9
    });
    v13:Play();
    return v13;
end;
v7.Expand = function(v14, v15, v16) --[[ Line: 59 ]] --[[ Name: Expand ]]
    -- upvalues: l_TweenService_0 (copy)
    local v17 = v14.Target or v14.Instance;
    local v18 = UDim2.new(v14.DefaultSize.X.Scale * v15, v14.DefaultSize.X.Offset * v15, v14.DefaultSize.Y.Scale * v15, v14.DefaultSize.Y.Offset * v15);
    local v19 = TweenInfo.new(v16, Enum.EasingStyle.Quint);
    local v20 = l_TweenService_0:Create(v17, v19, {
        Size = v18
    });
    v20:Play();
    return v20;
end;
v7.SetExpandDuration = function(v21, v22) --[[ Line: 76 ]] --[[ Name: SetExpandDuration ]]
    v21.ExpandDuration = v22;
    return v21;
end;
v7.SetExpandModifier = function(v23, v24) --[[ Line: 81 ]] --[[ Name: SetExpandModifier ]]
    v23.ExpandModifier = v24;
    return v23;
end;
v7.Animate = function(v25, v26, v27, v28) --[[ Line: 86 ]] --[[ Name: Animate ]]
    -- upvalues: v3 (copy)
    v25.AnimatedRotation = v28 or v25.DefaultRotation;
    if v26 then
        v25:SetExpandModifier(v26);
    end;
    if v27 then
        v25:SetExpandDuration(v27);
    end;
    if v25.Animated == true then
        return v25;
    else
        v25.Animated = true;
        v25.Collector:Add(v25.OnMouseEnter:Connect(function(_, _) --[[ Line: 105 ]]
            -- upvalues: v25 (copy)
            v25:Expand(v25.ExpandModifier, v25.ExpandDuration);
            v25:Rotate(v25.AnimatedRotation, v25.ExpandDuration);
        end));
        v25.Collector:Add(v25.OnMouseLeave:Connect(function(_, _) --[[ Line: 111 ]]
            -- upvalues: v25 (copy)
            v25:Expand(1, v25.ExpandDuration);
            v25:Rotate(v25.DefaultRotation, v25.ExpandDuration);
        end));
        v25.Collector:Add(v25.OnActivated:Connect(function() --[[ Line: 117 ]]
            -- upvalues: v3 (ref), v25 (copy)
            v3:PlaySound("Sounds.Sfx.Activated");
            v25:Expand(1, 0.1).Completed:Once(function() --[[ Line: 121 ]]
                -- upvalues: v25 (ref)
                v25:Expand(v25.ExpandModifier, 0.1);
            end);
        end));
        return v25;
    end;
end;
v7.new = function(v33, v34) --[[ Line: 131 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v6 (copy), v5 (copy)
    local v35 = setmetatable({}, v7);
    v35.Instance = v33;
    v35.Target = v34;
    v35.Collector = v6.new();
    v35.Animated = false;
    v35.ExpandModifier = 1.05;
    v35.ExpandDuration = 0.2;
    v35.DefaultSize = v34 and v34.Size or v33.Size;
    v35.DefaultPosition = v34 and v34.Position or v33.Position;
    v35.DefaultRotation = v34 and v34.Rotation or v33.Rotation;
    v35.OnActivated = v5.new();
    v35.Collector:Add(v35.OnActivated, "Destroy");
    v35.OnMouseEnter = v5.new();
    v35.Collector:Add(v35.OnMouseEnter, "Destroy");
    v35.OnMouseLeave = v5.new();
    v35.Collector:Add(v35.OnMouseLeave, "Destroy");
    v35.Collector:Add(v35.Instance.Activated:Connect(function(...) --[[ Line: 156 ]]
        -- upvalues: v35 (copy)
        v35.OnActivated:Fire(...);
    end));
    v35.Collector:Add(v35.Instance.MouseEnter:Connect(function(...) --[[ Line: 161 ]]
        -- upvalues: v35 (copy)
        v35.OnMouseEnter:Fire(...);
    end));
    v35.Collector:Add(v35.Instance.MouseLeave:Connect(function(...) --[[ Line: 165 ]]
        -- upvalues: v35 (copy)
        v35.OnMouseLeave:Fire(...);
    end));
    return v35;
end;
v7.Destroy = function(v36, v37) --[[ Line: 172 ]] --[[ Name: Destroy ]]
    v36.Collector:Destroy();
    if v37 then
        if v36.Target then
            v36.Target:Destroy();
        end;
        if v36.Instance and v36.Instance.Parent then
            v36.Instance:Destroy();
            return;
        end;
    else
        local v38 = v36.Target or v36.Instance;
        v38.Size = v36.DefaultSize or v38.Size;
        v38.Position = v36.DefaultPosition or v38.Position;
        v38.Rotation = v36.DefaultRotation or v38.Rotation;
    end;
end;
return v7;