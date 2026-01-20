local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Lighting");
local _ = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v9 = require(l_ReplicatedStorage_0.Packages.Observers);
local v10 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local v12 = require(l_ReplicatedStorage_0.Packages.Shake);
local _ = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local l_Name_0 = script.Name;
local v15 = v10.new();
local l_SolarFlareBeam_0 = l_ReplicatedStorage_0.Models.Events["Solar Flare"].SolarFlareBeam;
local v17 = l_SolarFlareBeam_0:Clone();
local v18 = workspace.Events["Solar Flare"];
local v19 = v18.MapFloor.Position.Y - v18.MapFloor.Size.Y / 2;
local v20 = TweenInfo.new(0.25, Enum.EasingStyle.Back);
local v21 = Color3.fromRGB(49, 49, 49);
local v22 = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v24 = nil;
local v25 = v12.new();
v25.Frequency = 0.25;
v25.Amplitude = 0.2;
v25.FadeInTime = 0.1;
v25.FadeOutTime = 0.2;
v25.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
v25.RotationInfluence = Vector3.new(1, 1, 1, 0);
local v26 = v12.new();
v26.Frequency = 0.06666666666666667;
v26.Amplitude = 0.04;
v26.Sustain = true;
v26.PositionInfluence = Vector3.new(0.75, 0.75, 0.75, 0);
v26.RotationInfluence = Vector3.new(1.25, 0.25, 0.25, 0);
v7.OnStart = function(_) --[[ Line: 61 ]] --[[ Name: OnStart ]]
    -- upvalues: v8 (copy), l_Name_0 (copy), v15 (copy)
    assert((v8:GetActiveEventData(l_Name_0)));
    local v28 = true;
    v15:Add(function() --[[ Line: 66 ]]
        -- upvalues: v28 (ref)
        v28 = false;
    end);
end;
v7.OnStop = function(_) --[[ Line: 71 ]] --[[ Name: OnStop ]]
    -- upvalues: v15 (copy)
    v15:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 75 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_SolarFlareBeam_0 (copy), v21 (copy), v15 (copy), l_RunService_0 (copy), v24 (ref), l_CurrentCamera_0 (copy), v9 (copy), v18 (copy), l_ReplicatedStorage_0 (copy), v17 (copy), l_TweenService_0 (copy), v20 (copy), v25 (copy), v12 (copy), v19 (copy), l_Debris_0 (copy), v22 (copy), v26 (copy)
    for _, v32 in l_SolarFlareBeam_0:GetChildren() do
        if v32.Name ~= "BeamEnd" and v32.Name ~= "Hitbox" then
            v32:Destroy();
        end;
    end;
    for _, v34 in l_SolarFlareBeam_0.BeamEnd:GetChildren() do
        if v34.Name ~= "MainAttachment" then
            v34:Destroy();
        end;
    end;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "SolarFlareTrail";
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanQuery = false;
    l_Part_0.CanTouch = false;
    l_Part_0.Size = Vector3.new(5, 5, 5, 0);
    l_Part_0.Color = v21;
    l_Part_0.Transparency = 0.4;
    l_Part_0.Material = Enum.Material.Concrete;
    v15:Add(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 101 ]]
        -- upvalues: v24 (ref), l_CurrentCamera_0 (ref)
        debug.profilebegin("Solar Flare:Camera CFrame Update");
        if v24 then
            l_CurrentCamera_0.CFrame = v24;
            v24 = nil;
        end;
        debug.profileend();
    end));
    local v36 = v15:Extend();
    local v37 = nil;
    local v38 = 0;
    local v39 = 0;
    local v40 = nil;
    v9.observeTag("SolarFlareBase", function(v41) --[[ Line: 116 ]]
        -- upvalues: v36 (copy), v37 (ref), v38 (ref), v39 (ref), v40 (ref)
        v36:Clean();
        v37 = v41;
        v38 = v41:GetAttribute("NumBeams") or 1;
        v39 = v41:GetAttribute("MaxBeams") or 4;
        v40 = (v41:GetAttribute("SpawnPosition") or v41.Position).Y;
        local function v42() --[[ Line: 124 ]] --[[ Name: updateBeamCount ]]
            -- upvalues: v38 (ref), v41 (copy)
            v38 = v41:GetAttribute("NumBeams") or v38;
        end;
        v36:Add(v41:GetAttributeChangedSignal("NumBeams"):Connect(v42));
        v38 = v41:GetAttribute("NumBeams") or v38;
        return function() --[[ Line: 132 ]]
            -- upvalues: v37 (ref), v36 (ref)
            v37 = nil;
            v36:Destroy();
        end;
    end, {
        v18
    });
    v9.observeTag("SolarFlareHitbox", function(v43) --[[ Line: 138 ]]
        -- upvalues: v37 (ref), l_ReplicatedStorage_0 (ref), v36 (copy), v38 (ref), v17 (ref), v15 (ref), v18 (ref), l_TweenService_0 (ref), v20 (ref), v25 (ref), v12 (ref), v24 (ref), l_CurrentCamera_0 (ref), l_Part_0 (copy), v19 (ref), l_Debris_0 (ref), v22 (ref), v26 (ref), l_RunService_0 (ref)
        while not v37 and l_ReplicatedStorage_0:GetAttribute("SolarFlareEvent") do
            task.wait();
        end;
        local v44 = v36:Extend();
        v44:AttachToInstance(v43);
        local l_v38_0 = v38;
        local v46 = v44:Add(v17.Beam1:Clone());
        v46:PivotTo(v43:GetPivot());
        v46.Anchored = false;
        v46.Name = ("Beam%*"):format(l_v38_0);
        v46.BeamEffect:Play();
        local v47 = v15:Add(Instance.new("WeldConstraint"));
        v47.Part0 = v46;
        v47.Part1 = v43;
        v47.Parent = v46;
        local _ = (l_v38_0 - 1) * 6.283185307179586 / 4;
        local l_BeamStartAttachment_0 = v46.BeamStartAttachment;
        local v50 = v15:Add(v17.BeamEnd.Beam1Attachment:Clone());
        v50.Name = ("Beam%*Attachment"):format(l_v38_0);
        local v51 = {};
        for _, v53 in v50:GetChildren() do
            if v53:IsA("Beam") then
                v53.Attachment0 = l_BeamStartAttachment_0;
                if v38 ~= 0 then
                    v51[v53] = {
                        Width0 = v53.Width0, 
                        Width1 = v53.Width1
                    };
                    v53.Width0 = 0;
                    v53.Width1 = 0;
                end;
            end;
        end;
        v50.Parent = v37;
        v46.Parent = v18;
        for v54, v55 in v51 do
            local v56 = v44:Add(l_TweenService_0:Create(v54, v20, v55));
            v56.Completed:Once(function() --[[ Line: 204 ]]
                -- upvalues: v56 (copy)
                v56:Destroy();
            end);
            v56:Play();
        end;
        local v57 = v44:Add(v25:Clone());
        v57:Start();
        v57:BindToRenderStep(v12.NextRenderName(), Enum.RenderPriority.Camera.Value + 1, function(v58, v59) --[[ Line: 213 ]]
            -- upvalues: v24 (ref), l_CurrentCamera_0 (ref)
            if not v24 then
                v24 = l_CurrentCamera_0.CFrame;
            end;
            local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
            l_l_CurrentCamera_0_0.CFrame = l_l_CurrentCamera_0_0.CFrame * (CFrame.new(v58) * CFrame.Angles(v59.X, v59.Y, v59.Z));
        end);
        local function v64(v61) --[[ Line: 220 ]] --[[ Name: createTrail ]]
            -- upvalues: v44 (copy), l_Part_0 (ref), v19 (ref), l_Debris_0 (ref), v18 (ref), l_TweenService_0 (ref), v22 (ref)
            local v62 = v44:Add(l_Part_0:Clone());
            v62.CFrame = CFrame.new(v61.X, v19 - 1, v61.Z) * CFrame.Angles(math.random() * 6.283185307179586, 0, math.random() * 6.283185307179586);
            l_Debris_0:AddItem(v62, 0.9);
            v62.Parent = v18;
            local v63 = v44:Add(l_TweenService_0:Create(v62, v22, {
                Transparency = 1
            }));
            v63.Completed:Once(function() --[[ Line: 229 ]]
                -- upvalues: v63 (copy)
                v63:Destroy();
            end);
            v63:Play();
        end;
        local _ = math.random(1, 100000);
        local v66 = v44:Add(v26:Clone());
        v66:Start();
        v66:BindToRenderStep(v12.NextRenderName(), Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 239 ]]
            -- upvalues: v66 (copy), l_CurrentCamera_0 (ref), v43 (copy), v24 (ref)
            local v67, v68 = v66:Update();
            local v69 = math.clamp(1 - math.max(0, (l_CurrentCamera_0.CFrame.Position - v43.Position).Magnitude - 25) / 75, 0, 1);
            v69 = v69 * v69;
            if v69 < 0.01 then
                return;
            else
                if not v24 then
                    v24 = l_CurrentCamera_0.CFrame;
                end;
                local v70 = v67 * v69;
                local v71 = v68 * v69;
                local l_l_CurrentCamera_0_1 = l_CurrentCamera_0;
                l_l_CurrentCamera_0_1.CFrame = l_l_CurrentCamera_0_1.CFrame * (CFrame.new(v70) * CFrame.Angles(v71.X, v71.Y, v71.Z));
                return;
            end;
        end);
        local l_Position_0 = v43.Position;
        v44:Add(l_RunService_0.PostSimulation:Connect(function() --[[ Line: 262 ]]
            -- upvalues: v43 (copy), l_Position_0 (ref), v64 (copy)
            debug.profilebegin("Solar Flare:Trail");
            local l_Position_1 = v43.Position;
            if (l_Position_1 - l_Position_0).Magnitude >= 1.5 then
                v64(l_Position_1);
                l_Position_0 = l_Position_1;
            end;
            debug.profileend();
        end));
        return function() --[[ Line: 273 ]]
            -- upvalues: v44 (copy)
            v44:Destroy();
        end;
    end, {
        v18
    });
end;
return v7;