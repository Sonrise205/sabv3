local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local v12 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v14 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local v16 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v17 = require(l_ReplicatedStorage_0.Packages.Trove);
local v18 = require(l_ReplicatedStorage_0.Packages.Net);
local v19 = require(l_ReplicatedStorage_0.Shared.VFX);
local v20 = v18:RemoteEvent("EventService/4th of July/CreateFirework");
local v21 = v18:RemoteEvent("EventService/4th of July/ExplodeTraitEffect");
local l_Name_0 = script.Name;
local v23 = v17.new();
local v24 = RaycastParams.new();
v24.FilterType = Enum.RaycastFilterType.Include;
v24.FilterDescendantsInstances = {
    workspace.Map, 
    workspace.Plots
};
v6.OnStart = function(_) --[[ Line: 37 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v23 (copy), v8 (copy), v10 (copy), v14 (copy), l_TweenService_0 (copy), v20 (copy), v19 (copy), v24 (copy), l_RunService_0 (copy), v11 (copy), v12 (copy), v16 (copy)
    local l_v9_ActiveEventData_0 = v9:GetActiveEventData(l_Name_0);
    assert(l_v9_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("4thOfJulyEvent", true);
    v23:Add(function() --[[ Line: 42 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("4thOfJulyEvent", nil);
    end);
    v8:UpdateOST();
    v10:Update();
    local v27 = l_ReplicatedStorage_0.Models.Events["4th of July"].Fireworks:Clone();
    v27.Parent = workspace;
    local l_v27_Children_0 = v27:GetChildren();
    table.sort(l_v27_Children_0, function(v29, v30) --[[ Line: 53 ]]
        return tonumber(v29.Name) < tonumber(v30.Name);
    end);
    local v31 = {};
    for _, v33 in l_v27_Children_0 do
        v31[v33] = v33.CFrame;
    end;
    local v34 = v14.BumpS:Clone();
    v23:Add(v34);
    v34.Sustain = true;
    v23:Add(v14.BindShakeToCamera(v34, workspace.CurrentCamera));
    v34:Start();
    v23:Add(task.delay(l_v9_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow(), function() --[[ Line: 68 ]]
        -- upvalues: v34 (copy)
        v34:StopSustain();
    end));
    v23:Add(function() --[[ Line: 72 ]]
        -- upvalues: l_v27_Children_0 (copy), l_TweenService_0 (ref), v31 (copy), v27 (copy)
        for _, v36 in l_v27_Children_0 do
            l_TweenService_0:Create(v36, TweenInfo.new(1 + math.random() + math.random(), Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                CFrame = v31[v36] - Vector3.new(0, v36.Size.Y * 1.1, 0)
            }):Play();
        end;
        task.wait(3);
        v27:Destroy();
    end);
    v23:Add(v20.OnClientEvent:Connect(function(v37) --[[ Line: 84 ]]
        -- upvalues: l_v27_Children_0 (copy), v31 (copy), v19 (ref), l_ReplicatedStorage_0 (ref), v8 (ref), l_TweenService_0 (ref), v24 (ref), l_RunService_0 (ref), v11 (ref), v12 (ref), v16 (ref)
        for _, v39 in v37 do
            local v40 = l_v27_Children_0[v39.Chosen];
            local v41 = script.Firework:Clone();
            v41.CFrame = v31[v40];
            v41.Parent = workspace;
            local v42 = script.FireworkStartup:Clone();
            v42.CFrame = v31[v40] + Vector3.new(0, v40.Size.Y * 0.5 - v42.Size.Y * 0.5, 0);
            v42.Parent = workspace;
            v19.emit(v42);
            local v43 = l_ReplicatedStorage_0.Sounds.Events["4th of July"]["Trail Sound Ball"]:Clone();
            v43.Parent = v41;
            v8:PlaySound(v43);
            local v44 = l_ReplicatedStorage_0.Sounds.Events["4th of July"].Shot:Clone();
            v44.Parent = v42;
            v8:PlaySound(v44);
            task.delay(2, function() --[[ Line: 112 ]]
                -- upvalues: v42 (copy)
                v42:Destroy();
            end);
            local v45 = v31[v40] - Vector3.new(0, v40.Size.Y, 0);
            local v46 = v31[v40] + Vector3.new(0, v39.Height, 0);
            local v47 = v39.Height / 20;
            local v48 = l_TweenService_0:Create(v41, TweenInfo.new(v47, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                CFrame = v46
            });
            v48:Play();
            task.delay(v47 * 0.8, function() --[[ Line: 124 ]]
                -- upvalues: v48 (copy), v8 (ref), l_ReplicatedStorage_0 (ref), v46 (copy), v39 (copy), v19 (ref), v41 (copy), v45 (copy), v24 (ref), l_RunService_0 (ref), v11 (ref), v12 (ref), v16 (ref)
                v48:Destroy();
                v8:PlaySound(l_ReplicatedStorage_0.Sounds.Events["4th of July"]["Firework Explosion"], v46.Position);
                local v49 = script.Effects[tostring(v39.FireworkEffect)]:Clone();
                v49.CFrame = v46;
                v49.Parent = workspace;
                v19.emit(v49);
                v41:Destroy();
                task.delay(4, function() --[[ Line: 137 ]]
                    -- upvalues: v49 (copy)
                    v49:Destroy();
                end);
                for _, v51 in v39.Falloffs do
                    local v52 = nil;
                    if typeof(v51) == "Vector3" then
                        v52 = v45 + v51;
                        local v53 = workspace:Raycast((v46 + v51).Position, Vector3.new(-0, -200, -0, -0), v24);
                        if v53 then
                            v52 = CFrame.new(v53.Position);
                        end;
                    end;
                    local v54 = script.Falloff:Clone();
                    v54.CFrame = v46;
                    v54.Parent = workspace;
                    local v55 = 0;
                    local v56 = nil;
                    do
                        local l_v52_0, l_v55_0, l_v56_0 = v52, v55, v56;
                        l_v56_0 = l_RunService_0.PostSimulation:Connect(function(v60) --[[ Line: 159 ]]
                            -- upvalues: l_v55_0 (ref), l_v52_0 (ref), v51 (copy), v11 (ref), v12 (ref), v54 (copy), v16 (ref), v46 (ref), v39 (ref), v19 (ref), l_v56_0 (ref)
                            debug.profilebegin("4th of July:Falloff");
                            l_v55_0 = l_v55_0 + v60;
                            local v61 = l_v52_0 or type(v51) == "string" and CFrame.new(v11.getAnimalPosition(v51, {
                                top = true
                            })) or CFrame.identity;
                            local v62 = l_v55_0 / 2.3;
                            v12.pushPartCFrame(v54, CFrame.new(v16.quadBezier(v62, v46.Position, v46.Position + Vector3.new(0, v39.Height, 0) + (v61.Position - v46.Position) * Vector3.new(1, 0, 1, 0) * 0.7, v61.Position)));
                            if v62 >= 1 and type(v51) ~= "string" then
                                local v63 = script.GroundImpact:Clone();
                                v63.CFrame = v61 + Vector3.new(0, v63.Size.Y * 0.5, 0);
                                v63.Parent = workspace;
                                v19.emit(v63);
                                v19.disable(v54);
                                task.delay(3, function() --[[ Line: 190 ]]
                                    -- upvalues: v54 (ref), v63 (copy)
                                    v54:Destroy();
                                    v63:Destroy();
                                end);
                                l_v56_0:Disconnect();
                            end;
                            debug.profileend();
                        end);
                    end;
                end;
            end);
        end;
    end));
    local v64 = Random.new();
    for _, v66 in l_v27_Children_0 do
        v66.CFrame = v31[v66] - Vector3.new(0, v66.Size.Y * 1.1, 0);
        local v67 = l_TweenService_0:Create(v66, TweenInfo.new(v64:NextNumber(3, 7), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            CFrame = v31[v66]
        });
        local v68 = v23:Add(function() --[[ Line: 212 ]]
            -- upvalues: v67 (copy)
            v67:Cancel();
            v67:Destroy();
        end);
        v67.Completed:Once(function() --[[ Line: 217 ]]
            -- upvalues: v23 (ref), v68 (copy)
            v23:Remove(v68);
        end);
        v67:Play();
    end;
end;
v6.OnStop = function(_) --[[ Line: 225 ]] --[[ Name: OnStop ]]
    -- upvalues: v23 (copy)
    v23:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 229 ]] --[[ Name: OnLoad ]]
    -- upvalues: v21 (copy), v7 (copy), v11 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v19 (copy)
    v21.OnClientEvent:Connect(function(v71) --[[ Line: 230 ]]
        -- upvalues: v7 (ref), v11 (ref), v8 (ref), l_ReplicatedStorage_0 (ref), v19 (ref)
        local v72 = v7:GetAnimals()[v71];
        if not v72 then
            return;
        else
            local v73 = script.FireworkBurst:Clone();
            v73.CFrame = CFrame.new(v11.getAnimalPosition(v71, {
                top = true
            }));
            v73.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v73;
            l_WeldConstraint_0.Part1 = v72.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v73;
            v73.Parent = workspace;
            v8:PlaySound(l_ReplicatedStorage_0.Sounds.Events["4th of July"]["Brainrot Hit"], v73.Position);
            v19.emit(v73);
            task.delay(3, function() --[[ Line: 251 ]]
                -- upvalues: v73 (copy)
                v73:Destroy();
            end);
            return;
        end;
    end);
end;
return v6;