--!native
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Debris_0 = game:GetService("Debris");
local _ = game:GetService("Players");
local v6 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v7 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v8 = require(l_ReplicatedStorage_0.Shared.SafeCast);
local v9 = require(l_ReplicatedStorage_0.Classes.Projectile.FindProbableTarget);
local v10 = nil;
if l_RunService_0:IsClient() then
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "__PROJECTILES";
    l_Folder_0.Parent = workspace;
    v10 = l_Folder_0;
end;
local v12 = v7.Table({
    Timestamp = v7.Finite, 
    Character = v7.Optional(v7.Model), 
    CFrame = v7.CFrameFinite, 
    LinearVelocity = v7.Vector3Finite, 
    Age = v7.FiniteNonNegative, 
    Attributes = v7.Map(v7.String, v7.Any), 
    HitPart = v7.BasePart, 
    HitNormal = v7.Vector3Unit, 
    HitPosition = v7.Vector3Finite, 
    HitEnding = v7.Vector3Finite, 
    HitAlpha = v7.Range(0, 1), 
    HitSize = v7.Vector3Positive, 
    HitCFrame = v7.CFrameFinite
});
local v13 = {};
local _ = v6.new();
local v15 = RaycastParams.new();
v15.IgnoreWater = false;
v15.BruteForceAllSlow = false;
v15.RespectCanCollide = true;
v15.CollisionGroup = "Projectile";
v15.FilterType = Enum.RaycastFilterType.Exclude;
v15.FilterDescendantsInstances = {};
local v16 = RaycastParams.new();
v16.IgnoreWater = false;
v16.BruteForceAllSlow = false;
v16.RespectCanCollide = true;
v16.CollisionGroup = "MobFinder";
v16.FilterType = Enum.RaycastFilterType.Exclude;
v16.FilterDescendantsInstances = {};
local v17 = OverlapParams.new();
v17.MaxParts = 100;
v17.BruteForceAllSlow = false;
v17.RespectCanCollide = true;
v17.CollisionGroup = "MobFinder";
v17.FilterType = Enum.RaycastFilterType.Exclude;
v17.FilterDescendantsInstances = {};
local function v19(v18) --[[ Line: 138 ]] --[[ Name: IsDestroyed ]]
    return v18.Destroyed;
end;
local function v25(v20) --[[ Line: 141 ]] --[[ Name: Destroy ]]
    -- upvalues: v13 (copy), l_Debris_0 (copy)
    if v20.Destroyed then
        return false;
    else
        v20.Destroyed = true;
        v13[v20] = nil;
        local l_Model_0 = v20.Model;
        if l_Model_0 then
            local v22 = 0;
            for _, v24 in ipairs(l_Model_0:GetDescendants()) do
                if v24:IsA("BasePart") then
                    v24.Transparency = 1;
                elseif v24:IsA("Trail") then
                    v22 = math.max(v22, v24.Lifetime);
                elseif v24:IsA("ParticleEmitter") then
                    v24.Enabled = false;
                    v22 = math.max(v22, v24.Lifetime.Max / v24.TimeScale);
                end;
            end;
            l_Debris_0:AddItem(l_Model_0, v22);
        end;
        v20.Destroying:Fire();
        return true;
    end;
end;
local function _(v26, v27, v28, v29, v30) --[[ Line: 169 ]] --[[ Name: Eval ]]
    local v31 = v30 * v30;
    return v26 + v27 * v30 + 0.5 * v28 * v31, v27 + (v28 + v29) * v30;
end;
local function v49(v33, v34, v35, v36, v37, v38) --[[ Line: 180 ]] --[[ Name: ComputeSteeringAccel ]]
    -- upvalues: v15 (copy), v17 (copy), v9 (copy)
    local l_Magnitude_0 = v35.Magnitude;
    local v40 = v35 / l_Magnitude_0;
    if l_Magnitude_0 < 1.0E-6 then
        return (Vector3.new(0, 0, 0, 0));
    else
        local l_v15_0 = v15;
        l_v15_0.FilterDescendantsInstances = v33.FilterDescendantsInstances;
        local l_v17_0 = v17;
        l_v17_0.FilterDescendantsInstances = v33.FilterDescendantsInstances;
        local v43 = v9(v34, v34 + v40 * 1000, v33.Radius + v36, l_v15_0, l_v17_0);
        if not v43 then
            return (Vector3.new(0, 0, 0, 0));
        else
            local v44 = v43 - v34;
            local l_Magnitude_1 = v44.Magnitude;
            if l_Magnitude_1 < 1.0E-6 then
                return (Vector3.new(0, 0, 0, 0));
            else
                local v46 = v44 / l_Magnitude_1;
                local v47 = (1 - math.exp(-math.acos((math.clamp(v40:Dot(v46), -1, 1))) * v38)) * (1 / (1 + v37 * l_Magnitude_1));
                local v48 = v40:Cross(v46);
                if v48.Magnitude < 1.0E-6 then
                    return (Vector3.new(0, 0, 0, 0));
                else
                    return (v40 + v48:Cross(v40).Unit * v47).Unit * l_Magnitude_0 - v35;
                end;
            end;
        end;
    end;
end;
local function v62(v50, v51) --[[ Line: 218 ]] --[[ Name: Simulate ]]
    -- upvalues: v49 (copy), v15 (copy), v8 (copy), v25 (copy)
    local l_CFrame_0 = v50.CFrame;
    local l_Position_0 = l_CFrame_0.Position;
    local l_LinearVelocity_0 = v50.LinearVelocity;
    local v55 = Vector3.new(0, 0, 0, 0);
    if v50.TrackingResponse then
        v55 = v55 + v49(v50, l_Position_0, l_LinearVelocity_0, v50.TrackingRadius or 0, v50.TrackingFalloff or 0, v50.TrackingResponse);
    end;
    local l_Gravity_0 = v50.Gravity;
    local l_v55_0 = v55;
    local l_v51_0 = v51;
    local v59 = l_v51_0 * l_v51_0;
    local v60 = l_Position_0 + l_LinearVelocity_0 * l_v51_0 + 0.5 * l_Gravity_0 * v59;
    local v61 = l_LinearVelocity_0 + (l_Gravity_0 + l_v55_0) * l_v51_0;
    l_Gravity_0 = v15;
    l_Gravity_0.FilterDescendantsInstances = v50.FilterDescendantsInstances;
    l_v55_0 = v8(l_Position_0, v60, v50.Radius, l_Gravity_0);
    if l_v55_0 then
        l_v51_0 = l_v55_0.Alpha;
        v60 = l_Position_0:Lerp(v60, l_v51_0);
        v61 = l_LinearVelocity_0:Lerp(v61, l_v51_0);
        v51 = v51 * l_v51_0;
    end;
    v59 = l_CFrame_0.Rotation;
    if v61.Magnitude > 1.0E-6 then
        v59 = CFrame.lookAlong(Vector3.new(0, 0, 0, 0), v61);
    end;
    v50.CFrame = CFrame.new(v60) * v59;
    v50.LinearVelocity = v61;
    v50.Age = v50.Age + v51;
    if l_v55_0 then
        v50.Hit:Fire(l_v55_0);
    end;
    if v50.Age >= v50.MaxAge then
        v25(v50);
    end;
    return v51;
end;
local function v68(v63, v64, v65) --[[ Line: 264 ]] --[[ Name: SimulateTo ]]
    -- upvalues: v62 (copy)
    local v66 = v64 - v63.CreationTime;
    for _ = 1, v65 or 4 do
        if not v63.Destroyed and v66 - v63.Age >= 0.03333333333333333 then
            v62(v63, 0.03333333333333333);
        else
            break;
        end;
    end;
end;
local function v80(v69, v70) --[[ Line: 278 ]] --[[ Name: RenderTo ]]
    local l_Model_1 = v69.Model;
    if not l_Model_1 then
        return;
    else
        local v72 = v70 - v69.CreationTime - v69.Age;
        local l_CFrame_1 = v69.CFrame;
        local l_Position_1 = l_CFrame_1.Position;
        local l_LinearVelocity_1 = v69.LinearVelocity;
        local l_Gravity_1 = v69.Gravity;
        local v77 = v72 * v72;
        local v78 = l_Position_1 + l_LinearVelocity_1 * v72 + 0.5 * l_Gravity_1 * v77;
        local v79 = l_LinearVelocity_1 + (l_Gravity_1 + Vector3.new(0, 0, 0, 0)) * v72;
        v77 = l_CFrame_1.Rotation;
        if v79.Magnitude > 1.0E-6 then
            v77 = CFrame.lookAlong(Vector3.new(0, 0, 0, 0), v79);
        end;
        l_Model_1:PivotTo(CFrame.new(v78) * v77);
        return;
    end;
end;
local v81 = table.freeze({
    IsDestroyed = v19, 
    Destroy = v25, 
    SimulateTo = v68
});
local v82 = table.freeze({
    __index = v81
});
local v83 = v7.Table({
    Id = v7.UUIDStripped, 
    CreationTime = v7.Finite, 
    Origin = v7.Vector3Finite, 
    LinearVelocity = v7.Vector3Finite, 
    Radius = v7.FiniteNonNegative, 
    Gravity = v7.Optional(v7.Vector3Finite), 
    MaxAge = v7.Optional(v7.FiniteNonNegative), 
    TrackingRadius = v7.Optional(v7.FiniteNonNegative), 
    TrackingFalloff = v7.Optional(v7.FiniteNonNegative), 
    TrackingResponse = v7.Optional(v7.FiniteNonNegative), 
    FilterDescendantsInstances = v7.Optional(v7.Array(v7.Instance)), 
    TemplateModel = v7.Optional(v7.Model)
});
local function v92(v84) --[[ Line: 341 ]] --[[ Name: new ]]
    -- upvalues: v83 (copy), v10 (ref), v6 (copy), v82 (copy), v13 (copy)
    v83(v84);
    local v85 = CFrame.lookAlong(v84.Origin, v84.LinearVelocity);
    local v86 = nil;
    v86 = if v84.FilterDescendantsInstances then table.clone(v84.FilterDescendantsInstances) else {};
    local v87 = nil;
    if v84.TemplateModel then
        local v88 = v84.TemplateModel:Clone();
        for _, v90 in ipairs(v88:GetDescendants()) do
            if v90:IsA("BasePart") then
                v90.Anchored = true;
                v90.CanCollide = false;
                v90.CanTouch = false;
                v90.CollisionGroup = "Projectile";
            end;
        end;
        v88:PivotTo(v85);
        v88.Parent = v10;
        v87 = v88;
        table.insert(v86, v88);
    end;
    local v91 = setmetatable({
        Destroyed = false, 
        Hit = v6.new(), 
        Destroying = v6.new(), 
        Attributes = {}, 
        Impacts = {}, 
        Id = v84.Id, 
        CreationTime = v84.CreationTime, 
        CFrame = v85, 
        LinearVelocity = v84.LinearVelocity, 
        Radius = v84.Radius, 
        Gravity = v84.Gravity or Vector3.new(0, -workspace.Gravity, 0), 
        Age = 0, 
        MaxAge = v84.MaxAge or 5, 
        TrackingRadius = v84.TrackingRadius, 
        TrackingFalloff = v84.TrackingFalloff, 
        TrackingResponse = v84.TrackingResponse, 
        FilterDescendantsInstances = v86, 
        Model = v87
    }, v82);
    v13[v91] = true;
    return v91;
end;
local v93 = v7.Table({
    CameraDistance = v7.Optional(v7.Finite), 
    RaycastDistance = v7.Optional(v7.FiniteNonNegative), 
    FilterDescendantsInstances = v7.Optional(v7.Array(v7.Instance))
});
local function v107(v94) --[[ Line: 409 ]] --[[ Name: PickTarget ]]
    -- upvalues: v93 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), v15 (copy)
    v93(v94);
    local v95 = v94.CameraDistance or 0;
    local v96 = v94.RaycastDistance or 1000;
    local v97 = v94.FilterDescendantsInstances or {};
    local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    l_l_UserInputService_0_MouseLocation_0 = l_l_UserInputService_0_MouseLocation_0 - l_l_GuiService_0_GuiInset_0;
    local v101 = workspace.CurrentCamera:ScreenPointToRay(l_l_UserInputService_0_MouseLocation_0.X, l_l_UserInputService_0_MouseLocation_0.Y, v95);
    local l_Unit_0 = v101.Direction.Unit;
    local l_Origin_0 = v101.Origin;
    local v104 = l_Unit_0 * v96;
    local l_v15_1 = v15;
    l_v15_1.FilterDescendantsInstances = v97;
    local v106 = workspace:Raycast(l_Origin_0, v104, l_v15_1);
    if v106 then
        return v106.Position;
    else
        return l_Origin_0 + v104;
    end;
end;
l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 439 ]]
    -- upvalues: v13 (copy), v68 (copy), v25 (copy)
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    for v110, _ in pairs(v13) do
        local l_status_0, l_result_0 = pcall(v68, v110, l_workspace_ServerTimeNow_0);
        if not l_status_0 then
            v25(v110);
            warn("Projectile.SimulateTo", l_result_0);
        end;
    end;
end);
if l_RunService_0:IsClient() then
    l_RunService_0:BindToRenderStep("Projectile", Enum.RenderPriority.Last.Value - 1, function(_) --[[ Line: 455 ]]
        -- upvalues: v13 (copy), v80 (copy), v25 (copy)
        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
        for v116, _ in pairs(v13) do
            local l_status_1, l_result_1 = pcall(v80, v116, l_workspace_ServerTimeNow_1);
            if not l_status_1 then
                v25(v116);
                warn("Projectile.RenderTo", l_result_1);
            end;
        end;
    end);
end;
return table.freeze({
    new = v92, 
    AssertImpactMeta = v12, 
    PickTarget = v107
});