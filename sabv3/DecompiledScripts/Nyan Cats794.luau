local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v13 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v16 = require(l_ReplicatedStorage_0.Shared.MapInformation);
local v17 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v19 = require(l_ReplicatedStorage_0.Packages.Net):RemoteEvent("EventService/NyanCats/Struck");
local l_Name_0 = script.Name;
local v21 = v17.new();
local l_CurrentCamera_0 = workspace.CurrentCamera;
@native
local function _(v23, v24, v25, v26) --[[ Line: 32 ]] --[[ Name: quadBezier ]]
    return (1 - v23) ^ 2 * v24 + (1 - v23) * 2 * v23 * v25 + v23 ^ 2 * v26;
end;
v6.OnStart = function(_) --[[ Line: 36 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v21 (copy), v8 (copy), v9 (copy), v11 (copy), v16 (copy), l_RunService_0 (copy), v19 (copy), v7 (copy), l_CurrentCamera_0 (copy), v13 (copy)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("NyanCatsEvent", true);
    v21:Add(function() --[[ Line: 41 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("NyanCatsEvent", nil);
    end);
    v8:Run(l_Name_0, "Space");
    v8:Activate("Blink");
    v21:Add(function() --[[ Line: 48 ]]
        -- upvalues: v8 (ref)
        v8:Activate("Blink");
    end);
    v9:UpdateOST();
    v11:Update();
    v21:Add(function() --[[ Line: 55 ]]
        -- upvalues: v8 (ref), l_Name_0 (ref)
        v8:Stop(l_Name_0, "Space");
    end);
    local function v38(v30, v31, v32) --[[ Line: 64 ]] --[[ Name: getCatPosition ]]
        -- upvalues: v16 (ref)
        local v33 = math.ceil(v30 / 10);
        local v34 = (v30 % 10 + 1) / 10;
        local v35 = (v31 or 0) + v33 + v34 * 3.141592653589793 * 2;
        local v36 = v16.MapCenter.Position + vector.create(0, v33 * 15 + 35, 0);
        local v37 = vector.create(math.cos(v35) * 270 * 0.5, v32 or math.sin(os.clock() * 6) * 1.5, math.sin(v35) * 420 * 0.5);
        return CFrame.lookAt(v36 + v37, v36);
    end;
    local v39 = table.create(30);
    for v40 = 1, 30 do
        local v41 = v21:Clone(script.NyanCat);
        v41.Parent = workspace;
        local v42 = v41.AnimationController.Animator:LoadAnimation(script.Animation);
        v42.Looped = true;
        v42:Play();
        v21:Add(function() --[[ Line: 90 ]]
            -- upvalues: v42 (copy)
            v42:Stop(0);
            v42:Destroy();
        end);
        v39[v40] = {
            model = v41, 
            scale = v41:GetScale(), 
            rootPart = v41.RootPart, 
            state = {
                type = "hovering"
            }, 
            visualState = {
                cframe = v38(v40)
            }
        };
    end;
    local v43 = table.create(30);
    local v44 = table.create(30);
    v21:Add(l_RunService_0.PostSimulation:Connect(function(v45) --[[ Line: 117 ]]
        -- upvalues: l_v10_ActiveEventData_0 (copy), v39 (copy), v38 (copy), v43 (copy), v44 (copy)
        debug.profilebegin("Nyan Cats");
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v47 = math.rad((l_workspace_ServerTimeNow_0 - l_v10_ActiveEventData_0.startedAt) * 10);
        local v48 = math.sin(l_workspace_ServerTimeNow_0 * 6) * 1.5;
        for v49, v50 in v39 do
            local v51 = nil;
            if v50.state.type == "hovering" then
                v50.visualState.startCFrame = nil;
                v51 = v38(v49, v47, v48);
            elseif v50.state.type == "follow" or v50.state.type == "restore" then
                local v52 = v50.state.type == "restore";
                if v50.visualState.lastState ~= v50.state.type then
                    v50.visualState.timer = 0;
                    v50.visualState.startCFrame = v50.visualState.cframe;
                    v50.visualState.lastState = v50.state.type;
                    v50.visualState.p1 = v50.visualState.cframe * if v52 then CFrame.new(0, 100, 0) else CFrame.new(0, 40, -100);
                end;
                local l_visualState_0 = v50.visualState;
                l_visualState_0.timer = l_visualState_0.timer + v45;
                l_visualState_0 = v50.state.lerpTime or 3;
                local v54 = if v52 then v38(v49, v47, v48).Position else v50.state.value;
                local v55 = math.clamp(v50.visualState.timer / l_visualState_0, 0, 1);
                local l_Position_0 = v50.visualState.startCFrame.Position;
                local l_Position_1 = v50.visualState.p1.Position;
                local v58 = (1 - v55) ^ 2 * l_Position_0 + (1 - v55) * 2 * v55 * l_Position_1 + v55 ^ 2 * v54;
                v51 = CFrame.lookAt(v58, v54 + Vector3.new(9.999999974752427E-7, 9.999999974752427E-7, 9.999999974752427E-7, 0)) * CFrame.Angles(0, -1.5707963267948966 * math.clamp(v50.visualState.timer / (l_visualState_0 * 0.5), 0, 1), 0);
                l_Position_0 = if v52 then math.lerp(0.5, v50.scale, v55) else math.lerp(v50.scale, 0.5, v55);
                v50.model:ScaleTo(l_Position_0);
                if v52 and v55 >= 1 then
                    v50.state = {
                        type = "hovering"
                    };
                end;
            end;
            v50.visualState.cframe = v51;
            v43[v49] = v50.rootPart;
            v44[v49] = v51;
        end;
        workspace:BulkMoveTo(v43, v44, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
    end));
    v21:Add(v19.OnClientEvent:Connect(function(v59, v60, v61) --[[ Line: 177 ]]
        -- upvalues: v7 (ref), l_RunService_0 (ref), v39 (copy), v9 (ref), l_ReplicatedStorage_0 (ref), l_CurrentCamera_0 (ref), v13 (ref), v21 (ref)
        local v62 = v7:GetAnimals()[v60];
        if not v62 then
            return;
        else
            local _ = function() --[[ Line: 183 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v62 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v62.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, v62.AnimalModel:GetExtentsSize().Y * 0.5, 0);
            end;
            local v66 = v61 + 3 - workspace:GetServerTimeNow();
            local v71 = l_RunService_0.PreRender:Connect(function() --[[ Line: 198 ]]
                -- upvalues: v39 (ref), v59 (copy), v62 (copy), v66 (copy)
                debug.profilebegin("Update Nycan Cat Follow Target");
                local v67 = v39[v59];
                local v68 = {
                    type = "follow"
                };
                local _ = nil;
                local l_AnimalModel_1 = v62.AnimalModel;
                v68.value = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position + Vector3.new(0, v62.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                v68.lerpTime = v66;
                v67.state = v68;
                debug.profileend();
            end);
            task.wait(v66);
            v71:Disconnect();
            v39[v59].state = {
                type = "restore"
            };
            local v72 = nil;
            local l_AnimalModel_2 = v62.AnimalModel;
            local v74 = (if l_AnimalModel_2.PrimaryPart then l_AnimalModel_2.PrimaryPart.CFrame else l_AnimalModel_2:GetPivot()).Position + Vector3.new(0, v62.AnimalModel:GetExtentsSize().Y * 0.5, 0);
            task.spawn(function() --[[ Line: 217 ]]
                -- upvalues: v9 (ref), l_ReplicatedStorage_0 (ref), v74 (copy)
                v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Nyan Cats"].Hit, v74);
            end);
            v72 = script.StruckVFX:Clone();
            v72:PivotTo(CFrame.new(v74));
            v72.Anchored = false;
            l_AnimalModel_2 = Instance.new("WeldConstraint");
            l_AnimalModel_2.Part0 = v72;
            l_AnimalModel_2.Part1 = v62.AnimalModel.PrimaryPart;
            l_AnimalModel_2.Parent = v72;
            v72.Parent = workspace;
            for _, v76 in v72:GetDescendants() do
                if v76:IsA("ParticleEmitter") then
                    task.delay(v76:GetAttribute("EmitDelay") or 0, function() --[[ Line: 235 ]]
                        -- upvalues: v76 (copy)
                        v76:Emit(v76:GetAttribute("EmitCount"));
                    end);
                end;
            end;
            task.delay(3, function() --[[ Line: 241 ]]
                -- upvalues: v72 (copy)
                v72:Destroy();
            end);
            if (l_CurrentCamera_0.CFrame.Position - v74).Magnitude <= 70 then
                local v77 = v13.Bump:Clone();
                v21:Add(v77);
                v77.Sustain = true;
                v21:Add(v13.BindShakeToCamera(v77, l_CurrentCamera_0));
                v77:Start();
                v21:Add(task.delay(0.3, function() --[[ Line: 253 ]]
                    -- upvalues: v77 (copy)
                    v77:StopSustain();
                end));
            end;
            return;
        end;
    end));
end;
v6.OnStop = function(_) --[[ Line: 260 ]] --[[ Name: OnStop ]]
    -- upvalues: v21 (copy)
    v21:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 264 ]] --[[ Name: OnLoad ]]

end;
return v6;