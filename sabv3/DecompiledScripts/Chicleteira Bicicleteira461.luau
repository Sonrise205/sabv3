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
local _ = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v17 = require(l_ReplicatedStorage_0.Packages.Timer);
local v18 = require(l_ReplicatedStorage_0.Packages.Trove);
local v19 = require(l_ReplicatedStorage_0.Packages.Net);
local v20 = require(l_ReplicatedStorage_0.Packages.Spr);
local v21 = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = require(l_ReplicatedStorage_0.Shared.Snapshot);
local l_Name_0 = script.Name;
local v24 = v19:RemoteEvent("EventService/Chicleteira Bicicleteira/SpawnChicleteira");
local v25 = v19:RemoteEvent("EventService/Chicleteira Bicicleteira/Burst");
local v26 = v18.new();
local function v49() --[[ Line: 37 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v26 (copy), l_RunService_0 (copy), v14 (copy)
    local v27 = v26:Extend();
    local v28 = table.create(2);
    v27:Add(function() --[[ Line: 49 ]]
        -- upvalues: v28 (copy)
        table.clear(v28);
    end);
    local v29 = 0;
    v27:Add(l_RunService_0.PreRender:Connect(function(v30) --[[ Line: 54 ]]
        -- upvalues: v29 (ref), v28 (copy)
        debug.profilebegin("Chicleteira Event");
        v29 = v29 + v30;
        for v31, v32 in v28 do
            if v32.target and v32.targetAttachment then
                v32.beam.First.Enabled = true;
                v32.beam.Second.Enabled = true;
                local v33 = math.clamp(v29 - v31 + 1, 0, 1);
                local l_WorldPosition_0 = v32.beam.WorldPosition;
                v32.targetAttachment.Position = l_WorldPosition_0 + (v32.target:GetPivot().Position - l_WorldPosition_0) * v33;
            end;
        end;
        debug.profileend();
    end));
    v27:Add(v14.observeTag("ChicleteiraPlayerVFX", function(v35) --[[ Line: 76 ]]
        -- upvalues: v28 (copy), v14 (ref)
        local v36 = script.PlayerVFX.Beam:Clone();
        v36.Parent = v35;
        local v37 = script.PlayerVFX[("Torso%*"):format(v35:GetAttribute("ChicleteiraIndex") % 2 + 1)]:Clone();
        v37.Parent = v35;
        local v38 = {};
        local v39 = script.PlayerVFX[("vfxTorso%*"):format(v35:GetAttribute("ChicleteiraIndex") % 2 + 1)]:Clone();
        for _, v41 in v39:GetChildren() do
            v41.Parent = v35;
            table.insert(v38, v41);
        end;
        v39:Destroy();
        local l_v35_Attribute_0 = v35:GetAttribute("ChicleteiraIndex");
        v28[l_v35_Attribute_0] = {
            beam = v36, 
            target = nil
        };
        local v46 = v14.observeTag("ChicleteiraPlayerVFX", function(v43) --[[ Line: 98 ]]
            -- upvalues: v35 (copy), v36 (copy), v28 (ref)
            if v43 == v35 then
                return nil;
            elseif v43:GetAttribute("ChicleteiraIndex") ~= v35:GetAttribute("ChicleteiraIndex") % 2 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v36.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v45 = v28[v35:GetAttribute("ChicleteiraIndex")];
                v45.target = v43;
                v45.beam.First.Attachment0 = l_Attachment_0;
                v45.beam.Second.Attachment0 = l_Attachment_0;
                v45.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 117 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 122 ]]
            -- upvalues: v37 (copy), v36 (copy), v38 (copy), v46 (copy), v28 (ref), l_v35_Attribute_0 (copy)
            v37:Destroy();
            v36:Destroy();
            for _, v48 in v38 do
                v48:Destroy();
            end;
            v46();
            v28[l_v35_Attribute_0] = nil;
        end;
    end));
end;
v6.OnStart = function(_) --[[ Line: 135 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v26 (copy), v7 (copy), v10 (copy), v9 (copy), v14 (copy), v18 (copy), v21 (copy), v17 (copy), v8 (copy), v20 (copy), v49 (copy)
    local l_v11_ActiveEventData_0 = v11:GetActiveEventData(l_Name_0);
    assert(l_v11_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("ChicleteiraBicicleteiraEvent", true);
    v26:Add(function() --[[ Line: 140 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v7 (ref), v10 (ref), v9 (ref)
        l_ReplicatedStorage_0:SetAttribute("ChicleteiraBicicleteiraEvent", nil);
        v7:Activate("Blink");
        v10:Update();
        v9:UpdateOST();
        v9:UpdateAmbience();
    end);
    v26:Add(task.delay(l_v11_ActiveEventData_0.startedAt + 2 - workspace:GetServerTimeNow(), function() --[[ Line: 149 ]]
        -- upvalues: v26 (ref), v14 (ref), v7 (ref), v10 (ref), v9 (ref)
        v26:Clone(script.Map).Parent = workspace;
        v26:Add(v14.observeTag("HideInChicleteiraBicicleteira", function(v52) --[[ Line: 151 ]]
            local l_Parent_0 = v52.Parent;
            v52.Parent = script;
            return function() --[[ Line: 154 ]]
                -- upvalues: v52 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 155 ]]
                    -- upvalues: v52 (ref), l_Parent_0 (ref)
                    v52.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script
        }));
        v7:Run("ChicleteiraBicicleteiraEvent", "GrassRecolor");
        v26:Add(function() --[[ Line: 162 ]]
            -- upvalues: v7 (ref)
            v7:Stop("ChicleteiraBicicleteiraEvent", "GrassRecolor");
        end);
        v7:Run("ChicleteiraBicicleteiraEvent", "WallRecolor");
        v26:Add(function() --[[ Line: 167 ]]
            -- upvalues: v7 (ref)
            v7:Stop("ChicleteiraBicicleteiraEvent", "WallRecolor");
        end);
        v10:Update();
        v9:UpdateOST();
        v9:UpdateAmbience();
        v7:Activate("Blink");
    end));
    v26:Add(v14.observeTag("Event_ChicleteiraBicicleteira", function(v54) --[[ Line: 178 ]]
        -- upvalues: v18 (ref), v9 (ref), l_ReplicatedStorage_0 (ref), v21 (ref), v17 (ref), v8 (ref), v20 (ref)
        local v55 = v54:GetPivot() * CFrame.fromOrientation(0, 3.141592653589793, 0);
        local v56 = v18.new();
        local v57 = v56:Clone(script["Standing Chicleteira Bicicleteira"]);
        v57:PivotTo(v55 - Vector3.new(0, v57:GetExtentsSize().Y, 0));
        v57.Parent = v54;
        local v58 = v57.AnimationController.Animator:LoadAnimation(script.Idle);
        v56:Add(v58, "Stop");
        v56:Add(v58);
        v58.Looped = true;
        v58.Priority = Enum.AnimationPriority.Idle;
        v58:Play();
        local v59 = v57.AnimationController.Animator:LoadAnimation(script.Painting);
        v56:Add(v59, "Stop");
        v56:Add(v59);
        v59.Looped = false;
        v59.Priority = Enum.AnimationPriority.Action4;
        v56:Add(v58:GetMarkerReachedSignal("Shake"):Connect(function(...) --[[ Line: 200 ]]
            -- upvalues: v59 (copy), v9 (ref), l_ReplicatedStorage_0 (ref), v55 (copy)
            if v59.IsPlaying then
                return;
            else
                task.spawn(function() --[[ Line: 205 ]]
                    -- upvalues: v9 (ref), l_ReplicatedStorage_0 (ref), v55 (ref)
                    v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Chicleteira Bicicleteira"].Shake, v55.Position);
                end);
                return;
            end;
        end));
        v56:Add(v54:GetAttributeChangedSignal("ForceSpray"):Connect(function() --[[ Line: 210 ]]
            -- upvalues: v54 (copy), v9 (ref), l_ReplicatedStorage_0 (ref), v55 (copy), v59 (copy), v21 (ref), v57 (copy)
            if not v54:GetAttribute("ForceSpray") then
                return;
            else
                task.spawn(function() --[[ Line: 215 ]]
                    -- upvalues: v9 (ref), l_ReplicatedStorage_0 (ref), v55 (ref)
                    v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Chicleteira Bicicleteira"].Spray, v55.Position);
                end);
                v59:Stop(0);
                v59:Play();
                task.wait(0.3);
                v21.enable(v57.Handle.vfx);
                task.wait(1);
                v21.disable(v57.Handle.vfx);
                return;
            end;
        end));
        v56:Add(task.spawn(function() --[[ Line: 227 ]]
            -- upvalues: v9 (ref), l_ReplicatedStorage_0 (ref), v55 (copy)
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Chicleteira Bicicleteira"].Ground, v55.Position);
        end));
        v56:Add(v17.Simple(0.1, function() --[[ Line: 231 ]]
            -- upvalues: v54 (copy), v8 (ref), v55 (copy), v20 (ref), v57 (copy)
            local v60 = nil;
            local l_v54_Attribute_0 = v54:GetAttribute("ForceSpray");
            if l_v54_Attribute_0 then
                local v62 = v8:GetAnimals()[l_v54_Attribute_0];
                if v62 then
                    v60 = v62.Instance;
                end;
            end;
            if v60 then
                local l_Position_0 = v60:GetPivot().Position;
                l_Position_0 = Vector3.new(l_Position_0.X, v55.Y, l_Position_0.Z);
                v20.target(v57, 1, 2, {
                    Pivot = CFrame.lookAt(v55.Position, l_Position_0) * CFrame.fromOrientation(0, 3.141592653589793, 0)
                });
                return;
            else
                v20.target(v57, 1, 2, {
                    Pivot = v55
                });
                return;
            end;
        end, true));
        return v56:WrapClean();
    end, {
        workspace
    }));
    v26:Add(task.spawn(function() --[[ Line: 259 ]]
        -- upvalues: v49 (ref)
        v49();
    end));
end;
v6.OnStop = function(_) --[[ Line: 264 ]] --[[ Name: OnStop ]]
    -- upvalues: v26 (copy)
    v26:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 268 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v25 (copy), v8 (copy), v9 (copy), l_ReplicatedStorage_0 (copy), v21 (copy), v24 (copy), v26 (copy), l_RunService_0 (copy)
    task.spawn(pcall, function() --[[ Line: 269 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v25.OnClientEvent:Connect(function(v66) --[[ Line: 273 ]]
        -- upvalues: v8 (ref), v9 (ref), l_ReplicatedStorage_0 (ref), v21 (ref)
        local v67 = v8:GetAnimals()[v66];
        if not v67 then
            return;
        else
            local _ = function() --[[ Line: 279 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v67 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v67.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
            end;
            local v71 = nil;
            local l_AnimalModel_1 = v67.AnimalModel;
            local l_Position_1 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
            task.spawn(function() --[[ Line: 294 ]]
                -- upvalues: v9 (ref), l_ReplicatedStorage_0 (ref), l_Position_1 (copy)
                v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Chicleteira Bicicleteira"].Hit, l_Position_1);
            end);
            v71 = script.Burst:Clone();
            v71:PivotTo(CFrame.new(l_Position_1));
            v71.Anchored = false;
            l_AnimalModel_1 = Instance.new("WeldConstraint");
            l_AnimalModel_1.Part0 = v71;
            l_AnimalModel_1.Part1 = v67.AnimalModel.PrimaryPart;
            l_AnimalModel_1.Parent = v71;
            v71.Parent = workspace;
            v21.emit(v71);
            task.delay(5, function() --[[ Line: 311 ]]
                -- upvalues: v71 (copy)
                v71:Destroy();
            end);
            return;
        end;
    end);
    v24.OnClientEvent:Connect(function(v74, v75, v76, v77) --[[ Line: 316 ]]
        -- upvalues: v26 (ref), l_ReplicatedStorage_0 (ref), l_RunService_0 (ref)
        local v78 = script["Chicleteira Bicicleteira"]:Clone();
        v78:PivotTo(v77 or v74);
        v78.Parent = workspace;
        local v79 = v78.AnimationController.Animator:LoadAnimation(script.Walk);
        v79.Looped = true;
        v79:Play();
        v79:AdjustSpeed(2);
        local v80 = v26:Clone(l_ReplicatedStorage_0.Sounds.Events["Chicleteira Bicicleteira"].Bike);
        v80.Parent = v78.PrimaryPart;
        v80:Play();
        local v81 = math.abs(v75.Z - v74.Z) / v76;
        local v82 = 0;
        local v83 = nil;
        v83 = l_RunService_0.PostSimulation:Connect(function(v84) --[[ Line: 335 ]]
            -- upvalues: v82 (ref), v81 (copy), v83 (ref), v78 (copy), v77 (copy), v74 (copy), v75 (copy)
            v82 = v82 + v84;
            local v85 = math.clamp(v82 / v81, 0, 1);
            if v85 >= 1 and v83 then
                v83:Disconnect();
                v83 = nil;
                v78:Destroy();
            end;
            if v77 ~= nil then
                local v86 = v74:Lerp(v75, v85);
                local v87 = v77:Lerp(v75, v85);
                local v88 = math.clamp(v85 / 0.05, 0, 1);
                local v89 = 5 + (v87.Y - v86.Y);
                local v90 = math.lerp(v87.Y, v86.Y, v88) + math.sin(3.141592653589793 * v88) * v89;
                v78:PivotTo(CFrame.new(v86.X, v90, v87.Z) * v86.Rotation);
                return;
            else
                v78:PivotTo(v74:Lerp(v75, v85), v85);
                return;
            end;
        end);
    end);
end;
return v6;