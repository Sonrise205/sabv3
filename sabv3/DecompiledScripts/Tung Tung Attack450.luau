local _ = game:GetService("PathfindingService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local _ = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v13 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v14 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v15 = require(l_ReplicatedStorage_0.Packages.Observers);
local v16 = require(l_ReplicatedStorage_0.Packages.Trove);
local v17 = require(l_ReplicatedStorage_0.Packages.Net);
local v18 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v20 = v17:RemoteEvent("EventService/Tung Tung Attack/Hit");
local v21 = v16.new();
local v22 = {
    script.Tung1, 
    script.Tung2
};
v7.OnStart = function(_) --[[ Line: 38 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), v11 (copy), v9 (copy), v21 (copy), v14 (copy), v15 (copy), v22 (copy), v13 (copy)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    v11:Update();
    v9:UpdateOST();
    local v26 = script["Tung Tung Tung Sahur"]:Clone();
    local l_v26_Pivot_0 = v26:GetPivot();
    v26:PivotTo(l_v26_Pivot_0 - Vector3.new(0, 40, 0, 0));
    v26.Parent = workspace;
    local v28 = script.VFX:Clone();
    v28.Parent = workspace;
    local v29 = v26.AnimationController.Animator:LoadAnimation(script.GiantTungTung);
    v29.Looped = false;
    v29.Priority = Enum.AnimationPriority.Action4;
    v29:Play(0);
    local v30 = v26.AnimationController.Animator:LoadAnimation(script.GiantTungTungIdle);
    v30.Looped = true;
    v30.Priority = Enum.AnimationPriority.Idle;
    v30:Play(0);
    v21:Add(task.spawn(function() --[[ Line: 66 ]]
        -- upvalues: v29 (copy), v9 (ref), v21 (ref), v14 (ref), v26 (copy), l_v26_Pivot_0 (copy)
        while v29.Length == 0 do
            task.wait();
        end;
        v9:PlaySound("Sounds.Events.Tung Tung Attack.BigTungTungSpawn");
        v29:Stop(0);
        v29.TimePosition = 0;
        v29:Play(0);
        v21:Add(v14(v26, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), l_v26_Pivot_0)):Play();
    end));
    v21:Add(function() --[[ Line: 80 ]]
        -- upvalues: v14 (ref), v26 (copy), l_v26_Pivot_0 (copy), v28 (copy), v30 (copy), v29 (copy)
        v14(v26, TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), l_v26_Pivot_0 - Vector3.new(0, 40, 0, 0)):Play();
        for _, v32 in v28:GetDescendants() do
            if v32:IsA("ParticleEmitter") then
                v32.Enabled = false;
            end;
        end;
        task.wait(5);
        v28:Destroy();
        v26:Destroy();
        v30:Stop(0);
        v30:Destroy();
        v29:Stop(0);
        v29:Destroy();
    end);
    local v33 = Random.new();
    v21:Add(v15.observeTag("BabyTungTung", function(v34) --[[ Line: 103 ]]
        -- upvalues: v22 (ref), v33 (copy)
        local v35 = true;
        local v37 = task.spawn(function() --[[ Line: 105 ]]
            -- upvalues: v35 (ref), v22 (ref), v33 (ref), v34 (copy)
            while v35 do
                local v36 = v22[v33:NextInteger(1, #v22)]:Clone();
                v36.Parent = v34:FindFirstChild("HumanoidRootPart") or v34;
                v36:Play();
                v36.Ended:Once(function() --[[ Line: 111 ]]
                    -- upvalues: v36 (copy)
                    task.wait(0.1);
                    v36:Destroy();
                end);
                task.wait(v33:NextNumber(2, 4));
            end;
        end);
        return function() --[[ Line: 120 ]]
            -- upvalues: v35 (ref), v37 (copy)
            v35 = false;
            pcall(task.cancel, v37);
        end;
    end));
    local v38 = l_v10_ActiveEventData_0.startedAt + 10 - l_workspace_ServerTimeNow_0;
    local v39 = script.Caves:Clone();
    local v40 = script.Caves2:Clone();
    for _, v42 in {
        v39["1"], 
        v39["2"], 
        v39["3"], 
        v40["4"], 
        v40["5"], 
        v40["6"]
    } do
        v9:PlaySound("Sounds.Events.Tung Tung Attack.Cave", v42:GetPivot().Position);
    end;
    v39.Parent = workspace;
    v40.Parent = workspace;
    local l_v39_Pivot_0 = v39:GetPivot();
    local l_v40_Pivot_0 = v40:GetPivot();
    v21:Add(v14(v39, TweenInfo.new(v38, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), l_v39_Pivot_0 * CFrame.new(0, 0, 6))):Play();
    v21:Add(v14(v40, TweenInfo.new(v38, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), l_v40_Pivot_0 * CFrame.new(0, 0, 6))):Play();
    v21:Add(function() --[[ Line: 153 ]]
        -- upvalues: v14 (ref), v39 (copy), l_v39_Pivot_0 (copy), v40 (copy), l_v40_Pivot_0 (copy)
        v14(v39, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), l_v39_Pivot_0):Play();
        v14(v40, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), l_v40_Pivot_0):Play();
        task.wait(5);
        v39:Destroy();
        v40:Destroy();
    end);
    local v45 = v13.BumpS:Clone();
    v21:Add(v45);
    v45.Sustain = true;
    v21:Add(v13.BindShakeToCamera(v45, workspace.CurrentCamera));
    v45:Start();
    v21:Add(task.delay(v38, function() --[[ Line: 169 ]]
        -- upvalues: v45 (copy), v28 (copy)
        v45:StopSustain();
        for _, v47 in v28.Cave:GetDescendants() do
            if v47:IsA("ParticleEmitter") then
                v47.Enabled = true;
            end;
        end;
    end));
end;
v7.OnStop = function(_) --[[ Line: 180 ]] --[[ Name: OnStop ]]
    -- upvalues: v21 (copy)
    v21:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 184 ]] --[[ Name: OnLoad ]]
    -- upvalues: v20 (copy), v8 (copy), v18 (copy)
    v20.OnClientEvent:Connect(function(v50) --[[ Line: 185 ]]
        -- upvalues: v8 (ref), v18 (ref)
        local v51 = nil;
        local v52 = nil;
        if type(v50) == "string" then
            local v53 = v8:GetAnimals()[v50];
            if not v53 then
                return;
            else
                local l_v53_0 = v53 --[[ copy: 3 -> 7 ]];
                local _ = function() --[[ Line: 194 ]] --[[ Name: getTargetPosition ]]
                    -- upvalues: l_v53_0 (copy)
                    local _ = nil;
                    local l_AnimalModel_0 = l_v53_0.AnimalModel;
                    return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, l_v53_0.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                end;
                local _ = nil;
                local l_AnimalModel_1 = v53.AnimalModel;
                v51 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position + Vector3.new(0, v53.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                v52 = v53.AnimalModel.PrimaryPart;
            end;
        else
            v51 = v50:GetPivot().Position;
            v52 = v50;
        end;
        local v60 = script.TungTungHit:Clone();
        v60:PivotTo(CFrame.new(v51));
        v60.Anchored = false;
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v60;
        l_WeldConstraint_0.Part1 = v52;
        l_WeldConstraint_0.Parent = v60;
        v60.Parent = workspace;
        v18.emit(v60);
        task.delay(3, function() --[[ Line: 228 ]]
            -- upvalues: v60 (copy)
            v60:Destroy();
        end);
    end);
end;
return v7;