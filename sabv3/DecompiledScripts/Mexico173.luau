local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local v9 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v10 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v15 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v21 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v23 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v25 = require(l_ReplicatedStorage_0.Packages.Net);
local v26 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_MexicoEvent_0 = workspace.Sounds.MexicoEvent;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local _ = workspace.RenderedMovingAnimals;
local v32 = v25:RemoteEvent("EventService/Mexico/Burst");
local v33 = v23.new();
local function _(v34, v35, v36) --[[ Line: 49 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v33 (copy)
    local v37 = v34:LoadAnimation(v35);
    (v36 or v33):Add(function() --[[ Line: 51 ]]
        -- upvalues: v37 (copy)
        v37:Stop(0);
        v37:Destroy();
    end);
    return v37;
end;
local function v49(v39) --[[ Line: 59 ]] --[[ Name: playTracksSynced ]]
    return task.spawn(function() --[[ Line: 60 ]]
        -- upvalues: v39 (copy)
        for _, v41 in v39 do
            v41:Play(0);
        end;
        while true do
            local v42 = true;
            for _, v44 in v39 do
                if v44.Length == 0 then
                    v42 = false;
                else
                    v44:Stop(0);
                end;
            end;
            if not v42 then
                task.wait();
            else
                break;
            end;
        end;
        for _, v46 in v39 do
            v46:Stop(0);
        end;
        for _, v48 in v39 do
            v48:Play(0);
        end;
    end);
end;
local function v54(v50) --[[ Line: 92 ]] --[[ Name: setupSpeedTracks ]]
    -- upvalues: l_RunService_0 (copy), l_MexicoEvent_0 (copy)
    return l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 93 ]]
        -- upvalues: l_MexicoEvent_0 (ref), v50 (copy)
        if l_MexicoEvent_0.TimePosition >= 28.5 then
            for _, v53 in v50 do
                v53:AdjustSpeed(1.5);
            end;
        end;
    end);
end;
v8.OnStart = function(_) --[[ Line: 103 ]] --[[ Name: OnStart ]]
    -- upvalues: v14 (copy), l_Name_0 (copy), v33 (copy), v11 (copy), v15 (copy), v13 (copy), v19 (copy), v23 (copy), v26 (copy), v54 (copy), v49 (copy), v9 (copy), l_MexicoEvent_0 (copy), v32 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v21 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy)
    local l_v14_ActiveEventData_0 = v14:GetActiveEventData(l_Name_0);
    assert(l_v14_ActiveEventData_0);
    local function _(v57) --[[ Line: 107 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        return (math.max(l_v14_ActiveEventData_0.startedAt + v57 - workspace:GetServerTimeNow(), 0));
    end;
    v33:Add(function() --[[ Line: 111 ]]
        -- upvalues: v11 (ref), v15 (ref), v13 (ref)
        v11:Activate("Blink");
        v15:Update();
        v13:UpdateOST();
    end);
    local v59 = v33:Clone(script.Map);
    v59.Parent = workspace;
    v33:Add(v19.observeTag("HideInMexico", function(v60) --[[ Line: 119 ]]
        local l_Parent_0 = v60.Parent;
        v60.Parent = script;
        return function() --[[ Line: 122 ]]
            -- upvalues: v60 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 123 ]]
                -- upvalues: v60 (ref), l_Parent_0 (ref)
                v60.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v11:Activate("Blink");
    v15:Update();
    v13:UpdateOST();
    v11:Run("MexicoEvent", "GrassRecolor");
    v33:Add(function() --[[ Line: 134 ]]
        -- upvalues: v11 (ref)
        v11:Stop("MexicoEvent", "GrassRecolor");
    end);
    v11:Run("MexicoEvent", "WallRecolor");
    v33:Add(function() --[[ Line: 139 ]]
        -- upvalues: v11 (ref)
        v11:Stop("MexicoEvent", "WallRecolor");
    end);
    v11:Run("MexicoEvent", "WallBottomRecolor");
    v33:Add(function() --[[ Line: 144 ]]
        -- upvalues: v11 (ref)
        v11:Stop("MexicoEvent", "WallBottomRecolor");
    end);
    v33:Add(v19.observeTag("Roach", function(v62) --[[ Line: 148 ]]
        -- upvalues: v23 (ref), v19 (ref), v33 (ref), v26 (ref), v54 (ref), l_v14_ActiveEventData_0 (copy)
        local v63 = v23.new();
        local l_HumanoidRootPart_0 = v62:WaitForChild("HumanoidRootPart");
        local v65 = v63:Clone(script.Cockroach);
        local v66 = v63:Add(Instance.new("Weld"));
        v66.Part0 = v65.PrimaryPart;
        v66.Part1 = l_HumanoidRootPart_0;
        v66.Parent = v65.PrimaryPart;
        v65.Parent = v62;
        local l_AnimationController_0 = v65:FindFirstChild("AnimationController");
        if l_AnimationController_0 then
            l_AnimationController_0:Destroy();
        end;
        local v68 = Instance.new("Humanoid", v65);
        local _ = Instance.new("Animator", v68);
        v68.Name = "AnimationController";
        v68.EvaluateStateMachine = false;
        v68.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
        v68.PlatformStand = true;
        v68.Parent = v65;
        local l_Animator_0 = v65.AnimationController.Animator;
        local v71 = l_Animator_0:LoadAnimation(script.TakeHat);
        v71.Looped = false;
        v71.Priority = Enum.AnimationPriority.Action3;
        local v72 = l_Animator_0:LoadAnimation(script.PutHat);
        v72.Looped = false;
        v72.Priority = Enum.AnimationPriority.Action4;
        v63:Add(v62:GetAttributeChangedSignal("AttackAnimation"):Connect(function() --[[ Line: 187 ]]
            -- upvalues: v72 (copy)
            v72:Play();
        end));
        v62:SetAttribute("Shuffle", false);
        v63:Add(v19.observeAttribute(v62, "Shuffle", function(v73) --[[ Line: 192 ]]
            -- upvalues: v23 (ref), l_Animator_0 (copy), v33 (ref), v19 (ref), v62 (copy), v71 (copy), v26 (ref), v65 (copy), v54 (ref)
            if v73 then
                local v74 = v23.new();
                local v75 = l_Animator_0:LoadAnimation(script.Shuffle);
                (v74 or v33):Add(function() --[[ Line: 51 ]]
                    -- upvalues: v75 (copy)
                    v75:Stop(0);
                    v75:Destroy();
                end);
                local l_v75_0 = v75;
                l_v75_0.Looped = true;
                l_v75_0:Play();
                l_v75_0:AdjustSpeed(1.5);
                return v74:WrapClean();
            else
                return v19.observeAttribute(v62, "Instrument", function(v77) --[[ Line: 204 ]]
                    -- upvalues: v23 (ref), v71 (ref), v26 (ref), v65 (ref), l_Animator_0 (ref), v33 (ref), v19 (ref), v62 (ref), v54 (ref)
                    local v78 = v23.new();
                    if v77 == "Sombrero" then
                        v71:Play();
                        v26.disable(v65.RootPart.VFX);
                    else
                        v26.enable(v65.RootPart.VFX);
                    end;
                    local v79 = l_Animator_0:LoadAnimation(script:FindFirstChild((("RoachWalk%*"):format(v77))) or script.RoachWalk);
                    local l_v79_0 = v79 --[[ copy: 5 -> 13 ]];
                    (v78 or v33):Add(function() --[[ Line: 51 ]]
                        -- upvalues: l_v79_0 (copy)
                        l_v79_0:Stop(0);
                        l_v79_0:Destroy();
                    end);
                    local l_v79_1 = v79;
                    l_v79_1.Priority = Enum.AnimationPriority.Action2;
                    v78:Add(v19.observeAttribute(v62, "IsRunning", function(v82) --[[ Line: 218 ]]
                        -- upvalues: l_v79_1 (copy)
                        if v82 then
                            l_v79_1:Play();
                        else
                            l_v79_1:Stop();
                        end;
                        return nil;
                    end));
                    local l_FirstChild_0 = script.Instruments:FindFirstChild(v77);
                    local v84 = nil;
                    if l_FirstChild_0 then
                        v84 = v78:Clone(l_FirstChild_0);
                        if v84.PrimaryPart then
                            v79 = Instance.new("Weld");
                            v79.Part0 = v84.PrimaryPart;
                            v79.Part1 = v65.PrimaryPart;
                            v79.C0 = CFrame.new(0, 3.5, 0);
                            v79.Parent = v84.PrimaryPart;
                        end;
                        for _, v86 in v84:GetChildren() do
                            local l_RigidConstraint_0 = v86:FindFirstChildOfClass("RigidConstraint");
                            if l_RigidConstraint_0 then
                                local l_Attachment0_0 = l_RigidConstraint_0.Attachment0;
                                if l_Attachment0_0 then
                                    local l_v65_FirstChild_0 = v65:FindFirstChild(l_Attachment0_0.Name, true);
                                    if l_v65_FirstChild_0 then
                                        l_RigidConstraint_0.Attachment1 = l_v65_FirstChild_0;
                                    end;
                                end;
                            end;
                        end;
                        v84.Parent = v65.PrimaryPart;
                    end;
                    v78:Add(v19.observeAttribute(v62, "Dance", function(v90) --[[ Line: 264 ]]
                        -- upvalues: v23 (ref), v77 (copy), l_Animator_0 (ref), v33 (ref), v84 (ref), v19 (ref), v62 (ref), v54 (ref)
                        if not v90 then
                            return nil;
                        else
                            local v91 = v23.new();
                            local l_script_FirstChild_0 = script:FindFirstChild((("Roach%*"):format(v77)));
                            local v93 = nil;
                            if l_script_FirstChild_0 then
                                local v94 = l_Animator_0:LoadAnimation(l_script_FirstChild_0);
                                local l_v94_0 = v94 --[[ copy: 5 -> 11 ]];
                                (v91 or v33):Add(function() --[[ Line: 51 ]]
                                    -- upvalues: l_v94_0 (copy)
                                    l_v94_0:Stop(0);
                                    l_v94_0:Destroy();
                                end);
                                v93 = v94;
                                v93.Looped = true;
                                v93.Priority = Enum.AnimationPriority.Action;
                                v93:Play();
                                if v77 == "Maracas" then
                                    v93:AdjustSpeed(0.65);
                                end;
                            end;
                            local v96 = nil;
                            if v84 and v84:FindFirstChild("AnimationController") then
                                local l_script_FirstChild_1 = script:FindFirstChild(v77);
                                if l_script_FirstChild_1 then
                                    local v98 = v84.AnimationController.Animator:LoadAnimation(l_script_FirstChild_1);
                                    local l_v98_0 = v98 --[[ copy: 7 -> 10 ]];
                                    (v91 or v33):Add(function() --[[ Line: 51 ]]
                                        -- upvalues: l_v98_0 (copy)
                                        l_v98_0:Stop(0);
                                        l_v98_0:Destroy();
                                    end);
                                    v96 = v98;
                                    v96.Looped = true;
                                    v96.Priority = Enum.AnimationPriority.Action;
                                    v96:Play();
                                    if v93 then
                                        v33:Add(v93.DidLoop:Connect(function() --[[ Line: 294 ]]
                                            -- upvalues: v96 (ref)
                                            v96.TimePosition = 0;
                                        end));
                                    end;
                                end;
                                local l_script_FirstChild_2 = script:FindFirstChild((("Walk%*"):format(v77)));
                                if l_script_FirstChild_2 then
                                    local v101 = v84.AnimationController.Animator:LoadAnimation(l_script_FirstChild_2);
                                    (v91 or v33):Add(function() --[[ Line: 51 ]]
                                        -- upvalues: v101 (copy)
                                        v101:Stop(0);
                                        v101:Destroy();
                                    end);
                                    local l_v101_0 = v101;
                                    l_v101_0.Priority = Enum.AnimationPriority.Action2;
                                    v91:Add(v19.observeAttribute(v62, "IsRunning", function(v103) --[[ Line: 305 ]]
                                        -- upvalues: l_v101_0 (copy)
                                        if v103 then
                                            l_v101_0:Play();
                                        else
                                            l_v101_0:Stop();
                                        end;
                                        return nil;
                                    end));
                                end;
                            end;
                            v91:Add(v54({
                                v93, 
                                v96
                            }));
                            return v91:WrapClean();
                        end;
                    end));
                    return v78:WrapClean();
                end);
            end;
        end));
        local v104 = math.max(l_v14_ActiveEventData_0.startedAt + 28.5 - workspace:GetServerTimeNow(), 0);
        v63:Add(v33:Add(task.delay(v104, function() --[[ Line: 328 ]]
            -- upvalues: v62 (copy), v63 (copy), v33 (ref), l_v14_ActiveEventData_0 (ref)
            v62:SetAttribute("Shuffle", true);
            v63:Add(v33:Add(task.delay(math.max(l_v14_ActiveEventData_0.startedAt + 34.5 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 332 ]]
                -- upvalues: v62 (ref)
                v62:SetAttribute("Shuffle", false);
            end)));
        end)));
        return v63:WrapClean();
    end));
    for _, v106 in v59.WallRoaches:GetChildren() do
        local v107 = v106:GetAttribute("Instrument") or "Violin";
        local v108 = v33:Clone(script.Wall);
        v108:PivotTo(v106:GetPivot());
        for _, v110 in v108.Instruments:GetChildren() do
            if v110.Name ~= v107 then
                v110:Destroy();
            end;
        end;
        v108.Parent = workspace;
        local v111 = v108.Cockroach.AnimationController.Animator:LoadAnimation(script[("Roach%*"):format(v107)]);
        v33:Add(function() --[[ Line: 51 ]]
            -- upvalues: v111 (copy)
            v111:Stop(0);
            v111:Destroy();
        end);
        local l_v111_0 = v111;
        l_v111_0:Play();
        local v113 = v108.Instruments[v107].AnimationController.Animator:LoadAnimation(script[v107]);
        v33:Add(function() --[[ Line: 51 ]]
            -- upvalues: v113 (copy)
            v113:Stop(0);
            v113:Destroy();
        end);
        local l_v113_0 = v113;
        l_v113_0:Play();
        v33:Add(l_v111_0.DidLoop:Connect(function() --[[ Line: 362 ]]
            -- upvalues: l_v113_0 (copy)
            l_v113_0.TimePosition = 0;
        end));
        local v115 = {
            l_v113_0, 
            l_v111_0
        };
        v33:Add(v49(v115));
        v33:Add(v54(v115));
    end;
    v33:Add(task.spawn(function() --[[ Line: 371 ]]
        -- upvalues: v9 (ref), l_MexicoEvent_0 (ref), l_v14_ActiveEventData_0 (copy), v33 (ref)
        v9:WaitForAssetId("rbxassetid://101252122546671");
        l_MexicoEvent_0.SoundId = "";
        l_MexicoEvent_0.SoundId = "rbxassetid://101252122546671";
        while not l_MexicoEvent_0.IsLoaded do
            task.wait();
        end;
        l_MexicoEvent_0.TimePosition = workspace:GetServerTimeNow() - l_v14_ActiveEventData_0.startedAt;
        l_MexicoEvent_0:Play();
        v33:Add(function() --[[ Line: 382 ]]
            -- upvalues: l_MexicoEvent_0 (ref)
            l_MexicoEvent_0:Stop();
        end);
    end));
    v33:Add(v32.OnClientEvent:Connect(function(v116) --[[ Line: 387 ]]
        -- upvalues: v10 (ref), v13 (ref), l_ReplicatedStorage_0 (ref), v26 (ref)
        local v117 = nil;
        local v118 = nil;
        if typeof(v116) == "string" then
            local v119 = v10:GetAnimals()[v116];
            if not v119 then
                return;
            else
                local l_v119_0 = v119 --[[ copy: 3 -> 7 ]];
                local _ = function() --[[ Line: 397 ]] --[[ Name: getTargetPosition ]]
                    -- upvalues: l_v119_0 (copy)
                    local _ = nil;
                    local l_AnimalModel_0 = l_v119_0.AnimalModel;
                    return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
                end;
                local _ = nil;
                local l_AnimalModel_1 = v119.AnimalModel;
                v117 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
                v118 = v119.AnimalModel.PrimaryPart;
            end;
        else
            v117 = v116:GetPivot().Position;
            v118 = v116;
        end;
        task.spawn(function() --[[ Line: 417 ]]
            -- upvalues: v13 (ref), l_ReplicatedStorage_0 (ref), v117 (ref)
            v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Mexico.Hit, v117);
        end);
        local v126 = script.Burst:Clone();
        v126:PivotTo(CFrame.new(v117));
        v126.Anchored = false;
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v126;
        l_WeldConstraint_0.Part1 = v118;
        l_WeldConstraint_0.Parent = v126;
        v126.Parent = workspace;
        v26.emit(v126);
        task.delay(5, function() --[[ Line: 434 ]]
            -- upvalues: v126 (copy)
            v126:Destroy();
        end);
    end));
    v33:Add(task.delay(math.max(l_v14_ActiveEventData_0.startedAt + 28.5 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 442 ]]
        -- upvalues: v33 (ref), v21 (ref), v19 (ref), v23 (ref), l_RunService_0 (ref), l_v14_ActiveEventData_0 (copy), l_LocalPlayer_0 (ref)
        local _ = v33:Add(v21.new());
        local _ = v33:Add(v19.observeCharacters(function(_, v130) --[[ Line: 446 ]]
            -- upvalues: v23 (ref), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
            local v131 = v23.new();
            v131:Add(task.spawn(function() --[[ Line: 449 ]]
                -- upvalues: v130 (copy), v131 (copy), l_RunService_0 (ref), l_v14_ActiveEventData_0 (ref), l_LocalPlayer_0 (ref)
                local l_Humanoid_0 = v130:WaitForChild("Humanoid");
                if not l_Humanoid_0 then
                    return;
                else
                    local l_Animator_1 = l_Humanoid_0:WaitForChild("Animator");
                    if not l_Animator_1 then
                        return;
                    else
                        local v134 = l_Animator_1:LoadAnimation(script.PlayerDance);
                        v134.Priority = Enum.AnimationPriority.Action;
                        local v135 = nil;
                        local function v142() --[[ Line: 465 ]] --[[ Name: tryCreateMaracas ]]
                            -- upvalues: v135 (ref), v131 (ref), v130 (ref)
                            if v135 then
                                return;
                            else
                                local v136 = v131:Clone(script.PlayerMaracas);
                                for _, v138 in v136:GetChildren() do
                                    local l_RigidConstraint_1 = v138:FindFirstChildOfClass("RigidConstraint");
                                    if l_RigidConstraint_1 then
                                        local l_Attachment0_1 = l_RigidConstraint_1.Attachment0;
                                        if l_Attachment0_1 then
                                            local l_v130_FirstChild_0 = v130:FindFirstChild(l_Attachment0_1.Name, true);
                                            if l_v130_FirstChild_0 and l_v130_FirstChild_0:IsA("Attachment") then
                                                l_RigidConstraint_1.Attachment1 = l_v130_FirstChild_0;
                                            end;
                                        end;
                                    end;
                                end;
                                v136.Parent = v130;
                                v135 = v136;
                                return;
                            end;
                        end;
                        local function _() --[[ Line: 496 ]] --[[ Name: tryDestroyMaracas ]]
                            -- upvalues: v135 (ref), v131 (ref)
                            if v135 then
                                v131:Remove(v135);
                                v135 = nil;
                            end;
                        end;
                        local v144 = 0;
                        v131:Add(l_RunService_0.PostSimulation:Connect(function(v145) --[[ Line: 505 ]]
                            -- upvalues: l_v14_ActiveEventData_0 (ref), v134 (copy), v142 (copy), l_Humanoid_0 (copy), l_LocalPlayer_0 (ref), v144 (ref), v135 (ref), v131 (ref)
                            debug.profilebegin("Mexico:Player:Dance");
                            local _ = workspace:GetServerTimeNow();
                            if math.max(l_v14_ActiveEventData_0.startedAt + 43.5 - workspace:GetServerTimeNow(), 0) > 0 then
                                if not v134.IsPlaying then
                                    v134:Play();
                                    v142();
                                end;
                                debug.profileend();
                                return;
                            else
                                if not (l_Humanoid_0.MoveDirection ~= Vector3.new(0, 0, 0, 0)) and not l_LocalPlayer_0:GetAttribute("Stealing") then
                                    if v144 < 3 then
                                        v144 = v144 + v145;
                                    elseif not v134.IsPlaying then
                                        v134:Play();
                                        v142();
                                    end;
                                else
                                    v144 = 0;
                                    if v134.IsPlaying then
                                        v134:Stop();
                                        if v135 then
                                            v131:Remove(v135);
                                            v135 = nil;
                                        end;
                                    end;
                                end;
                                debug.profileend();
                                return;
                            end;
                        end));
                        v131:Add(function() --[[ Line: 540 ]]
                            -- upvalues: v134 (copy)
                            v134:Stop();
                            v134:Destroy();
                        end);
                        return;
                    end;
                end;
            end));
            return v131:WrapClean();
        end));
    end));
end;
v8.OnStop = function(_) --[[ Line: 551 ]] --[[ Name: OnStop ]]
    -- upvalues: v33 (copy)
    v33:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 555 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v9 (copy), l_MexicoEvent_0 (copy)
    task.spawn(pcall, function() --[[ Line: 556 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(function() --[[ Line: 560 ]]
        -- upvalues: v9 (ref), l_MexicoEvent_0 (ref), l_ContentProvider_0 (ref)
        v9:WaitForAssetId("rbxassetid://101252122546671");
        l_MexicoEvent_0.SoundId = "rbxassetid://101252122546671";
        l_ContentProvider_0:PreloadAsync({
            l_MexicoEvent_0
        });
    end);
end;
return v8;