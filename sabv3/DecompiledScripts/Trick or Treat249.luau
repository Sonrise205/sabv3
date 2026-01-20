local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v10 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v15 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v17 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local v20 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v21 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local v23 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v25 = require(l_ReplicatedStorage_0.Packages.Spr);
local v26 = require(l_ReplicatedStorage_0.Packages.Net);
local v27 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local v31 = v26:RemoteEvent((("EventService/%*/BrainrotCandyAnimation"):format(l_Name_0)));
local v32 = v26:RemoteEvent((("EventService/%*/BrainrotHitAnimation"):format(l_Name_0)));
local v33 = v26:RemoteEvent((("EventService/%*/PlayerCandyAnimation"):format(l_Name_0)));
local v34 = v26:RemoteEvent((("EventService/%*/ScreenCandyAnimation"):format(l_Name_0)));
local v35 = v26:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v36 = v23.new();
local function _(v37, v38, v39) --[[ Line: 48 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v36 (copy)
    local v40 = v37:LoadAnimation(v38);
    (v39 or v36):Add(function() --[[ Line: 50 ]]
        -- upvalues: v40 (copy)
        v40:Stop(0);
        v40:Destroy();
    end);
    return v40;
end;
v8.OnStart = function(_) --[[ Line: 58 ]] --[[ Name: OnStart ]]
    -- upvalues: v14 (copy), l_Name_0 (copy), v36 (copy), v11 (copy), v15 (copy), v13 (copy), v19 (copy), v25 (copy), l_Lighting_0 (copy), v23 (copy), v21 (copy), v32 (copy), v31 (copy), v27 (copy), v34 (copy), l_LocalPlayer_0 (copy), v17 (copy), v33 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v20 (copy)
    local l_v14_ActiveEventData_0 = v14:GetActiveEventData(l_Name_0);
    assert(l_v14_ActiveEventData_0);
    local function _(v44) --[[ Line: 62 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        return (math.max(l_v14_ActiveEventData_0.startedAt + v44 - workspace:GetServerTimeNow(), 0));
    end;
    v36:Add(function() --[[ Line: 66 ]]
        -- upvalues: v11 (ref), v15 (ref), v13 (ref)
        v11:Activate("Blink");
        v15:Update();
        v13:UpdateOST();
    end);
    v36:Clone(script.Map).Parent = workspace;
    v36:Add(v19.observeTag("HideInTrickOrTreat", function(v46) --[[ Line: 74 ]]
        local l_Parent_0 = v46.Parent;
        v46.Parent = script;
        return function() --[[ Line: 77 ]]
            -- upvalues: v46 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 78 ]]
                -- upvalues: v46 (ref), l_Parent_0 (ref)
                v46.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v11:Activate("Blink");
    v15:Update();
    v13:UpdateOST();
    v11:Run("TrickOrTreatEvent", "GrassRecolor");
    v11:Run("TrickOrTreatEvent", "WallRecolor");
    v11:Run("TrickOrTreatEvent", "WallBottomRecolor");
    v36:Add(function() --[[ Line: 91 ]]
        -- upvalues: v11 (ref)
        v11:Stop("TrickOrTreatEvent", "GrassRecolor");
        v11:Stop("TrickOrTreatEvent", "WallRecolor");
        v11:Stop("TrickOrTreatEvent", "WallBottomRecolor");
    end);
    v36:Add(v19.observeTag("TrickOrTreatDoor", function(v48) --[[ Line: 97 ]]
        -- upvalues: v19 (ref), v25 (ref)
        local l_v48_Pivot_0 = v48:GetPivot();
        return v19.observeAttribute(v48, "Open", function(v50) --[[ Line: 99 ]]
            -- upvalues: v25 (ref), v48 (copy), l_v48_Pivot_0 (copy)
            if not v50 then
                v25.target(v48, 0.75, 3.5, {
                    Pivot = l_v48_Pivot_0
                });
            else
                v25.target(v48, 0.75, 3.5, {
                    Pivot = l_v48_Pivot_0 * CFrame.Angles(0, 1.5707963267948966, 0)
                });
            end;
            return nil;
        end);
    end));
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v36:Add(function() --[[ Line: 113 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v36:Clone(script.SkyTrickOrTreat).Parent = l_Lighting_0;
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v36:Add(function() --[[ Line: 122 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v36:Clone(script.AtmosphereTrickOrTreat).Parent = l_Lighting_0;
    local function v63(v53, v54, v55, v56) --[[ Line: 129 ]] --[[ Name: spawnBrainrot ]]
        -- upvalues: v23 (ref), v21 (ref), v36 (ref)
        local v57 = v23.new();
        local l_v21_AnimatedModel_0 = v21:GetAnimatedModel(v54, "Idle");
        if not l_v21_AnimatedModel_0 then
            return;
        else
            v57:Add(l_v21_AnimatedModel_0);
            task.delay(v56 - workspace:GetServerTimeNow(), function() --[[ Line: 138 ]]
                -- upvalues: v57 (copy)
                v57:Destroy();
            end);
            l_v21_AnimatedModel_0.PrimaryPart.Anchored = true;
            l_v21_AnimatedModel_0:PivotTo(v55);
            local l_Animator_0 = l_v21_AnimatedModel_0:FindFirstChild("AnimationController"):FindFirstChild("Animator");
            local l_v53_FirstChild_0 = v53:FindFirstChild(v54);
            if not l_v53_FirstChild_0 or not l_v53_FirstChild_0:IsA("Animation") then
                return;
            else
                local v61 = l_Animator_0:LoadAnimation(l_v53_FirstChild_0);
                (v57 or v36):Add(function() --[[ Line: 50 ]]
                    -- upvalues: v61 (copy)
                    v61:Stop(0);
                    v61:Destroy();
                end);
                local l_v61_0 = v61;
                l_v61_0.Priority = Enum.AnimationPriority.Action4;
                l_v61_0.Looped = false;
                task.delay(1, function() --[[ Line: 157 ]]
                    -- upvalues: l_v61_0 (copy)
                    l_v61_0:Play();
                end);
                return;
            end;
        end;
    end;
    v36:Add(v32.OnClientEvent:Connect(function(v64, v65, v66) --[[ Line: 162 ]]
        -- upvalues: v63 (copy)
        v63(script.HitAnimations, v64, v65, v66);
    end));
    v36:Add(v31.OnClientEvent:Connect(function(v67, v68, v69) --[[ Line: 166 ]]
        -- upvalues: v63 (copy), v27 (ref)
        v63(script.Animations, v67, v68, v69);
        local v70 = v68 * CFrame.new(0, 0, -3) * CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966) + Vector3.new(0, 6, 0, 0);
        local v71 = script.CandyCornThrow:Clone();
        v71.CFrame = v70;
        v71.Parent = workspace;
        task.delay(1, v27.emit, v71);
        task.delay(6, function() --[[ Line: 175 ]]
            -- upvalues: v71 (copy)
            v71:Destroy();
        end);
    end));
    v36:Add(v34.OnClientEvent:Connect(function(_) --[[ Line: 180 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v17 (ref)
        local v73 = Random.new();
        for _ = 1, 20 do
            local v75 = script.Image:Clone();
            v75.Position = UDim2.fromScale(v73:NextNumber(-0.25, 1.25), -0.25);
            v75.Rotation = v73:NextNumber(-120, 120);
            local v76 = v73:NextNumber(0.15, 0.2);
            v75.Size = UDim2.fromScale(v76, v76);
            v75.Parent = l_LocalPlayer_0.PlayerGui:FindFirstChild("Effects");
            v17(v75, TweenInfo.new(v73:NextNumber(0.75, 1.3), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Position = v75.Position + UDim2.fromScale(0, 1.5), 
                Rotation = v75.Rotation + v73:NextInteger(-3, 3) * 10
            }, true).Completed:Once(function() --[[ Line: 200 ]]
                -- upvalues: v75 (copy)
                task.wait(1);
                v75:Destroy();
            end);
        end;
    end));
    v36:Add(v33.OnClientEvent:Connect(function(v77, v78) --[[ Line: 207 ]]
        -- upvalues: v36 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v20 (ref)
        local v79 = 0;
        local v80 = script.CandyCorn:Clone();
        v80.Parent = workspace;
        local v81 = nil;
        v81 = v36:Add(l_RunService_0.PostSimulation:Connect(function(v82) --[[ Line: 218 ]]
            -- upvalues: v79 (ref), v78 (copy), v77 (copy), l_TweenService_0 (ref), v80 (copy), v20 (ref), v81 (ref), v36 (ref)
            debug.profilebegin("Trick or Treat:UpdateCandyCorn");
            v79 = v79 + v82;
            local v83 = v78.Character and v78.Character:GetPivot().Position or Vector3.new(0, 0, 0, 0);
            local v84 = v77 + (v83 - v77) * 0.5 + Vector3.new(0, 15, 0, 0);
            local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v79 / 0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
            v80:PivotTo(CFrame.new(v20.quadBezier(l_l_TweenService_0_Value_0, v77, v84, v83)));
            if l_l_TweenService_0_Value_0 >= 1 and v81 then
                v36:Remove(v81);
                v81 = nil;
                for _, v87 in v80:GetDescendants() do
                    if v87:IsA("BasePart") then
                        v87.Transparency = 1;
                    end;
                end;
                task.delay(3, function() --[[ Line: 238 ]]
                    -- upvalues: v80 (ref)
                    v80:Destroy();
                end);
            end;
            debug.profileend();
        end));
    end));
    v36:Add(v19.observeTag("TrickOrTreatEventPumpkin", function(v88) --[[ Line: 246 ]]
        -- upvalues: v23 (ref), v36 (ref), v19 (ref)
        local v89 = v23.new();
        local v90 = v89:Clone(script.Pumpkin);
        v90:ScaleTo(v88:GetAttribute("Scale") or 1);
        v90.Parent = workspace;
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v90.PrimaryPart;
        l_Weld_0.Part1 = v88;
        l_Weld_0.C0 = v90.PrimaryPart.PivotOffset;
        l_Weld_0.Parent = v90.PrimaryPart;
        local v92 = v90.AnimationController.Animator:LoadAnimation(script.Idle);
        v36:Add(function() --[[ Line: 50 ]]
            -- upvalues: v92 (copy)
            v92:Stop(0);
            v92:Destroy();
        end);
        local l_v92_0 = v92;
        l_v92_0.Priority = Enum.AnimationPriority.Idle;
        l_v92_0.Looped = true;
        l_v92_0:Play();
        local v94 = v90.AnimationController.Animator:LoadAnimation(script.Move);
        v36:Add(function() --[[ Line: 50 ]]
            -- upvalues: v94 (copy)
            v94:Stop(0);
            v94:Destroy();
        end);
        local l_v94_0 = v94;
        l_v94_0.Priority = Enum.AnimationPriority.Action;
        l_v94_0.Looped = true;
        v89:Add(v19.observeAttribute(v88, "Moving", function(v96) --[[ Line: 268 ]]
            -- upvalues: l_v94_0 (copy)
            if v96 then
                l_v94_0:Play();
            else
                l_v94_0:Stop();
            end;
            return nil;
        end));
        return v89:WrapClean();
    end, {
        workspace
    }));
end;
v8.OnStop = function(_) --[[ Line: 282 ]] --[[ Name: OnStop ]]
    -- upvalues: v36 (copy)
    v36:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 286 ]] --[[ Name: OnLoad ]]
    -- upvalues: v35 (copy), v10 (copy), v36 (copy), v27 (copy), l_Debris_0 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
    v35.OnClientEvent:Connect(function(v99) --[[ Line: 287 ]]
        -- upvalues: v10 (ref), v36 (ref), v27 (ref), l_Debris_0 (ref), v13 (ref), l_ReplicatedStorage_0 (ref)
        local v100 = v10:GetAnimals()[v99];
        if not v100 then
            return;
        else
            local l_AnimalModel_0 = v100.AnimalModel;
            local v102 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v100.Instance;
            local v104 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v104 or not v102 then
                return;
            else
                local v105 = v36:Clone(script.Burst);
                v105:PivotTo(v104.CFrame * CFrame.new(0, (v105.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v105.Parent = l_Instance_0;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v105;
                l_WeldConstraint_0.Part1 = v100.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v105;
                v27.emit(v105);
                l_Debris_0:AddItem(v105, 5);
                v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Trick or Treat"].BrainrotHit, v104.CFrame.Position, false);
                return;
            end;
        end;
    end);
end;
return v8;