local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v5 = {};
local v6 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v7 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v8 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v9 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v10 = require(l_ReplicatedStorage_0.Packages.Spring);
local v11 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v13 = require(l_ReplicatedStorage_0.Packages.Net);
local v14 = require(l_ReplicatedStorage_0.Shared.VFX);
local v15 = require(l_ReplicatedStorage_0.Shared.MapInformation);
local v16 = v13:RemoteEvent("EventService/RainingTacos/Shoot");
local l_Name_0 = script.Name;
local v18 = v11.new();
local _ = workspace.CurrentCamera;
@native
local function _(v20, v21, v22, v23) --[[ Line: 28 ]] --[[ Name: quadBezier ]]
    return (1 - v20) ^ 2 * v21 + (1 - v20) * 2 * v20 * v22 + v20 ^ 2 * v23;
end;
v5.OnStart = function(_) --[[ Line: 32 ]] --[[ Name: OnStart ]]
    -- upvalues: v8 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v18 (copy), v7 (copy), v9 (copy), v15 (copy), v10 (copy), l_RunService_0 (copy), v16 (copy), v6 (copy), v14 (copy)
    assert((v8:GetActiveEventData(l_Name_0)));
    l_ReplicatedStorage_0:SetAttribute("RainingTacosEvent", true);
    v18:Add(function() --[[ Line: 37 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v7 (ref), v9 (ref)
        l_ReplicatedStorage_0:SetAttribute("RainingTacosEvent", nil);
        v7:UpdateOST();
        v9:Update();
    end);
    v7:UpdateOST();
    v9:Update();
    local v26 = v18:Clone(script.Cannon);
    v26.Parent = workspace;
    local v27 = script.TacoAmbient:Clone();
    v18:Add(function() --[[ Line: 50 ]]
        -- upvalues: v27 (copy)
        for _, v29 in v27:GetDescendants() do
            if v29:IsA("ParticleEmitter") then
                v29.Enabled = false;
            end;
        end;
        task.wait(5);
        v27:Destroy();
    end);
    v27:PivotTo(v15.MapCenter.CFrame + Vector3.new(0, 40, 0, 0));
    v27.Parent = workspace;
    local v30 = v26.Top["Meshes/tacolauncher_Cube.004"]["Meshes/tacolauncher_Cube.003"];
    local v31 = v26.Bottom.RootPart["Meshes/tacolauncher_Cube.004"];
    local v32 = v10.new(0);
    v32.Speed = 6.5;
    v32.Damper = 0.85;
    local v33 = v10.new(0);
    v33.Speed = 9;
    v33.Damper = 0.6;
    v18:Add(l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 76 ]]
        -- upvalues: v30 (copy), v32 (copy), v31 (copy), v33 (copy)
        debug.profilebegin("Raining Tacos Cannon Spring");
        v30.C1 = CFrame.new(v32.Position, 0, 0);
        v31.C1 = CFrame.Angles(0, 0, -math.rad(v33.Position));
        debug.profileend();
    end));
    v18:Add(v16.OnClientEvent:Connect(function(v35, v36) --[[ Line: 83 ]]
        -- upvalues: v6 (ref), v7 (ref), l_ReplicatedStorage_0 (ref), v26 (copy), v33 (copy), v32 (copy), l_RunService_0 (ref), v14 (ref)
        local v37 = v6:GetAnimals()[v35];
        if not v37 then
            return;
        else
            local _ = function() --[[ Line: 89 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v37 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v37.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, v37.AnimalModel:GetExtentsSize().Y * 0.5, 0);
            end;
            local v41 = script.Taco:Clone();
            v41.Parent = workspace;
            task.spawn(function() --[[ Line: 105 ]]
                -- upvalues: v7 (ref), l_ReplicatedStorage_0 (ref), v26 (ref)
                v7:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Raining Tacos"].Shoot, v26:GetPivot().Position);
            end);
            task.spawn(function() --[[ Line: 109 ]]
                -- upvalues: v33 (ref), v32 (ref)
                v33:Impulse(650);
                task.wait(0.05);
                v32:Impulse(35);
            end);
            local l_Position_0 = v26.ShootPart.CFrame.Position;
            local v43 = nil;
            v43 = l_RunService_0.PreRender:Connect(function() --[[ Line: 118 ]]
                -- upvalues: v37 (copy), l_Position_0 (copy), v36 (copy), v41 (copy), v43 (ref), v7 (ref), l_ReplicatedStorage_0 (ref), v14 (ref)
                debug.profilebegin("Raining Tacos");
                local v44 = nil;
                local l_AnimalModel_1 = v37.AnimalModel;
                local v46 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position + Vector3.new(0, v37.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                v44 = l_Position_0 + (v46 - l_Position_0) * 0.5 + Vector3.new(0, 60, 0, 0);
                l_AnimalModel_1 = 1 - (v36 + 2.5 - workspace:GetServerTimeNow()) / 2.5;
                local v47 = math.clamp(l_AnimalModel_1, 0, 1);
                local l_l_Position_0_0 = l_Position_0;
                local v49 = (1 - v47) ^ 2 * l_l_Position_0_0 + (1 - v47) * 2 * v47 * v44 + v47 ^ 2 * v46;
                l_l_Position_0_0 = math.clamp(l_AnimalModel_1, 0, 1) + 0.1;
                local l_l_Position_0_1 = l_Position_0;
                v47 = (1 - l_l_Position_0_0) ^ 2 * l_l_Position_0_1 + (1 - l_l_Position_0_0) * 2 * l_l_Position_0_0 * v44 + l_l_Position_0_0 ^ 2 * v46;
                v41.CFrame = CFrame.lookAt(v49, v47);
                if l_AnimalModel_1 >= 1 then
                    v43:Disconnect();
                    task.spawn(function() --[[ Line: 134 ]]
                        -- upvalues: v7 (ref), l_ReplicatedStorage_0 (ref), v46 (copy)
                        v7:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Raining Tacos"].Hit, v46);
                    end);
                    v41:Destroy();
                    l_l_Position_0_0 = script.StruckVFX:Clone();
                    l_l_Position_0_0:PivotTo(CFrame.new(v46));
                    l_l_Position_0_0.Anchored = false;
                    l_l_Position_0_1 = Instance.new("WeldConstraint");
                    l_l_Position_0_1.Part0 = l_l_Position_0_0;
                    l_l_Position_0_1.Part1 = v37.AnimalModel.PrimaryPart;
                    l_l_Position_0_1.Parent = l_l_Position_0_0;
                    l_l_Position_0_0.Parent = workspace;
                    v14.emit(l_l_Position_0_0);
                    task.delay(3, function() --[[ Line: 154 ]]
                        -- upvalues: l_l_Position_0_0 (copy)
                        l_l_Position_0_0:Destroy();
                    end);
                end;
                debug.profileend();
            end);
            return;
        end;
    end));
end;
v5.OnStop = function(_) --[[ Line: 164 ]] --[[ Name: OnStop ]]
    -- upvalues: v18 (copy)
    v18:Destroy();
end;
v5.OnLoad = function(_) --[[ Line: 168 ]] --[[ Name: OnLoad ]]

end;
return v5;