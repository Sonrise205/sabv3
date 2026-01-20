local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Parent.Features.Themes);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), l_TweenService_0 (copy), l_RunService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Dropdown";
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.X;
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 10);
    l_Frame_0.ZIndex = -2;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Parent = v3.widget;
    local l_GuiService_0 = game:GetService("GuiService");
    v3:setBehaviour("Dropdown", "BackgroundTransparency", function(v6) --[[ Line: 20 ]]
        -- upvalues: l_GuiService_0 (copy)
        local v7 = v6 * l_GuiService_0.PreferredTransparency;
        if v6 == 1 then
            return v6;
        else
            return v7;
        end;
    end);
    v3.janitor:add(l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 28 ]]
        -- upvalues: v3 (copy), l_Frame_0 (copy)
        v3:refreshAppearance(l_Frame_0, "BackgroundTransparency");
    end));
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "DropdownCorner";
    l_UICorner_0.CornerRadius = UDim.new(0, 10);
    l_UICorner_0.Parent = l_Frame_0;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "DropdownScroller";
    l_ScrollingFrame_0.AutomaticSize = Enum.AutomaticSize.X;
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.AnchorPoint = Vector2.new(0, 0);
    l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.ZIndex = -1;
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.None;
    l_ScrollingFrame_0.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right;
    l_ScrollingFrame_0.Active = false;
    l_ScrollingFrame_0.ScrollingEnabled = true;
    l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
    l_ScrollingFrame_0.ScrollBarThickness = 5;
    l_ScrollingFrame_0.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
    l_ScrollingFrame_0.ScrollBarImageTransparency = 0.8;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.Active = true;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "DropdownSpeed";
    l_NumberValue_0.Value = 0.07;
    l_NumberValue_0.Parent = l_Frame_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Name = "DropdownPadding";
    l_UIPadding_0.PaddingTop = UDim.new(0, 0);
    l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
    l_UIPadding_0.Parent = l_ScrollingFrame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Name = "DropdownList";
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Vertical;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_0.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    local l_dropdownJanitor_0 = v3.dropdownJanitor;
    local v14 = require(v3.iconModule);
    v3.dropdownChildAdded:Connect(function(v15) --[[ Line: 81 ]]
        local _, v17 = v15:modifyTheme({
            {
                "Widget", 
                "BorderSize", 
                0
            }, 
            {
                "IconCorners", 
                "CornerRadius", 
                UDim.new(0, 10)
            }, 
            {
                "Widget", 
                "MinimumWidth", 
                190
            }, 
            {
                "Widget", 
                "MinimumHeight", 
                58
            }, 
            {
                "IconLabel", 
                "TextSize", 
                20
            }, 
            {
                "IconOverlay", 
                "Size", 
                UDim2.new(1, 0, 1, 0)
            }, 
            {
                "PaddingLeft", 
                "Size", 
                UDim2.fromOffset(25, 0)
            }, 
            {
                "Notice", 
                "Position", 
                UDim2.new(1, -24, 0, 5)
            }, 
            {
                "ContentsList", 
                "HorizontalAlignment", 
                Enum.HorizontalAlignment.Left
            }, 
            {
                "Selection", 
                "Size", 
                UDim2.new(1, -0, 1, -0)
            }, 
            {
                "Selection", 
                "Position", 
                UDim2.new(0, 0, 0, 0)
            }
        });
        task.defer(function() --[[ Line: 95 ]]
            -- upvalues: v15 (copy), v17 (copy)
            v15.joinJanitor:add(function() --[[ Line: 96 ]]
                -- upvalues: v15 (ref), v17 (ref)
                v15:removeModification(v17);
            end);
        end);
    end);
    v3.dropdownSet:Connect(function(v18) --[[ Line: 101 ]]
        -- upvalues: v3 (copy), v14 (copy)
        for _, v20 in pairs(v3.dropdownIcons) do
            v14.getIconByUID(v20):destroy();
        end;
        if type(v18) == "table" then
            for _, v22 in pairs(v18) do
                v22:joinDropdown(v3);
            end;
        end;
    end);
    local function v35() --[[ Line: 113 ]] --[[ Name: updateMaxIcons ]]
        -- upvalues: l_Frame_0 (copy), l_ScrollingFrame_0 (copy), l_UIPadding_0 (copy)
        local l_l_Frame_0_Attribute_0 = l_Frame_0:GetAttribute("MaxIcons");
        if not l_l_Frame_0_Attribute_0 then
            return 0;
        else
            local v24 = {};
            for _, v26 in pairs(l_ScrollingFrame_0:GetChildren()) do
                if v26:IsA("GuiObject") and v26.Visible then
                    table.insert(v24, v26);
                end;
            end;
            table.sort(v24, function(v27, v28) --[[ Line: 124 ]]
                return v27.AbsolutePosition.Y < v28.AbsolutePosition.Y;
            end);
            local v29 = 0;
            local v30 = math.ceil(l_l_Frame_0_Attribute_0);
            for v31 = 1, v30 do
                local v32 = v24[v31];
                if v32 then
                    local l_Y_0 = v32.AbsoluteSize.Y;
                    local v34 = false;
                    if v31 == v30 then
                        v34 = v30 ~= l_l_Frame_0_Attribute_0;
                    end;
                    if v34 then
                        l_Y_0 = l_Y_0 * (l_l_Frame_0_Attribute_0 - v30 + 1);
                    end;
                    v29 = v29 + l_Y_0;
                else
                    break;
                end;
            end;
            return v29 + (l_UIPadding_0.PaddingTop.Offset + l_UIPadding_0.PaddingBottom.Offset);
        end;
    end;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local function _() --[[ Line: 145 ]] --[[ Name: getTweenInfo ]]
        -- upvalues: v2 (ref), l_Frame_0 (copy), v38 (ref), v39 (ref), l_NumberValue_0 (copy)
        local v40 = v2.getInstanceValue(l_Frame_0, "MaxIcons") or 1;
        if v38 and v38 == v40 and v39 then
            return v39;
        else
            local v41 = TweenInfo.new(l_NumberValue_0.Value * v40, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v39 = v41;
            v38 = v40;
            return v41;
        end;
    end;
    local function v46() --[[ Line: 159 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v2 (ref), l_Frame_0 (copy), v38 (ref), v39 (ref), l_NumberValue_0 (copy), v36 (ref), v37 (ref), v3 (copy), v35 (copy), l_TweenService_0 (ref)
        local v43 = v2.getInstanceValue(l_Frame_0, "MaxIcons") or 1;
        local v44;
        if v38 and v38 == v43 and v39 then
            v44 = v39;
        else
            local v45 = TweenInfo.new(l_NumberValue_0.Value * v43, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v39 = v45;
            v38 = v43;
            v44 = v45;
        end;
        if v36 then
            v36:Cancel();
            v36 = nil;
        end;
        if v37 then
            v37:Cancel();
            v37 = nil;
        end;
        if v3.isSelected then
            v43 = v35();
            l_Frame_0.Visible = true;
            l_Frame_0.BackgroundTransparency = 0;
            l_Frame_0.Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, 0);
            v36 = l_TweenService_0:Create(l_Frame_0, v44, {
                Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, v43)
            });
            v36:Play();
            v36.Completed:Connect(function() --[[ Line: 180 ]]
                -- upvalues: v36 (ref)
                v36 = nil;
            end);
            return;
        else
            v43 = TweenInfo.new(0);
            v37 = l_TweenService_0:Create(l_Frame_0, v43, {
                Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, 0)
            });
            v37:Play();
            v37.Completed:Connect(function() --[[ Line: 187 ]]
                -- upvalues: v37 (ref)
                v37 = nil;
            end);
            return;
        end;
    end;
    l_dropdownJanitor_0:add(v3.toggled:Connect(v46));
    v46();
    local function v50() --[[ Line: 197 ]] --[[ Name: updateChildSize ]]
        -- upvalues: v2 (ref), l_Frame_0 (copy), v38 (ref), v39 (ref), l_NumberValue_0 (copy), v3 (copy), v36 (ref), v37 (ref), l_RunService_0 (ref), v35 (copy), l_TweenService_0 (ref)
        local v47 = v2.getInstanceValue(l_Frame_0, "MaxIcons") or 1;
        local v48;
        if v38 and v38 == v47 and v39 then
            v48 = v39;
        else
            local v49 = TweenInfo.new(l_NumberValue_0.Value * v47, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v39 = v49;
            v38 = v47;
            v48 = v49;
        end;
        if not v3.isSelected then
            return;
        else
            if v36 then
                v36:Cancel();
                v36 = nil;
            end;
            if v37 then
                v37:Cancel();
                v37 = nil;
            end;
            l_RunService_0.Heartbeat:Wait();
            v47 = v35();
            v36 = l_TweenService_0:Create(l_Frame_0, v48, {
                Size = UDim2.new(0, l_Frame_0.Size.X.Offset, 0, v47)
            });
            v36:Play();
            v36.Completed:Connect(function() --[[ Line: 215 ]]
                -- upvalues: v36 (ref)
                v36 = nil;
            end);
            return;
        end;
    end;
    l_dropdownJanitor_0:add(v3.toggled:Connect(v46));
    local v51 = 0;
    local v52 = false;
    local function v53() --[[ Line: 228 ]] --[[ Name: updateMaxIconsListener ]]
        -- upvalues: v51 (ref), v52 (ref), v53 (copy), l_Frame_0 (copy), l_ScrollingFrame_0 (copy), v14 (copy), v3 (copy), l_UIPadding_0 (copy)
        v51 = v51 + 1;
        if v52 then
            return;
        else
            local l_v51_0 = v51;
            v52 = true;
            task.defer(function() --[[ Line: 233 ]]
                -- upvalues: v52 (ref), v51 (ref), l_v51_0 (copy), v53 (ref)
                v52 = false;
                if v51 ~= l_v51_0 then
                    v53();
                end;
            end);
            local l_l_Frame_0_Attribute_1 = l_Frame_0:GetAttribute("MaxIcons");
            if not l_l_Frame_0_Attribute_1 then
                return;
            else
                local v56 = {};
                for _, v58 in pairs(l_ScrollingFrame_0:GetChildren()) do
                    if v58:IsA("GuiObject") and v58.Visible then
                        table.insert(v56, {
                            v58, 
                            v58.AbsolutePosition.Y
                        });
                    end;
                end;
                table.sort(v56, function(v59, v60) --[[ Line: 248 ]]
                    return v59[2] < v60[2];
                end);
                local v61 = 0;
                local v62 = false;
                local v63 = math.ceil(l_l_Frame_0_Attribute_1);
                for v64 = 1, v63 do
                    local v65 = v56[v64];
                    if v65 then
                        local v66 = v65[1];
                        local l_Y_1 = v66.AbsoluteSize.Y;
                        local v68 = false;
                        if v64 == v63 then
                            v68 = v63 ~= l_l_Frame_0_Attribute_1;
                        end;
                        if v68 then
                            l_Y_1 = l_Y_1 * (l_l_Frame_0_Attribute_1 - v63 + 1);
                        end;
                        v61 = v61 + l_Y_1;
                        if not v68 then
                            local l_v66_Attribute_0 = v66:GetAttribute("WidgetUID");
                            local v70 = l_v66_Attribute_0 and v14.getIconByUID(l_v66_Attribute_0);
                            if v70 then
                                local v71 = nil;
                                if not v62 then
                                    v62 = true;
                                    v71 = v3:getInstance("ClickRegion");
                                end;
                                v70:getInstance("ClickRegion").NextSelectionUp = v71;
                            end;
                        end;
                    else
                        break;
                    end;
                end;
                v61 = v61 + (l_UIPadding_0.PaddingTop.Offset + l_UIPadding_0.PaddingBottom.Offset);
                l_ScrollingFrame_0.Size = UDim2.fromOffset(0, v61);
                return;
            end;
        end;
    end;
    l_dropdownJanitor_0:add(l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v53));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildAdded:Connect(v53));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(v50));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(v53));
    l_dropdownJanitor_0:add(l_Frame_0:GetAttributeChangedSignal("MaxIcons"):Connect(v53));
    l_dropdownJanitor_0:add(l_Frame_0:GetAttributeChangedSignal("MaxIcons"):Connect(v50));
    l_dropdownJanitor_0:add(v3.childThemeModified:Connect(v53));
    v53();
    local function _(v72) --[[ Line: 293 ]] --[[ Name: connectVisibilityListeners ]]
        -- upvalues: v50 (copy)
        if v72:IsA("GuiObject") then
            v72:GetPropertyChangedSignal("Visible"):Connect(v50);
        end;
    end;
    for _, v75 in pairs(l_ScrollingFrame_0:GetChildren()) do
        if v75:IsA("GuiObject") then
            v75:GetPropertyChangedSignal("Visible"):Connect(v50);
        end;
    end;
    l_ScrollingFrame_0.ChildAdded:Connect(function(v76) --[[ Line: 304 ]]
        -- upvalues: l_RunService_0 (ref), v50 (copy)
        l_RunService_0.Heartbeat:Wait();
        if v76:IsA("GuiObject") then
            v76:GetPropertyChangedSignal("Visible"):Connect(v50);
        end;
        v50();
    end);
    l_Frame_0.Visible = false;
    return l_Frame_0;
end;