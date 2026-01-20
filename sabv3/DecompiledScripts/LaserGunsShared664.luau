local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("SoundService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local v7 = require(l_ReplicatedStorage_0.Packages.Net);
local v8 = require(l_ReplicatedStorage_0.Classes.Projectile);
local _ = require(l_ReplicatedStorage_0.UserGenerated.VFX.Emit);
local v10 = require(l_ReplicatedStorage_0.UserGenerated.SFX.PlaySFX);
local v11 = require(l_ReplicatedStorage_0.UserGenerated.VFX.PlayVFX);
local v12 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local _ = require(l_ReplicatedStorage_0.UserGenerated.Lang.Finally);
local v14 = require(l_ReplicatedStorage_0.UserGenerated.FastFlags);
local l_Sounds_0 = script:WaitForChild("Sounds");
local l_Particles_0 = script:WaitForChild("Particles");
local l_Projectile_0 = script:WaitForChild("Models"):WaitForChild("Projectile");
local _ = Random.new();
local v19 = table.freeze({
    Speed = v14.Replicated("LaserGun.Speed", v12.FinitePositive, 100), 
    Radius = v14.Replicated("LaserGun.Radius", v12.FiniteNonNegative, 0), 
    Gravity = Vector3.new(0, 0, 0, 0), 
    MaxAge = v14.Replicated("LaserGun.MaxAge", v12.FinitePositive, 5), 
    TrackingRadius = v14.Replicated("LaserGun.TrackingRadius", v12.Optional(v12.FiniteNonNegative), 3), 
    TrackingFalloff = v14.Replicated("LaserGun.TrackingFalloff", v12.Optional(v12.FiniteNonNegative), 0.005), 
    TrackingResponse = v14.Replicated("LaserGun.TrackingResponse", v12.Optional(v12.FiniteNonNegative), 10), 
    MaxBounces = v14.Replicated("LaserGun.MaxBounces", v12.IntegerNonNegative, 8), 
    Cooldown = v14.Replicated("LaserGun.Cooldown", v12.FiniteNonNegative, 2.2), 
    ImpulseForce = v14.Replicated("LaserGun.ImpulseForce", v12.FiniteNonNegative, 1200), 
    StunDuration = v14.Replicated("LaserGun.StunDuration", v12.FiniteNonNegative, 1.8)
});
local function v22(v20) --[[ Line: 87 ]] --[[ Name: ComputeImpulseForce ]]
    -- upvalues: v19 (copy)
    local v21 = ((v20.Attributes.Bounces or 1) - 1) * 0.25 + 1;
    return v19.ImpulseForce:Get() * v21;
end;
local function v25(v23) --[[ Line: 93 ]] --[[ Name: ComputeStunDuration ]]
    -- upvalues: v19 (copy)
    local v24 = ((v23.Attributes.Bounces or 1) - 1) * 0.25 + 1;
    return v19.StunDuration:Get() * v24;
end;
local function _(v26, v27) --[[ Line: 99 ]] --[[ Name: RandomizePitch ]]
    v26.PlaybackSpeed = v26.PlaybackSpeed * (1 - v27 + v27 * 2 * math.random());
    return v26;
end;
local v29 = {};
local function v52(v30, v31) --[[ Line: 105 ]] --[[ Name: ImpactCharacter ]]
    -- upvalues: v29 (copy), v11 (copy), l_Particles_0 (copy), v10 (copy), l_Sounds_0 (copy), v19 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
    if not v31.HitPart then
        return;
    else
        local l_Character_0 = v31.Character;
        if not l_Character_0 then
            return;
        else
            local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
            if not l_PrimaryPart_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
                if not l_Humanoid_0 then
                    return;
                elseif v29[v30] then
                    return;
                else
                    v29[v30] = true;
                    local _ = v31.Attributes.Bounces or 0;
                    v11(l_PrimaryPart_0, l_PrimaryPart_0.CFrame, l_Particles_0:WaitForChild("ImpactCharacter"):Clone());
                    local l_v10_0 = v10;
                    local l_l_PrimaryPart_0_0 = l_PrimaryPart_0;
                    local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                    local v39 = l_Sounds_0:WaitForChild("ImpactCharacter"):Clone();
                    v39.PlaybackSpeed = v39.PlaybackSpeed * (0.9 + 0.2 * math.random());
                    l_v10_0(l_l_PrimaryPart_0_0, l_CFrame_0, v39);
                    l_v10_0 = v10;
                    l_l_PrimaryPart_0_0 = l_PrimaryPart_0;
                    l_CFrame_0 = l_PrimaryPart_0.CFrame;
                    v39 = l_Sounds_0:WaitForChild("FireFaded5s"):Clone();
                    v39.PlaybackSpeed = v39.PlaybackSpeed * (0.9 + 0.2 * math.random());
                    l_v10_0(l_l_PrimaryPart_0_0, l_CFrame_0, v39);
                    l_v10_0 = l_Humanoid_0.HipHeight + 0.5 * l_PrimaryPart_0.Size.Y;
                    l_l_PrimaryPart_0_0 = l_PrimaryPart_0.CFrame * CFrame.new(0, -l_v10_0, 0);
                    l_CFrame_0 = Instance.new("Attachment");
                    l_CFrame_0.CFrame = l_PrimaryPart_0.CFrame:ToObjectSpace(l_l_PrimaryPart_0_0);
                    for _, v41 in ipairs(l_Particles_0:WaitForChild("Smoke1"):GetChildren()) do
                        v41:Clone().Parent = l_CFrame_0;
                    end;
                    l_CFrame_0.Parent = l_PrimaryPart_0;
                    local l_Attachment_0 = Instance.new("Attachment");
                    for _, v44 in ipairs(l_Particles_0:WaitForChild("Smoke2"):GetChildren()) do
                        v44:Clone().Parent = l_Attachment_0;
                    end;
                    l_Attachment_0.Parent = l_PrimaryPart_0;
                    v39 = Instance.new("Highlight");
                    v39.Adornee = l_Character_0;
                    v39.Name = "BurnEffect";
                    v39.FillColor = Color3.fromRGB(0, 0, 0);
                    v39.FillTransparency = 1;
                    v39.OutlineTransparency = 1;
                    v39.DepthMode = Enum.HighlightDepthMode.Occluded;
                    v39.Parent = l_Character_0;
                    local v45 = ((v31.Attributes.Bounces or 1) - 1) * 0.25 + 1;
                    local v46 = v19.StunDuration:Get() * v45;
                    local v47 = l_TweenService_0:Create(v39, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        FillTransparency = 0
                    });
                    v47:Play();
                    v47.Completed:Wait();
                    task.wait(v46 - 1);
                    for _, v49 in ipairs(l_CFrame_0:GetDescendants()) do
                        if v49:IsA("ParticleEmitter") then
                            v49.Enabled = false;
                        end;
                    end;
                    l_Debris_0:AddItem(l_CFrame_0, 5);
                    for _, v51 in ipairs(l_Attachment_0:GetDescendants()) do
                        if v51:IsA("ParticleEmitter") then
                            v51.Enabled = false;
                        end;
                    end;
                    l_Debris_0:AddItem(l_Attachment_0, 5);
                    v45 = l_TweenService_0:Create(v39, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        FillTransparency = 1
                    });
                    v45:Play();
                    v45.Completed:Wait();
                    v39:Destroy();
                    v29[v30] = nil;
                    return;
                end;
            end;
        end;
    end;
end;
local function v73(v53, v54) --[[ Line: 206 ]] --[[ Name: HandleHit ]]
    -- upvalues: v19 (copy), v52 (copy), v11 (copy), l_Particles_0 (copy), v10 (copy), l_Sounds_0 (copy)
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local v56 = (v53.Attributes.Bounces or 0) + 1;
    v53.Attributes.Bounces = v56;
    local l_Instance_0 = v54.Instance;
    local l_Position_0 = v54.Position;
    local l_Normal_0 = v54.Normal;
    local l_LinearVelocity_0 = v53.LinearVelocity;
    local v61 = l_LinearVelocity_0 - 2 * l_LinearVelocity_0:Dot(l_Normal_0) * l_Normal_0;
    if v53.TrackingFalloff then
        v53.TrackingFalloff = v53.TrackingFalloff / 2;
    end;
    if v53.TrackingResponse then
        v53.TrackingResponse = v53.TrackingResponse * 2;
    end;
    v53.LinearVelocity = v61;
    v53.MaxAge = v53.Age + v19.MaxAge:Get();
    local v62 = CFrame.lookAlong(l_Position_0 + l_Normal_0 * 0.001, v61);
    local v63 = {
        Timestamp = l_workspace_ServerTimeNow_0, 
        CFrame = v53.CFrame, 
        LinearVelocity = v53.LinearVelocity, 
        Age = v53.Age, 
        HitPart = l_Instance_0, 
        HitNormal = l_Normal_0, 
        HitPosition = l_Position_0, 
        HitEnding = v54.Ending, 
        HitAlpha = v54.Alpha, 
        HitSize = l_Instance_0.Size, 
        HitCFrame = l_Instance_0.CFrame, 
        Attributes = table.clone(v53.Attributes)
    };
    local l_l_Instance_0_FirstAncestorOfClass_0 = l_Instance_0:FindFirstAncestorOfClass("Model");
    if l_l_Instance_0_FirstAncestorOfClass_0 and l_l_Instance_0_FirstAncestorOfClass_0.PrimaryPart and l_l_Instance_0_FirstAncestorOfClass_0:FindFirstChildOfClass("Humanoid") then
        v63.Character = l_l_Instance_0_FirstAncestorOfClass_0;
    end;
    table.insert(v53.Impacts, table.freeze(v63));
    if v63.Character then
        v53:Destroy();
        if v53.Model then
            task.spawn(function() --[[ Line: 271 ]]

            end);
            task.spawn(v52, v53.Id, v63);
        end;
        return;
    else
        if v56 <= v19.MaxBounces:Get() then
            if v53.Model then
                task.spawn(function() --[[ Line: 280 ]]
                    -- upvalues: v11 (ref), l_Instance_0 (copy), v62 (copy), l_Particles_0 (ref), v10 (ref), l_Sounds_0 (ref)
                    v11(l_Instance_0, v62, l_Particles_0:WaitForChild("ImpactBounce"):Clone());
                    local l_v10_1 = v10;
                    local l_l_Instance_0_0 = l_Instance_0;
                    local l_v62_0 = v62;
                    local v68 = l_Sounds_0:WaitForChild("ImpactBounce"):Clone();
                    v68.PlaybackSpeed = v68.PlaybackSpeed * (0.9 + 0.2 * math.random());
                    l_v10_1(l_l_Instance_0_0, l_v62_0, v68);
                end);
                return;
            end;
        else
            v53:Destroy();
            if v53.Model then
                task.spawn(function() --[[ Line: 296 ]]
                    -- upvalues: v11 (ref), l_Instance_0 (copy), v62 (copy), l_Particles_0 (ref), v10 (ref), l_Sounds_0 (ref)
                    v11(l_Instance_0, v62, l_Particles_0:WaitForChild("ImpactFinal"):Clone());
                    local l_v10_2 = v10;
                    local l_l_Instance_0_1 = l_Instance_0;
                    local l_v62_1 = v62;
                    local v72 = l_Sounds_0:WaitForChild("ImpactFinal"):Clone();
                    v72.PlaybackSpeed = v72.PlaybackSpeed * (0.9 + 0.2 * math.random());
                    l_v10_2(l_l_Instance_0_1, l_v62_1, v72);
                end);
            end;
        end;
        return;
    end;
end;
local function v78(v74) --[[ Line: 318 ]] --[[ Name: GetSourceInfo ]]
    if not v74 or not v74:IsA("Model") then
        return nil;
    else
        local l_Tool_0 = v74:FindFirstChildOfClass("Tool");
        if not l_Tool_0 or l_Tool_0.Name ~= "Laser Gun" then
            return nil;
        else
            local l_Handle_0 = l_Tool_0:FindFirstChild("Handle");
            if not l_Handle_0 or not l_Handle_0:IsA("BasePart") then
                return nil;
            else
                local l_Muzzle_0 = l_Handle_0:FindFirstChild("Muzzle");
                if not l_Muzzle_0 or not l_Muzzle_0:IsA("Attachment") then
                    return nil;
                else
                    return {
                        Character = v74, 
                        Tool = l_Tool_0, 
                        Handle = l_Handle_0, 
                        Muzzle = l_Muzzle_0
                    };
                end;
            end;
        end;
    end;
end;
local function v84(v79, v80, v81) --[[ Line: 342 ]] --[[ Name: SharedShoot ]]
    -- upvalues: v8 (copy), v19 (copy), v73 (copy)
    local v82 = v8.new({
        Id = v79.Id, 
        CreationTime = v79.Timestamp, 
        Origin = v79.Origin, 
        LinearVelocity = v79.Direction * v19.Speed:Get(), 
        Radius = v19.Radius:Get(), 
        Gravity = v19.Gravity, 
        MaxAge = v19.MaxAge:Get(), 
        TrackingRadius = v19.TrackingRadius:Get(), 
        TrackingFalloff = v19.TrackingFalloff:Get(), 
        TrackingResponse = v19.TrackingResponse:Get(), 
        FilterDescendantsInstances = {
            v80.Character
        }, 
        TemplateModel = v81
    });
    v82.Hit:Connect(function(v83) --[[ Line: 363 ]]
        -- upvalues: v73 (ref), v82 (copy)
        v73(v82, v83);
    end);
    return v82;
end;
local function _(v85) --[[ Line: 370 ]] --[[ Name: ClientShoot ]]
    -- upvalues: v78 (copy), v10 (copy), l_Sounds_0 (copy), v11 (copy), l_Particles_0 (copy), v19 (copy), v84 (copy), l_Projectile_0 (copy)
    local v86 = v78(v85.Character);
    if not v86 then
        return nil;
    else
        task.spawn(function() --[[ Line: 376 ]]
            -- upvalues: v10 (ref), v86 (copy), l_Sounds_0 (ref), v11 (ref), l_Particles_0 (ref), v19 (ref)
            local l_v10_3 = v10;
            local l_Handle_1 = v86.Handle;
            local l_WorldCFrame_0 = v86.Muzzle.WorldCFrame;
            local v90 = l_Sounds_0:WaitForChild("Fire"):Clone();
            v90.PlaybackSpeed = v90.PlaybackSpeed * (0.9 + 0.2 * math.random());
            l_v10_3(l_Handle_1, l_WorldCFrame_0, v90);
            v11(v86.Handle, v86.Muzzle.WorldCFrame, l_Particles_0:WaitForChild("Fire"):Clone());
            l_v10_3 = v86.Tool.Handle.Mesh.VertexColor;
            v86.Tool.Handle.Mesh.VertexColor = l_v10_3 * 0.1;
            task.delay(v19.Cooldown:Get(), function() --[[ Line: 389 ]]
                -- upvalues: v86 (ref), l_v10_3 (copy), v10 (ref), l_Sounds_0 (ref)
                v86.Tool.Handle.Mesh.VertexColor = l_v10_3;
                local l_v10_4 = v10;
                local l_Handle_2 = v86.Handle;
                local l_WorldCFrame_1 = v86.Muzzle.WorldCFrame;
                local v94 = l_Sounds_0:WaitForChild("Reload"):Clone();
                v94.PlaybackSpeed = v94.PlaybackSpeed * (0.9 + 0.2 * math.random());
                l_v10_4(l_Handle_2, l_WorldCFrame_1, v94);
            end);
        end);
        return (v84(v85, v86, l_Projectile_0));
    end;
end;
local function v111() --[[ Line: 404 ]] --[[ Name: ShootLocal ]]
    -- upvalues: v78 (copy), l_Players_0 (copy), v8 (copy), l_HttpService_0 (copy), v7 (copy), v10 (copy), l_Sounds_0 (copy), v11 (copy), l_Particles_0 (copy), v19 (copy), v84 (copy), l_Projectile_0 (copy)
    local v96 = v78(l_Players_0.LocalPlayer.Character);
    if not v96 then
        return;
    else
        local l_Position_1 = v96.Muzzle.WorldCFrame.Position;
        local v98 = v8.PickTarget({
            FilterDescendantsInstances = {
                v96.Character
            }
        });
        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
        local v100 = {
            Id = l_HttpService_0:GenerateGUID(false):lower():gsub("%-", ""), 
            Character = v96.Character, 
            Origin = l_Position_1, 
            Direction = (v98 - l_Position_1).Unit, 
            Timestamp = l_workspace_ServerTimeNow_1
        };
        task.spawn(function() --[[ Line: 419 ]]
            -- upvalues: v7 (ref), v100 (copy)
            v7:RemoteEvent("LaserGun_Fire"):FireServer(v100.Id, v100.Origin, v100.Direction, v100.Timestamp);
        end);
        local v101 = v78(v100.Character);
        local v102;
        if not v101 then
            v102 = nil;
        else
            task.spawn(function() --[[ Line: 376 ]]
                -- upvalues: v10 (ref), v101 (copy), l_Sounds_0 (ref), v11 (ref), l_Particles_0 (ref), v19 (ref)
                local l_v10_5 = v10;
                local l_Handle_3 = v101.Handle;
                local l_WorldCFrame_2 = v101.Muzzle.WorldCFrame;
                local v106 = l_Sounds_0:WaitForChild("Fire"):Clone();
                v106.PlaybackSpeed = v106.PlaybackSpeed * (0.9 + 0.2 * math.random());
                l_v10_5(l_Handle_3, l_WorldCFrame_2, v106);
                v11(v101.Handle, v101.Muzzle.WorldCFrame, l_Particles_0:WaitForChild("Fire"):Clone());
                l_v10_5 = v101.Tool.Handle.Mesh.VertexColor;
                v101.Tool.Handle.Mesh.VertexColor = l_v10_5 * 0.1;
                task.delay(v19.Cooldown:Get(), function() --[[ Line: 389 ]]
                    -- upvalues: v101 (ref), l_v10_5 (copy), v10 (ref), l_Sounds_0 (ref)
                    v101.Tool.Handle.Mesh.VertexColor = l_v10_5;
                    local l_v10_6 = v10;
                    local l_Handle_4 = v101.Handle;
                    local l_WorldCFrame_3 = v101.Muzzle.WorldCFrame;
                    local v110 = l_Sounds_0:WaitForChild("Reload"):Clone();
                    v110.PlaybackSpeed = v110.PlaybackSpeed * (0.9 + 0.2 * math.random());
                    l_v10_6(l_Handle_4, l_WorldCFrame_3, v110);
                end);
            end);
            v102 = v84(v100, v101, l_Projectile_0);
        end;
        if v102 then
            v102.Destroying:Connect(function() --[[ Line: 429 ]]
                -- upvalues: v7 (ref), v102 (copy)
                v7:RemoteEvent("LaserGun_Impact"):FireServer(v102.Id, v102.Impacts);
            end);
        end;
        return;
    end;
end;
if l_RunService_0:IsClient() then
    task.spawn(function() --[[ Line: 436 ]]
        -- upvalues: v7 (copy), v78 (copy), v10 (copy), l_Sounds_0 (copy), v11 (copy), l_Particles_0 (copy), v19 (copy), v84 (copy), l_Projectile_0 (copy), v52 (copy)
        v7:RemoteEvent("LaserGun_Fire").OnClientEvent:Connect(function(v112) --[[ Line: 437 ]]
            -- upvalues: v78 (ref), v10 (ref), l_Sounds_0 (ref), v11 (ref), l_Particles_0 (ref), v19 (ref), v84 (ref), l_Projectile_0 (ref)
            local v113 = v78(v112.Character);
            if not v113 then
                return;
            else
                task.spawn(function() --[[ Line: 376 ]]
                    -- upvalues: v10 (ref), v113 (copy), l_Sounds_0 (ref), v11 (ref), l_Particles_0 (ref), v19 (ref)
                    local l_v10_7 = v10;
                    local l_Handle_5 = v113.Handle;
                    local l_WorldCFrame_4 = v113.Muzzle.WorldCFrame;
                    local v117 = l_Sounds_0:WaitForChild("Fire"):Clone();
                    v117.PlaybackSpeed = v117.PlaybackSpeed * (0.9 + 0.2 * math.random());
                    l_v10_7(l_Handle_5, l_WorldCFrame_4, v117);
                    v11(v113.Handle, v113.Muzzle.WorldCFrame, l_Particles_0:WaitForChild("Fire"):Clone());
                    l_v10_7 = v113.Tool.Handle.Mesh.VertexColor;
                    v113.Tool.Handle.Mesh.VertexColor = l_v10_7 * 0.1;
                    task.delay(v19.Cooldown:Get(), function() --[[ Line: 389 ]]
                        -- upvalues: v113 (ref), l_v10_7 (copy), v10 (ref), l_Sounds_0 (ref)
                        v113.Tool.Handle.Mesh.VertexColor = l_v10_7;
                        local l_v10_8 = v10;
                        local l_Handle_6 = v113.Handle;
                        local l_WorldCFrame_5 = v113.Muzzle.WorldCFrame;
                        local v121 = l_Sounds_0:WaitForChild("Reload"):Clone();
                        v121.PlaybackSpeed = v121.PlaybackSpeed * (0.9 + 0.2 * math.random());
                        l_v10_8(l_Handle_6, l_WorldCFrame_5, v121);
                    end);
                end);
                local _ = v84(v112, v113, l_Projectile_0);
                return;
            end;
        end);
        v7:RemoteEvent("LaserGun_ImpactCharacter").OnClientEvent:Connect(function(v123, v124) --[[ Line: 442 ]]
            -- upvalues: v52 (ref)
            v52(v123, v124);
        end);
    end);
end;
return table.freeze({
    Settings = v19, 
    ShootLocal = v111, 
    GetSourceInfo = v78, 
    SharedShoot = v84, 
    ComputeImpulseForce = v22, 
    ComputeStunDuration = v25
});