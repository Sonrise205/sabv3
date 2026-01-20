local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v12 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v13 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v14 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v15 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v17 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v19 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v21 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v23 = require(l_ReplicatedStorage_0.Packages.Spr);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local v25 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local l_RapConcert_0 = workspace.Sounds.RapConcert;
local v30 = v21.new();
local v31 = nil;
v7.OnStart = function(_) --[[ Line: 44 ]] --[[ Name: OnStart ]]
    -- upvalues: v13 (copy), l_Name_0 (copy), v30 (copy), v10 (copy), v14 (copy), v12 (copy), l_Lighting_0 (copy), l_ReplicatedStorage_0 (copy), l_CurrentCamera_0 (copy), l_RapConcert_0 (copy), v8 (copy), v25 (copy), v17 (copy), l_RunService_0 (copy), v15 (copy), v23 (copy), v11 (copy), v19 (copy), l_Players_0 (copy), v21 (copy), l_LocalPlayer_0 (copy)
    local l_v13_ActiveEventData_0 = v13:GetActiveEventData(l_Name_0);
    assert(l_v13_ActiveEventData_0);
    local function _(v34) --[[ Line: 48 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v13_ActiveEventData_0 (copy)
        return (math.max(l_v13_ActiveEventData_0.startedAt + v34 - workspace:GetServerTimeNow(), 0));
    end;
    local function v44(v36, v37, v38) --[[ Line: 52 ]] --[[ Name: createEventScheduler ]]
        -- upvalues: l_v13_ActiveEventData_0 (copy)
        local function v40() --[[ Line: 53 ]]
            -- upvalues: v37 (copy), l_v13_ActiveEventData_0 (ref)
            local l_v37_0 = v37;
            return (math.max(l_v13_ActiveEventData_0.startedAt + l_v37_0 - workspace:GetServerTimeNow(), 0));
        end;
        local function v41() --[[ Line: 57 ]] --[[ Name: run ]]
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
        return function() --[[ Line: 70 ]]
            -- upvalues: v42 (ref)
            if v42 and coroutine.status(v42) == "suspended" then
                pcall(task.cancel, v42);
            end;
        end;
    end;
    v30:Add(function() --[[ Line: 77 ]]
        -- upvalues: v10 (ref), v14 (ref), v12 (ref)
        v10:Activate("Blink");
        v14:Update();
        v12:UpdateOST();
    end);
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = l_ReplicatedStorage_0;
        v30:Add(function() --[[ Line: 86 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v30:Clone(script.Atmosphere).Parent = l_Lighting_0;
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = l_ReplicatedStorage_0;
        v30:Add(function() --[[ Line: 96 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    local v47 = nil;
    local v48 = v30:Clone(Instance.new("ColorCorrectionEffect"));
    v48.Parent = l_CurrentCamera_0;
    local function _(v49, v50) --[[ Line: 106 ]] --[[ Name: loadAnimation ]]
        -- upvalues: v30 (ref)
        local v51 = v49.AnimationController.Animator:LoadAnimation(v50);
        v30:Add(v51, "Stop");
        v30:Add(v51);
        return v51;
    end;
    local function v137() --[[ Line: 113 ]] --[[ Name: createStage ]]
        -- upvalues: l_Lighting_0 (ref), v30 (ref), l_RapConcert_0 (ref), v8 (ref), l_v13_ActiveEventData_0 (copy), v25 (ref), v17 (ref), v44 (copy), l_RunService_0 (ref), v47 (ref), v15 (ref), v23 (ref), v11 (ref)
        l_Lighting_0.Ambient = Color3.new(0, 0, 0);
        l_Lighting_0.OutdoorAmbient = Color3.fromRGB(100, 100, 100);
        l_Lighting_0.EnvironmentDiffuseScale = 0;
        l_Lighting_0.EnvironmentSpecularScale = 0;
        v30:Add(function() --[[ Line: 118 ]]
            -- upvalues: l_Lighting_0 (ref)
            l_Lighting_0.Ambient = Color3.fromRGB(241, 241, 241);
            l_Lighting_0.OutdoorAmbient = Color3.fromRGB(212, 212, 212);
            l_Lighting_0.EnvironmentDiffuseScale = 1;
            l_Lighting_0.EnvironmentSpecularScale = 0.5;
        end);
        v30:Add(function() --[[ Line: 126 ]]
            -- upvalues: l_RapConcert_0 (ref)
            l_RapConcert_0:Stop();
        end);
        v30:Add(task.spawn(function() --[[ Line: 130 ]]
            -- upvalues: v8 (ref), l_RapConcert_0 (ref), l_v13_ActiveEventData_0 (ref)
            v8:WaitForAssetId("rbxassetid://124977112693561");
            l_RapConcert_0.SoundId = "";
            l_RapConcert_0.SoundId = "rbxassetid://124977112693561";
            while not l_RapConcert_0.IsLoaded do
                task.wait(1);
            end;
            l_RapConcert_0.TimePosition = math.max(l_RapConcert_0.TimePosition, workspace:GetServerTimeNow() - (l_v13_ActiveEventData_0.startedAt + 5));
            l_RapConcert_0:Play();
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
        v25.disable(v55);
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
        v30:Add(v17.observeTag("HideInRapConcert", function(v75) --[[ Line: 214 ]]
            local l_Parent_0 = v75.Parent;
            v75.Parent = script;
            return function() --[[ Line: 217 ]]
                -- upvalues: v75 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 218 ]]
                    -- upvalues: v75 (ref), l_Parent_0 (ref)
                    v75.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script
        }));
        local v77 = v30:Add(Instance.new("Color3Value"));
        v77.Value = Color3.fromRGB(0, 0, 0);
        local v78 = true;
        v30:Add(function() --[[ Line: 228 ]]
            -- upvalues: v78 (ref)
            v78 = false;
        end);
        for _, v80 in v65 do
            v80.Enabled = false;
        end;
        v30:Add((v44(10, 15, function(v81) --[[ Line: 236 ]]
            -- upvalues: v25 (ref), v55 (copy), v65 (copy), v30 (ref), l_RunService_0 (ref), l_RapConcert_0 (ref), v61 (copy), v62 (copy), v47 (ref), v53 (copy), v15 (ref), v77 (copy), l_v13_ActiveEventData_0 (ref), v23 (ref), v59 (copy), v60 (copy), l_Children_0 (copy), v68 (copy), v69 (copy), v67 (copy), v66 (copy), v57 (ref), v58 (ref), l_SmokeStage_0 (copy), v11 (ref)
            v25.enable(v55);
            local v82 = 1;
            local v83 = 0;
            local v84 = 0;
            local v85 = 0;
            local v86 = 0;
            local v87 = {};
            local v88 = Color3.new(0, 0, 0);
            local v89 = ColorSequence.new(v88);
            task.delay(v81(), function() --[[ Line: 250 ]]
                -- upvalues: v65 (ref)
                for _, v91 in v65 do
                    v91.Enabled = true;
                end;
            end);
            v30:Add(function() --[[ Line: 256 ]]
                workspace.Gravity = 196.2;
            end);
            local l_VFXDisco_0 = v55.VFXDisco;
            local l_l_VFXDisco_0_Pivot_0 = l_VFXDisco_0:GetPivot();
            local v94 = 0;
            v30:Add(l_RunService_0.PostSimulation:Connect(function(v95) --[[ Line: 265 ]]
                -- upvalues: v94 (ref), v84 (ref), v83 (ref), v86 (ref), v85 (ref), l_RapConcert_0 (ref), v61 (ref), v62 (ref), v47 (ref), v81 (copy), v82 (ref), v53 (ref), v15 (ref), v77 (ref), l_VFXDisco_0 (copy), l_l_VFXDisco_0_Pivot_0 (copy), l_v13_ActiveEventData_0 (ref), v23 (ref), v59 (ref), v87 (copy), v89 (copy), v60 (ref), v88 (copy), l_Children_0 (ref), v68 (ref), v69 (ref), v67 (ref), v66 (ref), v57 (ref), v58 (ref), v65 (ref), v25 (ref), l_SmokeStage_0 (ref), v11 (ref)
                debug.profilebegin("Rap Concert:Update");
                workspace.Gravity = 29.429999999999996;
                v94 = v94 - v95;
                v84 = v84 - v95;
                v83 = v83 - v95;
                v86 = v86 - v95;
                v85 = v85 - v95;
                local l_TimePosition_0 = l_RapConcert_0.TimePosition;
                local v97 = math.clamp((l_RapConcert_0.PlaybackLoudness - 100) / 900, 0, 1);
                for _, v99 in v61 do
                    v99.TimeScale = math.clamp(v97 / 0.05, 1, 2) * v62[v99];
                end;
                if v47 then
                    v47:AdjustSpeed((math.clamp(v97 / 0.2, 0.5, 1.1)));
                end;
                if v97 >= 0.11 and v85 <= 0 and v81() <= 0 then
                    v85 = 0.3;
                    v82 = v82 % #v53 + 1;
                    v15(v77, TweenInfo.new(0.2), {
                        Value = v53[v82]
                    });
                end;
                l_VFXDisco_0:PivotTo(l_l_VFXDisco_0_Pivot_0 * CFrame.Angles(0, workspace:GetServerTimeNow() - l_v13_ActiveEventData_0.startedAt, 0));
                v23.target(l_VFXDisco_0, 1, 2, {
                    Scale = 1
                });
                if v94 <= 0 and v97 > 0.05 then
                    v94 = 0.1;
                    v23.target(l_VFXDisco_0, 1, 10, {
                        Scale = v97 + 1
                    });
                end;
                local l_Value_0 = v77.Value;
                local v101 = ColorSequence.new(l_Value_0);
                for _, v103 in v59 do
                    v103.Color = if v87[v103] then v89 else v101;
                end;
                for _, v105 in v60 do
                    v105.Color = if v87[v105] then v88 else l_Value_0;
                end;
                local v106 = v95 * math.clamp(v97 / 0.25, 0.05, 1);
                for _, v108 in l_Children_0 do
                    local v109 = v68[v108] or 0;
                    local v110 = v69[v108] or 0;
                    local v111 = math.clamp((v67[v108] or 0) + v106, 0, 1);
                    v67[v108] = v111;
                    if v111 >= 1 then
                        v67[v108] = 0;
                        v68[v108] = v110;
                        local l_v69_0 = v69;
                        l_v69_0[v108] = l_v69_0[v108] * -1;
                    else
                        local v113 = math.rad((math.lerp(v109, v110, v111)));
                        v108:PivotTo(v66[v108] * CFrame.Angles(0, v113, if v57 then v113 else 0));
                        if v57 then
                            for _, v115 in v108.Rotate.Neon:GetChildren() do
                                if v115.Name == "CustomAttachment_-1" or v115.Name == "2" or v115.Name == "CustomAttachment_2" then
                                    v115.Position = Vector3.new(v115.Position.X, math.sin(v111 * 3.141592653589793) * 100, 300);
                                end;
                            end;
                        end;
                    end;
                end;
                if l_TimePosition_0 >= 25 and not v58 then
                    v58 = true;
                    for _, v117 in l_Children_0 do
                        local l_1_0 = v117.Rotate.Neon["1"];
                        local l_2_0 = v117.Rotate.Neon["2"];
                        local v120 = l_2_0:Clone();
                        v120.Name = "CustomAttachment_1";
                        v120.Parent = v117.Rotate.Neon;
                        v15(l_2_0, TweenInfo.new(5), {
                            Position = l_2_0.Position + Vector3.new(15, 0, 0, 0)
                        });
                        v15(v120, TweenInfo.new(5), {
                            Position = l_2_0.Position - Vector3.new(15, 0, 0, 0)
                        });
                        local v121 = script.lightbeambig.Beams:Clone();
                        for _, v123 in v121:GetChildren() do
                            v123.Width0 = 0.5;
                            v123.Width1 = 1;
                            v123.Brightness = 13;
                            v123.Attachment0 = l_1_0;
                            v123.Attachment1 = v120;
                            v123.Parent = v117.Rotate.Neon;
                            table.insert(v65, v123);
                            table.insert(v59, v123);
                        end;
                        v121:Destroy();
                    end;
                end;
                if l_TimePosition_0 >= 71 and not v57 then
                    v25.enable(l_SmokeStage_0);
                    task.delay(5, function() --[[ Line: 396 ]]
                        -- upvalues: v25 (ref), l_SmokeStage_0 (ref)
                        v25.disable(l_SmokeStage_0);
                    end);
                    v57 = true;
                    for _, v125 in l_Children_0 do
                        local l_1_1 = v125.Rotate.Neon["1"];
                        local l_2_1 = v125.Rotate.Neon["2"];
                        local v128 = l_2_1.Position - Vector3.new(15, 0, 0, 0);
                        v15(l_2_1, TweenInfo.new(5), {
                            Position = v128
                        });
                        for v129 = -2, 2 do
                            if v129 ~= 0 then
                                local v130 = l_2_1:Clone();
                                v130.Name = ("CustomAttachment_%*"):format(v129);
                                v130.Parent = v125.Rotate.Neon;
                                v15(v130, TweenInfo.new(5), {
                                    Position = v128 + Vector3.new(v129 * 30, 0, 0)
                                });
                                local v131 = script.lightbeambig.Beams:Clone();
                                for _, v133 in v131:GetChildren() do
                                    v133.Width0 = 0.5;
                                    v133.Width1 = 1;
                                    v133.Brightness = 13;
                                    v133.Attachment0 = l_1_1;
                                    v133.Attachment1 = v130;
                                    v133.Parent = v125.Rotate.Neon;
                                    table.insert(v65, v133);
                                    table.insert(v59, v133);
                                end;
                                v131:Destroy();
                            end;
                        end;
                    end;
                end;
                if v97 >= 0.2 and v83 <= 0 then
                    v83 = 0.1;
                    v11:Fov((v97 - 0.2) * 15 + 70, 0.1);
                end;
                debug.profileend();
            end));
        end)));
        for _, v135 in v54:GetDescendants() do
            if not v135:IsDescendantOf(v55.VFXDisco) then
                if v135:IsA("BasePart") and v135.Name == "Neon" or v135:IsA("SpotLight") then
                    table.insert(v60, v135);
                elseif v135:IsA("ParticleEmitter") or v135:IsA("Beam") then
                    table.insert(v59, v135);
                    if v135:IsA("ParticleEmitter") then
                        v62[v135] = v135.TimeScale;
                        table.insert(v61, v135);
                    end;
                end;
            end;
        end;
        v30:Add((v44(10, 15, function(v136) --[[ Line: 468 ]]
            -- upvalues: v15 (ref), v77 (copy), v53 (copy)
            v15(v77, TweenInfo.new(v136()), {
                Value = v53[1]
            });
        end)));
    end;
    v30:Add((v44(0, 5, function(v138) --[[ Line: 475 ]]
        -- upvalues: v15 (ref), v48 (copy), v137 (copy), v10 (ref), v30 (ref)
        v15(v48, TweenInfo.new(v138(), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Brightness = -1.2
        });
        task.delay(v138(), v137);
        v10:Run("ConcertEvent", "GrassRecolor");
        v30:Add(function() --[[ Line: 483 ]]
            -- upvalues: v10 (ref)
            v10:Stop("ConcertEvent", "GrassRecolor");
        end);
        v10:Run("ConcertEvent", "WallRecolor");
        v30:Add(function() --[[ Line: 488 ]]
            -- upvalues: v10 (ref)
            v10:Stop("ConcertEvent", "WallRecolor");
        end);
        v10:Run("ConcertEvent", "WallBottomRecolor");
        v30:Add(function() --[[ Line: 493 ]]
            -- upvalues: v10 (ref)
            v10:Stop("ConcertEvent", "WallBottomRecolor");
        end);
    end)));
    v30:Add((v44(10, 15, function(v139) --[[ Line: 498 ]]
        -- upvalues: v15 (ref), v48 (copy)
        v15(v48, TweenInfo.new(v139(), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Brightness = -0.05
        });
    end)));
    v30:Add(task.delay(math.max(l_v13_ActiveEventData_0.startedAt + 15 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 507 ]]
        -- upvalues: v30 (ref), v19 (ref), v17 (ref), l_Players_0 (ref), v21 (ref), v47 (ref), l_RunService_0 (ref), l_v13_ActiveEventData_0 (copy), l_LocalPlayer_0 (ref)
        local _ = v30:Add(v19.new());
        local _ = v30:Add(v17.observeCharacter(l_Players_0.LocalPlayer, function(_, v142) --[[ Line: 511 ]]
            -- upvalues: v21 (ref), v47 (ref), l_RunService_0 (ref), l_v13_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
            local v143 = v21.new();
            v143:Add(task.spawn(function() --[[ Line: 514 ]]
                -- upvalues: v142 (copy), v47 (ref), v143 (copy), l_RunService_0 (ref), l_v13_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                local l_Humanoid_0 = v142:WaitForChild("Humanoid");
                if not l_Humanoid_0 then
                    return;
                else
                    local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
                    if not l_Animator_0 then
                        return;
                    else
                        local v146 = l_Animator_0:LoadAnimation(script.Dance);
                        v146.Priority = Enum.AnimationPriority.Action;
                        v47 = v146;
                        local v147 = 0;
                        v143:Add(l_RunService_0.PostSimulation:Connect(function(v148) --[[ Line: 532 ]]
                            -- upvalues: l_v13_ActiveEventData_0 (ref), v146 (copy), l_Humanoid_0 (copy), l_LocalPlayer_0 (ref), v147 (ref)
                            debug.profilebegin("Rap Concert:Player:Dance");
                            local _ = workspace:GetServerTimeNow();
                            if math.max(l_v13_ActiveEventData_0.startedAt + 75 - workspace:GetServerTimeNow(), 0) > 0 then
                                if not v146.IsPlaying then
                                    v146:Play();
                                end;
                                debug.profileend();
                                return;
                            else
                                if not (l_Humanoid_0.MoveDirection ~= Vector3.new(0, 0, 0, 0)) and not l_LocalPlayer_0:GetAttribute("Stealing") then
                                    if v147 < 3 then
                                        v147 = v147 + v148;
                                    elseif not v146.IsPlaying then
                                        v146:Play();
                                    end;
                                else
                                    v147 = 0;
                                    if v146.IsPlaying then
                                        v146:Stop();
                                    end;
                                end;
                                debug.profileend();
                                return;
                            end;
                        end));
                        v143:Add(function() --[[ Line: 561 ]]
                            -- upvalues: v146 (copy), v47 (ref)
                            v146:Stop();
                            v146:Destroy();
                            v47 = nil;
                        end);
                        return;
                    end;
                end;
            end));
            return v143:WrapClean();
        end));
    end));
    v14:Update();
    v12:UpdateOST();
end;
v7.OnStop = function(_) --[[ Line: 576 ]] --[[ Name: OnStop ]]
    -- upvalues: v30 (copy), v31 (ref)
    v30:Destroy();
    v31 = nil;
end;
v7.OnLoad = function(_) --[[ Line: 581 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v8 (copy), l_RapConcert_0 (copy)
    task.spawn(function() --[[ Line: 582 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(function() --[[ Line: 586 ]]
        -- upvalues: v8 (ref), l_RapConcert_0 (ref), l_ContentProvider_0 (ref)
        v8:WaitForAssetId("rbxassetid://124977112693561");
        l_RapConcert_0.SoundId = "rbxassetid://124977112693561";
        l_ContentProvider_0:PreloadAsync({
            l_RapConcert_0
        });
    end);
end;
return v7;