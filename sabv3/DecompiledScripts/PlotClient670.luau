local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v5 = require(l_Packages_0.Synchronizer);
local v6 = require(l_Packages_0.Trove);
local v7 = require(l_Packages_0.Timer);
local v8 = require(l_Packages_0.Net);
local v9 = require(l_ReplicatedStorage_0.Packages.FFlags);
local _ = l_ReplicatedStorage_0:WaitForChild("Classes");
local v11 = require(script.AnimalPrompt);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v13 = require(l_Utils_0.TimeUtils);
local v14 = require(l_Utils_0.NumberUtils);
local l_Animals_0 = l_ReplicatedStorage_0:WaitForChild("Models").Animals;
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v17 = require(l_Shared_0.Animals);
local _ = l_ReplicatedStorage_0:WaitForChild("Overheads").AnimalOverhead;
local l_Animals_1 = l_ReplicatedStorage_0:WaitForChild("Animations").Animals;
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local _ = require(l_Datas_0.Game);
local v22 = require(l_Datas_0.Animals);
local v23 = require(l_Datas_0.Rarities);
local v24 = require(l_Datas_0.Mutations);
local v25 = require(l_Datas_0.Bases);
local v26 = require(l_Datas_0.UnlockBase);
local v27 = require(l_Datas_0.Traits);
local v28 = require(l_Datas_0.ServerData);
local v29 = require(l_ReplicatedStorage_0.Datas.FuseMachineData);
local v30 = require(l_ReplicatedStorage_0.Shared.VirtualInstance);
local l_Shared_1 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v32 = require(l_Shared_1.Friends);
local v33 = require(l_ReplicatedStorage_0.Controllers.AnimationSyncController);
local v34 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v35 = require(l_ReplicatedStorage_0.Controllers.ConfirmationController);
local v36 = require(l_ReplicatedStorage_0.Controllers.FastOverheadController);
local v37 = v8:RemoteEvent("ShopService/Purchase");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v39 = v8:RemoteEvent("PlotService/Sell");
local v40 = v8:RemoteEvent("StealService/Grab");
local v41 = v8:RemoteEvent("PlotService/Open");
local v42 = v8:RemoteEvent("PlotService/ClaimCoins");
local v43 = v8:RemoteEvent("fce51e06-a587-4ff0-9e19-869eb1859a01");
local v44 = v8:RemoteEvent("680db8c7-c46a-492c-b451-6e980910902c");
local v45 = v8:RemoteEvent("PlotService/ToggleFriends");
local l_FireServer_0 = v45.FireServer;
local v47 = {};
v47.__index = v47;
v47.ClearIndex = function(v48, v49) --[[ Line: 114 ]] --[[ Name: ClearIndex ]]
    if v48.AnimalsModels[v49] then
        v48.AnimalsModels[v49]:Destroy();
        v48.AnimalsModels[v49] = nil;
    end;
    if v48.ModelsCollector[v49] then
        v48.ModelsCollector[v49]:Clean();
        v48.ModelsCollector[v49] = nil;
    end;
end;
v47.UpdateModel = function(v50, v51) --[[ Line: 126 ]] --[[ Name: UpdateModel ]]
    -- upvalues: v6 (copy), l_Animals_0 (copy), v17 (copy), v9 (copy), v28 (copy), l_Animals_1 (copy), v33 (copy), v22 (copy), v23 (copy), v36 (copy), v13 (copy), v14 (copy), l_LocalPlayer_0 (copy), v24 (copy), v4 (copy), v27 (copy), v7 (copy)
    local v52 = v50.Channel:Get("AnimalList") or {};
    if v52[v51] and v50.AnimalsIndex[v51] ~= v52[v51].Index then
        v50:ClearIndex(v51);
        v50.AnimalsIndex[v51] = v52[v51].Index;
    end;
    local v53 = v50.AnimalsModels[v51];
    local v54 = not v53 and type(v52[v51]) == "table";
    if not v54 and v53 then
        if v53:GetAttribute("Mutation") ~= v52[v51].Mutation then
            v54 = true;
        end;
        if type(v52[v51].Traits) == "table" and v53:GetAttribute("Traits") ~= table.concat(v52[v51].Traits, ",") then
            v54 = true;
        end;
        if type(v52[v51].Traits) ~= "table" and v53:GetAttribute("Traits") ~= nil then
            v54 = true;
        end;
    end;
    if v54 then
        v50:ClearIndex(v51);
        v50.AnimalsIndex[v51] = v52[v51].Index;
    end;
    if v54 then
        local v55 = v50.ModelsCollector[v51];
        if v55 then
            v55:Clean();
        else
            v55 = v6.new();
            v50.ModelsCollector[v51] = v55;
        end;
        local l_l_Animals_0_FirstChild_0 = l_Animals_0:FindFirstChild(v52[v51].Index);
        if not l_l_Animals_0_FirstChild_0 then
            return;
        else
            local v57 = l_l_Animals_0_FirstChild_0:Clone();
            v50.AnimalsModels[v51] = v57;
            for _, v59 in v57:GetDescendants() do
                if v59:IsA("BasePart") then
                    v59.CanCollide = false;
                    v59.CanQuery = false;
                    v59.CanTouch = false;
                    v59.Massless = true;
                end;
            end;
            v57.Parent = v50.PlotModel;
            v57.PrimaryPart.Anchored = true;
            local l_Mutation_0 = v52[v51].Mutation;
            if l_Mutation_0 then
                v55:Add(v17:ApplyMutation(v57, v52[v51].Index, l_Mutation_0));
                v57:SetAttribute("Mutation", l_Mutation_0);
            end;
            local l_v57_ExtentsSize_0 = v57:GetExtentsSize();
            local l_Traits_0 = v52[v51].Traits;
            if l_Traits_0 then
                v55:Add(v17:ApplyTraits(v57, v52[v51].Index, l_Traits_0));
                v57:SetAttribute("Traits", table.concat(l_Traits_0, ","));
            end;
            v57:PivotTo(v50.PlotModel.AnimalPodiums:FindFirstChild(v51).Base.Spawn:GetPivot());
            if v9:GetInstant("Optimisation.HumanoidBrainrotModels", v28.IsNewPlayersServer()) then
                local l_AnimationController_0 = v57:FindFirstChild("AnimationController");
                if l_AnimationController_0 then
                    l_AnimationController_0:Destroy();
                end;
                local v64 = Instance.new("Humanoid", v57);
                local _ = Instance.new("Animator", v64);
                v64.Name = "AnimationController";
                v64.EvaluateStateMachine = false;
                v64.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                v64.PlatformStand = true;
                v64.Parent = v57;
            end;
            local l_Animator_0 = v57:FindFirstChild("AnimationController"):FindFirstChild("Animator");
            local l_l_Animals_1_FirstChild_0 = l_Animals_1:FindFirstChild(v52[v51].Index);
            local v68 = l_l_Animals_1_FirstChild_0 and l_l_Animals_1_FirstChild_0:FindFirstChild("Idle");
            if v68 and l_Animator_0 then
                local v69 = l_Animator_0:LoadAnimation(v68);
                v69.Looped = true;
                v69:Play();
                local v70 = v33:Add(v69);
                local l_v70_0 = v70 --[[ copy: 16 -> 30 ]];
                local l_v69_0 = v69 --[[ copy: 15 -> 31 ]];
                v55:Add(function() --[[ Line: 230 ]]
                    -- upvalues: l_v70_0 (copy), l_v69_0 (copy)
                    l_v70_0();
                    l_v69_0:Stop(0);
                    l_v69_0:Destroy();
                end);
            end;
            local v73 = v22[v52[v51].Index];
            local l_v57_FirstChild_0 = v57:FindFirstChild("OVERHEAD_ATTACHMENT", true);
            if not l_v57_FirstChild_0 then
                local v75 = v55:Add(Instance.new("Attachment"));
                v75.CFrame = CFrame.new(0, l_v57_ExtentsSize_0.Y * 0.75 * (v73 and v73.OverheadYOffsetModifier or 1), 0);
                v75.Parent = v50.PlotModel.AnimalPodiums:FindFirstChild(v51).Base.Spawn;
                l_v57_FirstChild_0 = v75;
            end;
            local v76 = v23[v73.Rarity];
            local v77, v78 = v36.createFastOverhead({
                adornee = l_v57_FirstChild_0, 
                guiTemplate = v36.GuiTemplates.AnimalOverhead
            });
            v55:Add(v78);
            local l_Generation_0 = v77.Generation;
            local function v83() --[[ Line: 259 ]] --[[ Name: updateOverhead ]]
                -- upvalues: v50 (copy), v51 (copy), v13 (ref), v52 (copy), v14 (ref), v17 (ref), l_Generation_0 (copy)
                local v80 = "";
                local v81 = v50.Channel:Get((("AnimalList.%*"):format(v51)));
                if v81 and v81.Timer ~= nil then
                    v80 = v81.Timer <= 0 and "READY!" or v13:E(v81.Timer);
                elseif v52[v51].Index == "Coffin Tung Tung Tung Sahur" then
                    v80 = "";
                elseif v81 and v81.Machine and (v81.Machine.Type == "Crafting" or v81.Machine.Type == "Fuse") and v81.Machine.Active then
                    local v82 = (v81.Machine.FinishTime or 0) - workspace:GetServerTimeNow();
                    v80 = v82 <= 0 and "READY!" or v13:E(v82);
                else
                    v80 = ("$%*/s"):format((v14:ToString(v17:GetGeneration(v52[v51].Index, v52[v51].Mutation, v52[v51].Traits, nil))));
                end;
                l_Generation_0.Text = v80;
                l_Generation_0.Visible = v80 ~= "";
            end;
            v77.DisplayName.Text = v73.DisplayName;
            v77.Price.Text = ("$%*"):format((v14:ToString(v17:GetPrice(v52[v51].Index, l_LocalPlayer_0))));
            v77.Rarity.Text = v73.Rarity;
            v77.Rarity.TextColor3 = v23[v73.Rarity].Color;
            if l_Mutation_0 then
                local v84 = v24[l_Mutation_0];
                if v84.UseRichText then
                    v77.Mutation.RichText = true;
                    v77.Mutation.Text = v84.DisplayWithRichText;
                else
                    v77.Mutation.Text = v84.DisplayText;
                end;
                if v84.GradientPreset then
                    v55:Add(v4.apply(v77.Mutation, v84.GradientPreset));
                else
                    v77.Mutation.TextColor3 = v84.MainColor;
                end;
            end;
            if l_Traits_0 then
                local l_Template_0 = v77.Traits.Template;
                for _, v87 in l_Traits_0 do
                    local v88 = v27[v87];
                    if v88 then
                        local v89 = l_Template_0:Clone();
                        v89.Parent = l_Template_0.Parent;
                        v89.Image = v88.Icon;
                        v89.Visible = true;
                    end;
                end;
                v77.Traits.Visible = true;
            end;
            task.spawn(v83);
            v55:Add(v50.Channel:OnChanged("AnimalList", v83));
            v55:Add(v7.Simple(1, v83));
            v55:Add(v50.PlotModel:GetAttributeChangedSignal("Nuked"):Connect(function() --[[ Line: 314 ]]
                -- upvalues: v50 (copy), v77 (copy)
                if v50.PlotModel:GetAttribute("Nuked") then
                    v77:Destroy();
                end;
            end));
            v77.Mutation.Visible = l_Mutation_0 ~= nil;
            if v23[v73.Rarity].StrokeColor then
                v77.Rarity.UIStroke.Color = v23[v73.Rarity].StrokeColor;
            end;
            if v76.GradientPreset then
                v55:Add(v4.apply(v77.Rarity, v76.GradientPreset));
            end;
            local function v99() --[[ Line: 329 ]] --[[ Name: updateVisibility ]]
                -- upvalues: v83 (copy), v50 (copy), v51 (copy), v57 (copy), v77 (copy)
                task.spawn(v83);
                local v90 = v50.Channel:Get((("AnimalList.%*"):format(v51)));
                local l_v50_Owner_0 = v50:GetOwner();
                local v92 = l_v50_Owner_0 and v90 and v90.Steal == l_v50_Owner_0.UserId;
                for _, v94 in v57:GetDescendants() do
                    if v94:IsA("BasePart") then
                        local l_v94_Attribute_0 = v94:GetAttribute("DefaultTransparency");
                        if l_v94_Attribute_0 == nil then
                            l_v94_Attribute_0 = v94.Transparency;
                            v94:SetAttribute("DefaultTransparency", l_v94_Attribute_0);
                        end;
                        if v90 and (v90.Steal or v90.Machine) and v94.Transparency < 1 then
                            v94.Transparency = 0.5;
                        else
                            v94.Transparency = l_v94_Attribute_0;
                        end;
                    end;
                end;
                for _, v97 in v77:GetChildren() do
                    if v97:IsA("TextLabel") then
                        if not v97:GetAttribute("DefaultState") then
                            v97:SetAttribute("DefaultState", v97.Visible);
                        end;
                        if v97.Name == "Stolen" then
                            local v98 = v90 and v90.Machine;
                            if v98 and v90.Machine.Type == "Crafting" and v90.Machine.Active then
                                v97.Text = "CRAFTING";
                                v97.TextColor3 = Color3.fromRGB(0, 140, 255);
                            elseif v98 and v90.Machine.Type == "Fuse" and v90.Machine.Active then
                                v97.Text = "FUSING";
                                v97.TextColor3 = Color3.fromRGB(206, 77, 76);
                            elseif v98 and v90.Machine.Type == "Fuse" then
                                v97.Text = "IN FUSE";
                                v97.TextColor3 = Color3.fromRGB(206, 77, 76);
                            elseif v98 and v90.Machine.Type == "Duel" then
                                v97.Text = "IN DUEL";
                                v97.TextColor3 = Color3.fromRGB(255, 94, 78);
                            elseif v98 then
                                v97.Text = "IN MACHINE";
                                v97.TextColor3 = Color3.fromRGB(0, 140, 255);
                            else
                                v97.Text = "STOLEN";
                                v97.TextColor3 = Color3.fromRGB(255, 0, 4);
                            end;
                        end;
                        if v90 and (v90.Steal or v90.Machine) then
                            if v97.Name == "Stolen" then
                                v97.Visible = not v92;
                            elseif v97.Name == "Generation" then
                                v97.Visible = v90.Machine and v90.Machine.Active;
                            else
                                v97.Visible = false;
                            end;
                        elseif v97.Name == "Stolen" then
                            v97.Visible = false;
                        else
                            v97.Visible = v97:GetAttribute("DefaultState");
                        end;
                    end;
                end;
            end;
            v55:Add(v50.Channel:OnChanged(("AnimalList.%*.Steal"):format(v51), v99, true));
            v55:Add(v50.Channel:OnChanged(("AnimalList.%*.Machine"):format(v51), v99));
            v55:Add(v50.Channel:OnChanged("AnimalList", function(v100) --[[ Line: 405 ]]
                -- upvalues: v51 (copy), v99 (copy)
                if type(if typeof(v100) == "table" then v100[v51] else nil) == "table" then
                    v99();
                end;
            end));
        end;
    end;
end;
v47.HideClaim = function(v101, v102) --[[ Line: 414 ]] --[[ Name: HideClaim ]]
    local l_FirstChild_0 = v101.PlotModel.AnimalPodiums:FindFirstChild(v102);
    if l_FirstChild_0 then
        local v104 = v101.CollectGuis[l_FirstChild_0];
        if v104 then
            v104.gui.Enabled = false;
        end;
    end;
end;
v47.UpdateClaim = function(v105, v106) --[[ Line: 424 ]] --[[ Name: UpdateClaim ]]
    -- upvalues: v22 (copy), v17 (copy), l_LocalPlayer_0 (copy), v36 (copy), v30 (copy), v28 (copy), v14 (copy)
    local v107 = (v105.Channel:Get("AnimalList") or {})[v106];
    local v108 = v22[v107.Index];
    local v109 = math.floor(workspace:GetServerTimeNow() - v107.LastCollect) * v17:GetGeneration(v107.Index, v107.Mutation, v107.Traits, l_LocalPlayer_0);
    local l_FirstChild_1 = v105.PlotModel.AnimalPodiums:FindFirstChild(v106);
    if not l_FirstChild_1 then
        return;
    else
        local v111 = v105.CollectGuis[l_FirstChild_1];
        if not v111 then
            local v112, v113 = v36.createFastOverhead({
                adornee = l_FirstChild_1.Claim.Main, 
                guiTemplate = v36.GuiTemplates.CashPad
            });
            local v114 = nil;
            do
                local l_v114_0 = v114;
                l_v114_0 = l_FirstChild_1.AncestryChanged:Connect(function() --[[ Line: 445 ]]
                    -- upvalues: l_FirstChild_1 (copy), v113 (copy), l_v114_0 (ref), v105 (copy)
                    if not l_FirstChild_1:IsDescendantOf(workspace) then
                        v113();
                        l_v114_0:Disconnect();
                        v105.CollectGuis[l_FirstChild_1] = nil;
                    end;
                end);
                v111 = {
                    gui = v112, 
                    collect = v30.wrap(v112.Collect), 
                    collectAmount = v30.wrap(v112.CollectAmount), 
                    offline = v30.wrap(v112.Offline)
                };
                v105.CollectGuis[l_FirstChild_1] = v111;
            end;
        end;
        if v108 and v108.LuckyBlock or v107.Index == "Coffin Tung Tung Tung Sahur" or v107.Machine or v28.IsDuelsServer() then
            v111.gui.Enabled = false;
            return;
        else
            v111.collectAmount.Text = ("$%*"):format((v14:ToString(v109)));
            if v107.OfflineGain then
                v111.offline.Text = ("(Offline Cash: <font color=\"#73ff00\">$%*</font>)"):format((v14:ToString(v107.OfflineGain * v17:GetGeneration(v107.Index, v107.Mutation, v107.Traits, l_LocalPlayer_0))));
            end;
            v111.offline.Visible = v107.OfflineGain ~= nil;
            v111.gui.Enabled = true;
            return;
        end;
    end;
end;
v47.UpdatePrompt = function(v116, v117) --[[ Line: 479 ]] --[[ Name: UpdatePrompt ]]
    -- upvalues: v11 (copy), l_LocalPlayer_0 (copy), v28 (copy), v40 (copy), v29 (copy), v34 (copy), v8 (copy), v41 (copy), v22 (copy), v35 (copy), v39 (copy), l_FireServer_0 (copy), v43 (copy)
    local l_FirstChild_2 = v116.PlotModel.AnimalPodiums:FindFirstChild(v117);
    local v119 = v116.Channel:Get("AnimalList") or {};
    local v120 = v119[v117];
    if l_FirstChild_2:GetAttribute("DeferDisplay") then
        v120 = nil;
    elseif v120 == "Empty" then
        v120 = nil;
    end;
    local v121 = if v120 then v120.Index else ("None_%*"):format((tostring(v117)));
    local l_Spawn_0 = l_FirstChild_2.Base.Spawn;
    local v123 = v116.AnimalsPrompts[v117];
    if v123 and v123.AnimalIndex ~= v121 then
        for _, v125 in v123.Prompts do
            v125:Destroy();
        end;
        v123 = nil;
    end;
    if not v123 then
        local v126 = {
            AnimalIndex = v121, 
            Prompts = {
                v11.new(v117, v121, l_Spawn_0.PromptAttachment), 
                v11.new(v117, v121, l_Spawn_0.PromptAttachment, {
                    KeyboardKeyCode = Enum.KeyCode.F, 
                    GamepadKeyCode = Enum.KeyCode.ButtonY, 
                    UIOffset = Vector2.new(0, -72)
                })
            }
        };
        local v127 = {};
        local l_v127_0 = v127 --[[ copy: 9 -> 17 ]];
        local function _() --[[ Line: 525 ]] --[[ Name: updateOverheadVisibility ]]
            -- upvalues: l_FirstChild_2 (copy), l_v127_0 (copy)
            local l_l_FirstChild_2_FirstChild_0 = l_FirstChild_2:FindFirstChild("AnimalOverhead", true);
            if l_l_FirstChild_2_FirstChild_0 and l_l_FirstChild_2_FirstChild_0:IsA("BillboardGui") then
                l_l_FirstChild_2_FirstChild_0.AlwaysOnTop = next(l_v127_0) ~= nil;
            end;
        end;
        for _, v132 in pairs(v126.Prompts) do
            v132.Collector:Add(v132.ProximityPrompt.PromptShown:Connect(function() --[[ Line: 533 ]]
                -- upvalues: v127 (copy), v132 (copy), l_FirstChild_2 (copy)
                v127[v132.ProximityPrompt] = true;
                local l_l_FirstChild_2_FirstChild_1 = l_FirstChild_2:FindFirstChild("AnimalOverhead", true);
                if l_l_FirstChild_2_FirstChild_1 and l_l_FirstChild_2_FirstChild_1:IsA("BillboardGui") then
                    l_l_FirstChild_2_FirstChild_1.AlwaysOnTop = next(v127) ~= nil;
                end;
            end));
            v132.Collector:Add(v132.ProximityPrompt.PromptHidden:Connect(function() --[[ Line: 538 ]]
                -- upvalues: v127 (copy), v132 (copy), l_FirstChild_2 (copy)
                v127[v132.ProximityPrompt] = nil;
                local l_l_FirstChild_2_FirstChild_2 = l_FirstChild_2:FindFirstChild("AnimalOverhead", true);
                if l_l_FirstChild_2_FirstChild_2 and l_l_FirstChild_2_FirstChild_2:IsA("BillboardGui") then
                    l_l_FirstChild_2_FirstChild_2.AlwaysOnTop = next(v127) ~= nil;
                end;
            end));
            v132.Collector:Add(function() --[[ Line: 543 ]]
                -- upvalues: v127 (copy), v132 (copy), l_FirstChild_2 (copy)
                v127[v132.ProximityPrompt] = nil;
                local l_l_FirstChild_2_FirstChild_3 = l_FirstChild_2:FindFirstChild("AnimalOverhead", true);
                if l_l_FirstChild_2_FirstChild_3 and l_l_FirstChild_2_FirstChild_3:IsA("BillboardGui") then
                    l_l_FirstChild_2_FirstChild_3.AlwaysOnTop = next(v127) ~= nil;
                end;
            end);
            v132.Collector:Add(v132.ProximityPrompt.PromptButtonHoldBegan:Connect(function() --[[ Line: 548 ]]
                -- upvalues: v126 (copy), v132 (copy)
                for _, v137 in v126.Prompts do
                    if v137 ~= v132 then
                        v137.ProximityPrompt.Enabled = false;
                    end;
                end;
            end));
            v132.Collector:Add(v132.ProximityPrompt.PromptButtonHoldEnded:Connect(function() --[[ Line: 558 ]]
                -- upvalues: v126 (copy), v132 (copy)
                for _, v139 in v126.Prompts do
                    if v139 ~= v132 then
                        v139.ProximityPrompt.Enabled = true;
                        v139:SetState(v139.State);
                    end;
                end;
            end));
        end;
        v123 = v126;
        v116.AnimalsPrompts[v117] = v123;
    end;
    assert(v123);
    local v140 = v123.Prompts[1];
    local v141 = v123.Prompts[2];
    if v116:GetOwner() == l_LocalPlayer_0 then
        local v142 = v28.IsDuelsServer();
        local v143 = false;
        if l_LocalPlayer_0:GetAttribute("Stealing") then
            for _, v145 in v119 do
                if v145.Steal == l_LocalPlayer_0.UserId then
                    v143 = true;
                    break;
                end;
            end;
        end;
        if not v120 and not v143 or v120 and v120.Machine and v120.Machine.Active then
            if v140.State ~= "None" then
                v140:SetState("None");
            end;
            if v141.State ~= "None" then
                v141:SetState("None");
            end;
            return;
        elseif v143 then
            if v140.State ~= "Place" then
                v140:SetState("Place", function() --[[ Line: 604 ]]
                    -- upvalues: v40 (ref), v117 (copy)
                    v40:FireServer("Place", v117);
                end);
            end;
            if v141.State ~= "None" then
                v141:SetState("None");
            end;
            return;
        elseif v120 and v120.Machine and not v120.Machine.Active and not v142 then
            if v140.State ~= "Return" then
                v140:SetState("Return", function() --[[ Line: 618 ]]
                    -- upvalues: v120 (ref), v29 (ref), v117 (copy), v34 (ref), v8 (ref)
                    local v146 = v120.Machine and v120.Machine.Type;
                    if v146 == "Fuse" then
                        local v147, v148 = v29.Remotes.RemoveBrainrot:InvokeServer(v117);
                        if not v147 then
                            v34:Error(v148 or "Something went wrong!");
                            return;
                        end;
                    elseif v146 == "Crafting" then
                        v8:RemoteEvent("CraftingMachineService/Return"):FireServer(v117);
                        return;
                    elseif v146 == "BrainrotTrader" then
                        v8:RemoteEvent("BrainrotTraderService/Return"):FireServer(v117);
                        return;
                    else
                        v8:RemoteEvent("StockEventService/Return"):FireServer(v146, v117);
                    end;
                end);
            end;
            if v141.State ~= "None" then
                v141:SetState("None");
            end;
            return;
        else
            local v149 = v120.Timer or 1;
            if v121 == "Coffin Tung Tung Tung Sahur" then
                v149 = 0;
            end;
            if v120 and v120.Steal or v142 then
                if v140.State ~= "None" then
                    v140:SetState("None");
                end;
            elseif v140.State ~= "Grab" and v149 > 0 then
                v140:SetState("Grab", function() --[[ Line: 653 ]]
                    -- upvalues: v40 (ref), v117 (copy)
                    v40:FireServer("Grab", v117);
                end);
            elseif v140.State ~= "Open" and v149 <= 0 then
                v140:SetState("Open", function() --[[ Line: 657 ]]
                    -- upvalues: v41 (ref), v117 (copy)
                    v41:FireServer(v117);
                end);
            end;
            if v120 and v120.Steal or v142 then
                if v141.State ~= "None" then
                    v141:SetState("None");
                end;
            elseif v141.State ~= "Sell" then
                v141:SetState("Sell", function() --[[ Line: 667 ]]
                    -- upvalues: v116 (copy), v117 (copy), v22 (ref), v35 (ref), v39 (ref)
                    local l_AnimalIndex_0 = v116.AnimalsPrompts[v117].AnimalIndex;
                    local l_Rarity_0 = v22[l_AnimalIndex_0].Rarity;
                    local v152 = true;
                    if l_Rarity_0 ~= "OG" then
                        v152 = true;
                        if l_Rarity_0 ~= "Admin" then
                            v152 = true;
                            if l_Rarity_0 ~= "Spooky" then
                                v152 = true;
                                if l_Rarity_0 ~= "Taco" then
                                    v152 = true;
                                    if l_Rarity_0 ~= "Secret" then
                                        v152 = true;
                                        if l_Rarity_0 ~= "Brainrot God" then
                                            v152 = l_Rarity_0 == "Festive";
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v152 then
                        local v153 = ("Do you want to sell %*?"):format(l_AnimalIndex_0);
                        if not (not v35:IsInPrompt() and (v35:Show(v153) or false)) then
                            return;
                        end;
                    end;
                    v39:FireServer(v117);
                end);
            end;
        end;
    elseif v120 and v120.Steal and v120.Steal ~= "FuseMachine" then
        if v140.State ~= "None" then
            v140:SetState("None");
        end;
        if v141.State ~= "None" then
            v141:SetState("None");
        end;
    elseif v120 and (not v120.Machine or not v120.Machine.Active) then
        if v140.State ~= "Steal" then
            v140:SetState("Steal", function() --[[ Line: 692 ]]
                -- upvalues: l_FireServer_0 (ref), v43 (ref), v116 (copy), v117 (copy)
                l_FireServer_0(v43, workspace:GetServerTimeNow() + 56, "37feb1a5-fea5-4abc-8cc3-cb3ea2322c02", v116.PlotModel.Name, v117);
                v43:FireServer(workspace:GetServerTimeNow() + 56, "70646659-e472-4788-a9d8-cfa70e3d378c", v116.PlotModel.Name, v117);
            end);
        end;
        if v141.State ~= "None" then
            v141:SetState("None");
        end;
    else
        if v140.State ~= "None" then
            v140:SetState("None");
        end;
        if v141.State ~= "None" then
            v141:SetState("None");
        end;
    end;
end;
v47.UpdateAnimalPodiums = function(v154) --[[ Line: 733 ]] --[[ Name: UpdateAnimalPodiums ]]
    -- upvalues: v25 (copy)
    local l_Attribute_0 = v154.PlotModel:GetAttribute("Nuked");
    local v156 = v154.Channel:Get("AnimalList") or {};
    for v157 = 1, v25[v154.PlotModel:GetAttribute("Tier")].MaxAnimals do
        if l_Attribute_0 then
            v154:HideClaim(v157);
            local v158 = v154.AnimalsPrompts[v157];
            if v158 then
                for _, v160 in v158.Prompts do
                    v160:Destroy();
                end;
                v158 = nil;
            end;
        else
            local l_FirstChild_3 = v154.PlotModel.AnimalPodiums:FindFirstChild(v157);
            if type(v156[v157]) == "table" and l_FirstChild_3 and not l_FirstChild_3:GetAttribute("DeferDisplay") then
                v154:UpdateModel(v157);
                v154:UpdateClaim(v157);
            else
                v154:ClearIndex(v157);
                v154:HideClaim(v157);
            end;
            v154:UpdatePrompt(v157);
        end;
    end;
end;
local function v171(v162) --[[ Line: 772 ]] --[[ Name: UpdatePurchaseBlockedLabel ]]
    -- upvalues: v13 (copy)
    local v163 = false;
    local _ = v162:GetOwner();
    local v165 = v162.PlotModel:WaitForChild("Purchases", 5);
    if not v165 then
        return;
    else
        if v162.Channel:Get("BlockEndTime") ~= nil then
            local v166 = math.clamp(math.round(v162.Channel:Get("BlockEndTime") - workspace:GetServerTimeNow()), 0, 1e999);
            for _, v168 in v165:GetChildren() do
                if v168:FindFirstChild("Main") then
                    v168.Main.BillboardGui.RemainingTime.Text = v13:C(v166);
                end;
            end;
            v163 = true;
        end;
        for _, v170 in v165:GetChildren() do
            if v170:FindFirstChild("Main") then
                v170.Main.BillboardGui.LockStudio.Visible = not v163;
                v170.Main.BillboardGui.RemainingTime.Visible = v163;
                v170.Main.BillboardGui.Locked.Visible = v163;
            end;
        end;
        return;
    end;
end;
local function v181(v172) --[[ Line: 805 ]] --[[ Name: UpdateDelayBlockedLabel ]]
    -- upvalues: v13 (copy)
    if v172.Channel:Get("BlockEndTime") == nil then
        local v173 = false;
        local _ = v172:GetOwner();
        local v175 = v172.PlotModel:WaitForChild("Purchases", 5);
        if not v175 then
            return;
        else
            if v172.Channel:Get("BlockedDelayTime") ~= nil then
                local v176 = math.clamp(math.round(v172.Channel:Get("BlockedDelayTime") - workspace:GetServerTimeNow()), 0, 1e999);
                for _, v178 in v175:GetChildren() do
                    if v178:FindFirstChild("Main") then
                        v178.Main.BillboardGui.RemainingTime.Text = v13:C(v176);
                    end;
                end;
                v173 = true;
            end;
            for _, v180 in v175:GetChildren() do
                if v180:FindFirstChild("Main") then
                    v180.Main.BillboardGui.LockStudio.Visible = not v173;
                    v180.Main.BillboardGui.RemainingTime.Visible = v173;
                    v180.Main.BillboardGui.Delay.Visible = v173;
                end;
            end;
        end;
    end;
end;
local function v188(v182) --[[ Line: 838 ]] --[[ Name: UpdateUnlock ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v182:GetOwner() == l_LocalPlayer_0 then
        return;
    else
        for _, v184 in v182.PlotModel.Unlock:GetChildren() do
            local l_Attribute_1 = v184.UnlockBase:GetAttribute("Floor");
            if l_Attribute_1 then
                local v186 = "BlockEndTimeFirstFloor";
                if l_Attribute_1 == 2 then
                    v186 = "BlockEndTimeSecondFloor";
                elseif l_Attribute_1 == 3 then
                    v186 = "BlockEndTimeThirdFloor";
                end;
                local v187 = v182.Channel:Get(v186) ~= nil;
                v184.UnlockBase.Enabled = v187;
            end;
        end;
        return;
    end;
end;
local function v201(v189) --[[ Line: 858 ]] --[[ Name: UpdateBlocked ]]
    -- upvalues: l_LocalPlayer_0 (copy), v32 (copy)
    if not v189.Channel or not v189.Channel.Get then
        return;
    else
        local v190 = v189:GetOwner() == l_LocalPlayer_0;
        local l_v189_Owner_0 = v189:GetOwner();
        local l_v32_InGameFriends_0 = v32:GetInGameFriends(l_LocalPlayer_0);
        local v193 = v189.Channel:Get("FriendsAllowed") == true;
        local v194 = v189.PlotModel:WaitForChild("LaserHitbox", 5);
        if not v194 then
            return;
        else
            for _, v196 in v194:GetChildren() do
                local l_v196_Attribute_0 = v196:GetAttribute("Floor");
                if l_v196_Attribute_0 then
                    local v198 = "BlockEndTimeFirstFloor";
                    if l_v196_Attribute_0 == 2 then
                        v198 = "BlockEndTimeSecondFloor";
                    elseif l_v196_Attribute_0 == 3 then
                        v198 = "BlockEndTimeThirdFloor";
                    end;
                    local v199 = v189.Channel:Get(v198) ~= nil;
                    local _ = true;
                    v196.CanCollide = not v190 and not l_LocalPlayer_0:GetAttribute("IgnoreLasers") and if v199 then not table.find(l_v32_InGameFriends_0, l_v189_Owner_0) or not v193 or false else false;
                end;
            end;
            return;
        end;
    end;
end;
v47.GetOwner = function(v202) --[[ Line: 908 ]] --[[ Name: GetOwner ]]
    return v202.Channel:Get("Owner");
end;
v47.GetSpawn = function(v203) --[[ Line: 912 ]] --[[ Name: GetSpawn ]]
    return v203.PlotModel.Spawn;
end;
v47.GetUID = function(v204) --[[ Line: 916 ]] --[[ Name: GetUID ]]
    return v204.UID;
end;
v47.new = function(v205) --[[ Line: 920 ]] --[[ Name: new ]]
    -- upvalues: v47 (copy), v6 (copy), v5 (copy), v25 (copy), l_LocalPlayer_0 (copy), l_Players_0 (copy), v42 (copy), l_RunService_0 (copy), l_FireServer_0 (copy), v44 (copy), v7 (copy), v171 (copy), v188 (copy), v181 (copy), v201 (copy), v26 (copy), v37 (copy), v28 (copy), v32 (copy), v45 (copy)
    local v206 = setmetatable({}, v47);
    v206.UID = v205.Name;
    v206.PlotModel = v205;
    v206.Collector = v6.new();
    v206.OwnerCollector = v6.new();
    v206.Collector:Add(v206.OwnerCollector, "Destroy");
    v206.AnimalsModels = {};
    v206.AnimalsIndex = {};
    v206.AnimalsPrompts = {};
    v206.ModelsCollector = {};
    v206.CollectGuis = {};
    v206.Channel = v5:Wait(v206.UID);
    local function v213() --[[ Line: 936 ]] --[[ Name: reset ]]
        -- upvalues: v206 (copy)
        for v207, v208 in v206.AnimalsPrompts do
            for _, v210 in v208.Prompts do
                v210:Destroy();
            end;
            v206.AnimalsPrompts[v207] = nil;
        end;
        for v211, v212 in v206.AnimalsModels do
            v212:Destroy();
            v206.AnimalsModels[v211] = nil;
        end;
    end;
    local function v247() --[[ Line: 950 ]] --[[ Name: setup ]]
        -- upvalues: v206 (copy), v213 (copy), v25 (ref), v205 (copy), l_LocalPlayer_0 (ref), l_Players_0 (ref), v42 (ref), l_RunService_0 (ref), l_FireServer_0 (ref), v44 (ref), v7 (ref), v171 (ref), v188 (ref), v181 (ref), v201 (ref), v26 (ref), v37 (ref), v28 (ref), v32 (ref), v45 (ref)
        v206.OwnerCollector:Clean();
        v213();
        for v214 = 1, v25[v205:GetAttribute("Tier")].MaxAnimals do
            if v206:GetOwner() == l_LocalPlayer_0 then
                local l_FirstChild_4 = v206.PlotModel.AnimalPodiums:FindFirstChild(v214);
                local v216 = l_FirstChild_4 and l_FirstChild_4.Claim.Hitbox;
                v206.OwnerCollector:Add(v216.Touched:Connect(function(v217) --[[ Line: 959 ]]
                    -- upvalues: l_Players_0 (ref), v206 (ref), v42 (ref), v214 (copy)
                    if v217.Name ~= "HumanoidRootPart" then
                        return;
                    else
                        local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v217.Parent);
                        if not l_l_Players_0_PlayerFromCharacter_0 or l_l_Players_0_PlayerFromCharacter_0 ~= v206:GetOwner() then
                            return;
                        else
                            v42:FireServer(v214);
                            return;
                        end;
                    end;
                end));
            end;
        end;
        local v219 = {};
        for _, v221 in v206.PlotModel:GetChildren() do
            if v221.Name == "DeliveryHitbox" then
                table.insert(v219, v221);
            end;
        end;
        local v222 = OverlapParams.new();
        v222.FilterDescendantsInstances = v219;
        v222.FilterType = Enum.RaycastFilterType.Include;
        v222.MaxParts = 1;
        if v206:GetOwner() == l_LocalPlayer_0 then
            local v223 = 0;
            do
                local l_v223_0 = v223;
                v206.OwnerCollector:Add(l_RunService_0.PostSimulation:Connect(function(v225) --[[ Line: 988 ]]
                    -- upvalues: l_v223_0 (ref), l_LocalPlayer_0 (ref), v206 (ref), v222 (copy), l_FireServer_0 (ref), v44 (ref)
                    l_v223_0 = l_v223_0 + v225;
                    if l_v223_0 < 0.05 then
                        return;
                    else
                        debug.profilebegin("PlotClient:Hitboxes");
                        l_v223_0 = 0;
                        if not l_LocalPlayer_0:GetAttribute("Stealing") then
                            return;
                        else
                            local v226 = v206.Channel:Get("AnimalList") or {};
                            for _, v228 in v226 do
                                if v228.Steal == l_LocalPlayer_0.UserId then
                                    debug.profileend();
                                    return;
                                end;
                            end;
                            local l_Character_0 = l_LocalPlayer_0.Character;
                            if not l_Character_0 then
                                debug.profileend();
                                return;
                            else
                                local l_Position_0 = l_Character_0:GetPivot().Position;
                                if #workspace:GetPartBoundsInBox(CFrame.new(l_Position_0), Vector3.new(4, 4, 2, 0), v222) <= 0 then
                                    return;
                                else
                                    l_FireServer_0(v44, "73b43126-85bb-4be0-bfc5-57a3cd77afe3");
                                    v44:FireServer("73b43126-85bb-4be0-bfc5-57a3cd77afe3");
                                    debug.profileend();
                                    return;
                                end;
                            end;
                        end;
                    end;
                end));
            end;
        end;
        v206.OneSecondTimer = v7.new(1);
        v206.OwnerCollector:Add(v206.OneSecondTimer, "Destroy");
        v206.OwnerCollector:Add(v206.OneSecondTimer.Tick:Connect(function() --[[ Line: 1047 ]]
            -- upvalues: v171 (ref), v206 (ref), v188 (ref), v181 (ref)
            v171(v206);
            v188(v206);
            v206:UpdateAnimalPodiums();
            v181(v206);
        end));
        v206.OneSecondTimer:StartNow();
        v206.OwnerCollector:Add(v206.Channel:OnChanged("BlockEndTime", function() --[[ Line: 1055 ]]
            -- upvalues: v171 (ref), v206 (ref), v188 (ref), v181 (ref), v201 (ref)
            v171(v206);
            v188(v206);
            v181(v206);
            v201(v206);
        end, true));
        v206.OwnerCollector:Add(v206.Channel:OnChanged("BlockEndTimeFirstFloor", function() --[[ Line: 1062 ]]
            -- upvalues: v171 (ref), v206 (ref), v188 (ref), v181 (ref), v201 (ref)
            v171(v206);
            v188(v206);
            v181(v206);
            v201(v206);
        end, true));
        v206.OwnerCollector:Add(v206.Channel:OnChanged("BlockEndTimeSecondFloor", function() --[[ Line: 1069 ]]
            -- upvalues: v171 (ref), v206 (ref), v188 (ref), v181 (ref), v201 (ref)
            v171(v206);
            v188(v206);
            v181(v206);
            v201(v206);
        end, true));
        v206.OwnerCollector:Add(v206.Channel:OnChanged("BlockEndTimeThirdFloor", function() --[[ Line: 1076 ]]
            -- upvalues: v171 (ref), v206 (ref), v188 (ref), v181 (ref), v201 (ref)
            v171(v206);
            v188(v206);
            v181(v206);
            v201(v206);
        end, true));
        v206.OwnerCollector:Add(v206.Channel:OnChanged("BlockedDelayTime", function() --[[ Line: 1083 ]]
            -- upvalues: v171 (ref), v206 (ref), v188 (ref), v181 (ref), v201 (ref)
            v171(v206);
            v188(v206);
            v181(v206);
            v201(v206);
        end, true));
        v206.OwnerCollector:Add(v206.Channel:OnChanged("AnimalList", function(_) --[[ Line: 1090 ]]
            -- upvalues: v206 (ref)
            v206:UpdateAnimalPodiums();
        end, true));
        v206.OwnerCollector:Add(v205:GetAttributeChangedSignal("Nuked"):Connect(function() --[[ Line: 1094 ]]
            -- upvalues: v205 (ref), v206 (ref)
            if v205:GetAttribute("Nuked") then
                for _, v233 in v206.PlotModel:GetChildren() do
                    if v233:IsA("Model") and v233.PrimaryPart then
                        v233.PrimaryPart.Anchored = false;
                        v233.PrimaryPart.CanCollide = true;
                    end;
                end;
            end;
        end));
        local l_v206_Owner_0 = v206:GetOwner();
        if l_v206_Owner_0 then
            v206.OwnerCollector:Add(l_v206_Owner_0:GetAttributeChangedSignal("Stealing"):Connect(function(_) --[[ Line: 1107 ]]
                -- upvalues: v206 (ref)
                v206:UpdateAnimalPodiums();
            end));
        end;
        for _, v237 in v206.PlotModel.Unlock:GetChildren() do
            v206.OwnerCollector:Add(v237.UnlockBase.Triggered:Connect(function(v238) --[[ Line: 1114 ]]
                -- upvalues: v206 (ref), v237 (copy), v26 (ref), v37 (ref)
                if v238 and v238:IsA("Player") then
                    if v206:GetOwner() == v238 then
                        return;
                    else
                        local l_ProductId_0 = v26[v237.UnlockBase:GetAttribute("Floor")].ProductId;
                        local l_UserId_0 = v206:GetOwner().UserId;
                        if v206.Channel:Get("BlockEndTimeFirstFloor") ~= nil or v206.Channel:Get("BlockEndTimeSecondFloor") ~= nil or v206.Channel:Get("BlockEndTimeThirdFloor") ~= nil then
                            v37:FireServer(l_ProductId_0, l_UserId_0);
                        end;
                    end;
                end;
            end));
            v206.OwnerCollector:Add(v206.PlotModel.Unlock.ChildAdded:Connect(function(v241) --[[ Line: 1128 ]]
                -- upvalues: v206 (ref), v26 (ref), v37 (ref), v201 (ref)
                v206.OwnerCollector:Add(v241.UnlockBase.Triggered:Connect(function(v242) --[[ Line: 1129 ]]
                    -- upvalues: v206 (ref), v241 (copy), v26 (ref), v37 (ref)
                    if v242 and v242:IsA("Player") then
                        if v206:GetOwner() == v242 then
                            return;
                        else
                            local l_ProductId_1 = v26[v241.UnlockBase:GetAttribute("Floor")].ProductId;
                            local l_UserId_1 = v206:GetOwner().UserId;
                            if v206.Channel:Get("BlockEndTimeFirstFloor") ~= nil or v206.Channel:Get("BlockEndTimeSecondFloor") ~= nil or v206.Channel:Get("BlockEndTimeThirdFloor") ~= nil then
                                v37:FireServer(l_ProductId_1, l_UserId_1);
                            end;
                        end;
                    end;
                end));
                v201(v206);
            end));
        end;
        if v206.PlotModel:GetAttribute("Tier") == 0 and v206:GetOwner() or v28.IsDuelsServer() then
            v206.PlotModel.FriendPanel:PivotTo(CFrame.new((Vector3.new(0, 1000000000, 0, 0))));
        end;
        local l_ProximityPrompt_0 = v206.PlotModel.FriendPanel.Main.ProximityPrompt;
        v206.OwnerCollector:Add(v206.Channel:OnChanged("FriendsAllowed", function(v246) --[[ Line: 1151 ]]
            -- upvalues: l_ProximityPrompt_0 (copy), v206 (ref), v201 (ref)
            l_ProximityPrompt_0.ObjectText = v246 == true and "Disallow Friends" or "Allow Friends";
            v206.PlotModel.FriendPanel.Main.SurfaceGui.ImageLabel.Image = v246 == true and "rbxassetid://110507824065923" or "rbxassetid://110783679426495";
            v201(v206);
        end, true));
        v206.OwnerCollector:Add(v32.OnFriendsUpdate:Connect(function() --[[ Line: 1157 ]]
            -- upvalues: v201 (ref), v206 (ref)
            v201(v206);
        end));
        v206.OwnerCollector:Add(l_LocalPlayer_0:GetAttributeChangedSignal("IgnoreLasers"):Connect(function() --[[ Line: 1161 ]]
            -- upvalues: v201 (ref), v206 (ref)
            v201(v206);
        end));
        v206.OwnerCollector:Add(l_ProximityPrompt_0.Triggered:Connect(function() --[[ Line: 1165 ]]
            -- upvalues: v206 (ref), l_LocalPlayer_0 (ref), v45 (ref)
            if v206:GetOwner() ~= l_LocalPlayer_0 then
                return;
            else
                v45:FireServer();
                return;
            end;
        end));
        v206.PlotModel.PlotSign.YourBase.Enabled = v206:GetOwner() == l_LocalPlayer_0;
    end;
    v206.Collector:Add(v206.Channel:OnChanged("Owner", v247, true));
    v206.Collector:Add(v206.PlotModel:GetAttributeChangedSignal("Tier"):Connect(v247));
    return v206;
end;
v47.Destroy = function(v248) --[[ Line: 1183 ]] --[[ Name: Destroy ]]
    for v249, v250 in v248.AnimalsPrompts do
        for _, v252 in v250.Prompts do
            v252:Destroy();
        end;
        v248.AnimalsPrompts[v249] = nil;
    end;
    for v253, v254 in v248.AnimalsModels do
        v254:Destroy();
        v248.AnimalsModels[v253] = nil;
    end;
    v248.Collector:Destroy();
end;
return v47;