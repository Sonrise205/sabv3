local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.Serialization);
local v9 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v12 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v13 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Packages.Moonlite);
local _ = require(l_ReplicatedStorage_0.Packages.Squash);
local v16 = require(l_ReplicatedStorage_0.Packages.Timer);
local v17 = require(l_ReplicatedStorage_0.Packages.Trove);
local v18 = require(l_ReplicatedStorage_0.Packages.Spr);
local v19 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local _ = require(l_ReplicatedStorage_0.Controllers.NewPlayersController);
local v22 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local v24 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v26 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local v27 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v28 = require(l_ReplicatedStorage_0.Shared.VFX);
local v29 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local v32 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local _ = require(l_ReplicatedStorage_0.Datas.Mutations);
local v35 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v36 = require(l_ReplicatedStorage_0.Datas.Animals);
local v37 = v19:RemoteEvent("CraftingMachineService/CraftNow");
local v38 = v19:RemoteEvent("CraftingMachineService/Update");
local v39 = v19:RemoteEvent("CraftingMachineService/Return");
local v40 = v19:RemoteEvent("CraftingMachineService/Claim");
local v41 = v19:RemoteFunction("CraftingMachineService/Delivery");
local v42 = v19:RemoteFunction("CraftingMachineService/Start");
local v43 = v19:RemoteFunction("CraftingMachineService/Fetch");
local _ = v19:RemoteEvent("ShopService/Purchase");
local _ = workspace:WaitForChild("RenderedMovingAnimals");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CraftingMachine_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("CraftingMachine").CraftingMachine;
local l_Content_0 = l_CraftingMachine_0.Content;
local l_Time_0 = l_Content_0.Time;
local l_Buy_0 = l_Content_0.Buy;
local l_Close_0 = l_CraftingMachine_0.Header.Close;
local l_BrainrotName_0 = l_Content_0.BrainrotName;
local _ = v17.new();
local _ = v17.new();
local v55 = nil;
local v56 = nil;
local v57 = "Epic";
local v58 = nil;
local v59 = false;
local v60 = {};
local function v69() --[[ Line: 102 ]] --[[ Name: updateVFX ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (copy), v59 (ref), v28 (copy)
    local v61 = v9:Get(l_LocalPlayer_0);
    if not v61 then
        return;
    elseif v59 then
        return;
    else
        local l_CraftingMachine_1 = workspace:FindFirstChild("CraftingMachine");
        if not l_CraftingMachine_1 then
            return;
        else
            local v63 = v61:Get("CraftingMachine");
            if not v63 then
                return;
            else
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                if v63.Rarity and v63.StartTime and v63.FinishTime then
                    local v65 = math.clamp((l_workspace_ServerTimeNow_0 - v63.StartTime) / (v63.FinishTime - v63.StartTime), 0, 1);
                    local v66 = l_CraftingMachine_1.VFX[v63.Rarity];
                    v28.enable(v66.ChargingModel.Charging.Charge);
                    v66.ChargingModel:ScaleTo((math.lerp(0.25, 1, v65)));
                    for _, v68 in v66.ChargingModel.Charging.Charge:GetDescendants() do
                        if v68:IsA("ParticleEmitter") then
                            v68.TimeScale = math.lerp(0.3, 0.7, v65);
                        end;
                    end;
                    if not l_CraftingMachine_1.ChargeSoundPart.Sound.IsPlaying then
                        l_CraftingMachine_1.ChargeSoundPart.Sound:Play();
                        return;
                    end;
                else
                    v28.disable(l_CraftingMachine_1.VFX);
                    if l_CraftingMachine_1.ChargeSoundPart.Sound.IsPlaying then
                        l_CraftingMachine_1.ChargeSoundPart.Sound:Stop();
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local v70 = v17.new();
local function v79() --[[ Line: 149 ]] --[[ Name: updateTimer ]]
    -- upvalues: v70 (copy), v9 (copy), l_LocalPlayer_0 (copy), l_Time_0 (copy), v56 (ref), v57 (ref), v27 (copy)
    v70:Clean();
    local v71 = v9:Get(l_LocalPlayer_0);
    if not v71 then
        return;
    else
        l_Time_0.Visible = false;
        local v72 = v71:Get("CraftingMachine.FinishTime");
        local l_CraftingMachine_2 = workspace:FindFirstChild("CraftingMachine");
        if not l_CraftingMachine_2 then
            return;
        else
            local l_Countdown_0 = l_CraftingMachine_2.Overhead.BillboardGui.Countdown;
            if not l_Countdown_0 then
                return;
            else
                l_Time_0.Visible = true;
                local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                local v76 = v56 and v57 and v56.List[v57];
                if v76 then
                    l_Time_0.Text = ("Crafting Time (<font color=\"#ffff00\">%*</font>)"):format((v27:E(v76.CraftTime)));
                else
                    l_Time_0.Text = "";
                end;
                if not v72 then
                    local v77 = math.max((v56 and v56.Refresh or 0) - l_workspace_ServerTimeNow_1, 0);
                    l_Countdown_0.Text = ("Refreshes in %*"):format((v27:E(v77)));
                    return;
                else
                    local v78 = math.max(v72 - l_workspace_ServerTimeNow_1, 0);
                    l_Countdown_0.Text = v78 <= 0 and "READY" or v27:E(v78);
                    return;
                end;
            end;
        end;
    end;
end;
local v80 = v17.new();
local function v108() --[[ Line: 193 ]] --[[ Name: updateSelection ]]
    -- upvalues: v58 (ref), v57 (ref), v9 (copy), l_LocalPlayer_0 (copy), v80 (copy), v56 (ref), l_Content_0 (copy), l_BrainrotName_0 (copy), v35 (copy), v12 (copy), v36 (copy), v32 (copy), v29 (copy), v39 (copy), l_Buy_0 (copy), v26 (copy), v42 (copy), v22 (copy), v79 (copy)
    if v58 == v57 then
        return;
    else
        local v81 = v9:Get(l_LocalPlayer_0);
        if not v81 then
            return;
        else
            v80:Clean();
            if not v56 then
                return;
            else
                local v82 = v57 and v56.List[v57];
                if v57 and not v82 then
                    return;
                else
                    v58 = v57;
                    if not v57 then
                        l_Content_0.Visible = false;
                        return;
                    else
                        l_Content_0.Visible = true;
                        l_BrainrotName_0.Title.Text = v82.Name;
                        local v83 = v35[v57];
                        if v83.GradientPreset then
                            l_BrainrotName_0.Title.TextColor3 = Color3.new(1, 1, 1);
                            l_BrainrotName_0.UIStroke.Color = Color3.new(1, 1, 1);
                            v80:Add(v12.apply(l_BrainrotName_0.Title, v83.GradientPreset));
                            v80:Add(v12.apply(l_BrainrotName_0.UIStroke, v83.GradientPreset));
                        else
                            l_BrainrotName_0.Title.TextColor3 = v83.Color;
                            l_BrainrotName_0.UIStroke.Color = v83.Color;
                        end;
                        if v36[v82.Name] then
                            local v84 = v32:AttachOnViewport(v82.Name, l_BrainrotName_0.ViewportFrame, true);
                            if v84 then
                                v80:Add(v84);
                            end;
                        end;
                        local v85 = {};
                        for v86, v87 in v82.Recipe do
                            local v88 = v36[v87];
                            if v88 then
                                local v89 = v35[v88.Rarity];
                                local v90 = v80:Clone(l_Content_0.Brainrots.Template);
                                v90.LayoutOrder = v89.Weight * 100 + v86;
                                v90.Title.Text = v87;
                                v90.Title.TextColor3 = Color3.new(1, 1, 1);
                                if v89.GradientPreset then
                                    v90.UIStroke.Color = Color3.new(1, 1, 1);
                                    v80:Add(v12.apply(v90.UIStroke, v89.GradientPreset));
                                else
                                    v90.UIStroke.Color = v89.Color;
                                end;
                                v90.Visible = true;
                                v90.Return.Visible = false;
                                v90.ViewportFrame.ImageColor3 = Color3.new(0, 0, 0);
                                local v91 = v32:AttachOnViewport(v87, v90.ViewportFrame, true);
                                if v91 then
                                    v80:Add(v91);
                                end;
                                v90.Parent = l_Content_0.Brainrots;
                                if not v85[v87] then
                                    v85[v87] = {};
                                end;
                                table.insert(v85[v87], v90);
                                local v92 = v80:Add(v29.new(v90.Return));
                                v92:Animate();
                                v80:Add(v92.OnActivated:Connect(function() --[[ Line: 283 ]]
                                    -- upvalues: v81 (copy), v87 (copy), v39 (ref)
                                    for v93, v94 in (v81:Get("AnimalPodiums")) do
                                        if type(v94) == "table" and v94.Index == v87 and v94.Machine and v94.Machine.Type == "Crafting" and not v94.Machine.Active then
                                            v39:FireServer(v93);
                                            return;
                                        end;
                                    end;
                                end));
                            end;
                        end;
                        local function v106() --[[ Line: 294 ]] --[[ Name: updateBrainrotFrame ]]
                            -- upvalues: v81 (copy), v85 (copy), l_Buy_0 (ref)
                            local v95 = v81:Get("AnimalPodiums");
                            local v96 = {};
                            for _, v98 in v95 do
                                if type(v98) == "table" and v98.Machine and v98.Machine.Type == "Crafting" and not v98.Machine.Active then
                                    v96[v98.Index] = (v96[v98.Index] or 0) + 1;
                                end;
                            end;
                            local v99 = true;
                            for v100, v101 in v85 do
                                local v102 = v96[v100] or 0;
                                for v103, v104 in v101 do
                                    local v105 = v103 <= v102;
                                    v104.Return.Visible = v105;
                                    v104.ViewportFrame.ImageColor3 = if v105 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0);
                                    if not v105 then
                                        v99 = false;
                                    end;
                                end;
                            end;
                            l_Buy_0.Visible = v99;
                        end;
                        v80:Add(v81:OnChanged("AnimalAddedOrRemoved", v106));
                        v80:Add(task.spawn(v106));
                        l_Buy_0.Price.Text = ("$%*"):format((v26:ToString(v82.Cost)));
                        local v107 = v80:Add(v29.new(l_Buy_0));
                        v107:Animate();
                        v80:Add(v107.OnActivated:Connect(function() --[[ Line: 329 ]]
                            -- upvalues: v42 (ref), v57 (ref), v82 (copy), v22 (ref)
                            if not v42:InvokeServer(v57, v82.Name) then
                                return;
                            else
                                v22:SetState("CraftingMachine", false);
                                return;
                            end;
                        end));
                        v79();
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
local v109 = v17.new();
local function v116() --[[ Line: 345 ]] --[[ Name: updateList ]]
    -- upvalues: v109 (copy), v56 (ref), v35 (copy), l_CraftingMachine_0 (copy), v12 (copy), v29 (copy), v57 (ref), v108 (copy), v36 (copy), v32 (copy)
    v109:Clean();
    if not v56 then
        return;
    else
        for v110, v111 in v56.List do
            local v112 = v35[v110];
            local v113 = v109:Clone(l_CraftingMachine_0.List.Template);
            v113.LayoutOrder = v112 and v112.Weight or 0;
            v113.Title.Text = v111.Name;
            if v112.GradientPreset then
                v113.Title.TextColor3 = Color3.new(1, 1, 1);
                v113.UIStroke.Color = Color3.new(1, 1, 1);
                v109:Add(v12.apply(v113.Title, v112.GradientPreset));
                v109:Add(v12.apply(v113.UIStroke, v112.GradientPreset));
            else
                v113.Title.TextColor3 = v112.Color;
                v113.UIStroke.Color = v112.Color;
            end;
            v113.Visible = true;
            v113.Parent = l_CraftingMachine_0.List;
            local v114 = v109:Add(v29.new(v113));
            v114:Animate();
            v109:Add(v114.OnActivated:Connect(function() --[[ Line: 373 ]]
                -- upvalues: v57 (ref), v110 (copy), v108 (ref)
                v57 = v110;
                v108();
            end));
            if v36[v111.Name] then
                local v115 = v32:AttachOnViewport(v111.Name, v113.ViewportFrame, true);
                if v115 then
                    v109:Add(v115);
                end;
            end;
        end;
        v108();
        return;
    end;
end;
v60.Start = function(_) --[[ Line: 389 ]] --[[ Name: Start ]]
    -- upvalues: l_CraftingMachine_0 (copy), v55 (ref), v22 (copy), l_Close_0 (copy), v9 (copy), l_LocalPlayer_0 (copy), v79 (copy), v16 (copy), v69 (copy), v13 (copy), v17 (copy), v40 (copy), v37 (copy), l_Players_0 (copy), v41 (copy), v24 (copy), l_ReplicatedStorage_0 (copy), l_HttpService_0 (copy), v59 (ref), v28 (copy), v38 (copy), v58 (ref), v56 (ref), v116 (copy), v43 (copy), v27 (copy), v18 (copy)
    l_CraftingMachine_0.Visible = false;
    v55 = v22:Register("CraftingMachine", l_CraftingMachine_0, "TopQuint");
    v55:AttachCloseButton(l_Close_0);
    v55:Close();
    v9:WaitAndCall(l_LocalPlayer_0, function(v118) --[[ Line: 398 ]]
        -- upvalues: v79 (ref)
        local function v119() --[[ Line: 399 ]] --[[ Name: update ]]
            -- upvalues: v79 (ref)
            task.spawn(v79);
        end;
        v118:OnChanged("CraftingMachine", v119);
        v118:OnChanged("CraftingMachine.Brainrot", v119);
        v118:OnChanged("CraftingMachine.Rarity", v119);
        v118:OnChanged("CraftingMachine.FinishTime", v119);
        v118:OnChanged("CraftingMachine.StartTime", v119);
        task.spawn(v119);
    end);
    v16.Simple(1, function() --[[ Line: 411 ]]
        -- upvalues: v69 (ref), v79 (ref)
        task.spawn(v69);
        task.spawn(v79);
    end);
    v13.observeTag("CraftingMachinePrompt", function(v120) --[[ Line: 416 ]]
        -- upvalues: v17 (ref), v9 (ref), l_LocalPlayer_0 (ref), v16 (ref), v40 (ref), v37 (ref), v22 (ref)
        local v121 = v17.new();
        local function v125() --[[ Line: 419 ]] --[[ Name: updatePrompt ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v120 (copy)
            local v122 = v9:Wait(l_LocalPlayer_0);
            if not v122 then
                return;
            else
                local v123 = v122:Get("CraftingMachine.StartTime");
                local v124 = v122:Get("CraftingMachine.FinishTime");
                if v124 and v124 ~= 0 and v124 <= workspace:GetServerTimeNow() then
                    v120.ActionText = "Claim";
                    return;
                elseif v123 and v123 ~= 0 then
                    v120.ActionText = "Craft Now";
                    return;
                else
                    v120.ActionText = "Craft Machine";
                    return;
                end;
            end;
        end;
        v121:Add(task.spawn(function() --[[ Line: 436 ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v125 (copy), v121 (copy), v16 (ref)
            local v126 = v9:Wait(l_LocalPlayer_0);
            if not v126 then
                return;
            else
                v126:OnChanged("CraftingMachine", v125);
                v121:Add(v16.Simple(1, v125));
                task.spawn(v125);
                return;
            end;
        end));
        v121:Add(v120.Triggered:Connect(function() --[[ Line: 447 ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v40 (ref), v37 (ref), v22 (ref)
            local v127 = v9:Get(l_LocalPlayer_0);
            if not v127 then
                return;
            else
                local v128 = v127:Get("CraftingMachine.StartTime");
                local v129 = v127:Get("CraftingMachine.FinishTime");
                if v129 and v129 ~= 0 and v129 <= workspace:GetServerTimeNow() then
                    v40:FireServer();
                    return;
                elseif v128 and v128 ~= 0 then
                    v37:FireServer();
                    return;
                else
                    v22:Toggle("CraftingMachine");
                    return;
                end;
            end;
        end));
        return function() --[[ Line: 464 ]]
            -- upvalues: v121 (copy)
            v121:Destroy();
        end;
    end);
    v13.observeTag("CraftingMachine", function(v130) --[[ Line: 469 ]]
        -- upvalues: v17 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v41 (ref), v24 (ref), l_ReplicatedStorage_0 (ref), v79 (ref)
        local v131 = v17.new();
        for _, v133 in v130.Hitboxes:GetChildren() do
            v131:Add(v133.Touched:Connect(function(v134) --[[ Line: 473 ]]
                -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v41 (ref), v133 (copy), v24 (ref), l_ReplicatedStorage_0 (ref), v79 (ref)
                if v134.Name ~= "HumanoidRootPart" then
                    return;
                else
                    local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v134.Parent);
                    if not l_l_Players_0_PlayerFromCharacter_0 or l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                        return;
                    else
                        if l_l_Players_0_PlayerFromCharacter_0:GetAttribute("StealingIndex") then
                            local v136, _, _ = v41:InvokeServer(v133);
                            if not v136 then
                                return;
                            else
                                task.spawn(function() --[[ Line: 490 ]]
                                    -- upvalues: v24 (ref), l_ReplicatedStorage_0 (ref)
                                    v24:PlaySound(l_ReplicatedStorage_0.Sounds.Sfx["Fuse Machine"].Deposit);
                                end);
                                v79();
                            end;
                        end;
                        return;
                    end;
                end;
            end));
        end;
        return function() --[[ Line: 500 ]]
            -- upvalues: v131 (copy)
            v131:Destroy();
        end;
    end);
    local v139 = {};
    v37.OnClientEvent:Connect(function(v140) --[[ Line: 506 ]]
        -- upvalues: l_HttpService_0 (ref), v139 (copy), v59 (ref), v28 (ref)
        local l_CraftingMachine_3 = workspace:FindFirstChild("CraftingMachine");
        if not l_CraftingMachine_3 then
            return;
        else
            local v142 = l_HttpService_0:GenerateGUID(false);
            v139[v142] = true;
            v59 = next(v139) ~= nil;
            local v143 = l_CraftingMachine_3.VFX[v140];
            v143.ChargingModel:ScaleTo(1);
            for _, v145 in v143.ChargingModel.Charging.Charge:GetDescendants() do
                if v145:IsA("ParticleEmitter") then
                    v145.TimeScale = 1;
                end;
            end;
            v28.enable(v143);
            v143.SoundPart.Sound:Play();
            if l_CraftingMachine_3.ChargeSoundPart.Sound.IsPlaying then
                l_CraftingMachine_3.ChargeSoundPart.Sound:Stop();
            end;
            task.wait(1.5);
            v28.disable(v143);
            v28.emit(v143.Burst);
            v139[v142] = nil;
            v59 = next(v139) ~= nil;
            return;
        end;
    end);
    v38.OnClientEvent:Connect(function(v146) --[[ Line: 536 ]]
        -- upvalues: v58 (ref), v56 (ref), v116 (ref)
        v58 = nil;
        v56 = v146;
        v116();
    end);
    v56 = v43:InvokeServer() or v56;
    task.spawn(v116);
    v16.Simple(1, function() --[[ Line: 546 ]]
        -- upvalues: v56 (ref), l_CraftingMachine_0 (ref), v27 (ref)
        local v147 = (v56 and v56.Refresh or 0) - workspace:GetServerTimeNow();
        l_CraftingMachine_0.Timer.Text = ("Refreshes in %*"):format((v27:E((math.max(v147, 0)))));
    end, true);
    v9:WaitAndCall(l_LocalPlayer_0, function() --[[ Line: 552 ]]
        -- upvalues: v116 (ref)
        v116();
    end);
    task.spawn(function() --[[ Line: 556 ]]
        -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v18 (ref)
        local v148 = v9:Wait(l_LocalPlayer_0);
        if v148 then
            local v149 = {
                Color3.fromRGB(163, 162, 165), 
                Color3.fromRGB(93, 176, 55), 
                Color3.fromRGB(179, 168, 48), 
                Color3.fromRGB(88, 173, 106)
            };
            local v150 = Random.new();
            while true do
                local v151 = 1;
                local v152 = 3;
                local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
                local v154 = v148:Get("CraftingMachine.StartTime");
                local v155 = v148:Get("CraftingMachine.FinishTime");
                if v154 and v155 and workspace:GetServerTimeNow() < v155 then
                    local v156 = math.clamp((l_workspace_ServerTimeNow_2 - v154) / (v155 - v154), 0, 1);
                    v151 = math.lerp(0.5, 0.25, v156);
                    v152 = math.lerp(4, 5, v156);
                end;
                task.wait(v151);
                local l_CraftingMachine_4 = workspace:FindFirstChild("CraftingMachine");
                if l_CraftingMachine_4 then
                    local l_Cubes_0 = l_CraftingMachine_4:FindFirstChild("Cubes");
                    if l_Cubes_0 then
                        for _, v160 in l_Cubes_0:GetChildren() do
                            v18.target(v160, 1, v152, {
                                Color = v149[v150:NextInteger(1, #v149)]
                            });
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
return v60;