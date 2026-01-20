local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local _ = game:GetService("HttpService");
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
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Squash);
local v17 = require(l_ReplicatedStorage_0.Packages.Timer);
local v18 = require(l_ReplicatedStorage_0.Packages.Trove);
local v19 = require(l_ReplicatedStorage_0.Packages.Spr);
local v20 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local _ = require(l_ReplicatedStorage_0.Controllers.NewPlayersController);
local v23 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local v25 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.ShopController);
local _ = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v28 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local v29 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v30 = require(l_ReplicatedStorage_0.Shared.VFX);
local v31 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local v34 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local v36 = require(l_ReplicatedStorage_0.Datas.Mutations);
local v37 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v38 = require(l_ReplicatedStorage_0.Datas.Animals);
local v39 = require(l_ReplicatedStorage_0.Datas.Traits);
local v40 = v20:RemoteEvent("BrainrotTraderService/Animation");
local v41 = v20:RemoteEvent("BrainrotTraderService/Update");
local v42 = v20:RemoteEvent("BrainrotTraderService/Return");
local v43 = v20:RemoteEvent("BrainrotTraderService/Trade");
local v44 = v20:RemoteFunction("BrainrotTraderService/Delivery");
local v45 = v20:RemoteFunction("BrainrotTraderService/Fetch");
local _ = v20:RemoteEvent("ShopService/Purchase");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_BrainrotTrader_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("BrainrotTrader").BrainrotTrader;
local l_Frame_0 = l_BrainrotTrader_0.Frame;
local _ = l_Frame_0.List;
local l_Txt1_0 = l_Frame_0.Header.Txt1;
local l_Close_0 = l_Frame_0.Header.Close;
local _ = v18.new();
local _ = v18.new();
local v55 = nil;
local v56 = nil;
local v57 = false;
local v58 = {};
local function _(v59, v60, v61) --[[ Line: 96 ]] --[[ Name: loadAnimation ]]
    local v62 = v59:LoadAnimation(v60);
    v61:Add(function() --[[ Line: 98 ]]
        -- upvalues: v62 (copy)
        v62:Stop(0);
        v62:Destroy();
    end);
    return v62;
end;
local function v66() --[[ Line: 106 ]] --[[ Name: updateVFX ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (copy), v57 (ref)
    local v64 = v9:Get(l_LocalPlayer_0);
    if not v64 then
        return;
    elseif v57 then
        return;
    elseif not workspace:FindFirstChild("BrainrotTrader") then
        return;
    elseif not v64:Get("BrainrotTrader") then
        return;
    else
        local _ = workspace:GetServerTimeNow();
        v57 = true;
        task.wait(2);
        v57 = false;
        return;
    end;
end;
local v67 = v18.new();
local function v73() --[[ Line: 135 ]] --[[ Name: updateTimer ]]
    -- upvalues: v67 (copy), v9 (copy), l_LocalPlayer_0 (copy), l_Txt1_0 (copy), v56 (ref), v29 (copy)
    v67:Clean();
    if not v9:Get(l_LocalPlayer_0) then
        return;
    else
        l_Txt1_0.Visible = false;
        local l_BrainrotTrader_1 = workspace:FindFirstChild("BrainrotTrader");
        if not l_BrainrotTrader_1 then
            return;
        else
            local l_Countdown_0 = l_BrainrotTrader_1.Overhead.BillboardGui.Countdown;
            if not l_Countdown_0 then
                return;
            else
                l_Txt1_0.Visible = true;
                local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                local v71 = math.max((v56 and v56.Refresh or 0) - l_workspace_ServerTimeNow_1, 0);
                local v72 = ("Refreshes in %*"):format((v29:E(v71)));
                l_Countdown_0.Text = v72;
                l_Txt1_0.Text = v72;
                return;
            end;
        end;
    end;
end;
local v74 = v18.new();
local function v79(v75, v76) --[[ Line: 166 ]] --[[ Name: renderBrainrotAtFrame ]]
    -- upvalues: v38 (copy), v37 (copy), v12 (copy), v34 (copy)
    local v77 = v38[v76];
    if not v77 then
        return;
    else
        local v78 = v37[v77.Rarity];
        v75.Title.Text = v76;
        if v78.GradientPreset then
            v75.UIStroke.Color = Color3.new(1, 1, 1);
            v75.Title.TextColor3 = Color3.new(1, 1, 1);
            v12.apply(v75.UIStroke, v78.GradientPreset);
            v12.apply(v75.Title, v78.GradientPreset);
        else
            v75.UIStroke.Color = v78.Color;
            v75.Title.TextColor3 = v78.Color;
        end;
        v75.Visible = true;
        v34:AttachOnViewportWithOptimizations(v76, v75.ViewportFrame);
        return;
    end;
end;
local v80 = v18.new();
local function v115() --[[ Line: 191 ]] --[[ Name: updateMutationList ]]
    -- upvalues: v80 (copy), v56 (ref), v9 (copy), l_LocalPlayer_0 (copy), v38 (copy), v37 (copy), l_BrainrotTrader_0 (copy), v36 (copy), v12 (copy), v39 (copy)
    v80:Clean();
    if not v56 then
        return;
    else
        local v81 = v9:Get(l_LocalPlayer_0);
        if not v81 then
            return;
        else
            local v82 = v81:Get("BrainrotTrader.Info");
            if not v82 then
                return;
            else
                local v83 = {};
                for v84, v85 in v82 do
                    local l_Mutations_0 = v85.Mutations;
                    local l_Traits_0 = v85.Traits;
                    l_Mutations_0.Normal = nil;
                    if next(l_Mutations_0) or next(l_Traits_0) then
                        local v88 = v56 and v56.List[v84] and v56.List[v84].Name;
                        if v88 then
                            local v89 = v38[v88];
                            if v89 and tonumber(string.match(v84, "(%d+)")) then
                                local v90 = v37[v89.Rarity];
                                local v91 = 0;
                                for _, v93 in l_Mutations_0 do
                                    v91 = v91 + v93;
                                end;
                                local v94 = 0;
                                for _, v96 in l_Traits_0 do
                                    v94 = v94 + v96;
                                end;
                                local v97 = v90.Weight * 10 + #v56.List[v84].Recipe * 5 + v94 / 10 + v91 / 10;
                                local v98 = v80:Clone(l_BrainrotTrader_0.Odds.UIListLayout.Template);
                                table.insert(v83, {
                                    frame = v98, 
                                    score = v97
                                });
                                v98.Header.Title.Text = v88 or "???";
                                for v99, v100 in l_Mutations_0 do
                                    local v101 = v36[v99];
                                    if v101 then
                                        local v102 = v80:Clone(v98.ScrollingFrame.UIListLayout.Template);
                                        v102.Name = v99;
                                        v102.LayoutOrder = -v100;
                                        v102.Vector.Image = v101.Icon or "";
                                        v102.Title.Text = if v101.UseRichText then v101.DisplayWithRichText else v101.DisplayText;
                                        v102.Title.RichText = v101.UseRichText;
                                        if v101.GradientPreset then
                                            v102.Title.TextColor3 = Color3.fromRGB(255, 255, 255);
                                            v12.apply(v102.Title, v101.GradientPreset);
                                        else
                                            v102.Title.TextColor3 = v101.MainColor;
                                        end;
                                        local _, v104 = math.modf(v100);
                                        v102.Chance.Text = ("%*%%"):format((string.format(v104 == 0 and "%d" or "%.2f", v100)));
                                        v102.Visible = true;
                                        v102.Parent = v98.ScrollingFrame;
                                    end;
                                end;
                                for v105, v106 in l_Traits_0 do
                                    local v107 = v39[v105];
                                    if v107 then
                                        local v108 = v80:Clone(v98.ScrollingFrame.UIListLayout.Template);
                                        v108.Name = v105;
                                        v108.LayoutOrder = -v106;
                                        v108.Vector.Image = v107.Icon or "";
                                        v108.Title.Text = v107.DisplayWithRichText;
                                        v108.Title.TextColor3 = v107.Color;
                                        v108.Title.RichText = true;
                                        local _, v110 = math.modf(v106);
                                        v108.Chance.Text = ("%*%%"):format((string.format(v110 == 0 and "%d" or "%.2f", v106)));
                                        v108.Visible = true;
                                        v108.Parent = v98.ScrollingFrame;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                table.sort(v83, function(v111, v112) --[[ Line: 308 ]]
                    return v111.score < v112.score;
                end);
                for v113 = math.max(#v83 - 4, 1), #v83 do
                    local l_frame_0 = v83[v113].frame;
                    l_frame_0.LayoutOrder = -v113;
                    l_frame_0.Parent = if #v83 - 2 < v113 then l_BrainrotTrader_0.Odds2 else l_BrainrotTrader_0.Odds;
                end;
                return;
            end;
        end;
    end;
end;
local function v155() --[[ Line: 319 ]] --[[ Name: updateList ]]
    -- upvalues: v74 (copy), v56 (ref), v9 (copy), l_LocalPlayer_0 (copy), l_Frame_0 (copy), v38 (copy), v37 (copy), v34 (copy), v79 (copy), v28 (copy), v12 (copy), v19 (copy), v31 (copy), v42 (copy), v43 (copy), v23 (copy)
    v74:Clean();
    if not v56 then
        return;
    else
        local v116 = v9:Get(l_LocalPlayer_0);
        if not v116 then
            return;
        else
            local v117 = {};
            local l_List_1 = l_Frame_0.List;
            for v119, v120 in v56.List do
                local v121 = tonumber(string.match(v119, "(%d+)"));
                if v121 then
                    local v122 = v38[v120.Name];
                    if v122 then
                        local _ = v37[v122.Rarity];
                        local l_Name_0 = v120.Name;
                        local v125 = v38[l_Name_0];
                        local v126 = l_List_1.UIListLayout[v120.Template or "Normal"];
                        local v127 = v74:Clone(v126);
                        v117[v121] = v127;
                        v127.Visible = true;
                        v127.LayoutOrder = ((v34:GetGeneration(v120.Name) or 0) - 1) * 2;
                        local v128 = v74:Clone(l_List_1.UIListLayout.Dropdown);
                        v128.LayoutOrder = v127.LayoutOrder + 1;
                        v128.Size = UDim2.fromScale(0.973, 0);
                        v128.Visible = false;
                        v128.Parent = l_List_1;
                        v79(v127.Spacer.Brainrot, l_Name_0);
                        v127.Spacer.DropRate.Text = ("$%*/s"):format((v28:ToString(v34:GetGeneration(l_Name_0))));
                        v127.Spacer.Txt.Text = l_Name_0;
                        if v125 then
                            local v129 = v37[v125.Rarity];
                            if v129.GradientPreset then
                                v127.Spacer.Txt.TextColor3 = Color3.new(1, 1, 1);
                                v12.apply(v127.Spacer.Txt, v129.GradientPreset);
                            else
                                v127.Spacer.Txt.TextColor3 = v129.Color;
                            end;
                        end;
                        v127.Parent = l_List_1;
                        local function v131(v130) --[[ Line: 381 ]] --[[ Name: setExpanded ]]
                            -- upvalues: v128 (copy), v19 (ref)
                            if v130 then
                                v128.Visible = true;
                                v19.target(v128, 0.9, 6, {
                                    Size = UDim2.fromScale(0.973, 0.192)
                                });
                                return;
                            else
                                v19.target(v128, 1, 6, {
                                    Size = UDim2.fromScale(0.973, 0)
                                });
                                v19.completed(v128, function() --[[ Line: 387 ]]
                                    -- upvalues: v128 (ref)
                                    if v128.Size.Y.Scale < 0.01 then
                                        v128.Visible = false;
                                    end;
                                end);
                                return;
                            end;
                        end;
                        local v132 = {};
                        for v133, v134 in v120.Recipe do
                            local v135 = v38[v134];
                            if v135 then
                                local v136 = v37[v135.Rarity];
                                local v137 = v74:Clone(v127.Spacer.List.UIListLayout.Template);
                                v137.LayoutOrder = v136.Weight * 100 + v133;
                                v137.Title.Text = v134;
                                v137.Title.TextColor3 = Color3.new(1, 1, 1);
                                if v136.GradientPreset then
                                    v137.UIStroke.Color = Color3.new(1, 1, 1);
                                    v74:Add(v12.apply(v137.UIStroke, v136.GradientPreset));
                                else
                                    v137.UIStroke.Color = v136.Color;
                                end;
                                v137.Visible = true;
                                v137.Return.Visible = false;
                                v137.ViewportFrame.ImageColor3 = Color3.new(0, 0, 0);
                                local v138 = v34:AttachOnViewportWithOptimizations(v134, v137.ViewportFrame, true);
                                if v138 then
                                    v74:Add(v138);
                                end;
                                v137.Parent = v127.Spacer.List;
                                if not v132[v134] then
                                    v132[v134] = {};
                                end;
                                table.insert(v132[v134], v137);
                                local v139 = v74:Add(v31.new(v137.Return));
                                v139:Animate();
                                v74:Add(v139.OnActivated:Connect(function() --[[ Line: 434 ]]
                                    -- upvalues: v116 (copy), v134 (copy), v42 (ref)
                                    for v140, v141 in (v116:Get("AnimalPodiums")) do
                                        if type(v141) == "table" and v141.Index == v134 and v141.Machine and v141.Machine.Type == "BrainrotTrader" and not v141.Machine.Active then
                                            v42:FireServer(v140);
                                            return;
                                        end;
                                    end;
                                end));
                            end;
                        end;
                        local function v153() --[[ Line: 445 ]] --[[ Name: updateBrainrotFrame ]]
                            -- upvalues: v116 (copy), v132 (copy), v131 (copy), v128 (copy)
                            local v142 = v116:Get("AnimalPodiums");
                            local v143 = {};
                            for _, v145 in v142 do
                                if type(v145) == "table" and v145.Machine and v145.Machine.Type == "BrainrotTrader" and not v145.Machine.Active then
                                    v143[v145.Index] = (v143[v145.Index] or 0) + 1;
                                end;
                            end;
                            local v146 = true;
                            for v147, v148 in v132 do
                                local v149 = v143[v147] or 0;
                                for v150, v151 in v148 do
                                    local v152 = v150 <= v149;
                                    v151.Return.Visible = v152;
                                    v151.ViewportFrame.ImageColor3 = if v152 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0);
                                    if not v152 then
                                        v146 = false;
                                    end;
                                end;
                            end;
                            v131(v146);
                            v128.Spacer.Spawn.Interactable = v146;
                            v128.Spacer.Spawn.BackgroundColor3 = if v146 then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(127, 127, 127);
                        end;
                        v74:Add(v116:OnChanged("AnimalAddedOrRemoved", v153));
                        v74:Add(task.spawn(v153));
                        local v154 = v31.new(v128.Spacer.Spawn);
                        v74:Add(v154);
                        v154:Animate();
                        v74:Add(v154.OnActivated:Connect(function() --[[ Line: 483 ]]
                            -- upvalues: v43 (ref), v119 (copy), l_Name_0 (copy), v23 (ref)
                            v43:FireServer(v119, l_Name_0);
                            v23:Toggle("BrainrotTrader", false);
                        end));
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v58.Start = function(_) --[[ Line: 490 ]] --[[ Name: Start ]]
    -- upvalues: l_BrainrotTrader_0 (copy), v55 (ref), v23 (copy), l_Close_0 (copy), v9 (copy), l_LocalPlayer_0 (copy), v73 (copy), v17 (copy), v66 (copy), v13 (copy), v18 (copy), l_Players_0 (copy), v44 (copy), v25 (copy), l_ReplicatedStorage_0 (copy), v40 (copy), v30 (copy), v41 (copy), v56 (ref), v155 (copy), v115 (copy), v45 (copy)
    l_BrainrotTrader_0.Visible = false;
    v55 = v23:Register("BrainrotTrader", l_BrainrotTrader_0, "TopQuint");
    v55:AttachCloseButton(l_Close_0);
    v55:Close();
    v9:WaitAndCall(l_LocalPlayer_0, function(v157) --[[ Line: 499 ]]
        -- upvalues: v73 (ref)
        local function v158() --[[ Line: 500 ]] --[[ Name: update ]]
            -- upvalues: v73 (ref)
            task.spawn(v73);
        end;
        v157:OnChanged("BrainrotTrader", v158);
        v157:OnChanged("BrainrotTrader.Id", v158);
        task.spawn(v158);
    end);
    v17.Simple(1, function() --[[ Line: 509 ]]
        -- upvalues: v66 (ref), v73 (ref)
        task.spawn(v66);
        task.spawn(v73);
    end);
    v13.observeTag("BrainrotTraderPrompt", function(v159) --[[ Line: 514 ]]
        -- upvalues: v18 (ref), v9 (ref), l_LocalPlayer_0 (ref), v17 (ref), v23 (ref)
        local v160 = v18.new();
        local function v161() --[[ Line: 517 ]] --[[ Name: updatePrompt ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v159 (copy)
            if not v9:Wait(l_LocalPlayer_0) then
                return;
            else
                v159.ActionText = "View";
                v159.ObjectText = "Brainrot Trader";
                return;
            end;
        end;
        v160:Add(task.spawn(function() --[[ Line: 527 ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v161 (copy), v160 (copy), v17 (ref)
            local v162 = v9:Wait(l_LocalPlayer_0);
            if not v162 then
                return;
            else
                v162:OnChanged("BrainrotTrader", v161);
                v160:Add(v17.Simple(1, v161));
                task.spawn(v161);
                return;
            end;
        end));
        v160:Add(v159.Triggered:Connect(function() --[[ Line: 538 ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v23 (ref)
            if not v9:Get(l_LocalPlayer_0) then
                return;
            else
                v23:Toggle("BrainrotTrader");
                return;
            end;
        end));
        return function() --[[ Line: 547 ]]
            -- upvalues: v160 (copy)
            v160:Destroy();
        end;
    end);
    v13.observeTag("BrainrotTrader", function(v163) --[[ Line: 552 ]]
        -- upvalues: v18 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v44 (ref), v25 (ref), l_ReplicatedStorage_0 (ref), v73 (ref)
        local v164 = v18.new();
        for _, v166 in v163.Hitboxes:GetChildren() do
            v164:Add(v166.Touched:Connect(function(v167) --[[ Line: 556 ]]
                -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v44 (ref), v166 (copy), v25 (ref), l_ReplicatedStorage_0 (ref), v73 (ref)
                if v167.Name ~= "HumanoidRootPart" then
                    return;
                else
                    local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v167.Parent);
                    if not l_l_Players_0_PlayerFromCharacter_0 or l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                        return;
                    else
                        if l_l_Players_0_PlayerFromCharacter_0:GetAttribute("StealingIndex") then
                            local v169, _, _ = v44:InvokeServer(v166);
                            if not v169 then
                                return;
                            else
                                task.spawn(function() --[[ Line: 573 ]]
                                    -- upvalues: v25 (ref), l_ReplicatedStorage_0 (ref)
                                    v25:PlaySound(l_ReplicatedStorage_0.Sounds.Sfx["Fuse Machine"].Deposit);
                                end);
                                v73();
                            end;
                        end;
                        return;
                    end;
                end;
            end));
        end;
        return function() --[[ Line: 583 ]]
            -- upvalues: v164 (copy)
            v164:Destroy();
        end;
    end);
    v13.observeTag("BrainrotTraderNPC", function(v172) --[[ Line: 588 ]]
        -- upvalues: v18 (ref), v40 (ref), l_ReplicatedStorage_0 (ref), v25 (ref), v30 (ref)
        local v173 = v18.new();
        local l_Animator_0 = v172.Humanoid.Animator;
        local v175 = l_Animator_0:LoadAnimation(script.Idle);
        local l_v175_0 = v175 --[[ copy: 5 -> 9 ]];
        v173:Add(function() --[[ Line: 98 ]]
            -- upvalues: l_v175_0 (copy)
            l_v175_0:Stop(0);
            l_v175_0:Destroy();
        end);
        local l_v175_1 = v175;
        l_v175_1.Priority = Enum.AnimationPriority.Idle;
        l_v175_1.Looped = true;
        l_v175_1:Play();
        local v178 = l_Animator_0:LoadAnimation(script.IdleToAction);
        local l_v178_0 = v178 --[[ copy: 6 -> 10 ]];
        v173:Add(function() --[[ Line: 98 ]]
            -- upvalues: l_v178_0 (copy)
            l_v178_0:Stop(0);
            l_v178_0:Destroy();
        end);
        local l_v178_1 = v178;
        l_v178_1.Priority = Enum.AnimationPriority.Action;
        local v181 = l_Animator_0:LoadAnimation(script.ActionIdle);
        v173:Add(function() --[[ Line: 98 ]]
            -- upvalues: v181 (copy)
            v181:Stop(0);
            v181:Destroy();
        end);
        v175 = v181;
        v175.Priority = Enum.AnimationPriority.Movement;
        v175.Looped = true;
        local v182 = l_Animator_0:LoadAnimation(script.ActionToIdle);
        v173:Add(function() --[[ Line: 98 ]]
            -- upvalues: v182 (copy)
            v182:Stop(0);
            v182:Destroy();
        end);
        v178 = v182;
        v178.Priority = Enum.AnimationPriority.Action;
        v173:Add(l_v178_1.Stopped:Connect(function() --[[ Line: 607 ]]
            -- upvalues: v175 (copy)
            v175:Play();
        end));
        v173:Add(v175.Stopped:Connect(function() --[[ Line: 611 ]]
            -- upvalues: v178 (copy)
            v178:Play();
        end));
        v173:Add(v40.OnClientEvent:Connect(function(_, v184) --[[ Line: 615 ]]
            -- upvalues: l_v178_1 (copy), v172 (copy), l_ReplicatedStorage_0 (ref), v25 (ref), v30 (ref), v175 (copy)
            local v185 = script.SpawnEffects:FindFirstChild(v184) or script.SpawnEffects.Rare;
            if not v185 then
                return;
            else
                l_v178_1:Play();
                task.wait(0.5);
                local v186 = v172:GetPivot() * CFrame.new(0, 3.5, -3);
                task.spawn(function() --[[ Line: 627 ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), v184 (copy), v25 (ref), v186 (copy)
                    local l_FirstChild_0 = l_ReplicatedStorage_0.Sounds.Sfx.Merchant:FindFirstChild(v184);
                    if l_FirstChild_0 then
                        v25:PlaySound(l_FirstChild_0, v186.Position);
                    end;
                end);
                local v188 = v185:Clone();
                v188:PivotTo(v186);
                v188.Parent = workspace;
                v30.emit(v188);
                task.wait(2.5);
                v175:Stop();
                return;
            end;
        end));
        return v173:WrapClean();
    end, {
        workspace
    });
    v41.OnClientEvent:Connect(function(v189) --[[ Line: 648 ]]
        -- upvalues: v56 (ref), v155 (ref), v115 (ref)
        v56 = v189;
        v155();
        v115();
    end);
    v56 = v45:InvokeServer() or v56;
    task.spawn(v155);
    v9:WaitAndCall(l_LocalPlayer_0, function(v190) --[[ Line: 657 ]]
        -- upvalues: v115 (ref), v155 (ref)
        v190:OnChanged("BrainrotTrader.Info", v115);
        task.spawn(v115);
        v155();
    end);
end;
return v58;