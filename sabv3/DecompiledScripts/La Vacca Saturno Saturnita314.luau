local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local _ = l_ReplicatedStorage_0.Models.Events["La Vacca"];
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v10 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v12 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v13 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v14 = require(l_ReplicatedStorage_0.Shared.MapInformation);
local v15 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v17 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v19 = require(l_ReplicatedStorage_0.Packages.Net):RemoteEvent("EventService/LaVacca/Comet");
local l_Name_0 = script.Name;
local v21 = v17.new();
local l_CurrentCamera_0 = workspace.CurrentCamera;
v6.OnStart = function(_) --[[ Line: 33 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), v21 (copy), l_ReplicatedStorage_0 (copy), v14 (copy), l_RunService_0 (copy), v15 (copy), v9 (copy), v10 (copy), v12 (copy), v19 (copy), v8 (copy), l_CurrentCamera_0 (copy), v13 (copy)
    local l_v11_ActiveEventData_0 = v11:GetActiveEventData(l_Name_0);
    assert(l_v11_ActiveEventData_0);
    local _ = workspace:GetServerTimeNow();
    local v26 = l_v11_ActiveEventData_0.startedAt + 11 - workspace:GetServerTimeNow();
    if v26 > 0 then
        local v27 = v21:Extend();
        local v28 = v27:Add(Instance.new("Model"));
        local v29 = v27:Add(Instance.new("Part"));
        v29.Name = "Center";
        v29.Transparency = 1;
        v29.Anchored = true;
        v29.CanCollide = false;
        v29.CanQuery = false;
        v29.CanTouch = false;
        v29.Size = Vector3.new(1, 1, 1, 0);
        v29.Position = l_ReplicatedStorage_0:GetAttribute("LaVaccaCenter") or v14.MapCenter.Position;
        v29.Parent = v28;
        v28.PrimaryPart = v29;
        v28.Parent = workspace;
        local v30 = table.create(3);
        v27:Add(function() --[[ Line: 69 ]]
            -- upvalues: v30 (copy)
            table.clear(v30);
        end);
        local v31 = 0;
        do
            local l_v31_0 = v31;
            v27:Add(l_RunService_0.PreRender:Connect(function(v33) --[[ Line: 74 ]]
                -- upvalues: l_v31_0 (ref), v30 (copy)
                debug.profilebegin("La Vacca Event");
                l_v31_0 = l_v31_0 + v33;
                for v34, v35 in v30 do
                    if v35.target and v35.targetAttachment then
                        v35.beam.First.Enabled = true;
                        v35.beam.Second.Enabled = true;
                        local v36 = math.clamp(l_v31_0 - v34 + 1, 0, 1);
                        local l_WorldPosition_0 = v35.beam.WorldPosition;
                        v35.targetAttachment.Position = l_WorldPosition_0 + (v35.target:GetPivot().Position - l_WorldPosition_0) * v36;
                    end;
                end;
                debug.profileend();
            end));
            v27:Add(v15.observeTag("LaVaccaModel", function(v38) --[[ Line: 96 ]]
                -- upvalues: v28 (copy), v30 (copy), v15 (ref)
                v38.Parent = v28;
                local v39 = script.PlayerVFX.Beam:Clone();
                v39.Parent = v38.PrimaryPart;
                v30[v38:GetAttribute("LaVaccaIndex")] = {
                    beam = v39, 
                    target = nil
                };
                local v43 = v15.observeTag("LaVaccaModel", function(v40) --[[ Line: 107 ]]
                    -- upvalues: v38 (copy), v39 (copy), v30 (ref)
                    if v40 == v38 then
                        return nil;
                    elseif v40:GetAttribute("LaVaccaIndex") ~= v38:GetAttribute("LaVaccaIndex") % 3 + 1 then
                        return nil;
                    else
                        local l_Attachment_0 = Instance.new("Attachment");
                        l_Attachment_0.Position = v39.WorldPosition;
                        l_Attachment_0.Parent = workspace.Terrain;
                        local v42 = v30[v38:GetAttribute("LaVaccaIndex")];
                        v42.target = v40.PrimaryPart;
                        v42.beam.First.Attachment0 = l_Attachment_0;
                        v42.beam.Second.Attachment0 = l_Attachment_0;
                        v42.targetAttachment = l_Attachment_0;
                        return function() --[[ Line: 126 ]]
                            -- upvalues: l_Attachment_0 (copy)
                            l_Attachment_0:Destroy();
                        end;
                    end;
                end);
                return function() --[[ Line: 131 ]]
                    -- upvalues: v30 (ref), v38 (copy), v39 (copy), v43 (copy)
                    v30[v38:GetAttribute("LaVaccaIndex")] = nil;
                    v39:Destroy();
                    v43();
                end;
            end));
            local l_CFrame_0 = v29.CFrame;
            local v45 = v27:Clone(script.SummonVFX);
            v45:PivotTo(l_CFrame_0);
            v45.Parent = workspace;
            local v46 = v27:Clone(script.SummonVFXBeam);
            v46:PivotTo(l_CFrame_0);
            v46.Parent = workspace;
            v27:Add(l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 149 ]]
                -- upvalues: l_v11_ActiveEventData_0 (copy), v28 (copy), l_CFrame_0 (copy), v46 (copy), v27 (copy)
                debug.profilebegin("La Vacca Event Animation");
                local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                if l_workspace_ServerTimeNow_1 < l_v11_ActiveEventData_0.startedAt + 3 then
                    return;
                else
                    local v49 = math.clamp(1 - (l_v11_ActiveEventData_0.startedAt + 11 - l_workspace_ServerTimeNow_1) / 8, 0, 1);
                    local v50 = v49 * v49 * 3.141592653589793 * 2 * 8;
                    local v51 = v49 * v49 * 150;
                    v28:PivotTo(l_CFrame_0 * CFrame.Angles(0, v50, 0) * CFrame.new(0, v51, 0));
                    v46.Beams.Position = Vector3.new(0, v51, 0);
                    if v49 >= 1 then
                        v27:Clean();
                    end;
                    debug.profileend();
                    return;
                end;
            end));
            v27:Add(v15.observeTag("LaVaccaPlayerVFX", function(v52) --[[ Line: 171 ]]
                local v53 = script.PlayerVFX.Torso:Clone();
                v53.Parent = v52;
                return function() --[[ Line: 175 ]]
                    -- upvalues: v53 (copy)
                    v53:Destroy();
                end;
            end, {
                workspace
            }));
        end;
    end;
    v21:Add(task.delay(v26, function() --[[ Line: 181 ]]
        -- upvalues: v9 (ref), l_Name_0 (ref), v21 (ref), l_ReplicatedStorage_0 (ref), v10 (ref), v12 (ref)
        v9:Run(l_Name_0, "Space");
        v9:Activate("Blink");
        v21:Add(function() --[[ Line: 185 ]]
            -- upvalues: v9 (ref)
            v9:Activate("Blink");
        end);
        l_ReplicatedStorage_0:SetAttribute("LaVaccaEvent", true);
        v10:UpdateOST();
        v12:Update();
        v21:Add(function() --[[ Line: 193 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v9 (ref), l_Name_0 (ref)
            l_ReplicatedStorage_0:SetAttribute("LaVaccaEvent", nil);
            v9:Stop(l_Name_0, "Space");
        end);
    end));
    v21:Add(v19.OnClientEvent:Connect(function(v54, v55) --[[ Line: 199 ]]
        -- upvalues: v8 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), l_RunService_0 (ref), l_CurrentCamera_0 (ref), v13 (ref), v21 (ref)
        local v56 = v8:GetAnimals()[v55];
        if not v56 then
            return;
        else
            local _ = function() --[[ Line: 205 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v56 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v56.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, v56.AnimalModel:GetExtentsSize().Y * 0.5, 0);
            end;
            local v60 = CFrame.new(v54);
            task.spawn(function() --[[ Line: 220 ]]
                -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), v56 (copy)
                local l_v10_0 = v10;
                local l_CommetActivation_0 = l_ReplicatedStorage_0.Sounds.Events["La Vacca Saturno Saturnita"].CommetActivation;
                local _ = nil;
                local l_AnimalModel_1 = v56.AnimalModel;
                l_v10_0:PlaySound(l_CommetActivation_0, (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position + Vector3.new(0, v56.AnimalModel:GetExtentsSize().Y * 0.5, 0));
            end);
            local v65 = script.Comet:Clone();
            v65:PivotTo(v60);
            v65.Parent = workspace;
            local v66 = 0;
            local v67 = nil;
            v67 = l_RunService_0.PreRender:Connect(function(v68) --[[ Line: 231 ]]
                -- upvalues: v67 (ref), v66 (ref), v56 (copy), v65 (copy), v60 (copy), v10 (ref), l_ReplicatedStorage_0 (ref), l_CurrentCamera_0 (ref), v13 (ref), v21 (ref)
                if not v67 or not v67.Connected then
                    return;
                else
                    debug.profilebegin("La Vacca Commet Hit");
                    v66 = v66 + v68;
                    local l_new_0 = CFrame.new;
                    local _ = nil;
                    local l_AnimalModel_2 = v56.AnimalModel;
                    l_new_0 = l_new_0((if l_AnimalModel_2.PrimaryPart then l_AnimalModel_2.PrimaryPart.CFrame else l_AnimalModel_2:GetPivot()).Position + Vector3.new(0, v56.AnimalModel:GetExtentsSize().Y * 0.5, 0));
                    local v72 = math.clamp(v66 / 1, 0, 1);
                    v65:PivotTo(v60:Lerp(l_new_0, v72));
                    if v72 >= 1 then
                        v67:Disconnect();
                        task.spawn(function() --[[ Line: 247 ]]
                            -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), v56 (ref)
                            local l_v10_1 = v10;
                            local l_CommetHit_0 = l_ReplicatedStorage_0.Sounds.Events["La Vacca Saturno Saturnita"].CommetHit;
                            local _ = nil;
                            local l_AnimalModel_3 = v56.AnimalModel;
                            l_v10_1:PlaySound(l_CommetHit_0, (if l_AnimalModel_3.PrimaryPart then l_AnimalModel_3.PrimaryPart.CFrame else l_AnimalModel_3:GetPivot()).Position + Vector3.new(0, v56.AnimalModel:GetExtentsSize().Y * 0.5, 0));
                        end);
                        if (l_CurrentCamera_0.CFrame.Position - l_new_0.Position).Magnitude <= 70 then
                            l_AnimalModel_2 = v13.Bump:Clone();
                            v21:Add(l_AnimalModel_2);
                            l_AnimalModel_2.Sustain = true;
                            v21:Add(v13.BindShakeToCamera(l_AnimalModel_2, l_CurrentCamera_0));
                            l_AnimalModel_2:Start();
                            local l_l_AnimalModel_2_0 = l_AnimalModel_2 --[[ copy: 4 -> 11 ]];
                            v21:Add(task.delay(0.3, function() --[[ Line: 259 ]]
                                -- upvalues: l_l_AnimalModel_2_0 (copy)
                                l_l_AnimalModel_2_0:StopSustain();
                            end));
                        end;
                        l_AnimalModel_2 = script.CometBurst:Clone();
                        l_AnimalModel_2:PivotTo(l_new_0);
                        l_AnimalModel_2.Anchored = false;
                        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                        l_WeldConstraint_0.Part0 = l_AnimalModel_2;
                        l_WeldConstraint_0.Part1 = v56.AnimalModel.PrimaryPart;
                        l_WeldConstraint_0.Parent = l_AnimalModel_2;
                        l_AnimalModel_2.Parent = workspace;
                        for _, v80 in v65:GetDescendants() do
                            if v80:IsA("BasePart") then
                                v80.Transparency = 1;
                            elseif v80:IsA("ParticleEmitter") then
                                v80.Enabled = false;
                                v80:Clear();
                            end;
                        end;
                        for _, v82 in l_AnimalModel_2:GetDescendants() do
                            if v82:IsA("ParticleEmitter") then
                                task.delay(v82:GetAttribute("EmitDelay") or 0, function() --[[ Line: 287 ]]
                                    -- upvalues: v82 (copy)
                                    v82:Emit(v82:GetAttribute("EmitCount"));
                                end);
                            end;
                        end;
                        task.delay(2, function() --[[ Line: 293 ]]
                            -- upvalues: v65 (ref), l_AnimalModel_2 (copy)
                            v65:Destroy();
                            l_AnimalModel_2:Destroy();
                        end);
                    end;
                    debug.profileend();
                    return;
                end;
            end);
            return;
        end;
    end));
end;
v6.OnStop = function(_) --[[ Line: 304 ]] --[[ Name: OnStop ]]
    -- upvalues: v21 (copy)
    v21:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 308 ]] --[[ Name: OnLoad ]]

end;
return v6;