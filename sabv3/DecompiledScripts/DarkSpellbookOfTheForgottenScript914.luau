local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v6 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_ToolsExtras_0 = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v11 = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In);
local v12 = nil;
local v13 = nil;
local function _() --[[ Line: 20 ]] --[[ Name: SetupHumanoidFunction ]]
    -- upvalues: l_Parent_1 (copy), v13 (ref)
    local l_Character_0 = l_Parent_1.Character;
    local v15 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid");
    if v15 then
        v15.Died:Once(function() --[[ Line: 24 ]]
            -- upvalues: l_Parent_1 (ref), v13 (ref)
            local l_workspace_FirstChild_0 = workspace:FindFirstChild((("%*.Ring"):format(l_Parent_1.Name)));
            if l_workspace_FirstChild_0 then
                l_workspace_FirstChild_0:Destroy();
            end;
            if v13 then
                v13:Disconnect();
            end;
        end);
    end;
end;
local function v22(v18) --[[ Line: 36 ]] --[[ Name: TweenRing ]]
    -- upvalues: v12 (ref), l_TweenService_0 (copy), v11 (copy)
    if not v12 then
        return;
    else
        local v19 = Instance.new("NumberValue", script);
        v19.Value = not v18 and 0.6 or 1.0E-4;
        v19.Changed:Connect(function(v20) --[[ Line: 43 ]]
            -- upvalues: v12 (ref)
            if v12 then
                v12:ScaleTo(v20);
            end;
        end);
        local v21 = l_TweenService_0:Create(v19, v11, {
            Value = v18 and 0.6 or 1.0E-4
        });
        v21:Play();
        v21.Completed:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v19 (copy)
            v19:Destroy();
        end);
        v21.Completed:Wait();
        return;
    end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 57 ]]
    -- upvalues: v6 (copy)
    v6:RemoteEvent("UseItem"):FireServer();
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 61 ]]
    -- upvalues: v12 (ref), v13 (ref), l_ToolsExtras_0 (copy), l_Parent_1 (copy), v22 (copy), l_RunService_0 (copy)
    if v12 then
        v12:Destroy();
    end;
    if v13 then
        v13:Disconnect();
    end;
    v12 = l_ToolsExtras_0.Ring:Clone();
    v12.Name = ("%*.Ring"):format(l_Parent_1.Name);
    v12:PivotTo(l_Parent_1.Character:GetPivot());
    v12.Parent = workspace;
    v22(true);
    local l_Character_1 = l_Parent_1.Character;
    local v24 = l_Character_1 and l_Character_1:FindFirstChildOfClass("Humanoid");
    if v24 then
        v24.Died:Once(function() --[[ Line: 24 ]]
            -- upvalues: l_Parent_1 (ref), v13 (ref)
            local l_workspace_FirstChild_1 = workspace:FindFirstChild((("%*.Ring"):format(l_Parent_1.Name)));
            if l_workspace_FirstChild_1 then
                l_workspace_FirstChild_1:Destroy();
            end;
            if v13 then
                v13:Disconnect();
            end;
        end);
    end;
    v13 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 77 ]]
        -- upvalues: l_Parent_1 (ref), v12 (ref)
        local l_Character_2 = l_Parent_1.Character;
        local v27 = l_Character_2 and l_Character_2:FindFirstChild("HumanoidRootPart");
        if not v27 or not v27.Parent then
            return;
        else
            if v12 then
                v12:PivotTo(v27:GetPivot() * CFrame.new(0, -3, 0));
            end;
            return;
        end;
    end);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 89 ]]
    -- upvalues: v13 (ref), v22 (copy), v12 (ref)
    if v13 then
        v13:Disconnect();
        v13 = nil;
    end;
    v22(false);
    if v13 then
        v13:Disconnect();
        v13 = nil;
    end;
    if v12 then
        v12:Destroy();
        v12 = nil;
    end;
end);