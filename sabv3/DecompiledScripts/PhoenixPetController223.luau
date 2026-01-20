local l_Debris_0 = game:GetService("Debris");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local _ = require(l_Controllers_0.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v11 = require(l_Packages_0.Net):RemoteEvent("UseItem");
local v12 = {};
local v13 = {};
local v14 = {};
local function _(v15, v16) --[[ Line: 27 ]] --[[ Name: smoothAlpha ]]
    return 1 - math.exp(-math.clamp(v16, 0, 60) * v15);
end;
local function v44(v18) --[[ Line: 31 ]] --[[ Name: StartOrbitFor ]]
    -- upvalues: v12 (copy), l_Players_0 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy)
    if v12[v18] then
        return;
    elseif not v18 or not v18.Parent then
        return;
    else
        local l_v18_Attribute_0 = v18:GetAttribute("OwnerUserId");
        local v20 = v18:GetAttribute("StartTime") or workspace:GetServerTimeNow();
        if not l_v18_Attribute_0 then
            return;
        else
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(l_v18_Attribute_0);
            if not l_l_Players_0_PlayerByUserId_0 or not l_l_Players_0_PlayerByUserId_0.Character then
                return;
            else
                local l_HumanoidRootPart_0 = l_l_Players_0_PlayerByUserId_0.Character:FindFirstChild("HumanoidRootPart");
                if not l_HumanoidRootPart_0 then
                    return;
                else
                    local l_v18_Pivot_0 = v18:GetPivot();
                    v12[v18] = l_RunService_0.RenderStepped:Connect(function(v24) --[[ Line: 56 ]]
                        -- upvalues: v18 (copy), v12 (ref), l_HumanoidRootPart_0 (ref), l_l_Players_0_PlayerByUserId_0 (copy), v20 (copy), l_v18_Pivot_0 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref)
                        if not v18.Parent then
                            v12[v18]:Disconnect();
                            v12[v18] = nil;
                            return;
                        else
                            l_HumanoidRootPart_0 = l_l_Players_0_PlayerByUserId_0.Character and l_l_Players_0_PlayerByUserId_0.Character:FindFirstChild("HumanoidRootPart") or l_HumanoidRootPart_0;
                            if not l_HumanoidRootPart_0 then
                                return;
                            else
                                local v25 = 0 + 1.0471975511965976 * (workspace:GetServerTimeNow() - v20);
                                local v26 = math.cos(v25) * 6;
                                local v27 = math.sin(v25) * 6;
                                local l_Position_0 = (l_HumanoidRootPart_0.CFrame * CFrame.new(v26, 4, v27)).Position;
                                local v29 = l_HumanoidRootPart_0.Position + Vector3.new(0, 4, 0, 0);
                                local v30 = CFrame.lookAt(l_Position_0, v29);
                                local v31 = 1 - math.exp(-14 * v24);
                                local v32 = 1 - math.exp(-18 * v24);
                                l_v18_Pivot_0 = l_v18_Pivot_0:Lerp(CFrame.new(v30.Position) * CFrame.fromMatrix(Vector3.new(0, 0, 0, 0), v30.RightVector, v30.UpVector), v31);
                                l_v18_Pivot_0 = l_v18_Pivot_0:Lerp(v30, v32);
                                v18:PivotTo(l_v18_Pivot_0);
                                local l_Position_1 = v18:GetPivot().Position;
                                local v34 = nil;
                                local v35 = nil;
                                local v36 = 1e999;
                                for _, v38 in l_Players_0:GetPlayers() do
                                    if v38 ~= l_LocalPlayer_0 and v38.Character then
                                        local l_HumanoidRootPart_1 = v38.Character:FindFirstChild("HumanoidRootPart");
                                        local l_Humanoid_0 = v38.Character:FindFirstChildOfClass("Humanoid");
                                        if l_HumanoidRootPart_1 and l_Humanoid_0 and l_Humanoid_0.Health > 0 then
                                            local l_Magnitude_0 = (l_HumanoidRootPart_1.Position - l_Position_1).Magnitude;
                                            if l_Magnitude_0 <= 25 and l_Magnitude_0 < v36 then
                                                v36 = l_Magnitude_0;
                                                v34 = l_HumanoidRootPart_1;
                                                v35 = l_Humanoid_0;
                                            end;
                                        end;
                                    end;
                                end;
                                if v34 then
                                    local v42 = Vector3.new(v34.Position.X, l_Position_1.Y, v34.Position.Z);
                                    local v43 = CFrame.lookAt(l_Position_1, v42);
                                    v18:PivotTo(v43);
                                end;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end;
end;
local function v48(v45) --[[ Line: 105 ]] --[[ Name: EmitParticules ]]
    for _, v47 in v45:GetDescendants() do
        if v47:IsA("ParticleEmitter") then
            v47:Emit(v47:GetAttribute("EmitCount") or 5);
        end;
    end;
end;
v11.OnClientEvent:Connect(function(v49, v50) --[[ Line: 113 ]]
    -- upvalues: v44 (copy)
    if v49 ~= "SpawnPhoenix" then
        return;
    else
        v44(v50);
        return;
    end;
end);
v11.OnClientEvent:Connect(function(v51, v52) --[[ Line: 120 ]]
    -- upvalues: l_Debris_0 (copy), v13 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v48 (copy)
    if v51 ~= "CreatePhoenixShoot" then
        return;
    else
        local l_UUID_0 = v52.UUID;
        local l_Origin_0 = v52.Origin;
        local l_Direction_0 = v52.Direction;
        local l_ShootSpeed_0 = v52.ShootSpeed;
        local v57 = script.phoenixprojectile:Clone();
        v57.CFrame = CFrame.lookAt(l_Origin_0, l_Origin_0 + l_Direction_0);
        v57.CanCollide = false;
        v57.Anchored = false;
        v57.CanQuery = false;
        v57.Parent = workspace;
        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
        l_BodyVelocity_0.Name = "FlightPower";
        l_BodyVelocity_0.MaxForce = Vector3.new(100000, 100000, 100000, 0);
        l_BodyVelocity_0.Velocity = l_Direction_0 * l_ShootSpeed_0;
        l_BodyVelocity_0.Parent = v57;
        local v59 = script:FindFirstChild("Shoot") and script.Shoot:Clone();
        if v59 then
            v59.Parent = v57;
            v59:Play();
            task.delay(1, function() --[[ Line: 145 ]]
                -- upvalues: v59 (copy)
                v59:Destroy();
            end);
        end;
        l_Debris_0:AddItem(v57, 2);
        v57.Destroying:Once(function() --[[ Line: 152 ]]
            -- upvalues: v13 (ref), l_UUID_0 (copy)
            v13[l_UUID_0] = nil;
        end);
        v13[l_UUID_0] = v57;
        v57.Touched:Connect(function(v60) --[[ Line: 158 ]]
            -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v48 (ref), l_Debris_0 (ref), v57 (copy)
            if not v60 then
                return;
            else
                local l_v60_FirstAncestorOfClass_0 = v60:FindFirstAncestorOfClass("Model");
                if not l_v60_FirstAncestorOfClass_0 then
                    return;
                else
                    local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_v60_FirstAncestorOfClass_0);
                    if l_l_Players_0_PlayerFromCharacter_0 and l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                        if l_l_Players_0_PlayerFromCharacter_0:GetAttribute("Web") then
                            return;
                        else
                            local v63 = script.fireshoot:Clone();
                            v63.CFrame = l_v60_FirstAncestorOfClass_0:GetPivot();
                            v63.Anchored = true;
                            v63.Parent = workspace;
                            task.spawn(function() --[[ Line: 172 ]]
                                -- upvalues: v48 (ref), v63 (copy), l_Debris_0 (ref)
                                v48(v63);
                                l_Debris_0:AddItem(v63, 1);
                            end);
                            v57:Destroy();
                        end;
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end);
v11.OnClientEvent:Connect(function(v64, v65) --[[ Line: 183 ]]
    -- upvalues: v13 (copy)
    if v64 ~= "DestroyPhoenixBullet" then
        return;
    else
        local l_UUID_1 = v65.UUID;
        if v13[l_UUID_1] then
            v13[l_UUID_1]:Destroy();
            v13[l_UUID_1] = nil;
        end;
        return;
    end;
end);
task.spawn(function() --[[ Line: 192 ]]
    -- upvalues: v44 (copy)
    for _, v68 in workspace:GetChildren() do
        if v68:IsA("Model") and v68:GetAttribute("OwnerUserId") and v68:GetAttribute("IsPhoenix") then
            v44(v68);
        end;
    end;
end);
return v14;