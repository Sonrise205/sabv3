local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v12 = require(l_ReplicatedStorage_0.Packages.FFlags);
local _ = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v16 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v17 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v18 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v20 = require(l_ReplicatedStorage_0.Packages.Net);
local v21 = require(l_ReplicatedStorage_0.Shared.VFX);
local v22 = script["Svinina Bombardino"];
local v23 = script["Bombardiro Crocodilo"];
local v24 = v20:RemoteEvent("EventService/Bombardiro Crocodilo/SpawnBomb");
local v25 = v20:RemoteEvent("EventService/Bombardiro Crocodilo/Explode");
local l_Name_0 = script.Name;
local v27 = v18.new();
local _ = workspace.CurrentCamera;
local v29 = {};
v6.OnStart = function(_) --[[ Line: 42 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v27 (copy), v21 (copy), v9 (copy), v8 (copy), v11 (copy), l_RunService_0 (copy), v14 (copy), v23 (copy), v12 (copy), v16 (copy), v29 (copy)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    local _ = workspace:GetServerTimeNow();
    l_ReplicatedStorage_0:SetAttribute("BombardiroCrocodiloEvent", true);
    v27:Add(function() --[[ Line: 49 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("BombardiroCrocodiloEvent", nil);
    end);
    v27:Add(task.delay(l_v10_ActiveEventData_0.startedAt + 8 - workspace:GetServerTimeNow(), function() --[[ Line: 53 ]]
        -- upvalues: v27 (ref), v21 (ref), l_ReplicatedStorage_0 (ref), v9 (ref), v8 (ref)
        local v33 = v27:Clone(script.Planesbg);
        v21.enable(v33);
        v33.Parent = workspace;
        l_ReplicatedStorage_0:SetAttribute("BombardiroCrocodiloEventSoundTrack", true);
        v9:UpdateOST();
        v27:Add(function() --[[ Line: 60 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v9 (ref), v8 (ref)
            l_ReplicatedStorage_0:SetAttribute("BombardiroCrocodiloEventSoundTrack", nil);
            v9:UpdateOST();
            v8:Activate("Blink");
        end);
    end));
    v9:UpdateOST();
    v11:Update();
    local v34 = v27:Extend();
    local v35 = table.create(3);
    v34:Add(function() --[[ Line: 82 ]]
        -- upvalues: v35 (copy)
        table.clear(v35);
    end);
    local v36 = 0;
    v34:Add(l_RunService_0.PreRender:Connect(function(v37) --[[ Line: 87 ]]
        -- upvalues: v36 (ref), v35 (copy)
        debug.profilebegin("Bombardiro Event");
        v36 = v36 + v37;
        for v38, v39 in v35 do
            if v39.target and v39.targetAttachment then
                v39.beam.First.Enabled = true;
                v39.beam.Second.Enabled = true;
                local v40 = math.clamp(v36 - v38 + 1, 0, 1);
                local l_WorldPosition_0 = v39.beam.WorldPosition;
                v39.targetAttachment.Position = l_WorldPosition_0 + (v39.target:GetPivot().Position - l_WorldPosition_0) * v40;
            end;
        end;
        debug.profileend();
    end));
    v34:Add(v14.observeTag("BombardiroCrocodiloPlayerVFX", function(v42) --[[ Line: 109 ]]
        -- upvalues: v35 (copy), v14 (ref)
        local v43 = script.PlayerVFX.Beam:Clone();
        v43.Parent = v42;
        local v44 = script.PlayerVFX.Torso:Clone();
        v44.Parent = v42;
        local l_v42_Attribute_0 = v42:GetAttribute("BombardiroIndex");
        v35[l_v42_Attribute_0] = {
            beam = v43, 
            target = nil
        };
        local v49 = v14.observeTag("BombardiroCrocodiloPlayerVFX", function(v46) --[[ Line: 122 ]]
            -- upvalues: v42 (copy), v43 (copy), v35 (ref)
            if v46 == v42 then
                return nil;
            elseif v46:GetAttribute("BombardiroIndex") ~= v42:GetAttribute("BombardiroIndex") % 3 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v43.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v48 = v35[v42:GetAttribute("BombardiroIndex")];
                v48.target = v46;
                v48.beam.First.Attachment0 = l_Attachment_0;
                v48.beam.Second.Attachment0 = l_Attachment_0;
                v48.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 141 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 146 ]]
            -- upvalues: v44 (copy), v43 (copy), v49 (copy), v35 (ref), l_v42_Attribute_0 (copy)
            v44:Destroy();
            v43:Destroy();
            v49();
            v35[l_v42_Attribute_0] = nil;
        end;
    end));
    local v50 = {};
    v27:Add(v14.observeTag("BombardiroPlane", function(v51) --[[ Line: 156 ]]
        -- upvalues: v23 (ref), v12 (ref), v16 (ref), v29 (ref), v50 (copy)
        local v52 = v23:Clone();
        v52.PrimaryPart.Anchored = true;
        for _, v54 in v52["Svinina Bombardino"]:GetChildren() do
            if v54.Name ~= "RootPart" then
                v54.Transparency = 1;
            end;
        end;
        if v12:GetInstant("Optimisation.HumanoidBrainrotModels", v16.IsNewPlayersServer()) then
            local l_AnimationController_0 = v52:FindFirstChild("AnimationController");
            if l_AnimationController_0 then
                l_AnimationController_0:Destroy();
            end;
            local v56 = Instance.new("Humanoid", v52);
            local _ = Instance.new("Animator", v56);
            v56.Name = "AnimationController";
            v56.EvaluateStateMachine = false;
            v56.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
            v56.PlatformStand = true;
            v56.Parent = v52;
        end;
        v52.Parent = v51;
        local v60 = task.delay(5, function() --[[ Line: 187 ]]
            -- upvalues: v52 (copy)
            for _, v59 in v52["Svinina Bombardino"]:GetChildren() do
                if v59.Name ~= "RootPart" then
                    v59.Transparency = 0;
                end;
            end;
        end);
        v29[v51.Name] = v52;
        table.insert(v50, v51);
        return function() --[[ Line: 200 ]]
            -- upvalues: v50 (ref), v51 (copy), v52 (copy), v29 (ref), v60 (copy)
            local v61 = table.find(v50, v51);
            if v61 then
                table.remove(v50, v61);
            end;
            v52:Destroy();
            v29[v51.Name] = nil;
            if coroutine.status(v60) == "suspended" then
                pcall(task.cancel, v60);
            end;
        end;
    end));
    v27:Add(l_RunService_0.PreRender:Connect(function(_) --[[ Line: 215 ]]
        -- upvalues: v50 (copy), v29 (ref)
        debug.profilebegin("Bombardiro Crocodilo:BulkMoveTo");
        local v63 = {};
        local v64 = {};
        for _, v66 in v50 do
            local v67 = v29[v66.Name];
            if v67 then
                table.insert(v63, v67.PrimaryPart);
                table.insert(v64, v66.CFrame);
            end;
        end;
        workspace:BulkMoveTo(v63, v64, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
    end));
end;
v6.OnStop = function(_) --[[ Line: 232 ]] --[[ Name: OnStop ]]
    -- upvalues: v27 (copy)
    v27:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 236 ]] --[[ Name: OnLoad ]]
    -- upvalues: v21 (copy), v24 (copy), v29 (copy), v22 (copy), l_ReplicatedStorage_0 (copy), v17 (copy), l_RunService_0 (copy), v25 (copy)
    local function v73(v70, v71) --[[ Line: 237 ]] --[[ Name: playExplosion ]]
        -- upvalues: v21 (ref)
        local v72 = script[v71 or "Explosion"]:Clone();
        v72.CFrame = v70;
        v72.Parent = workspace;
        v21.emit(v72);
        task.delay(5, function() --[[ Line: 244 ]]
            -- upvalues: v72 (copy)
            v72:Destroy();
        end);
    end;
    v24.OnClientEvent:Connect(function(v74, v75, v76) --[[ Line: 249 ]]
        -- upvalues: v29 (ref), v22 (ref), l_ReplicatedStorage_0 (ref), v17 (ref), l_RunService_0 (ref)
        local v77 = v29[v74];
        if v77 and v77:FindFirstChild("Svinina Bombardino") then
            for _, v79 in v77["Svinina Bombardino"]:GetChildren() do
                if v79.Name ~= "RootPart" then
                    v79.Transparency = 1;
                    task.delay(1, function() --[[ Line: 258 ]]
                        -- upvalues: v79 (copy)
                        v79.Transparency = 0;
                    end);
                end;
            end;
        end;
        local v80 = v22:Clone();
        v80.PrimaryPart.Anchored = true;
        v80:PivotTo(CFrame.new(v75));
        local v81 = l_ReplicatedStorage_0.Sounds.Events["Bombardiro Crocodilo"].DroppingBomb:Clone();
        v81.Parent = v80;
        v80.Parent = workspace;
        v81:Play();
        local v82 = 0;
        local v83 = v17.calculateTimeToGround(v75.y, v76.y);
        local v84 = nil;
        v84 = l_RunService_0.PostSimulation:Connect(function(v85) --[[ Line: 279 ]]
            -- upvalues: v82 (ref), v83 (copy), v80 (copy), v75 (copy), v17 (ref), v84 (ref)
            debug.profilebegin("Bombardiro Crocodilo:Bomb");
            v82 = v82 + v85;
            local v86 = v82 / v83;
            v80:PivotTo(CFrame.new(v75 - vector.create(0, v17.simulateGravity(v82), 0)) * CFrame.Angles(-v82 * 3.141592653589793 * 2, 0, 0));
            debug.profileend();
            if v86 >= 1 then
                v84:Disconnect();
                for _, v88 in v80:GetDescendants() do
                    if v88:IsA("BasePart") then
                        v88.Transparency = 1;
                    elseif v88:IsA("ParticleEmitter") then
                        v88:Destroy();
                    end;
                end;
                task.wait(3);
                v80:Destroy();
            end;
        end);
    end);
    v25.OnClientEvent:Connect(function(v89, v90) --[[ Line: 303 ]]
        -- upvalues: v73 (copy)
        v73(if typeof(v89) == "CFrame" then v89 else CFrame.new(v89), v90);
    end);
end;
return v6;