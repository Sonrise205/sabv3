local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v7 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v8 = require(l_ReplicatedStorage_0.Packages.Observers);
local v9 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v10 = require(l_ReplicatedStorage_0.Packages.Trove);
local v11 = require(l_ReplicatedStorage_0.Packages.Net);
local v12 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v13 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v15 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v16 = require(l_ReplicatedStorage_0.Controllers.ShopController);
local v17 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local v18 = require(l_ReplicatedStorage_0.Datas.FuseMachineData);
local v19 = require(l_ReplicatedStorage_0.Shared.Mutations);
local v20 = require(l_ReplicatedStorage_0.Shared.Animals);
local v21 = require(l_ReplicatedStorage_0.Datas.Mutations);
local v22 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local v24 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v25 = require(l_ReplicatedStorage_0.Datas.Animals);
local v26 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v28 = require(l_ReplicatedStorage_0.Datas.Traits);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local v31 = require(l_ReplicatedStorage_0.Packages.Timer);
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local v33 = require(l_ReplicatedStorage_0.Shared.VFX);
local v34 = v11:RemoteEvent("ShopService/Purchase");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_FuseMachine_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("FuseMachine").FuseMachine;
local l_Brainrots_0 = l_FuseMachine_0.Brainrots;
local l_Fusions_0 = l_FuseMachine_0.Fusions;
local l_FusionsOld_0 = l_FuseMachine_0.FusionsOld;
local l_Time_0 = l_FuseMachine_0.Time;
local l_Buy_0 = l_FuseMachine_0.Buy;
local l_Close_0 = l_FuseMachine_0.Header.Close;
local v43 = v10.new();
local _ = v10.new();
local v45 = nil;
local v46 = {};
local function v52(v47) --[[ Line: 70 ]] --[[ Name: getBrainrotsInMachine ]]
    local v48 = {};
    for v49, v50 in v47 do
        if v50.Machine and v50.Machine.Type == "Fuse" then
            local v51 = table.clone(v50);
            v51.IndexOnPlot = v49;
            table.insert(v48, v51);
        end;
    end;
    return v48;
end;
local v53 = nil;
local v54 = v10.new();
local function v68() --[[ Line: 85 ]] --[[ Name: SetupBrainrots ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v54 (copy), v52 (copy), v18 (copy), l_Brainrots_0 (copy), v25 (copy), v24 (copy), v21 (copy), v7 (copy), v17 (copy), v12 (copy), v20 (copy)
    local v55 = v5:Get(l_LocalPlayer_0);
    if not v55 then
        return;
    else
        v54:Clean();
        local v56 = v52(v55:Get("AnimalPodiums"));
        if not v56 then
            return;
        else
            for v57 = 1, v18.FuseSlots do
                local v58 = v56[v57];
                if not v58 or v58 == "Empty" then
                    local v59 = v54:Clone(l_Brainrots_0.Template);
                    v59.Name = ("Empty.%*"):format(v57);
                    v59.LayoutOrder = v57;
                    v59.Visible = true;
                    v59.BrainrotName.Text = "Empty";
                    v59.BrainrotName.TextColor3 = Color3.fromRGB(255, 112, 112);
                    v59.Return:Destroy();
                    v59.Rarity:Destroy();
                    v59.Mutation:Destroy();
                    v59.ViewportFrame:Destroy();
                    v59.Parent = l_Brainrots_0;
                else
                    local v60 = v25[v58.Index];
                    local v61 = v24[v60.Rarity];
                    local v62 = v54:Clone(l_Brainrots_0.Template);
                    v62.Name = ("%*.%*"):format(v60.DisplayName, v57);
                    v62.LayoutOrder = v57;
                    v62.BrainrotName.Text = v60.DisplayName;
                    if v58.Mutation then
                        local v63 = v21[v58.Mutation];
                        v62.Mutation.Text = if v63.UseRichText then v63.DisplayWithRichText else v63.DisplayText;
                        v62.Mutation.RichText = v63.UseRichText;
                        if v63.GradientPreset then
                            v62.Mutation.TextColor3 = Color3.fromRGB(255, 255, 255);
                            v7.apply(v62.Mutation, v63.GradientPreset);
                        else
                            v62.Mutation.TextColor3 = v63.MainColor;
                        end;
                    end;
                    v62.Rarity.Text = v60.Rarity;
                    if v61.GradientPreset then
                        v62.Rarity.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v7.apply(v62.Rarity, v61.GradientPreset);
                    else
                        v62.Rarity.TextColor3 = v61.Color;
                    end;
                    v62.Visible = true;
                    v62.Parent = l_Brainrots_0;
                    local v64 = v17.new(v62.Return);
                    v54:Add(v64);
                    v64:Animate();
                    v54:Add(v64.OnActivated:Connect(function() --[[ Line: 160 ]]
                        -- upvalues: v18 (ref), v58 (copy), v12 (ref)
                        local v65, v66 = v18.Remotes.RemoveBrainrot:InvokeServer(v58.IndexOnPlot);
                        if not v65 then
                            v12:Error(v66 or "Something went wrong!");
                            return;
                        else
                            return;
                        end;
                    end));
                    local v67 = v20:AttachOnViewport(v60.DisplayName, v62.ViewportFrame, true, v58.Mutation and v58.Mutation or nil);
                    if v67 then
                        v54:Add(v67);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v107() --[[ Line: 176 ]] --[[ Name: UpdateOdds ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), l_Fusions_0 (copy), l_FusionsOld_0 (copy), l_FuseMachine_0 (copy), v21 (copy), v7 (copy), v28 (copy), v24 (copy), v25 (copy), v20 (copy)
    local v69 = v5:Get(l_LocalPlayer_0);
    if not v69 then
        return;
    else
        l_Fusions_0.Visible = false;
        l_FusionsOld_0.Visible = false;
        l_FuseMachine_0.PossibleFusions.Visible = false;
        for _, v71 in l_Fusions_0:GetChildren() do
            if v71:IsA("Frame") and v71.Name ~= "Template" then
                v71:Destroy();
            end;
        end;
        for _, v73 in l_FusionsOld_0:GetChildren() do
            if v73:IsA("TextLabel") and v73.Name ~= "Template" then
                v73:Destroy();
            end;
        end;
        for _, v75 in l_FuseMachine_0.Lists.Mutations.ScrollingFrame:GetChildren() do
            if v75:IsA("Frame") and v75.Name ~= "Template" then
                v75:Destroy();
            end;
        end;
        for _, v77 in l_FuseMachine_0.Lists.Traits.ScrollingFrame:GetChildren() do
            if v77:IsA("Frame") and v77.Name ~= "Template" then
                v77:Destroy();
            end;
        end;
        local v78 = v69:Get("FuseMachine.OutputRarityOdds");
        local v79 = v69:Get("FuseMachine.OutputTraitsOdds") or {};
        local v80 = v69:Get("FuseMachine.OutputMutationOdds") or {};
        if not v78 then
            return;
        else
            local v81 = false;
            for v82, v83 in v80 do
                local v84 = v21[v82];
                if v84 then
                    local v85 = l_FuseMachine_0.Lists.Mutations.ScrollingFrame.Template:Clone();
                    v85.Name = v82;
                    v85.LayoutOrder = -v83;
                    v85.Vector.Image = v84.Icon or "";
                    v85.Title.Text = if v84.UseRichText then v84.DisplayWithRichText else v84.DisplayText;
                    v85.Title.RichText = v84.UseRichText;
                    if v84.GradientPreset then
                        v85.Title.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v7.apply(v85.Title, v84.GradientPreset);
                    else
                        v85.Title.TextColor3 = v84.MainColor;
                    end;
                    local _, v87 = math.modf(v83);
                    v85.Chance.Text = ("%*%%"):format((string.format(v87 == 0 and "%d" or "%.2f", v83)));
                    v85.Visible = true;
                    v85.Parent = l_FuseMachine_0.Lists.Mutations.ScrollingFrame;
                    v81 = true;
                end;
            end;
            l_FuseMachine_0.Lists.Mutations.Visible = v81;
            local v88 = false;
            for v89, v90 in v79 do
                local v91 = v28[v89];
                if v91 then
                    local v92 = l_FuseMachine_0.Lists.Traits.ScrollingFrame.Template:Clone();
                    v92.Name = v89;
                    v92.LayoutOrder = -v90;
                    v92.Vector.Image = v91.Icon or "";
                    v92.Title.Text = v91.DisplayWithRichText;
                    v92.Title.TextColor3 = v91.Color;
                    v92.Title.RichText = true;
                    local _, v94 = math.modf(v90);
                    v92.Chance.Text = ("%*%%"):format((string.format(v94 == 0 and "%d" or "%.2f", v90)));
                    v92.Visible = true;
                    v92.Parent = l_FuseMachine_0.Lists.Traits.ScrollingFrame;
                    v88 = true;
                end;
            end;
            l_FuseMachine_0.Lists.Traits.Visible = v88;
            local v95 = false;
            for v96, v97 in (table.clone(v78)) do
                if v97 ~= 0 then
                    if v24[v96] then
                        v95 = true;
                        local v98 = v24[v96];
                        local v99 = l_FusionsOld_0.Template:Clone();
                        v99.Name = v96;
                        local _, v101 = math.modf(v97);
                        v99.Text = ("%* (%*%%)"):format(v96, (string.format(v101 == 0 and "%d" or "%.2f", v97)));
                        if v98.GradientPreset then
                            v99.TextColor3 = Color3.fromRGB(255, 255, 255);
                            v7.apply(v99, v98.GradientPreset);
                        else
                            v99.TextColor3 = v98.Color;
                        end;
                        v99.LayoutOrder = -v97;
                        v99.Visible = true;
                        v99.Parent = l_FusionsOld_0;
                    elseif v25[v96] then
                        local v102 = v25[v96];
                        local v103 = v24[v102.Rarity];
                        local v104 = l_Fusions_0.Template:Clone();
                        v104.Name = ("%*.%*"):format(v96, v102.Rarity);
                        v104.BrainrotName.Text = v96;
                        local _, v106 = math.modf(v97);
                        v104.Weight.Text = ("%*%%"):format((string.format(v106 == 0 and "%d" or "%.2f", v97)));
                        if v103.GradientPreset then
                            v104.Weight.TextColor3 = Color3.fromRGB(255, 255, 255);
                            v7.apply(v104.Weight, v103.GradientPreset);
                        else
                            v104.Weight.TextColor3 = v103.Color;
                        end;
                        v104.LayoutOrder = -v97;
                        v104.Visible = true;
                        v104.Parent = l_Fusions_0;
                        v20:AttachOnViewport(v102.DisplayName, v104.ViewportFrame, true, nil);
                    end;
                end;
            end;
            l_Fusions_0.Visible = not v95;
            l_FusionsOld_0.Visible = v95;
            l_FuseMachine_0.PossibleFusions.Visible = true;
            return;
        end;
    end;
end;
local v108 = v17.new(l_Buy_0);
v108:Animate();
local function v116() --[[ Line: 349 ]] --[[ Name: UpdateBuyButton ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v43 (copy), l_Buy_0 (copy), v22 (copy), v108 (copy), v18 (copy), v12 (copy)
    local v109 = v5:Get(l_LocalPlayer_0);
    if not v109 then
        return;
    else
        local v110 = v109:Get("FuseMachine.Cost");
        local v111 = v109:Get("FuseMachine.FinishTime");
        local v112 = v111 and v111 <= workspace:GetServerTimeNow();
        v43:Clean();
        l_Buy_0.Visible = false;
        if not v110 then
            return;
        else
            local v113 = v109:Get("FuseMachine.StartTime");
            if v113 and v113 ~= 0 and not v112 then
                return;
            else
                l_Buy_0.Price.Text = ("$%*"):format((v22:ToString(v110)));
                l_Buy_0.Visible = true;
                v43:Add(v108.OnActivated:Connect(function() --[[ Line: 374 ]]
                    -- upvalues: v18 (ref), v12 (ref), v43 (ref)
                    local v114, v115 = v18.Remotes.ConfirmFusion:InvokeServer();
                    if not v114 then
                        v12:Error(v115 or "Something went wrong!");
                        return;
                    else
                        v43:Clean();
                        return;
                    end;
                end));
                return;
            end;
        end;
    end;
end;
local v117 = v10.new();
local function v129() --[[ Line: 387 ]] --[[ Name: UpdateTimer ]]
    -- upvalues: v117 (copy), v5 (copy), l_LocalPlayer_0 (copy), l_Time_0 (copy), v24 (copy), v25 (copy), v18 (copy), v26 (copy), v52 (copy)
    v117:Clean();
    local v118 = v5:Get(l_LocalPlayer_0);
    if not v118 then
        return;
    else
        l_Time_0.Visible = false;
        local v119 = v118:Get("FuseMachine.FinishTime");
        local l_FuseMachine_1 = workspace:FindFirstChild("FuseMachine");
        if not l_FuseMachine_1 then
            return;
        else
            local l_Countdown_0 = l_FuseMachine_1.Overhead.BillboardGui.Countdown;
            if not l_Countdown_0 then
                return;
            elseif not v119 then
                local v122 = v118:Get("FuseMachine.OutputRarityOdds");
                if v122 then
                    local v123 = "Common";
                    for v124, v125 in v122 do
                        if v125 > 0 then
                            if v24[v124] then
                                if v24[v124].Weight > v24[v123].Weight then
                                    v123 = v124;
                                end;
                            else
                                local v126 = v25[v124];
                                if not v126 or not v126.Price then
                                    warn((("Failed to find AnimalsData for %*"):format(v124)));
                                elseif v24[v126.Rarity].Weight > v24[v123].Weight then
                                    v123 = v126.Rarity;
                                end;
                            end;
                        end;
                    end;
                    local v127 = v18.FuseTime[v123];
                    l_Time_0.Text = ("Fusion Time (<font color=\"#ffff00\">%*</font>)"):format((v26:E(v127)));
                    l_Time_0.Visible = true;
                else
                    l_Time_0.Text = "Fusion Time (<font color=\"#ffff00\">0s</font>)";
                end;
                l_Countdown_0.Text = ("%*/%*"):format(#v52(v118:Get("AnimalPodiums")), v18.FuseSlots);
                return;
            else
                l_Time_0.Visible = true;
                if v119 - workspace:GetServerTimeNow() < 0 then
                    l_Time_0.Text = "Fusion Time (<font color=\"#ffff00\">0s</font>)";
                    l_Countdown_0.Text = "READY";
                    return;
                else
                    local v128 = v26:E(v119 - workspace:GetServerTimeNow());
                    l_Time_0.Text = ("Fusion Time (<font color=\"#ffff00\">%*</font>)"):format(v128);
                    l_Countdown_0.Text = v128;
                    return;
                end;
            end;
        end;
    end;
end;
local function v133() --[[ Line: 463 ]] --[[ Name: UpdateLuckVisibility ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v46 (copy), l_FuseMachine_0 (copy)
    local v130 = v5:Get(l_LocalPlayer_0);
    if not v130 then
        return;
    else
        local v131 = v130:Get("FuseMachine");
        local v132 = if v131.StartTime and v131.StartTime ~= 0 then v131.FuseLuckMultiplier > 1 else v46:GetLuck() > 1;
        l_FuseMachine_0.LuckyIcon.Visible = v132;
        l_FuseMachine_0.LuckBlur.Visible = v132;
        l_FuseMachine_0.Fusions.LuckUIStroke.Enabled = v132;
        return;
    end;
end;
v46.GetLuck = function(_) --[[ Line: 479 ]] --[[ Name: GetLuck ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    return l_ReplicatedStorage_0:GetAttribute("FuseMachineLuck") or 1;
end;
v46.OnLuckChanged = function(v135, v136) --[[ Line: 483 ]] --[[ Name: OnLuckChanged ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    return (l_ReplicatedStorage_0:GetAttributeChangedSignal("FuseMachineLuck"):Connect(function() --[[ Line: 484 ]]
        -- upvalues: v136 (copy), v135 (copy)
        v136(v135:GetLuck());
    end));
end;
v46.Start = function(v137) --[[ Line: 491 ]] --[[ Name: Start ]]
    -- upvalues: l_ContentProvider_0 (copy), v45 (ref), v13 (copy), l_FuseMachine_0 (copy), l_Close_0 (copy), v16 (copy), v18 (copy), v17 (copy), v34 (copy), v9 (copy), v53 (ref), v68 (copy), v116 (copy), v107 (copy), v129 (copy), v133 (copy), v19 (copy), v5 (copy), l_LocalPlayer_0 (copy), v31 (copy), v8 (copy), v10 (copy), v12 (copy), l_Players_0 (copy), v15 (copy), l_ReplicatedStorage_0 (copy), v33 (copy), v25 (copy), v24 (copy)
    task.spawn(pcall, function() --[[ Line: 492 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v45 = v13:Register("FuseMachine", l_FuseMachine_0, "TopQuint");
    v45:AttachCloseButton(l_Close_0);
    v45:Close();
    v16:BindLabelToProductPrice(l_FuseMachine_0.FuseLuck.Buy.Price, v18.FuseLuckProductId, "Product", 100);
    local v138 = v17.new(l_FuseMachine_0.FuseLuck.Buy);
    v138:Animate();
    v138.OnActivated:Connect(function() --[[ Line: 506 ]]
        -- upvalues: v34 (ref), v18 (ref)
        v34:FireServer(v18.FuseLuckProductId);
    end);
    local function v139() --[[ Line: 510 ]] --[[ Name: updateFuseLuckVisibility ]]
        -- upvalues: l_FuseMachine_0 (ref), v9 (ref)
        l_FuseMachine_0.FuseLuck.Visible = v9:GetInstant("FuseMachineService/ShowFuseMachineLuck", true) and v9:GetInstant("FuseMachineService/FuseMachineLuckEnabled", true);
    end;
    v9:OnUpdate(v139);
    task.spawn(v139);
    v53 = function() --[[ Line: 518 ]]
        -- upvalues: v68 (ref), v116 (ref), v107 (ref), v129 (ref), v133 (ref)
        task.spawn(v68);
        task.spawn(v116);
        task.spawn(v107);
        task.spawn(v129);
        task.spawn(v133);
    end;
    v137:OnLuckChanged(v133);
    v19.watch(v107);
    v5:WaitAndCall(l_LocalPlayer_0, function(v140) --[[ Line: 531 ]]
        -- upvalues: v53 (ref)
        v140:OnChanged("FuseMachine", v53);
        v140:OnChanged("FuseMachine.Cost", v53);
        v140:OnChanged("FuseMachine.OutputRarityOdds", v53);
        v140:OnChanged("FuseMachine.OutputTraitsOdds", v53);
        v140:OnChanged("FuseMachine.OutputMutationOdds", v53);
        v140:OnChanged("FuseMachine.FuseLuckMultiplier", v53);
        task.spawn(v53);
    end);
    v31.Simple(1, function() --[[ Line: 542 ]]
        -- upvalues: v129 (ref), v116 (ref)
        v129();
        v116();
    end);
    v8.observeTag("FuseMachinePrompt", function(v141) --[[ Line: 547 ]]
        -- upvalues: v10 (ref), v5 (ref), l_LocalPlayer_0 (ref), v31 (ref), v18 (ref), v12 (ref), v53 (ref), v34 (ref), v13 (ref)
        local v142 = v10.new();
        local function v146() --[[ Line: 550 ]] --[[ Name: UpdatePrompt ]]
            -- upvalues: v5 (ref), l_LocalPlayer_0 (ref), v141 (copy)
            local v143 = v5:Wait(l_LocalPlayer_0);
            if not v143 then
                return;
            else
                local v144 = v143:Get("FuseMachine.StartTime");
                local v145 = v143:Get("FuseMachine.FinishTime");
                if v145 and v145 ~= 0 and v145 <= workspace:GetServerTimeNow() then
                    v141.ActionText = "Claim";
                    return;
                elseif v144 and v144 ~= 0 then
                    if (v143:Get("FuseMachine.InstantReveals") or 0) >= 1 then
                        v141.ActionText = "Reveal Now (FREE)";
                        return;
                    else
                        v141.ActionText = "Reveal Now";
                        return;
                    end;
                else
                    v141.ActionText = "Santa's Fuse";
                    return;
                end;
            end;
        end;
        v142:Add(task.spawn(function() --[[ Line: 571 ]]
            -- upvalues: v5 (ref), l_LocalPlayer_0 (ref), v146 (copy), v142 (copy), v31 (ref)
            local v147 = v5:Wait(l_LocalPlayer_0);
            if not v147 then
                return;
            else
                v147:OnChanged("FuseMachine", v146);
                v147:OnChanged("FuseMachine.Cost", v146);
                v147:OnChanged("FuseMachine.OutputRarityOdds", v146);
                v142:Add(v31.Simple(1, v146));
                task.spawn(v146);
                return;
            end;
        end));
        v142:Add(v141.Triggered:Connect(function() --[[ Line: 586 ]]
            -- upvalues: v5 (ref), l_LocalPlayer_0 (ref), v18 (ref), v12 (ref), v53 (ref), v34 (ref), v13 (ref)
            local v148 = v5:Get(l_LocalPlayer_0);
            if not v148 then
                return;
            else
                local v149 = v148:Get("FuseMachine.StartTime");
                local v150 = v148:Get("FuseMachine.FinishTime");
                if v150 and v150 ~= 0 and v150 <= workspace:GetServerTimeNow() then
                    local v151, v152 = v18.Remotes.ClaimBrainrot:InvokeServer();
                    if not v151 then
                        v12:Error(v152 or "Something went wrong!");
                        return;
                    elseif v53 then
                        v53();
                        return;
                    end;
                elseif v149 and v149 ~= 0 then
                    if (v148:Get("FuseMachine.InstantReveals") or 0) >= 1 then
                        v18.Remotes.RevealNow:FireServer();
                        return;
                    else
                        v34:FireServer(v18.RevealNowProductId);
                        return;
                    end;
                else
                    v13:Toggle("FuseMachine");
                end;
                return;
            end;
        end));
        return function() --[[ Line: 615 ]]
            -- upvalues: v142 (copy)
            v142:Destroy();
        end;
    end);
    v8.observeTag("FuseMachine", function(v153) --[[ Line: 620 ]]
        -- upvalues: v10 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v18 (ref), v15 (ref), l_ReplicatedStorage_0 (ref), v33 (ref), v53 (ref), v137 (copy)
        local v154 = v10.new();
        for _, v156 in v153.Hitboxes:GetChildren() do
            v154:Add(v156.Touched:Connect(function(v157) --[[ Line: 624 ]]
                -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v18 (ref), v156 (copy), v15 (ref), l_ReplicatedStorage_0 (ref), v33 (ref), v53 (ref)
                if v157.Name ~= "HumanoidRootPart" then
                    return;
                else
                    local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v157.Parent);
                    if not l_l_Players_0_PlayerFromCharacter_0 or l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                        return;
                    else
                        if l_l_Players_0_PlayerFromCharacter_0:GetAttribute("StealingIndex") then
                            if not v18.Remotes.Delivery:InvokeServer(v156) then
                                return;
                            else
                                task.spawn(function() --[[ Line: 642 ]]
                                    -- upvalues: v15 (ref), l_ReplicatedStorage_0 (ref)
                                    v15:PlaySound(l_ReplicatedStorage_0.Sounds.Sfx["Fuse Machine"].Deposit);
                                end);
                                local l_FuseMachine_2 = workspace:FindFirstChild("FuseMachine");
                                if l_FuseMachine_2 then
                                    v33.emit(l_FuseMachine_2.Vfx.emitfuse);
                                end;
                                v53();
                            end;
                        end;
                        return;
                    end;
                end;
            end));
        end;
        local l_LuckGui_0 = v153.Overhead.LuckGui;
        local function v162(v161) --[[ Line: 657 ]] --[[ Name: updateLuck ]]
            -- upvalues: l_LuckGui_0 (copy)
            l_LuckGui_0.Enabled = v161 > 1;
        end;
        v154:Add(v137:OnLuckChanged(v162));
        task.defer(v162, v137:GetLuck());
        return function() --[[ Line: 664 ]]
            -- upvalues: v154 (copy)
            v154:Destroy();
        end;
    end);
    v18.Remotes.FuseAnimation.OnClientEvent:Connect(function(v163, _, _) --[[ Line: 669 ]]
        -- upvalues: v10 (ref), l_ReplicatedStorage_0 (ref), v25 (ref), v24 (ref), v15 (ref), v33 (ref)
        local l_FuseMachine_3 = workspace:FindFirstChild("FuseMachine");
        if not l_FuseMachine_3 then
            return;
        else
            local v167 = v10.new();
            local l_Rig_0 = l_FuseMachine_3.Rig;
            local v169 = l_Rig_0.AnimationController.Animator:LoadAnimation(l_ReplicatedStorage_0.Animations.FuseMachine.DoorOpen);
            local v170 = l_Rig_0.AnimationController.Animator:LoadAnimation(l_ReplicatedStorage_0.Animations.FuseMachine.DoorClose);
            local v171 = l_Rig_0.AnimationController.Animator:LoadAnimation(l_ReplicatedStorage_0.Animations.FuseMachine.LeverDown);
            local v172 = l_Rig_0.AnimationController.Animator:LoadAnimation(l_ReplicatedStorage_0.Animations.FuseMachine.LeverUp);
            v167:Add(function() --[[ Line: 683 ]]
                -- upvalues: v169 (copy), v170 (copy), v171 (copy), v172 (copy)
                v169:Stop();
                v169:Destroy();
                v170:Stop();
                v170:Destroy();
                v171:Stop();
                v171:Destroy();
                v172:Stop();
                v172:Destroy();
            end);
            local v173 = v25[v163];
            local _ = v24[v173.Rarity];
            v171:Play();
            v167:Add(v171:GetMarkerReachedSignal("Freeze"):Once(function() --[[ Line: 698 ]]
                -- upvalues: v171 (copy)
                v171:AdjustSpeed(0);
            end));
            task.spawn(function() --[[ Line: 702 ]]
                -- upvalues: l_ReplicatedStorage_0 (ref), v173 (copy), v15 (ref), l_FuseMachine_3 (copy)
                local l_FirstChild_0 = l_ReplicatedStorage_0.Sounds.Sfx["Fuse Machine"]:FindFirstChild(v173.Rarity);
                if l_FirstChild_0 then
                    v15:PlaySound(l_FirstChild_0, l_FuseMachine_3:GetPivot().Position);
                end;
            end);
            v169:Play();
            v167:Add(v169:GetMarkerReachedSignal("Freeze"):Once(function() --[[ Line: 710 ]]
                -- upvalues: v169 (copy)
                v169:AdjustSpeed(0);
            end));
            local l_FirstChild_1 = l_FuseMachine_3.Vfx:FindFirstChild(v173.Rarity);
            if l_FirstChild_1 then
                v33.enable(l_FirstChild_1);
            end;
            task.wait(3);
            v33.disable(l_FirstChild_1);
            task.wait(1);
            v172:Play();
            v171:Stop(0);
            v170:Play();
            local v177 = 2;
            while v170.Length == 0 and v177 > 0 do
                v177 = v177 - task.wait();
            end;
            v169:Stop(0);
            task.wait(2);
            v167:Destroy();
            return;
        end;
    end);
    v18.Remotes.ForceUpdate.OnClientEvent:Connect(function() --[[ Line: 739 ]]
        -- upvalues: v53 (ref)
        v53();
    end);
end;
return v46;