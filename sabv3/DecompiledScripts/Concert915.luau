local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v12 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v13 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v14 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v15 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v17 = require(l_ReplicatedStorage_0.Packages.Observers);
local v18 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v19 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v21 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v23 = require(l_ReplicatedStorage_0.Packages.Net);
local v24 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local l_Concert_0 = workspace.Sounds.Concert;
local v29 = v23:RemoteEvent("EventService/Concert/Shoot");
local v30 = v21.new();
local v31 = nil;
v7.OnStart = function(_) --[[ Line: 45 ]] --[[ Name: OnStart ]]
    -- upvalues: v13 (copy), l_Name_0 (copy), v30 (copy), v10 (copy), v14 (copy), v12 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy), l_CurrentCamera_0 (copy), l_Concert_0 (copy), v8 (copy), v24 (copy), v17 (copy), v29 (copy), v9 (copy), l_RunService_0 (copy), v18 (copy), v15 (copy), v11 (copy), v19 (copy), l_Players_0 (copy), v21 (copy), l_LocalPlayer_0 (copy)
    local l_v13_ActiveEventData_0 = v13:GetActiveEventData(l_Name_0);
    assert(l_v13_ActiveEventData_0);
    local function _(v34) --[[ Line: 49 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v13_ActiveEventData_0 (copy)
        return (math.max(l_v13_ActiveEventData_0.startedAt + v34 - workspace:GetServerTimeNow(), 0));
    end;
    local function v44(v36, v37, v38) --[[ Line: 53 ]] --[[ Name: createEventScheduler ]]
        -- upvalues: l_v13_ActiveEventData_0 (copy)
        local function v40() --[[ Line: 54 ]]
            -- upvalues: v37 (copy), l_v13_ActiveEventData_0 (ref)
            local l_v37_0 = v37;
            return (math.max(l_v13_ActiveEventData_0.startedAt + l_v37_0 - workspace:GetServerTimeNow(), 0));
        end;
        local function v41() --[[ Line: 58 ]] --[[ Name: run ]]
            -- upvalues: v38 (copy), v40 (copy)
            v38(v40);
        end;
        local v42 = nil;
        local v43 = math.max(l_v13_ActiveEventData_0.startedAt + v36 - workspace:GetServerTimeNow(), 0);
        if v43 > 0 then
            v42 = task.delay(v43, v41);
        else
            v38(v40);
        end;
        return function() --[[ Line: 71 ]]
            -- upvalues: v42 (ref)
            if v42 and coroutine.status(v42) == "suspended" then
                pcall(task.cancel, v42);
            end;
        end;
    end;
    v30:Add(function() --[[ Line: 78 ]]
        -- upvalues: v10 (ref), v14 (ref), v12 (ref)
        v10:Activate("Blink");
        v14:Update();
        v12:UpdateOST();
    end);
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = l_ReplicatedStorage_0;
        v30:Add(function() --[[ Line: 87 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v30:Clone(script.Atmosphere).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = l_ReplicatedStorage_0;
        v30:Add(function() --[[ Line: 97 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    local v47 = nil;
    local v48 = v30:Clone(Instance.new("ColorCorrectionEffect"));
    v48.Parent = l_CurrentCamera_0;
    local function _(v49, v50) --[[ Line: 107 ]] --[[ Name: loadAnimation ]]
        -- upvalues: v30 (ref)
        local v51 = v49.AnimationController.Animator:LoadAnimation(v50);
        v30:Add(v51, "Stop");
        v30:Add(v51);
        return v51;
    end;
    local function v172() --[[ Line: 114 ]] --[[ Name: createStage ]]
        -- upvalues: l_Lighting_0 (ref), v30 (ref), l_Concert_0 (ref), v8 (ref), l_v13_ActiveEventData_0 (copy), v24 (ref), v17 (ref), v29 (ref), v9 (ref), v12 (ref), l_ReplicatedStorage_0 (ref), l_RunService_0 (ref), v18 (ref), v44 (copy), v47 (ref), v15 (ref), v11 (ref)
        l_Lighting_0.Ambient = Color3.new(0, 0, 0);
        l_Lighting_0.OutdoorAmbient = Color3.fromRGB(100, 100, 100);
        l_Lighting_0.EnvironmentDiffuseScale = 0;
        l_Lighting_0.EnvironmentSpecularScale = 0;
        v30:Add(function() --[[ Line: 119 ]]
            -- upvalues: l_Lighting_0 (ref)
            l_Lighting_0.Ambient = Color3.fromRGB(241, 241, 241);
            l_Lighting_0.OutdoorAmbient = Color3.fromRGB(212, 212, 212);
            l_Lighting_0.EnvironmentDiffuseScale = 1;
            l_Lighting_0.EnvironmentSpecularScale = 0.5;
        end);
        v30:Add(function() --[[ Line: 127 ]]
            -- upvalues: l_Concert_0 (ref)
            l_Concert_0:Stop();
        end);
        v30:Add(task.spawn(function() --[[ Line: 131 ]]
            -- upvalues: v8 (ref), l_Concert_0 (ref), l_v13_ActiveEventData_0 (ref)
            v8:WaitForAssetId("rbxassetid://126264638776020");
            l_Concert_0.SoundId = "";
            l_Concert_0.SoundId = "rbxassetid://126264638776020";
            while not l_Concert_0.IsLoaded do
                task.wait();
            end;
            l_Concert_0.TimePosition = math.max(l_Concert_0.TimePosition, workspace:GetServerTimeNow() - (l_v13_ActiveEventData_0.startedAt + 5));
            l_Concert_0:Play();
        end));
        local v53 = {
            Color3.fromRGB(255, 255, 255), 
            Color3.fromRGB(255, 0, 0), 
            Color3.fromRGB(255, 128, 0), 
            Color3.fromRGB(255, 255, 0), 
            Color3.fromRGB(128, 255, 0), 
            Color3.fromRGB(0, 255, 0), 
            Color3.fromRGB(0, 255, 128), 
            Color3.fromRGB(0, 255, 255), 
            Color3.fromRGB(0, 0, 255), 
            Color3.fromRGB(128, 0, 255), 
            Color3.fromRGB(255, 0, 255), 
            Color3.fromRGB(255, 0, 128), 
            Color3.fromRGB(255, 0, 255), 
            Color3.fromRGB(0, 128, 255)
        };
        v30:Clone(script.Night_Sky).Parent = l_Lighting_0;
        local v54 = v30:Clone(script.Stage);
        local v55 = v30:Clone(script.VFX);
        local l_SmokeStage_0 = v55.SmokeStage;
        v30:Add(l_SmokeStage_0);
        l_SmokeStage_0.Parent = workspace;
        v55.Parent = v54;
        v24.disable(v55);
        local v57 = false;
        local v58 = false;
        local v59 = {};
        local v60 = {};
        local v61 = {};
        local v62 = {};
        local l_Children_0 = v54.SpotLights:GetChildren();
        local _ = #l_Children_0;
        local v65 = {};
        local v66 = {};
        local v67 = {};
        local v68 = {};
        local v69 = {};
        for _, v71 in l_Children_0 do
            v66[v71] = v71:GetPivot();
            v67[v71] = 0;
            v68[v71] = 0;
            v69[v71] = 25;
            v71.Rotate.Neon["1"].LightBeam:Destroy();
            local v72 = script.lightbeambig.Beams:Clone();
            for _, v74 in v72:GetChildren() do
                v74.Attachment0 = v71.Rotate.Neon["1"];
                v74.Attachment1 = v71.Rotate.Neon["2"];
                v74.Parent = v71.Rotate.Neon;
                table.insert(v65, v74);
            end;
            v72:Destroy();
        end;
        v54.Parent = workspace;
        v30:Add(v17.observeTag("HideInConcert", function(v75) --[[ Line: 215 ]]
            local l_Parent_0 = v75.Parent;
            v75.Parent = script;
            return function() --[[ Line: 218 ]]
                -- upvalues: v75 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 219 ]]
                    -- upvalues: v75 (ref), l_Parent_0 (ref)
                    v75.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script
        }));
        local v77 = {
            [1] = v54.Rigs.Tralalero, 
            [2] = v54.Rigs.Chimpanzini, 
            [3] = v54.Rigs.Chimpanzini2
        };
        local v78 = {};
        for _, v80 in v77 do
            local v81 = {};
            local l_Throw_0 = v80.Throw;
            local v83 = v80.AnimationController.Animator:LoadAnimation(l_Throw_0);
            v30:Add(v83, "Stop");
            v30:Add(v83);
            v81.Throw = v83;
            l_Throw_0 = v80.Shuffle;
            v83 = v80.AnimationController.Animator:LoadAnimation(l_Throw_0);
            v30:Add(v83, "Stop");
            v30:Add(v83);
            v81.Shuffle = v83;
            v78[v80] = v81;
        end;
        local v84 = v30:Add(Instance.new("Color3Value"));
        v84.Value = Color3.fromRGB(0, 0, 0);
        for _, v86 in v78 do
            v86.Shuffle:Play();
        end;
        local v87 = true;
        v30:Add(function() --[[ Line: 255 ]]
            -- upvalues: v87 (ref)
            v87 = false;
        end);
        v30:Add(v29.OnClientEvent:Connect(function(v88, v89, v90) --[[ Line: 259 ]]
            -- upvalues: v9 (ref), v77 (copy), v78 (copy), v87 (ref), v12 (ref), l_ReplicatedStorage_0 (ref), l_RunService_0 (ref), v18 (ref), v24 (ref)
            local v91 = v9:GetAnimals()[v89];
            if not v91 then
                return;
            else
                local v92 = v77[v88] or v77[1];
                if not v92 then
                    return;
                else
                    local _ = function() --[[ Line: 270 ]] --[[ Name: getTargetPosition ]]
                        -- upvalues: v91 (copy)
                        local _ = nil;
                        local l_AnimalModel_0 = v91.AnimalModel;
                        return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
                    end;
                    v78[v92].Throw:Play();
                    task.wait(0.25);
                    if not v87 then
                        return;
                    else
                        local l_WorldPosition_0 = v92:FindFirstChild("SHOOT", true).WorldPosition;
                        task.spawn(function() --[[ Line: 292 ]]
                            -- upvalues: v12 (ref), l_ReplicatedStorage_0 (ref), l_WorldPosition_0 (copy)
                            v12:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Concert.Shoot, l_WorldPosition_0);
                        end);
                        local v97 = script.DiscoProjectile:Clone();
                        v97.Part.CFrame = CFrame.new(l_WorldPosition_0);
                        v97.Parent = workspace;
                        local v98 = nil;
                        v98 = l_RunService_0.PreRender:Connect(function() --[[ Line: 301 ]]
                            -- upvalues: v91 (copy), l_WorldPosition_0 (copy), v90 (copy), v18 (ref), v97 (copy), v98 (ref), v12 (ref), l_ReplicatedStorage_0 (ref), v24 (ref)
                            debug.profilebegin("Concert Disco Shoot");
                            local v99 = nil;
                            local l_AnimalModel_1 = v91.AnimalModel;
                            local l_Position_0 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
                            v99 = l_WorldPosition_0 + (l_Position_0 - l_WorldPosition_0) * 0.5 + Vector3.new(0, 90, 0, 0);
                            l_AnimalModel_1 = 1 - (v90 + 3 - workspace:GetServerTimeNow()) / 3;
                            local v102 = v18.quadBezier(math.clamp(l_AnimalModel_1, 0, 1), l_WorldPosition_0, v99, l_Position_0);
                            v97.Part.CFrame = CFrame.new(v102);
                            if l_AnimalModel_1 >= 1 then
                                v98:Disconnect();
                                task.spawn(function() --[[ Line: 315 ]]
                                    -- upvalues: v12 (ref), l_ReplicatedStorage_0 (ref), l_Position_0 (copy)
                                    v12:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Concert.Hit, l_Position_0);
                                end);
                                v97:Destroy();
                                local v103 = script.DiscoExplosion:Clone();
                                v103:PivotTo(CFrame.new(l_Position_0));
                                v103.Anchored = false;
                                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                                l_WeldConstraint_0.Part0 = v103;
                                l_WeldConstraint_0.Part1 = v91.AnimalModel.PrimaryPart;
                                l_WeldConstraint_0.Parent = v103;
                                v103.Parent = workspace;
                                v24.emit(v103);
                                task.delay(3, function() --[[ Line: 334 ]]
                                    -- upvalues: v103 (copy)
                                    v103:Destroy();
                                end);
                            end;
                            debug.profileend();
                        end);
                        return;
                    end;
                end;
            end;
        end));
        for _, v106 in v65 do
            v106.Enabled = false;
        end;
        v30:Add((v44(10, 15, function(v107) --[[ Line: 347 ]]
            -- upvalues: v24 (ref), v55 (copy), v65 (copy), v30 (ref), l_RunService_0 (ref), l_Concert_0 (ref), v61 (copy), v62 (copy), v78 (copy), v47 (ref), v53 (copy), v15 (ref), v84 (copy), v59 (copy), v60 (copy), l_Children_0 (copy), v68 (copy), v69 (copy), v67 (copy), v66 (copy), v57 (ref), v58 (ref), l_SmokeStage_0 (copy), v11 (ref)
            v24.enable(v55);
            local v108 = 1;
            local v109 = 0;
            local v110 = 0;
            local v111 = 0;
            local v112 = 0;
            local v113 = {};
            local v114 = Color3.new(0, 0, 0);
            local v115 = ColorSequence.new(v114);
            task.delay(v107(), function() --[[ Line: 361 ]]
                -- upvalues: v65 (ref)
                for _, v117 in v65 do
                    v117.Enabled = true;
                end;
            end);
            v30:Add(function() --[[ Line: 367 ]]
                workspace.Gravity = 196.2;
            end);
            v30:Add(l_RunService_0.PostSimulation:Connect(function(v118) --[[ Line: 371 ]]
                -- upvalues: v110 (ref), v109 (ref), v112 (ref), v111 (ref), l_Concert_0 (ref), v61 (ref), v62 (ref), v78 (ref), v47 (ref), v107 (copy), v108 (ref), v53 (ref), v15 (ref), v84 (ref), v114 (copy), v59 (ref), v113 (copy), v115 (copy), v60 (ref), l_Children_0 (ref), v68 (ref), v69 (ref), v67 (ref), v66 (ref), v57 (ref), v65 (ref), v58 (ref), v24 (ref), l_SmokeStage_0 (ref), v11 (ref)
                debug.profilebegin("Concert:Update");
                workspace.Gravity = 29.429999999999996;
                v110 = v110 - v118;
                v109 = v109 - v118;
                v112 = v112 - v118;
                v111 = v111 - v118;
                local l_TimePosition_0 = l_Concert_0.TimePosition;
                local v120 = l_TimePosition_0 >= 20 and l_TimePosition_0 <= 25 or l_TimePosition_0 >= 70 and l_TimePosition_0 <= 94.5;
                local v121 = math.clamp((l_Concert_0.PlaybackLoudness - 100) / 900, 0, 1);
                for _, v123 in v61 do
                    v123.TimeScale = math.clamp(v121 / 0.05, 1, 2) * v62[v123];
                end;
                for _, v125 in v78 do
                    v125.Shuffle:AdjustSpeed((math.clamp(v121 / 0.13, 0.5, 1.5)));
                end;
                if v47 then
                    v47:AdjustSpeed(v120 and 3 or math.clamp(v121 / 0.06, 1, 3));
                end;
                local v126 = if l_TimePosition_0 >= 70 and l_TimePosition_0 <= 94.5 then l_TimePosition_0 >= 85 and 0.05 or math.lerp(0.5, 0.2, (math.min((l_TimePosition_0 - 70) / 12, 1))) else v120 and 0.1 or 0.3;
                if (v121 >= 0.11 or v120) and v111 <= 0 and v107() <= 0 then
                    v111 = v126;
                    v108 = v108 % #v53 + 1;
                    v15(v84, TweenInfo.new(0.2), {
                        Value = v53[v108]
                    });
                end;
                local l_Value_0 = v84.Value;
                if l_TimePosition_0 >= 94.3 and l_TimePosition_0 <= 97.7 then
                    l_Value_0 = v114;
                end;
                local v128 = ColorSequence.new(l_Value_0);
                for _, v130 in v59 do
                    v130.Color = if v113[v130] then v115 else v128;
                end;
                for _, v132 in v60 do
                    v132.Color = if v113[v132] then v114 else l_Value_0;
                end;
                local v133 = v118 * (v120 and 1.5 or math.clamp(v121 / 0.25, 0.05, 1));
                for _, v135 in l_Children_0 do
                    local v136 = v68[v135] or 0;
                    local v137 = v69[v135] or 0;
                    local v138 = math.clamp((v67[v135] or 0) + v133, 0, 1);
                    v67[v135] = v138;
                    if v138 >= 1 then
                        v67[v135] = 0;
                        v68[v135] = v137;
                        local l_v69_0 = v69;
                        l_v69_0[v135] = l_v69_0[v135] * -1;
                    else
                        local v140 = math.rad((math.lerp(v136, v137, v138)));
                        v135:PivotTo(v66[v135] * CFrame.Angles(0, v140, if v57 then v140 else 0));
                        if v57 then
                            for _, v142 in v135.Rotate.Neon:GetChildren() do
                                if v142.Name == "CustomAttachment_-1" or v142.Name == "2" or v142.Name == "CustomAttachment_2" then
                                    v142.Position = Vector3.new(v142.Position.X, math.sin(v138 * 3.141592653589793) * 100, 300);
                                end;
                            end;
                        end;
                    end;
                end;
                if v120 and v110 <= 0 then
                    local v143 = math.random(100, 200);
                    v110 = v143 / 1000;
                    local v144 = {};
                    for _, v146 in v65 do
                        v144[v146] = true;
                        v146.Width0 = math.max(v146.Width0 - 0.5, 0.5);
                        v146.Width1 = math.max(v146.Width1 - 2.5, 1);
                        v146.Brightness = math.min(v146.Brightness + 0.5, 13);
                        v146.Enabled = false;
                        task.delay(math.random(50, v143) / 1000, function() --[[ Line: 470 ]]
                            -- upvalues: v146 (copy)
                            v146.Enabled = true;
                        end);
                    end;
                    for _, v148 in v59 do
                        if not v144[v148] then
                            v113[v148] = true;
                            task.delay(math.random(50, v143) / 1000, function() --[[ Line: 481 ]]
                                -- upvalues: v113 (ref), v148 (copy)
                                v113[v148] = nil;
                            end);
                        end;
                    end;
                    for _, v150 in v60 do
                        v113[v150] = true;
                        task.delay(math.random(50, v143) / 1000, function() --[[ Line: 488 ]]
                            -- upvalues: v113 (ref), v150 (copy)
                            v113[v150] = nil;
                        end);
                    end;
                end;
                if l_TimePosition_0 >= 25 and not v58 then
                    v58 = true;
                    for _, v152 in l_Children_0 do
                        local l_1_0 = v152.Rotate.Neon["1"];
                        local l_2_0 = v152.Rotate.Neon["2"];
                        local v155 = l_2_0:Clone();
                        v155.Name = "CustomAttachment_1";
                        v155.Parent = v152.Rotate.Neon;
                        v15(l_2_0, TweenInfo.new(5), {
                            Position = l_2_0.Position + Vector3.new(15, 0, 0, 0)
                        });
                        v15(v155, TweenInfo.new(5), {
                            Position = l_2_0.Position - Vector3.new(15, 0, 0, 0)
                        });
                        local v156 = script.lightbeambig.Beams:Clone();
                        for _, v158 in v156:GetChildren() do
                            v158.Width0 = 0.5;
                            v158.Width1 = 1;
                            v158.Brightness = 13;
                            v158.Attachment0 = l_1_0;
                            v158.Attachment1 = v155;
                            v158.Parent = v152.Rotate.Neon;
                            table.insert(v65, v158);
                            table.insert(v59, v158);
                        end;
                        v156:Destroy();
                    end;
                end;
                if l_TimePosition_0 >= 71 and not v57 then
                    v24.enable(l_SmokeStage_0);
                    task.delay(5, function() --[[ Line: 531 ]]
                        -- upvalues: v24 (ref), l_SmokeStage_0 (ref)
                        v24.disable(l_SmokeStage_0);
                    end);
                    v57 = true;
                    for _, v160 in l_Children_0 do
                        local l_1_1 = v160.Rotate.Neon["1"];
                        local l_2_1 = v160.Rotate.Neon["2"];
                        local v163 = l_2_1.Position - Vector3.new(15, 0, 0, 0);
                        v15(l_2_1, TweenInfo.new(5), {
                            Position = v163
                        });
                        for v164 = -2, 2 do
                            if v164 ~= 0 then
                                local v165 = l_2_1:Clone();
                                v165.Name = ("CustomAttachment_%*"):format(v164);
                                v165.Parent = v160.Rotate.Neon;
                                v15(v165, TweenInfo.new(5), {
                                    Position = v163 + Vector3.new(v164 * 30, 0, 0)
                                });
                                local v166 = script.lightbeambig.Beams:Clone();
                                for _, v168 in v166:GetChildren() do
                                    v168.Width0 = 0.5;
                                    v168.Width1 = 1;
                                    v168.Brightness = 13;
                                    v168.Attachment0 = l_1_1;
                                    v168.Attachment1 = v165;
                                    v168.Parent = v160.Rotate.Neon;
                                    table.insert(v65, v168);
                                    table.insert(v59, v168);
                                end;
                                v166:Destroy();
                            end;
                        end;
                    end;
                end;
                if (v121 >= 0.2 or v120) and v109 <= 0 then
                    v109 = v120 and 0.2 or 0.1;
                    v11:Fov((v121 - 0.2) * 15 + 70, 0.1);
                end;
                debug.profileend();
            end));
        end)));
        for _, v170 in v54:GetDescendants() do
            if v170:IsA("BasePart") and v170.Name == "Neon" or v170:IsA("SpotLight") then
                table.insert(v60, v170);
            elseif v170:IsA("ParticleEmitter") or v170:IsA("Beam") then
                table.insert(v59, v170);
                if v170:IsA("ParticleEmitter") then
                    v62[v170] = v170.TimeScale;
                    table.insert(v61, v170);
                end;
            end;
        end;
        v30:Add((v44(10, 15, function(v171) --[[ Line: 627 ]]
            -- upvalues: v15 (ref), v84 (copy), v53 (copy)
            v15(v84, TweenInfo.new(v171()), {
                Value = v53[1]
            });
        end)));
    end;
    v30:Add((v44(0, 5, function(v173) --[[ Line: 634 ]]
        -- upvalues: v15 (ref), v48 (copy), v172 (copy), v10 (ref), v30 (ref)
        v15(v48, TweenInfo.new(v173(), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Brightness = -1.2
        });
        task.delay(v173(), v172);
        v10:Run("ConcertEvent", "GrassRecolor");
        v30:Add(function() --[[ Line: 642 ]]
            -- upvalues: v10 (ref)
            v10:Stop("ConcertEvent", "GrassRecolor");
        end);
        v10:Run("ConcertEvent", "WallRecolor");
        v30:Add(function() --[[ Line: 647 ]]
            -- upvalues: v10 (ref)
            v10:Stop("ConcertEvent", "WallRecolor");
        end);
        v10:Run("ConcertEvent", "WallBottomRecolor");
        v30:Add(function() --[[ Line: 652 ]]
            -- upvalues: v10 (ref)
            v10:Stop("ConcertEvent", "WallBottomRecolor");
        end);
    end)));
    v30:Add((v44(10, 15, function(v174) --[[ Line: 657 ]]
        -- upvalues: v15 (ref), v48 (copy)
        v15(v48, TweenInfo.new(v174(), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Brightness = -0.05
        });
    end)));
    v30:Add(task.delay(math.max(l_v13_ActiveEventData_0.startedAt + 24.5 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 666 ]]
        -- upvalues: v30 (ref), v19 (ref), v17 (ref), l_Players_0 (ref), v21 (ref), v47 (ref), l_RunService_0 (ref), l_v13_ActiveEventData_0 (copy), l_LocalPlayer_0 (ref)
        local _ = v30:Add(v19.new());
        local _ = v30:Add(v17.observeCharacter(l_Players_0.LocalPlayer, function(_, v177) --[[ Line: 670 ]]
            -- upvalues: v21 (ref), v47 (ref), l_RunService_0 (ref), l_v13_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
            local v178 = v21.new();
            v178:Add(task.spawn(function() --[[ Line: 673 ]]
                -- upvalues: v177 (copy), v47 (ref), v178 (copy), l_RunService_0 (ref), l_v13_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                local l_Humanoid_0 = v177:WaitForChild("Humanoid");
                if not l_Humanoid_0 then
                    return;
                else
                    local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
                    if not l_Animator_0 then
                        return;
                    else
                        local v181 = l_Animator_0:LoadAnimation(script.Dance);
                        v181.Priority = Enum.AnimationPriority.Action;
                        v47 = v181;
                        local v182 = 0;
                        v178:Add(l_RunService_0.PostSimulation:Connect(function(v183) --[[ Line: 691 ]]
                            -- upvalues: l_v13_ActiveEventData_0 (ref), v181 (copy), l_Humanoid_0 (copy), l_LocalPlayer_0 (ref), v182 (ref)
                            debug.profilebegin("Concert:Player:Dance");
                            local _ = workspace:GetServerTimeNow();
                            if math.max(l_v13_ActiveEventData_0.startedAt + 84.5 - workspace:GetServerTimeNow(), 0) > 0 then
                                if not v181.IsPlaying then
                                    v181:Play();
                                end;
                                debug.profileend();
                                return;
                            else
                                if not (l_Humanoid_0.MoveDirection ~= Vector3.new(0, 0, 0, 0)) and not l_LocalPlayer_0:GetAttribute("Stealing") then
                                    if v182 < 3 then
                                        v182 = v182 + v183;
                                    elseif not v181.IsPlaying then
                                        v181:Play();
                                    end;
                                else
                                    v182 = 0;
                                    if v181.IsPlaying then
                                        v181:Stop();
                                    end;
                                end;
                                debug.profileend();
                                return;
                            end;
                        end));
                        v178:Add(function() --[[ Line: 720 ]]
                            -- upvalues: v181 (copy), v47 (ref)
                            v181:Stop();
                            v181:Destroy();
                            v47 = nil;
                        end);
                        return;
                    end;
                end;
            end));
            return v178:WrapClean();
        end));
    end));
    v14:Update();
    v12:UpdateOST();
end;
v7.OnStop = function(_) --[[ Line: 735 ]] --[[ Name: OnStop ]]
    -- upvalues: v30 (copy), v31 (ref)
    v30:Destroy();
    v31 = nil;
end;
v7.OnLoad = function(_) --[[ Line: 740 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v8 (copy), l_Concert_0 (copy)
    task.spawn(function() --[[ Line: 741 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(function() --[[ Line: 745 ]]
        -- upvalues: v8 (ref), l_Concert_0 (ref), l_ContentProvider_0 (ref)
        v8:WaitForAssetId("rbxassetid://126264638776020");
        l_Concert_0.SoundId = "rbxassetid://126264638776020";
        l_ContentProvider_0:PreloadAsync({
            l_Concert_0
        });
    end);
end;
return v7;