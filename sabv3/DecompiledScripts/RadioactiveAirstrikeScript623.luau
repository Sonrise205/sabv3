local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v6 = require(l_Packages_0.Net);
local l_Parent_0 = script.Parent;
local v8 = RaycastParams.new();
v8.FilterType = Enum.RaycastFilterType.Exclude;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local function _() --[[ Line: 22 ]] --[[ Name: StopPulse ]]
    -- upvalues: v10 (ref)
    if v10 then
        if coroutine.status(v10) ~= "suspended" then
            task.cancel(v10);
        end;
        v10 = nil;
    end;
end;
local function _() --[[ Line: 31 ]] --[[ Name: StarPulse ]]
    -- upvalues: v10 (ref), v9 (ref), l_TweenService_0 (copy)
    if v10 then
        return;
    else
        v10 = task.spawn(function() --[[ Line: 33 ]]
            -- upvalues: v9 (ref), l_TweenService_0 (ref), v10 (ref)
            while true do
                if v9 then
                    local v13 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    local v14 = l_TweenService_0:Create(v9, v13, {
                        Transparency = 0.3
                    });
                    v14:Play();
                    v14.Completed:Wait();
                    if not v9 or not v9.Parent then
                        return;
                    else
                        local v15 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                        local v16 = l_TweenService_0:Create(v9, v15, {
                            Transparency = 0.7
                        });
                        v16:Play();
                        v16.Completed:Wait();
                    end;
                else
                    v10 = nil;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
local function v23() --[[ Line: 57 ]] --[[ Name: CreateCircle ]]
    -- upvalues: v9 (ref), v10 (ref), l_TweenService_0 (copy)
    if v9 and v9.Parent then
        return v9;
    else
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Size = Vector3.new(36, 0.10000000149011612, 36, 0);
        l_Part_0.Color = Color3.fromRGB(255, 0, 0);
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Transparency = 0.3;
        l_Part_0.CanCollide = false;
        l_Part_0.CanQuery = false;
        l_Part_0.CanTouch = false;
        l_Part_0.Anchored = true;
        Instance.new("CylinderMesh").Parent = l_Part_0;
        l_Part_0.Orientation = Vector3.new(0, 0, 0, 0);
        l_Part_0.Parent = workspace;
        v9 = l_Part_0;
        if not v10 then
            v10 = task.spawn(function() --[[ Line: 33 ]]
                -- upvalues: v9 (ref), l_TweenService_0 (ref), v10 (ref)
                while true do
                    if v9 then
                        local v19 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        local v20 = l_TweenService_0:Create(v9, v19, {
                            Transparency = 0.3
                        });
                        v20:Play();
                        v20.Completed:Wait();
                        if not v9 or not v9.Parent then
                            return;
                        else
                            local v21 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                            local v22 = l_TweenService_0:Create(v9, v21, {
                                Transparency = 0.7
                            });
                            v22:Play();
                            v22.Completed:Wait();
                        end;
                    else
                        v10 = nil;
                        return;
                    end;
                end;
            end);
        end;
        return v9;
    end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 83 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v6 (copy), v11 (ref)
    local v24 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    v6:RemoteEvent("UseItem"):FireServer(v11 and v11 or v24.Hit.Position);
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 88 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy), l_Parent_0 (copy), v11 (ref), v23 (copy), l_Players_0 (copy), v8 (copy)
    local v25 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        l_RunService_0:UnbindFromRenderStep("ShowCircle");
        l_RunService_0:BindToRenderStep("ShowCircle", Enum.RenderPriority.Character.Value + 1, function() --[[ Line: 94 ]]
            -- upvalues: l_Parent_0 (ref), v11 (ref), v23 (ref), v25 (copy), l_Players_0 (ref), l_LocalPlayer_0 (ref), v8 (ref), l_Character_0 (copy)
            if l_Parent_0:GetAttribute("CooldownTime") then
                v11 = nil;
                return;
            else
                local v27 = v23();
                local l_Hit_0 = v25.Hit;
                if not l_Hit_0 then
                    v11 = nil;
                    return;
                else
                    local v29 = l_Hit_0.Position + Vector3.new(0, 5, 0, 0);
                    local v30 = {};
                    for _, v32 in l_Players_0:GetPlayers() do
                        if v32 ~= l_LocalPlayer_0 then
                            local l_Character_1 = v32.Character;
                            if l_Character_1 then
                                table.insert(v30, l_Character_1);
                            end;
                        end;
                    end;
                    v8.FilterDescendantsInstances = {
                        l_Character_0, 
                        table.unpack(v30)
                    };
                    local v34 = workspace:Raycast(v29, Vector3.new(0, -50, 0, 0), v8);
                    if v34 then
                        v27.Position = v34.Position + Vector3.new(0, 0.019999999552965164, 0, 0);
                        v11 = v34.Position + Vector3.new(0, 0.019999999552965164, 0, 0);
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 129 ]]
    -- upvalues: l_RunService_0 (copy), v10 (ref), v9 (ref)
    l_RunService_0:UnbindFromRenderStep("ShowCircle");
    if v10 then
        if coroutine.status(v10) ~= "suspended" then
            task.cancel(v10);
        end;
        v10 = nil;
    end;
    if v9 then
        v9:Destroy();
        v9 = nil;
    end;
end);
l_Parent_0:GetAttributeChangedSignal("CooldownTime"):Connect(function() --[[ Line: 138 ]]
    -- upvalues: l_Parent_0 (copy), v10 (ref), v11 (ref), v9 (ref)
    if l_Parent_0:GetAttribute("CooldownTime") then
        if v10 then
            if coroutine.status(v10) ~= "suspended" then
                task.cancel(v10);
            end;
            v10 = nil;
        end;
        v11 = nil;
        if v9 then
            v9:Destroy();
            v9 = nil;
        end;
    end;
end);