local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v9 = require(l_Packages_0.Net);
local v10 = require(l_Controllers_0.InterfaceController);
local _ = require(l_Controllers_0.CameraController);
local v12 = require(l_Classes_0.AnimatedButton);
local v13 = require(l_Packages_0.Synchronizer);
local v14 = require(l_Utils_0.NumberUtils);
local v15 = require(l_Datas_0.Rebirth);
local v16 = require(l_Controllers_0.NotificationController);
local v17 = require(l_Controllers_0.AnimalController);
local v18 = require(l_Shared_0.Animals);
local v19 = require(l_Datas_0.Animals);
local v20 = require(l_Datas_0.Rarities);
local v21 = require(l_Datas_0.ShopItems);
local v22 = require(l_Shared_0.Updates);
local v23 = require(l_ReplicatedStorage_0.Shared.GetRebirthCost);
local v24 = v9:RemoteFunction("Rebirth/RequestRebirth");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Rebirth_0 = l_PlayerGui_0:WaitForChild("Rebirth"):WaitForChild("Rebirth");
local l_Close_0 = l_Rebirth_0.Header.Close;
local l_Content_0 = l_Rebirth_0.Content;
local l_HolderImage_0 = l_Content_0.Holder.HolderImage;
local l_Bar_0 = l_HolderImage_0.Loader.Bar;
local l_Progress_0 = l_Bar_0.Progress;
local l_ProgressText_0 = l_Bar_0.ProgressText;
local l_Rebirth_1 = l_Content_0.Rebirth;
local l_RequiredCharacters_0 = l_HolderImage_0.RequiredCharacters;
local l_Template_0 = l_RequiredCharacters_0.Template;
local l_Items_0 = l_Content_0.Unlockable.Items;
local l_Template_1 = l_Items_0.Template;
local l_Warning_0 = l_PlayerGui_0:WaitForChild("LeftCenter").LeftCenter.Buttons.Rebirth.Warning;
local v40 = nil;
local v41 = {};
local function v49(v42, v43, v44) --[[ Line: 69 ]] --[[ Name: createLine ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundColor3 = v43 or Color3.new(1, 1, 1);
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.Size = UDim2.fromScale(1, 1);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.ZIndex = v42.ZIndex + 4;
    l_Frame_0.Position = UDim2.fromScale(0.5, 0.5);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = v44 or UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Rotation = 45;
    l_UIGradient_0.Offset = Vector2.new(-1.1, 0);
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.4, 1), 
        NumberSequenceKeypoint.new(0.5, 0), 
        NumberSequenceKeypoint.new(0.6, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Parent = l_Frame_0;
    l_Frame_0.Parent = v42;
    local v48 = l_TweenService_0:Create(l_UIGradient_0, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 2), {
        Offset = Vector2.new(1.1, 0)
    });
    v48:Play();
    v42.Destroying:Connect(function() --[[ Line: 106 ]]
        -- upvalues: v48 (copy), l_Frame_0 (copy)
        v48:Cancel();
        l_Frame_0:Destroy();
        v48:Destroy();
    end);
end;
local function v67(v50) --[[ Line: 113 ]] --[[ Name: CreateUnlockableItems ]]
    -- upvalues: v15 (copy), l_Items_0 (copy), l_Template_1 (copy), v21 (copy), v49 (copy), v14 (copy)
    local v51 = #v15;
    local v52 = v50 + 1;
    if #l_Items_0:GetChildren() >= 1 then
        for _, v54 in ipairs(l_Items_0:GetChildren()) do
            if v54.Name ~= "Template" and v54:IsA("ImageLabel") then
                v54:Destroy();
            end;
        end;
    end;
    if v51 < v52 then
        return 0;
    elseif v15[v52].IsEnabled and not v15[v52].IsEnabled() and v51 - 1 < v52 then
        return 0;
    else
        local l_Rewards_0 = v15[v52].Rewards;
        for v56, v57 in pairs(l_Rewards_0) do
            if v56 == "Items" and typeof(v57) == "table" then
                for _, v59 in ipairs(v57) do
                    local v60 = l_Template_1:Clone();
                    local l_ItemName_0 = v60.ItemName;
                    local l_ItemImage_0 = v60.ItemImage;
                    l_ItemName_0.Text = string.upper(v59);
                    v60.Name = v59;
                    l_ItemImage_0.Image = v21[v59] and v21[v59].Icon or "";
                    v60.ClipsDescendants = true;
                    v60.LayoutOrder = 10;
                    v60.Visible = true;
                    v60.Parent = l_Items_0;
                    v49(v60);
                end;
            else
                local v63 = l_Template_1:Clone();
                v63.Name = v56;
                local l_ItemName_1 = v63.ItemName;
                local l_ItemValue_0 = v63.ItemValue;
                local l_ItemImage_1 = v63.ItemImage;
                v63.ClipsDescendants = true;
                l_ItemValue_0.Visible = true;
                if v56 == "Cash" then
                    l_ItemName_1.Text = "CASH";
                    l_ItemValue_0.Text = "$" .. v14:ToString(v57, 2);
                    l_ItemImage_1.Image = "rbxassetid://70626497369321";
                    l_ItemImage_1.ImageTransparency = 0.2;
                    v63.LayoutOrder = 2;
                elseif v56 == "Multiplier" then
                    l_ItemName_1.Text = "MULTI";
                    l_ItemValue_0.Text = "x" .. v57;
                    l_ItemImage_1.Image = "rbxassetid://70626497369321";
                    l_ItemImage_1.ImageTransparency = 0.2;
                    v63.LayoutOrder = 1;
                elseif v56 == "AdditionalLockTime" then
                    l_ItemName_1.Text = "LOCK BASE";
                    l_ItemValue_0.Text = "+10 Sec";
                    l_ItemImage_1.Image = "rbxassetid://123877736890165";
                    l_ItemImage_1.Position = UDim2.fromScale(0.5, 0.5);
                    l_ItemImage_1.ImageTransparency = 0.2;
                    v63.LayoutOrder = 3;
                elseif v56 == "FriendController" then
                    l_ItemName_1.Text = "Friend Controller";
                    l_ItemValue_0.Text = "Unlock";
                    l_ItemImage_1.Image = "rbxassetid://96730132757867";
                    l_ItemImage_1.ImageTransparency = 0.2;
                    v63.LayoutOrder = 4;
                elseif v56 == "AnimalSlot" then
                    l_ItemName_1.Text = "Slot";
                    l_ItemValue_0.Text = "+" .. v57;
                    l_ItemImage_1.Image = "rbxassetid://85000857078190";
                    l_ItemImage_1.ImageTransparency = 0.2;
                    v63.LayoutOrder = 4;
                end;
                v49(v63);
                v63.Visible = true;
                v63.Parent = l_Items_0;
            end;
        end;
        return;
    end;
end;
local function v79(v68) --[[ Line: 212 ]] --[[ Name: CreateViewportCharacters ]]
    -- upvalues: v15 (copy), l_RequiredCharacters_0 (copy), l_Template_0 (copy), v20 (copy), v19 (copy), v17 (copy), v18 (copy)
    local v69 = #v15;
    local v70 = v68 + 1;
    if #l_RequiredCharacters_0:GetChildren() >= 1 then
        for _, v72 in ipairs(l_RequiredCharacters_0:GetChildren()) do
            if v72.Name ~= "Template" and v72:IsA("ImageLabel") then
                v72:Destroy();
            end;
        end;
    end;
    if v69 < v70 then
        return 0;
    elseif v15[v70].IsEnabled and not v15[v70].IsEnabled() and v69 - 1 < v70 then
        return 0;
    else
        local l_RequiredCharacters_1 = v15[v70].Requirements.RequiredCharacters;
        local v74 = 0;
        if #l_RequiredCharacters_1 >= 1 then
            for v75, v76 in ipairs(l_RequiredCharacters_1) do
                local v77 = l_Template_0:Clone();
                v77.Name = v76 .. v75;
                v77.Visible = true;
                local l_Color_0 = v20[v19[v76].Rarity].Color;
                v77.CharacterName.Text = v76;
                v77.UIGradient.Color = v17:HasAnimal(v76) and ColorSequence.new(l_Color_0) or ColorSequence.new(Color3.new(0.223529, 0.196078, 0.215686));
                v74 = v74 + (v17:HasAnimal(v76) and 1 or 0);
                v77.CheckImage.Visible = v17:HasAnimal(v76) and true or false;
                v77.Parent = l_RequiredCharacters_0;
                v77.ViewportFrame.ImageColor3 = v17:HasAnimal(v76) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0);
                v18:AttachOnViewport(v76, v77.ViewportFrame, true);
            end;
        end;
        return v74;
    end;
end;
local function v85(v80, v81) --[[ Line: 267 ]] --[[ Name: UpdateRebirthButton ]]
    -- upvalues: v13 (copy), l_LocalPlayer_0 (copy), v15 (copy), l_Rebirth_1 (copy), v23 (copy), l_Warning_0 (copy)
    local v82 = v13:Get(l_LocalPlayer_0):Get("Coins");
    local v83 = #v15;
    local v84 = v80 + 1;
    if v83 < v84 then
        l_Rebirth_1.ImageColor3 = Color3.fromRGB(138, 138, 138);
        return;
    elseif v15[v84].IsEnabled and not v15[v84].IsEnabled() and v83 - 1 < v84 then
        l_Rebirth_1.ImageColor3 = Color3.fromRGB(138, 138, 138);
        return;
    elseif v23(l_LocalPlayer_0, v84) <= v82 and v81 == #v15[v84].Requirements.RequiredCharacters then
        l_Rebirth_1.ImageColor3 = Color3.fromRGB(255, 255, 255);
        l_Warning_0.Visible = true;
        return;
    else
        l_Rebirth_1.ImageColor3 = Color3.fromRGB(138, 138, 138);
        l_Warning_0.Visible = false;
        return;
    end;
end;
v41.Start = function(_) --[[ Line: 299 ]] --[[ Name: Start ]]
    -- upvalues: v40 (ref), v10 (copy), l_Rebirth_0 (copy), l_Close_0 (copy), l_Warning_0 (copy), v12 (copy), l_Rebirth_1 (copy), v24 (copy), v16 (copy), v13 (copy), l_LocalPlayer_0 (copy), v67 (copy), v79 (copy), v85 (copy), v15 (copy), l_Progress_0 (copy), l_ProgressText_0 (copy), v23 (copy), v14 (copy), v22 (copy)
    local v87 = 0;
    local v88 = 0;
    local v89 = 0;
    v40 = v10:Register("Rebirth", l_Rebirth_0, "TopQuint");
    v40:AttachCloseButton(l_Close_0);
    v40:Close();
    v40.OnOpen:Connect(function() --[[ Line: 310 ]]
        -- upvalues: l_Warning_0 (ref)
        if l_Warning_0.Visible then
            l_Warning_0.Visible = false;
        end;
    end);
    local v90 = v12.new(l_Rebirth_1);
    v90:Animate();
    v90.OnActivated:Connect(function() --[[ Line: 318 ]]
        -- upvalues: v24 (ref), v16 (ref)
        local v91, v92 = v24:InvokeServer();
        if v91 then
            v16:Success(v92);
            return;
        else
            v16:Error(v92);
            return;
        end;
    end);
    v13:WaitAndCall(l_LocalPlayer_0, function(v93) --[[ Line: 327 ]]
        -- upvalues: v87 (ref), v67 (ref), v79 (ref), v88 (ref), v85 (ref), v15 (ref), l_Progress_0 (ref), l_ProgressText_0 (ref), v23 (ref), l_LocalPlayer_0 (ref), v89 (ref), v14 (ref), v22 (ref)
        v93:OnChanged("Rebirth", function(v94, _) --[[ Line: 329 ]]
            -- upvalues: v87 (ref), v67 (ref), v79 (ref)
            v87 = v94;
            v67(v87);
            v79(v87);
        end, true);
        v93:OnChanged("AnimalAddedOrRemoved", function() --[[ Line: 335 ]]
            -- upvalues: v88 (ref), v79 (ref), v87 (ref), v85 (ref)
            v88 = v79(v87);
            v85(v87, v88);
        end, true);
        local function v101() --[[ Line: 341 ]] --[[ Name: TextUpdates ]]
            -- upvalues: v15 (ref), v87 (ref), v85 (ref), v88 (ref), l_Progress_0 (ref), l_ProgressText_0 (ref), v23 (ref), l_LocalPlayer_0 (ref), v89 (ref), v14 (ref)
            local v96 = #v15;
            local v97 = v87 + 1;
            if v97 <= v96 and v15[v97].IsEnabled and not v15[v97].IsEnabled() then
                v96 = v96 - 1;
            end;
            v85(v87, v88);
            if v96 < v97 then
                l_Progress_0.Size = UDim2.new(1, 0, 1, 0);
                l_Progress_0.BackgroundColor3 = Color3.new(0.490196, 0.941176, 0.439216);
                l_ProgressText_0.Text = "Completed!";
                return;
            else
                local v98 = v23(l_LocalPlayer_0, v97);
                l_Progress_0.Size = UDim2.new(math.clamp(v89 / v98, 0, 1), 0, 1, 0);
                local v99 = v98 <= v89;
                local v100 = v14:ToString(v98, 2);
                l_ProgressText_0.Text = "$ " .. (if v99 then v100 else v14:ToString((math.clamp(v89, 0, v98)))) .. " / " .. "$ " .. v100;
                l_Progress_0.BackgroundColor3 = v99 and Color3.new(0.490196, 0.941176, 0.439216) or Color3.new(0.941176, 0.729412, 0.482353);
                return;
            end;
        end;
        v93:OnChanged("Coins", function(v102, _) --[[ Line: 369 ]]
            -- upvalues: v89 (ref), v101 (copy)
            v89 = v102;
            v101();
        end, true);
        local function v104() --[[ Line: 375 ]] --[[ Name: Update ]]
            -- upvalues: v67 (ref), v87 (ref), v79 (ref), v101 (copy)
            v67(v87);
            v79(v87);
            v101();
        end;
        v22.OnUpdateEnabled:Connect(v104);
        v22.OnUpdateDisabled:Connect(v104);
        task.spawn(v104);
    end);
end;
return v41;