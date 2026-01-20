local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v3 = require(l_Controllers_0.CameraController);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v5 = require(l_Classes_0.AnimatedButton);
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v7 = require(l_Packages_0.Signal);
local v8 = require(l_Packages_0.Trove);
local v9 = require(script.Styles);
local l_Toggle_0 = l_Controllers_0.InterfaceController.Toggle;
local v11 = {};
v11.__index = v11;
v11.AttachCloseButton = function(v12, v13, v14) --[[ Line: 53 ]] --[[ Name: AttachCloseButton ]]
    -- upvalues: v5 (copy), l_Toggle_0 (copy)
    local v15 = v5.new(v13, v14);
    v12.Collector:Add(v15, "Destroy");
    v15:Animate(nil, nil, 5);
    v12.Collector:Add(v15.OnActivated:Connect(function() --[[ Line: 57 ]]
        -- upvalues: l_Toggle_0 (ref), v12 (copy)
        l_Toggle_0:Fire(v12.Name, false);
    end));
end;
v11.GetName = function(v16) --[[ Line: 62 ]] --[[ Name: GetName ]]
    return v16.Name;
end;
v11.GetStyleData = function(v17) --[[ Line: 66 ]] --[[ Name: GetStyleData ]]
    -- upvalues: v9 (copy)
    return v9[v17:GetStyle()];
end;
v11.GetStyle = function(v18) --[[ Line: 70 ]] --[[ Name: GetStyle ]]
    return v18.Style;
end;
v11.SetStyle = function(v19, v20) --[[ Line: 74 ]] --[[ Name: SetStyle ]]
    v19.Style = v20;
end;
v11.Open = function(v21, _) --[[ Line: 78 ]] --[[ Name: Open ]]
    -- upvalues: v9 (copy), l_TweenService_0 (copy), v3 (copy)
    if v21.ToggleConnection then
        v21.ToggleConnection:Disconnect();
        v21.ToggleConnection = nil;
    end;
    v21.State = true;
    v21.Object.Visible = v21.State;
    if v21.Style ~= "Custom" then
        local v23 = v9[v21.Style];
        local l_Position_0 = v21.Defaults.Position;
        local l_Size_0 = v21.Defaults.Size;
        local v26 = TweenInfo.new(v23.ToggleTime, v23.Style);
        l_TweenService_0:Create(v21.Object, v26, {
            Position = l_Position_0, 
            Size = l_Size_0
        }):Play();
        v3:Blur(v23.BlurSize or 0, v23.ToggleTime);
        v3:Fov(v23.Fov or v3:GetDefaultFov(), v23.ToggleTime);
    end;
    v21.OnOpen:Fire();
end;
v11.Close = function(v27, _) --[[ Line: 105 ]] --[[ Name: Close ]]
    -- upvalues: v9 (copy), l_TweenService_0 (copy)
    if v27.ToggleConnection then
        v27.ToggleConnection:Disconnect();
        v27.ToggleConnection = nil;
    end;
    v27.State = false;
    if v27.Style ~= "Custom" then
        local v29 = v9[v27.Style];
        local v30 = v27.Defaults.Position + v29.Position;
        local v31 = v27.Defaults.Size + v29.Size;
        local v32 = TweenInfo.new(v29.ToggleTime, v29.Style);
        local v33 = l_TweenService_0:Create(v27.Object, v32, {
            Position = v30, 
            Size = v31
        });
        v27.ToggleConnection = v33.Completed:Connect(function() --[[ Line: 120 ]]
            -- upvalues: v27 (copy)
            v27.Object.Visible = false;
        end);
        v33:Play();
    end;
    v27.OnClose:Fire();
end;
v11.Toggle = function(v34, v35) --[[ Line: 129 ]] --[[ Name: Toggle ]]
    v34[(v35 and v35 or not v34.State) == true and "Open" or "Close"](v34);
end;
v11.IsOpened = function(v36) --[[ Line: 134 ]] --[[ Name: IsOpened ]]
    return v36.State;
end;
v11.new = function(v37, v38, v39) --[[ Line: 138 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v7 (copy), v8 (copy)
    local v40 = setmetatable({}, v11);
    v40.Name = v37;
    v40.Object = v38;
    v40.Defaults = {};
    v40.Defaults.Position = v40.Object.Position;
    v40.Defaults.Size = v40.Object.Size;
    v40.State = true;
    v40.Style = v39 or "TopQuint";
    v40.OnOpen = v7.new();
    v40.OnClose = v7.new();
    v40.Collector = v8.new();
    local l_v38_FirstAncestorWhichIsA_0 = v38:FindFirstAncestorWhichIsA("LayerCollector");
    if l_v38_FirstAncestorWhichIsA_0 then
        local function v42() --[[ Line: 153 ]] --[[ Name: updateLayerCollectorVisibility ]]
            -- upvalues: l_v38_FirstAncestorWhichIsA_0 (copy), v38 (copy)
            if #l_v38_FirstAncestorWhichIsA_0:GetChildren() ~= 1 then
                l_v38_FirstAncestorWhichIsA_0.Enabled = true;
                return;
            else
                l_v38_FirstAncestorWhichIsA_0.Enabled = v38.Visible;
                return;
            end;
        end;
        v40.Collector:Add(l_v38_FirstAncestorWhichIsA_0.ChildAdded:Connect(v42));
        v40.Collector:Add(l_v38_FirstAncestorWhichIsA_0.ChildRemoved:Connect(v42));
        v40.Collector:Add(v38:GetPropertyChangedSignal("Visible"):Connect(v42));
        task.spawn(v42);
    end;
    return v40;
end;
return v11;