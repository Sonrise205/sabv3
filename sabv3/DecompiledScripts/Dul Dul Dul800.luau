local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local v13 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v16 = require(l_ReplicatedStorage_0.Packages.Trove);
local v17 = require(l_ReplicatedStorage_0.Packages.Net);
local v18 = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = require(l_ReplicatedStorage_0.Shared.Snapshot);
local l_Name_0 = script.Name;
local v21 = v17:RemoteEvent("EventService/Dul Dul Dul/Burst");
local v22 = v16.new();
local function v48(v23, v24, v25) --[[ Line: 34 ]] --[[ Name: grow ]]
    -- upvalues: v22 (copy), v13 (copy)
    local function v36(v26, v27, v28, v29) --[[ Line: 35 ]] --[[ Name: growPart ]]
        -- upvalues: v22 (ref), v25 (copy), v13 (ref)
        local l_CFrame_0 = v26.CFrame;
        local v31 = Vector3.new(v29 and 0 or v27.X, 0, v29 and 0 or v27.Z);
        local v32 = l_CFrame_0 * CFrame.new(0, -(v27.Y - v31.Y) / 2, 0);
        v26.Size = v31;
        v26.CFrame = v32;
        local l_Transparency_0 = v26.Transparency;
        v26.Transparency = 1;
        v26.CanCollide = false;
        v22:Add(function() --[[ Line: 47 ]]
            -- upvalues: v26 (copy), l_Transparency_0 (copy), v27 (copy), l_CFrame_0 (copy)
            v26.Transparency = l_Transparency_0;
            v26.CanCollide = true;
            v26.Size = v27;
            v26.CFrame = l_CFrame_0;
        end);
        v22:Add(task.delay(if v25 then v25(v28) else v28, function() --[[ Line: 54 ]]
            -- upvalues: v26 (copy), l_Transparency_0 (copy), v25 (ref), v28 (copy), v13 (ref), v27 (copy), l_CFrame_0 (copy)
            v26.Transparency = l_Transparency_0;
            v26.CanCollide = true;
            local v34 = if v25 then v25(v28 + 1) else 1;
            local v35 = TweenInfo.new(v34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            v13(v26, v35, {
                Size = v27
            });
            v13(v26, v35, {
                CFrame = l_CFrame_0
            });
        end));
    end;
    local v37 = {};
    local v38 = 1e999;
    local v39 = -1e999;
    for _, v41 in v23:GetDescendants() do
        if v41:IsA("BasePart") and v41.Transparency < 1 then
            table.insert(v37, v41);
            v38 = math.min(v38, v41.Position.Y);
            v39 = math.max(v39, v41.Position.Y);
        end;
    end;
    table.sort(v37, function(v42, v43) --[[ Line: 81 ]]
        return v42.Position.Y < v43.Position.Y;
    end);
    local v44 = v39 - v38;
    for _, v46 in v37 do
        local v47 = (v46.Position.Y - v38) / v44 * v24 + 0.25;
        v36(v46, v46.Size, v47);
    end;
end;
local function v65() --[[ Line: 92 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v22 (copy), l_RunService_0 (copy), v14 (copy)
    local v49 = v22:Extend();
    local v50 = table.create(4);
    v49:Add(function() --[[ Line: 104 ]]
        -- upvalues: v50 (copy)
        table.clear(v50);
    end);
    local v51 = 0;
    v49:Add(l_RunService_0.PreRender:Connect(function(v52) --[[ Line: 109 ]]
        -- upvalues: v51 (ref), v50 (copy)
        debug.profilebegin("Dul Dul Dul Event");
        v51 = v51 + v52;
        for v53, v54 in v50 do
            if v54.target and v54.targetAttachment then
                v54.beam.First.Enabled = true;
                v54.beam.Second.Enabled = true;
                local v55 = math.clamp(v51 - v53 + 1, 0, 1);
                local l_WorldPosition_0 = v54.beam.WorldPosition;
                v54.targetAttachment.Position = l_WorldPosition_0 + (v54.target:GetPivot().Position - l_WorldPosition_0) * v55;
            end;
        end;
        debug.profileend();
    end));
    v49:Add(v14.observeTag("DulDulDulPlayerVFX", function(v57) --[[ Line: 131 ]]
        -- upvalues: v50 (copy), v14 (ref)
        local v58 = script.PlayerVFX.Beam:Clone();
        v58.Parent = v57;
        local v59 = script.PlayerVFX.Torso:Clone();
        v59.Parent = v57;
        local l_v57_Attribute_0 = v57:GetAttribute("DulDulDulIndex");
        v50[l_v57_Attribute_0] = {
            beam = v58, 
            target = nil
        };
        local v64 = v14.observeTag("DulDulDulPlayerVFX", function(v61) --[[ Line: 144 ]]
            -- upvalues: v57 (copy), v58 (copy), v50 (ref)
            if v61 == v57 then
                return nil;
            elseif v61:GetAttribute("DulDulDulIndex") ~= v57:GetAttribute("DulDulDulIndex") % 4 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v58.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v63 = v50[v57:GetAttribute("DulDulDulIndex")];
                v63.target = v61;
                v63.beam.First.Attachment0 = l_Attachment_0;
                v63.beam.Second.Attachment0 = l_Attachment_0;
                v63.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 163 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 168 ]]
            -- upvalues: v59 (copy), v58 (copy), v64 (copy), v50 (ref), l_v57_Attribute_0 (copy)
            v59:Destroy();
            v58:Destroy();
            v64();
            v50[l_v57_Attribute_0] = nil;
        end;
    end));
end;
v6.OnStart = function(_) --[[ Line: 178 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), v22 (copy), v7 (copy), v10 (copy), v9 (copy), v65 (copy), v14 (copy), v16 (copy), l_ReplicatedStorage_0 (copy), v48 (copy), v18 (copy)
    local l_v11_ActiveEventData_0 = v11:GetActiveEventData(l_Name_0);
    assert(l_v11_ActiveEventData_0);
    v22:Add(function() --[[ Line: 182 ]]
        -- upvalues: v7 (ref), v10 (ref), v9 (ref)
        v7:Activate("Blink");
        v10:Update();
        v9:UpdateOST();
        v9:UpdateAmbience();
    end);
    v10:Update();
    v9:UpdateOST();
    v9:UpdateAmbience();
    v22:Add(task.spawn(function() --[[ Line: 194 ]]
        -- upvalues: v65 (ref)
        v65();
    end));
    v22:Add(v14.observeTag("DulDulDul", function(v68) --[[ Line: 198 ]]
        -- upvalues: v16 (ref), v22 (ref), v14 (ref), l_ReplicatedStorage_0 (ref)
        local v69 = v16.new();
        local l_HumanoidRootPart_0 = v68:WaitForChild("HumanoidRootPart");
        local v71 = v69:Clone(script["Dul Dul Dul"]);
        local v72 = v69:Add(Instance.new("Weld"));
        v72.Part0 = v71.PrimaryPart;
        v72.Part1 = l_HumanoidRootPart_0;
        v72.C0 = CFrame.Angles(0, 0, 0);
        v72.Parent = v71.PrimaryPart;
        v71.Parent = v68;
        local l_Animator_0 = v71.AnimationController.Animator;
        local v74 = l_Animator_0:LoadAnimation(script.Idle);
        v74.Priority = Enum.AnimationPriority.Idle;
        v74.Looped = true;
        v74:Play();
        local v75 = l_Animator_0:LoadAnimation(script.Walk);
        v75.Priority = Enum.AnimationPriority.Movement;
        local l_v68_Attribute_0 = v68:GetAttribute("Index");
        local v77 = l_Animator_0:LoadAnimation(script[(not (l_v68_Attribute_0 ~= 1) or l_v68_Attribute_0 == 4) and "Build2" or "Build1"]);
        v77.Priority = Enum.AnimationPriority.Action;
        local v78 = l_Animator_0:LoadAnimation(script.Gesture);
        v78.Priority = Enum.AnimationPriority.Action2;
        local v79 = l_Animator_0:LoadAnimation(script.Attack);
        v79.Priority = Enum.AnimationPriority.Action3;
        local v80 = nil;
        v69:Add(v79:GetMarkerReachedSignal("CreateTie"):Connect(function() --[[ Line: 235 ]]
            -- upvalues: v80 (ref), v22 (ref), v71 (copy)
            if v80 then
                return;
            else
                local v81 = v22:Clone(script.Tie);
                v81.RigidConstraint.Attachment1 = v71:FindFirstChild("HandAttachment", true);
                v81.Parent = v71;
                v80 = v81;
                return;
            end;
        end));
        v69:Add(v79:GetMarkerReachedSignal("DestroyTie"):Connect(function() --[[ Line: 248 ]]
            -- upvalues: v80 (ref), v22 (ref)
            if v80 then
                v22:Remove(v80);
                v80 = nil;
            end;
        end));
        v69:Add(v79:GetMarkerReachedSignal("Freeze"):Connect(function() --[[ Line: 256 ]]
            -- upvalues: v68 (copy), v79 (copy)
            if not v68:GetAttribute("FinishAttackAnimation") then
                v79:AdjustSpeed(0);
            end;
        end));
        v69:Add(task.defer(function() --[[ Line: 262 ]]
            -- upvalues: v68 (copy), v75 (copy)
            if v68:GetAttribute("IsRunning") then
                v75:Play();
            end;
        end));
        v69:Add(v14.observeAttribute(v68, "IsBuilding", function(v82) --[[ Line: 268 ]]
            -- upvalues: v71 (copy), v77 (copy)
            if not v82 then
                return nil;
            else
                local v83 = script.Hammer:Clone();
                v83["Cube.010"].RigidConstraint.Attachment1 = v71:FindFirstChild("HandAttachment", true);
                v83.Parent = v71;
                v77:Play();
                return function() --[[ Line: 278 ]]
                    -- upvalues: v77 (ref), v83 (copy)
                    v77:Stop();
                    v83:Destroy();
                end;
            end;
        end));
        local v84 = nil;
        v69:Add(v14.observeAttribute(v68, "Gesture", function(v85) --[[ Line: 285 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v71 (copy), v84 (ref), v78 (copy)
            if not v85 then
                return nil;
            else
                local v86 = l_ReplicatedStorage_0.Sounds.Events["Dul Dul Dul"].Yap:Clone();
                v86.Parent = v71.PrimaryPart;
                v86:Play();
                v84 = v86;
                v78:Play();
                return function() --[[ Line: 296 ]]
                    -- upvalues: v86 (copy), v78 (ref), v84 (ref)
                    v86:Destroy();
                    v86:Stop();
                    v78:Stop();
                    if v84 == v86 then
                        v84 = nil;
                    end;
                end;
            end;
        end));
        v69:Add(v68:GetAttributeChangedSignal("AttackAnimation"):Connect(function() --[[ Line: 306 ]]
            -- upvalues: v80 (ref), v22 (ref), v84 (ref), v79 (copy)
            if v80 then
                v22:Remove(v80);
                v80 = nil;
            end;
            if v84 then
                v84:Pause();
            end;
            v79:Play();
        end));
        v69:Add(v79.Ended:Connect(function() --[[ Line: 319 ]]
            -- upvalues: v84 (ref)
            if v84 then
                v84:Resume();
            end;
        end));
        v69:Add(v68:GetAttributeChangedSignal("FinishAttackAnimation"):Connect(function() --[[ Line: 325 ]]
            -- upvalues: v68 (copy), v79 (copy)
            if v68:GetAttribute("FinishAttackAnimation") then
                v79:AdjustSpeed(1);
            end;
        end));
        v69:Add(v68:GetAttributeChangedSignal("IsRunning"):Connect(function() --[[ Line: 331 ]]
            -- upvalues: v68 (copy), v75 (copy)
            if v68:GetAttribute("IsRunning") then
                v75:Play();
                return;
            else
                v75:Stop();
                return;
            end;
        end));
        return v69:WrapClean();
    end));
    v22:Add(task.delay(l_v11_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow(), function() --[[ Line: 342 ]]
        -- upvalues: v7 (ref), v22 (ref), v14 (ref)
        v7:Activate("Blink");
        v22:Clone(script.SchoolMap).Parent = workspace;
        v22:Add(v14.observeTag("HideInDulDulDul", function(v87) --[[ Line: 346 ]]
            local l_Parent_0 = v87.Parent;
            v87.Parent = script;
            return function() --[[ Line: 349 ]]
                -- upvalues: v87 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 350 ]]
                    -- upvalues: v87 (ref), l_Parent_0 (ref)
                    v87.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script
        }));
        v7:Run("DulDulDulEvent", "GrassRecolor");
        v22:Add(function() --[[ Line: 357 ]]
            -- upvalues: v7 (ref)
            v7:Stop("DulDulDulEvent", "GrassRecolor");
        end);
        v7:Run("DulDulDulEvent", "WallRecolor");
        v22:Add(function() --[[ Line: 362 ]]
            -- upvalues: v7 (ref)
            v7:Stop("DulDulDulEvent", "WallRecolor");
        end);
        v7:Run("DulDulDulEvent", "WallBottomRecolor");
        v22:Add(function() --[[ Line: 367 ]]
            -- upvalues: v7 (ref)
            v7:Stop("DulDulDulEvent", "WallBottomRecolor");
        end);
    end));
    v22:Add(task.spawn(function() --[[ Line: 372 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v22 (ref), v9 (ref), v48 (ref), v18 (ref)
        while not l_ReplicatedStorage_0:GetAttribute("DulDulDulConstructionStart") do
            task.wait();
        end;
        local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("DulDulDulConstructionStart");
        if not l_l_ReplicatedStorage_0_Attribute_0 then
            return;
        else
            local v90 = v22:Clone(script.Machine);
            v90.Parent = workspace;
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Dul Dul Dul"].Building, v90.Root.Position, false);
            local v91 = v22:Clone(script.BuildingVFX);
            v91.Parent = workspace;
            v48(v90.Animate.AnimateObjects, 6, function(v92) --[[ Line: 393 ]]
                -- upvalues: l_l_ReplicatedStorage_0_Attribute_0 (copy)
                return l_l_ReplicatedStorage_0_Attribute_0 + v92 + 3 - workspace:GetServerTimeNow();
            end);
            v22:Add(task.delay(l_l_ReplicatedStorage_0_Attribute_0 + 3 - workspace:GetServerTimeNow(), function() --[[ Line: 397 ]]
                -- upvalues: v18 (ref), v91 (copy), v22 (ref), l_l_ReplicatedStorage_0_Attribute_0 (copy)
                v18.enable(v91);
                v22:Add(task.delay(l_l_ReplicatedStorage_0_Attribute_0 + 6 + 3 - workspace:GetServerTimeNow(), function() --[[ Line: 400 ]]
                    -- upvalues: v18 (ref), v91 (ref)
                    v18.disable(v91);
                end));
            end));
            return;
        end;
    end));
end;
v6.OnStop = function(_) --[[ Line: 407 ]] --[[ Name: OnStop ]]
    -- upvalues: v22 (copy)
    v22:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 411 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), l_ReplicatedStorage_0 (copy), v21 (copy), v8 (copy), v12 (copy), v18 (copy), v9 (copy)
    task.spawn(pcall, function() --[[ Line: 412 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(pcall, function() --[[ Line: 416 ]]
        -- upvalues: l_ContentProvider_0 (ref), l_ReplicatedStorage_0 (ref)
        l_ContentProvider_0:PreloadAsync(l_ReplicatedStorage_0.Sounds.Events["Dul Dul Dul"]:GetChildren());
    end);
    v21.OnClientEvent:Connect(function(v95) --[[ Line: 420 ]]
        -- upvalues: v8 (ref), v12 (ref), v18 (ref), v9 (ref), l_ReplicatedStorage_0 (ref)
        local v96 = v8:GetAnimals()[v95];
        if not v96 then
            return;
        else
            local v97 = script.Burst:Clone();
            v97.CFrame = CFrame.new(v12.getAnimalPosition(v95, {
                top = true
            }));
            v97.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v97;
            l_WeldConstraint_0.Part1 = v96.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v97;
            v97.Parent = workspace;
            v18.emit(v97);
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Dul Dul Dul"].Burst, v97.Position, false);
            task.delay(3, function() --[[ Line: 441 ]]
                -- upvalues: v97 (copy)
                v97:Destroy();
            end);
            return;
        end;
    end);
end;
return v6;