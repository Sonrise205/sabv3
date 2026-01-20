local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v5 = require(l_ReplicatedStorage_0.Packages.Net);
local v6 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v9 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v10 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v11 = require(l_ReplicatedStorage_0.Packages.Observers);
local v12 = require(l_ReplicatedStorage_0.Packages.Trove);
local v13 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_UFO_0 = l_ReplicatedStorage_0.Models.Events.UFO.UFO;
local v15 = v5:RemoteEvent("EventService/UFO/AbductionBurst");
local v16 = v5:RemoteEvent("EventService/UFO/Spawned");
local v17 = v12.new();
local function v25() --[[ Line: 27 ]] --[[ Name: playUFOSpawnFX ]]
    -- upvalues: l_Players_0 (copy), v10 (copy), v6 (copy)
    local l_PlayerGui_0 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    if not l_PlayerGui_0 then
        return;
    else
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.IgnoreGuiInset = true;
        l_ScreenGui_0.ResetOnSpawn = false;
        l_ScreenGui_0.DisplayOrder = 10000;
        l_ScreenGui_0.Name = "UFO_SpawnFlash";
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Size = UDim2.fromScale(1, 1);
        l_Frame_0.BackgroundColor3 = Color3.fromRGB(60, 255, 120);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.Parent = l_ScreenGui_0;
        l_ScreenGui_0.Parent = l_PlayerGui_0;
        local v21 = v10(l_Frame_0, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.4
        }, false);
        local v22 = v10(l_Frame_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
        }, false);
        v21:Play();
        v21.Completed:Once(function() --[[ Line: 52 ]]
            -- upvalues: v22 (copy), l_ScreenGui_0 (copy)
            v22:Play();
            v22.Completed:Once(function() --[[ Line: 54 ]]
                -- upvalues: l_ScreenGui_0 (ref)
                l_ScreenGui_0:Destroy();
            end);
        end);
        local v23 = v6.BumpS:Clone();
        v23.Sustain = true;
        local v24 = v6.BindShakeToCamera(v23, workspace.CurrentCamera);
        v23:Start();
        task.delay(0.3, function() --[[ Line: 63 ]]
            -- upvalues: v23 (copy), v24 (copy)
            v23:StopSustain();
            task.delay(0.2, function() --[[ Line: 65 ]]
                -- upvalues: v23 (ref), v24 (ref)
                v23:Destroy();
                v24();
            end);
        end);
        return;
    end;
end;
local _ = function() --[[ Line: 72 ]] --[[ Name: createUFOVisuals ]]
    -- upvalues: v17 (copy), v11 (copy), l_UFO_0 (copy), l_ReplicatedStorage_0 (copy), v10 (copy), l_RunService_0 (copy)
    local v26 = v17:Extend();
    v26:Add(v11.observeTag("GalaxyUFO", function(v27) --[[ Line: 75 ]]
        -- upvalues: v26 (copy), l_UFO_0 (ref), l_ReplicatedStorage_0 (ref), v10 (ref), l_RunService_0 (ref)
        if not v27:IsA("BasePart") then
            return nil;
        else
            local v28 = v26:Extend();
            local v29 = v28:Clone(l_UFO_0);
            for _, v31 in v29:GetDescendants() do
                if v31:IsA("BasePart") then
                    v31.Anchored = true;
                end;
            end;
            local v32 = l_ReplicatedStorage_0.Sounds.Events.UFO.Flying:Clone();
            v32.Parent = v27;
            v32:Play();
            v29.Parent = workspace;
            local l_v29_FirstChild_0 = v29:FindFirstChild("BeamPart", true);
            local v34 = l_v29_FirstChild_0 and l_v29_FirstChild_0:FindFirstChild("att0");
            local v35 = l_v29_FirstChild_0 and l_v29_FirstChild_0:FindFirstChild("att1");
            if not l_v29_FirstChild_0 or not v34 or not v35 or not v34:IsA("Attachment") or not v35:IsA("Attachment") then
                v28:Destroy();
                return nil;
            else
                local v36 = {};
                for _, v38 in v35:GetChildren() do
                    if v38:IsA("Beam") then
                        v38.Attachment0 = v34;
                        v38.Attachment1 = v35;
                        v38.Enabled = false;
                        table.insert(v36, v38);
                    end;
                end;
                local l_Position_0 = v35.Position;
                local v40 = nil;
                local function v41() --[[ Line: 116 ]] --[[ Name: stopTween ]]
                    -- upvalues: v40 (ref)
                    if v40 then
                        v40:Cancel();
                        v40 = nil;
                    end;
                end;
                local _ = function(v42) --[[ Line: 123 ]] --[[ Name: setBeams ]]
                    -- upvalues: v36 (copy)
                    for _, v44 in v36 do
                        v44.Enabled = v42;
                    end;
                end;
                local function _(v46, v47) --[[ Line: 129 ]] --[[ Name: tweenAtt1 ]]
                    -- upvalues: v40 (ref), v10 (ref), v35 (copy)
                    if v40 then
                        v40:Cancel();
                        v40 = nil;
                    end;
                    v40 = v10(v35, TweenInfo.new(v47, Enum.EasingStyle.Quad), {
                        Position = v46
                    });
                    return v40;
                end;
                local function v58(v49) --[[ Line: 135 ]] --[[ Name: setState ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), v27 (copy), v36 (copy), v35 (copy), v34 (copy), l_Position_0 (copy), v40 (ref), v10 (ref)
                    if v49 == "down" then
                        local v50 = l_ReplicatedStorage_0.Sounds.Events.UFO.Abducting:Clone();
                        v50.Parent = v27;
                        v50:Play();
                        for _, v52 in v36 do
                            v52.Enabled = true;
                        end;
                        v35.Position = v34.Position;
                        local l_l_Position_0_0 = l_Position_0;
                        if v40 then
                            v40:Cancel();
                            v40 = nil;
                        end;
                        v40 = v10(v35, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            Position = l_l_Position_0_0
                        });
                        return;
                    else
                        if v49 == "off" then
                            local l_Position_1 = v34.Position;
                            if v40 then
                                v40:Cancel();
                                v40 = nil;
                            end;
                            v40 = v10(v35, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                                Position = l_Position_1
                            });
                            local l_v40_0 = v40;
                            if l_v40_0 then
                                l_v40_0.Completed:Wait();
                            end;
                            for _, v57 in v36 do
                                v57.Enabled = false;
                            end;
                            v35.Position = l_Position_0;
                        end;
                        return;
                    end;
                end;
                v28:Add(v27:GetAttributeChangedSignal("BeamState"):Connect(function() --[[ Line: 154 ]]
                    -- upvalues: v27 (copy), v58 (copy)
                    local l_v27_Attribute_0 = v27:GetAttribute("BeamState");
                    if typeof(l_v27_Attribute_0) == "string" then
                        v58(l_v27_Attribute_0);
                    end;
                end));
                v28:Add(l_RunService_0.PostSimulation:Connect(function() --[[ Line: 161 ]]
                    -- upvalues: v29 (copy), v27 (copy), v28 (copy)
                    debug.profilebegin("UFO:MoveUFO");
                    if v29.PrimaryPart ~= nil and v27.Parent ~= nil then
                        v29:PivotTo(v27.CFrame);
                    else
                        v28:Destroy();
                    end;
                    debug.profileend();
                end));
                v28:Add(v41);
                v28:Add(task.spawn(function() --[[ Line: 173 ]]
                    -- upvalues: v27 (copy), v58 (copy), v36 (copy), v35 (copy), l_Position_0 (copy)
                    local l_v27_Attribute_1 = v27:GetAttribute("BeamState");
                    if typeof(l_v27_Attribute_1) == "string" then
                        v58(l_v27_Attribute_1);
                        return;
                    else
                        for _, v62 in v36 do
                            v62.Enabled = false;
                        end;
                        v35.Position = l_Position_0;
                        return;
                    end;
                end));
                return function() --[[ Line: 183 ]]
                    -- upvalues: v28 (copy)
                    v28:Destroy();
                end;
            end;
        end;
    end));
end;
v7.OnStart = function(_) --[[ Line: 189 ]] --[[ Name: OnStart ]]
    -- upvalues: v17 (copy), v11 (copy), l_UFO_0 (copy), l_ReplicatedStorage_0 (copy), v10 (copy), l_RunService_0 (copy), v15 (copy), v13 (copy), v16 (copy), v25 (copy), v9 (copy), v8 (copy)
    local v65 = v17:Extend();
    v65:Add(v11.observeTag("GalaxyUFO", function(v66) --[[ Line: 75 ]]
        -- upvalues: v65 (copy), l_UFO_0 (ref), l_ReplicatedStorage_0 (ref), v10 (ref), l_RunService_0 (ref)
        if not v66:IsA("BasePart") then
            return nil;
        else
            local v67 = v65:Extend();
            local v68 = v67:Clone(l_UFO_0);
            for _, v70 in v68:GetDescendants() do
                if v70:IsA("BasePart") then
                    v70.Anchored = true;
                end;
            end;
            local v71 = l_ReplicatedStorage_0.Sounds.Events.UFO.Flying:Clone();
            v71.Parent = v66;
            v71:Play();
            v68.Parent = workspace;
            local l_v68_FirstChild_0 = v68:FindFirstChild("BeamPart", true);
            local v73 = l_v68_FirstChild_0 and l_v68_FirstChild_0:FindFirstChild("att0");
            local v74 = l_v68_FirstChild_0 and l_v68_FirstChild_0:FindFirstChild("att1");
            if not l_v68_FirstChild_0 or not v73 or not v74 or not v73:IsA("Attachment") or not v74:IsA("Attachment") then
                v67:Destroy();
                return nil;
            else
                local v75 = {};
                for _, v77 in v74:GetChildren() do
                    if v77:IsA("Beam") then
                        v77.Attachment0 = v73;
                        v77.Attachment1 = v74;
                        v77.Enabled = false;
                        table.insert(v75, v77);
                    end;
                end;
                local l_Position_2 = v74.Position;
                local v79 = nil;
                local function v80() --[[ Line: 116 ]] --[[ Name: stopTween ]]
                    -- upvalues: v79 (ref)
                    if v79 then
                        v79:Cancel();
                        v79 = nil;
                    end;
                end;
                local _ = function(v81) --[[ Line: 123 ]] --[[ Name: setBeams ]]
                    -- upvalues: v75 (copy)
                    for _, v83 in v75 do
                        v83.Enabled = v81;
                    end;
                end;
                local function _(v85, v86) --[[ Line: 129 ]] --[[ Name: tweenAtt1 ]]
                    -- upvalues: v79 (ref), v10 (ref), v74 (copy)
                    if v79 then
                        v79:Cancel();
                        v79 = nil;
                    end;
                    v79 = v10(v74, TweenInfo.new(v86, Enum.EasingStyle.Quad), {
                        Position = v85
                    });
                    return v79;
                end;
                local function v97(v88) --[[ Line: 135 ]] --[[ Name: setState ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), v66 (copy), v75 (copy), v74 (copy), v73 (copy), l_Position_2 (copy), v79 (ref), v10 (ref)
                    if v88 == "down" then
                        local v89 = l_ReplicatedStorage_0.Sounds.Events.UFO.Abducting:Clone();
                        v89.Parent = v66;
                        v89:Play();
                        for _, v91 in v75 do
                            v91.Enabled = true;
                        end;
                        v74.Position = v73.Position;
                        local l_l_Position_2_0 = l_Position_2;
                        if v79 then
                            v79:Cancel();
                            v79 = nil;
                        end;
                        v79 = v10(v74, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            Position = l_l_Position_2_0
                        });
                        return;
                    else
                        if v88 == "off" then
                            local l_Position_3 = v73.Position;
                            if v79 then
                                v79:Cancel();
                                v79 = nil;
                            end;
                            v79 = v10(v74, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                                Position = l_Position_3
                            });
                            local l_v79_0 = v79;
                            if l_v79_0 then
                                l_v79_0.Completed:Wait();
                            end;
                            for _, v96 in v75 do
                                v96.Enabled = false;
                            end;
                            v74.Position = l_Position_2;
                        end;
                        return;
                    end;
                end;
                v67:Add(v66:GetAttributeChangedSignal("BeamState"):Connect(function() --[[ Line: 154 ]]
                    -- upvalues: v66 (copy), v97 (copy)
                    local l_v66_Attribute_0 = v66:GetAttribute("BeamState");
                    if typeof(l_v66_Attribute_0) == "string" then
                        v97(l_v66_Attribute_0);
                    end;
                end));
                v67:Add(l_RunService_0.PostSimulation:Connect(function() --[[ Line: 161 ]]
                    -- upvalues: v68 (copy), v66 (copy), v67 (copy)
                    debug.profilebegin("UFO:MoveUFO");
                    if v68.PrimaryPart ~= nil and v66.Parent ~= nil then
                        v68:PivotTo(v66.CFrame);
                    else
                        v67:Destroy();
                    end;
                    debug.profileend();
                end));
                v67:Add(v80);
                v67:Add(task.spawn(function() --[[ Line: 173 ]]
                    -- upvalues: v66 (copy), v97 (copy), v75 (copy), v74 (copy), l_Position_2 (copy)
                    local l_v66_Attribute_1 = v66:GetAttribute("BeamState");
                    if typeof(l_v66_Attribute_1) == "string" then
                        v97(l_v66_Attribute_1);
                        return;
                    else
                        for _, v101 in v75 do
                            v101.Enabled = false;
                        end;
                        v74.Position = l_Position_2;
                        return;
                    end;
                end));
                return function() --[[ Line: 183 ]]
                    -- upvalues: v67 (copy)
                    v67:Destroy();
                end;
            end;
        end;
    end));
    v17:Add(v15.OnClientEvent:Connect(function(v102) --[[ Line: 192 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v13 (ref), v17 (ref)
        local v103 = script.Effects.ufoemit:Clone();
        v103:PivotTo(CFrame.new(v102));
        local v104 = l_ReplicatedStorage_0.Sounds.Events.UFO.Burst:Clone();
        v104.Parent = v103;
        v104:Play();
        v103.Parent = workspace;
        v13.emit(v103);
        v17:Add(v103);
        task.wait(1.5);
        v103:Destroy();
    end));
    v17:Add(v16.OnClientEvent:Connect(function(_) --[[ Line: 208 ]]
        -- upvalues: v25 (ref)
        v25();
    end));
    l_ReplicatedStorage_0:SetAttribute("UFOEvent", true);
    v17:Add(function() --[[ Line: 213 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v9 (ref), v8 (ref)
        l_ReplicatedStorage_0:SetAttribute("UFOEvent", nil);
        v9:Update();
        v8:UpdateOST();
    end);
end;
v7.OnStop = function(_) --[[ Line: 220 ]] --[[ Name: OnStop ]]
    -- upvalues: v17 (copy)
    v17:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 224 ]] --[[ Name: OnLoad ]]

end;
return v7;