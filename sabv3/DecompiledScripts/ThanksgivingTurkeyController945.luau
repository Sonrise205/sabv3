local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v2 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v3 = require(l_ReplicatedStorage_0.Packages.Trove);
local v4 = require(l_ReplicatedStorage_0.Packages.Spr);
local v5 = require(l_ReplicatedStorage_0.Packages.Net);
local v6 = {};
local v7 = v5:RemoteEvent("ThanksgivingTurkeyService/UpdateAnimation");
local v8 = v5:RemoteEvent("ThanksgivingTurkeyService/UpdateHealthBar");
local v9 = v5:RemoteEvent("ThanksgivingTurkeyService/PlayAnimation");
local v10 = v5:RemoteEvent("ThanksgivingTurkeyService/Despawn");
local v11 = v5:RemoteEvent("ThanksgivingTurkeyService/Spawn");
local v12 = v3.new();
local v13 = 10;
local l_v13_0 = v13;
local v15 = nil;
v6.Start = function(_) --[[ Line: 23 ]] --[[ Name: Start ]]
    -- upvalues: v15 (ref), l_v13_0 (ref), v13 (ref), v4 (copy), v1 (copy), v11 (copy), v12 (copy), v2 (copy), v10 (copy), v8 (copy), v9 (copy), v7 (copy)
    local function v18() --[[ Line: 24 ]] --[[ Name: updateHealthBar ]]
        -- upvalues: v15 (ref), l_v13_0 (ref), v13 (ref), v4 (ref)
        if v15 then
            v15.Progress.Label.Text = ("%*/%*"):format(l_v13_0, v13);
            v15.Enabled = l_v13_0 > 0;
            local v17 = l_v13_0 / v13;
            v4.target(v15.Progress.Fill, 1, 5, {
                Size = UDim2.fromScale(v17, 1)
            });
        end;
    end;
    local function _(v19) --[[ Line: 34 ]] --[[ Name: updateOverheadVisibility ]]
        -- upvalues: v1 (ref), l_v13_0 (ref), v15 (ref)
        local v20 = v1:GetAnimals()[v19];
        if v20 then
            local l_FirstChild_0 = v20.AnimalModel:FindFirstChild("AnimalOverhead", true);
            if l_FirstChild_0 and l_FirstChild_0:IsA("BillboardGui") then
                local v22 = true;
                if l_v13_0 > 0 then
                    v22 = v15 == nil;
                end;
                l_FirstChild_0.Enabled = v22;
            end;
        end;
    end;
    v11.OnClientEvent:Connect(function(v24) --[[ Line: 44 ]]
        -- upvalues: v12 (ref), v13 (ref), v2 (ref), v1 (ref), v15 (ref), v18 (copy), l_v13_0 (ref)
        v12:Clean();
        v12:Clone(script.VFX).Parent = workspace;
        v13 = v2:GetInstant("ThanksgivingTurkeyService/Health", 10);
        local v25 = 5;
        while not v1:GetAnimals()[v24] and v25 > 0 do
            v25 = v25 - task.wait();
        end;
        local v26 = v1:GetAnimals()[v24];
        if v26 then
            v15 = v12:Clone(script.HealthBar);
            assert(v15);
            v15.Parent = v26.AnimalModel:FindFirstChild("OVERHEAD_ATTACHMENT", true) or v26.AnimalModel.PrimaryPart;
            v18();
            local v27 = v1:GetAnimals()[v24];
            if v27 then
                local l_FirstChild_1 = v27.AnimalModel:FindFirstChild("AnimalOverhead", true);
                if l_FirstChild_1 and l_FirstChild_1:IsA("BillboardGui") then
                    local v29 = true;
                    if l_v13_0 > 0 then
                        v29 = v15 == nil;
                    end;
                    l_FirstChild_1.Enabled = v29;
                end;
            end;
            v12:Add(function() --[[ Line: 66 ]]
                -- upvalues: v15 (ref)
                v15 = nil;
            end);
        end;
    end);
    v10.OnClientEvent:Connect(function(v30) --[[ Line: 72 ]]
        -- upvalues: v12 (ref), v1 (ref), l_v13_0 (ref), v15 (ref)
        v12:Clean();
        local v31 = v1:GetAnimals()[v30];
        if v31 then
            local l_FirstChild_2 = v31.AnimalModel:FindFirstChild("AnimalOverhead", true);
            if l_FirstChild_2 and l_FirstChild_2:IsA("BillboardGui") then
                local v33 = true;
                if l_v13_0 > 0 then
                    v33 = v15 == nil;
                end;
                l_FirstChild_2.Enabled = v33;
            end;
        end;
        l_v13_0 = 10;
    end);
    v8.OnClientEvent:Connect(function(v34, v35) --[[ Line: 78 ]]
        -- upvalues: l_v13_0 (ref), v18 (copy), v1 (ref), v15 (ref)
        l_v13_0 = v35;
        v18();
        local v36 = v1:GetAnimals()[v34];
        if v36 then
            local l_FirstChild_3 = v36.AnimalModel:FindFirstChild("AnimalOverhead", true);
            if l_FirstChild_3 and l_FirstChild_3:IsA("BillboardGui") then
                local v38 = true;
                if l_v13_0 > 0 then
                    v38 = v15 == nil;
                end;
                l_FirstChild_3.Enabled = v38;
            end;
        end;
    end);
    v9.OnClientEvent:Connect(function(v39, v40) --[[ Line: 84 ]]
        -- upvalues: v1 (ref)
        local v41 = v1:GetAnimals()[v39];
        if not v41 then
            return;
        else
            local l_AnimationController_0 = v41.AnimalModel.AnimationController;
            local v43 = l_AnimationController_0.Animator or Instance.new("Animator", l_AnimationController_0);
            local v44 = v40 and script.Animations:FindFirstChild(v40);
            if v44 then
                local v45 = v43:LoadAnimation(v44);
                v45.Looped = false;
                v45:Play();
                v45:AdjustSpeed(v44:GetAttribute("Speed") or 1);
                v41.Collector:Add(function() --[[ Line: 100 ]]
                    -- upvalues: v45 (copy)
                    if v45 then
                        v45:Stop(0);
                        v45:Destroy();
                    end;
                end);
            end;
            return;
        end;
    end);
    v7.OnClientEvent:Connect(function(v46, v47) --[[ Line: 109 ]]
        -- upvalues: v1 (ref)
        local v48 = v1:GetAnimals()[v46];
        if not v48 then
            return;
        else
            local l_AnimationController_1 = v48.AnimalModel.AnimationController;
            local v50 = l_AnimationController_1.Animator or Instance.new("Animator", l_AnimationController_1);
            local v51 = v47 and script.Animations:FindFirstChild(v47);
            if v51 then
                local v52 = v50:LoadAnimation(v51);
                v52:Play();
                v52:AdjustSpeed(v51:GetAttribute("Speed") or 1);
                if v48.TurkeyTrack then
                    v48.TurkeyTrack:Stop(0);
                    v48.TurkeyTrack:Destroy();
                end;
                v48.TurkeyTrack = v52;
                v48.Collector:Add(function() --[[ Line: 132 ]]
                    -- upvalues: v48 (copy)
                    if v48.TurkeyTrack then
                        v48.TurkeyTrack:Stop(0);
                        v48.TurkeyTrack:Destroy();
                    end;
                end);
                return;
            else
                if v48.TurkeyTrack then
                    v48.TurkeyTrack:Stop(0);
                    v48.TurkeyTrack:Destroy();
                end;
                return;
            end;
        end;
    end);
end;
return v6;