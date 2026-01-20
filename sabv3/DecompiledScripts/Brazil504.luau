local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local v9 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v10 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v12 = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v15 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v16 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v17 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v23 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v25 = require(l_ReplicatedStorage_0.Packages.Net);
local v26 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v29 = Color3.fromRGB(128, 255, 0);
local v30 = Color3.fromRGB(0, 255, 0);
local l_Name_0 = script.Name;
local l_BrazilEvent_0 = workspace.Sounds.BrazilEvent;
local l_FullMapFloor_0 = workspace.Events.Brazil.FullMapFloor;
local l_RenderedMovingAnimals_0 = workspace.RenderedMovingAnimals;
local v35 = v25:RemoteEvent("EventService/Brazil/Focus");
local v36 = v25:RemoteEvent("EventService/Brazil/Burst");
local v37 = v23.new();
local function v38() --[[ Line: 54 ]] --[[ Name: getRandomPosition ]]
    -- upvalues: l_FullMapFloor_0 (copy)
    return l_FullMapFloor_0.Position + Vector3.new(l_FullMapFloor_0.Size.X * 0.5 * (math.random(0, 1) * 2 - 1), 0, l_FullMapFloor_0.Size.Z * 0.5 * (math.random(0, 1) * 2 - 1));
end;
local function v42(v39) --[[ Line: 62 ]] --[[ Name: createLight ]]
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Name = "Attachment";
    l_Attachment_0.CFrame = CFrame.new(0, 3, 0);
    local l_PointLight_0 = Instance.new("PointLight");
    l_PointLight_0.Name = "PointLight";
    l_PointLight_0.Brightness = 4;
    l_PointLight_0.Color = Color3.fromRGB(255, 157, 0);
    l_PointLight_0.Range = 6;
    l_PointLight_0.Parent = l_Attachment_0;
    l_Attachment_0.Parent = v39;
    return function() --[[ Line: 76 ]]
        -- upvalues: l_Attachment_0 (copy), l_PointLight_0 (copy)
        l_Attachment_0:Destroy();
        l_PointLight_0:Destroy();
    end;
end;
v8.OnStart = function(_) --[[ Line: 82 ]] --[[ Name: OnStart ]]
    -- upvalues: v14 (copy), l_Name_0 (copy), v37 (copy), v11 (copy), v15 (copy), v13 (copy), v36 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v26 (copy), l_Lighting_0 (copy), l_CurrentCamera_0 (copy), v19 (copy), l_Players_0 (copy), v23 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy), v16 (copy), v35 (copy), v42 (copy), l_RenderedMovingAnimals_0 (copy), l_BrazilEvent_0 (copy), v9 (copy), v38 (copy), v17 (copy), v29 (copy), v30 (copy), v12 (copy)
    local l_v14_ActiveEventData_0 = v14:GetActiveEventData(l_Name_0);
    assert(l_v14_ActiveEventData_0);
    local function _(v45) --[[ Line: 86 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        return (math.max(l_v14_ActiveEventData_0.startedAt + v45 - workspace:GetServerTimeNow(), 0));
    end;
    local function v55(v47, v48, v49) --[[ Line: 90 ]] --[[ Name: createEventScheduler ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        local function v51() --[[ Line: 91 ]]
            -- upvalues: v48 (copy), l_v14_ActiveEventData_0 (ref)
            local l_v48_0 = v48;
            return (math.max(l_v14_ActiveEventData_0.startedAt + l_v48_0 - workspace:GetServerTimeNow(), 0));
        end;
        local function v52() --[[ Line: 95 ]] --[[ Name: run ]]
            -- upvalues: v49 (copy), v51 (copy)
            v49(v51);
        end;
        local v53 = nil;
        local v54 = math.max(l_v14_ActiveEventData_0.startedAt + v47 - workspace:GetServerTimeNow(), 0);
        if v54 > 0 then
            v53 = task.delay(v54, v52);
        else
            v49(v51);
        end;
        return function() --[[ Line: 108 ]]
            -- upvalues: v53 (ref)
            if v53 and coroutine.status(v53) == "suspended" then
                pcall(task.cancel, v53);
            end;
        end;
    end;
    v37:Add(function() --[[ Line: 115 ]]
        -- upvalues: v11 (ref), v15 (ref), v13 (ref)
        v11:Activate("Blink");
        v15:Update();
        v13:UpdateOST();
    end);
    v37:Add(v36.OnClientEvent:Connect(function(v56) --[[ Line: 121 ]]
        -- upvalues: v10 (ref), v13 (ref), l_ReplicatedStorage_0 (ref), v26 (ref)
        local v57 = v10:GetAnimals()[v56];
        if not v57 then
            return;
        else
            local _ = function() --[[ Line: 127 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v57 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v57.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
            end;
            local v61 = nil;
            local l_AnimalModel_1 = v57.AnimalModel;
            local l_Position_0 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
            task.spawn(function() --[[ Line: 142 ]]
                -- upvalues: v13 (ref), l_ReplicatedStorage_0 (ref), l_Position_0 (copy)
                v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Brazil.Hit, l_Position_0);
            end);
            v61 = script.Burst:Clone();
            v61:PivotTo(CFrame.new(l_Position_0));
            v61.Anchored = false;
            l_AnimalModel_1 = Instance.new("WeldConstraint");
            l_AnimalModel_1.Part0 = v61;
            l_AnimalModel_1.Part1 = v57.AnimalModel.PrimaryPart;
            l_AnimalModel_1.Parent = v61;
            v61.Parent = workspace;
            v26.emit(v61);
            task.delay(5, function() --[[ Line: 159 ]]
                -- upvalues: v61 (copy)
                v61:Destroy();
            end);
            return;
        end;
    end));
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = l_ReplicatedStorage_0;
        v37:Add(function() --[[ Line: 167 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    local v65 = v37:Clone(Instance.new("ColorCorrectionEffect"));
    v65.Parent = l_CurrentCamera_0;
    local v66 = nil;
    local v67 = v37:Clone(script.Stage);
    local v68 = v37:Clone(script.VFX);
    local _ = function() --[[ Line: 180 ]] --[[ Name: initPlayerDance ]]
        -- upvalues: v37 (ref), l_v14_ActiveEventData_0 (copy), v19 (ref), l_Players_0 (ref), v23 (ref), v66 (ref), l_RunService_0 (ref), l_LocalPlayer_0 (ref)
        v37:Add(task.delay(math.max(l_v14_ActiveEventData_0.startedAt + 20 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 184 ]]
            -- upvalues: v37 (ref), v19 (ref), l_Players_0 (ref), v23 (ref), v66 (ref), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
            v37:Add(v19.observeCharacter(l_Players_0.LocalPlayer, function(_, v70) --[[ Line: 186 ]]
                -- upvalues: v23 (ref), v66 (ref), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                local v71 = v23.new();
                v71:Add(task.spawn(function() --[[ Line: 189 ]]
                    -- upvalues: v70 (copy), v66 (ref), v71 (copy), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                    local l_Humanoid_0 = v70:WaitForChild("Humanoid");
                    if not l_Humanoid_0 then
                        return;
                    else
                        local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
                        if not l_Animator_0 then
                            return;
                        else
                            local v74 = l_Animator_0:LoadAnimation(script.Dance);
                            v74.Priority = Enum.AnimationPriority.Action;
                            v66 = v74;
                            local v75 = 0;
                            v71:Add(l_RunService_0.PostSimulation:Connect(function(v76) --[[ Line: 207 ]]
                                -- upvalues: l_v14_ActiveEventData_0 (ref), v74 (copy), l_Humanoid_0 (copy), l_LocalPlayer_0 (ref), v75 (ref)
                                debug.profilebegin("Brazil:Player:Dance");
                                local _ = workspace:GetServerTimeNow();
                                if math.max(l_v14_ActiveEventData_0.startedAt + 55 - workspace:GetServerTimeNow(), 0) > 0 then
                                    if not v74.IsPlaying then
                                        v74:Play();
                                    end;
                                    debug.profileend();
                                    return;
                                else
                                    if not (l_Humanoid_0.MoveDirection ~= Vector3.new(0, 0, 0, 0)) and not l_LocalPlayer_0:GetAttribute("Stealing") then
                                        if v75 < 3 then
                                            v75 = v75 + v76;
                                        elseif not v74.IsPlaying then
                                            v74:Play();
                                        end;
                                    else
                                        v75 = 0;
                                        if v74.IsPlaying then
                                            v74:Stop();
                                        end;
                                    end;
                                    debug.profileend();
                                    return;
                                end;
                            end));
                            v71:Add(function() --[[ Line: 236 ]]
                                -- upvalues: v74 (copy), v66 (ref)
                                v74:Stop();
                                v74:Destroy();
                                v66 = nil;
                            end);
                            return;
                        end;
                    end;
                end));
                return v71:WrapClean();
            end));
        end));
    end;
    local function v121() --[[ Line: 248 ]] --[[ Name: createMovingSquare ]]
        -- upvalues: v68 (copy), v37 (ref), v19 (ref), v23 (ref), l_RunService_0 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v16 (ref), v35 (ref)
        local v79 = {};
        local v80 = {};
        local v81 = {};
        for _, v83 in v68.Square.Bottom:GetChildren() do
            if v83:IsA("Attachment") then
                v79[v83] = v83.Position;
                table.insert(v81, v83);
            end;
        end;
        for _, v85 in v68.Square.Top:GetChildren() do
            if v85:IsA("Attachment") then
                v79[v85] = v85.Position;
                table.insert(v80, v85);
            end;
        end;
        local v86 = Vector3.new(9, 9, 9, 0);
        for _, v88 in v81 do
            v88.Position = v79[v88] * Vector3.new(1, 1, 1, 0) * 9;
        end;
        for _, v90 in v80 do
            v90.Position = v79[v90] * Vector3.new(1, 1, 1, 0) * 9;
        end;
        v37:Add(v19.observeTag("BrazilHitbox", function(v91) --[[ Line: 280 ]]
            -- upvalues: v23 (ref), l_RunService_0 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v86 (ref), v80 (copy), v79 (copy), v81 (copy), v16 (ref), v68 (ref), v35 (ref)
            local v92 = v23.new();
            local v93 = nil;
            local v94 = nil;
            local v95 = 0;
            local v96 = false;
            v92:Add(l_RunService_0.PostSimulation:Connect(function(v97) --[[ Line: 290 ]]
                -- upvalues: v91 (copy), v94 (ref), v10 (ref), v96 (ref), l_ReplicatedStorage_0 (ref), v95 (ref), v93 (ref), v86 (ref), v80 (ref), v79 (ref), v81 (ref), v16 (ref), v68 (ref)
                debug.profilebegin("Brazil:Hitbox");
                local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                local l_CFrame_0 = v91.CFrame;
                local l_v91_Attribute_0 = v91:GetAttribute("Focused");
                local v101 = if v94 and l_v91_Attribute_0 and l_v91_Attribute_0 <= l_workspace_ServerTimeNow_1 then v10:GetAnimals()[v94] else nil;
                if v101 then
                    if not v96 then
                        v96 = true;
                        local v102 = l_ReplicatedStorage_0.Sounds.Events.Brazil.Cube:Clone();
                        v102.Parent = v91;
                        v102:Play();
                        local l_v102_0 = v102 --[[ copy: 5 -> 17 ]];
                        v102.Ended:Once(function() --[[ Line: 303 ]]
                            -- upvalues: l_v102_0 (copy)
                            l_v102_0:Destroy();
                        end);
                    end;
                    local v104 = math.clamp((l_workspace_ServerTimeNow_1 - l_v91_Attribute_0) / 1, 0, 1);
                    v95 = math.clamp((l_workspace_ServerTimeNow_1 - (l_v91_Attribute_0 + 1)) / 1, 0, 1);
                    local l_AnimalModel_2 = v101.AnimalModel;
                    local l_VfxInstance_0 = l_AnimalModel_2:FindFirstChild("VfxInstance");
                    local l_Pivot_0 = v101.Instance:GetPivot();
                    local v108 = ((if l_VfxInstance_0 then l_VfxInstance_0.Size else l_AnimalModel_2:GetExtentsSize()) * Vector3.new(1.25, 1.5, 1.25, 0)):Min((Vector3.new(9, 18, 9, 0)));
                    l_CFrame_0 = CFrame.new(l_Pivot_0.X, l_CFrame_0.Y, l_Pivot_0.Z);
                    if not v93 then
                        v93 = v86;
                    end;
                    assert(v93);
                    local v109 = v93:Lerp(v108, v104);
                    local v110 = v93:Lerp(Vector3.new(v108.X, 0, v108.Z), v104);
                    v86 = v109;
                    for _, v112 in v80 do
                        v112.Position = (v79[v112] + Vector3.new(0, v95 * 1, 0)) * v109;
                    end;
                    for _, v114 in v81 do
                        v114.Position = v79[v114] * v110;
                    end;
                else
                    if v96 then
                        v96 = false;
                    end;
                    local v115 = math.exp(-4 * v97);
                    v86 = Vector3.new(9, 9, 9, 0):Lerp(v86, v115);
                    v93 = v86;
                    v95 = math.lerp(0, v95, v115);
                    for _, v117 in v80 do
                        v117.Position = (v79[v117] + Vector3.new(0, v95 * 1, 0)) * v86;
                    end;
                    for _, v119 in v81 do
                        v119.Position = v79[v119] * v86;
                    end;
                end;
                v16.pushPartCFrame(v68.Square, l_CFrame_0);
                debug.profileend();
            end));
            v92:Add(v35.OnClientEvent:Connect(function(v120) --[[ Line: 363 ]]
                -- upvalues: v93 (ref), v86 (ref), v94 (ref)
                v93 = v86;
                v94 = v120;
            end));
            return v92:WrapClean();
        end, {
            workspace
        }));
    end;
    local function v129() --[[ Line: 372 ]] --[[ Name: createPlayerLights ]]
        -- upvalues: v37 (ref), v19 (ref), v23 (ref), v42 (ref), l_RenderedMovingAnimals_0 (ref)
        v37:Add(v19.observeCharacters(function(_, v123) --[[ Line: 373 ]]
            -- upvalues: v23 (ref), v42 (ref)
            local v124 = v23.new();
            v124:Add(task.spawn(function() --[[ Line: 376 ]]
                -- upvalues: v123 (copy), v124 (copy), v42 (ref)
                local l_UpperTorso_0 = v123:WaitForChild("UpperTorso");
                if not l_UpperTorso_0 then
                    return;
                else
                    v124:Add((v42(l_UpperTorso_0)));
                    return;
                end;
            end));
            return v124:WrapClean();
        end));
        v37:Add(v19.observeChildren(l_RenderedMovingAnimals_0, function(v126) --[[ Line: 388 ]]
            -- upvalues: v23 (ref), v42 (ref)
            local v127 = v23.new();
            v127:Add(task.spawn(function() --[[ Line: 391 ]]
                -- upvalues: v126 (copy), v127 (copy), v42 (ref)
                local l_RootPart_0 = v126:WaitForChild("RootPart");
                if not l_RootPart_0 then
                    return;
                else
                    v127:Add((v42(l_RootPart_0)));
                    return;
                end;
            end));
            return v127:WrapClean();
        end));
    end;
    local function v202() --[[ Line: 404 ]] --[[ Name: createStage ]]
        -- upvalues: l_Lighting_0 (ref), v37 (ref), l_BrazilEvent_0 (ref), v9 (ref), l_v14_ActiveEventData_0 (copy), v68 (copy), v67 (copy), v26 (ref), v129 (copy), v121 (copy), v38 (ref), l_RunService_0 (ref), v17 (ref), v29 (ref), v30 (ref), v66 (ref), v12 (ref), v55 (copy), v19 (ref)
        l_Lighting_0.Ambient = Color3.fromRGB(50, 50, 50);
        l_Lighting_0.OutdoorAmbient = Color3.fromRGB(71, 71, 71);
        v37:Add(function() --[[ Line: 407 ]]
            -- upvalues: l_Lighting_0 (ref)
            l_Lighting_0.Ambient = Color3.fromRGB(241, 241, 241);
            l_Lighting_0.OutdoorAmbient = Color3.fromRGB(212, 212, 212);
        end);
        v37:Add(function() --[[ Line: 413 ]]
            -- upvalues: l_BrazilEvent_0 (ref)
            l_BrazilEvent_0:Stop();
        end);
        v37:Add(task.spawn(function() --[[ Line: 417 ]]
            -- upvalues: v9 (ref), l_BrazilEvent_0 (ref), l_v14_ActiveEventData_0 (ref)
            v9:WaitForAssetId("rbxassetid://136243635275209");
            l_BrazilEvent_0.SoundId = "";
            l_BrazilEvent_0.SoundId = "rbxassetid://136243635275209";
            while not l_BrazilEvent_0.IsLoaded do
                task.wait();
            end;
            l_BrazilEvent_0.TimePosition = workspace:GetServerTimeNow() - (l_v14_ActiveEventData_0.startedAt + 5);
            l_BrazilEvent_0:Play();
        end));
        v37:Clone(script.Night_Sky).Parent = l_Lighting_0;
        v68.Parent = v67;
        v26.disable(v68);
        local v130 = v37:Add(Instance.new("Color3Value"));
        v130.Value = Color3.fromRGB(0, 0, 0);
        local v131 = v37:Add(Instance.new("Color3Value"));
        v131.Value = Color3.fromRGB(0, 0, 0);
        local v132 = {};
        local v133 = {};
        local v134 = {};
        local v135 = {};
        local v136 = {};
        v26.enable(v68);
        v26.disable(v68.firestuff);
        local v137 = 1;
        local v138 = 0;
        local v139 = 0;
        v129();
        v121();
        for _, v141 in v67:GetDescendants() do
            if v141:IsA("SpotLight") then
                table.insert(v134, v141);
            elseif v141:IsA("ParticleEmitter") or v141:IsA("Beam") then
                if v141:IsDescendantOf(v68.Square) or v141:IsDescendantOf(v68.bigbeams) then
                    table.insert(v132, v141);
                else
                    table.insert(v133, v141);
                end;
                if v141:IsA("ParticleEmitter") then
                    v136[v141] = v141.TimeScale;
                    table.insert(v135, v141);
                end;
            end;
        end;
        local v142 = {};
        local v143 = {};
        local v144 = {};
        local v145 = {};
        for _, v147 in v68.initial:GetChildren() do
            local l_att1_0 = v147.att1;
            v143[l_att1_0] = v38();
            v142[l_att1_0] = v38();
            l_att1_0.WorldCFrame = CFrame.new(v142[l_att1_0]);
            table.insert(v144, l_att1_0);
            for _, v150 in l_att1_0:GetChildren() do
                table.insert(v145, v150);
            end;
        end;
        local v151 = {};
        local v152 = {};
        local v153 = {};
        for _, v155 in v68.thinbeams:GetChildren() do
            local l_att1_1 = v155.att1;
            v143[l_att1_1] = v38();
            v142[l_att1_1] = v38();
            l_att1_1.WorldCFrame = CFrame.new(v142[l_att1_1]);
            table.insert(v151, l_att1_1);
            local v157 = {};
            for _, v159 in l_att1_1:GetChildren() do
                v159.Enabled = false;
                table.insert(v157, v159);
            end;
            v152[v157] = v155.Position.Y;
            table.insert(v153, v157);
        end;
        table.sort(v153, function(v160, v161) --[[ Line: 511 ]]
            -- upvalues: v152 (copy)
            return v152[v160] < v152[v161];
        end);
        local v162 = false;
        local v163 = false;
        local v164 = 0;
        v37:Add(l_RunService_0.PostSimulation:Connect(function(v165) --[[ Line: 519 ]]
            -- upvalues: v138 (ref), v139 (ref), l_BrazilEvent_0 (ref), v135 (copy), v136 (copy), v164 (ref), v143 (copy), v38 (ref), v151 (copy), v144 (copy), v142 (copy), v153 (copy), v162 (ref), v26 (ref), v68 (ref), v145 (copy), v163 (ref), l_v14_ActiveEventData_0 (ref), v137 (ref), v17 (ref), v130 (copy), v29 (ref), v30 (ref), v131 (copy), v66 (ref), v133 (copy), v132 (copy), v134 (copy), v12 (ref)
            debug.profilebegin("Brazil:Update");
            local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
            v138 = v138 - v165;
            v139 = v139 - v165;
            local l_TimePosition_0 = l_BrazilEvent_0.TimePosition;
            local l_PlaybackLoudness_0 = l_BrazilEvent_0.PlaybackLoudness;
            local v169 = math.clamp(l_PlaybackLoudness_0 / 1000, 0, 1);
            for _, v171 in v135 do
                v171.TimeScale = math.clamp(v169 / 0.05, 1, 2) * v136[v171];
            end;
            if l_PlaybackLoudness_0 >= 320 and l_workspace_ServerTimeNow_2 - v164 >= 2 then
                v164 = l_workspace_ServerTimeNow_2;
                for v172, _ in v143 do
                    v143[v172] = v38();
                end;
            end;
            for _, v175 in {
                v151, 
                v144
            } do
                for _, v177 in v175 do
                    local v178 = v142[v177];
                    local v179 = v143[v177];
                    local v180 = v179 - v178;
                    local v181 = vector.magnitude(v180);
                    local v182 = math.lerp(35, 120, (math.clamp((l_PlaybackLoudness_0 - 100) / 200, 0, 1))) * v165;
                    if v181 < v182 then
                        v178 = v179;
                        v143[v177] = v38();
                    else
                        v178 = v178 + vector.normalize(v180) * v182;
                    end;
                    v142[v177] = v178;
                    v177.WorldCFrame = CFrame.new(v178);
                end;
            end;
            if l_TimePosition_0 >= 17 then
                local v183 = math.max((l_TimePosition_0 - 17) // #v153, 2);
                if l_TimePosition_0 >= 82 then
                    v183 = v183 + 10;
                end;
                for v184 = 1, math.min(v183, #v153) do
                    for _, v186 in v153[v184] do
                        v186.Enabled = true;
                    end;
                end;
            end;
            if l_TimePosition_0 >= 17 and not v162 then
                v26.enable(v68.firestuff);
                task.delay(5.5, function() --[[ Line: 580 ]]
                    -- upvalues: v26 (ref), v68 (ref)
                    v26.disable(v68.firestuff);
                end);
                v162 = true;
                for _, v188 in v145 do
                    v188.Enabled = false;
                end;
            end;
            if l_TimePosition_0 >= 83 and not v163 then
                v163 = true;
                v26.enable(v68.firestuff);
                task.delay(5.5, function() --[[ Line: 594 ]]
                    -- upvalues: v26 (ref), v68 (ref)
                    v26.disable(v68.firestuff);
                end);
            end;
            if v169 >= 0.11 and v139 <= 0 and math.max(l_v14_ActiveEventData_0.startedAt + 6 - workspace:GetServerTimeNow(), 0) <= 0 then
                v139 = 0.4;
                v137 = v137 == 1 and 2 or 1;
                v17(v130, TweenInfo.new(0.2), {
                    Value = if v137 == 1 then v29 else v30
                });
                v17(v131, TweenInfo.new(0.2), {
                    Value = if v137 == 1 then v30 else v29
                });
            end;
            if v66 then
                v66:AdjustSpeed((math.clamp(v169 / 0.07, 0.8, 1.5)));
            end;
            local l_Value_0 = v130.Value;
            local l_Value_1 = v131.Value;
            local v191 = ColorSequence.new(l_Value_0);
            local v192 = ColorSequence.new(l_Value_1);
            for _, v194 in v133 do
                v194.Color = v191;
            end;
            for _, v196 in v132 do
                v196.Color = v192;
            end;
            for _, v198 in v134 do
                v198.Color = l_Value_0;
            end;
            if v169 >= 0.1 and v138 <= 0 then
                v138 = 0.1;
                v12:Fov(v169 / 0.7 * 15 + 70, 0.1);
            end;
            debug.profileend();
        end));
        v37:Add((v55(5, 6, function(v199) --[[ Line: 643 ]]
            -- upvalues: v17 (ref), v130 (copy), v29 (ref), v131 (copy), v30 (ref)
            v17(v130, TweenInfo.new(v199()), {
                Value = v29
            });
            v17(v131, TweenInfo.new(v199()), {
                Value = v30
            });
        end)));
        v67.Parent = workspace;
        v37:Add(v19.observeTag("HideInBrazil", function(v200) --[[ Line: 655 ]]
            local l_Parent_0 = v200.Parent;
            v200.Parent = script;
            return function() --[[ Line: 658 ]]
                -- upvalues: v200 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 659 ]]
                    -- upvalues: v200 (ref), l_Parent_0 (ref)
                    v200.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script
        }));
    end;
    v37:Add((v55(0, 5, function(v203) --[[ Line: 666 ]]
        -- upvalues: v17 (ref), v65 (copy), v11 (ref), v37 (ref), v202 (copy), l_v14_ActiveEventData_0 (copy)
        v17(v65, TweenInfo.new(v203(), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Brightness = -1.2
        });
        v11:Run("BrazilEvent", "GrassRecolor");
        v37:Add(function() --[[ Line: 672 ]]
            -- upvalues: v11 (ref)
            v11:Stop("BrazilEvent", "GrassRecolor");
        end);
        v37:Add(task.delay(v203(), function() --[[ Line: 676 ]]
            -- upvalues: v202 (ref), v17 (ref), v65 (ref), l_v14_ActiveEventData_0 (ref)
            v202();
            v17(v65, TweenInfo.new(math.max(l_v14_ActiveEventData_0.startedAt + 6 - workspace:GetServerTimeNow(), 0), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Brightness = 0
            });
        end));
    end)));
    v37:Add(task.delay(math.max(l_v14_ActiveEventData_0.startedAt + 20 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 184 ]]
        -- upvalues: v37 (ref), v19 (ref), l_Players_0 (ref), v23 (ref), v66 (ref), l_RunService_0 (ref), l_v14_ActiveEventData_0 (copy), l_LocalPlayer_0 (ref)
        v37:Add(v19.observeCharacter(l_Players_0.LocalPlayer, function(_, v205) --[[ Line: 186 ]]
            -- upvalues: v23 (ref), v66 (ref), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
            local v206 = v23.new();
            v206:Add(task.spawn(function() --[[ Line: 189 ]]
                -- upvalues: v205 (copy), v66 (ref), v206 (copy), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                local l_Humanoid_1 = v205:WaitForChild("Humanoid");
                if not l_Humanoid_1 then
                    return;
                else
                    local l_Animator_1 = l_Humanoid_1:WaitForChild("Animator");
                    if not l_Animator_1 then
                        return;
                    else
                        local v209 = l_Animator_1:LoadAnimation(script.Dance);
                        v209.Priority = Enum.AnimationPriority.Action;
                        v66 = v209;
                        local v210 = 0;
                        v206:Add(l_RunService_0.PostSimulation:Connect(function(v211) --[[ Line: 207 ]]
                            -- upvalues: l_v14_ActiveEventData_0 (ref), v209 (copy), l_Humanoid_1 (copy), l_LocalPlayer_0 (ref), v210 (ref)
                            debug.profilebegin("Brazil:Player:Dance");
                            local _ = workspace:GetServerTimeNow();
                            if math.max(l_v14_ActiveEventData_0.startedAt + 55 - workspace:GetServerTimeNow(), 0) > 0 then
                                if not v209.IsPlaying then
                                    v209:Play();
                                end;
                                debug.profileend();
                                return;
                            else
                                if not (l_Humanoid_1.MoveDirection ~= Vector3.new(0, 0, 0, 0)) and not l_LocalPlayer_0:GetAttribute("Stealing") then
                                    if v210 < 3 then
                                        v210 = v210 + v211;
                                    elseif not v209.IsPlaying then
                                        v209:Play();
                                    end;
                                else
                                    v210 = 0;
                                    if v209.IsPlaying then
                                        v209:Stop();
                                    end;
                                end;
                                debug.profileend();
                                return;
                            end;
                        end));
                        v206:Add(function() --[[ Line: 236 ]]
                            -- upvalues: v209 (copy), v66 (ref)
                            v209:Stop();
                            v209:Destroy();
                            v66 = nil;
                        end);
                        return;
                    end;
                end;
            end));
            return v206:WrapClean();
        end));
    end));
    v15:Update();
    v13:UpdateOST();
end;
v8.OnStop = function(_) --[[ Line: 691 ]] --[[ Name: OnStop ]]
    -- upvalues: v37 (copy)
    v37:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 695 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy)
    task.spawn(pcall, function() --[[ Line: 696 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
end;
return v8;