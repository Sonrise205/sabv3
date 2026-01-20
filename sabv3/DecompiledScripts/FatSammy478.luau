local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {
    Duration = {
        Default = 600
    }
};
local v7 = require(l_ReplicatedStorage_0.Controllers.ConfirmationController);
local v8 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v11 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v12 = require(l_ReplicatedStorage_0.Datas.Animals);
local _ = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v14 = require(l_ReplicatedStorage_0.Packages.Trove);
local v15 = require(l_ReplicatedStorage_0.Packages.Net);
local v16 = require(l_ReplicatedStorage_0.Packages.Spr);
local v17 = require(l_ReplicatedStorage_0.Shared.VFX);
local v18 = v15:RemoteEvent("EventService/FatSammy/PlaySpawnSequence");
local v19 = v15:RemoteEvent("EventService/FatSammy/PlayEatAnimation");
local v20 = v15:RemoteEvent("EventService/FatSammy/Delivery");
local l_Name_0 = script.Name;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Model_0 = workspace.Events.FatSammy.Model;
local l_Sammy_0 = l_Model_0.Sammy;
local l_Animator_0 = l_Sammy_0.AnimationController.Animator;
local v26 = false;
local v27 = v14.new();
v6.OnStart = function(_) --[[ Line: 44 ]] --[[ Name: OnStart ]]
    -- upvalues: v8 (copy), l_Name_0 (copy), v14 (copy), v27 (copy), v26 (ref), v10 (copy), l_Animator_0 (copy), v19 (copy), v9 (copy), l_ReplicatedStorage_0 (copy), l_Sammy_0 (copy), v18 (copy), v17 (copy), v11 (copy)
    assert((v8:GetActiveEventData(l_Name_0)));
    local v29 = v14.new();
    v27:Add(function() --[[ Line: 49 ]]
        -- upvalues: v26 (ref), v29 (copy)
        while v26 do
            task.wait();
        end;
        v29:Destroy();
    end);
    local v30 = v10.loadAnimation(v29, l_Animator_0, script.Idle);
    local v31 = v10.loadAnimation(v29, l_Animator_0, script.PointUp);
    local v32 = v10.loadAnimation(v29, l_Animator_0, script.PoseToBeam);
    local v33 = v10.loadAnimation(v29, l_Animator_0, script.BeamLoop);
    local v34 = v10.loadAnimation(v29, l_Animator_0, script.BeamResume);
    local v35 = v10.loadAnimation(v29, l_Animator_0, script.Eat);
    v29:Add(v31:GetMarkerReachedSignal("Freeze"):Connect(function() --[[ Line: 63 ]]
        -- upvalues: v31 (copy)
        v31:AdjustSpeed(0);
    end));
    v30.Looped = true;
    v30:Play();
    v27:Add(v19.OnClientEvent:Connect(function() --[[ Line: 70 ]]
        -- upvalues: v26 (ref), v35 (copy), v9 (ref), l_ReplicatedStorage_0 (ref), l_Sammy_0 (ref)
        if v26 then
            return;
        else
            v35:AdjustWeight(1);
            v35:Play();
            task.wait(0.1);
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events.FatSammy.Eat, l_Sammy_0:GetPivot().Position);
            return;
        end;
    end));
    v27:Add(v18.OnClientEvent:Connect(function(v36) --[[ Line: 82 ]]
        -- upvalues: v14 (ref), v26 (ref), v31 (copy), v35 (copy), v9 (ref), l_ReplicatedStorage_0 (ref), l_Sammy_0 (ref), v17 (ref), v11 (ref), v32 (copy), v33 (copy), v34 (copy)
        local function _(v37) --[[ Line: 83 ]] --[[ Name: getTimeUntil ]]
            -- upvalues: v36 (copy)
            return (math.max(v36 + v37 - workspace:GetServerTimeNow(), 0));
        end;
        local function _(v39) --[[ Line: 87 ]] --[[ Name: waitUntil ]]
            -- upvalues: v36 (copy)
            return task.wait((math.max(v36 + v39 - workspace:GetServerTimeNow(), 0)));
        end;
        local v41 = v14.new();
        v26 = true;
        v41:Add(function() --[[ Line: 94 ]]
            -- upvalues: v26 (ref)
            v26 = false;
        end);
        v41:Add(task.delay(math.max(v36 + 11 - workspace:GetServerTimeNow(), 0), function() --[[ Line: 98 ]]
            -- upvalues: v41 (copy)
            v41:Destroy();
        end));
        v31:Play();
        v35:AdjustWeight(0);
        if math.max(v36 + 5.5 - workspace:GetServerTimeNow(), 0) >= 4.5 then
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events.FatSammy.Charge, l_Sammy_0:GetPivot().Position, false);
        end;
        local v42 = task.wait((math.max(v36 + 0.5 - workspace:GetServerTimeNow(), 0)));
        v42 = v17.copy(script.Absorb, l_Sammy_0.Taco.CFrame, l_Sammy_0.Taco);
        v41:Add(v42);
        v17.weldPosition(v42, l_Sammy_0.Taco);
        v17.enable(v42);
        local v43 = v17.copy(script.Orb, l_Sammy_0.Taco.CFrame, l_Sammy_0.Taco);
        v41:Add(v43);
        local _ = v17.weldPosition(v43, l_Sammy_0.Taco);
        v17.enable(v43);
        local l_Model_1 = Instance.new("Model");
        v41:Add(l_Model_1);
        v43.Parent = l_Model_1;
        l_Model_1.Parent = l_Sammy_0.Taco;
        local l_NumberValue_0 = Instance.new("NumberValue");
        v41:Add(l_NumberValue_0);
        l_NumberValue_0.Value = 0.1;
        l_Model_1:ScaleTo(0.1);
        l_NumberValue_0.Changed:Connect(function(v47) --[[ Line: 132 ]]
            -- upvalues: l_Model_1 (copy)
            l_Model_1:ScaleTo(v47);
        end);
        local v48 = v11(l_NumberValue_0, TweenInfo.new(math.max(v36 + 5 - workspace:GetServerTimeNow(), 0), Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            Value = 1
        });
        local v49 = task.wait((math.max(v36 + 5 - workspace:GetServerTimeNow(), 0)));
        v48:Cancel();
        v48:Destroy();
        l_Model_1:ScaleTo(1);
        v17.disable(v42);
        v32:Play();
        v49 = task.wait((math.max(v36 + 5.5 - workspace:GetServerTimeNow(), 0)));
        v49 = v41:Clone(script.Beam);
        v49.Parent = workspace;
        v17.enable(v49);
        local l_att0_0 = v49.att0;
        local l_WorldPosition_0 = v49.att0.WorldPosition;
        v41:Add(l_att0_0);
        l_att0_0.Parent = workspace.Terrain;
        l_att0_0.WorldCFrame = v43.att1.WorldCFrame;
        for _, v53 in v49.beams:GetChildren() do
            if v53:IsA("Beam") then
                v53.Attachment1 = v43.att1;
            end;
        end;
        local v54 = v17.copy(script.Burst, l_Sammy_0.Taco.CFrame, workspace);
        v41:Add(v54);
        v17.emit(v54);
        v31:Stop();
        v33:Play();
        v17.disable(v43);
        v11(l_att0_0, TweenInfo.new(math.max(v36 + 6.5 - workspace:GetServerTimeNow(), 0), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Position = l_WorldPosition_0
        });
        if math.max(v36 + 6.5 - workspace:GetServerTimeNow(), 0) >= 0.5 then
            local v55 = v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events.FatSammy.Shot, nil, false);
            if v55 then
                v55.Parent = l_att0_0;
            end;
        end;
        local v56 = task.wait((math.max(v36 + 6.5 - workspace:GetServerTimeNow(), 0)));
        v17.disable(l_att0_0);
        for _, v58 in v49.beams:GetChildren() do
            if v58:IsA("Beam") then
                v11(v58, TweenInfo.new(math.max(v36 + 7.7 - workspace:GetServerTimeNow(), 0), Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Width0 = 0, 
                    Width1 = 0
                });
            end;
        end;
        v56 = task.wait((math.max(v36 + 7.3 - workspace:GetServerTimeNow(), 0)));
        v34:Play();
        task.delay(0.5, function() --[[ Line: 205 ]]
            -- upvalues: v33 (ref)
            v33:Stop();
        end);
    end));
end;
v6.OnStop = function(_) --[[ Line: 211 ]] --[[ Name: OnStop ]]
    -- upvalues: v27 (copy)
    v27:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 215 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), l_Sammy_0 (copy), l_Model_0 (copy), v16 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v7 (copy), v26 (ref), v12 (copy), v20 (copy)
    task.spawn(pcall, function() --[[ Line: 216 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    local function v65() --[[ Line: 221 ]] --[[ Name: updateScale ]]
        -- upvalues: l_Sammy_0 (ref), l_Model_0 (ref), v16 (ref)
        local v61 = l_Sammy_0:GetAttribute("ScaleAlpha") or 0;
        local v62 = math.lerp(1, 2, v61);
        l_Sammy_0:PivotTo(l_Model_0.SammySpawnPosition:GetPivot());
        v16.target(l_Model_0.SammyBelly.Upper.Motor, 0.8, 1.5, {
            C0 = CFrame.new(0, v62 * -0.454, v62 * 0.445), 
            C1 = CFrame.new(0, 0, (1 - v61) * 0.445 * v62)
        });
        v16.target(l_Model_0.SammyBelly.Bottom.Motor, 0.8, 1.5, {
            C0 = CFrame.new(0, v62 * 0.433, v62 * 0.951), 
            C1 = CFrame.new(0, 0, (1 - v61) * 0.951 * v62)
        });
        v16.target(l_Sammy_0, 0.8, 1.5, {
            Scale = v62
        });
        v16.target(l_Model_0.SammyBelly, 0.8, 1.5, {
            Scale = math.lerp(0.45, 0.667, v61) * v62
        });
        for _, v64 in l_Model_0.SammyArms:GetChildren() do
            v16.target(v64, 0.8, 1.5, {
                Scale = math.lerp(0.6, 1, v61) * v62
            });
        end;
    end;
    l_Sammy_0:GetAttributeChangedSignal("ScaleAlpha"):Connect(v65);
    task.spawn(v65);
    local v66 = false;
    workspace.Events.FatSammy.Model.DeliveryHitbox.Touched:Connect(function(v67) --[[ Line: 257 ]]
        -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v7 (ref), v66 (ref), v26 (ref), v12 (ref), v20 (ref)
        if v67.Name ~= "HumanoidRootPart" then
            return;
        else
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v67.Parent);
            if not l_l_Players_0_PlayerFromCharacter_0 then
                return;
            elseif l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                return;
            elseif v7:IsInPrompt() or v66 or v26 then
                return;
            else
                local l_l_l_Players_0_PlayerFromCharacter_0_Attribute_0 = l_l_Players_0_PlayerFromCharacter_0:GetAttribute("StealingIndex");
                if not l_l_l_Players_0_PlayerFromCharacter_0_Attribute_0 then
                    return;
                else
                    v66 = true;
                    task.delay(0.5, function() --[[ Line: 281 ]]
                        -- upvalues: v66 (ref)
                        v66 = false;
                    end);
                    local l_Rarity_0 = v12[l_l_l_Players_0_PlayerFromCharacter_0_Attribute_0].Rarity;
                    local v71 = true;
                    if l_Rarity_0 ~= "OG" then
                        v71 = true;
                        if l_Rarity_0 ~= "Admin" then
                            v71 = true;
                            if l_Rarity_0 ~= "Spooky" then
                                v71 = true;
                                if l_Rarity_0 ~= "Taco" then
                                    v71 = true;
                                    if l_Rarity_0 ~= "Secret" then
                                        v71 = true;
                                        if l_Rarity_0 ~= "Brainrot God" then
                                            v71 = true;
                                            if l_Rarity_0 ~= "Mythic" then
                                                v71 = l_Rarity_0 == "Festive";
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v71 and not v7:Show((("Are you sure you want to give this %* Brainrot to Sammy?"):format(l_Rarity_0))) then
                        return;
                    else
                        v20:FireServer();
                        return;
                    end;
                end;
            end;
        end;
    end);
end;
return v6;