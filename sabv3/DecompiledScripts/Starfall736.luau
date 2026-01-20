local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local l_Lighting_0 = game:GetService("Lighting");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v5 = {};
local v6 = require(l_ReplicatedStorage_0.Packages.Net);
local v7 = require(l_ReplicatedStorage_0.Packages.Trove);
local v8 = require(l_ReplicatedStorage_0.Shared.VFX);
local v9 = require(l_ReplicatedStorage_0.Packages.Shake);
local v10 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v12 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v13 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v15 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v16 = v6:RemoteEvent("EventService/Starfall/CreateStar");
local v17 = v6:RemoteEvent("EventService/Starfall/ExplodeStar");
local l_Name_0 = script.Name;
local v19 = v9.new();
v19.Amplitude = 1.5;
v19.Frequency = 0.1;
v19.FadeInTime = 0;
v19.FadeOutTime = 0.6;
v19.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
v19.RotationInfluence = Vector3.new(2.5, 0.5, 0.5, 0);
local v20 = v7.new();
local v21 = {};
v5.OnStart = function(_) --[[ Line: 43 ]] --[[ Name: OnStart ]]
    -- upvalues: v13 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v20 (copy), v14 (copy), v8 (copy), l_Lighting_0 (copy), v11 (copy), v12 (copy)
    local l_v13_ActiveEventData_0 = v13:GetActiveEventData(l_Name_0);
    assert(l_v13_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("Starfall", true);
    v20:Add(function() --[[ Line: 48 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("Starfall", nil);
    end);
    v20:Add(function() --[[ Line: 52 ]]
        -- upvalues: v14 (ref)
        v14:Activate("Blink");
    end);
    local v24 = v20:Clone(script.StarfallWeather);
    v8.disable(v24);
    v24.Parent = workspace;
    local v25 = l_v13_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow();
    v20:Add(task.delay(v25, function() --[[ Line: 62 ]]
        -- upvalues: v14 (ref), l_Lighting_0 (ref), v20 (ref), v8 (ref), v24 (copy)
        v14:Activate("Blink");
        local l_Atmosphere_0 = l_Lighting_0:FindFirstChildOfClass("Atmosphere");
        if l_Atmosphere_0 then
            l_Atmosphere_0.Parent = script;
            v20:Add(function() --[[ Line: 68 ]]
                -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
                l_Atmosphere_0.Parent = l_Lighting_0;
            end);
        end;
        v20:Clone(script.Atmosphere).Parent = l_Lighting_0;
        local l_Sky_0 = l_Lighting_0:FindFirstChildOfClass("Sky");
        if l_Sky_0 then
            l_Sky_0.Parent = script;
            v20:Add(function() --[[ Line: 77 ]]
                -- upvalues: l_Sky_0 (copy), l_Lighting_0 (ref)
                l_Sky_0.Parent = l_Lighting_0;
            end);
        end;
        v20:Clone(script.Sky).Parent = l_Lighting_0;
        v8.enable(v24);
    end));
    v11:Update();
    v12:UpdateOST();
    v12:UpdateAmbience();
end;
v5.OnStop = function(_) --[[ Line: 91 ]] --[[ Name: OnStop ]]
    -- upvalues: v20 (copy), v21 (copy)
    v20:Destroy();
    for _, v30 in v21 do
        if v30.Tween then
            v30.Tween:Cancel();
        end;
        if v30.Model then
            v30.Model:Destroy();
        end;
    end;
    table.clear(v21);
end;
v5.OnLoad = function(_) --[[ Line: 105 ]] --[[ Name: OnLoad ]]
    -- upvalues: v16 (copy), l_TweenService_0 (copy), v21 (copy), v17 (copy), v12 (copy), l_ReplicatedStorage_0 (copy), l_Debris_0 (copy), v15 (copy), v8 (copy), v19 (copy), v20 (copy), v10 (copy)
    v16.OnClientEvent:Connect(function(v32, v33, v34, v35) --[[ Line: 106 ]]
        -- upvalues: l_TweenService_0 (ref), v21 (ref)
        local v36 = script.Meteor:Clone();
        v36:PivotTo(CFrame.new(v33));
        v36.Parent = workspace;
        local l_PrimaryPart_0 = v36.PrimaryPart;
        if not l_PrimaryPart_0 then
            warn("Starfall meteor model is missing a PrimaryPart!");
            v36:Destroy();
            return;
        else
            local v38 = TweenInfo.new(v35, Enum.EasingStyle.Linear);
            local v39 = CFrame.lookAt(v34, v33);
            local v40 = l_TweenService_0:Create(l_PrimaryPart_0, v38, {
                CFrame = v39
            });
            v40:Play();
            v21[v32] = {
                Model = v36, 
                Tween = v40
            };
            v40.Completed:Once(function() --[[ Line: 129 ]]
                -- upvalues: v21 (ref), v32 (copy)
                if v21[v32] then
                    v21[v32].Tween = nil;
                end;
            end);
            return;
        end;
    end);
    v17.OnClientEvent:Connect(function(v41, v42, v43) --[[ Line: 136 ]]
        -- upvalues: v21 (ref), v12 (ref), l_ReplicatedStorage_0 (ref), l_Debris_0 (ref), v15 (ref), v8 (ref), v19 (ref), v20 (ref), v10 (ref)
        local v44 = v21[v41];
        if v44 then
            task.spawn(function() --[[ Line: 139 ]]
                -- upvalues: v12 (ref), l_ReplicatedStorage_0 (ref), v42 (copy)
                v12:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Starfall.Impact, v42);
            end);
            if v44.Tween then
                v44.Tween:Cancel();
            end;
            if v44.Model then
                local l_Model_0 = v44.Model;
                for _, v47 in l_Model_0:GetDescendants() do
                    if v47:IsA("ParticleEmitter") then
                        v47.Enabled = false;
                    elseif v47:IsA("BasePart") then
                        v47.Transparency = 1;
                    end;
                end;
                l_Debris_0:AddItem(l_Model_0, 3);
            end;
            v21[v41] = nil;
        end;
        if v43 then
            local v48 = v15:GetAnimals()[v43];
            if not v48 then
                return;
            else
                local v49 = nil;
                local l_PrimaryPart_1 = v48.AnimalModel.PrimaryPart;
                local _ = nil;
                local l_AnimalModel_0 = v48.AnimalModel;
                v49 = (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, v48.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                task.spawn(function() --[[ Line: 182 ]]
                    -- upvalues: v12 (ref), l_ReplicatedStorage_0 (ref), v49 (ref)
                    v12:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Starfall.BrainrotHit, v49);
                end);
                local v53 = script.StruckVFX:Clone();
                v53:PivotTo(CFrame.new(v49));
                v53.Anchored = false;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v53;
                l_WeldConstraint_0.Part1 = l_PrimaryPart_1;
                l_WeldConstraint_0.Parent = v53;
                v53.Parent = workspace;
                v8.emit(v53);
                task.delay(5, function() --[[ Line: 198 ]]
                    -- upvalues: v53 (copy)
                    v53:Destroy();
                end);
                return;
            end;
        else
            local v55 = script.Explosion:Clone();
            v55:PivotTo(CFrame.new(v42));
            v55.Parent = workspace;
            for _, v57 in v55:GetDescendants() do
                if v57:IsA("ParticleEmitter") then
                    task.delay(v57:GetAttribute("EmitDelay") or 0, function() --[[ Line: 208 ]]
                        -- upvalues: v57 (copy)
                        v57:Emit(v57:GetAttribute("EmitCount") or 1);
                    end);
                end;
            end;
            l_Debris_0:AddItem(v55, 5);
            local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v42).Magnitude;
            if l_Magnitude_0 <= 150 then
                local v59 = v19:Clone();
                local v60 = math.pow(1 - l_Magnitude_0 / 150, 2);
                v59.Amplitude = v59.Amplitude * v60;
                v59.RotationInfluence = v59.RotationInfluence * v60;
                v20:Add(v10.BindShakeToCamera(v59));
                v59:Start();
            end;
            return;
        end;
    end);
end;
return v5;