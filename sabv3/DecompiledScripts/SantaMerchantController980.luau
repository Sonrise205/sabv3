local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("ServerStorage");
local _ = game:GetService("SoundService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("HttpService");
local _ = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.Serialization);
local v10 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v13 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.Mutations);
local v16 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v17 = require(l_ReplicatedStorage_0.Packages.Signal);
local v18 = require(l_ReplicatedStorage_0.Packages.Timer);
local v19 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local v21 = require(l_ReplicatedStorage_0.Packages.Net);
local v22 = require(l_ReplicatedStorage_0.Shared.Marketplace);
local v23 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local _ = require(l_ReplicatedStorage_0.Controllers.NewPlayersController);
local v25 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local v27 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v29 = require(l_ReplicatedStorage_0.Controllers.ShopController);
local v30 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local v31 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v33 = require(l_ReplicatedStorage_0.Shared.VFX);
local v34 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local v37 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local _ = require(l_ReplicatedStorage_0.Datas.Mutations);
local v40 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v41 = require(l_ReplicatedStorage_0.Datas.Animals);
local v42 = require(l_ReplicatedStorage_0.Datas.SantaMerchantData);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_SantaMerchant_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("SantaMerchant").SantaMerchant;
local l_Brainrots_0 = l_SantaMerchant_0.Brainrots;
local l_Close_0 = l_SantaMerchant_0.Header.Close;
local l_GiftPlayerSelect_0 = l_SantaMerchant_0.GiftPlayerSelect;
local l_GiftButton_0 = l_GiftPlayerSelect_0:WaitForChild("GiftButton");
local l_Txt_0 = l_GiftButton_0:WaitForChild("Txt");
local l_PlayerSelected_0 = l_GiftPlayerSelect_0:WaitForChild("PlayerSelected");
local l_Headshot_0 = l_PlayerSelected_0:WaitForChild("PlayerImage"):WaitForChild("Headshot");
local l_PlayerName_0 = l_PlayerSelected_0:WaitForChild("PlayerName");
local v53 = v21:RemoteEvent("SantaMerchantService/CollectGoldElf");
local v54 = v21:RemoteEvent("SantaMerchantService/SetFocused");
local v55 = v21:RemoteEvent("SantaMerchantService/Animation");
local v56 = v21:RemoteFunction("SantaMerchantService/Buy");
local v57 = v21:RemoteEvent("ShopService/Purchase");
local v58 = nil;
local v59 = {};
local function _(v60) --[[ Line: 92 ]] --[[ Name: formatStockAttribute ]]
    return (("SantaMerchant_%*"):format((string.gsub(v60, "%s", "_"))));
end;
local function _(v62, v63, v64) --[[ Line: 96 ]] --[[ Name: loadAnimation ]]
    local v65 = v62:LoadAnimation(v63);
    v64:Add(function() --[[ Line: 98 ]]
        -- upvalues: v65 (copy)
        v65:Stop(0);
        v65:Destroy();
    end);
    return v65;
end;
v59.Start = function(_) --[[ Line: 106 ]] --[[ Name: Start ]]
    -- upvalues: l_SantaMerchant_0 (copy), v58 (ref), v25 (copy), l_Close_0 (copy), v54 (copy), v41 (copy), v40 (copy), v13 (copy), v37 (copy), v42 (copy), v17 (copy), l_Brainrots_0 (copy), l_ReplicatedStorage_0 (copy), v30 (copy), v22 (copy), v34 (copy), v56 (copy), v27 (copy), v57 (copy), v29 (copy), l_Players_0 (copy), l_Txt_0 (copy), l_PlayerSelected_0 (copy), l_PlayerName_0 (copy), l_Headshot_0 (copy), l_GiftButton_0 (copy), v18 (copy), v16 (copy), v31 (copy), v23 (copy), v10 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy), v53 (copy), v14 (copy), v19 (copy), v55 (copy), v33 (copy)
    l_SantaMerchant_0.Visible = false;
    v58 = v25:Register("SantaMerchant", l_SantaMerchant_0, "TopQuint");
    v58:AttachCloseButton(l_Close_0);
    v58.OnOpen:Connect(function() --[[ Line: 111 ]]
        -- upvalues: v54 (ref)
        v54:FireServer("9f51d9ac-705a-4ef1-9970-faac46f91ac5", true);
    end);
    v58.OnClose:Connect(function() --[[ Line: 115 ]]
        -- upvalues: v54 (ref)
        v54:FireServer("9f51d9ac-705a-4ef1-9970-faac46f91ac5", false);
    end);
    v58:Close();
    local function v72(v68, v69) --[[ Line: 122 ]] --[[ Name: renderBrainrotAtFrame ]]
        -- upvalues: v41 (ref), v40 (ref), v13 (ref), v37 (ref)
        local v70 = v41[v69];
        if not v70 then
            return;
        else
            local v71 = v40[v70.Rarity];
            v68.Title.Text = v69;
            if v71.GradientPreset then
                v68.Title.TextColor3 = Color3.new(1, 1, 1);
                v13.apply(v68.Title, v71.GradientPreset);
            else
                v68.Title.TextColor3 = v71.Color;
            end;
            v68.Visible = true;
            v37:AttachOnViewportWithOptimizations(v69, v68.ViewportFrame);
            return;
        end;
    end;
    local v73 = table.create(#v42.Brainrots);
    local v74 = v17.new();
    for v75, v76 in v42.Brainrots do
        local l_Brainrot_0 = v76.Brainrot;
        local _ = v41[l_Brainrot_0];
        local v79 = l_Brainrots_0:FindFirstChild((tostring(v75))) or l_Brainrots_0.UIGridLayout.Template:Clone();
        v73[v75] = v79;
        v79.Visible = true;
        v79.LayoutOrder = v75;
        v72(v79, l_Brainrot_0);
        local function v83() --[[ Line: 161 ]] --[[ Name: updateStock ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), l_Brainrot_0 (copy), v79 (copy), v30 (ref)
            local l_l_ReplicatedStorage_0_0 = l_ReplicatedStorage_0;
            local l_l_Brainrot_0_0 = l_Brainrot_0;
            local v82 = l_l_ReplicatedStorage_0_0:GetAttribute((("SantaMerchant_%*"):format((string.gsub(l_l_Brainrot_0_0, "%s", "_"))))) or 0;
            v79.Quantity.Text = if v82 > 0 then ("%* Left"):format((v30:Comma(v82))) else "SOLD OUT";
            v79.Quantity.TextColor3 = if v82 > 0 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(255, 72, 72);
        end;
        v83();
        v74:Connect(v83);
        l_ReplicatedStorage_0:GetAttributeChangedSignal((("SantaMerchant_%*"):format((string.gsub(l_Brainrot_0, "%s", "_"))))):Connect(v83);
        v79.DropRate.Text = ("$%*/s"):format((v30:ToString(v37:GetGeneration(l_Brainrot_0))));
        v79.BuyYellow.Price.Text = v30:ToString(v76.Price or 0);
        if v76.ProductId then
            v79.Buy.Price.Text = "\238\128\130???";
            task.spawn(function() --[[ Line: 177 ]]
                -- upvalues: v30 (ref), v22 (ref), v76 (copy), v79 (copy)
                local function _(v84) --[[ Line: 178 ]] --[[ Name: formatPriceInRobux ]]
                    -- upvalues: v30 (ref)
                    if v84 == 999999999 then
                        return "???";
                    else
                        return (v30:Comma(v84));
                    end;
                end;
                local l_v22_ProductInfo_0 = v22:GetProductInfo(v76.ProductId, "Product");
                local l_Price_0 = v79.Buy.Price;
                local v88 = "\238\128\130%*";
                local v89 = l_v22_ProductInfo_0.PriceInRobux or 999999999;
                l_Price_0.Text = v88:format(v89 == 999999999 and "???" or v30:Comma(v89));
            end);
        end;
        v79.Parent = l_Brainrots_0;
        local v90 = v34.new(v79.BuyYellow);
        v90:Animate();
        v90.OnActivated:Connect(function() --[[ Line: 191 ]]
            -- upvalues: v56 (ref), v75 (copy), v27 (ref), v25 (ref)
            if v56:InvokeServer("d5b5b1be-1959-48bd-a27e-8725dabd12ee", v75) then
                v27:PlaySound("Sounds.Sfx.Success");
                v25:SetState("SantaMerchant", false);
            end;
        end);
        if v76.ProductId then
            local v91 = v34.new(v79.Buy);
            v91:Animate();
            v91.OnActivated:Connect(function() --[[ Line: 202 ]]
                -- upvalues: v57 (ref), v76 (copy), v29 (ref)
                v57:FireServer(v76.ProductId, v29:GetGiftingTarget());
            end);
        end;
    end;
    local function v98() --[[ Line: 208 ]] --[[ Name: updateGiftInfo ]]
        -- upvalues: v29 (ref), l_Players_0 (ref), l_Txt_0 (ref), l_PlayerSelected_0 (ref), l_PlayerName_0 (ref), l_Headshot_0 (ref), v73 (copy)
        local l_v29_GiftingTarget_0 = v29:GetGiftingTarget();
        if l_v29_GiftingTarget_0 then
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(l_v29_GiftingTarget_0);
            l_Txt_0.Text = "Back";
            l_PlayerSelected_0.Visible = true;
            l_PlayerName_0.Text = l_l_Players_0_PlayerByUserId_0 and "@" .. l_l_Players_0_PlayerByUserId_0.Name or l_v29_GiftingTarget_0;
            l_Headshot_0.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(l_v29_GiftingTarget_0);
            for _, v95 in v73 do
                v95.BuyYellow.Visible = false;
            end;
            return;
        else
            l_PlayerSelected_0.Visible = false;
            l_Txt_0.Text = "Gift Player";
            for _, v97 in v73 do
                v97.BuyYellow.Visible = true;
            end;
            return;
        end;
    end;
    v29.ToggleGiftSignal:Connect(v98);
    task.spawn(v98);
    local v99 = v34.new(l_GiftButton_0);
    v99:Animate();
    v99.OnActivated:Connect(function() --[[ Line: 236 ]]
        -- upvalues: v29 (ref)
        if v29:GetGiftingTarget() then
            v29:RemoveGiftingTarget();
            return;
        else
            v29:OpenGiftingScreen();
            return;
        end;
    end);
    v58.OnClose:Connect(function() --[[ Line: 244 ]]
        -- upvalues: v29 (ref)
        if v29:GetGiftingTarget() then
            v29:RemoveGiftingTarget();
        end;
    end);
    local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("SantaMerchantStockId");
    v18.Simple(1, function() --[[ Line: 287 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v16 (ref), v31 (ref), l_l_ReplicatedStorage_0_Attribute_0 (ref), v74 (copy), v23 (ref), l_SantaMerchant_0 (ref)
        local v101 = workspace:GetServerTimeNow() + (l_ReplicatedStorage_0:GetAttribute("__timeSkipDebugSantaMerchant") or 0);
        local v102 = "";
        local v103 = tonumber(l_ReplicatedStorage_0:GetAttribute("SantaMerchantNextStockId"));
        if v103 then
            local l_v16_Instant_0 = v16:GetInstant("SantaMerchantService/LeavingTimestamp", 1766790000);
            v102 = if v103 + 1 < v101 then ("Leaves in %*"):format((v31:E(l_v16_Instant_0 - v101))) else ("Restocking in %*"):format((v31:E(v103 - v101)));
        end;
        local l_workspace_FirstChild_0 = workspace:FindFirstChild("Santa Merchant");
        local l_l_ReplicatedStorage_0_Attribute_1 = l_ReplicatedStorage_0:GetAttribute("SantaMerchantStockId");
        if l_l_ReplicatedStorage_0_Attribute_0 ~= l_l_ReplicatedStorage_0_Attribute_1 then
            local l_l_l_ReplicatedStorage_0_Attribute_0_0 = l_l_ReplicatedStorage_0_Attribute_0;
            l_l_ReplicatedStorage_0_Attribute_0 = l_l_ReplicatedStorage_0_Attribute_1;
            v74:Fire();
            if l_l_l_ReplicatedStorage_0_Attribute_0_0 == nil or l_l_ReplicatedStorage_0_Attribute_0 == nil then

            end;
        end;
        l_SantaMerchant_0.Header.Title.Text = v102;
        if l_workspace_FirstChild_0 then
            l_workspace_FirstChild_0.Overhead.BillboardGui.Countdown.Text = v102;
        end;
    end);
    v10:WaitAndCall(l_LocalPlayer_0, function(v108) --[[ Line: 320 ]]
        -- upvalues: l_SantaMerchant_0 (ref), v30 (ref)
        local function v110() --[[ Line: 321 ]] --[[ Name: updateCurrency ]]
            -- upvalues: v108 (copy), l_SantaMerchant_0 (ref), v30 (ref)
            local v109 = v108:Get("ChristmasEvent.GoldElves") or 0;
            l_SantaMerchant_0.Header.Elves.Amount.Text = v30:Comma(v109);
        end;
        v108:OnChanged("ChristmasEvent.GoldElves", v110);
        task.spawn(v110);
    end);
    local function v116(v111, v112) --[[ Line: 330 ]] --[[ Name: playCharacterAnimation ]]
        -- upvalues: l_TweenService_0 (ref)
        local l_Character_0 = v111.Character;
        if not l_Character_0 then
            return;
        else
            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return;
            else
                local v115 = script.Reward:Clone();
                v115.Currency.Text = ("+%*"):format(v112);
                v115.Parent = l_HumanoidRootPart_0;
                l_TweenService_0:Create(v115, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    StudsOffset = Vector3.new(0, 2.5, 2.200000047683716, 0)
                }):Play();
                l_TweenService_0:Create(v115.ImageLabel, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(v115.Currency, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    TextTransparency = 1
                }):Play();
                l_TweenService_0:Create(v115.Currency.UIStroke, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                    Transparency = 1
                }):Play();
                task.delay(5, function() --[[ Line: 361 ]]
                    -- upvalues: v115 (copy)
                    v115:Destroy();
                end);
                return;
            end;
        end;
    end;
    v53.OnClientEvent:Connect(function(v117, v118) --[[ Line: 366 ]]
        -- upvalues: v27 (ref), l_ReplicatedStorage_0 (ref), v116 (copy)
        local v119 = script.Smoke:Clone();
        v119:PivotTo(v118);
        v119.Parent = workspace;
        v119.smoke1:Emit(5);
        task.spawn(function() --[[ Line: 373 ]]
            -- upvalues: v27 (ref), l_ReplicatedStorage_0 (ref), v118 (copy)
            v27:PlaySound(l_ReplicatedStorage_0.Sounds.Sfx.Puff2, v118.Position, false);
        end);
        task.delay(3, function() --[[ Line: 377 ]]
            -- upvalues: v119 (copy)
            v119:Destroy();
        end);
        v116(v117, 1);
    end);
    v14.observeTag("SantaMerchantNPC", function(v120) --[[ Line: 384 ]]
        -- upvalues: v19 (ref)
        local v121 = v19.new();
        local v122 = v120.Humanoid.Animator:LoadAnimation(script.Idle);
        v121:Add(function() --[[ Line: 98 ]]
            -- upvalues: v122 (copy)
            v122:Stop(0);
            v122:Destroy();
        end);
        local l_v122_0 = v122;
        l_v122_0.Priority = Enum.AnimationPriority.Idle;
        l_v122_0.Looped = true;
        l_v122_0:Play();
        return v121:WrapClean();
    end, {
        workspace
    });
    v55.OnClientEvent:Connect(function(_, v125) --[[ Line: 396 ]]
        -- upvalues: v27 (ref), l_ReplicatedStorage_0 (ref), v33 (ref)
        local l_workspace_FirstChild_1 = workspace:FindFirstChild("Santa Merchant");
        if not l_workspace_FirstChild_1 then
            return;
        else
            local v127 = l_workspace_FirstChild_1.VFX:FindFirstChild(v125) or script.VFX["1"];
            if not v127 then
                return;
            else
                task.spawn(function() --[[ Line: 407 ]]
                    -- upvalues: v27 (ref), l_ReplicatedStorage_0 (ref), l_workspace_FirstChild_1 (copy)
                    v27:PlaySound(l_ReplicatedStorage_0.Sounds.Sfx.SantaMerchantSFX, l_workspace_FirstChild_1.SpawnPart.Position, false);
                end);
                v33.emit(v127);
                return;
            end;
        end;
    end);
    v14.observeTag("SantaMerchantPrompt", function(v128) --[[ Line: 414 ]]
        -- upvalues: v19 (ref), v10 (ref), l_LocalPlayer_0 (ref), v18 (ref), v25 (ref)
        local v129 = v19.new();
        local function v130() --[[ Line: 417 ]] --[[ Name: updatePrompt ]]
            -- upvalues: v10 (ref), l_LocalPlayer_0 (ref), v128 (copy)
            if not v10:Wait(l_LocalPlayer_0) then
                return;
            else
                v128.ObjectText = "Santa's Shop";
                v128.ActionText = "View";
                return;
            end;
        end;
        v129:Add(task.spawn(function() --[[ Line: 427 ]]
            -- upvalues: v10 (ref), l_LocalPlayer_0 (ref), v129 (copy), v18 (ref), v130 (copy)
            if not v10:Wait(l_LocalPlayer_0) then
                return;
            else
                v129:Add(v18.Simple(1, v130));
                task.spawn(v130);
                return;
            end;
        end));
        v129:Add(v128.Triggered:Connect(function() --[[ Line: 437 ]]
            -- upvalues: v10 (ref), l_LocalPlayer_0 (ref), v25 (ref)
            if not v10:Get(l_LocalPlayer_0) then
                return;
            else
                v25:Toggle("SantaMerchant");
                return;
            end;
        end));
        return function() --[[ Line: 446 ]]
            -- upvalues: v129 (copy)
            v129:Destroy();
        end;
    end);
end;
return v59;