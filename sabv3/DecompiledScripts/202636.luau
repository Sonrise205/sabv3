local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v11 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v13 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local v15 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v17 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local v20 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v21 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v22 = require(l_ReplicatedStorage_0.Packages.Trove);
local v23 = require(l_ReplicatedStorage_0.Packages.Net);
local v24 = require(l_ReplicatedStorage_0.Shared.VFX);
local v25 = v23:RemoteEvent("EventService/2026/CreateFirework");
local v26 = v23:RemoteEvent("EventService/2026/ExplodeTraitEffect");
local l_Name_0 = script.Name;
local v28 = v22.new();
local v29 = RaycastParams.new();
v29.FilterType = Enum.RaycastFilterType.Include;
v29.FilterDescendantsInstances = {
    workspace.Map, 
    workspace.Plots
};
local v30 = {};
local v31 = 0;
v8.OnStart = function(_) --[[ Line: 46 ]] --[[ Name: OnStart ]]
    -- upvalues: v12 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v28 (copy), v10 (copy), v11 (copy), v13 (copy), v17 (copy), v22 (copy), l_Lighting_0 (copy), v25 (copy), v30 (copy), v24 (copy), v20 (copy), v29 (copy), l_RunService_0 (copy), v14 (copy), v15 (copy), v21 (copy), v31 (ref), l_TweenService_0 (copy)
    local l_v12_ActiveEventData_0 = v12:GetActiveEventData(l_Name_0);
    assert(l_v12_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("2026Event", true);
    v28:Add(function() --[[ Line: 51 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("2026Event", nil);
    end);
    v10:Activate("Blink");
    v11:UpdateOST();
    v13:Update();
    local v34 = v28:Clone(l_ReplicatedStorage_0.Models.Events["2026"].Fireworks);
    v34.Parent = workspace;
    local l_v34_Children_0 = v34:GetChildren();
    table.sort(l_v34_Children_0, function(v36, v37) --[[ Line: 63 ]]
        return tonumber(v36.Name) < tonumber(v37.Name);
    end);
    local v38 = {};
    for _, v40 in l_v34_Children_0 do
        v38[v40] = v40.CFrame;
    end;
    v28:Add(task.delay(l_v12_ActiveEventData_0.startedAt - workspace:GetServerTimeNow(), function() --[[ Line: 72 ]]
        -- upvalues: v17 (ref), v28 (ref), l_v12_ActiveEventData_0 (copy)
        local v41 = v17.BumpS:Clone();
        v28:Add(v41);
        v41.Sustain = true;
        v28:Add(v17.BindShakeToCamera(v41, workspace.CurrentCamera));
        task.wait(l_v12_ActiveEventData_0.startedAt + 5 - workspace:GetServerTimeNow());
        v41:StopSustain();
    end));
    local v42 = nil;
    local _ = v22.new();
    (function() --[[ Line: 86 ]] --[[ Name: spawnMap ]]
        -- upvalues: v42 (ref), v28 (ref), l_Lighting_0 (ref)
        v42 = v28:Clone(script.NewYearsMap);
        v42.Parent = workspace;
        local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
        if l_Atmosphere_0 then
            l_Atmosphere_0.Parent = script;
            v28:Add(function() --[[ Line: 93 ]]
                -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
                l_Atmosphere_0.Parent = l_Lighting_0;
            end);
        end;
        v28:Clone(script.AtmosphereNewYears).Parent = l_Lighting_0;
        local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
        if l_Cartoon_0 then
            l_Cartoon_0.Parent = script;
            v28:Add(function() --[[ Line: 103 ]]
                -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
                l_Cartoon_0.Parent = l_Lighting_0;
            end);
        end;
        v28:Clone(script.SkyNewYears).Parent = l_Lighting_0;
    end)();
    v28:Add(function() --[[ Line: 113 ]]
        -- upvalues: v10 (ref), v11 (ref), v13 (ref)
        v10:Activate("Blink");
        v11:UpdateOST();
        v13:Update();
    end);
    v10:Run("2026Event", "GrassRecolor");
    v28:Add(function() --[[ Line: 120 ]]
        -- upvalues: v10 (ref)
        v10:Stop("2026Event", "GrassRecolor");
    end);
    v10:Run("2026Event", "WallRecolor");
    v28:Add(function() --[[ Line: 125 ]]
        -- upvalues: v10 (ref)
        v10:Stop("2026Event", "WallRecolor");
    end);
    v10:Run("2026Event", "WallBottomRecolor");
    v28:Add(function() --[[ Line: 130 ]]
        -- upvalues: v10 (ref)
        v10:Stop("2026Event", "WallBottomRecolor");
    end);
    v28:Add(v25.OnClientEvent:Connect(function(v46) --[[ Line: 134 ]]
        -- upvalues: v30 (ref), l_v34_Children_0 (copy), v38 (copy), v24 (ref), l_ReplicatedStorage_0 (ref), v11 (ref), v20 (ref), v29 (ref), l_RunService_0 (ref), v14 (ref), v15 (ref), v21 (ref)
        for v47, v48 in v46 do
            local v49 = script.Effects[tostring(v48.FireworkEffect)];
            local v50 = ColorSequence.new(Color3.new(1, 1, 1));
            local v51 = v49.specs["Embers [20]"];
            if v51 then
                v50 = v51.Color;
            end;
            v30[v47] = v50;
            local v52 = l_v34_Children_0[v48.Chosen];
            local v53 = script[("Firework%*"):format((Random.new():NextInteger(1, 2)))]:Clone();
            v53:PivotTo(v38[v52]);
            script.TrailVFX.Attachment:Clone().Parent = v53;
            v53.Parent = workspace;
            local v54 = script.FireworkStartup:Clone();
            v54.CFrame = v38[v52] + Vector3.new(0, v52.Size.Y * 0.5 - v54.Size.Y * 0.5, 0);
            v54.Parent = workspace;
            v24.emit(v54);
            local v55 = l_ReplicatedStorage_0.Sounds.Events["2026"]["Trail Sound Ball"]:Clone();
            v55.Parent = v53;
            v11:PlaySound(v55);
            local v56 = l_ReplicatedStorage_0.Sounds.Events["2026"].Shot:Clone();
            v56.Parent = v54;
            v11:PlaySound(v56);
            task.delay(2, function() --[[ Line: 173 ]]
                -- upvalues: v54 (copy)
                v54:Destroy();
            end);
            local v57 = v38[v52] - Vector3.new(0, v52.Size.Y, 0);
            local v58 = v38[v52] + Vector3.new(0, v48.Height, 0);
            local v59 = v48.Height / 20;
            local v60 = v20(v53, TweenInfo.new(v59, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v58);
            v60:Play();
            do
                local l_v50_0 = v50;
                task.delay(v59 * 0.8, function() --[[ Line: 182 ]]
                    -- upvalues: v60 (copy), v11 (ref), l_ReplicatedStorage_0 (ref), v58 (copy), v49 (copy), v24 (ref), v53 (copy), v48 (copy), v57 (copy), v29 (ref), l_v50_0 (ref), l_RunService_0 (ref), v14 (ref), v15 (ref), v21 (ref)
                    v60:Destroy();
                    v11:PlaySound(l_ReplicatedStorage_0.Sounds.Events["2026"]["Firework Explosion"], v58.Position);
                    local v62 = v49:Clone();
                    v62.CFrame = v58;
                    v62.Parent = workspace;
                    v24.emit(v62);
                    v53:Destroy();
                    task.delay(4, function() --[[ Line: 195 ]]
                        -- upvalues: v62 (copy)
                        v62:Destroy();
                    end);
                    for _, v64 in v48.Falloffs do
                        local v65 = nil;
                        if typeof(v64) == "Vector3" then
                            v65 = v57 + v64;
                            local v66 = workspace:Raycast((v58 + v64).Position, Vector3.new(-0, -200, -0, -0), v29);
                            if v66 then
                                v65 = CFrame.new(v66.Position);
                            end;
                        end;
                        local v67 = script.Falloff:Clone();
                        v67.CFrame = v58;
                        for _, v69 in v67:GetDescendants() do
                            if v69:IsA("ParticleEmitter") then
                                v69.Color = l_v50_0;
                            end;
                        end;
                        v67.Parent = workspace;
                        local v70 = 0;
                        local v71 = nil;
                        do
                            local l_v65_0, l_v70_0, l_v71_0 = v65, v70, v71;
                            l_v71_0 = l_RunService_0.PostSimulation:Connect(function(v75) --[[ Line: 224 ]]
                                -- upvalues: l_v70_0 (ref), l_v65_0 (ref), v64 (copy), v14 (ref), v15 (ref), v67 (copy), v21 (ref), v58 (ref), v48 (ref), l_v50_0 (ref), v24 (ref), l_v71_0 (ref)
                                debug.profilebegin("2026:Falloff");
                                l_v70_0 = l_v70_0 + v75;
                                local v76 = l_v65_0 or type(v64) == "string" and CFrame.new(v14.getAnimalPosition(v64, {
                                    top = true
                                })) or CFrame.identity;
                                local v77 = l_v70_0 / 2.3;
                                v15.pushPartCFrame(v67, CFrame.new(v21.quadBezier(v77, v58.Position, v58.Position + Vector3.new(0, v48.Height, 0) + (v76.Position - v58.Position) * Vector3.new(1, 0, 1, 0) * 0.7, v76.Position)));
                                if v77 >= 1 and type(v64) ~= "string" then
                                    local v78 = script.GroundImpact:Clone();
                                    v78.CFrame = v76 + Vector3.new(0, v78.Size.Y * 0.5, 0);
                                    for _, v80 in v78:GetDescendants() do
                                        if v80:IsA("ParticleEmitter") then
                                            v80.Color = l_v50_0;
                                        end;
                                    end;
                                    v78.Parent = workspace;
                                    v24.emit(v78);
                                    v24.disable(v67);
                                    task.delay(3, function() --[[ Line: 262 ]]
                                        -- upvalues: v67 (ref), v78 (copy)
                                        v67:Destroy();
                                        v78:Destroy();
                                    end);
                                    l_v71_0:Disconnect();
                                end;
                                debug.profileend();
                            end);
                        end;
                    end;
                end);
            end;
        end;
    end));
    for _, v82 in l_v34_Children_0 do
        v82.CFrame = v38[v82] - Vector3.new(0, v82.Size.Y * 1.1, 0);
    end;
    local function _(v83) --[[ Line: 280 ]] --[[ Name: updateBallHeight ]]
        -- upvalues: v31 (ref)
        v31 = math.lerp(0, -28, (math.clamp(v83 ^ 2, 0, 1)));
    end;
    local v86 = v28:Add(l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 287 ]]
        -- upvalues: l_v12_ActiveEventData_0 (copy), v31 (ref)
        v31 = math.lerp(0, -28, (math.clamp(math.clamp((workspace:GetServerTimeNow() - l_v12_ActiveEventData_0.startedAt) / 16.283333333333335, 0, 1) ^ 2, 0, 1)));
    end));
    v28:Add(task.spawn(function() --[[ Line: 291 ]]
        -- upvalues: v28 (ref), l_v12_ActiveEventData_0 (copy)
        local v87 = v28:Clone(script.DroneRig);
        v87.Parent = workspace;
        xpcall(function() --[[ Line: 295 ]]
            -- upvalues: l_v12_ActiveEventData_0 (ref), v28 (ref), v87 (copy)
            local l_startedAt_0 = l_v12_ActiveEventData_0.startedAt;
            v28:Add(require(v87.DroneOneShot).new(v87)):Play(function() --[[ Line: 299 ]]
                -- upvalues: l_startedAt_0 (copy)
                return (math.min(workspace:GetServerTimeNow() - l_startedAt_0, 59.96666666666667));
            end);
        end, warn);
    end));
    v28:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 16.283333333333335 - 11 - workspace:GetServerTimeNow(), function() --[[ Line: 305 ]]
        -- upvalues: v11 (ref), l_ReplicatedStorage_0 (ref)
        v11:PlaySound(l_ReplicatedStorage_0.Sounds.Events["2026"].Countdown, script.DroneRig:GetPivot().Position - Vector3.new(0, 20, 0, 0), false);
    end));
    v28:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 16.283333333333335 - 0.5 - workspace:GetServerTimeNow(), function() --[[ Line: 309 ]]
        -- upvalues: v42 (ref), l_ReplicatedStorage_0 (ref), v11 (ref), v20 (ref), v24 (ref)
        local v89 = 4;
        for _, v91 in v42.FireworkLaunchers:GetChildren() do
            if v91.Name == "Fireworks" then
                for _, v93 in v91:GetChildren() do
                    if v93:IsA("BasePart") then
                        local v94 = Random.new():NextInteger(40, 160);
                        local v95 = v93:GetPivot() * CFrame.new(0, 0, -v94);
                        script.TrailVFX.Attachment:Clone().Parent = v93;
                        if v89 > 0 then
                            v89 = v89 - 1;
                            local v96 = l_ReplicatedStorage_0.Sounds.Events["2026"].Shot2:Clone();
                            v96.Parent = v93;
                            v11:PlaySound(v96, nil, false);
                        end;
                        local v97 = v94 / 50;
                        v20(v93, TweenInfo.new(v97, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v95):Play();
                        task.delay(v97 * 0.8, function() --[[ Line: 336 ]]
                            -- upvalues: v93 (copy), v11 (ref), l_ReplicatedStorage_0 (ref), v95 (copy), v24 (ref)
                            v93:Destroy();
                            v11:PlaySound(l_ReplicatedStorage_0.Sounds.Events["2026"]["Firework Explosion"], v95.Position);
                            local v98 = script.Effects[Random.new():NextInteger(1, #script.Effects:GetChildren())]:Clone();
                            v98.CFrame = v95;
                            v98.Parent = workspace;
                            v24.emit(v98);
                            task.delay(4, function() --[[ Line: 350 ]]
                                -- upvalues: v98 (copy)
                                v98:Destroy();
                            end);
                        end);
                    end;
                end;
            end;
        end;
    end));
    v28:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 16.283333333333335 - workspace:GetServerTimeNow(), function() --[[ Line: 358 ]]
        -- upvalues: v28 (ref), v86 (copy), v31 (ref)
        v28:Remove(v86);
        v31 = -28;
    end));
    v28:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 16.283333333333335 - 3 - workspace:GetServerTimeNow(), function() --[[ Line: 363 ]]
        -- upvalues: l_v34_Children_0 (copy), l_TweenService_0 (ref), v38 (copy), v28 (ref)
        local v99 = Random.new();
        for _, v101 in l_v34_Children_0 do
            local v102 = l_TweenService_0:Create(v101, TweenInfo.new(v99:NextNumber(3, 5), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                CFrame = v38[v101]
            });
            local v103 = v28:Add(function() --[[ Line: 372 ]]
                -- upvalues: v102 (copy)
                v102:Cancel();
                v102:Destroy();
            end);
            v102.Completed:Once(function() --[[ Line: 377 ]]
                -- upvalues: v28 (ref), v103 (copy)
                v28:Remove(v103);
            end);
            v102:Play();
        end;
    end));
end;
v8.OnStop = function(_) --[[ Line: 386 ]] --[[ Name: OnStop ]]
    -- upvalues: v28 (copy), v30 (copy)
    v28:Destroy();
    table.clear(v30);
end;
v8.OnLoad = function(_) --[[ Line: 391 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v19 (copy), l_RunService_0 (copy), v31 (ref), v26 (copy), v9 (copy), v14 (copy), v24 (copy), v11 (copy), l_ReplicatedStorage_0 (copy)
    task.spawn(pcall, function() --[[ Line: 392 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v19.observeTag("NewYearsMachineBall", function(v106) --[[ Line: 396 ]]
        -- upvalues: l_RunService_0 (ref), v31 (ref)
        local l_v106_Pivot_0 = v106:GetPivot();
        local v109 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 398 ]]
            -- upvalues: v106 (copy), l_v106_Pivot_0 (copy), v31 (ref)
            v106:PivotTo(l_v106_Pivot_0 * CFrame.new(0, v31, 0));
        end);
        return function() --[[ Line: 402 ]]
            -- upvalues: v109 (copy), v106 (copy), l_v106_Pivot_0 (copy)
            v109:Disconnect();
            v106:PivotTo(l_v106_Pivot_0);
        end;
    end);
    v26.OnClientEvent:Connect(function(v110, v111) --[[ Line: 408 ]]
        -- upvalues: v9 (ref), v14 (ref), v24 (ref), v11 (ref), l_ReplicatedStorage_0 (ref)
        local v112 = v9:GetAnimals()[v111];
        if not v112 then
            return;
        else
            local v113 = script.FireworkBurst:Clone();
            v113.CFrame = CFrame.new(v14.getAnimalPosition(v111, {
                top = true
            }));
            v113.Anchored = false;
            local v114 = ColorSequence.new(Color3.new(1, 1, 1));
            local v115 = script.Effects[tostring(v110)].specs["Embers [20]"];
            if v115 then
                v114 = v115.Color;
            end;
            for _, v117 in v113:GetDescendants() do
                if v117:IsA("ParticleEmitter") then
                    v117.Color = v114;
                end;
            end;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v113;
            l_WeldConstraint_0.Part1 = v112.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v113;
            v113.Parent = workspace;
            v24.emit(v113);
            v11:PlaySound(l_ReplicatedStorage_0.Sounds.Events["2026"]["Brainrot Hit"], v113.Position);
            task.delay(3, function() --[[ Line: 441 ]]
                -- upvalues: v113 (copy)
                v113:Destroy();
            end);
            return;
        end;
    end);
end;
return v8;