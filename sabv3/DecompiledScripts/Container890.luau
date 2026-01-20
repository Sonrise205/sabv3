local v0 = false;
local v1 = 0;
return function(v2) --[[ Line: 3 ]]
    -- upvalues: v0 (ref), v1 (ref)
    local l_GuiService_0 = game:GetService("GuiService");
    local l_Players_0 = game:GetService("Players");
    local v5 = {};
    local v6 = require(script.Parent.Parent.Packages.GoodSignal).new();
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    local v8 = 0;
    local v9 = 0;
    local v10 = 0;
    local v11 = 0;
    local function v12(v13) --[[ Line: 17 ]] --[[ Name: checkInset ]]
        -- upvalues: l_GuiService_0 (copy), v2 (copy), v11 (ref), v12 (copy), l_Players_0 (copy), v0 (ref), l_l_GuiService_0_GuiInset_0 (ref), v8 (ref), v9 (ref), v10 (ref), v6 (copy), v1 (ref)
        local l_Height_0 = l_GuiService_0.TopbarInset.Height;
        local v15 = l_Height_0 <= 36;
        local v16 = l_GuiService_0:IsTenFootInterface();
        v2.isOldTopbar = v15;
        v11 = v11 + 1;
        if l_Height_0 == 0 and v13 == nil then
            task.defer(function() --[[ Line: 28 ]]
                -- upvalues: v12 (ref)
                task.wait(8);
                v12("ForceConvertToOld");
            end);
        elseif v11 == 1 then
            task.delay(5, function() --[[ Line: 33 ]]
                -- upvalues: l_Players_0 (ref), v11 (ref), v12 (ref)
                l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
                if v11 == 1 then
                    v12();
                end;
            end);
        end;
        if v2.isOldTopbar and not v16 and v0 == false and (l_Height_0 ~= 0 or v13 == "ForceConvertToOld") then
            v0 = true;
            task.defer(function() --[[ Line: 45 ]]
                -- upvalues: v2 (ref), l_GuiService_0 (ref)
                local l_Themes_0 = script.Parent.Parent.Features.Themes;
                local v18 = require(l_Themes_0.Classic);
                v2.modifyBaseTheme(v18);
                local function v19() --[[ Line: 52 ]] --[[ Name: decideToHideTopbar ]]
                    -- upvalues: l_GuiService_0 (ref), v2 (ref)
                    if l_GuiService_0.MenuIsOpen then
                        v2.setTopbarEnabled(false, true);
                        return;
                    else
                        v2.setTopbarEnabled();
                        return;
                    end;
                end;
                l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v19);
                if l_GuiService_0.MenuIsOpen then
                    v2.setTopbarEnabled(false, true);
                    return;
                else
                    v2.setTopbarEnabled();
                    return;
                end;
            end);
        end;
        l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
        v8 = v15 and 12 or l_l_GuiService_0_GuiInset_0.Y - 50;
        v9 = v15 and 2 or 0;
        v10 = -2;
        if v16 then
            v8 = 10;
            v9 = -9;
        end;
        if l_GuiService_0.TopbarInset.Height == 0 and not v0 then
            v9 = v9 + 13;
            v10 = 50;
        end;
        v6:Fire(l_l_GuiService_0_GuiInset_0);
        local l_Y_0 = l_l_GuiService_0_GuiInset_0.Y;
        if l_Y_0 ~= v1 then
            v1 = l_Y_0;
            task.defer(function() --[[ Line: 83 ]]
                -- upvalues: v2 (ref), l_Y_0 (copy)
                v2.insetHeightChanged:Fire(l_Y_0);
            end);
        end;
    end;
    l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v12);
    v12("FirstTime");
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    v6:Connect(function() --[[ Line: 93 ]]
        -- upvalues: l_ScreenGui_0 (copy), v8 (ref)
        l_ScreenGui_0:SetAttribute("StartInset", v8);
    end);
    l_ScreenGui_0.Name = "TopbarStandard";
    l_ScreenGui_0.Enabled = true;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets;
    v5[l_ScreenGui_0.Name] = l_ScreenGui_0;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 103 ]]
        -- upvalues: l_ScreenGui_0 (copy), v2 (copy)
        l_ScreenGui_0.DisplayOrder = v2.baseDisplayOrder;
    end);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Holders";
    l_Frame_0.BackgroundTransparency = 1;
    v6:Connect(function() --[[ Line: 110 ]]
        -- upvalues: l_Frame_0 (copy), v9 (ref), v10 (ref)
        l_Frame_0.Position = UDim2.new(0, 0, 0, v9);
        l_Frame_0.Size = UDim2.new(1, 0, 1, v10);
    end);
    l_Frame_0.Visible = true;
    l_Frame_0.ZIndex = 1;
    l_Frame_0.Parent = l_ScreenGui_0;
    local v23 = l_ScreenGui_0:Clone();
    local l_Holders_0 = v23.Holders;
    local function v25() --[[ Line: 120 ]] --[[ Name: updateCenteredHoldersHeight ]]
        -- upvalues: l_Holders_0 (copy), l_GuiService_0 (copy), v10 (ref)
        l_Holders_0.Size = UDim2.new(1, 0, 0, l_GuiService_0.TopbarInset.Height + v10);
    end;
    v23.Name = "TopbarCentered";
    v23.ScreenInsets = Enum.ScreenInsets.None;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 125 ]]
        -- upvalues: v23 (copy), v2 (copy)
        v23.DisplayOrder = v2.baseDisplayOrder;
    end);
    v5[v23.Name] = v23;
    v6:Connect(v25);
    l_Holders_0.Size = UDim2.new(1, 0, 0, l_GuiService_0.TopbarInset.Height + v10);
    local v26 = l_ScreenGui_0:Clone();
    v26.Name = v26.Name .. "Clipped";
    v26.DisplayOrder = v26.DisplayOrder + 1;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 136 ]]
        -- upvalues: v26 (copy), v2 (copy)
        v26.DisplayOrder = v2.baseDisplayOrder + 1;
    end);
    v5[v26.Name] = v26;
    local v27 = v23:Clone();
    v27.Name = v27.Name .. "Clipped";
    v27.DisplayOrder = v27.DisplayOrder + 1;
    v2.baseDisplayOrderChanged:Connect(function() --[[ Line: 144 ]]
        -- upvalues: v27 (copy), v2 (copy)
        v27.DisplayOrder = v2.baseDisplayOrder + 1;
    end);
    v5[v27.Name] = v27;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0:SetAttribute("IsAHolder", true);
    l_ScrollingFrame_0.Name = "Left";
    v6:Connect(function() --[[ Line: 153 ]]
        -- upvalues: l_ScrollingFrame_0 (copy), v8 (ref)
        l_ScrollingFrame_0.Position = UDim2.fromOffset(v8, 0);
    end);
    l_ScrollingFrame_0.Size = UDim2.new(1, -24, 1, 0);
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.ZIndex = 1;
    l_ScrollingFrame_0.Active = false;
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.HorizontalScrollBarInset = Enum.ScrollBarInset.None;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 1, -1);
    l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.X;
    l_ScrollingFrame_0.ScrollingDirection = Enum.ScrollingDirection.X;
    l_ScrollingFrame_0.ScrollBarThickness = 0;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.ScrollingEnabled = false;
    l_ScrollingFrame_0.ElasticBehavior = Enum.ElasticBehavior.Never;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    v6:Connect(function() --[[ Line: 174 ]]
        -- upvalues: l_UIListLayout_0 (copy), v8 (ref)
        l_UIListLayout_0.Padding = UDim.new(0, v8);
    end);
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Bottom;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Left;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    local v30 = l_ScrollingFrame_0:Clone();
    v6:Connect(function() --[[ Line: 184 ]]
        -- upvalues: v30 (copy), v8 (ref)
        v30.UIListLayout.Padding = UDim.new(0, v8);
    end);
    v30.ScrollingEnabled = false;
    v30.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v30.Name = "Center";
    v30.Parent = l_Holders_0;
    local v31 = l_ScrollingFrame_0:Clone();
    v6:Connect(function() --[[ Line: 193 ]]
        -- upvalues: v31 (copy), v8 (ref)
        v31.UIListLayout.Padding = UDim.new(0, v8);
    end);
    v31.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right;
    v31.Name = "Right";
    v31.AnchorPoint = Vector2.new(1, 0);
    v31.Position = UDim2.new(1, -12, 0, 0);
    v31.Parent = l_Frame_0;
    v6:Fire(l_l_GuiService_0_GuiInset_0);
    return v5;
end;