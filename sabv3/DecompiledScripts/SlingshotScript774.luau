local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ToolsExtras_0 = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v7 = require(l_Packages_0.Net);
local v8 = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v11 = 0;
local v12 = nil;
local v13 = false;
local v14 = nil;
local v15 = 0;
local function _() --[[ Line: 31 ]] --[[ Name: initializeAimArch ]]
    -- upvalues: v12 (ref)
    if v12 then
        v12:Destroy();
    end;
    v12 = Instance.new("Folder");
    v12.Name = "SlingshotAimArch";
    v12.Parent = workspace;
end;
local function _() --[[ Line: 42 ]] --[[ Name: clearAimArch ]]
    -- upvalues: v12 (ref)
    if v12 then
        v12:ClearAllChildren();
    end;
end;
local function v30(v18, v19, v20, v21) --[[ Line: 49 ]] --[[ Name: calculateTrajectoryWithCollision ]]
    -- upvalues: l_Parent_1 (copy), v12 (ref)
    local v22 = {};
    local l_v18_0 = v18;
    local l_v19_0 = v19;
    local v25 = 0;
    local v26 = RaycastParams.new();
    v26.FilterType = Enum.RaycastFilterType.Exclude;
    v26.FilterDescendantsInstances = {
        l_Parent_1.Character, 
        v12
    };
    while v25 <= v21 do
        table.insert(v22, l_v18_0);
        local v27 = l_v18_0 + l_v19_0 * v20;
        local v28 = l_v19_0 + Vector3.new(0, -196.1999969482422, 0, 0) * v20;
        local v29 = workspace:Raycast(l_v18_0, v27 - l_v18_0, v26);
        if v29 then
            table.insert(v22, v29.Position);
            return v22;
        else
            l_v18_0 = v27;
            l_v19_0 = v28;
            v25 = v25 + v20;
            if l_v18_0.Y <= -100 then
                break;
            end;
        end;
    end;
    return v22;
end;
local function v53(v31, v32) --[[ Line: 89 ]] --[[ Name: createAimArch ]]
    -- upvalues: v12 (ref), l_Parent_1 (copy), v11 (ref), v30 (copy), l_ToolsExtras_0 (copy), l_TweenService_0 (copy)
    if v12 then
        v12:ClearAllChildren();
    end;
    local l_Character_0 = l_Parent_1.Character;
    if not l_Character_0 then
        return;
    else
        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            return;
        else
            local v35 = math.clamp(math.max(0, os.clock() - v11), 0.4, 1);
            local v36 = l_HumanoidRootPart_0.Position + Vector3.new(0, 2, 0, 0);
            local v37 = (v31 - l_HumanoidRootPart_0.Position).Unit * 200 * v35;
            local v38 = v30(v36, v37, 0.05, 8);
            v32 = v32 or "dots";
            if v32 == "dots" then
                for v39, v40 in ipairs(v38) do
                    if v39 % 2 == 0 then
                        local l_Part_0 = Instance.new("Part");
                        l_Part_0.Name = "AimDot";
                        l_Part_0.Shape = Enum.PartType.Ball;
                        l_Part_0.Material = Enum.Material.Neon;
                        local v42 = v39 / #v38;
                        local v43 = Color3.new(v42, 1 - v42, 0);
                        l_Part_0.Color = v43;
                        l_Part_0.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
                        l_Part_0.Position = v40;
                        l_Part_0.CanCollide = false;
                        l_Part_0.Anchored = true;
                        l_Part_0.Transparency = 0.2;
                        l_Part_0.Parent = v12;
                        local l_PointLight_0 = Instance.new("PointLight");
                        l_PointLight_0.Color = v43;
                        l_PointLight_0.Brightness = 0.5;
                        l_PointLight_0.Range = 2;
                        l_PointLight_0.Parent = l_Part_0;
                    end;
                end;
            elseif v32 == "line" then
                for v45 = 1, #v38 - 1 do
                    local v46 = v38[v45];
                    local v47 = v38[v45 + 1];
                    local l_Magnitude_0 = (v47 - v46).Magnitude;
                    local v49 = (v46 + v47) / 2;
                    local l_Part_1 = Instance.new("Part");
                    l_Part_1.Name = "AimLine";
                    l_Part_1.Shape = Enum.PartType.Block;
                    l_Part_1.Material = Enum.Material.Neon;
                    l_Part_1.Color = Color3.fromRGB(255, 0, 0);
                    l_Part_1.Size = Vector3.new(0.1, 0.1, l_Magnitude_0);
                    l_Part_1.CFrame = CFrame.lookAt(v49, v47);
                    l_Part_1.CanCollide = false;
                    l_Part_1.Anchored = true;
                    l_Part_1.Transparency = 0.6;
                    l_Part_1.Parent = v12;
                end;
            end;
            if #v38 > 0 then
                local v51 = v38[#v38];
                local v52 = l_ToolsExtras_0.Ring.Union:Clone();
                v52.Name = "LandingIndicator";
                v52.Size = Vector3.new(12, 0.25, 12, 0);
                v52.Position = v51 + Vector3.new(0, 0.10000000149011612, 0, 0);
                v52.Parent = v12;
                l_TweenService_0:Create(v52, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                    Transparency = 0.8
                }):Play();
            end;
            return;
        end;
    end;
end;
local function v56() --[[ Line: 197 ]] --[[ Name: updateAimArch ]]
    -- upvalues: v13 (ref), v15 (ref), l_ReplicatedStorage_0 (copy), v53 (copy)
    if not v13 then
        return;
    else
        local v54 = tick();
        if v54 - v15 < 0.05 then
            return;
        else
            v15 = v54;
            local v55 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
            v53(v55.Hit.Position, "line");
            return;
        end;
    end;
end;
l_Parent_0.Equipped:Connect(function() --[[ Line: 210 ]]
    -- upvalues: v12 (ref)
    if v12 then
        v12:Destroy();
    end;
    v12 = Instance.new("Folder");
    v12.Name = "SlingshotAimArch";
    v12.Parent = workspace;
end);
l_Parent_0.Activated:Connect(function() --[[ Line: 214 ]]
    -- upvalues: v8 (copy), v11 (ref), v13 (ref), v14 (ref), l_RunService_0 (copy), v56 (copy)
    if v8("ItemUse/Slingshot/", 10) then
        return;
    else
        v11 = os.clock();
        v13 = true;
        v14 = l_RunService_0.Heartbeat:Connect(v56);
        return;
    end;
end);
l_Parent_0.Deactivated:Connect(function() --[[ Line: 226 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v11 (ref), v13 (ref), v14 (ref), v12 (ref), v7 (copy)
    local _ = game.Players.LocalPlayer;
    local v58 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    local v59 = os.clock() - v11;
    v13 = false;
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    if v12 then
        v12:ClearAllChildren();
    end;
    v7:RemoteEvent("UseItem"):FireServer(v59, v58.Hit.Position, v58.Target);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 244 ]]
    -- upvalues: v13 (ref), v14 (ref), v12 (ref)
    v13 = false;
    if v14 then
        v14:Disconnect();
        v14 = nil;
    end;
    if v12 then
        v12:Destroy();
        v12 = nil;
    end;
end);