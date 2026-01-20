local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v10 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v12 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v13 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v15 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v16 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v17 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v21 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v23 = require(l_ReplicatedStorage_0.Packages.FFlags);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v26 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v28 = require(l_ReplicatedStorage_0.Packages.Spr);
local v29 = require(l_ReplicatedStorage_0.Packages.Net);
local v30 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Digging_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Digging");
local _ = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local v35 = v29:RemoteEvent((("EventService/%*/DigStart"):format(l_Name_0)));
local v36 = v29:RemoteEvent((("EventService/%*/DigEnd"):format(l_Name_0)));
local v37 = v29:RemoteEvent((("EventService/%*/PlayGraveyardAnimation"):format(l_Name_0)));
local v38 = v29:RemoteEvent((("EventService/%*/DigCollectVFX"):format(l_Name_0)));
local v39 = v29:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v40 = v26.new();
local function _(v41, v42, v43) --[[ Line: 52 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v40 (copy)
    local v44 = v41:LoadAnimation(v42);
    (v43 or v40):Add(function() --[[ Line: 54 ]]
        -- upvalues: v44 (copy)
        v44:Stop(0);
        v44:Destroy();
    end);
    return v44;
end;
v10.OnStart = function(_) --[[ Line: 62 ]] --[[ Name: OnStart ]]
    -- upvalues: v16 (copy), l_Name_0 (copy), v40 (copy), v13 (copy), v17 (copy), v15 (copy), v21 (copy), l_Lighting_0 (copy), l_LocalPlayer_0 (copy)
    local l_v16_ActiveEventData_0 = v16:GetActiveEventData(l_Name_0);
    assert(l_v16_ActiveEventData_0);
    local function _(v48) --[[ Line: 66 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v16_ActiveEventData_0 (copy)
        return (math.max(l_v16_ActiveEventData_0.startedAt + v48 - workspace:GetServerTimeNow(), 0));
    end;
    v40:Add(function() --[[ Line: 70 ]]
        -- upvalues: v13 (ref), v17 (ref), v15 (ref)
        v13:Activate("Blink");
        v17:Update();
        v15:UpdateOST();
    end);
    v40:Clone(script.Map).Parent = workspace;
    v40:Add(v21.observeTag("HideInGraveyard", function(v50) --[[ Line: 78 ]]
        local l_Parent_0 = v50.Parent;
        v50.Parent = script;
        return function() --[[ Line: 81 ]]
            -- upvalues: v50 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 82 ]]
                -- upvalues: v50 (ref), l_Parent_0 (ref)
                v50.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v40:Add(v21.observeTag("HideInGraveyardTransparency", function(v52) --[[ Line: 88 ]]
        v52.Transparency = 1;
        return function() --[[ Line: 90 ]]
            -- upvalues: v52 (copy)
            v52.Transparency = 0;
        end;
    end, {
        workspace
    }));
    v13:Activate("Blink");
    v17:Update();
    v15:UpdateOST();
    v13:Run("GraveyardEvent", "GrassRecolor");
    v13:Run("GraveyardEvent", "WallRecolor");
    v13:Run("GraveyardEvent", "WallBottomRecolor");
    v40:Add(function() --[[ Line: 102 ]]
        -- upvalues: v13 (ref)
        v13:Stop("GraveyardEvent", "GrassRecolor");
        v13:Stop("GraveyardEvent", "WallRecolor");
        v13:Stop("GraveyardEvent", "WallBottomRecolor");
    end);
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v40:Add(function() --[[ Line: 111 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v40:Clone(script.AtmosphereGraveyard).Parent = l_Lighting_0;
    v40:Add(v21.observeCharacter(l_LocalPlayer_0, function(_, v55) --[[ Line: 118 ]]
        -- upvalues: v21 (ref), v40 (ref)
        return v21.observeChildren(v55, function(v56) --[[ Line: 119 ]]
            -- upvalues: v55 (copy), v40 (ref)
            if not v56:IsA("Tool") or v56.Name ~= "Agarrini Shovel" then
                return nil;
            else
                local l_v55_FirstChildWhichIsA_0 = v55:FindFirstChildWhichIsA("Animator", true);
                if not l_v55_FirstChildWhichIsA_0 then
                    return nil;
                else
                    local v58 = l_v55_FirstChildWhichIsA_0:LoadAnimation(script.Idle);
                    v40:Add(function() --[[ Line: 54 ]]
                        -- upvalues: v58 (copy)
                        v58:Stop(0);
                        v58:Destroy();
                    end);
                    local l_v58_0 = v58;
                    l_v58_0:Play(0);
                    return function() --[[ Line: 131 ]]
                        -- upvalues: l_v58_0 (copy)
                        l_v58_0:Stop();
                    end;
                end;
            end;
        end);
    end));
end;
v10.OnStop = function(_) --[[ Line: 138 ]] --[[ Name: OnStop ]]
    -- upvalues: v40 (copy)
    v40:Destroy();
end;
v10.OnLoad = function(_) --[[ Line: 142 ]] --[[ Name: OnLoad ]]
    -- upvalues: v26 (copy), v35 (copy), l_Digging_0 (copy), v23 (copy), l_RunService_0 (copy), v28 (copy), v21 (copy), l_LocalPlayer_0 (copy), v40 (copy), l_ContextActionService_0 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), v36 (copy), v38 (copy), v30 (copy), v39 (copy), v12 (copy), l_Debris_0 (copy), v37 (copy)
    local v62 = v26.new();
    v35.OnClientEvent:Connect(function(v63, v64) --[[ Line: 145 ]]
        -- upvalues: v62 (copy), l_Digging_0 (ref), v23 (ref), l_RunService_0 (ref), v28 (ref), v21 (ref), l_LocalPlayer_0 (ref), v26 (ref), v40 (ref), l_ContextActionService_0 (ref), v15 (ref), l_ReplicatedStorage_0 (ref), v36 (ref)
        v62:Clean();
        local l_Fill_0 = l_Digging_0.Fillbar.Fill;
        local l_Mover_0 = l_Digging_0.Fillbar.Mover;
        local l_TextLabel_0 = l_Digging_0.Fillbar.LabelHolder.TextLabel;
        local l_UIScale_0 = l_Digging_0.Fillbar.LabelHolder.UIScale;
        l_Digging_0.Fillbar.Visible = true;
        local v69 = 0;
        local l_v23_Instant_0 = v23:GetInstant("GraveyardDigDecreaseTimer", 0.7);
        local l_v23_Instant_1 = v23:GetInstant("GraveyardDigDecreaseAmount", 0.1);
        local v72 = 0;
        v62:Add(l_RunService_0.PostSimulation:Connect(function(v73) --[[ Line: 159 ]]
            -- upvalues: v72 (ref), l_v23_Instant_0 (copy), l_v23_Instant_1 (copy), v64 (copy), v69 (ref), v28 (ref), l_Fill_0 (copy), l_Mover_0 (copy)
            v72 = v72 + v73;
            if v72 < l_v23_Instant_0 then
                return;
            else
                v72 = 0;
                local v74 = l_v23_Instant_1 * v64;
                v69 = math.max(v69 - v74, 0);
                v28.target(l_Fill_0, 1, 7, {
                    Size = UDim2.fromScale(v69, 1)
                });
                v28.target(l_Mover_0, 1, 7, {
                    Position = UDim2.fromScale(v69, 0.5)
                });
                return;
            end;
        end));
        local v75 = nil;
        v62:Add(v21.observeCharacter(l_LocalPlayer_0, function(_, v77) --[[ Line: 179 ]]
            -- upvalues: v21 (ref), v26 (ref), v40 (ref), v75 (ref)
            return v21.observeChildren(v77, function(v78) --[[ Line: 180 ]]
                -- upvalues: v21 (ref), v26 (ref), v40 (ref), v75 (ref)
                if not v78:IsA("Humanoid") then
                    return nil;
                else
                    return v21.observeChildren(v78, function(v79) --[[ Line: 185 ]]
                        -- upvalues: v26 (ref), v40 (ref), v75 (ref)
                        if not v79:IsA("Animator") then
                            return nil;
                        else
                            local v80 = v26.new();
                            local v81 = v79:LoadAnimation(script.Dig);
                            v40:Add(function() --[[ Line: 54 ]]
                                -- upvalues: v81 (copy)
                                v81:Stop(0);
                                v81:Destroy();
                            end);
                            local l_v81_0 = v81;
                            v75 = l_v81_0;
                            v80:Add(function() --[[ Line: 193 ]]
                                -- upvalues: v75 (ref), l_v81_0 (copy)
                                if v75 == l_v81_0 then
                                    v75 = nil;
                                end;
                            end);
                            return v80:WrapClean();
                        end;
                    end);
                end;
            end);
        end));
        local l_v23_Instant_2 = v23:GetInstant("GraveyardDigIncreasePerClick", 0.04);
        local l_v23_Instant_3 = v23:GetInstant("GraveyardDigClickCooldown", 0.05);
        local v85 = 0;
        local v86 = 0;
        l_ContextActionService_0:BindActionAtPriority("Dig", function(_, v88, _) --[[ Line: 207 ]]
            -- upvalues: v85 (ref), l_v23_Instant_3 (copy), v69 (ref), l_v23_Instant_2 (copy), v86 (ref), l_TextLabel_0 (copy), v75 (ref), v15 (ref), l_ReplicatedStorage_0 (ref), v28 (ref), l_Fill_0 (copy), l_Mover_0 (copy), l_UIScale_0 (copy), v36 (ref), v63 (copy)
            if v88 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass;
            else
                local v90 = os.clock();
                if v90 - v85 < l_v23_Instant_3 then
                    return Enum.ContextActionResult.Sink;
                else
                    v69 = math.min(v69 + l_v23_Instant_2, 1);
                    v85 = v90;
                    v86 = v86 + 1;
                    l_TextLabel_0.Text = ("Click Anywhere! (%*)"):format((string.format("%0.3d", v86)));
                    if v75 and not v75.IsPlaying then
                        v75:Play();
                        v15:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Graveyard.Dig, nil, false);
                    end;
                    v28.target(l_Fill_0, 1, 7, {
                        Size = UDim2.fromScale(v69, 1)
                    });
                    v28.target(l_Mover_0, 1, 7, {
                        Position = UDim2.fromScale(v69, 0.5)
                    });
                    v28.stop(l_UIScale_0);
                    l_UIScale_0.Scale = 1.2;
                    v28.target(l_UIScale_0, 0.8, 5, {
                        Scale = 1
                    });
                    if v69 >= 1 then
                        v36:FireServer(v63);
                    end;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
        end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.ButtonX, Enum.UserInputType.Touch, Enum.UserInputType.MouseButton1);
        v62:Add(function() --[[ Line: 250 ]]
            -- upvalues: v28 (ref), l_UIScale_0 (copy), l_Mover_0 (copy), l_Fill_0 (copy), l_TextLabel_0 (copy)
            v28.stop(l_UIScale_0);
            v28.stop(l_Mover_0);
            v28.stop(l_Fill_0);
            l_Fill_0.Size = UDim2.fromScale(0, 1);
            l_Mover_0.Position = UDim2.fromScale(0, 0.5);
            l_UIScale_0.Scale = 1;
            l_TextLabel_0.Text = ("Click Anywhere! (%*)"):format((string.format("%0.3d", 0)));
        end);
        v62:Add(function() --[[ Line: 260 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindAction("Dig");
        end);
    end);
    v36.OnClientEvent:Connect(function() --[[ Line: 265 ]]
        -- upvalues: l_Digging_0 (ref), v62 (copy)
        l_Digging_0.Fillbar.Visible = false;
        v62:Clean();
    end);
    v38.OnClientEvent:Connect(function(v91, v92) --[[ Line: 270 ]]
        -- upvalues: v30 (ref), v15 (ref)
        local l_FirstChild_0 = script.DigVFX:FindFirstChild(v92);
        if not l_FirstChild_0 then
            return;
        else
            local v94 = l_FirstChild_0:Clone();
            v94:PivotTo(v91);
            v94.Parent = workspace;
            v30.emit(v94);
            task.delay(5, function() --[[ Line: 283 ]]
                -- upvalues: v94 (copy)
                v94:Destroy();
            end);
            local l_SFX_0 = l_FirstChild_0:FindFirstChild("SFX");
            if l_SFX_0 then
                v15:PlaySound(l_SFX_0, v91.Position + Vector3.new(0, 3, 0, 0), false);
            end;
            return;
        end;
    end);
    v39.OnClientEvent:Connect(function(v96) --[[ Line: 293 ]]
        -- upvalues: v12 (ref), v40 (ref), v30 (ref), l_Debris_0 (ref), v15 (ref), l_ReplicatedStorage_0 (ref)
        local v97 = v12:GetAnimals()[v96];
        if not v97 then
            return;
        else
            local l_AnimalModel_0 = v97.AnimalModel;
            local v99 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v97.Instance;
            local v101 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v101 or not v99 then
                return;
            else
                local v102 = v40:Clone(script.Burst);
                v102:PivotTo(v101.CFrame * CFrame.new(0, (v102.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v102.Parent = l_Instance_0;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v102;
                l_WeldConstraint_0.Part1 = v97.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v102;
                v30.emit(v102);
                l_Debris_0:AddItem(v102, 5);
                v15:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Graveyard.BrainrotHit, v101.CFrame.Position, false);
                return;
            end;
        end;
    end);
    v37.OnClientEvent:Connect(function(v104, v105) --[[ Line: 328 ]]
        -- upvalues: v12 (ref)
        local v106 = v12:GetAnimals()[v105];
        if not v106 then
            return;
        else
            local l_FirstChild_1 = script.Animations:FindFirstChild(v104);
            if not l_FirstChild_1 then
                return;
            else
                local l_AnimalModel_1 = v106.AnimalModel;
                local v109 = l_AnimalModel_1:FindFirstChild("AnimationController") or Instance.new("AnimationController", l_AnimalModel_1);
                local v110 = (v109:FindFirstChild("Animator") or Instance.new("Animator", v109)):LoadAnimation(l_FirstChild_1);
                v110.Priority = Enum.AnimationPriority.Action4;
                v110.Looped = false;
                v110:Play();
                v110.Ended:Connect(function() --[[ Line: 348 ]]
                    -- upvalues: v110 (copy)
                    v110:Stop(0);
                    v110:Destroy();
                end);
                return;
            end;
        end;
    end);
end;
return v10;