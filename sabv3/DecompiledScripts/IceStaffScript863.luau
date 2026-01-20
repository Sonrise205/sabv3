local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_ToolsExtras_0 = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v7 = require(l_Packages_0.Net);
local v8 = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v11 = nil;
local v12 = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In);
local v13 = nil;
local v14 = nil;
local function _() --[[ Line: 25 ]] --[[ Name: SetupHumanoidFunction ]]
    -- upvalues: l_Parent_1 (copy), v14 (ref)
    local l_Character_0 = l_Parent_1.Character;
    local v16 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid");
    if v16 then
        v16.Died:Once(function() --[[ Line: 29 ]]
            -- upvalues: l_Parent_1 (ref), v14 (ref)
            local l_workspace_FirstChild_0 = workspace:FindFirstChild((("%*.Ring"):format(l_Parent_1.Name)));
            if l_workspace_FirstChild_0 then
                l_workspace_FirstChild_0:Destroy();
            end;
            if v14 then
                v14:Disconnect();
            end;
        end);
    end;
end;
local function v23(v19) --[[ Line: 41 ]] --[[ Name: TweenRing ]]
    -- upvalues: v13 (ref), l_TweenService_0 (copy), v12 (copy)
    if not v13 then
        return;
    else
        local v20 = Instance.new("NumberValue", script);
        v20.Value = not v19 and 0.6 or 1.0E-4;
        v20.Changed:Connect(function(v21) --[[ Line: 48 ]]
            -- upvalues: v13 (ref)
            if v13 then
                v13:ScaleTo(v21);
            end;
        end);
        local v22 = l_TweenService_0:Create(v20, v12, {
            Value = v19 and 0.6 or 1.0E-4
        });
        v22:Play();
        v22.Completed:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v20 (copy)
            v20:Destroy();
        end);
        v22.Completed:Wait();
        return;
    end;
end;
local function _() --[[ Line: 62 ]] --[[ Name: LoadAnimations ]]
    -- upvalues: v11 (ref), l_Parent_1 (copy)
    if v11 then
        return;
    else
        v11 = l_Parent_1.Character:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(script.Attack);
        v11.Priority = Enum.AnimationPriority.Action4;
        v11.Looped = false;
        return;
    end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 77 ]]
    -- upvalues: v7 (copy), v11 (ref), v8 (copy), l_Parent_1 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 82 ]]
        -- upvalues: v7 (ref)
        return v7:Invoke("UseItem");
    end);
    if not l_status_0 or type(l_result_0) ~= "number" then
        return;
    else
        if v11 then
            v11:Play();
        end;
        v8(("ItemUse/MedusaAttackAnimation/%*"):format(l_Parent_1.Name), l_result_0 - workspace:GetServerTimeNow());
        return;
    end;
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 97 ]]
    -- upvalues: v13 (ref), v14 (ref), v11 (ref), l_Parent_1 (copy), l_ToolsExtras_0 (copy), v23 (copy), l_RunService_0 (copy)
    if v13 then
        v13:Destroy();
    end;
    if v14 then
        v14:Disconnect();
    end;
    if not v11 then
        v11 = l_Parent_1.Character:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(script.Attack);
        v11.Priority = Enum.AnimationPriority.Action4;
        v11.Looped = false;
    end;
    v13 = l_ToolsExtras_0.Ring:Clone();
    v13.Union.Color = Color3.new(0, 0.882353, 1);
    v13.Name = ("%*.Ring"):format(l_Parent_1.Name);
    v13:PivotTo(l_Parent_1.Character:GetPivot());
    v13.Parent = workspace;
    v23(true);
    local l_Character_1 = l_Parent_1.Character;
    local v28 = l_Character_1 and l_Character_1:FindFirstChildOfClass("Humanoid");
    if v28 then
        v28.Died:Once(function() --[[ Line: 29 ]]
            -- upvalues: l_Parent_1 (ref), v14 (ref)
            local l_workspace_FirstChild_1 = workspace:FindFirstChild((("%*.Ring"):format(l_Parent_1.Name)));
            if l_workspace_FirstChild_1 then
                l_workspace_FirstChild_1:Destroy();
            end;
            if v14 then
                v14:Disconnect();
            end;
        end);
    end;
    v14 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 116 ]]
        -- upvalues: l_Parent_1 (ref), v13 (ref)
        local l_Character_2 = l_Parent_1.Character;
        local v31 = l_Character_2 and l_Character_2:FindFirstChild("HumanoidRootPart");
        if not v31 or not v31.Parent then
            return;
        else
            if v13 then
                v13:PivotTo(v31:GetPivot() * CFrame.new(0, -3, 0));
            end;
            return;
        end;
    end);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 128 ]]
    -- upvalues: v14 (ref), v23 (copy), v13 (ref), v11 (ref)
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    v23(false);
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    if v13 then
        v13:Destroy();
        v13 = nil;
    end;
    if v11 and v11.IsPlaying then
        v11:Stop();
    end;
end);