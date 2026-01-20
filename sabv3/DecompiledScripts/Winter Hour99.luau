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
local v15 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.FFlags);
local v17 = require(l_ReplicatedStorage_0.Packages.Trove);
local v18 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local v20 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v22 = v18:RemoteEvent((("EventService/%*/DestroyCandyCane"):format(l_Name_0)));
local v23 = v18:RemoteEvent((("EventService/%*/SpawnCandyCane"):format(l_Name_0)));
local v24 = v18:RemoteEvent((("EventService/%*/ClaimCandyCane"):format(l_Name_0)));
local v25 = v18:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v26 = RaycastParams.new();
v26.FilterType = Enum.RaycastFilterType.Include;
v26.FilterDescendantsInstances = {
    workspace.Map
};
local v27 = v17.new();
v7.OnStart = function(_) --[[ Line: 39 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), l_Lighting_0 (copy), v27 (copy), v8 (copy), v14 (copy), v12 (copy), v10 (copy)
    assert((v11:GetActiveEventData(l_Name_0)));
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v27:Add(function() --[[ Line: 46 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v27:Clone(script.CartoonSky).Parent = l_Lighting_0;
    v8:Run("WinterHourEvent", "GrassRecolor");
    v27:Add(function() --[[ Line: 54 ]]
        -- upvalues: v8 (ref)
        v8:Stop("WinterHourEvent", "GrassRecolor");
    end);
    v8:Run("WinterHourEvent", "WallRecolor");
    v27:Add(function() --[[ Line: 59 ]]
        -- upvalues: v8 (ref)
        v8:Stop("WinterHourEvent", "WallRecolor");
    end);
    v8:Run("WinterHourEvent", "WallBottomRecolor");
    v27:Add(function() --[[ Line: 64 ]]
        -- upvalues: v8 (ref)
        v8:Stop("WinterHourEvent", "WallBottomRecolor");
    end);
    v27:Clone(script.Map).Parent = workspace;
    v27:Add(function() --[[ Line: 69 ]]
        -- upvalues: v8 (ref)
        v8:Activate("Blink");
    end);
    v27:Add(v14.observeTag("HideInWinterHour", function(v30) --[[ Line: 73 ]]
        local l_Parent_0 = v30.Parent;
        v30.Parent = script;
        return function() --[[ Line: 76 ]]
            -- upvalues: v30 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 77 ]]
                -- upvalues: v30 (ref), l_Parent_0 (ref)
                v30.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v12:Update();
    v10:UpdateOST();
    v8:Activate("Blink");
    v27:Add(function() --[[ Line: 87 ]]
        -- upvalues: v12 (ref), v10 (ref)
        v12:Update();
        v10:UpdateOST();
    end);
end;
v7.OnStop = function(_) --[[ Line: 93 ]] --[[ Name: OnStop ]]
    -- upvalues: v27 (copy)
    v27:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 97 ]] --[[ Name: OnLoad ]]
    -- upvalues: v9 (copy), v25 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v20 (copy), l_TweenService_0 (copy), l_Players_0 (copy), v13 (copy), v24 (copy), v27 (copy), l_RunService_0 (copy), v15 (copy), v23 (copy), v26 (copy), v22 (copy)
    local _ = function(v34) --[[ Line: 98 ]] --[[ Name: getTargetPosition ]]
        -- upvalues: v9 (ref)
        local v35 = v9:GetAnimals()[v34];
        if not v35 then
            return (Vector3.new(0, 0, 0, 0));
        else
            local _ = nil;
            local l_AnimalModel_0 = v35.AnimalModel;
            return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
        end;
    end;
    v25.OnClientEvent:Connect(function(v39) --[[ Line: 116 ]]
        -- upvalues: v9 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v20 (ref)
        local v40 = v9:GetAnimals()[v39];
        if not v40 then
            return;
        else
            local v41 = v9:GetAnimals()[v39];
            local v42;
            if not v41 then
                v42 = Vector3.new(0, 0, 0, 0);
            else
                local _ = nil;
                local l_AnimalModel_1 = v41.AnimalModel;
                v42 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
            end;
            task.spawn(function() --[[ Line: 124 ]]
                -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), v42 (copy)
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Winter Hour"].Hit, v42);
            end);
            v41 = script.Burst:Clone();
            v41:PivotTo(CFrame.new(v42));
            v41.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v41;
            l_WeldConstraint_0.Part1 = v40.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v41;
            v41.Parent = workspace;
            v20.emit(v41);
            task.delay(5, function() --[[ Line: 141 ]]
                -- upvalues: v41 (copy)
                v41:Destroy();
            end);
            return;
        end;
    end);
    local v46 = {};
    local function v52(v47, v48) --[[ Line: 148 ]] --[[ Name: playCharacterAnimation ]]
        -- upvalues: l_TweenService_0 (ref)
        local l_Character_0 = v47.Character;
        if not l_Character_0 then
            return;
        else
            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return;
            else
                local v51 = script.Reward:Clone();
                v51.CurrencyCandyCane.Text = ("+%*"):format(v48);
                v51.Parent = l_HumanoidRootPart_0;
                l_TweenService_0:Create(v51, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    StudsOffset = Vector3.new(0, 2.5, 2.200000047683716, 0)
                }):Play();
                l_TweenService_0:Create(v51.ImageLabel.ImageLabel, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v51.CurrencyCandyCane, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v51.CurrencyCandyCane.UIStroke, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    Transparency = 1
                }):Play();
                task.delay(5, function() --[[ Line: 179 ]]
                    -- upvalues: v51 (copy)
                    v51:Destroy();
                end);
                return;
            end;
        end;
    end;
    local function v58(v53) --[[ Line: 184 ]] --[[ Name: playScreenCandyCaneAnimation ]]
        -- upvalues: l_Players_0 (ref), v13 (ref)
        local v54 = Random.new();
        for _ = 1, math.min(v53, 30) do
            local v56 = script.Image:Clone();
            v56.Position = UDim2.fromScale(v54:NextNumber(-0.25, 1.25), -(0.25 - v54:NextNumber(0, 0.125)));
            v56.Rotation = v54:NextNumber(-120, 120);
            local v57 = v54:NextNumber(0.15, 0.2);
            v56.Size = UDim2.fromScale(v57, v57);
            v56.Parent = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Effects");
            v13(v56, TweenInfo.new(v54:NextNumber(0.75, 1.3), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Position = v56.Position + UDim2.fromScale(0, 1.5), 
                Rotation = v56.Rotation + v54:NextInteger(-3, 3) * 10
            }, true).Completed:Once(function() --[[ Line: 204 ]]
                -- upvalues: v56 (copy)
                task.wait(1);
                v56:Destroy();
            end);
        end;
    end;
    v24.OnClientEvent:Connect(function(v59, v60, v61) --[[ Line: 211 ]]
        -- upvalues: v46 (copy), v27 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v15 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v58 (copy), v52 (copy)
        local v62 = v46[v59];
        if not v62 then
            return;
        else
            local v63 = v62:Clone();
            v62:Destroy();
            v63.Parent = workspace;
            local l_Position_0 = v63:GetPivot().Position;
            local v65 = 0;
            local _ = v63.Size;
            local v67 = nil;
            v67 = v27:Add(l_RunService_0.PostSimulation:Connect(function(v68) --[[ Line: 230 ]]
                -- upvalues: v65 (ref), v60 (copy), l_Position_0 (copy), l_TweenService_0 (ref), v63 (copy), v15 (ref), v67 (ref), v27 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v58 (ref), v61 (copy), v52 (ref)
                debug.profilebegin("Winter Hour:UpdateCandyAnimation");
                v65 = v65 + v68;
                local v69 = v60.Character and v60.Character:GetPivot().Position or Vector3.new(0, 0, 0, 0);
                local v70 = l_Position_0 + (v69 - l_Position_0) * 0.25 + Vector3.new(0, 10, 0, 0);
                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v65 / 0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
                v63:PivotTo(CFrame.new(v15.quadBezier(l_l_TweenService_0_Value_0, l_Position_0, v70, v69)));
                if l_l_TweenService_0_Value_0 >= 1 and v67 then
                    v27:Remove(v67);
                    v67 = nil;
                    v63:Destroy();
                    task.spawn(function() --[[ Line: 246 ]]
                        -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), v69 (copy)
                        v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["North Pole"].CandyCane2, v69);
                    end);
                    if v60 == l_Players_0.LocalPlayer then
                        v58(v61);
                    end;
                    v52(v60, v61);
                end;
                debug.profileend();
            end));
            return;
        end;
    end);
    v23.OnClientEvent:Connect(function(v72, v73, v74, v75, v76) --[[ Line: 260 ]]
        -- upvalues: v46 (copy), v26 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v15 (ref), v24 (ref)
        local v77 = script.Drop:Clone();
        v77.Name = v72;
        v46[v72] = v77;
        v77.Parent = workspace;
        local l_ProximityPrompt_0 = Instance.new("ProximityPrompt");
        l_ProximityPrompt_0.Name = "ProximityPrompt";
        l_ProximityPrompt_0.ActionText = "";
        l_ProximityPrompt_0.RequiresLineOfSight = false;
        l_ProximityPrompt_0.Enabled = false;
        l_ProximityPrompt_0.Style = Enum.ProximityPromptStyle.Custom;
        l_ProximityPrompt_0:SetAttribute("CustomStyleDisabled", true);
        l_ProximityPrompt_0.Parent = v77;
        local v79 = workspace:Raycast(v74 + Vector3.new(0, 10, 0, 0), Vector3.new(-0, -30, -0, -0), v26);
        v74 = v79 and v79.Position or v74;
        local v80 = v73 + (v74 - v73) * 0.5;
        local l_v74_0 = v74;
        local v82 = math.random(0, 10000);
        local v83 = false;
        local v84 = 0;
        local v92 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 289 ]]
            -- upvalues: v75 (copy), v76 (copy), l_TweenService_0 (ref), v15 (ref), v73 (copy), v80 (copy), l_v74_0 (copy), v82 (copy), v77 (copy), l_ProximityPrompt_0 (copy), v83 (ref), v84 (ref), v24 (ref), v72 (copy)
            local v86 = workspace:GetServerTimeNow() - v75;
            local v87 = v76 == 0 and 1 or math.clamp(v86 / v76, 0, 1);
            local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v87, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            local v89 = v15.quadBezier(l_l_TweenService_0_Value_1, v73, v80, l_v74_0);
            local v90 = os.clock() + v82;
            v77:PivotTo(CFrame.new(v89 + Vector3.new(0, math.sin(v90 * 4) * 0.5 + 4, 0)));
            if l_l_TweenService_0_Value_1 >= 1 then
                l_ProximityPrompt_0.Enabled = true;
                local v91 = os.clock();
                if v83 and v91 - v84 > 0.2 then
                    v84 = v91;
                    v24:FireServer(v72);
                end;
            end;
        end);
        v77.Destroying:Connect(function() --[[ Line: 310 ]]
            -- upvalues: v92 (copy)
            v92:Disconnect();
        end);
        l_ProximityPrompt_0.PromptShown:Connect(function() --[[ Line: 314 ]]
            -- upvalues: v83 (ref)
            v83 = true;
        end);
        l_ProximityPrompt_0.PromptHidden:Connect(function() --[[ Line: 318 ]]
            -- upvalues: v83 (ref)
            v83 = false;
        end);
    end);
    v22.OnClientEvent:Connect(function(v93) --[[ Line: 323 ]]
        -- upvalues: v46 (copy)
        local v94 = v46[v93];
        if not v94 then
            return;
        else
            v94:Destroy();
            v46[v93] = nil;
            return;
        end;
    end);
end;
return v7;