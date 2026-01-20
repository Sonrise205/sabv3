local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_ReplicatedStorage_0.Controllers.ActionController);
local v6 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Janitor);
local _ = require(l_ReplicatedStorage_0.UserGenerated.Lang.WCall);
local v8 = require(l_ReplicatedStorage_0.Packages.Net);
local v9 = require(l_ReplicatedStorage_0.Utils.CharacterUtils);
local v10 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v11 = require(l_ReplicatedStorage_0.Controllers.ItemController.NightVisionController);
local v12 = v8:RemoteFunction("Tools/BanHammer/Charge");
local v13 = v8:RemoteEvent("Tools/BanHammer/Release");
local v14 = l_ReplicatedStorage_0:WaitForChild("Assets"):WaitForChild("Tools"):WaitForChild("Ban Hammer");
local v15 = require(v14.Flags);
local l_Indicator_0 = v14:WaitForChild("Indicator");
local l_RunningAnimation_0 = v14:WaitForChild("RunningAnimation");
local l_IdleAnimation_0 = v14:WaitForChild("IdleAnimation");
task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, v14:GetDescendants());
script:WaitForChild("Equipped").Event:Connect(function(v19) --[[ Line: 36 ]]
    -- upvalues: l_Players_0 (copy), v6 (copy), v9 (copy), l_RunningAnimation_0 (copy), l_IdleAnimation_0 (copy), v11 (copy), v5 (copy), l_Indicator_0 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), v15 (copy), v10 (copy), v12 (copy), v13 (copy)
    local v20 = if v19.Parent:IsA("Model") then l_Players_0:GetPlayerFromCharacter(v19.Parent) else v19.Parent.Parent;
    assert(v20 and v20:IsA("Player"));
    local v21 = v20.Character or v20.CharacterAdded:Wait();
    local v22 = assert(v21:WaitForChild("HumanoidRootPart", 15));
    local v23 = assert(v21:WaitForChild("Humanoid", 15));
    local _ = assert(v23:WaitForChild("Animator", 15));
    local v25 = v6.new();
    v9:SetAnimations(v21, "walk", {
        l_RunningAnimation_0
    });
    v9:SetAnimations(v21, "run", {
        l_RunningAnimation_0
    });
    v9:SetAnimations(v21, "idle", {
        l_IdleAnimation_0
    });
    v25:Add(function() --[[ Line: 53 ]]
        -- upvalues: v9 (ref), v21 (copy)
        v9:RevertAllAnimations(v21);
    end);
    v11.Enable();
    v25:Add(function() --[[ Line: 58 ]]
        -- upvalues: v11 (ref)
        v11.Disable();
    end);
    local function _() --[[ Line: 62 ]] --[[ Name: IsValid ]]
        -- upvalues: v22 (copy), v23 (copy), v20 (copy)
        if not v22.Parent then
            return false;
        elseif v23.Health <= 0 then
            return false;
        elseif v20:GetAttribute("Stealing") then
            return false;
        else
            return true;
        end;
    end;
    local v27 = false;
    v25:Add(v5.Pressed:Connect(function(_, _) --[[ Line: 72 ]]
        -- upvalues: v22 (copy), v23 (copy), v20 (copy), v27 (ref), v6 (ref), l_Indicator_0 (ref), l_TweenService_0 (ref), l_RunService_0 (ref), v19 (copy), v15 (ref), v5 (ref), v25 (copy), v10 (ref), v12 (ref), v13 (ref)
        if not (not not v22.Parent and not (v23.Health <= 0) and (not v20:GetAttribute("Stealing") or false)) then
            return;
        elseif v27 then
            return;
        else
            v27 = true;
            local v30 = v6.new();
            local v31 = l_Indicator_0:Clone();
            local l_Main_0 = v31.Main;
            v30:Add(function() --[[ Line: 85 ]]
                -- upvalues: v31 (copy), l_TweenService_0 (ref), l_Main_0 (copy)
                if v31.Parent then
                    local v33 = l_TweenService_0:Create(l_Main_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Transparency = 1
                    });
                    v33:Play();
                    v33.Completed:Wait();
                end;
                v31:Destroy();
            end);
            local v34 = false;
            v30:Add(l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 98 ]]
                -- upvalues: v19 (ref), v23 (ref), v22 (ref), v15 (ref), v31 (copy), l_Main_0 (copy), v34 (ref), l_TweenService_0 (ref)
                local l_v19_Attribute_0 = v19:GetAttribute("ChargeRadius");
                local v37 = v19:GetAttribute("ChargePercent") or 0;
                local v38 = v23.HipHeight + 0.5 * v22.Size.Y;
                local v39 = v22.CFrame * CFrame.new(0, -v38, 0) * v15.SlamOffset;
                v31:PivotTo(v39);
                if l_v19_Attribute_0 then
                    l_Main_0.Size = Vector3.new(l_Main_0.Size.X, l_v19_Attribute_0 * 2, l_v19_Attribute_0 * 2);
                    v31.Parent = workspace;
                    if v37 >= 1 and not v34 then
                        v34 = true;
                        l_TweenService_0:Create(l_Main_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Transparency = 0.5, 
                            Color = Color3.fromRGB(97, 173, 255)
                        }):Play();
                    end;
                end;
            end));
            local v40 = coroutine.running();
            v30:Add(v5.Released:Connect(function() --[[ Line: 139 ]]
                -- upvalues: v40 (copy)
                task.spawn(v40, false);
            end));
            v30:Add(v25.Destroying:Connect(function() --[[ Line: 143 ]]
                -- upvalues: v40 (copy)
                task.spawn(v40, true);
            end));
            local v41 = v10.new();
            local v42 = false;
            local _ = task.spawn(function() --[[ Line: 149 ]]
                -- upvalues: v12 (ref), v30 (copy), v40 (copy), v42 (ref), v41 (copy)
                local l_status_0, l_result_0 = pcall(v12.InvokeServer, v12);
                if (not l_status_0 or not l_result_0) and not v30:IsDestroyed() then
                    task.spawn(v40, nil);
                end;
                v42 = true;
                v41:Fire();
            end);
            local v46 = coroutine.yield();
            v30:Destroy();
            if v46 ~= nil then
                v13:FireServer(v46);
            end;
            if not v42 then
                v41:Wait();
            end;
            v27 = false;
            return;
        end;
    end));
    v19.Unequipped:Connect(function() --[[ Line: 174 ]]
        -- upvalues: v25 (copy)
        v25:Destroy();
    end);
    v23.Died:Once(function() --[[ Line: 177 ]]
        -- upvalues: v25 (copy)
        v25:Destroy();
    end);
    v19.AncestryChanged:Connect(function(v47) --[[ Line: 180 ]]
        -- upvalues: v21 (copy), v25 (copy)
        if v47 ~= v21 then
            v25:Destroy();
        end;
    end);
end);