local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local v13 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v15 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local v17 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v18 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v19 = require(l_ReplicatedStorage_0.Packages.Trove);
local v20 = require(l_ReplicatedStorage_0.Packages.Net);
local v21 = require(l_ReplicatedStorage_0.Shared.VFX);
local v22 = v20:RemoteEvent("EventService/10B Visits/CreateFirework");
local v23 = v20:RemoteEvent("EventService/10B Visits/ExplodeTraitEffect");
local l_Name_0 = script.Name;
local v25 = v19.new();
local v26 = RaycastParams.new();
v26.FilterType = Enum.RaycastFilterType.Include;
v26.FilterDescendantsInstances = {
    workspace.Map, 
    workspace.Plots
};
local v27 = {};
v7.OnStart = function(_) --[[ Line: 41 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v25 (copy), v9 (copy), v11 (copy), v15 (copy), l_TweenService_0 (copy), v17 (copy), v22 (copy), v27 (copy), v21 (copy), v26 (copy), l_RunService_0 (copy), v12 (copy), v13 (copy), v18 (copy)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("10BVisitsEvent", true);
    v25:Add(function() --[[ Line: 46 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("10BVisitsEvent", nil);
    end);
    v9:UpdateOST();
    v11:Update();
    local v30 = l_ReplicatedStorage_0.Models.Events["10B Visits"].Fireworks:Clone();
    v30.Parent = workspace;
    local l_v30_Children_0 = v30:GetChildren();
    table.sort(l_v30_Children_0, function(v32, v33) --[[ Line: 57 ]]
        return tonumber(v32.Name) < tonumber(v33.Name);
    end);
    local v34 = {};
    for _, v36 in l_v30_Children_0 do
        v34[v36] = v36.CFrame;
    end;
    local v37 = v15.BumpS:Clone();
    v25:Add(v37);
    v37.Sustain = true;
    v25:Add(v15.BindShakeToCamera(v37, workspace.CurrentCamera));
    v37:Start();
    v25:Add(task.delay(l_v10_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow(), function() --[[ Line: 72 ]]
        -- upvalues: v37 (copy)
        v37:StopSustain();
    end));
    v25:Add(function() --[[ Line: 76 ]]
        -- upvalues: l_v30_Children_0 (copy), l_TweenService_0 (ref), v34 (copy), v30 (copy)
        for _, v39 in l_v30_Children_0 do
            l_TweenService_0:Create(v39, TweenInfo.new(1 + math.random() + math.random(), Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                CFrame = v34[v39] - Vector3.new(0, v39.Size.Y * 1.1, 0)
            }):Play();
        end;
        task.wait(3);
        v30:Destroy();
    end);
    local v40 = v25:Clone(script.DroneRig);
    v40.Parent = workspace;
    local v41 = v40.AnimationController.Animator:LoadAnimation(script.DronesAnimation);
    v41:Play(0, 1, 0.2);
    v41:GetMarkerReachedSignal("TungFinished"):Once(function() --[[ Line: 93 ]]
        -- upvalues: v41 (copy)
        v41:AdjustSpeed(1);
    end);
    v41:GetMarkerReachedSignal("Lower"):Once(function() --[[ Line: 97 ]]
        -- upvalues: v17 (ref), v40 (copy)
        v17(v40, TweenInfo.new(1), script.DroneRig:GetPivot() - Vector3.new(0, 100, 0, 0)):Play();
    end);
    v41:GetMarkerReachedSignal("Freeze"):Once(function() --[[ Line: 101 ]]
        -- upvalues: v41 (copy)
        v41:AdjustSpeed(0);
    end);
    local v42 = {};
    for _, v44 in v40:GetChildren() do
        if v44:IsA("BasePart") then
            table.insert(v42, v44);
        end;
    end;
    local _ = function(v45) --[[ Line: 112 ]] --[[ Name: setDroneColor ]]
        -- upvalues: v42 (copy)
        for _, v47 in v42 do
            v47.Color = v45;
        end;
    end;
    v25:Add(v22.OnClientEvent:Connect(function(v49) --[[ Line: 118 ]]
        -- upvalues: v27 (ref), l_v30_Children_0 (copy), v34 (copy), v21 (ref), l_ReplicatedStorage_0 (ref), v9 (ref), l_TweenService_0 (ref), v42 (copy), v26 (ref), l_RunService_0 (ref), v12 (ref), v13 (ref), v18 (ref)
        for v50, v51 in v49 do
            local v52 = script.Effects[tostring(v51.FireworkEffect)];
            local v53 = ColorSequence.new(Color3.new(1, 1, 1));
            local v54 = v52.specs["Embers [20]"];
            if v54 then
                v53 = v54.Color;
            end;
            v27[v50] = v53;
            local v55 = l_v30_Children_0[v51.Chosen];
            local v56 = script.Firework:Clone();
            v56.CFrame = v34[v55];
            v56.Parent = workspace;
            local v57 = script.FireworkStartup:Clone();
            v57.CFrame = v34[v55] + Vector3.new(0, v55.Size.Y * 0.5 - v57.Size.Y * 0.5, 0);
            v57.Parent = workspace;
            v21.emit(v57);
            local v58 = l_ReplicatedStorage_0.Sounds.Events["10B Visits"]["Trail Sound Ball"]:Clone();
            v58.Parent = v56;
            v9:PlaySound(v58);
            local v59 = l_ReplicatedStorage_0.Sounds.Events["10B Visits"].Shot:Clone();
            v59.Parent = v57;
            v9:PlaySound(v59);
            task.delay(2, function() --[[ Line: 156 ]]
                -- upvalues: v57 (copy)
                v57:Destroy();
            end);
            local v60 = v34[v55] - Vector3.new(0, v55.Size.Y, 0);
            local v61 = v34[v55] + Vector3.new(0, v51.Height, 0);
            local v62 = v51.Height / 20;
            local v63 = l_TweenService_0:Create(v56, TweenInfo.new(v62, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                CFrame = v61
            });
            v63:Play();
            do
                local l_v53_0 = v53;
                task.delay(v62 * 0.8, function() --[[ Line: 168 ]]
                    -- upvalues: v63 (copy), v9 (ref), l_ReplicatedStorage_0 (ref), v61 (copy), l_v53_0 (ref), v42 (ref), v52 (copy), v21 (ref), v56 (copy), v51 (copy), v60 (copy), v26 (ref), l_RunService_0 (ref), v12 (ref), v13 (ref), v18 (ref)
                    v63:Destroy();
                    v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["10B Visits"]["Firework Explosion"], v61.Position);
                    local l_Value_0 = l_v53_0.Keypoints[1].Value;
                    for _, v67 in v42 do
                        v67.Color = l_Value_0;
                    end;
                    l_Value_0 = v52:Clone();
                    l_Value_0.CFrame = v61;
                    l_Value_0.Parent = workspace;
                    v21.emit(l_Value_0);
                    v56:Destroy();
                    task.delay(4, function() --[[ Line: 183 ]]
                        -- upvalues: l_Value_0 (copy)
                        l_Value_0:Destroy();
                    end);
                    for _, v69 in v51.Falloffs do
                        local v70 = nil;
                        if typeof(v69) == "Vector3" then
                            v70 = v60 + v69;
                            local v71 = workspace:Raycast((v61 + v69).Position, Vector3.new(-0, -200, -0, -0), v26);
                            if v71 then
                                v70 = CFrame.new(v71.Position);
                            end;
                        end;
                        local v72 = script.Falloff:Clone();
                        v72.CFrame = v61;
                        for _, v74 in v72:GetDescendants() do
                            if v74:IsA("ParticleEmitter") then
                                v74.Color = l_v53_0;
                            end;
                        end;
                        v72.Parent = workspace;
                        local v75 = 0;
                        local v76 = nil;
                        do
                            local l_v70_0, l_v75_0, l_v76_0 = v70, v75, v76;
                            l_v76_0 = l_RunService_0.PostSimulation:Connect(function(v80) --[[ Line: 212 ]]
                                -- upvalues: l_v75_0 (ref), l_v70_0 (ref), v69 (copy), v12 (ref), v13 (ref), v72 (copy), v18 (ref), v61 (ref), v51 (ref), l_v53_0 (ref), v21 (ref), l_v76_0 (ref)
                                debug.profilebegin("10B Visits:Falloff");
                                l_v75_0 = l_v75_0 + v80;
                                local v81 = l_v70_0 or type(v69) == "string" and CFrame.new(v12.getAnimalPosition(v69, {
                                    top = true
                                })) or CFrame.identity;
                                local v82 = l_v75_0 / 2.3;
                                v13.pushPartCFrame(v72, CFrame.new(v18.quadBezier(v82, v61.Position, v61.Position + Vector3.new(0, v51.Height, 0) + (v81.Position - v61.Position) * Vector3.new(1, 0, 1, 0) * 0.7, v81.Position)));
                                if v82 >= 1 and type(v69) ~= "string" then
                                    local v83 = script.GroundImpact:Clone();
                                    v83.CFrame = v81 + Vector3.new(0, v83.Size.Y * 0.5, 0);
                                    for _, v85 in v83:GetDescendants() do
                                        if v85:IsA("ParticleEmitter") then
                                            v85.Color = l_v53_0;
                                        end;
                                    end;
                                    v83.Parent = workspace;
                                    v21.emit(v83);
                                    v21.disable(v72);
                                    task.delay(3, function() --[[ Line: 250 ]]
                                        -- upvalues: v72 (ref), v83 (copy)
                                        v72:Destroy();
                                        v83:Destroy();
                                    end);
                                    l_v76_0:Disconnect();
                                end;
                                debug.profileend();
                            end);
                        end;
                    end;
                end);
            end;
        end;
    end));
    local v86 = Random.new();
    for _, v88 in l_v30_Children_0 do
        v88.CFrame = v34[v88] - Vector3.new(0, v88.Size.Y * 1.1, 0);
        local v89 = l_TweenService_0:Create(v88, TweenInfo.new(v86:NextNumber(3, 7), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            CFrame = v34[v88]
        });
        local v90 = v25:Add(function() --[[ Line: 272 ]]
            -- upvalues: v89 (copy)
            v89:Cancel();
            v89:Destroy();
        end);
        v89.Completed:Once(function() --[[ Line: 277 ]]
            -- upvalues: v25 (ref), v90 (copy)
            v25:Remove(v90);
        end);
        v89:Play();
    end;
end;
v7.OnStop = function(_) --[[ Line: 285 ]] --[[ Name: OnStop ]]
    -- upvalues: v25 (copy), v27 (copy)
    v25:Destroy();
    table.clear(v27);
end;
v7.OnLoad = function(_) --[[ Line: 290 ]] --[[ Name: OnLoad ]]
    -- upvalues: v23 (copy), v8 (copy), v12 (copy), v21 (copy), v9 (copy), l_ReplicatedStorage_0 (copy)
    v23.OnClientEvent:Connect(function(v93, v94) --[[ Line: 291 ]]
        -- upvalues: v8 (ref), v12 (ref), v21 (ref), v9 (ref), l_ReplicatedStorage_0 (ref)
        local v95 = v8:GetAnimals()[v94];
        if not v95 then
            return;
        else
            local v96 = script.FireworkBurst:Clone();
            v96.CFrame = CFrame.new(v12.getAnimalPosition(v94, {
                top = true
            }));
            v96.Anchored = false;
            local v97 = ColorSequence.new(Color3.new(1, 1, 1));
            local v98 = script.Effects[tostring(v93)].specs["Embers [20]"];
            if v98 then
                v97 = v98.Color;
            end;
            for _, v100 in v96:GetDescendants() do
                if v100:IsA("ParticleEmitter") then
                    v100.Color = v97;
                end;
            end;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v96;
            l_WeldConstraint_0.Part1 = v95.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v96;
            v96.Parent = workspace;
            v21.emit(v96);
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["10B Visits"]["Brainrot Hit"], v96.Position);
            task.delay(3, function() --[[ Line: 324 ]]
                -- upvalues: v96 (copy)
                v96:Destroy();
            end);
            return;
        end;
    end);
end;
return v7;