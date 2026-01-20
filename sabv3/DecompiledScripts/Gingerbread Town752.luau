local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v12 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v13 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.FFlags);
local v18 = require(l_ReplicatedStorage_0.Packages.Trove);
local v19 = require(l_ReplicatedStorage_0.Packages.Timer);
local v20 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local v22 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v25 = v20:RemoteEvent((("EventService/%*/CollectCandy"):format(l_Name_0)));
local v26 = v20:RemoteEvent((("EventService/%*/DestroyRings"):format(l_Name_0)));
local v27 = v20:RemoteEvent((("EventService/%*/CreateRings"):format(l_Name_0)));
local v28 = v20:RemoteEvent((("EventService/%*/UpdateRide"):format(l_Name_0)));
local v29 = v20:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v30 = v18.new();
local function _(v31, v32, v33) --[[ Line: 40 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v30 (copy)
    local v34 = v31:LoadAnimation(v32);
    (v33 or v30):Add(function() --[[ Line: 42 ]]
        -- upvalues: v34 (copy)
        v34:Stop(0);
        v34:Destroy();
    end);
    return v34;
end;
v7.OnStart = function(_) --[[ Line: 50 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), l_Lighting_0 (copy), v30 (copy), v28 (copy), v27 (copy), l_LocalPlayer_0 (copy), v26 (copy), v18 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy), v13 (copy), v8 (copy), v25 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v22 (copy), v19 (copy), v14 (copy), v12 (copy)
    assert((v11:GetActiveEventData(l_Name_0)));
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v30:Add(function() --[[ Line: 57 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v30:Clone(script.NightSky).Parent = l_Lighting_0;
    local v38 = v30:Clone(script.GingerbreadTown);
    local _ = v30:Extend();
    local v40 = nil;
    local v41 = nil;
    local function _(v42, v43, v44) --[[ Line: 71 ]] --[[ Name: calculateRideAlpha ]]
        local v45 = math.clamp((v42 - v43) / v44, 0, 1);
        local v46 = true;
        if v42 >= v43 then
            v46 = v43 + v44 < v42;
        end;
        return v45, v46;
    end;
    v30:Add(v28.OnClientEvent:Connect(function(v48, v49) --[[ Line: 75 ]]
        -- upvalues: v40 (ref), v41 (ref)
        v40 = v48;
        v41 = v49;
    end));
    local v50 = v30:Extend();
    local v51 = {};
    v30:Add(v27.OnClientEvent:Connect(function(v52) --[[ Line: 83 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v50 (copy), v38 (copy), v51 (copy)
        if not l_LocalPlayer_0:GetAttribute("SleighSeated") then
            return;
        else
            for v53, v54 in v52 do
                local v55 = v50:Extend();
                local l_Candycane_0 = v38.Rings:GetChildren()[v54.ring].Candycane;
                local v57 = v55:Clone(script.Drop);
                v57:PivotTo(l_Candycane_0:GetPivot());
                v57.BillboardGui.CurrencyCandyCane.Text = ("+%*"):format(v54.amount);
                v57.Parent = workspace;
                local v58 = v55:Clone(script.ActivatedCandyCaneVFX.Attachment);
                v58.Parent = l_Candycane_0;
                table.insert(v51, {
                    ringTrove = v55, 
                    vfx = v58, 
                    ring = v54.ring, 
                    amount = v54.amount, 
                    uuid = v53, 
                    drop = v57
                });
            end;
            return;
        end;
    end));
    v30:Add(v26.OnClientEvent:Connect(function() --[[ Line: 112 ]]
        -- upvalues: v50 (copy), v51 (copy)
        v50:Clean();
        table.clear(v51);
    end));
    local function v70(v59, v60, v61) --[[ Line: 117 ]] --[[ Name: createSyncedAnimator ]]
        -- upvalues: v18 (ref), v30 (ref), l_RunService_0 (ref), v40 (ref), v41 (ref)
        local v62 = v18.new();
        local v63 = v59:LoadAnimation(v60);
        (v62 or v30):Add(function() --[[ Line: 42 ]]
            -- upvalues: v63 (copy)
            v63:Stop(0);
            v63:Destroy();
        end);
        local l_v63_0 = v63;
        v62:Add(l_RunService_0.PreRender:Connect(function() --[[ Line: 122 ]]
            -- upvalues: v40 (ref), v41 (ref), l_v63_0 (copy), v61 (copy)
            if not v40 or not v41 then
                return;
            else
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local l_v40_0 = v40;
                local l_v41_0 = v41;
                local v68 = math.clamp((l_workspace_ServerTimeNow_0 - l_v40_0) / l_v41_0, 0, 1);
                local v69 = true;
                if l_workspace_ServerTimeNow_0 >= l_v40_0 then
                    v69 = l_v40_0 + l_v41_0 < l_workspace_ServerTimeNow_0;
                end;
                l_workspace_ServerTimeNow_0 = v68 * v41;
                l_v40_0 = l_v63_0.TimePosition;
                l_v41_0 = true;
                if v69 then
                    if l_v63_0.IsPlaying then
                        l_v63_0.TimePosition = 0;
                        l_v63_0:Stop(0);
                    end;
                    l_v41_0 = false;
                elseif math.abs(l_workspace_ServerTimeNow_0 - l_v40_0) > 0.1 then
                    if not l_v63_0.IsPlaying then
                        l_v63_0:Play();
                    end;
                    l_v63_0.TimePosition = l_workspace_ServerTimeNow_0;
                end;
                if v61 then
                    v61(l_v41_0, l_workspace_ServerTimeNow_0);
                end;
                return;
            end;
        end));
        return v62:WrapClean();
    end;
    local function v76(v71, v72) --[[ Line: 156 ]] --[[ Name: playCharacterAnimation ]]
        -- upvalues: l_TweenService_0 (ref)
        local l_Character_0 = v71.Character;
        if not l_Character_0 then
            return;
        else
            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return;
            else
                local v75 = script.Reward:Clone();
                v75.CurrencyCandyCane.Text = ("+%*"):format(v72);
                v75.Parent = l_HumanoidRootPart_0;
                l_TweenService_0:Create(v75, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    StudsOffset = Vector3.new(0, 2.5, 2.200000047683716, 0)
                }):Play();
                l_TweenService_0:Create(v75.ImageLabel.ImageLabel, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v75.CurrencyCandyCane, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v75.CurrencyCandyCane.UIStroke, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    Transparency = 1
                }):Play();
                task.delay(5, function() --[[ Line: 187 ]]
                    -- upvalues: v75 (copy)
                    v75:Destroy();
                end);
                return;
            end;
        end;
    end;
    local function v82(v77) --[[ Line: 192 ]] --[[ Name: playScreenCandyCaneAnimation ]]
        -- upvalues: l_Players_0 (ref), v13 (ref)
        local v78 = Random.new();
        for _ = 1, math.min(v77, 30) do
            local v80 = script.Image:Clone();
            v80.Position = UDim2.fromScale(v78:NextNumber(-0.25, 1.25), -(0.25 - v78:NextNumber(0, 0.125)));
            v80.Rotation = v78:NextNumber(-120, 120);
            local v81 = v78:NextNumber(0.15, 0.2);
            v80.Size = UDim2.fromScale(v81, v81);
            v80.Parent = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Effects");
            v13(v80, TweenInfo.new(v78:NextNumber(0.75, 1.3), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Position = v80.Position + UDim2.fromScale(0, 1.5), 
                Rotation = v80.Rotation + v78:NextInteger(-3, 3) * 10
            }, true).Completed:Once(function() --[[ Line: 212 ]]
                -- upvalues: v80 (copy)
                task.wait(1);
                v80:Destroy();
            end);
        end;
    end;
    v8:Run("GingerbreadTownEvent", "GrassRecolor");
    v30:Add(function() --[[ Line: 220 ]]
        -- upvalues: v8 (ref)
        v8:Stop("GingerbreadTownEvent", "GrassRecolor");
    end);
    v8:Run("GingerbreadTownEvent", "WallRecolor");
    v30:Add(function() --[[ Line: 225 ]]
        -- upvalues: v8 (ref)
        v8:Stop("GingerbreadTownEvent", "WallRecolor");
    end);
    v8:Run("GingerbreadTownEvent", "WallBottomRecolor");
    v30:Add(function() --[[ Line: 230 ]]
        -- upvalues: v8 (ref)
        v8:Stop("GingerbreadTownEvent", "WallBottomRecolor");
    end);
    v38.Parent = workspace;
    v30:Add(v25.OnClientEvent:Connect(function(v83, v84) --[[ Line: 236 ]]
        -- upvalues: v76 (copy), l_LocalPlayer_0 (ref), v82 (copy), v10 (ref), l_ReplicatedStorage_0 (ref), v51 (copy), v22 (ref)
        v76(l_LocalPlayer_0, v84);
        v82(v84);
        task.spawn(function() --[[ Line: 240 ]]
            -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref)
            v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Gingerbread Town"].CandyCane);
        end);
        for v85, v86 in v51 do
            if v86.uuid == v83 then
                v86.ringTrove:Clean();
                local v87 = script.BurstVFX:Clone();
                v87:PivotTo(v86.drop:GetPivot() * CFrame.Angles(0, 1.5707963267948966, 0));
                v87.Parent = workspace;
                v22.emit(v87);
                task.delay(5, function() --[[ Line: 254 ]]
                    -- upvalues: v87 (copy)
                    v87:Destroy();
                end);
                table.remove(v51, v85);
                return;
            end;
        end;
    end));
    v30:Add(v19.Simple(0.05, function() --[[ Line: 265 ]]
        -- upvalues: v51 (copy), l_LocalPlayer_0 (ref), v25 (ref)
        if #v51 == 0 then
            return;
        else
            local l_Character_1 = l_LocalPlayer_0.Character;
            if not l_Character_1 then
                return;
            else
                for _, v90 in v51 do
                    if (v90.drop:GetPivot().Position - l_Character_1:GetPivot().Position).Magnitude <= 30 then
                        v25:FireServer(v90.uuid);
                    end;
                end;
                return;
            end;
        end;
    end));
    v30:Add(v14.observeTag("GingerbreadTownReindeer", function(v91) --[[ Line: 282 ]]
        -- upvalues: v18 (ref), v30 (ref), v70 (copy)
        local v92 = v18.new();
        local v93 = v91:LoadAnimation(script.ReindeerIdle);
        (v92 or v30):Add(function() --[[ Line: 42 ]]
            -- upvalues: v93 (copy)
            v93:Stop(0);
            v93:Destroy();
        end);
        v93:Play(0);
        v92:Add(v70(v91, script.ReindeerTravel));
        return v92:WrapClean();
    end));
    v30:Add(v14.observeTag("GingerbreadTownSleigh", function(v94) --[[ Line: 292 ]]
        -- upvalues: v18 (ref), l_ReplicatedStorage_0 (ref), v30 (ref), v14 (ref), v70 (copy)
        local v95 = v18.new();
        local v96 = v95:Clone(l_ReplicatedStorage_0.Sounds.Events["Gingerbread Town"].Fly);
        v30:Add(v14.observeChildren(v94.Parent.Parent, function(v97) --[[ Line: 296 ]]
            -- upvalues: v96 (copy)
            if v97.Name == "SleighMain" then
                v96.Parent = v97;
            end;
            return nil;
        end));
        local v98 = {};
        local v99 = nil;
        v95:Add(v14.observeTag("GingerbreadTownSleighMainWeld", function(v100) --[[ Line: 307 ]]
            -- upvalues: v98 (copy), v99 (ref)
            table.insert(v98, v100);
            if v99 then
                v100.C1 = CFrame.Angles(1.5707963267948966, 0, 0);
            end;
            return function() --[[ Line: 313 ]]
                -- upvalues: v98 (ref), v100 (copy)
                local v101 = table.find(v98, v100);
                if v101 then
                    table.remove(v98, v101);
                end;
            end;
        end));
        v95:Add(v70(v94, script.SleighTravel, function(v102) --[[ Line: 321 ]]
            -- upvalues: v99 (ref), v96 (copy), v98 (copy)
            if v99 == v102 then
                return;
            else
                if v102 then
                    if not v96.IsPlaying then
                        v96:Play();
                    end;
                elseif v96.IsPlaying then
                    v96:Stop();
                end;
                v99 = v102;
                for _, v104 in v98 do
                    task.defer(function() --[[ Line: 338 ]]
                        -- upvalues: v104 (copy), v102 (copy)
                        v104.C1 = if v102 then CFrame.Angles(1.5707963267948966, 0, 0) else CFrame.identity;
                    end);
                end;
                return;
            end;
        end));
        return v95:WrapClean();
    end));
    v30:Add(v14.observeTag("GingerbreadTownEventReindeer", function(v105) --[[ Line: 348 ]]
        -- upvalues: v18 (ref), v30 (ref), v14 (ref)
        local v106 = v18.new();
        local v107 = v106:Clone(script.BabyReindeer);
        v107.Parent = workspace;
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v107.PrimaryPart;
        l_Weld_0.Part1 = v105;
        l_Weld_0.C0 = v107.PrimaryPart.PivotOffset;
        l_Weld_0.Parent = v107.PrimaryPart;
        local v109 = v107.AnimationController.Animator:LoadAnimation(script.BabyReindeerIdle);
        v30:Add(function() --[[ Line: 42 ]]
            -- upvalues: v109 (copy)
            v109:Stop(0);
            v109:Destroy();
        end);
        local l_v109_0 = v109;
        l_v109_0.Priority = Enum.AnimationPriority.Idle;
        l_v109_0.Looped = true;
        l_v109_0:Play();
        local v111 = v107.AnimationController.Animator:LoadAnimation(script.BabyReindeerMove);
        v30:Add(function() --[[ Line: 42 ]]
            -- upvalues: v111 (copy)
            v111:Stop(0);
            v111:Destroy();
        end);
        local l_v111_0 = v111;
        l_v111_0.Priority = Enum.AnimationPriority.Action;
        l_v111_0.Looped = true;
        v106:Add(v14.observeAttribute(v105, "Moving", function(v113) --[[ Line: 369 ]]
            -- upvalues: l_v111_0 (copy)
            if v113 then
                l_v111_0:Play();
            else
                l_v111_0:Stop();
            end;
            return nil;
        end));
        return v106:WrapClean();
    end, {
        workspace
    }));
    v30:Add(function() --[[ Line: 382 ]]
        -- upvalues: v8 (ref)
        v8:Activate("Blink");
    end);
    v30:Add(v14.observeTag("HideInGingerbreadTown", function(v114) --[[ Line: 386 ]]
        local l_Parent_0 = v114.Parent;
        v114.Parent = script;
        return function() --[[ Line: 389 ]]
            -- upvalues: v114 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 390 ]]
                -- upvalues: v114 (ref), l_Parent_0 (ref)
                v114.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v12:Update();
    v10:UpdateOST();
    v8:Activate("Blink");
    v30:Add(function() --[[ Line: 400 ]]
        -- upvalues: v12 (ref), v10 (ref)
        v12:Update();
        v10:UpdateOST();
    end);
end;
v7.OnStop = function(_) --[[ Line: 406 ]] --[[ Name: OnStop ]]
    -- upvalues: v30 (copy)
    v30:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 410 ]] --[[ Name: OnLoad ]]
    -- upvalues: v9 (copy), v29 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v22 (copy)
    local _ = function(v118) --[[ Line: 411 ]] --[[ Name: getTargetPosition ]]
        -- upvalues: v9 (ref)
        local v119 = v9:GetAnimals()[v118];
        if not v119 then
            return (Vector3.new(0, 0, 0, 0));
        else
            local _ = nil;
            local l_AnimalModel_0 = v119.AnimalModel;
            return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
        end;
    end;
    v29.OnClientEvent:Connect(function(v123) --[[ Line: 429 ]]
        -- upvalues: v9 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v22 (ref)
        local v124 = v9:GetAnimals()[v123];
        if not v124 then
            return;
        else
            local v125 = v9:GetAnimals()[v123];
            local v126;
            if not v125 then
                v126 = Vector3.new(0, 0, 0, 0);
            else
                local _ = nil;
                local l_AnimalModel_1 = v125.AnimalModel;
                v126 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
            end;
            task.spawn(function() --[[ Line: 437 ]]
                -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), v126 (copy)
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Gingerbread Town"].Hit, v126);
            end);
            v125 = script.ReindeerBurst:Clone();
            v125:PivotTo(CFrame.new(v126));
            v125.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v125;
            l_WeldConstraint_0.Part1 = v124.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v125;
            v125.Parent = workspace;
            v22.emit(v125);
            task.delay(5, function() --[[ Line: 454 ]]
                -- upvalues: v125 (copy)
                v125:Destroy();
            end);
            return;
        end;
    end);
end;
return v7;