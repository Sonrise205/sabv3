local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_TextService_0 = game:GetService("TextService");
local l_PlayerGui_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
local v5 = {
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png", 
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png", 
    [Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png", 
    [Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png", 
    [Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png", 
    [Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png", 
    [Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxView.png", 
    [Enum.KeyCode.ButtonStart] = "rbxasset://textures/ui/Controls/xboxmenu.png", 
    [Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLB.png", 
    [Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRB.png", 
    [Enum.KeyCode.ButtonL2] = "rbxasset://textures/ui/Controls/xboxLT.png", 
    [Enum.KeyCode.ButtonR2] = "rbxasset://textures/ui/Controls/xboxRT.png", 
    [Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/xboxLS.png", 
    [Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/xboxRS.png", 
    [Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/xboxLSDirectional.png", 
    [Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/xboxRSDirectional.png"
};
local v6 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
local v7 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v8 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12"
};
local function _() --[[ Line: 68 ]] --[[ Name: getScreenGui ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_ProximityPrompts_0 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = l_PlayerGui_0;
    end;
    return l_ProximityPrompts_0;
end;
local function v16(v11, v12) --[[ Line: 79 ]] --[[ Name: createProgressBarGradient ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.fromScale(0.5, 1);
    l_Frame_0.Position = UDim2.fromScale(v12 and 0 or 0.5, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Parent = v11;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.fromScale(2, 1);
    l_ImageLabel_0.Position = UDim2.fromScale(v12 and 0 or -1, 0);
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/RadialFill.png";
    l_ImageLabel_0.Parent = l_Frame_0;
    local l_UIGradient_0 = Instance.new("UIGradient");
    l_UIGradient_0.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(0.4999, 0), 
        NumberSequenceKeypoint.new(0.5, 1), 
        NumberSequenceKeypoint.new(1, 1)
    });
    l_UIGradient_0.Rotation = v12 and 180 or 0;
    l_UIGradient_0.Parent = l_ImageLabel_0;
    return l_UIGradient_0;
end;
local function v23() --[[ Line: 107 ]] --[[ Name: createCircularProgressBar ]]
    -- upvalues: v16 (copy)
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "CircularProgressBar";
    l_Frame_1.Size = UDim2.fromOffset(58, 58);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    local v18 = v16(l_Frame_1, true);
    local v19 = v16(l_Frame_1, false);
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Name = "Progress";
    l_NumberValue_0.Parent = l_Frame_1;
    l_NumberValue_0.Changed:Connect(function(v21) --[[ Line: 121 ]]
        -- upvalues: v18 (copy), v19 (copy)
        local v22 = math.clamp(v21 * 360, 0, 360);
        v18.Rotation = math.clamp(v22, 180, 360);
        v19.Rotation = math.clamp(v22, 0, 180);
    end);
    return l_Frame_1;
end;
local function v85(v24, v25, v26) --[[ Line: 130 ]] --[[ Name: createPrompt ]]
    -- upvalues: l_TweenService_0 (copy), v5 (copy), l_UserInputService_0 (copy), v6 (copy), v7 (copy), v8 (copy), v23 (copy), l_TextService_0 (copy)
    local v27 = {};
    local v28 = {};
    local v29 = {};
    local v30 = {};
    local v31 = TweenInfo.new(v24.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v32 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v33 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v34 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "Prompt";
    l_BillboardGui_0.AlwaysOnTop = true;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Size = UDim2.fromScale(0.5, 1);
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.BackgroundColor3 = Color3.new(0.07, 0.07, 0.07);
    l_Frame_2.Parent = l_BillboardGui_0;
    local v37 = v24:GetAttribute("State") == "Sell";
    if v37 then
        l_Frame_2.BackgroundColor3 = Color3.fromRGB(67, 0, 0);
    end;
    Instance.new("UICorner").Parent = l_Frame_2;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "InputFrame";
    l_Frame_3.Size = UDim2.fromScale(1, 1);
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Size = UDim2.fromScale(1, 1);
    l_Frame_4.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_4.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_3;
    local l_UIScale_0 = Instance.new("UIScale");
    l_UIScale_0.Parent = l_Frame_4;
    local v41 = v25 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v27, l_TweenService_0:Create(l_UIScale_0, v33, {
        Scale = v41
    }));
    table.insert(v28, l_TweenService_0:Create(l_UIScale_0, v33, {
        Scale = 1
    }));
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionText";
    l_TextLabel_0.Size = UDim2.fromScale(1, 1);
    l_TextLabel_0.Font = Enum.Font.GothamMedium;
    l_TextLabel_0.TextSize = 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.Parent = l_Frame_2;
    table.insert(v27, l_TweenService_0:Create(l_TextLabel_0, v33, {
        TextTransparency = 1
    }));
    table.insert(v28, l_TweenService_0:Create(l_TextLabel_0, v33, {
        TextTransparency = 0
    }));
    table.insert(v29, l_TweenService_0:Create(l_TextLabel_0, v33, {
        TextTransparency = 1
    }));
    table.insert(v30, l_TweenService_0:Create(l_TextLabel_0, v33, {
        TextTransparency = 0
    }));
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.Name = "ObjectText";
    l_TextLabel_1.Size = UDim2.fromScale(1, 1);
    l_TextLabel_1.Font = Enum.Font.GothamMedium;
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.TextTransparency = 1;
    l_TextLabel_1.TextColor3 = Color3.new(0.7, 0.7, 0.7);
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_1.Parent = l_Frame_2;
    table.insert(v27, l_TweenService_0:Create(l_TextLabel_1, v33, {
        TextTransparency = 1
    }));
    table.insert(v28, l_TweenService_0:Create(l_TextLabel_1, v33, {
        TextTransparency = 0
    }));
    table.insert(v29, l_TweenService_0:Create(l_TextLabel_1, v33, {
        TextTransparency = 1
    }));
    table.insert(v30, l_TweenService_0:Create(l_TextLabel_1, v33, {
        TextTransparency = 0
    }));
    table.insert(v27, l_TweenService_0:Create(l_Frame_2, v33, {
        Size = UDim2.fromScale(0.5, 1), 
        BackgroundTransparency = 1
    }));
    table.insert(v28, l_TweenService_0:Create(l_Frame_2, v33, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 0.2
    }));
    table.insert(v29, l_TweenService_0:Create(l_Frame_2, v33, {
        Size = UDim2.fromScale(0.5, 1), 
        BackgroundTransparency = 1
    }));
    table.insert(v30, l_TweenService_0:Create(l_Frame_2, v33, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 0.2
    }));
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Name = "RoundFrame";
    l_Frame_5.Size = UDim2.fromOffset(48, 48);
    l_Frame_5.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_5.Position = UDim2.fromScale(0.5, 0.5);
    l_Frame_5.BackgroundTransparency = 1;
    l_Frame_5.Parent = l_Frame_4;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0.5, 0);
    l_UICorner_0.Parent = l_Frame_5;
    table.insert(v29, l_TweenService_0:Create(l_Frame_5, v34, {
        BackgroundTransparency = 1
    }));
    table.insert(v30, l_TweenService_0:Create(l_Frame_5, v34, {
        BackgroundTransparency = 0.5
    }));
    if v25 == Enum.ProximityPromptInputType.Gamepad then
        if v5[v24.GamepadKeyCode] ~= nil then
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "ButtonImage";
            l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_1.Size = UDim2.fromOffset(24, 24);
            l_ImageLabel_1.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.ImageTransparency = 1;
            l_ImageLabel_1.Image = l_UserInputService_0:GetImageForKeyCode(v24.GamepadKeyCode);
            l_ImageLabel_1.Parent = l_Frame_4;
            table.insert(v29, l_TweenService_0:Create(l_ImageLabel_1, v34, {
                ImageTransparency = 1
            }));
            table.insert(v30, l_TweenService_0:Create(l_ImageLabel_1, v34, {
                ImageTransparency = 0
            }));
        end;
    elseif v25 == Enum.ProximityPromptInputType.Touch then
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "ButtonImage";
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.ImageTransparency = 1;
        l_ImageLabel_2.Size = UDim2.fromOffset(25, 31);
        l_ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_2.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ImageLabel_2.Parent = l_Frame_4;
        table.insert(v29, l_TweenService_0:Create(l_ImageLabel_2, v34, {
            ImageTransparency = 1
        }));
        table.insert(v30, l_TweenService_0:Create(l_ImageLabel_2, v34, {
            ImageTransparency = 0
        }));
    else
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "ButtonImage";
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.ImageTransparency = 1;
        l_ImageLabel_3.Size = UDim2.fromOffset(28, 30);
        l_ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_3.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_3.Image = "rbxasset://textures/ui/Controls/key_single.png";
        l_ImageLabel_3.Parent = l_Frame_4;
        table.insert(v29, l_TweenService_0:Create(l_ImageLabel_3, v34, {
            ImageTransparency = 1
        }));
        table.insert(v30, l_TweenService_0:Create(l_ImageLabel_3, v34, {
            ImageTransparency = 0
        }));
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v24.KeyboardKeyCode);
        local v50 = v6[v24.KeyboardKeyCode];
        if v50 == nil then
            v50 = v7[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v50 == nil then
            local v51 = v8[v24.KeyboardKeyCode];
            if v51 then
                l_l_UserInputService_0_StringForKeyCode_0 = v51;
            end;
        end;
        if v50 then
            local l_ImageLabel_4 = Instance.new("ImageLabel");
            l_ImageLabel_4.Name = "ButtonImage";
            l_ImageLabel_4.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_4.Size = UDim2.fromOffset(36, 36);
            l_ImageLabel_4.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_4.BackgroundTransparency = 1;
            l_ImageLabel_4.ImageTransparency = 1;
            l_ImageLabel_4.Image = v50;
            l_ImageLabel_4.Parent = l_Frame_4;
            table.insert(v29, l_TweenService_0:Create(l_ImageLabel_4, v34, {
                ImageTransparency = 1
            }));
            table.insert(v30, l_TweenService_0:Create(l_ImageLabel_4, v34, {
                ImageTransparency = 0
            }));
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "ButtonText";
            l_TextLabel_2.Position = UDim2.fromOffset(0, -1);
            l_TextLabel_2.Size = UDim2.fromScale(1, 1);
            l_TextLabel_2.Font = Enum.Font.GothamMedium;
            l_TextLabel_2.TextSize = 14;
            if string.len(l_l_UserInputService_0_StringForKeyCode_0) > 2 then
                l_TextLabel_2.TextSize = 12;
            end;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.TextTransparency = 1;
            l_TextLabel_2.TextColor3 = Color3.new(1, 1, 1);
            l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
            l_TextLabel_2.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_TextLabel_2.Parent = l_Frame_4;
            table.insert(v29, l_TweenService_0:Create(l_TextLabel_2, v34, {
                TextTransparency = 1
            }));
            table.insert(v30, l_TweenService_0:Create(l_TextLabel_2, v34, {
                TextTransparency = 0
            }));
        else
            error("ProximityPrompt '" .. v24.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v24.KeyboardKeyCode));
        end;
    end;
    if v25 == Enum.ProximityPromptInputType.Touch or v24.ClickablePrompt then
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.TextTransparency = 1;
        l_TextButton_0.Size = UDim2.fromScale(1, 1);
        l_TextButton_0.Parent = l_BillboardGui_0;
        local v55 = false;
        do
            local l_v55_0 = v55;
            l_TextButton_0.InputBegan:Connect(function(v57) --[[ Line: 352 ]]
                -- upvalues: v24 (copy), l_v55_0 (ref)
                if (v57.UserInputType == Enum.UserInputType.Touch or v57.UserInputType == Enum.UserInputType.MouseButton1) and v57.UserInputState ~= Enum.UserInputState.Change then
                    v24:InputHoldBegin();
                    l_v55_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v58) --[[ Line: 363 ]]
                -- upvalues: l_v55_0 (ref), v24 (copy)
                if (v58.UserInputType == Enum.UserInputType.Touch or v58.UserInputType == Enum.UserInputType.MouseButton1) and l_v55_0 then
                    l_v55_0 = false;
                    v24:InputHoldEnd();
                end;
            end);
            l_BillboardGui_0.Active = true;
        end;
    end;
    if v24.HoldDuration > 0 then
        local v59 = v23();
        v59.Parent = l_Frame_4;
        table.insert(v27, l_TweenService_0:Create(v59.Progress, v31, {
            Value = 1
        }));
        table.insert(v28, l_TweenService_0:Create(v59.Progress, v32, {
            Value = 0
        }));
    end;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if v24.HoldDuration > 0 then
        v60 = v24.PromptButtonHoldBegan:Connect(function() --[[ Line: 397 ]]
            -- upvalues: v27 (copy)
            for _, v65 in ipairs(v27) do
                v65:Play();
            end;
        end);
        v61 = v24.PromptButtonHoldEnded:Connect(function() --[[ Line: 403 ]]
            -- upvalues: v28 (copy)
            for _, v67 in ipairs(v28) do
                v67:Play();
            end;
        end);
    end;
    v62 = v24.Triggered:Connect(function() --[[ Line: 410 ]]
        -- upvalues: v29 (copy)
        for _, v69 in ipairs(v29) do
            v69:Play();
        end;
    end);
    v63 = v24.TriggerEnded:Connect(function() --[[ Line: 416 ]]
        -- upvalues: v30 (copy)
        for _, v71 in ipairs(v30) do
            v71:Play();
        end;
    end);
    local function v79() --[[ Line: 422 ]] --[[ Name: updateUIFromPrompt ]]
        -- upvalues: l_TextService_0 (ref), v24 (copy), v37 (copy), l_TextLabel_0 (copy), l_TextLabel_1 (copy), l_BillboardGui_0 (copy)
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v24.ActionText, 19, Enum.Font.GothamMedium, Vector2.new(1000, 1000));
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v24.ObjectText, 14, Enum.Font.GothamMedium, Vector2.new(1000, 1000));
        local v74 = math.max(l_l_TextService_0_TextSize_0.X, l_l_TextService_0_TextSize_1.X);
        local v75 = 72;
        local v76 = 72;
        local v77 = 72;
        if v37 then
            v77 = 62;
            v76 = 62;
            v75 = 62;
        end;
        if v24.ActionText ~= nil and v24.ActionText ~= "" or v24.ObjectText ~= nil and v24.ObjectText ~= "" then
            v76 = v74 + v77 + 24;
        end;
        local v78 = 0;
        if v24.ObjectText ~= nil and v24.ObjectText ~= "" then
            v78 = 9;
        end;
        l_TextLabel_0.Position = UDim2.new(0.5, v77 - v76 / 2, 0, v78);
        l_TextLabel_1.Position = UDim2.new(0.5, v77 - v76 / 2, 0, -10);
        l_TextLabel_0.Text = v24.ActionText;
        l_TextLabel_1.Text = v24.ObjectText;
        l_TextLabel_0.AutoLocalize = v24.AutoLocalize;
        l_TextLabel_0.RootLocalizationTable = v24.RootLocalizationTable;
        l_TextLabel_1.AutoLocalize = v24.AutoLocalize;
        l_TextLabel_1.RootLocalizationTable = v24.RootLocalizationTable;
        l_BillboardGui_0.Size = UDim2.fromOffset(v76, v75);
        l_BillboardGui_0.SizeOffset = Vector2.new(v24.UIOffset.X / l_BillboardGui_0.Size.Width.Offset, v24.UIOffset.Y / l_BillboardGui_0.Size.Height.Offset);
    end;
    local v80 = v24.Changed:Connect(v79);
    v79();
    l_BillboardGui_0.Adornee = v24.Parent;
    l_BillboardGui_0.Parent = v26;
    for _, v82 in ipairs(v30) do
        v82:Play();
    end;
    return function() --[[ Line: 476 ]] --[[ Name: cleanup ]]
        -- upvalues: v60 (ref), v61 (ref), v62 (ref), v63 (ref), v80 (copy), v29 (copy), l_BillboardGui_0 (copy)
        if v60 then
            v60:Disconnect();
        end;
        if v61 then
            v61:Disconnect();
        end;
        v62:Disconnect();
        v63:Disconnect();
        v80:Disconnect();
        for _, v84 in ipairs(v29) do
            v84:Play();
        end;
        task.wait(0.2);
        l_BillboardGui_0.Parent = nil;
    end;
end;
task.spawn(function() --[[ Line: 501 ]] --[[ Name: onLoad ]]
    -- upvalues: l_ProximityPromptService_0 (copy), l_PlayerGui_0 (copy), v85 (copy)
    local v86 = false;
    l_ProximityPromptService_0.PromptShown:Connect(function(v87, v88) --[[ Line: 504 ]]
        -- upvalues: v86 (ref), l_PlayerGui_0 (ref), v85 (ref)
        if v87.Style == Enum.ProximityPromptStyle.Default or v87:GetAttribute("CustomStyleDisabled") then
            return;
        elseif (v87:GetAttribute("State") == "Sell" or v87:GetAttribute("State") == "Grab") and v86 then
            return;
        else
            local l_ProximityPrompts_1 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
            if l_ProximityPrompts_1 == nil then
                l_ProximityPrompts_1 = Instance.new("ScreenGui");
                l_ProximityPrompts_1.Name = "ProximityPrompts";
                l_ProximityPrompts_1.ResetOnSpawn = false;
                l_ProximityPrompts_1.Parent = l_PlayerGui_0;
            end;
            l_ProximityPrompts_1 = v85(v87, v88, l_ProximityPrompts_1);
            v87.PromptHidden:Wait();
            l_ProximityPrompts_1();
            return;
        end;
    end);
    l_ProximityPromptService_0.PromptButtonHoldBegan:Connect(function() --[[ Line: 523 ]]
        -- upvalues: v86 (ref)
        v86 = true;
    end);
    l_ProximityPromptService_0.PromptButtonHoldEnded:Connect(function() --[[ Line: 527 ]]
        -- upvalues: v86 (ref)
        v86 = false;
    end);
end);
return {};