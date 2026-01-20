local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v11 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v12 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v13 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v15 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v17 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v18 = require(l_ReplicatedStorage_0.Packages.Signal);
local v19 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v20 = require(l_ReplicatedStorage_0.Packages.Trove);
local v21 = require(l_ReplicatedStorage_0.Packages.Net);
local v22 = require(l_ReplicatedStorage_0.Shared.VFX);
local v23 = v21:RemoteEvent("EventService/Crab Rave/Hit");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CrabRave_0 = workspace.Sounds.CrabRave;
local l_Name_0 = script.Name;
local v27 = v20.new();
v7.OnStart = function(_) --[[ Line: 41 ]] --[[ Name: OnStart ]]
    -- upvalues: v13 (copy), l_Name_0 (copy), v27 (copy), l_ReplicatedStorage_0 (copy), v12 (copy), v11 (copy), l_CrabRave_0 (copy), l_TweenService_0 (copy), v22 (copy), v10 (copy), v15 (copy), v20 (copy), v19 (copy), v17 (copy), l_RunService_0 (copy), v8 (copy), v18 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy)
    local l_v13_ActiveEventData_0 = v13:GetActiveEventData(l_Name_0);
    assert(l_v13_ActiveEventData_0);
    local v30 = true;
    v27:Add(function() --[[ Line: 46 ]]
        -- upvalues: v30 (ref)
        v30 = false;
    end);
    l_ReplicatedStorage_0:SetAttribute("CrabRave", true);
    v27:Add(function() --[[ Line: 51 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v12 (ref), v11 (ref)
        l_ReplicatedStorage_0:SetAttribute("CrabRave", nil);
        v12:Update();
        v11:UpdateOST();
    end);
    v27:Add(task.spawn(function() --[[ Line: 58 ]]
        -- upvalues: l_CrabRave_0 (ref), l_v13_ActiveEventData_0 (copy)
        while not l_CrabRave_0.IsLoaded do
            task.wait();
        end;
        l_CrabRave_0.TimePosition = math.max(l_CrabRave_0.TimePosition, workspace:GetServerTimeNow() - l_v13_ActiveEventData_0.startedAt);
    end));
    v12:Update();
    v11:UpdateOST();
    local v31 = v27:Add(Instance.new("ColorCorrectionEffect"));
    v31.Parent = workspace.CurrentCamera;
    local v32 = v27:Clone(script.Ocean);
    v32.Parent = workspace;
    local v33 = v27:Add(Instance.new("Highlight"));
    assert(v33);
    v33.DepthMode = Enum.HighlightDepthMode.Occluded;
    v33.FillColor = Color3.new(1, 1, 1);
    v33.FillTransparency = 1;
    v33.OutlineTransparency = 1;
    local function _(v34, v35) --[[ Line: 82 ]] --[[ Name: getTimeLeftForSync ]]
        -- upvalues: l_v13_ActiveEventData_0 (copy)
        return l_v13_ActiveEventData_0.startedAt + v34 - (v35 or workspace:GetServerTimeNow());
    end;
    for _, v38 in v32:GetChildren() do
        if v38:IsA("Beam") then
            local l_TextureLength_0 = v38.TextureLength;
            v38.TextureLength = 0;
            l_TweenService_0:Create(v32.ocean, TweenInfo.new(l_v13_ActiveEventData_0.startedAt + 45 - workspace:GetServerTimeNow(), Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                TextureLength = l_TextureLength_0
            }):Play();
        end;
    end;
    l_TweenService_0:Create(v32.att1, TweenInfo.new(l_v13_ActiveEventData_0.startedAt + 45 - workspace:GetServerTimeNow(), Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Position = Vector3.new(0, 0, 400, 0)
    }):Play();
    l_TweenService_0:Create(v31, TweenInfo.new(l_v13_ActiveEventData_0.startedAt + 1.95 - workspace:GetServerTimeNow()), {
        Brightness = -1.2
    }):Play();
    v27:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 45 - workspace:GetServerTimeNow(), function() --[[ Line: 107 ]]
        -- upvalues: v22 (ref), v32 (copy)
        v22.enable(v32.oceanparticles);
    end));
    v10:Run("CrabRaveEvent", "GrassRecolor");
    v27:Add(function() --[[ Line: 112 ]]
        -- upvalues: v10 (ref)
        v10:Stop("CrabRaveEvent", "GrassRecolor");
    end);
    v27:Add(function() --[[ Line: 116 ]]
        -- upvalues: v10 (ref)
        v10:Activate("Blink");
    end);
    v27:Add(v15.observeTag("CrabRaveCrabFolder", function(v40) --[[ Line: 120 ]]
        -- upvalues: v33 (ref)
        if v33 then
            v33.Parent = v40;
        end;
        return nil;
    end));
    v27:Add(v15.observeTag("CrabRaveCrabs", function(v41) --[[ Line: 127 ]]
        -- upvalues: v20 (ref), l_v13_ActiveEventData_0 (copy), v19 (ref), v17 (ref), l_RunService_0 (ref)
        local v42 = v20.new();
        local l_Name_1 = v41.Parent.Name;
        local v44 = v42:Clone(script.Crab);
        local v45 = nil;
        local v46 = nil;
        local function _(v47) --[[ Line: 137 ]] --[[ Name: loadAnimation ]]
            -- upvalues: v44 (copy), v42 (copy)
            local v48 = v44.AnimationController:LoadAnimation(v47);
            v42:Add(function() --[[ Line: 139 ]]
                -- upvalues: v48 (copy)
                v48:Stop(0);
                v48:Destroy();
            end);
            return v48;
        end;
        v44["Cylinder.005"].Transparency = 1;
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 2 - workspace:GetServerTimeNow(), function() --[[ Line: 148 ]]
            -- upvalues: v44 (copy)
            v44["Cylinder.005"].Transparency = 0;
        end));
        local v50 = v42:Add(Instance.new("Weld"));
        v50.Part0 = v44["Cylinder.005"];
        v50.Part1 = v41.HumanoidRootPart;
        v50.C1 = CFrame.new(0, 3.6, 0);
        v50.Parent = v44;
        if v19:GetInstant("Optimisation.HumanoidBrainrotModels", v17.IsNewPlayersServer()) then
            local l_AnimationController_0 = v41:FindFirstChild("AnimationController");
            if l_AnimationController_0 then
                l_AnimationController_0:Destroy();
            end;
            local v52 = Instance.new("Humanoid", v41);
            local _ = Instance.new("Animator", v52);
            v52.Name = "AnimationController";
            v52.EvaluateStateMachine = false;
            v52.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
            v52.PlatformStand = true;
            v52.Parent = v41;
        end;
        local v54 = 0;
        local v55 = 0;
        local v56 = CFrame.new(0, 3.6, 0);
        v42:Add(l_RunService_0.PostSimulation:Connect(function(v57) --[[ Line: 178 ]]
            -- upvalues: v55 (ref), v54 (ref), v50 (copy), v56 (copy)
            debug.profilebegin("Crab Rave:Crab:Rotate");
            if math.abs(v55 - v54) < 0.1 then
                return;
            else
                v54 = v55 + (v54 - v55) * math.exp(v57 * -1);
                v50.C1 = v56 * CFrame.Angles(0, v54, 0);
                debug.profileend();
                return;
            end;
        end));
        v44.Parent = v41;
        local l_Animation1_0 = script.Animation1;
        local v59 = v44.AnimationController:LoadAnimation(l_Animation1_0);
        local l_v59_0 = v59 --[[ copy: 13 -> 26 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v59_0 (copy)
            l_v59_0:Stop(0);
            l_v59_0:Destroy();
        end);
        local l_v59_1 = v59;
        v59 = script.Animation2;
        local v62 = v44.AnimationController:LoadAnimation(v59);
        local l_v62_0 = v62 --[[ copy: 14 -> 27 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v62_0 (copy)
            l_v62_0:Stop(0);
            l_v62_0:Destroy();
        end);
        l_Animation1_0 = v62;
        v62 = script.Animation3_Right;
        local v64 = v44.AnimationController:LoadAnimation(v62);
        local l_v64_0 = v64 --[[ copy: 15 -> 28 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v64_0 (copy)
            l_v64_0:Stop(0);
            l_v64_0:Destroy();
        end);
        v59 = v64;
        v64 = script.Animation3_Left;
        local v66 = v44.AnimationController:LoadAnimation(v64);
        local l_v66_0 = v66 --[[ copy: 16 -> 29 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v66_0 (copy)
            l_v66_0:Stop(0);
            l_v66_0:Destroy();
        end);
        v62 = v66;
        v62.Priority = Enum.AnimationPriority.Action;
        v66 = script.Animation4_Walk;
        local v68 = v44.AnimationController:LoadAnimation(v66);
        local l_v68_0 = v68 --[[ copy: 17 -> 30 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v68_0 (copy)
            l_v68_0:Stop(0);
            l_v68_0:Destroy();
        end);
        v64 = v68;
        v64.Priority = Enum.AnimationPriority.Action;
        v68 = script.Animation4_Attack;
        local v70 = v44.AnimationController:LoadAnimation(v68);
        local l_v70_0 = v70 --[[ copy: 18 -> 31 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v70_0 (copy)
            l_v70_0:Stop(0);
            l_v70_0:Destroy();
        end);
        v66 = v70;
        v66.Priority = Enum.AnimationPriority.Action4;
        v68 = v64;
        v70 = function(v72, v73) --[[ Line: 203 ]] --[[ Name: switchWalkAnimationTrack ]]
            -- upvalues: v68 (ref)
            if v68 == v72 then
                return;
            else
                local l_IsPlaying_0 = v68.IsPlaying;
                if l_IsPlaying_0 then
                    v68:Stop();
                end;
                v68 = v72;
                if l_IsPlaying_0 and not v73 then
                    v68:Play();
                end;
                return;
            end;
        end;
        l_v59_1:Play();
        v42:Add(v41:GetAttributeChangedSignal("IsRunning"):Connect(function() --[[ Line: 222 ]]
            -- upvalues: v41 (copy), v68 (ref), v45 (ref), v46 (ref)
            if v41:GetAttribute("IsRunning") then
                if not v68.IsPlaying then
                    v68:Play();
                end;
                if v45 then
                    v45.ParticleEmitter.Enabled = true;
                end;
                if v46 then
                    v46.ParticleEmitter.Enabled = true;
                    return;
                end;
            else
                if v68.IsPlaying then
                    v68:Stop();
                end;
                if v45 then
                    v45.ParticleEmitter.Enabled = false;
                end;
                if v46 then
                    v46.ParticleEmitter.Enabled = false;
                end;
            end;
        end));
        v42:Add(v41:GetAttributeChangedSignal("Attack"):Connect(function() --[[ Line: 251 ]]
            -- upvalues: v66 (copy)
            v66:Play();
        end));
        local l_Animation5_0 = script.Animation5;
        local v76 = v44.AnimationController:LoadAnimation(l_Animation5_0);
        local l_v76_0 = v76 --[[ copy: 21 -> 32 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v76_0 (copy)
            l_v76_0:Stop(0);
            l_v76_0:Destroy();
        end);
        local l_v76_1 = v76;
        l_v76_1.Priority = Enum.AnimationPriority.Action2;
        v76 = script.Animation6;
        local v79 = v44.AnimationController:LoadAnimation(v76);
        local l_v79_0 = v79 --[[ copy: 22 -> 33 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v79_0 (copy)
            l_v79_0:Stop(0);
            l_v79_0:Destroy();
        end);
        l_Animation5_0 = v79;
        l_Animation5_0.Priority = Enum.AnimationPriority.Action2;
        v79 = script.Animation7;
        local v81 = v44.AnimationController:LoadAnimation(v79);
        local l_v81_0 = v81 --[[ copy: 23 -> 34 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v81_0 (copy)
            l_v81_0:Stop(0);
            l_v81_0:Destroy();
        end);
        v76 = v81;
        v76.Priority = Enum.AnimationPriority.Action2;
        v81 = script.Animation8;
        local v83 = v44.AnimationController:LoadAnimation(v81);
        local l_v83_0 = v83 --[[ copy: 24 -> 35 ]];
        v42:Add(function() --[[ Line: 139 ]]
            -- upvalues: l_v83_0 (copy)
            l_v83_0:Stop(0);
            l_v83_0:Destroy();
        end);
        v79 = v83;
        v79.Priority = Enum.AnimationPriority.Action2;
        v81 = {
            [1] = l_v76_1, 
            [2] = l_Animation5_0, 
            [3] = v76, 
            [4] = v79
        };
        v83 = nil;
        v42:Add(v41:GetAttributeChangedSignal("Dance"):Connect(function() --[[ Line: 272 ]]
            -- upvalues: l_v13_ActiveEventData_0 (ref), v41 (copy), v81 (copy), v83 (ref)
            local v85 = nil;
            local v86 = l_v13_ActiveEventData_0.startedAt + 85 - workspace:GetServerTimeNow();
            local v87 = l_v13_ActiveEventData_0.startedAt + 105 - workspace:GetServerTimeNow();
            v85 = v86 <= 0 and v87 > 0 and 4 or v41:GetAttribute("Dance");
            if v85 and v81[v85] and v83 == v81[v85] then
                return;
            else
                if v83 then
                    v83:Stop();
                    v83 = nil;
                end;
                if v85 ~= nil then
                    v83 = v81[v85];
                    assert(v83);
                    v83:Play();
                end;
                return;
            end;
        end));
        local v88 = nil;
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 7 - workspace:GetServerTimeNow(), function() --[[ Line: 300 ]]
            -- upvalues: l_v59_1 (copy), l_Animation1_0 (copy)
            l_v59_1:Stop();
            l_Animation1_0:Play();
        end));
        if l_Name_1 == "Ground" then
            v42:Add(v41:GetAttributeChangedSignal("ReachedFirstTarget"):Once(function() --[[ Line: 306 ]]
                -- upvalues: v88 (ref), v42 (copy), v44 (copy)
                v88 = v42:Clone(script.SanddrumRoll);
                local v89 = v42:Add(Instance.new("Weld"));
                v89.Part0 = v88;
                v89.Part1 = v44["Cylinder.005"];
                v89.C0 = CFrame.new(0.2, 3.629, 4.378);
                v89.Parent = v88;
                v88.Parent = v44;
            end));
        end;
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 27.5 - workspace:GetServerTimeNow(), function() --[[ Line: 320 ]]
            -- upvalues: l_Name_1 (copy), v41 (copy), v88 (ref), v42 (copy), v62 (copy), v68 (ref), v55 (ref)
            if l_Name_1 == "Ground" then
                local _ = v41:GetPivot();
                if v88 then
                    local l_v88_0 = v88;
                    l_v88_0.ParticleEmitter.Enabled = false;
                    local l_l_v88_0_0 = l_v88_0 --[[ copy: 1 -> 2 ]];
                    task.delay(3, function() --[[ Line: 327 ]]
                        -- upvalues: v42 (ref), l_l_v88_0_0 (copy)
                        v42:Remove(l_l_v88_0_0);
                    end);
                    v88 = nil;
                end;
                local l_v62_1 = v62;
                if v68 ~= l_v62_1 then
                    if v68.IsPlaying then
                        v68:Stop();
                    end;
                    v68 = l_v62_1;
                end;
                v62:Play(nil, nil, 0.3333333333333333);
                v55 = 1.5707963267948966;
            end;
        end));
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 31 - workspace:GetServerTimeNow(), function() --[[ Line: 340 ]]
            -- upvalues: l_Name_1 (copy), v62 (copy), v45 (ref), v42 (copy), v44 (copy), v46 (ref), l_Animation1_0 (copy), l_v59_1 (copy)
            if l_Name_1 == "Ground" then
                v62:AdjustSpeed(1);
                v45 = v42:Clone(script.WalkPart);
                assert(v45);
                local v94 = v42:Add(Instance.new("Weld"));
                v94.Part0 = v45;
                v94.Part1 = v44["Cylinder.005"];
                v94.C0 = CFrame.new(0.614, 3.129, 4.731) * CFrame.fromOrientation(0, -1.5707963267948966, 0);
                v94.Parent = v45;
                v45.Parent = v44;
                v46 = v42:Clone(script.WalkPart);
                assert(v46);
                local v95 = v42:Add(Instance.new("Weld"));
                v95.Part0 = v46;
                v95.Part1 = v44["Cylinder.005"];
                v95.C0 = CFrame.new(0.414, 3.129, -4.78) * CFrame.fromOrientation(0, -1.5707963267948966, 0);
                v95.Parent = v46;
                v46.Parent = v44;
                return;
            else
                if l_Name_1 == "Wall" then
                    l_Animation1_0:Stop();
                    l_v59_1:Play();
                end;
                return;
            end;
        end));
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 43 - workspace:GetServerTimeNow(), function() --[[ Line: 373 ]]
            -- upvalues: v59 (copy), v55 (ref)
            v59:Play(nil, nil, 0.3333333333333333);
            v55 = 0;
        end));
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 46 - workspace:GetServerTimeNow(), function() --[[ Line: 378 ]]
            -- upvalues: v59 (copy), v64 (copy), v68 (ref), l_Name_1 (copy), l_Animation1_0 (copy), l_v59_1 (copy)
            v59:Stop();
            local l_v64_1 = v64;
            if v68 ~= l_v64_1 then
                local l_IsPlaying_1 = v68.IsPlaying;
                if l_IsPlaying_1 then
                    v68:Stop();
                end;
                v68 = l_v64_1;
                if l_IsPlaying_1 then
                    v68:Play();
                end;
            end;
            if l_Name_1 == "Wall" then
                l_Animation1_0:Stop();
                l_v59_1:Play();
            end;
        end));
        v42:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 141 - workspace:GetServerTimeNow(), function() --[[ Line: 388 ]]
            -- upvalues: l_v13_ActiveEventData_0 (ref), v42 (copy), l_RunService_0 (ref), l_v76_1 (copy), l_Animation5_0 (copy), v76 (copy), v79 (copy)
            local v98 = l_v13_ActiveEventData_0.startedAt + 161 - workspace:GetServerTimeNow();
            local v99 = 0;
            v42:Add(l_RunService_0.PreSimulation:Connect(function(v100) --[[ Line: 392 ]]
                -- upvalues: v99 (ref), v98 (copy), l_v76_1 (ref), l_Animation5_0 (ref), v76 (ref), v79 (ref)
                debug.profilebegin("Crab Rave:Crab:Adjust Dance Speed");
                v99 = v99 + v100;
                local v101 = v99 / v98;
                l_v76_1:AdjustSpeed((math.lerp(1, 0.1, v101)));
                l_Animation5_0:AdjustSpeed((math.lerp(1, 0.1, v101)));
                v76:AdjustSpeed((math.lerp(1, 0.1, v101)));
                v79:AdjustSpeed((math.lerp(1, 0.1, v101)));
                debug.profileend();
            end));
        end));
        return function() --[[ Line: 405 ]]
            -- upvalues: v42 (copy)
            v42:Destroy();
        end;
    end));
    local _ = workspace.CurrentCamera;
    local v103 = 0;
    local v104 = 0;
    v27:Add(l_RunService_0.PostSimulation:Connect(function(v105) --[[ Line: 416 ]]
        -- upvalues: v104 (ref), v103 (ref), l_CrabRave_0 (ref), v33 (ref), l_TweenService_0 (ref), v8 (ref)
        debug.profilebegin("Crab Rave:Update");
        v104 = v104 - v105;
        v103 = v103 - v105;
        local v106 = math.clamp((l_CrabRave_0.PlaybackLoudness - 100) / 900, 0, 1);
        if v103 <= 0 and v33 then
            v103 = 0.5;
            v33.FillTransparency = 0;
            l_TweenService_0:Create(v33, TweenInfo.new(0.3), {
                FillTransparency = 1
            }):Play();
        end;
        if v106 >= 0.25 and v104 <= 0 then
            v104 = 0.1;
            v8:Fov((v106 - 0.25) * 20 + 70, 0.1);
        end;
        debug.profileend();
    end));
    v27:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 7 - workspace:GetServerTimeNow(), function() --[[ Line: 440 ]]
        -- upvalues: v33 (ref), l_TweenService_0 (ref), v31 (copy)
        if v33 then
            v33:Destroy();
            v33 = nil;
        end;
        local v107 = l_TweenService_0:Create(v31, TweenInfo.new(1), {
            Brightness = 0
        });
        v107:Play();
        v107.Completed:Once(function() --[[ Line: 451 ]]
            -- upvalues: v107 (copy)
            v107:Cancel();
            v107:Destroy();
        end);
    end));
    v27:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 46 - workspace:GetServerTimeNow(), function() --[[ Line: 457 ]]
        -- upvalues: v27 (ref), v18 (ref), v15 (ref), l_Players_0 (ref), v20 (ref), l_RunService_0 (ref), l_v13_ActiveEventData_0 (copy), l_LocalPlayer_0 (ref)
        local _ = v27:Add(v18.new());
        local v120 = v27:Add(v15.observeCharacter(l_Players_0.LocalPlayer, function(_, v110) --[[ Line: 461 ]]
            -- upvalues: v20 (ref), l_RunService_0 (ref), l_v13_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
            local v111 = v20.new();
            v111:Add(task.spawn(function() --[[ Line: 464 ]]
                -- upvalues: v110 (copy), v111 (copy), l_RunService_0 (ref), l_v13_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                local l_Humanoid_0 = v110:WaitForChild("Humanoid");
                if not l_Humanoid_0 then
                    return;
                else
                    local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
                    if not l_Animator_0 then
                        return;
                    else
                        local v114 = l_Animator_0:LoadAnimation(script.Dance);
                        v114.Priority = Enum.AnimationPriority.Action;
                        v114:Play(2);
                        local v115 = 0;
                        local v116 = 0;
                        v111:Add(l_RunService_0.PostSimulation:Connect(function(v117) --[[ Line: 481 ]]
                            -- upvalues: l_v13_ActiveEventData_0 (ref), v114 (copy), v116 (ref), l_Humanoid_0 (copy), l_LocalPlayer_0 (ref), v115 (ref)
                            debug.profilebegin("Crab Rave:Player:Dance");
                            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                            if l_v13_ActiveEventData_0.startedAt + 66 - (l_workspace_ServerTimeNow_0 or workspace:GetServerTimeNow()) > 0 then
                                if not v114.IsPlaying then
                                    v114:Play();
                                    v114.TimePosition = (l_workspace_ServerTimeNow_0 - l_v13_ActiveEventData_0.startedAt) % v114.Length;
                                end;
                                debug.profileend();
                                return;
                            else
                                local l_Length_0 = v114.Length;
                                if v116 ~= l_Length_0 and l_Length_0 > 0 then
                                    v116 = l_Length_0;
                                    v114.TimePosition = (l_workspace_ServerTimeNow_0 - l_v13_ActiveEventData_0.startedAt) % l_Length_0;
                                end;
                                if not (l_Humanoid_0.MoveDirection ~= Vector3.new(0, 0, 0, 0)) and not l_LocalPlayer_0:GetAttribute("Stealing") then
                                    if v115 < 3 then
                                        v115 = v115 + v117;
                                    elseif not v114.IsPlaying then
                                        v114:Play();
                                        v114.TimePosition = (l_workspace_ServerTimeNow_0 - l_v13_ActiveEventData_0.startedAt) % v114.Length;
                                    end;
                                else
                                    v115 = 0;
                                    if v114.IsPlaying then
                                        v114:Stop();
                                    end;
                                end;
                                debug.profileend();
                                return;
                            end;
                        end));
                        v111:Add(function() --[[ Line: 519 ]]
                            -- upvalues: v114 (copy)
                            v114:Stop();
                            v114:Destroy();
                        end);
                        return;
                    end;
                end;
            end));
            return v111:WrapClean();
        end));
        v27:Add(task.delay(l_v13_ActiveEventData_0.startedAt + 140 - workspace:GetServerTimeNow(), v120));
    end));
end;
v7.OnStop = function(_) --[[ Line: 532 ]] --[[ Name: OnStop ]]
    -- upvalues: v27 (copy)
    v27:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 536 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v23 (copy), v9 (copy), v22 (copy)
    task.spawn(pcall, function() --[[ Line: 537 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v23.OnClientEvent:Connect(function(v123) --[[ Line: 541 ]]
        -- upvalues: v9 (ref), v22 (ref)
        local v124 = nil;
        local v125 = nil;
        if type(v123) == "string" then
            local v126 = v9:GetAnimals()[v123];
            if not v126 then
                return;
            else
                local l_v126_0 = v126 --[[ copy: 3 -> 7 ]];
                local _ = function() --[[ Line: 550 ]] --[[ Name: getTargetPosition ]]
                    -- upvalues: l_v126_0 (copy)
                    local _ = nil;
                    local l_AnimalModel_0 = l_v126_0.AnimalModel;
                    return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, l_v126_0.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                end;
                local _ = nil;
                local l_AnimalModel_1 = v126.AnimalModel;
                v124 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position + Vector3.new(0, v126.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                v125 = v126.AnimalModel.PrimaryPart;
            end;
        else
            v124 = v123:GetPivot().Position;
            v125 = v123;
        end;
        local v133 = script.CrabHit:Clone();
        v133:PivotTo(CFrame.new(v124));
        v133.Anchored = false;
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v133;
        l_WeldConstraint_0.Part1 = v125;
        l_WeldConstraint_0.Parent = v133;
        v133.Parent = workspace;
        v22.emit(v133);
        task.delay(3, function() --[[ Line: 584 ]]
            -- upvalues: v133 (copy)
            v133:Destroy();
        end);
    end);
end;
return v7;