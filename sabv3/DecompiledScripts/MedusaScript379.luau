local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_ToolsExtras_0 = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v7 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v11 = nil;
local v12 = nil;
local v13 = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In);
local v14 = nil;
local v15 = nil;
local function _() --[[ Line: 26 ]] --[[ Name: SetupHumanoidFunction ]]
    -- upvalues: l_Parent_1 (copy), v15 (ref)
    local l_Character_0 = l_Parent_1.Character;
    local v17 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid");
    if v17 then
        v17.Died:Once(function() --[[ Line: 30 ]]
            -- upvalues: l_Parent_1 (ref), v15 (ref)
            local l_workspace_FirstChild_0 = workspace:FindFirstChild((("%*.Ring"):format(l_Parent_1.Name)));
            if l_workspace_FirstChild_0 then
                l_workspace_FirstChild_0:Destroy();
            end;
            if v15 then
                v15:Disconnect();
            end;
        end);
    end;
end;
local function v24(v20) --[[ Line: 42 ]] --[[ Name: TweenRing ]]
    -- upvalues: v14 (ref), l_TweenService_0 (copy), v13 (copy)
    if not v14 then
        return;
    else
        local v21 = Instance.new("NumberValue", script);
        v21.Value = not v20 and 0.6 or 1.0E-4;
        v21.Changed:Connect(function(v22) --[[ Line: 49 ]]
            -- upvalues: v14 (ref)
            if v14 then
                v14:ScaleTo(v22);
            end;
        end);
        local v23 = l_TweenService_0:Create(v21, v13, {
            Value = v20 and 0.6 or 1.0E-4
        });
        v23:Play();
        v23.Completed:Connect(function() --[[ Line: 57 ]]
            -- upvalues: v21 (copy)
            v21:Destroy();
        end);
        v23.Completed:Wait();
        return;
    end;
end;
local function v26() --[[ Line: 63 ]] --[[ Name: LoadAnimations ]]
    -- upvalues: v11 (ref), v12 (ref), l_Parent_1 (copy)
    if v11 and v12 then
        return;
    else
        local l_Animator_0 = l_Parent_1.Character:WaitForChild("Humanoid"):WaitForChild("Animator");
        v11 = l_Animator_0:LoadAnimation(script.Idle);
        v11.Priority = Enum.AnimationPriority.Action;
        v11.Looped = true;
        v12 = l_Animator_0:LoadAnimation(script.Attack);
        v12.Priority = Enum.AnimationPriority.Action4;
        v12.Looped = false;
        return;
    end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 81 ]]
    -- upvalues: v12 (ref), v7 (copy)
    if v12 then
        v12:Play();
    end;
    v7:RemoteEvent("UseItem"):FireServer();
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 88 ]]
    -- upvalues: v14 (ref), v15 (ref), v26 (copy), v11 (ref), l_ToolsExtras_0 (copy), l_Parent_1 (copy), v24 (copy), l_RunService_0 (copy)
    if v14 then
        v14:Destroy();
    end;
    if v15 then
        v15:Disconnect();
    end;
    v26();
    v11:Play();
    v14 = l_ToolsExtras_0.Ring:Clone();
    v14.Name = ("%*.Ring"):format(l_Parent_1.Name);
    v14:PivotTo(l_Parent_1.Character:GetPivot());
    v14.Parent = workspace;
    v24(true);
    local l_Character_1 = l_Parent_1.Character;
    local v28 = l_Character_1 and l_Character_1:FindFirstChildOfClass("Humanoid");
    if v28 then
        v28.Died:Once(function() --[[ Line: 30 ]]
            -- upvalues: l_Parent_1 (ref), v15 (ref)
            local l_workspace_FirstChild_1 = workspace:FindFirstChild((("%*.Ring"):format(l_Parent_1.Name)));
            if l_workspace_FirstChild_1 then
                l_workspace_FirstChild_1:Destroy();
            end;
            if v15 then
                v15:Disconnect();
            end;
        end);
    end;
    v15 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 107 ]]
        -- upvalues: l_Parent_1 (ref), v14 (ref)
        local l_Character_2 = l_Parent_1.Character;
        local v31 = l_Character_2 and l_Character_2:FindFirstChild("HumanoidRootPart");
        if not v31 or not v31.Parent then
            return;
        else
            if v14 then
                v14:PivotTo(v31:GetPivot() * CFrame.new(0, -3, 0));
            end;
            return;
        end;
    end);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 119 ]]
    -- upvalues: v15 (ref), v24 (copy), v14 (ref), v11 (ref), v12 (ref)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    v24(false);
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v14 then
        v14:Destroy();
        v14 = nil;
    end;
    if v11 and v11.IsPlaying then
        v11:Stop();
    end;
    if v12 and v12.IsPlaying then
        v12:Stop();
    end;
end);