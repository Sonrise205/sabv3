local l_Debris_0 = game:GetService("Debris");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v6 = require(l_ReplicatedStorage_0.Packages.Shake);
local v7 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
local _ = workspace.CurrentCamera;
local _ = l_PlayerGui_0:WaitForChild("ToolsScreen");
local _ = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v15 = require(l_Packages_0.Net);
local v16 = Random.new();
local v17 = {};
local function _(v18) --[[ Line: 33 ]] --[[ Name: SpinPart ]]
    -- upvalues: l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 34 ]]
        -- upvalues: v18 (copy), l_TweenService_0 (ref)
        while v18.Parent do
            local v19 = l_TweenService_0:Create(v18, TweenInfo.new(0.6), {
                Orientation = v18.Orientation + Vector3.new(math.random(0, 180), 0, math.random(0, 180))
            });
            v19:Play();
            v19.Completed:Wait();
        end;
    end);
end;
local l_TweenService_1 = game:GetService("TweenService");
local function v35(v22, _) --[[ Line: 96 ]] --[[ Name: CreateJet ]]
    -- upvalues: l_TweenService_1 (copy), l_Debris_0 (copy)
    local v24 = v22 + Vector3.new(0, 75, 0, 0);
    local v25 = 6.283185307179586 * math.random();
    local v26 = CFrame.Angles(0, v25, 0);
    local v27 = v26 * Vector3.new(0, 0, 300, 0);
    local v28 = v26 * Vector3.new(0, 0, -2500, 0);
    local v29 = v24 + v27;
    local v30 = v24 + v28;
    local v31 = script["F22 Bombing Jet"]:Clone();
    local l_Torso_0 = v31:WaitForChild("Torso");
    l_Torso_0.CFrame = CFrame.new(v29, v24);
    v31.Parent = workspace;
    local v33 = l_TweenService_1:Create(l_Torso_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        CFrame = CFrame.new(v24, v30)
    });
    v33:Play();
    v33.Completed:Wait();
    task.wait(2.5);
    local v34 = l_TweenService_1:Create(l_Torso_0, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        CFrame = CFrame.new(v30, v30 + (v30 - v24))
    });
    v34:Play();
    v34.Completed:Wait();
    l_Debris_0:AddItem(v31);
end;
local function v56(v36, v37, _) --[[ Line: 152 ]] --[[ Name: DropBombsAt ]]
    -- upvalues: v16 (copy), l_TweenService_1 (copy), l_Debris_0 (copy), v6 (copy), v7 (copy)
    local v39 = v37 + Vector3.new(0, 20, 0, 0);
    for _, v41 in v36 do
        task.delay(v41.TweenTime, function() --[[ Line: 157 ]]
            -- upvalues: v41 (copy), v39 (copy), v16 (ref), l_TweenService_1 (ref), l_Debris_0 (ref), v6 (ref), v7 (ref)
            local l_FinalPos_0 = v41.FinalPos;
            local l_Scale_0 = v41.Scale;
            local v44 = Vector3.new(l_FinalPos_0.X, v39.Y + 40, l_FinalPos_0.Z);
            local v45 = script.Bomb:Clone();
            v45.Position = v44;
            local v46 = v16:NextNumber(0.95, 1.05);
            local l_Unit_0 = (l_FinalPos_0 - v44).Unit;
            v45.CFrame = CFrame.new(v44, v44 + l_Unit_0);
            v45.Parent = workspace;
            local l_MissileFull_0 = v45.MissileFull;
            l_MissileFull_0.PlaybackSpeed = l_MissileFull_0.PlaybackSpeed * v46;
            v45.MissileFull:Play();
            l_MissileFull_0 = l_FinalPos_0 + Vector3.new(0, 0.5, 0, 0);
            local v49 = l_TweenService_1:Create(v45, TweenInfo.new(0.7 / v46, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                Position = l_MissileFull_0
            });
            v49:Play();
            v49.Completed:Connect(function() --[[ Line: 185 ]]
                -- upvalues: l_MissileFull_0 (copy), l_Scale_0 (copy), l_Debris_0 (ref), v45 (copy), v6 (ref), v7 (ref)
                local v50 = script.greenExplosion:Clone();
                v50:PivotTo(CFrame.new(l_MissileFull_0 + Vector3.new(0, 3, 0, 0)));
                v50:ScaleTo(l_Scale_0 * 1.1);
                v50.Parent = workspace;
                local _ = v50:WaitForChild("greenExplosion");
                for _, v53 in v50:GetDescendants() do
                    if v53:IsA("ParticleEmitter") then
                        v53:Emit(v53:GetAttribute("EmitCount") or 10);
                    end;
                end;
                l_Debris_0:AddItem(v50, 8);
                v45.Transparency = 1;
                l_Debris_0:AddItem(v45, 5);
                task.spawn(function() --[[ Line: 209 ]]
                    -- upvalues: v6 (ref), v7 (ref)
                    local v54 = v6.new();
                    v54.Amplitude = 0.4;
                    v54.Frequency = 0.05;
                    v54.FadeInTime = 2;
                    v54.FadeOutTime = 2;
                    v54.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
                    v54.RotationInfluence = Vector3.new(1.25, 0, 4, 0);
                    local _ = v7.BindShakeToCamera(v54, workspace.CurrentCamera);
                    v54:Start();
                end);
            end);
        end);
    end;
end;
v15:RemoteEvent("UseItem").OnClientEvent:Connect(function(v57, v58) --[[ Line: 228 ]]
    -- upvalues: v35 (copy)
    if v57 ~= "CreateRadioctivatePuddles" then
        return;
    else
        local l_MousePosition_0 = v58.MousePosition;
        local l_JetUUID_0 = v58.JetUUID;
        v35(l_MousePosition_0, l_JetUUID_0);
        return;
    end;
end);
v15:RemoteEvent("UseItem").OnClientEvent:Connect(function(v61, v62) --[[ Line: 235 ]]
    -- upvalues: v56 (copy)
    if v61 ~= "DropBombsAt" then
        return;
    else
        local l_FinalPositions_0 = v62.FinalPositions;
        local l_MousePosition_1 = v62.MousePosition;
        local l_JetUUID_1 = v62.JetUUID;
        v56(l_FinalPositions_0, l_MousePosition_1, l_JetUUID_1);
        return;
    end;
end);
v15:RemoteEvent("UseItem").OnClientEvent:Connect(function(v66, v67) --[[ Line: 243 ]]
    -- upvalues: l_Debris_0 (copy)
    if v66 ~= "LockCircle" then
        return;
    else
        local l_Pos_0 = v67.Pos;
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Size = Vector3.new(37, 0.10000000149011612, 37, 0);
        l_Part_0.Color = Color3.fromRGB(255, 0, 0);
        l_Part_0.Material = Enum.Material.Neon;
        l_Part_0.Position = l_Pos_0;
        l_Part_0.Transparency = 0.3;
        l_Part_0.CanCollide = false;
        l_Part_0.CanQuery = false;
        l_Part_0.CanTouch = false;
        l_Part_0.Anchored = true;
        Instance.new("CylinderMesh").Parent = l_Part_0;
        l_Debris_0:AddItem(l_Part_0, 7);
        l_Part_0.Parent = workspace;
        return;
    end;
end);
return v17;