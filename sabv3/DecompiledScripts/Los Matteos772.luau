local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local v14 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v15 = require(l_ReplicatedStorage_0.Packages.EvLightning);
local v16 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v17 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v18 = require(l_ReplicatedStorage_0.Shared.MapInformation);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Shared.Snapshot);
local _ = require(script.TreeRootAnimator);
local v23 = require(l_ReplicatedStorage_0.Packages.Shake);
local v24 = require(l_ReplicatedStorage_0.Packages.Trove);
local v25 = require(l_ReplicatedStorage_0.Packages.Net);
local v26 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local l_Children_0 = script.Clouds:GetChildren();
local l_CloudsStart_0 = workspace.Events["Los Matteos"].CloudsStart;
local l_CloudsEnd_0 = workspace.Events["Los Matteos"].CloudsEnd;
local v31 = v25:RemoteEvent("EventService/Los Matteos/CreateLightningBolt");
local v32 = RaycastParams.new();
v32.FilterDescendantsInstances = {
    workspace.Events["Los Matteos"].Areas
};
v32.FilterType = Enum.RaycastFilterType.Include;
local v33 = v24.new();
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
l_Part_0.Material = Enum.Material.Neon;
l_Part_0.Color = Color3.fromRGB(96, 234, 255);
local v35 = v23.new();
v35.Amplitude = 3;
v35.Frequency = 0.1;
v35.FadeInTime = 0;
v35.FadeOutTime = 0.6;
v35.PositionInfluence = Vector3.new(0.5, 0.5, 0.5, 0);
v35.RotationInfluence = Vector3.new(2.5, 0.5, 0.5, 0);
local function v52() --[[ Line: 65 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v33 (copy), l_RunService_0 (copy), v19 (copy)
    local v36 = v33:Extend();
    local v37 = table.create(4);
    v36:Add(function() --[[ Line: 77 ]]
        -- upvalues: v37 (copy)
        table.clear(v37);
    end);
    local v38 = 0;
    v36:Add(l_RunService_0.PreRender:Connect(function(v39) --[[ Line: 82 ]]
        -- upvalues: v38 (ref), v37 (copy)
        debug.profilebegin("Los Matteos Event");
        v38 = v38 + v39;
        for v40, v41 in v37 do
            if v41.target and v41.targetAttachment then
                v41.beam.First.Enabled = true;
                v41.beam.Second.Enabled = true;
                local v42 = math.clamp(v38 - v40 + 1, 0, 1);
                local l_WorldPosition_0 = v41.beam.WorldPosition;
                v41.targetAttachment.Position = l_WorldPosition_0 + (v41.target:GetPivot().Position - l_WorldPosition_0) * v42;
            end;
        end;
        debug.profileend();
    end));
    v36:Add(v19.observeTag("LosMatteosPlayerVFX", function(v44) --[[ Line: 104 ]]
        -- upvalues: v37 (copy), v19 (ref)
        local v45 = script.PlayerVFX.Beam:Clone();
        v45.Parent = v44;
        local v46 = script.PlayerVFX.Torso:Clone();
        v46.Parent = v44;
        local l_v44_Attribute_0 = v44:GetAttribute("LosMatteosIndex");
        v37[l_v44_Attribute_0] = {
            beam = v45, 
            target = nil
        };
        local v51 = v19.observeTag("LosMatteosPlayerVFX", function(v48) --[[ Line: 117 ]]
            -- upvalues: v44 (copy), v45 (copy), v37 (ref)
            if v48 == v44 then
                return nil;
            elseif v48:GetAttribute("LosMatteosIndex") ~= v44:GetAttribute("LosMatteosIndex") % 3 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v45.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v50 = v37[v44:GetAttribute("LosMatteosIndex")];
                v50.target = v48;
                v50.beam.First.Attachment0 = l_Attachment_0;
                v50.beam.Second.Attachment0 = l_Attachment_0;
                v50.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 136 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 141 ]]
            -- upvalues: v46 (copy), v45 (copy), v51 (copy), v37 (ref), l_v44_Attribute_0 (copy)
            v46:Destroy();
            v45:Destroy();
            v51();
            v37[l_v44_Attribute_0] = nil;
        end;
    end));
end;
v7.OnStart = function(_) --[[ Line: 151 ]] --[[ Name: OnStart ]]
    -- upvalues: v12 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v18 (copy), v32 (copy), v33 (copy), v8 (copy), v11 (copy), v10 (copy), v16 (copy), v19 (copy), l_Players_0 (copy), l_CloudsStart_0 (copy), l_CloudsEnd_0 (copy), l_Children_0 (copy), l_RunService_0 (copy), v14 (copy), v31 (copy), v35 (copy), v17 (copy), v26 (copy), l_Debris_0 (copy), v15 (copy), l_Part_0 (copy), v52 (copy)
    local l_v12_ActiveEventData_0 = v12:GetActiveEventData(l_Name_0);
    assert(l_v12_ActiveEventData_0);
    local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("LosMatteosSpawn");
    if not l_l_ReplicatedStorage_0_Attribute_0 then
        l_l_ReplicatedStorage_0_Attribute_0 = v18.MapCenter.Position;
        local v56 = workspace:Raycast(l_l_ReplicatedStorage_0_Attribute_0, Vector3.new(-0, -25, -0, -0), v32);
        if v56 then
            l_l_ReplicatedStorage_0_Attribute_0 = Vector3.new(l_l_ReplicatedStorage_0_Attribute_0.X, v56.Position.Y, l_l_ReplicatedStorage_0_Attribute_0.Z);
        end;
    end;
    l_ReplicatedStorage_0:SetAttribute("LosMatteosEvent", true);
    v33:Add(function() --[[ Line: 165 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v8 (ref), v11 (ref), v10 (ref)
        l_ReplicatedStorage_0:SetAttribute("LosMatteosEvent", nil);
        v8:Activate("Blink");
        v11:Update();
        v10:UpdateOST();
        v10:UpdateAmbience();
    end);
    local function _(v57) --[[ Line: 174 ]] --[[ Name: calculateTimeLeftFor ]]
        -- upvalues: l_v12_ActiveEventData_0 (copy)
        return l_v12_ActiveEventData_0.startedAt + v57 - workspace:GetServerTimeNow();
    end;
    local function v85(v59, v60, v61) --[[ Line: 178 ]] --[[ Name: growTree ]]
        -- upvalues: v33 (ref), v16 (ref)
        local function v72(v62, v63, v64, v65) --[[ Line: 179 ]] --[[ Name: growPart ]]
            -- upvalues: v33 (ref), v61 (copy), v16 (ref)
            local l_CFrame_0 = v62.CFrame;
            local v67 = Vector3.new(v65 and 0 or v63.X, 0, v65 and 0 or v63.Z);
            local v68 = l_CFrame_0 * CFrame.new(0, -(v63.Y - v67.Y) / 2, 0);
            v62.Size = v67;
            v62.CFrame = v68;
            local l_Transparency_0 = v62.Transparency;
            v62.Transparency = 1;
            v33:Add(task.delay(if v61 then v61(v64) else v64, function() --[[ Line: 190 ]]
                -- upvalues: v62 (copy), l_Transparency_0 (copy), v61 (ref), v64 (copy), v16 (ref), v63 (copy), l_CFrame_0 (copy)
                v62.Transparency = l_Transparency_0;
                local v70 = if v61 then v61(v64 + 1) else 1;
                local v71 = TweenInfo.new(v70, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                v16(v62, v71, {
                    Size = v63
                });
                v16(v62, v71, {
                    CFrame = l_CFrame_0
                });
            end));
        end;
        local v73 = {};
        local v74 = 1e999;
        local v75 = -1e999;
        for _, v77 in v59:GetDescendants() do
            if v77:IsA("BasePart") and v77.Transparency < 1 then
                table.insert(v73, v77);
                v74 = math.min(v74, v77.Position.Y);
                v75 = math.max(v75, v77.Position.Y);
            end;
        end;
        table.sort(v73, function(v78, v79) --[[ Line: 216 ]]
            return v78.Position.Y < v79.Position.Y;
        end);
        local v80 = v75 - v74;
        for _, v82 in v73 do
            local v83 = v82.Color.R * 255 < 90;
            local v84 = (v82.Position.Y - v74) / v80 * v60;
            if v83 then
                v84 = v84 + 0.2;
            end;
            v72(v82, v82.Size, v84, v83);
        end;
    end;
    v33:Add(task.spawn(function() --[[ Line: 232 ]]
        -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), l_l_ReplicatedStorage_0_Attribute_0 (ref)
        v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Los Matteos"].Grow, l_l_ReplicatedStorage_0_Attribute_0, false);
    end));
    v33:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 3 - workspace:GetServerTimeNow(), function() --[[ Line: 236 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v33 (ref), v11 (ref), v10 (ref), l_l_ReplicatedStorage_0_Attribute_0 (ref), v85 (copy), l_v12_ActiveEventData_0 (copy)
        l_ReplicatedStorage_0:SetAttribute("LosMatteosEventNightTime", true);
        v33:Add(function() --[[ Line: 238 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref)
            l_ReplicatedStorage_0:SetAttribute("LosMatteosEventNightTime", nil);
        end);
        v11:Update();
        v10:UpdateOST();
        v10:UpdateAmbience();
        local v86 = v33:Clone(script.Tree);
        v86:PivotTo(CFrame.new(l_l_ReplicatedStorage_0_Attribute_0));
        if l_ReplicatedStorage_0:GetAttribute("LosMatteosEventIsRainbow") then
            for _, v88 in v86.Leaves:GetDescendants() do
                v88:SetAttribute("RainbowIgnoreTransparency", true);
                v88:AddTag("RainbowModel");
            end;
        end;
        v86.Parent = workspace;
        v85(v86, 5, function(v89) --[[ Line: 258 ]]
            -- upvalues: l_v12_ActiveEventData_0 (ref)
            local v90 = v89 + 3;
            return l_v12_ActiveEventData_0.startedAt + v90 - workspace:GetServerTimeNow();
        end);
    end));
    v33:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 7 - workspace:GetServerTimeNow(), function() --[[ Line: 263 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0.Sounds.Events["Los Matteos"].Roots:Play();
    end));
    v33:Add(function() --[[ Line: 267 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0.Sounds.Events["Los Matteos"].Roots:Stop();
    end);
    v33:Add(l_ReplicatedStorage_0:GetAttributeChangedSignal("LosMatteosGrowing"):Connect(function() --[[ Line: 271 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0.Sounds.Events["Los Matteos"].Roots.Looped = l_ReplicatedStorage_0:GetAttribute("LosMatteosGrowing") ~= false;
    end));
    v33:Add(v19.observeTag("LosMatteos_Tree", function(v91) --[[ Line: 275 ]]
        -- upvalues: v85 (copy)
        v85(v91, 1);
        return nil;
    end));
    v33:Add(v19.observeCharacter(l_Players_0.LocalPlayer, function(_, v93) --[[ Line: 280 ]]
        -- upvalues: v33 (ref), v19 (ref)
        return v33:Add(v19.observeAttribute(v93, "Matteo_CollectedTree", function(v94) --[[ Line: 281 ]]
            -- upvalues: v33 (ref), v19 (ref)
            if not v94 then
                return nil;
            else
                return v33:Add(v19.observeTag("LosMatteos_TreePrompt", function(v95) --[[ Line: 287 ]]
                    v95.Enabled = false;
                    return function() --[[ Line: 291 ]]
                        -- upvalues: v95 (copy)
                        v95.Enabled = true;
                    end;
                end, {
                    workspace
                }));
            end;
        end));
    end));
    local v96 = {};
    local function v118() --[[ Line: 307 ]] --[[ Name: startClouds ]]
        -- upvalues: l_CloudsStart_0 (ref), l_CloudsEnd_0 (ref), v33 (ref), l_Children_0 (ref), v16 (ref), v96 (copy), l_RunService_0 (ref), v14 (ref)
        local function v107(v97, v98) --[[ Line: 311 ]] --[[ Name: spawnCloud ]]
            -- upvalues: l_CloudsStart_0 (ref), l_CloudsEnd_0 (ref), v33 (ref), l_Children_0 (ref), v16 (ref), v96 (ref)
            local l_Position_0 = l_CloudsStart_0.Position;
            local l_Size_0 = l_CloudsStart_0.Size;
            local l_Position_1 = l_CloudsEnd_0.Position;
            local v102 = v33:Clone(l_Children_0[math.random(1, #l_Children_0)]);
            v102.Transparency = 1;
            v102.CFrame = CFrame.new(l_Position_0.X + math.random(-l_Size_0.X * 0.5, l_Size_0.X * 0.5), l_Position_0.Y, l_Position_0.Z + (v97 or 0) * 30 + (v98 or 0));
            local v103 = Vector3.new(v102.Position.X, l_Position_0.Y, l_Position_1.Z);
            if vector.dot(l_Position_1 - l_Position_0, v103 - v102.Position) < 0 then
                return;
            else
                v102.Parent = workspace.Camera;
                local v104 = math.clamp(50 / v102.Size.Magnitude, 5, 15) * (math.random(80, 120) / 100);
                local v105 = {
                    instance = v102, 
                    speed = v104, 
                    startPos = v102.Position, 
                    endPos = v103
                };
                local v106 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, (v98 or 0) * 0.1 + (math.abs(v97 or 0) + 1) * 0.5);
                v33:Add(v16(v102, v106, {
                    Transparency = 0
                }));
                table.insert(v96, v105);
                return v105;
            end;
        end;
        local v108 = 0;
        for v109 = 1, 50 do
            v107(v108, v109);
            if v109 % 3 == 1 then
                v108 = v108 + 1;
            end;
        end;
        v33:Add(l_RunService_0.PostSimulation:Connect(function(v110) --[[ Line: 361 ]]
            -- upvalues: v96 (ref), v33 (ref), v16 (ref), v107 (copy), v14 (ref)
            debug.profilebegin("Los Matteos:Clouds");
            for v111 = #v96, 1, -1 do
                local v112 = v96[v111];
                local l_instance_0 = v112.instance;
                local l_Position_2 = l_instance_0.Position;
                local v115 = vector.normalize(v112.endPos - l_Position_2);
                local v116 = vector.magnitude(v112.endPos - l_Position_2);
                local v117 = v112.speed * v110;
                if v116 < v117 then
                    l_Position_2 = v112.endPos;
                    table.remove(v96, v111);
                    v33:Add(v16(l_instance_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                        Transparency = 1
                    })).Completed:Once(function() --[[ Line: 381 ]]
                        -- upvalues: v33 (ref), l_instance_0 (copy)
                        v33:Remove(l_instance_0);
                    end);
                    v107();
                else
                    l_Position_2 = l_Position_2 + v115 * v117;
                end;
                v14.pushPartCFrame(l_instance_0, CFrame.lookAt(l_Position_2, l_Position_2 + v115));
            end;
            debug.profileend();
        end));
    end;
    v33:Add(task.delay(l_v12_ActiveEventData_0.startedAt + 8 - workspace:GetServerTimeNow(), function() --[[ Line: 397 ]]
        -- upvalues: v33 (ref)
        v33:Clone(script.RainWeather).Parent = workspace;
    end));
    v33:Add(v31.OnClientEvent:Connect(function(v119, v120, v121) --[[ Line: 402 ]]
        -- upvalues: v35 (ref), v33 (ref), v17 (ref), v96 (copy), v10 (ref), l_ReplicatedStorage_0 (ref), v16 (ref), v26 (ref), l_Debris_0 (ref), v15 (ref), l_Part_0 (ref)
        local v122 = Random.new(v119);
        local l_Magnitude_0 = (workspace.CurrentCamera.CFrame.Position - v120).Magnitude;
        if l_Magnitude_0 <= 75 then
            local v124 = v35:Clone();
            local v125 = (1 - l_Magnitude_0 / 75 * 0.5) ^ 2;
            v124.Amplitude = v124.Amplitude * v125;
            v124.RotationInfluence = v124.RotationInfluence * v125;
            v33:Add(v17.BindShakeToCamera(v124));
            v124:Start();
        end;
        local v126 = {};
        for _, v128 in v96 do
            if ((v128.instance.Position - v120) * Vector3.new(1, 0, 1, 0)).Magnitude < 100 then
                table.insert(v126, v128.instance);
            end;
        end;
        local v129 = nil;
        if #v126 > 0 then
            local v130 = v126[v122:NextInteger(1, #v126)];
            v129 = v130.Position;
            v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Los Matteos"]["Lightning Strike"], v130.Position, false);
            local l_Color_0 = v130.Color;
            v130.Color = Color3.fromRGB(90, 109, 161);
            v16(v130, TweenInfo.new(1, Enum.EasingStyle.Sine), {
                Color = l_Color_0
            });
            for _, v133 in script.CloudParticles:GetChildren() do
                local v134 = v133:Clone();
                v134.Parent = v130;
                v26.emit(v134);
                l_Debris_0:AddItem(v134, 2);
            end;
        else
            v129 = v120 + Vector3.new(0, 70, 0, 0);
        end;
        local v135 = v15.create(v129, v120, {
            bends = 4, 
            thickness = 1, 
            max_depth = 1, 
            fork_bends = 1, 
            fork_chance = 30, 
            decay = 3, 
            material = Enum.Material.Neon
        });
        local l_Model_0 = Instance.new("Model");
        v135.model = l_Model_0;
        l_Model_0.Name = "LightningBolt";
        local l_v135_Lines_0 = v135:GetLines();
        table.sort(l_v135_Lines_0, function(v138, v139) --[[ Line: 468 ]]
            return v138.origin.Y > v139.origin.Y;
        end);
        local l_Y_0 = l_v135_Lines_0[#l_v135_Lines_0].origin.Y;
        local l_Y_1 = l_v135_Lines_0[1].origin.Y;
        local v142 = l_Y_1 - l_Y_0;
        local v143 = v135.random:NextInteger(10, 20) / 100;
        local v144 = table.create(#l_v135_Lines_0);
        for v145, v146 in l_v135_Lines_0 do
            if v146.goal.Y >= v120.Y then
                local v147 = math.max((l_Y_1 - v146.origin.Y) / v142 * v143, 0);
                local v148 = l_Part_0:Clone();
                v148.Size = Vector3.new(v135.thickness - v146.depth * 2 * 0.1, v135.thickness - v146.depth * 2 * 0.1, (v146.origin - v146.goal).Magnitude + 0.5);
                v148.CFrame = CFrame.new((v146.goal + v146.origin) / 2, v146.goal);
                v148.Transparency = 1;
                v148.Parent = l_Model_0;
                v144[v145] = v148;
                v16(v148, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, v147), {
                    Transparency = v146.transparency
                });
            end;
        end;
        task.delay(v143 + 0.05, function() --[[ Line: 499 ]]
            -- upvalues: v121 (copy), v120 (copy), v26 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v144 (copy), v16 (ref), v135 (copy), l_Model_0 (copy)
            local v149 = if v121 then script.StrikeBrainrot:Clone() else script.Strike:Clone();
            v149.Position = v120;
            v149.Parent = workspace;
            v26.emit(v149);
            if v121 then
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Los Matteos"].Hit, v120, false);
            else
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Los Matteos"].HitNothing, v120, false);
            end;
            for _, v151 in v144 do
                task.spawn(function() --[[ Line: 513 ]]
                    -- upvalues: v151 (copy), v16 (ref)
                    v151.Transparency = 0;
                    task.wait(0.1);
                    v151.Transparency = 1;
                    task.wait(0.1);
                    v16(v151, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true), {
                        Transparency = 0.4
                    });
                end);
            end;
            task.delay(v135.options.decay or 1, function() --[[ Line: 524 ]]
                -- upvalues: v149 (copy), l_Model_0 (ref), v135 (ref)
                v149:Destroy();
                l_Model_0:Destroy();
                v135.destroyed = true;
            end);
        end);
        l_Model_0.Parent = workspace.CurrentCamera;
        v135.drew = true;
    end));
    v118();
    v33:Add(task.spawn(function() --[[ Line: 537 ]]
        -- upvalues: v52 (ref)
        v52();
    end));
end;
v7.OnStop = function(_) --[[ Line: 542 ]] --[[ Name: OnStop ]]
    -- upvalues: v33 (copy)
    v33:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 546 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy)
    task.spawn(pcall, function() --[[ Line: 547 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
end;
return v7;