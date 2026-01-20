local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ServerScriptService");
local l_SoundService_0 = game:GetService("SoundService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v7 = require(l_ReplicatedStorage_0.Packages.Trove);
local v8 = require(l_ReplicatedStorage_0.Shared.RegisterTool);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.FishingController);
local _ = require(l_ReplicatedStorage_0.Shared.PID);
local v12 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v13 = require(l_ReplicatedStorage_0.Packages.Net);
local v14 = require(l_ReplicatedStorage_0.Packages.Spring);
local _ = workspace.CurrentCamera;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Fishing_0 = l_LocalPlayer_0.PlayerGui.ToolGuis.Fishing;
local v18 = v13:RemoteEvent("FishingRod.Cast");
local v19 = v13:RemoteEvent("FishingRod.Cancel");
local v20 = v13:RemoteEvent("FishingRod.SetupBobber");
local v21 = v13:RemoteEvent("FishingRod.MinigameClick");
local v22 = v13:RemoteEvent("FishingRod.Reward");
local v23 = v13:RemoteEvent("FishingRod.BiteGot");
local _ = Random.new();
local v25 = v14.new();
v25.Speed = 45;
v25.Damper = 0.8;
local v26 = v14.new(0.1);
v26.Speed = 2;
v26.Damper = 1;
local v27 = v14.new(70);
v27.Speed = 30;
v27.Damper = 1;
local l_Mover_0 = l_Fishing_0.Fillbar.Mover;
local v29 = false;
local v30 = false;
l_RunService_0.Heartbeat:Connect(function() --[[ Line: 53 ]]
    -- upvalues: v29 (ref), l_Mover_0 (copy), v25 (copy), v27 (copy), v26 (copy), v30 (ref)
    if v29 then
        l_Mover_0.Rotation = v25.p;
        v27.t = 80 + 10 * v26.p;
        v30 = true;
        return;
    else
        if v30 then
            v30 = false;
            v27.t = 70;
            v27.p = 70;
            v27.v = 0;
        end;
        return;
    end;
end);
local function _(v31) --[[ Line: 69 ]] --[[ Name: QuadInOut_Clamped ]]
    if v31 >= 0.85 then
        return 1;
    else
        local v32 = v31 / 0.85;
        if v32 < 0.5 then
            return 2 * v32 * v32;
        else
            return -1 + (4 - 2 * v32) * v32;
        end;
    end;
end;
local v34 = {};
v8("FishingRod", function(v35) --[[ Line: 86 ]]
    -- upvalues: v7 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy), v26 (copy), l_SoundService_0 (copy), l_Fishing_0 (copy), l_TweenService_0 (copy), v29 (ref), v21 (copy), v19 (copy), v18 (copy), l_UserInputService_0 (copy), v34 (copy)
    local v36 = v7.new();
    local v37 = v36:Extend();
    local v38 = false;
    local v39 = 0;
    local v40 = 0;
    local v41 = 0;
    local l_Humanoid_0 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("Humanoid");
    local v43 = {};
    local function v51() --[[ Line: 101 ]] --[[ Name: reloadAnimations ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_Humanoid_0 (copy), v43 (copy)
        local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("EquippedFishingRod");
        local v45 = script:FindFirstChild(l_l_LocalPlayer_0_Attribute_0) or script["Ice Rod"];
        for _, v47 in v45:GetChildren() do
            local l_Name_0 = v47.Name;
            local v49 = l_Humanoid_0:LoadAnimation(v47);
            v49.Looped = v47:GetAttribute("Looped");
            v49.Priority = v47:GetAttribute("Priority");
            local v50 = v43[l_Name_0];
            if v50 then
                if v50.IsPlaying and v50.Looped then
                    v49:Play();
                end;
                v50:Stop();
            end;
            v43[l_Name_0] = v49;
        end;
    end;
    v51();
    v36:Add(l_LocalPlayer_0:GetAttributeChangedSignal("EquippedFishingRod"):Connect(v51));
    v36:Add(l_RunService_0.Stepped:Connect(function() --[[ Line: 124 ]]
        -- upvalues: v35 (copy), v26 (ref), v43 (copy)
        local l_v35_FirstChild_0 = v35:FindFirstChild("Reeling", true);
        if l_v35_FirstChild_0 then
            l_v35_FirstChild_0.PlaybackSpeed = 0.9 + v26.p * 0.1;
            l_v35_FirstChild_0.Volume = 0.3 + v26.p * 0.3;
        end;
        v43.Reeling:AdjustSpeed(v26.p);
    end));
    local function v55() --[[ Line: 134 ]] --[[ Name: updateMinigameHits ]]
        -- upvalues: v39 (ref), v35 (copy), v41 (ref), v26 (ref), l_SoundService_0 (ref), l_Fishing_0 (ref), l_TweenService_0 (ref)
        if not v39 then
            return;
        else
            local v53 = v39 / v35:GetAttribute("minigameHP");
            if v41 < v39 then
                local v54 = 0.2 + 0.6 * v53;
                v26.p = math.clamp(v26.p + v54, 0.1, 1.3);
                v26.t = 0.1;
                l_SoundService_0:PlayLocalSound(l_Fishing_0.Click);
            end;
            l_TweenService_0:Create(l_Fishing_0.Fillbar.Fill, TweenInfo.new(0.2), {
                Size = UDim2.fromScale(v53, 1)
            }):Play();
            l_TweenService_0:Create(l_Fishing_0.Fillbar.Mover, TweenInfo.new(0.25), {
                Position = UDim2.fromScale(math.lerp(0, 0.875, v53), 0.5)
            }):Play();
            v41 = v39;
            return;
        end;
    end;
    local function v56() --[[ Line: 163 ]] --[[ Name: updateMinigameTotalClicks ]]
        -- upvalues: v40 (ref), l_Fishing_0 (ref), l_TweenService_0 (ref)
        if not v40 then
            return;
        else
            if string.format("%.3d", v40) == 0 then
                l_Fishing_0.Fillbar.TextLabel.Text = "Click Anywhere!";
            else
                l_Fishing_0.Fillbar.TextLabel.Text = ("Click Anywhere! (x%*)"):format(v40);
            end;
            l_Fishing_0.Fillbar.TextLabel.Size = UDim2.fromScale(0.568, 0.75);
            l_TweenService_0:Create(l_Fishing_0.Fillbar.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {
                Size = UDim2.fromScale(0.7, 0.85)
            }):Play();
            return;
        end;
    end;
    v36:Add(v35:GetAttributeChangedSignal("minigameHits"):Connect(function() --[[ Line: 183 ]]
        -- upvalues: v39 (ref), v35 (copy), v55 (copy)
        v39 = v35:GetAttribute("minigameHits");
        v55();
    end));
    v36:Add(v35:GetAttributeChangedSignal("minigameTotalHits"):Connect(function() --[[ Line: 189 ]]
        -- upvalues: v40 (ref), v35 (copy), v56 (copy)
        v40 = v35:GetAttribute("minigameTotalHits");
        v56();
    end));
    v36:Add(v35:GetAttributeChangedSignal("minigame"):Connect(function() --[[ Line: 194 ]]
        -- upvalues: v35 (copy), v43 (copy), l_Fishing_0 (ref), v29 (ref)
        if not v35:GetAttribute("minigame") then
            v43.Reeling:Stop();
            l_Fishing_0.Fillbar.Visible = false;
            v29 = false;
            return;
        else
            v29 = true;
            v43.Reeling:Play();
            l_Fishing_0.Fillbar.Visible = true;
            return;
        end;
    end));
    v36:Add(v35:GetAttributeChangedSignal("casted"):Connect(function() --[[ Line: 206 ]]
        -- upvalues: v35 (copy), v26 (ref), v43 (copy)
        if v35:GetAttribute("casted") and not v35:GetAttribute("minigame") then
            v26.p = 0;
            v26.v = 0;
            v26.t = 0;
            v43.Reeling:Play();
            return;
        else
            if not v35:GetAttribute("casted") and not v35:GetAttribute("minigame") then
                v43.Reeling:Stop();
            end;
            return;
        end;
    end));
    v36:Add(v35.Equipped:Connect(function() --[[ Line: 218 ]]
        -- upvalues: v38 (ref), l_Fishing_0 (ref), v43 (copy)
        v38 = true;
        l_Fishing_0.Enabled = true;
        l_Fishing_0.Fillbar.Visible = false;
        l_Fishing_0.CastBar.Enabled = false;
        v43.Idle:Play();
    end));
    v36:Add(v35.Unequipped:Connect(function() --[[ Line: 227 ]]
        -- upvalues: v38 (ref), l_Fishing_0 (ref), v37 (copy), v43 (copy)
        v38 = false;
        l_Fishing_0.Enabled = false;
        v37:Destroy();
        for _, v58 in v43 do
            v58:Stop();
        end;
    end));
    local v59 = false;
    local v60 = -1;
    local function v67() --[[ Line: 241 ]] --[[ Name: onMouseDown ]]
        -- upvalues: l_LocalPlayer_0 (ref), v35 (copy), v60 (ref), v39 (ref), v40 (ref), v56 (copy), v55 (copy), v21 (ref), v19 (ref), v59 (ref), l_Fishing_0 (ref), v37 (copy), v43 (copy), v38 (ref), v18 (ref)
        local l_HumanoidRootPart_0 = l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
        if v35:GetAttribute("minigame") then
            if time() - v60 < 0.1 then
                return;
            else
                v60 = time();
                v39 = v39 + 1;
                v40 = v40 + 1;
                v56();
                v55();
                v21:FireServer();
                return;
            end;
        elseif v35:GetAttribute("casted") then
            v19:FireServer();
            return;
        elseif v35:GetAttribute("castCooldown") then
            return;
        elseif v59 then
            return;
        else
            v59 = true;
            l_Fishing_0.CastBar.Enabled = true;
            l_Fishing_0.CastBar.Adornee = l_HumanoidRootPart_0;
            v37:Add(function() --[[ Line: 280 ]]
                -- upvalues: l_Fishing_0 (ref)
                l_Fishing_0.CastBar.Enabled = false;
            end);
            local v62 = time();
            local v63 = nil;
            local v64 = v35:GetAttribute("Luck") or 1;
            v37:Add(v35:GetAttributeChangedSignal("Luck"):Connect(function() --[[ Line: 289 ]]
                -- upvalues: v64 (ref), v35 (ref)
                v64 = v35:GetAttribute("Luck") or 1;
            end));
            v43.HoldingCast:Play();
            v43.HoldingCast:AdjustSpeed(1);
            v37:Add(function() --[[ Line: 296 ]]
                -- upvalues: v43 (ref)
                v43.HoldingCast:Stop();
            end);
            while v59 and v38 do
                v63 = (time() - v62) % 1;
                if v63 > 0.5 then
                    v63 = 1 - v63;
                end;
                local v65 = v63 / 0.5;
                if v65 >= 0.85 then
                    v63 = 1;
                else
                    local v66 = v65 / 0.85;
                    v63 = if v66 < 0.5 then 2 * v66 * v66 else -1 + (4 - 2 * v66) * v66;
                end;
                l_Fishing_0.CastBar.Bar.Bar.Fill.Size = UDim2.fromScale(1, v63);
                l_Fishing_0.CastBar.Bar.Luck.Size = UDim2.fromScale(8, 0.14 + 0.05 * v63);
                l_Fishing_0.CastBar.Bar.Luck.Text = ("LUCK: %*x"):format(math.floor(math.lerp(1, v64, v63) * 100) / 100);
                if not v43.HoldingCast.IsPlaying then
                    v43.HoldingCast:Play();
                    v43.HoldingCast.TimePosition = v43.HoldingCast.Length - 0.01;
                    v43.HoldingCast:AdjustSpeed(0);
                end;
                task.wait();
            end;
            v37:Destroy();
            if not v38 then
                return;
            else
                v43.Cast:Play();
                v18:FireServer(v63);
                return;
            end;
        end;
    end;
    local function v68() --[[ Line: 336 ]] --[[ Name: onMouseUp ]]
        -- upvalues: v59 (ref), v37 (copy)
        v59 = false;
        v37:Destroy();
    end;
    v36:Add(v35.Activated:Connect(v67));
    v36:Add(v35.Deactivated:Connect(v68));
    v36:Add(l_UserInputService_0.InputBegan:Connect(function(v69, v70) --[[ Line: 343 ]]
        -- upvalues: v67 (copy)
        if v70 then
            return;
        else
            if v69.UserInputType == Enum.UserInputType.Touch then
                v67();
            end;
            return;
        end;
    end));
    v36:Add(l_UserInputService_0.InputEnded:Connect(function(v71, v72) --[[ Line: 349 ]]
        -- upvalues: v59 (ref), v37 (copy)
        if v72 then
            return;
        else
            if v71.UserInputType == Enum.UserInputType.Touch then
                v59 = false;
                v37:Destroy();
            end;
            return;
        end;
    end));
    v34[v35] = {
        animTracks = v43
    };
    v36:Add(function() --[[ Line: 362 ]]
        -- upvalues: v29 (ref), v38 (ref), l_Fishing_0 (ref), v34 (ref), v35 (copy), v43 (copy)
        v29 = false;
        v38 = false;
        l_Fishing_0.Enabled = false;
        v34[v35] = nil;
        for _, v74 in v43 do
            v74:Stop();
        end;
    end);
    return v36:WrapClean();
end);
v20.OnClientEvent:Connect(function(v75, v76) --[[ Line: 375 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), v12 (copy), v10 (copy)
    local l_PrimaryPart_0 = v75.PrimaryPart;
    l_PrimaryPart_0.AssemblyLinearVelocity = v76;
    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
    l_BodyVelocity_0.MaxForce = Vector3.new(0, 0, 0, 0);
    l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0, 0);
    l_BodyVelocity_0.Parent = l_PrimaryPart_0;
    local _ = require(l_ReplicatedStorage_0.Shared.PID).new(-16, 16, 36, 1.5, 0.1);
    local v80 = workspace:FindFirstChild("FishingMap") and workspace:FindFirstChild("FishingMap"):QueryDescendants("#CatchZone") or {};
    local v81 = nil;
    v81 = l_RunService_0.Stepped:Connect(function(_) --[[ Line: 393 ]]
        -- upvalues: v75 (copy), v81 (ref), v80 (copy), v12 (ref), l_PrimaryPart_0 (copy), l_BodyVelocity_0 (copy), v10 (ref), l_RunService_0 (ref)
        if not v75 or not v75:IsDescendantOf(workspace) then
            v81:Disconnect();
            return;
        else
            local v83 = nil;
            for _, v85 in v80 do
                if v12.isPointInVolume(l_PrimaryPart_0.CFrame.Position, v85.CFrame, v85.Size + Vector3.new(0, 1.5, 0, 0)) then
                    v83 = v85;
                    break;
                end;
            end;
            if v83 then
                l_BodyVelocity_0.MaxForce = Vector3.new(32 + l_PrimaryPart_0.AssemblyMass * 32, 1000000000, 32 + l_PrimaryPart_0.AssemblyMass * 32);
                local l_Y_0 = v10:WaterSurfacePoint(l_PrimaryPart_0.Position).Y;
                l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0, 0);
                l_RunService_0.RenderStepped:Once(function() --[[ Line: 414 ]]
                    -- upvalues: l_PrimaryPart_0 (ref), l_Y_0 (copy)
                    l_PrimaryPart_0.CFrame = CFrame.new(l_PrimaryPart_0.Position.X, l_Y_0, l_PrimaryPart_0.Position.Z);
                end);
                return;
            else
                return;
            end;
        end;
    end);
end);
v22.OnClientEvent:Connect(function(v87, v88, v89, _, v91, _) --[[ Line: 425 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v34 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), v9 (copy)
    if v87 == l_LocalPlayer_0 then
        v34[v88].animTracks.Catch:Play();
    end;
    local v93 = v87.Character and v87.Character:FindFirstChild("HumanoidRootPart");
    if not v93 then
        return;
    else
        local v94 = v93.Position - Vector3.new(0, 3, 0, 0);
        local v95 = v94:Lerp(v89, 0.3) + Vector3.new(0, 20, 0, 0);
        local v96 = l_ReplicatedStorage_0.Models.ToolsExtras.FishingCatch:Clone();
        v96.CFrame = CFrame.new(0, 10000, 0);
        v96.Transparency = 1;
        v96.Parent = workspace.Debris;
        local function _(v97, v98, v99, v100) --[[ Line: 446 ]] --[[ Name: Bezier ]]
            local v101 = 1 - v100;
            return v97 * (v101 * v101) + v99 * (2 * v101 * v100) + v98 * (v100 * v100);
        end;
        local v103 = nil;
        local v104 = 0;
        local v105 = nil;
        v105 = l_RunService_0.PreRender:Connect(function(v106) --[[ Line: 457 ]]
            -- upvalues: v104 (ref), v105 (ref), v96 (copy), v89 (copy), v94 (copy), v95 (copy), v9 (ref), v91 (copy), v103 (ref)
            v104 = v104 + v106;
            if v104 >= 0.5 then
                if v105 then
                    v105:Disconnect();
                end;
                task.wait(2);
                v96:Destroy();
                return;
            else
                local l_v89_0 = v89;
                local l_v94_0 = v94;
                local l_v95_0 = v95;
                local v110 = v104 / 0.5;
                local v111 = 1 - v110;
                local v112 = l_v89_0 * (v111 * v111) + l_v95_0 * (2 * v111 * v110) + l_v94_0 * (v110 * v110);
                l_v94_0 = v89;
                l_v95_0 = v94;
                v110 = v95;
                v111 = v104 / 0.5 + 0.01;
                local v113 = 1 - v111;
                l_v89_0 = l_v94_0 * (v113 * v113) + v110 * (2 * v113 * v111) + l_v95_0 * (v111 * v111);
                v96.CFrame = CFrame.lookAt(v112, l_v89_0);
                l_v94_0 = v9:GetAnimals()[v91];
                if not l_v94_0 then
                    return;
                else
                    l_v95_0 = l_v94_0.AnimalModel;
                    if not v103 then
                        v103 = l_v95_0:GetScale();
                    end;
                    l_v95_0:ScaleTo((math.max(v103 * v104 / 0.5, 0.01)));
                    l_v95_0:PivotTo(CFrame.new(v112));
                    return;
                end;
            end;
        end);
        return;
    end;
end);
v23.OnClientEvent:Connect(function(v114, _) --[[ Line: 489 ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Character_0 = v114.Character;
    assert(l_Character_0);
    local l_Head_0 = l_Character_0:FindFirstChild("Head");
    assert(l_Head_0);
    local v118 = script.FishingGotBite:Clone();
    v118.Adornee = l_Head_0;
    v118.Parent = l_Head_0;
    v118.Exclamation:Play();
    local l_TextLabel_0 = v118.TextLabel;
    l_TextLabel_0.Rotation = 15;
    l_TextLabel_0.Size = UDim2.fromScale(0, 0);
    l_TextLabel_0.Position = UDim2.fromScale(0.5, 1);
    l_TweenService_0:Create(l_TextLabel_0, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Rotation = 0, 
        Size = UDim2.fromScale(1, 1)
    }):Play();
    task.delay(2, function() --[[ Line: 507 ]]
        -- upvalues: l_TextLabel_0 (copy), l_TweenService_0 (ref), v118 (copy)
        if l_TextLabel_0:IsDescendantOf(game) then
            l_TweenService_0:Create(l_TextLabel_0, TweenInfo.new(2), {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(l_TextLabel_0.UIStroke, TweenInfo.new(2), {
                Transparency = 1
            }):Play();
        end;
        task.wait(2);
        v118:Destroy();
    end);
end);