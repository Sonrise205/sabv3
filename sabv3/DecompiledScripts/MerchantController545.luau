local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("ServerStorage");
local _ = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local _ = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.Serialization);
local v10 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v13 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local v15 = require(l_ReplicatedStorage_0.Shared.Mutations);
local v16 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v17 = require(l_ReplicatedStorage_0.Packages.Signal);
local v18 = require(l_ReplicatedStorage_0.Packages.Timer);
local v19 = require(l_ReplicatedStorage_0.Packages.Trove);
local v20 = require(l_ReplicatedStorage_0.Packages.Spr);
local v21 = require(l_ReplicatedStorage_0.Packages.Net);
local v22 = require(l_ReplicatedStorage_0.Shared.Marketplace);
local _ = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local _ = require(l_ReplicatedStorage_0.Controllers.NewPlayersController);
local v25 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local v27 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v29 = require(l_ReplicatedStorage_0.Controllers.ShopController);
local v30 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local v31 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v32 = require(l_ReplicatedStorage_0.Shared.VFX);
local v33 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local v36 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local v38 = require(l_ReplicatedStorage_0.Datas.Mutations);
local v39 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v40 = require(l_ReplicatedStorage_0.Datas.Animals);
local v41 = require(l_ReplicatedStorage_0.Datas.MerchantData);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Merchant_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Merchant").Merchant;
local l_Frame_0 = l_Merchant_0.Frame;
local l_List_0 = l_Frame_0.List;
local l_Close_0 = l_Frame_0.Header.Close;
local v47 = v21:RemoteEvent("MerchantService/SetFocused");
local v48 = v21:RemoteEvent("MerchantService/Animation");
local v49 = v21:RemoteEvent("ShopService/Purchase");
local v50 = v21:RemoteFunction("MerchantService/Buy");
local v51 = nil;
local v52 = l_RunService_0:IsStudio() and false;
local v53 = {};
local function _(v54) --[[ Line: 81 ]] --[[ Name: formatStockAttribute ]]
    return (("StockEvent_%*"):format((string.gsub(v54, "%s", "_"))));
end;
local function _(v56, v57, v58) --[[ Line: 85 ]] --[[ Name: loadAnimation ]]
    local v59 = v56:LoadAnimation(v57);
    v58:Add(function() --[[ Line: 87 ]]
        -- upvalues: v59 (copy)
        v59:Stop(0);
        v59:Destroy();
    end);
    return v59;
end;
local function v63(v61) --[[ Line: 95 ]] --[[ Name: getIntervalInSeconds ]]
    -- upvalues: v16 (copy)
    local l_wday_0 = os.date("!*t", (v61 or workspace:GetServerTimeNow()) // 1).wday;
    if l_wday_0 == 1 or l_wday_0 == 7 then
        return (v16:GetInstant("WeekendMerchantRefreshTime", 1800));
    else
        return (v16:GetInstant("WeekdayMerchantRefreshTime", 1800));
    end;
end;
local function _(v64) --[[ Line: 102 ]] --[[ Name: getRefreshTimestamp ]]
    -- upvalues: v63 (copy)
    local v65 = v64 or workspace:GetServerTimeNow();
    local v66 = v63(v65);
    return v65 + (v66 - v65 % v66);
end;
v53.Start = function(_) --[[ Line: 108 ]] --[[ Name: Start ]]
    -- upvalues: l_Merchant_0 (copy), v51 (ref), v25 (copy), l_Close_0 (copy), v47 (copy), v40 (copy), v39 (copy), v13 (copy), v36 (copy), v41 (copy), v17 (copy), l_List_0 (copy), l_ReplicatedStorage_0 (copy), v52 (copy), v30 (copy), v22 (copy), v20 (copy), v33 (copy), v27 (copy), v50 (copy), v49 (copy), v29 (copy), v15 (copy), l_Frame_0 (copy), v38 (copy), v18 (copy), v31 (copy), v63 (copy), v14 (copy), v19 (copy), v48 (copy), v32 (copy), v10 (copy), l_LocalPlayer_0 (copy)
    l_Merchant_0.Visible = false;
    v51 = v25:Register("Merchant", l_Merchant_0, "TopQuint");
    v51:AttachCloseButton(l_Close_0);
    v51.OnOpen:Connect(function() --[[ Line: 113 ]]
        -- upvalues: v47 (ref)
        v47:FireServer("24afb929-95fb-4893-8056-69039a65e73a", true);
    end);
    v51.OnClose:Connect(function() --[[ Line: 117 ]]
        -- upvalues: v47 (ref)
        v47:FireServer("24afb929-95fb-4893-8056-69039a65e73a", false);
    end);
    v51:Close();
    local function v73(v69, v70) --[[ Line: 124 ]] --[[ Name: renderBrainrotAtFrame ]]
        -- upvalues: v40 (ref), v39 (ref), v13 (ref), v36 (ref)
        local v71 = v40[v70];
        if not v71 then
            return;
        else
            local v72 = v39[v71.Rarity];
            v69.Title.Text = v70;
            if v72.GradientPreset then
                v69.UIStroke.Color = Color3.new(1, 1, 1);
                v69.Title.TextColor3 = Color3.new(1, 1, 1);
                v13.apply(v69.UIStroke, v72.GradientPreset);
                v13.apply(v69.Title, v72.GradientPreset);
            else
                v69.UIStroke.Color = v72.Color;
                v69.Title.TextColor3 = v72.Color;
            end;
            v69.Visible = true;
            v36:AttachOnViewportWithOptimizations(v70, v69.ViewportFrame);
            return;
        end;
    end;
    local v74 = table.create(#v41.Brainrots);
    local v75 = nil;
    local v76 = v17.new();
    local v77 = v17.new();
    for v78, v79 in v41.Brainrots do
        local l_Brainrot_0 = v79.Brainrot;
        local v81 = v40[l_Brainrot_0];
        local v82 = l_List_0.UIListLayout[v79.Template or "Normal"]:Clone();
        v74[v78] = v82;
        v82.Visible = true;
        v82.LayoutOrder = (v78 - 1) * 2;
        local v83 = if v79.ProductId then l_List_0.UIListLayout.DropdownFull:Clone() else l_List_0.UIListLayout.DropdownCoins:Clone();
        v83.LayoutOrder = v82.LayoutOrder + 1;
        v83.Size = UDim2.fromScale(0.973, 0);
        v83.Visible = false;
        v83.Parent = l_List_0;
        v73(v82.Spacer.Brainrot, l_Brainrot_0);
        local function v92() --[[ Line: 173 ]] --[[ Name: updateStock ]]
            -- upvalues: v79 (copy), l_ReplicatedStorage_0 (ref), v52 (ref), v82 (copy), v30 (ref), v83 (copy)
            local v84 = DateTime.fromUnixTimestamp(workspace:GetServerTimeNow());
            local v85 = v84:FormatUniversalTime("YYYY", "en-us");
            local v86 = v84:FormatUniversalTime("MM", "en-us");
            local v87 = v84:FormatUniversalTime("DD", "en-us");
            local v88 = v84:FormatUniversalTime("HH", "en-us");
            local v89 = (tonumber((v84:FormatUniversalTime("mm", "en-us"))) or 0) < 30 and "00" or "30";
            local v90 = ("%*-%*%*%*-%*%*"):format(v79.StockKey, v85, v86, v87, v88, v89);
            local v91 = l_ReplicatedStorage_0:GetAttribute((("StockEvent_%*"):format((string.gsub(v90, "%s", "_"))))) or 0;
            if v52 then
                v91 = 1;
            end;
            v82.Spacer.Left.Txt.Text = if v91 > 0 then ("%* Left"):format((v30:Comma(v91))) else "SOLD OUT";
            v82.Spacer.Left.BackgroundColor3 = if v91 > 0 then Color3.fromRGB(33, 135, 40) else Color3.fromRGB(185, 52, 52);
            v83.Spacer.Cash.BackgroundColor3 = if v91 > 0 then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(127, 127, 127);
            v83.Spacer.Cash.Interactable = v91 > 0;
        end;
        v92();
        v77:Connect(v92);
        l_ReplicatedStorage_0.AttributeChanged:Connect(function(v93) --[[ Line: 197 ]]
            -- upvalues: v92 (copy)
            if string.find(v93, "StockEvent_", 1, true) then
                v92();
            end;
        end);
        v82.Spacer.DropRate.Text = ("$%*/s"):format((v30:ToString(v36:GetGeneration(l_Brainrot_0))));
        if v81 then
            v83.Spacer.Cash.Txt.Text = ("$%*"):format((v30:ToString(v81.Price or 0)));
        else
            v83.Spacer.Cash.Txt.Text = "$???";
        end;
        if v79.ProductId then
            v83.Spacer.Robux.Txt.Text = "\238\128\130???";
            task.spawn(function() --[[ Line: 212 ]]
                -- upvalues: v30 (ref), v22 (ref), v79 (copy), v83 (copy)
                local function _(v94) --[[ Line: 213 ]] --[[ Name: formatPriceInRobux ]]
                    -- upvalues: v30 (ref)
                    if v94 == 999999999 then
                        return "???";
                    else
                        return (v30:Comma(v94));
                    end;
                end;
                local l_v22_ProductInfo_0 = v22:GetProductInfo(v79.ProductId, "Product");
                local l_Txt_0 = v83.Spacer.Robux.Txt;
                local v98 = "\238\128\130%*";
                local v99 = l_v22_ProductInfo_0.PriceInRobux or 999999999;
                l_Txt_0.Text = v98:format(v99 == 999999999 and "???" or v30:Comma(v99));
            end);
        end;
        v82.Spacer.Txt.Text = l_Brainrot_0;
        if v81 then
            local v100 = v39[v81.Rarity];
            if v100.GradientPreset then
                v82.Spacer.Txt.TextColor3 = Color3.new(1, 1, 1);
                v13.apply(v82.Spacer.Txt, v100.GradientPreset);
            else
                v82.Spacer.Txt.TextColor3 = v100.Color;
            end;
        end;
        v82.Parent = l_List_0;
        v76:Connect(function(v101, v102) --[[ Line: 237 ]] --[[ Name: updateFocus ]]
            -- upvalues: v82 (copy), v83 (copy), v20 (ref), l_List_0 (ref), v74 (copy), v78 (copy)
            if v101 == v82 then
                v83.Visible = true;
                v20.target(v83, 0.9, 6, {
                    Size = UDim2.fromScale(0.973, 0.192)
                });
                local v103 = v82.AbsolutePosition.Y - l_List_0.AbsolutePosition.Y + l_List_0.CanvasPosition.Y;
                if v102 ~= nil and v102 ~= v101 and table.find(v74, v102) < v78 then
                    v103 = v103 - 0.192 * l_List_0.AbsoluteSize.Y;
                end;
                v20.target(l_List_0, 1, 4, {
                    CanvasPosition = Vector2.new(0, v103)
                });
                return;
            else
                v20.target(v83, 1, 6, {
                    Size = UDim2.fromScale(0.973, 0)
                });
                v20.completed(v83, function() --[[ Line: 256 ]]
                    -- upvalues: v83 (ref)
                    if v83.Size.Y.Scale < 0.01 then
                        v83.Visible = false;
                    end;
                end);
                return;
            end;
        end);
        v33.new(v82.Spacer).OnActivated:Connect(function() --[[ Line: 267 ]]
            -- upvalues: v27 (ref), v75 (ref), v82 (copy), v76 (copy)
            v27:PlaySound("Sounds.Sfx.Activated");
            local l_v75_0 = v75;
            v75 = if v75 == v82 then nil else v82;
            v76:Fire(v75, l_v75_0);
        end);
        local v105 = v33.new(v83.Spacer.Cash);
        v105:Animate();
        v105.OnActivated:Connect(function() --[[ Line: 277 ]]
            -- upvalues: v50 (ref), v78 (copy), v27 (ref), v25 (ref)
            if v50:InvokeServer("356f17aa-ffa8-402f-9851-e75c1a8ae15e", v78) then
                v27:PlaySound("Sounds.Sfx.Success");
                v25:SetState("Merchant", false);
            end;
        end);
        if v79.ProductId then
            local v106 = v33.new(v83.Spacer.Robux);
            v106:Animate();
            v106.OnActivated:Connect(function() --[[ Line: 288 ]]
                -- upvalues: v49 (ref), v79 (copy)
                v49:FireServer(v79.ProductId);
            end);
            local v107 = v33.new(v83.Spacer.Gift);
            v107:Animate();
            v107.OnActivated:Connect(function() --[[ Line: 294 ]]
                -- upvalues: v29 (ref), v51 (ref), v49 (ref), v79 (copy)
                if v29.GiftFrame.Visible then
                    return;
                else
                    v29:RemoveGiftingTarget();
                    v29:OpenGiftingScreen();
                    v29.GiftFrame:GetPropertyChangedSignal("Visible"):Wait();
                    if not v51:IsOpened() then
                        return;
                    else
                        local l_v29_GiftingTarget_0 = v29:GetGiftingTarget();
                        if l_v29_GiftingTarget_0 then
                            v49:FireServer(v79.ProductId, l_v29_GiftingTarget_0);
                        end;
                        v29:RemoveGiftingTarget();
                        return;
                    end;
                end;
            end);
        end;
    end;
    local function v111() --[[ Line: 319 ]] --[[ Name: updateMutation ]]
        -- upvalues: v15 (ref), l_Frame_0 (ref), v20 (ref), v38 (ref)
        local v109 = v15.get();
        l_Frame_0.Mutation.Visible = v109 ~= nil;
        if v109 ~= nil then
            v20.target(l_Frame_0.Mutation, 1, 4, {
                Position = UDim2.fromScale(0.5, 1.01)
            });
            v20.target(l_Frame_0, 1, 4, {
                Position = UDim2.fromScale(0.5, 0.44)
            });
        else
            v20.target(l_Frame_0.Mutation, 1, 4, {
                Position = UDim2.fromScale(0.5, 0.9)
            });
            v20.target(l_Frame_0, 1, 4, {
                Position = UDim2.fromScale(0.5, 0.5)
            });
        end;
        if v109 then
            local v110 = v38[v109];
            assert(v110);
            l_Frame_0.Mutation.Frame.Icon.Image = v110.Icon;
            l_Frame_0.Mutation.Frame.Txt.Text = ("10%% Chance of buying %*"):format(v110.DisplayText);
            if v109 == "YinYang" then
                l_Frame_0.Mutation.UIStroke.UIGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(0.49, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(0.51, Color3.new(1, 1, 1)), 
                    ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
                });
                return;
            else
                l_Frame_0.Mutation.UIStroke.UIGradient.Color = ColorSequence.new(v110.MainColor);
            end;
        end;
    end;
    v15.watch(v111);
    v111();
    local function _(v112) --[[ Line: 355 ]] --[[ Name: getMinuteBucket ]]
        if (tonumber((DateTime.fromUnixTimestamp(v112 or workspace:GetServerTimeNow()):FormatUniversalTime("mm", "en-us"))) or 0) < 30 then
            return "00";
        else
            return "30";
        end;
    end;
    local v114 = (tonumber((DateTime.fromUnixTimestamp((workspace:GetServerTimeNow())):FormatUniversalTime("mm", "en-us"))) or 0) < 30 and "00" or "30";
    v18.Simple(1, function() --[[ Line: 361 ]]
        -- upvalues: v31 (ref), v63 (ref), v114 (ref), v77 (copy), l_Frame_0 (ref)
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v116 = "Restocking in %*";
        local l_v31_0 = v31;
        local v118 = l_workspace_ServerTimeNow_0 or workspace:GetServerTimeNow();
        local v119 = v63(v118);
        local v120 = v116:format((l_v31_0:E(v118 + (v119 - v118 % v119) - l_workspace_ServerTimeNow_0)));
        v116 = (tonumber((DateTime.fromUnixTimestamp(l_workspace_ServerTimeNow_0 or workspace:GetServerTimeNow()):FormatUniversalTime("mm", "en-us"))) or 0) < 30 and "00" or "30";
        if v114 ~= v116 then
            v114 = v116;
            v77:Fire();
        end;
        l_Frame_0.Header.Txt1.Text = v120;
        local l_Merchant_1 = workspace:FindFirstChild("Merchant");
        if l_Merchant_1 then
            l_Merchant_1.Overhead.BillboardGui.Countdown.Text = v120;
        end;
    end);
    v14.observeTag("MerchantNPC", function(v122) --[[ Line: 379 ]]
        -- upvalues: v19 (ref), v48 (ref), l_ReplicatedStorage_0 (ref), v27 (ref), v32 (ref)
        local v123 = v19.new();
        local l_Animator_0 = v122.Humanoid.Animator;
        local v125 = l_Animator_0:LoadAnimation(script.Idle);
        local l_v125_0 = v125 --[[ copy: 5 -> 9 ]];
        v123:Add(function() --[[ Line: 87 ]]
            -- upvalues: l_v125_0 (copy)
            l_v125_0:Stop(0);
            l_v125_0:Destroy();
        end);
        local l_v125_1 = v125;
        l_v125_1.Priority = Enum.AnimationPriority.Idle;
        l_v125_1.Looped = true;
        l_v125_1:Play();
        local v128 = l_Animator_0:LoadAnimation(script.IdleToAction);
        local l_v128_0 = v128 --[[ copy: 6 -> 10 ]];
        v123:Add(function() --[[ Line: 87 ]]
            -- upvalues: l_v128_0 (copy)
            l_v128_0:Stop(0);
            l_v128_0:Destroy();
        end);
        local l_v128_1 = v128;
        l_v128_1.Priority = Enum.AnimationPriority.Action;
        local v131 = l_Animator_0:LoadAnimation(script.ActionIdle);
        v123:Add(function() --[[ Line: 87 ]]
            -- upvalues: v131 (copy)
            v131:Stop(0);
            v131:Destroy();
        end);
        v125 = v131;
        v125.Priority = Enum.AnimationPriority.Movement;
        v125.Looped = true;
        local v132 = l_Animator_0:LoadAnimation(script.ActionToIdle);
        v123:Add(function() --[[ Line: 87 ]]
            -- upvalues: v132 (copy)
            v132:Stop(0);
            v132:Destroy();
        end);
        v128 = v132;
        v128.Priority = Enum.AnimationPriority.Action;
        v123:Add(l_v128_1.Stopped:Connect(function() --[[ Line: 398 ]]
            -- upvalues: v125 (copy)
            v125:Play();
        end));
        v123:Add(v125.Stopped:Connect(function() --[[ Line: 402 ]]
            -- upvalues: v128 (copy)
            v128:Play();
        end));
        v123:Add(v48.OnClientEvent:Connect(function(_, v134) --[[ Line: 406 ]]
            -- upvalues: l_v128_1 (copy), v122 (copy), l_ReplicatedStorage_0 (ref), v27 (ref), v32 (ref), v125 (copy)
            local v135 = script.SpawnEffects:FindFirstChild(v134) or script.SpawnEffects.Rare;
            if not v135 then
                return;
            else
                l_v128_1:Play();
                task.wait(0.5);
                local v136 = v122:GetPivot() * CFrame.new(0, 3.5, -3);
                task.spawn(function() --[[ Line: 418 ]]
                    -- upvalues: l_ReplicatedStorage_0 (ref), v134 (copy), v27 (ref), v136 (copy)
                    local l_FirstChild_0 = l_ReplicatedStorage_0.Sounds.Sfx.Merchant:FindFirstChild(v134);
                    if l_FirstChild_0 then
                        v27:PlaySound(l_FirstChild_0, v136.Position);
                    end;
                end);
                local v138 = v135:Clone();
                v138:PivotTo(v136);
                v138.Parent = workspace;
                v32.emit(v138);
                task.wait(2.5);
                v125:Stop();
                return;
            end;
        end));
        return v123:WrapClean();
    end, {
        workspace
    });
    v14.observeTag("MerchantPrompt", function(v139) --[[ Line: 439 ]]
        -- upvalues: v19 (ref), v10 (ref), l_LocalPlayer_0 (ref), v18 (ref), v25 (ref)
        local v140 = v19.new();
        local function v141() --[[ Line: 442 ]] --[[ Name: updatePrompt ]]
            -- upvalues: v10 (ref), l_LocalPlayer_0 (ref), v139 (copy)
            if not v10:Wait(l_LocalPlayer_0) then
                return;
            else
                v139.ObjectText = "Brainrot Dealer";
                v139.ActionText = "View";
                return;
            end;
        end;
        v140:Add(task.spawn(function() --[[ Line: 452 ]]
            -- upvalues: v10 (ref), l_LocalPlayer_0 (ref), v140 (copy), v18 (ref), v141 (copy)
            if not v10:Wait(l_LocalPlayer_0) then
                return;
            else
                v140:Add(v18.Simple(1, v141));
                task.spawn(v141);
                return;
            end;
        end));
        v140:Add(v139.Triggered:Connect(function() --[[ Line: 462 ]]
            -- upvalues: v10 (ref), l_LocalPlayer_0 (ref), v25 (ref)
            if not v10:Get(l_LocalPlayer_0) then
                return;
            else
                v25:Toggle("Merchant");
                return;
            end;
        end));
        return function() --[[ Line: 471 ]]
            -- upvalues: v140 (copy)
            v140:Destroy();
        end;
    end);
end;
return v53;