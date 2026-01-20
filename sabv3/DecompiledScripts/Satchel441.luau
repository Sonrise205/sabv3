local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local v10 = require(l_ReplicatedStorage_0.Packages.Net):RemoteEvent("InventoryService/Sort");
local v11 = false;
local v12 = {
    OpenClose = nil, 
    IsOpen = false, 
    StateChanged = Instance.new("BindableEvent"), 
    ModuleName = "Backpack", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    BackpackEmpty = Instance.new("BindableEvent")
};
v12.BackpackEmpty.Name = "BackpackEmpty";
v12.BackpackItemAdded = Instance.new("BindableEvent");
v12.BackpackItemAdded.Name = "BackpackAdded";
v12.BackpackItemRemoved = Instance.new("BindableEvent");
v12.BackpackItemRemoved.Name = "BackpackRemoved";
local l_script_0 = script;
local v14 = l_GuiService_0.PreferredTransparency or 1;
local v15 = not l_script_0:GetAttribute("OutlineEquipBorder") or false;
local l_l_script_0_Attribute_0 = l_script_0:GetAttribute("InsetIconPadding");
local v17 = l_script_0:GetAttribute("BackgroundTransparency") or 0.3;
local v18 = v17 * v14;
local v19 = l_script_0:GetAttribute("CornerRadius") or UDim.new(0, 8);
local v20 = l_script_0:GetAttribute("BackgroundColor3") or Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843);
local v21 = l_script_0:GetAttribute("EquipBorderColor3") or Color3.new(0, 0.6352941176470588, 1);
local v22 = l_script_0:GetAttribute("BackgroundTransparency") or 0.3;
local v23 = v22 * v14;
local v24 = l_script_0:GetAttribute("EquipBorderSizePixel") or 2.5;
local v25 = l_script_0:GetAttribute("CornerRadius") or UDim.new(0, 8);
local v26 = Color3.new(1, 1, 1);
local v27 = v25 - UDim.new(0, 5) or UDim.new(0, 3);
local v28 = l_script_0:GetAttribute("BackgroundColor3") or Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843);
local v29 = l_script_0:GetAttribute("TextColor3") or Color3.new(1, 1, 1);
local v30 = l_script_0:GetAttribute("TextStrokeTransparency") or 0.5;
local v31 = l_script_0:GetAttribute("TextStrokeColor3") or Color3.new(0, 0, 0);
local v32 = Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843);
local v33 = v14 * 0.2;
local v34 = Color3.new(1, 1, 1);
local v35 = v25 - UDim.new(0, 5) or UDim.new(0, 3);
local v36 = l_script_0:GetAttribute("FontFace") or Font.new("rbxasset://fonts/families/BuilderSans.json");
local v37 = l_script_0:GetAttribute("TextSize") or 16;
local l_Value_0 = Enum.KeyCode.Backspace.Value;
local l_Value_1 = Enum.KeyCode.Zero.Value;
local v40 = 60;
local v41 = {
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.MouseButton2] = true, 
    [Enum.UserInputType.MouseButton3] = true, 
    [Enum.UserInputType.MouseMovement] = true, 
    [Enum.UserInputType.MouseWheel] = true
};
local v42 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v43 = true;
local v44 = require(l_ReplicatedStorage_0.Packages.TopbarPlus).new():setName("Inventory"):setImage("rbxasset://textures/ui/TopBar/inventoryOn.png", "Selected"):setImage("rbxasset://textures/ui/TopBar/inventoryOff.png", "Deselected"):setImageScale(1):setCaption("Inventory"):bindToggleKey(Enum.KeyCode.Backquote):autoDeselect(false):setOrder(-1);
v44.toggled:Connect(function() --[[ Line: 176 ]]
    -- upvalues: l_GuiService_0 (copy), v12 (copy)
    if not l_GuiService_0.MenuIsOpen then
        v12.OpenClose();
    end;
end);
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.DisplayOrder = 120;
l_ScreenGui_0.IgnoreGuiInset = true;
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Name = "BackpackGui";
l_ScreenGui_0.Parent = l_PlayerGui_0;
local v46 = l_GuiService_0:IsTenFootInterface();
if v46 then
    v40 = 100;
    v37 = 24;
end;
local v47 = false;
local v48 = l_UserInputService_0.TouchEnabled and workspace.CurrentCamera.ViewportSize.X < 1024;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local l_Humanoid_0 = v60:WaitForChild("Humanoid");
local l_Backpack_0 = l_LocalPlayer_0:WaitForChild("Backpack");
local v63 = {};
local v64 = nil;
local v65 = {};
local v66 = {};
local v67 = {};
local v68 = 0;
local v69 = nil;
local v70 = false;
local v71 = false;
local v72 = false;
local v73 = false;
local v74 = {};
local v75 = false;
local l_VREnabled_0 = l_VRService_0.VREnabled;
local v77 = l_VREnabled_0 and 6 or v48 and 6 or 10;
local v78 = l_VREnabled_0 and 3 or v48 and 2 or 4;
local v79 = nil;
local function _(v80) --[[ Line: 239 ]] --[[ Name: EvaluateBackpackPanelVisibility ]]
    -- upvalues: v44 (copy), v43 (ref), l_VRService_0 (copy)
    return v80 and v44.enabled and v43 and l_VRService_0.VREnabled;
end;
local function _() --[[ Line: 243 ]] --[[ Name: ShowVRBackpackPopup ]]

end;
local function _() --[[ Line: 249 ]] --[[ Name: FindLowestEmpty ]]
    -- upvalues: v77 (copy), v63 (copy)
    for v83 = 1, v77 do
        local v84 = v63[v83];
        if not v84.Tool then
            return v84;
        end;
    end;
    return nil;
end;
v12.IsInventoryEmpty = function() --[[ Line: 259 ]] --[[ Name: isInventoryEmpty ]]
    -- upvalues: v77 (copy), v63 (copy)
    for v86 = v77 + 1, #v63 do
        local v87 = v63[v86];
        if v87 and v87.Tool then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 271 ]] --[[ Name: UseGazeSelection ]]
    return false;
end;
local function v94() --[[ Line: 275 ]] --[[ Name: AdjustHotbarFrames ]]
    -- upvalues: v52 (ref), v77 (copy), v68 (ref), v63 (copy)
    local l_Visible_0 = v52.Visible;
    local v90 = l_Visible_0 and v77 or v68;
    local v91 = 0;
    for v92 = 1, v77 do
        local v93 = v63[v92];
        if v93.Tool or l_Visible_0 then
            v91 = v91 + 1;
            v93:Readjust(v91, v90);
            v93.Frame.Visible = true;
        else
            v93.Frame.Visible = false;
        end;
    end;
end;
local function v97() --[[ Line: 292 ]] --[[ Name: UpdateScrollingFrameCanvasSize ]]
    -- upvalues: v54 (ref), v40 (ref), v55 (ref)
    local v95 = math.floor(v54.AbsoluteSize.X / (v40 + 5));
    local v96 = math.ceil((#v55:GetChildren() - 1) / v95) * (v40 + 5) + 5;
    v54.CanvasSize = UDim2.new(0, 0, 0, v96);
end;
local function v100() --[[ Line: 299 ]] --[[ Name: AdjustInventoryFrames ]]
    -- upvalues: v77 (copy), v63 (copy), v97 (copy)
    for v98 = v77 + 1, #v63 do
        local v99 = v63[v98];
        v99.Frame.LayoutOrder = v99.Index;
        v99.Frame.Visible = v99.Tool ~= nil;
    end;
    v97();
end;
local function v101() --[[ Line: 308 ]] --[[ Name: UpdateBackpackLayout ]]
    -- upvalues: v51 (ref), v77 (copy), v40 (ref), v52 (ref), v78 (copy), l_VREnabled_0 (copy), v54 (ref), v94 (copy), v100 (copy)
    v51.Size = UDim2.new(0, v77 * (v40 + 5) + 5, 0, v40 + 5 + 5);
    v51.Position = UDim2.new(0.5, -v51.Size.X.Offset / 2, 1, -v51.Size.Y.Offset);
    v52.Size = UDim2.new(0, v51.Size.X.Offset, 0, v51.Size.Y.Offset * v78 + 40 + (l_VREnabled_0 and 80 or 0));
    v52.Position = UDim2.new(0.5, -v52.Size.X.Offset / 2, 1, v51.Position.Y.Offset - v52.Size.Y.Offset);
    v54.Size = UDim2.new(1, v54.ScrollBarThickness + 1, 1, -40 - (l_VREnabled_0 and 80 or 0));
    v54.Position = UDim2.new(0, 0, 0, 40 + (l_VREnabled_0 and 40 or 0));
    v94();
    v100();
end;
local function _(v102, v103, v104) --[[ Line: 342 ]] --[[ Name: Clamp ]]
    return (math.min(v103, (math.max(v102, v104))));
end;
local function _(v106, v107, v108) --[[ Line: 346 ]] --[[ Name: CheckBounds ]]
    local l_AbsolutePosition_0 = v106.AbsolutePosition;
    local l_AbsoluteSize_0 = v106.AbsoluteSize;
    local v111 = false;
    if l_AbsolutePosition_0.X < v107 then
        v111 = false;
        if v107 <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
            v111 = false;
            if l_AbsolutePosition_0.Y < v108 then
                v111 = v108 <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            end;
        end;
    end;
    return v111;
end;
local function _(v113, v114) --[[ Line: 352 ]] --[[ Name: GetOffset ]]
    return (v113.AbsolutePosition + v113.AbsoluteSize / 2 - v114).Magnitude;
end;
local function _() --[[ Line: 357 ]] --[[ Name: DisableActiveHopper ]]
    -- upvalues: v69 (ref), v65 (copy)
    v69:ToggleSelect();
    v65[v69]:UpdateEquipView();
    v69 = nil;
end;
local function _() --[[ Line: 363 ]] --[[ Name: UnequipAllTools ]]
    -- upvalues: l_Humanoid_0 (ref), v69 (ref), v65 (copy)
    if l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
        if v69 then
            v69:ToggleSelect();
            v65[v69]:UpdateEquipView();
            v69 = nil;
        end;
    end;
end;
local function _(v118) --[[ Line: 372 ]] --[[ Name: EquipNewTool ]]
    -- upvalues: l_Humanoid_0 (ref), v69 (ref), v65 (copy)
    if l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
        if v69 then
            v69:ToggleSelect();
            v65[v69]:UpdateEquipView();
            v69 = nil;
        end;
    end;
    l_Humanoid_0:EquipTool(v118);
end;
local function _(v120) --[[ Line: 378 ]] --[[ Name: IsEquipped ]]
    -- upvalues: v60 (ref)
    return v120 and v120.Parent == v60;
end;
local function v122(v123, v124) --[[ Line: 383 ]] --[[ Name: MakeSlot ]]
    -- upvalues: v63 (copy), v23 (ref), v51 (ref), v40 (ref), v11 (ref), v10 (copy), v77 (copy), v52 (ref), l_UserInputService_0 (copy), v68 (ref), v71 (ref), v47 (ref), l_ContextActionService_0 (copy), v59 (ref), v65 (copy), v64 (ref), v60 (ref), v79 (ref), v24 (copy), v21 (copy), v15 (copy), v97 (copy), l_Humanoid_0 (ref), v69 (ref), l_Backpack_0 (ref), v20 (copy), v26 (copy), v25 (copy), l_l_script_0_Attribute_0 (copy), v29 (copy), v30 (copy), v31 (copy), v36 (copy), v37 (ref), v28 (copy), v27 (copy), v122 (copy), v55 (ref), v73 (ref), v66 (copy), l_Value_1 (copy), v67 (copy), v44 (copy), v54 (ref)
    local v125 = v124 or #v63 + 1;
    local v126 = {
        Tool = nil, 
        Index = v125, 
        Frame = nil
    };
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local v133 = nil;
    local v134 = nil;
    local v135 = nil;
    local v136 = nil;
    local function _() --[[ Line: 409 ]] --[[ Name: UpdateSlotFading ]]
        -- upvalues: v127 (ref), v23 (ref)
        v127.SelectionImageObject = nil;
        v127.BackgroundTransparency = v127.Draggable and 0 or v23;
    end;
    v126.Readjust = function(_, v139, v140) --[[ Line: 415 ]] --[[ Name: Readjust ]]
        -- upvalues: v51 (ref), v40 (ref), v127 (ref)
        local v141 = v51.Size.X.Offset / 2;
        local v142 = v40 + 5;
        local v143 = v139 - (v140 / 2 + 0.5);
        v127.Position = UDim2.new(0, v141 - v40 / 2 + v142 * v143, 0, 5);
    end;
    v126.Fill = function(v144, v145) --[[ Line: 425 ]] --[[ Name: Fill ]]
        -- upvalues: v11 (ref), v10 (ref), v129 (ref), v131 (ref), v51 (ref), v127 (ref), v135 (ref), v132 (ref), v77 (ref), v52 (ref), l_UserInputService_0 (ref), v68 (ref), v71 (ref), v47 (ref), l_ContextActionService_0 (ref), v59 (ref), v65 (ref), v64 (ref), v63 (ref)
        local v146 = false;
        if not v145 then
            return v144:Clear();
        else
            v144.Tool = v145;
            if not v11 then
                v10:FireServer(v145.Name, v144.Index);
            end;
            local function v152() --[[ Line: 438 ]] --[[ Name: assignToolData ]]
                -- upvalues: v145 (copy), v129 (ref), v131 (ref), v51 (ref), v127 (ref), v135 (ref)
                local l_TextureId_0 = v145.TextureId;
                v129.Image = l_TextureId_0;
                if l_TextureId_0 ~= "" then
                    v131.Visible = false;
                else
                    v131.Visible = true;
                end;
                v131.Text = v145.Name;
                if v145:GetAttribute("CurrentSlot") then
                    local l_v145_Attribute_0 = v145:GetAttribute("CurrentSlot");
                    local l_v51_FirstChild_0 = v51:FindFirstChild(l_v145_Attribute_0);
                    if l_v51_FirstChild_0 then
                        local l_Icon_0 = l_v51_FirstChild_0:FindFirstChild("Icon");
                        if l_Icon_0 then
                            local l_CooldownTextLabel_0 = l_Icon_0:FindFirstChild("CooldownTextLabel");
                            if l_CooldownTextLabel_0 then
                                l_CooldownTextLabel_0.Text = "";
                                l_CooldownTextLabel_0.Visible = false;
                            end;
                        end;
                    end;
                end;
                v145:SetAttribute("CurrentSlot", v127.Name);
                if v135 and v145:IsA("Tool") then
                    v135.Text = v145.ToolTip;
                    v135.Size = UDim2.new(0, 0, 0, 16);
                    v135.Position = UDim2.new(0.5, 0, 0, -5);
                end;
            end;
            v152();
            if v132 then
                v132:Disconnect();
                v132 = nil;
            end;
            v132 = v145.Changed:Connect(function(v153) --[[ Line: 485 ]]
                -- upvalues: v152 (copy)
                if v153 == "TextureId" or v153 == "Name" or v153 == "ToolTip" then
                    v152();
                end;
            end);
            local v154 = v144.Index <= v77;
            local l_Visible_1 = v52.Visible;
            if (not v154 or l_Visible_1) and not l_UserInputService_0.VREnabled then
                v127.Draggable = true;
            end;
            v144:UpdateEquipView();
            if v154 then
                v68 = v68 + 1;
                if v71 and v68 >= 1 and not v47 then
                    v47 = true;
                    l_ContextActionService_0:BindAction("BackpackHotbarEquip", v59, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                end;
            end;
            v65[v145] = v144;
            local v156;
            for v157 = 1, v77 do
                local v158 = v63[v157];
                if not v158.Tool then
                    v156 = v158;
                    v146 = true;
                end;
                if v146 then
                    break;
                end;
            end;
            if not v146 then
                v156 = nil;
            end;
            v146 = false;
            v64 = v156;
            return;
        end;
    end;
    v126.Clear = function(v159) --[[ Line: 521 ]] --[[ Name: Clear ]]
        -- upvalues: v132 (ref), v129 (ref), v131 (ref), v135 (ref), v127 (ref), v77 (ref), v68 (ref), v47 (ref), l_ContextActionService_0 (ref), v65 (ref), v64 (ref), v63 (ref)
        local v160 = false;
        if not v159.Tool then
            return;
        else
            if v132 then
                v132:Disconnect();
                v132 = nil;
            end;
            v129.Image = "";
            v131.Text = "";
            if v135 then
                v135.Text = "";
                v135.Visible = false;
            end;
            v127.Draggable = false;
            v159:UpdateEquipView(true);
            if v159.Index <= v77 then
                v68 = v68 - 1;
                if v68 < 1 then
                    v47 = false;
                    l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
                end;
            end;
            v65[v159.Tool] = nil;
            v159.Tool = nil;
            local v161;
            for v162 = 1, v77 do
                local v163 = v63[v162];
                if not v163.Tool then
                    v161 = v163;
                    v160 = true;
                end;
                if v160 then
                    break;
                end;
            end;
            if not v160 then
                v161 = nil;
            end;
            v160 = false;
            v64 = v161;
            return;
        end;
    end;
    v126.UpdateEquipView = function(v164, v165) --[[ Line: 556 ]] --[[ Name: UpdateEquipView ]]
        -- upvalues: v60 (ref), v79 (ref), v126 (copy), v133 (ref), v24 (ref), v21 (ref), v15 (ref), v129 (ref), v127 (ref), v23 (ref)
        local v166 = false;
        if not (v165 or false) then
            local l_Tool_0 = v164.Tool;
            if l_Tool_0 and l_Tool_0.Parent == v60 then
                v79 = v126;
                if not v133 then
                    v133 = Instance.new("UIStroke");
                    v133.Name = "Border";
                    v133.Thickness = v24;
                    v133.Color = v21;
                    v133.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                end;
                if v15 == true then
                    v133.Parent = v129;
                    v166 = true;
                else
                    v133.Parent = v127;
                    v166 = true;
                end;
            end;
        end;
        if not v166 then
            if not v166 then
                if v133 then
                    v133.Parent = nil;
                end;
            end;
        end;
        v166 = false;
        v127.SelectionImageObject = nil;
        v127.BackgroundTransparency = v127.Draggable and 0 or v23;
    end;
    v126.IsEquipped = function(v168) --[[ Line: 580 ]] --[[ Name: IsEquipped ]]
        -- upvalues: v60 (ref)
        local l_Tool_1 = v168.Tool;
        return l_Tool_1 and l_Tool_1.Parent == v60;
    end;
    v126.Delete = function(v170) --[[ Line: 584 ]] --[[ Name: Delete ]]
        -- upvalues: v127 (ref), v63 (ref), v97 (ref)
        v127:Destroy();
        table.remove(v63, v170.Index);
        local v171 = #v63;
        for v172 = v170.Index, v171 do
            v63[v172]:SlideBack();
        end;
        v97();
    end;
    v126.Swap = function(v173, v174) --[[ Line: 597 ]] --[[ Name: Swap ]]
        -- upvalues: v10 (ref)
        local l_Tool_2 = v173.Tool;
        local l_Tool_3 = v174.Tool;
        if l_Tool_3 then
            v10:FireServer(l_Tool_3.Name, v173.Index);
        end;
        if l_Tool_2 then
            v10:FireServer(l_Tool_2.Name, v174.Index);
        end;
        v173:Clear();
        if l_Tool_3 then
            v174:Clear();
            v173:Fill(l_Tool_3);
        end;
        if l_Tool_2 then
            v174:Fill(l_Tool_2);
            return;
        else
            v174:Clear();
            return;
        end;
    end;
    v126.SlideBack = function(v177) --[[ Line: 617 ]] --[[ Name: SlideBack ]]
        -- upvalues: v127 (ref)
        v177.Index = v177.Index - 1;
        v127.Name = v177.Index;
        v127.LayoutOrder = v177.Index;
    end;
    v126.TurnNumber = function(_, v179) --[[ Line: 623 ]] --[[ Name: TurnNumber ]]
        -- upvalues: v136 (ref)
        if v136 then
            v136.Visible = v179;
        end;
    end;
    v126.SetClickability = function(v180, v181) --[[ Line: 629 ]] --[[ Name: SetClickability ]]
        -- upvalues: l_UserInputService_0 (ref), v127 (ref), v23 (ref)
        if v180.Tool then
            if l_UserInputService_0.VREnabled then
                v127.Draggable = false;
            else
                v127.Draggable = not v181;
            end;
            v127.SelectionImageObject = nil;
            v127.BackgroundTransparency = v127.Draggable and 0 or v23;
        end;
    end;
    v126.CheckTerms = function(v182, v183) --[[ Line: 640 ]] --[[ Name: CheckTerms ]]
        -- upvalues: v131 (ref), v135 (ref)
        local v184 = 0;
        local _ = function(v185, v186) --[[ Line: 642 ]] --[[ Name: checkEm ]]
            -- upvalues: v184 (ref)
            local _, v188 = v185:lower():gsub(v186, "");
            v184 = v184 + v188;
        end;
        local l_Tool_4 = v182.Tool;
        if l_Tool_4 then
            for v191 in pairs(v183) do
                local v192, v193 = v131.Text:lower():gsub(v191, "");
                v184 = v184 + v193;
                if l_Tool_4:IsA("Tool") then
                    v192, v193 = (v135 and v135.Text or ""):lower():gsub(v191, "");
                    v184 = v184 + v193;
                end;
            end;
        end;
        return v184;
    end;
    v126.Select = function(_) --[[ Line: 660 ]] --[[ Name: Select ]]
        -- upvalues: v126 (copy), v60 (ref), l_Humanoid_0 (ref), v69 (ref), v65 (ref), l_Backpack_0 (ref)
        local l_Tool_5 = v126.Tool;
        if l_Tool_5 then
            if l_Tool_5 and l_Tool_5.Parent == v60 then
                if l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v69 then
                        v69:ToggleSelect();
                        v65[v69]:UpdateEquipView();
                        v69 = nil;
                        return;
                    end;
                end;
            elseif l_Tool_5.Parent == l_Backpack_0 then
                if l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v69 then
                        v69:ToggleSelect();
                        v65[v69]:UpdateEquipView();
                        v69 = nil;
                    end;
                end;
                l_Humanoid_0:EquipTool(l_Tool_5);
            end;
        end;
    end;
    v127 = Instance.new("TextButton");
    v127.Name = tostring(v125);
    v127.BackgroundColor3 = v20;
    v127.BorderColor3 = v26;
    v127.Text = "";
    v127.BorderSizePixel = 0;
    v127.Size = UDim2.new(0, v40, 0, v40);
    v127.Active = true;
    v127.Draggable = false;
    v127.BackgroundTransparency = v23;
    v127.MouseButton1Click:Connect(function() --[[ Line: 683 ]]
        -- upvalues: v126 (copy)
        changeSlot(v126);
    end);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "Corner";
    l_UICorner_0.CornerRadius = v25;
    l_UICorner_0.Parent = v127;
    v126.Frame = v127;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "SelectionObjectClipper";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = false;
    l_Frame_0.Parent = v127;
    v134 = Instance.new("ImageLabel");
    v134.Name = "Selector";
    v134.BackgroundTransparency = 1;
    v134.Size = UDim2.new(1, 0, 1, 0);
    v134.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
    v134.ScaleType = Enum.ScaleType.Slice;
    v134.SliceCenter = Rect.new(12, 12, 52, 52);
    v134.Parent = l_Frame_0;
    v130 = Instance.new("TextLabel");
    v130.BackgroundTransparency = 1;
    v130.TextScaled = true;
    v130.TextColor3 = Color3.fromRGB(255, 255, 255);
    v130.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    v130.Name = "CooldownTextLabel";
    v130.Text = "1";
    v130.Size = UDim2.new(0.65, 0, 0.65, 0);
    v130.Position = UDim2.new(0.5, 0, 0.5, 0);
    v130.AnchorPoint = Vector2.new(0.5, 0.5);
    v130.Visible = false;
    l_Frame_0 = Instance.new("UIStroke");
    l_Frame_0.Thickness = 1.5;
    l_Frame_0.Color = Color3.fromRGB(0, 0, 0);
    l_Frame_0.Transparency = 0.35;
    l_Frame_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual;
    l_Frame_0.Parent = v130;
    v129 = Instance.new("ImageLabel");
    v129.BackgroundTransparency = 1;
    v129.Name = "Icon";
    v129.Size = UDim2.new(1, 0, 1, 0);
    v129.Position = UDim2.new(0.5, 0, 0.5, 0);
    v129.AnchorPoint = Vector2.new(0.5, 0.5);
    if l_l_script_0_Attribute_0 == true then
        v129.Size = UDim2.new(1, -v24 * 2, 1, -v24 * 2);
    else
        v129.Size = UDim2.new(1, 0, 1, 0);
    end;
    v129.Parent = v127;
    v130.Parent = v129;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.Name = "Corner";
    if l_l_script_0_Attribute_0 == true then
        l_UICorner_1.CornerRadius = v25 - UDim.new(0, v24);
    else
        l_UICorner_1.CornerRadius = v25;
    end;
    l_UICorner_1.Parent = v129;
    v131 = Instance.new("TextLabel");
    v131.BackgroundTransparency = 1;
    v131.Name = "ToolName";
    v131.Text = "";
    v131.TextColor3 = v29;
    v131.TextStrokeTransparency = v30;
    v131.TextStrokeColor3 = v31;
    v131.FontFace = Font.new(v36.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    v131.TextSize = v37;
    v131.Size = UDim2.new(1, -v24 * 2, 1, -v24 * 2);
    v131.Position = UDim2.new(0.5, 0, 0.5, 0);
    v131.AnchorPoint = Vector2.new(0.5, 0.5);
    v131.TextTruncate = Enum.TextTruncate.AtEnd;
    v131.Parent = v127;
    v126.Frame.LayoutOrder = v126.Index;
    if v125 <= v77 then
        v135 = Instance.new("TextLabel");
        v135.Name = "ToolTip";
        v135.Text = "";
        v135.Size = UDim2.new(1, 0, 1, 0);
        v135.TextColor3 = v29;
        v135.TextStrokeTransparency = v30;
        v135.TextStrokeColor3 = v31;
        v135.FontFace = Font.new(v36.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
        v135.TextSize = v37;
        v135.ZIndex = 2;
        v135.TextWrapped = false;
        v135.TextYAlignment = Enum.TextYAlignment.Center;
        v135.BackgroundColor3 = v28;
        v135.BackgroundTransparency = v23;
        v135.AnchorPoint = Vector2.new(0.5, 1);
        v135.BorderSizePixel = 0;
        v135.Visible = false;
        v135.AutomaticSize = Enum.AutomaticSize.X;
        v135.Parent = v127;
        local l_UICorner_2 = Instance.new("UICorner");
        l_UICorner_2.Name = "Corner";
        l_UICorner_2.CornerRadius = v27;
        l_UICorner_2.Parent = v135;
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingLeft = UDim.new(0, 4);
        l_UIPadding_0.PaddingRight = UDim.new(0, 4);
        l_UIPadding_0.PaddingTop = UDim.new(0, 4);
        l_UIPadding_0.PaddingBottom = UDim.new(0, 4);
        l_UIPadding_0.Parent = v135;
        v127.MouseEnter:Connect(function() --[[ Line: 805 ]]
            -- upvalues: v135 (ref)
            if v135.Text ~= "" then
                v135.Visible = true;
            end;
        end);
        v127.MouseLeave:Connect(function() --[[ Line: 810 ]]
            -- upvalues: v135 (ref)
            v135.Visible = false;
        end);
        v126.MoveToInventory = function(v201) --[[ Line: 814 ]] --[[ Name: MoveToInventory ]]
            -- upvalues: v126 (copy), v77 (ref), v122 (ref), v55 (ref), v10 (ref), v60 (ref), l_Humanoid_0 (ref), v69 (ref), v65 (ref), v73 (ref), v52 (ref)
            if v126.Index <= v77 then
                local l_Tool_6 = v126.Tool;
                v201:Clear();
                local v203 = v122(v55);
                v203:Fill(l_Tool_6);
                if l_Tool_6 then
                    v10:FireServer(l_Tool_6.Name, v203.Index);
                end;
                if l_Tool_6 and l_Tool_6.Parent == v60 and l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v69 then
                        v69:ToggleSelect();
                        v65[v69]:UpdateEquipView();
                        v69 = nil;
                    end;
                end;
                if v73 then
                    v203.Frame.Visible = false;
                    v203.Parent = v52;
                end;
            end;
        end;
        if v125 < 10 or v125 == v77 then
            local v204 = v125 < 10 and v125 or 0;
            v136 = Instance.new("TextLabel");
            v136.BackgroundTransparency = 1;
            v136.Name = "Number";
            v136.TextColor3 = v29;
            v136.TextStrokeTransparency = v30;
            v136.TextStrokeColor3 = v31;
            v136.TextSize = v37;
            v136.Text = tostring(v204);
            v136.FontFace = Font.new(v36.Family, Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
            v136.Size = UDim2.new(0.4, 0, 0.4, 0);
            v136.Visible = false;
            v136.Parent = v127;
            v66[l_Value_1 + v204] = v126.Select;
        end;
    end;
    local l_Position_0 = v127.Position;
    local v206 = 0;
    local v207 = nil;
    do
        local l_l_Position_0_0, l_v206_0, l_v207_0 = l_Position_0, v206, v207;
        v127.DragBegin:Connect(function(v211) --[[ Line: 860 ]]
            -- upvalues: v67 (ref), v127 (ref), l_l_Position_0_0 (ref), v44 (ref), v129 (ref), v131 (ref), v136 (ref), l_v207_0 (ref), v55 (ref), v52 (ref), v128 (ref)
            v67[v127] = true;
            l_l_Position_0_0 = v211;
            v127.BorderSizePixel = 2;
            v44:lock();
            v127.ZIndex = 2;
            v129.ZIndex = 2;
            v131.ZIndex = 2;
            v127.Parent.ZIndex = 2;
            if v136 then
                v136.ZIndex = 2;
            end;
            l_v207_0 = v127.Parent;
            if l_v207_0 == v55 then
                local v212 = UDim2.new(0, v127.AbsolutePosition.X - v52.AbsolutePosition.X, 0, v127.AbsolutePosition.Y - v52.AbsolutePosition.Y);
                v127.Parent = v52;
                v127.Position = v212;
                v128 = Instance.new("Frame");
                v128.Name = "FakeSlot";
                v128.LayoutOrder = v127.LayoutOrder;
                v128.Size = v127.Size;
                v128.BackgroundTransparency = 1;
                v128.Parent = v55;
            end;
        end);
        v127.DragStopped:Connect(function(v213, v214) --[[ Line: 903 ]]
            -- upvalues: v128 (ref), v127 (ref), l_l_Position_0_0 (ref), l_v207_0 (ref), v44 (ref), v129 (ref), v131 (ref), v136 (ref), v67 (ref), v126 (copy), v52 (ref), v77 (ref), l_v206_0 (ref), v64 (ref), v10 (ref), v51 (ref), v63 (ref), v60 (ref), l_Humanoid_0 (ref), v69 (ref), v65 (ref), v73 (ref)
            if v128 then
                v128:Destroy();
            end;
            local v215 = os.clock();
            v127.Position = l_l_Position_0_0;
            v127.Parent = l_v207_0;
            v127.BorderSizePixel = 0;
            v44:unlock();
            v127.ZIndex = 1;
            v129.ZIndex = 1;
            v131.ZIndex = 1;
            l_v207_0.ZIndex = 1;
            if v136 then
                v136.ZIndex = 1;
            end;
            v67[v127] = nil;
            if not v126.Tool then
                return;
            else
                local l_v52_0 = v52;
                local l_AbsolutePosition_1 = l_v52_0.AbsolutePosition;
                local l_AbsoluteSize_1 = l_v52_0.AbsoluteSize;
                local v219 = false;
                if l_AbsolutePosition_1.X < v213 then
                    v219 = false;
                    if v213 <= l_AbsolutePosition_1.X + l_AbsoluteSize_1.X then
                        v219 = false;
                        if l_AbsolutePosition_1.Y < v214 then
                            v219 = v214 <= l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y;
                        end;
                    end;
                end;
                if v219 then
                    if v126.Index <= v77 then
                        v126:MoveToInventory();
                    end;
                    if v126.Index > v77 and v215 - l_v206_0 < 0.5 then
                        if v64 then
                            v219 = v126.Tool;
                            v126:Clear();
                            v64:Fill(v219);
                            v126:Delete();
                            if v219 then
                                v10:FireServer(v219.Name, v64.Index);
                            end;
                        end;
                        v215 = 0;
                    end;
                else
                    l_v52_0 = v51;
                    l_AbsolutePosition_1 = l_v52_0.AbsolutePosition;
                    l_AbsoluteSize_1 = l_v52_0.AbsoluteSize;
                    v219 = false;
                    if l_AbsolutePosition_1.X < v213 then
                        v219 = false;
                        if v213 <= l_AbsolutePosition_1.X + l_AbsoluteSize_1.X then
                            v219 = false;
                            if l_AbsolutePosition_1.Y < v214 then
                                v219 = v214 <= l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y;
                            end;
                        end;
                    end;
                    if v219 then
                        v219 = {
                            1e999, 
                            nil
                        };
                        for v220 = 1, v77 do
                            local v221 = v63[v220];
                            local l_Frame_1 = v221.Frame;
                            local v223 = Vector2.new(v213, v214);
                            local l_Magnitude_0 = (l_Frame_1.AbsolutePosition + l_Frame_1.AbsoluteSize / 2 - v223).Magnitude;
                            if l_Magnitude_0 < v219[1] then
                                v219 = {
                                    l_Magnitude_0, 
                                    v221
                                };
                            end;
                        end;
                        l_v52_0 = v219[2];
                        if l_v52_0 ~= v126 then
                            v126:Swap(l_v52_0);
                            if v126.Index > v77 then
                                l_AbsolutePosition_1 = v126.Tool;
                                if not l_AbsolutePosition_1 then
                                    v126:Delete();
                                else
                                    if l_AbsolutePosition_1 and l_AbsolutePosition_1.Parent == v60 and l_Humanoid_0 then
                                        l_Humanoid_0:UnequipTools();
                                        if v69 then
                                            v69:ToggleSelect();
                                            v65[v69]:UpdateEquipView();
                                            v69 = nil;
                                        end;
                                    end;
                                    if v73 then
                                        v126.Frame.Visible = false;
                                        v126.Frame.Parent = v52;
                                    end;
                                end;
                            end;
                        end;
                    elseif v126.Index <= v77 then
                        v126:MoveToInventory();
                    end;
                end;
                l_v206_0 = v215;
                return;
            end;
        end);
    end;
    v127.Parent = v123;
    v63[v125] = v126;
    if v77 < v125 then
        v97();
        if v52.Visible and not v73 then
            l_Position_0 = v54.CanvasSize.Y.Offset - v54.AbsoluteSize.Y;
            v54.CanvasPosition = Vector2.new(0, (math.max(0, l_Position_0)));
        end;
    end;
    return v126;
end;
local function v234(v225) --[[ Line: 1017 ]] --[[ Name: OnChildAdded ]]
    -- upvalues: v60 (ref), l_Humanoid_0 (ref), v69 (ref), v65 (copy), v70 (ref), l_LocalPlayer_0 (ref), v64 (ref), v122 (copy), v55 (ref), v63 (copy), l_Backpack_0 (ref), v94 (copy), v77 (copy), v52 (ref), v12 (copy)
    if not v225:IsA("Tool") and not v225:IsA("HopperBin") then
        if v225:IsA("Humanoid") and v225.Parent == v60 then
            l_Humanoid_0 = v225;
        end;
        return;
    else
        if v225.Parent == v60 then

        end;
        if v69 and v225.Parent == v60 then
            v69:ToggleSelect();
            v65[v69]:UpdateEquipView();
            v69 = nil;
        end;
        if not v70 and v225.Parent == v60 and not v65[v225] then
            local l_StarterGear_0 = l_LocalPlayer_0:FindFirstChild("StarterGear");
            if l_StarterGear_0 and l_StarterGear_0:FindFirstChild(v225.Name) then
                v70 = true;
                local v227 = v64 or v122(v55);
                for v228 = v227.Index, 1, -1 do
                    local v229 = v63[v228];
                    local v230 = v228 - 1;
                    if v230 > 0 then
                        v63[v230]:Swap(v229);
                    else
                        v229:Fill(v225);
                    end;
                end;
                for _, v232 in pairs(v60:GetChildren()) do
                    if v232:IsA("Tool") and v232 ~= v225 then
                        v232.Parent = l_Backpack_0;
                    end;
                end;
                v94();
                return;
            end;
        end;
        local v233 = v65[v225];
        if v233 then
            v233:UpdateEquipView();
        else
            v233 = v64 or v122(v55);
            v233:Fill(v225);
            if v233.Index <= v77 and not v52.Visible then
                v94();
            end;
            if v225:IsA("HopperBin") and v225.Active then
                if l_Humanoid_0 then
                    l_Humanoid_0:UnequipTools();
                    if v69 then
                        v69:ToggleSelect();
                        v65[v69]:UpdateEquipView();
                        v69 = nil;
                    end;
                end;
                v69 = v225;
            end;
        end;
        v12.BackpackItemAdded:Fire();
        return;
    end;
end;
local function v242(v235) --[[ Line: 1082 ]] --[[ Name: OnChildRemoved ]]
    -- upvalues: v60 (ref), l_Backpack_0 (ref), v65 (copy), v77 (copy), v52 (ref), v94 (copy), v69 (ref), v12 (copy), v63 (copy)
    local v236 = false;
    if not v235:IsA("Tool") and not v235:IsA("HopperBin") then
        return;
    else
        local l_Parent_0 = v235.Parent;
        if l_Parent_0 == v60 or l_Parent_0 == l_Backpack_0 then
            return;
        else
            local v238 = v65[v235];
            if v238 then
                v238:Clear();
                if v238.Index > v77 then
                    v238:Delete();
                elseif not v52.Visible then
                    v94();
                end;
            end;
            if v235 == v69 then
                v69 = nil;
            end;
            v12.BackpackItemRemoved:Fire();
            local v239;
            for v240 = v77 + 1, #v63 do
                local v241 = v63[v240];
                if v241 and v241.Tool then
                    v239 = false;
                    v236 = true;
                end;
                if v236 then
                    break;
                end;
            end;
            if not v236 then
                v239 = true;
            end;
            v236 = false;
            if v239 then
                v12.BackpackEmpty:Fire();
            end;
            return;
        end;
    end;
end;
local function v268(v243) --[[ Line: 1116 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_Players_0 (copy), v63 (copy), v77 (copy), v69 (ref), v74 (ref), v60 (ref), v242 (copy), v234 (copy), l_Backpack_0 (ref), l_LocalPlayer_0 (ref), l_ReplicatedStorage_0 (copy), v122 (copy), v55 (ref), v73 (ref), v52 (ref), v11 (ref), v94 (copy)
    while not v243:GetAttribute("BackpackReady") and l_Players_0:GetPlayerFromCharacter(v243) and not workspace:GetAttribute("BackpackIgnoreSave") do
        task.wait();
    end;
    for v244 = #v63, 1, -1 do
        local v245 = v63[v244];
        if v245.Tool then
            v245:Clear();
        end;
        if v77 < v244 then
            v245:Delete();
        end;
    end;
    v69 = nil;
    for _, v247 in pairs(v74) do
        v247:Disconnect();
    end;
    v74 = {};
    v60 = v243;
    table.insert(v74, v243.ChildRemoved:Connect(v242));
    table.insert(v74, v243.ChildAdded:Connect(v234));
    for _, v249 in pairs(v243:GetChildren()) do
        v234(v249);
    end;
    l_Backpack_0 = l_LocalPlayer_0:WaitForChild("Backpack");
    table.insert(v74, l_Backpack_0.ChildRemoved:Connect(v242));
    table.insert(v74, l_Backpack_0.ChildAdded:Connect(v234));
    local v250 = require(l_ReplicatedStorage_0.Packages.Synchronizer):Get(l_LocalPlayer_0);
    local v251 = v250 and v250:Get("InventoryLayoutOrder") or {};
    local l_workspace_Attribute_0 = workspace:GetAttribute("BackpackIgnoreSave");
    local v253 = {};
    for v254, v255 in v251 do
        v253[v255] = v254;
        if v255 == "Bat" and l_workspace_Attribute_0 then
            v253[v255] = -1;
        end;
    end;
    local v256 = {};
    for _, v258 in pairs(l_Backpack_0:GetChildren()) do
        if v258:IsA("Tool") then
            table.insert(v256, {
                index = v253[v258.Name] or 1e999, 
                tool = v258
            });
        end;
    end;
    table.sort(v256, function(v259, v260) --[[ Line: 1183 ]]
        return v259.index < v260.index;
    end);
    local function _() --[[ Line: 1187 ]] --[[ Name: createNewSlot ]]
        -- upvalues: v122 (ref), v55 (ref), v73 (ref), v52 (ref)
        local v261 = v122(v55);
        if v73 then
            v261.Frame.Visible = false;
            v261.Parent = v52;
        end;
        return v261;
    end;
    v11 = true;
    for v263, v264 in v256 do
        local l_index_0 = v264.index;
        if l_workspace_Attribute_0 then
            l_index_0 = v263;
        end;
        local v266;
        if l_index_0 <= v77 then
            v266 = v63[l_index_0];
        else
            local v267 = v122(v55);
            if v73 then
                v267.Frame.Visible = false;
                v267.Parent = v52;
            end;
            v266 = v267;
        end;
        if v266 and not v266.Tool then
            v266:Fill(v264.tool);
        end;
    end;
    v11 = false;
    v94();
end;
local function v274(v269, v270) --[[ Line: 1215 ]] --[[ Name: OnInputBegan ]]
    -- upvalues: l_TextChatService_0 (copy), v72 (ref), v71 (ref), l_Value_0 (copy), v66 (copy), v52 (ref), v44 (copy)
    local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
    if v269.UserInputType == Enum.UserInputType.Keyboard and not v72 and not l_ChatInputBarConfiguration_0.IsFocused and (v71 or v269.KeyCode.Value == l_Value_0) then
        local v272 = v66[v269.KeyCode.Value];
        if v272 then
            v272(v270);
        end;
    end;
    local l_UserInputType_0 = v269.UserInputType;
    if not v270 and (l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch) and v52.Visible then
        v44:deselect();
    end;
end;
local function v283() --[[ Line: 1241 ]] --[[ Name: OnUISChanged ]]
    -- upvalues: l_UserInputService_0 (copy), v77 (copy), v63 (copy), v41 (copy), v42 (copy)
    if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch then
        for v275 = 1, v77 do
            v63[v275]:TurnNumber(false);
        end;
        return;
    elseif l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Keyboard then
        for v276 = 1, v77 do
            v63[v276]:TurnNumber(true);
        end;
        return;
    else
        for _, v278 in pairs(v41) do
            if l_UserInputService_0:GetLastInputType() == v278 then
                for v279 = 1, v77 do
                    v63[v279]:TurnNumber(true);
                end;
                return;
            end;
        end;
        for _, v281 in pairs(v42) do
            if l_UserInputService_0:GetLastInputType() == v281 then
                for v282 = 1, v77 do
                    v63[v282]:TurnNumber(false);
                end;
                return;
            end;
        end;
        return;
    end;
end;
local v284 = nil;
local v285 = nil;
local function v286() --[[ Line: 1282 ]]

end;
unbindAllGamepadEquipActions = function() --[[ Line: 1285 ]] --[[ Name: unbindAllGamepadEquipActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("BackpackHasGamepadFocus");
    l_ContextActionService_0:UnbindAction("BackpackCloseInventory");
end;
v59 = function(_, v288, v289) --[[ Line: 1361 ]]
    -- upvalues: v284 (ref), v285 (ref), l_Humanoid_0 (ref), v69 (ref), v65 (copy), v77 (copy), v63 (copy), v79 (ref)
    if v288 ~= Enum.UserInputState.Begin then
        return;
    elseif v284 and (v284.KeyCode == Enum.KeyCode.ButtonR1 and v289.KeyCode == Enum.KeyCode.ButtonL1 or v284.KeyCode == Enum.KeyCode.ButtonL1 and v289.KeyCode == Enum.KeyCode.ButtonR1) and os.clock() - v285 <= 0.06 then
        if l_Humanoid_0 then
            l_Humanoid_0:UnequipTools();
            if v69 then
                v69:ToggleSelect();
                v65[v69]:UpdateEquipView();
                v69 = nil;
            end;
        end;
        v284 = v289;
        v285 = os.clock();
        return;
    else
        v284 = v289;
        v285 = os.clock();
        task.delay(0.06, function() --[[ Line: 1389 ]]
            -- upvalues: v284 (ref), v289 (copy), v77 (ref), v63 (ref), l_Humanoid_0 (ref), v69 (ref), v65 (ref), v79 (ref)
            if v284 ~= v289 then
                return;
            else
                local v290 = 0;
                v290 = v289.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1;
                for v291 = 1, v77 do
                    if v63[v291]:IsEquipped() then
                        local v292 = v290 + v291;
                        local v293 = false;
                        if v77 < v292 then
                            v292 = 1;
                            v293 = true;
                        elseif v292 < 1 then
                            v292 = v77;
                            v293 = true;
                        end;
                        local l_v292_0 = v292;
                        while true do
                            if not v63[v292].Tool then
                                v292 = v292 + v290;
                                if v292 == l_v292_0 then
                                    return;
                                elseif v77 < v292 then
                                    v292 = 1;
                                    v293 = true;
                                elseif v292 < 1 then
                                    v292 = v77;
                                    v293 = true;
                                end;
                            elseif v293 then
                                if l_Humanoid_0 then
                                    l_Humanoid_0:UnequipTools();
                                    if v69 then
                                        v69:ToggleSelect();
                                        v65[v69]:UpdateEquipView();
                                        v69 = nil;
                                    end;
                                end;
                                v79 = nil;
                                return;
                            else
                                v63[v292]:Select();
                                return;
                            end;
                        end;
                    end;
                end;
                if v79 and v79.Tool then
                    v79:Select();
                    return;
                else
                    local v295 = v290 == -1 and v77 or 1;
                    local v296 = v290 == -1 and 1 or v77;
                    for v297 = v295, v296, v290 do
                        if v63[v297].Tool then
                            v63[v297]:Select();
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
getGamepadSwapSlot = function() --[[ Line: 1456 ]] --[[ Name: getGamepadSwapSlot ]]
    -- upvalues: v63 (copy)
    for v298 = 1, #v63 do
        if v63[v298].Frame.BorderSizePixel > 0 then
            return v63[v298];
        end;
    end;
end;
changeSlot = function(v299) --[[ Line: 1466 ]] --[[ Name: changeSlot ]]
    -- upvalues: l_VRService_0 (copy), v52 (ref), l_GuiService_0 (copy), v53 (ref), v77 (copy)
    local v300 = not l_VRService_0.VREnabled or v52.Visible;
    if v299.Frame == l_GuiService_0.SelectedObject and v300 then
        local v301 = getGamepadSwapSlot();
        if v301 then
            v301.Frame.BorderSizePixel = 0;
            if v301 ~= v299 then
                v299:Swap(v301);
                v53.SelectionImageObject.Visible = false;
                if v299.Index > v77 and not v299.Tool then
                    if l_GuiService_0.SelectedObject == v299.Frame then
                        l_GuiService_0.SelectedObject = v301.Frame;
                    end;
                    v299:Delete();
                end;
                if v301.Index > v77 and not v301.Tool then
                    if l_GuiService_0.SelectedObject == v301.Frame then
                        l_GuiService_0.SelectedObject = v299.Frame;
                    end;
                    v301:Delete();
                    return;
                end;
            end;
        else
            local l_Size_0 = v299.Frame.Size;
            local l_Position_1 = v299.Frame.Position;
            v299.Frame:TweenSizeAndPosition(l_Size_0 + UDim2.new(0, 10, 0, 10), l_Position_1 - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ Line: 1502 ]]
                -- upvalues: v299 (copy), l_Size_0 (copy), l_Position_1 (copy)
                v299.Frame:TweenSizeAndPosition(l_Size_0, l_Position_1, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true);
            end);
            v299.Frame.BorderSizePixel = 3;
            v53.SelectionImageObject.Visible = true;
            return;
        end;
    else
        v299:Select();
        v53.SelectionImageObject.Visible = false;
    end;
end;
vrMoveSlotToInventory = function() --[[ Line: 1522 ]] --[[ Name: vrMoveSlotToInventory ]]
    -- upvalues: l_VRService_0 (copy), v53 (ref)
    if not l_VRService_0.VREnabled then
        return;
    else
        local v304 = getGamepadSwapSlot();
        if v304 and v304.Tool then
            v304.Frame.BorderSizePixel = 0;
            v304:MoveToInventory();
            v53.SelectionImageObject.Visible = false;
        end;
        return;
    end;
end;
enableGamepadInventoryControl = function() --[[ Line: 1535 ]] --[[ Name: enableGamepadInventoryControl ]]
    -- upvalues: v52 (ref), v44 (copy), l_ContextActionService_0 (copy), v286 (copy), l_GuiService_0 (copy), v51 (ref)
    local function v306() --[[ Line: 1536 ]]
        -- upvalues: v52 (ref), v44 (ref)
        if getGamepadSwapSlot() then
            local v305 = getGamepadSwapSlot();
            if v305 then
                v305.Frame.BorderSizePixel = 0;
                return;
            end;
        elseif v52.Visible then
            v44:deselect();
        end;
    end;
    l_ContextActionService_0:BindAction("BackpackHasGamepadFocus", v286, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindAction("BackpackCloseInventory", v306, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    if not false then
        l_GuiService_0.SelectedObject = v51:FindFirstChild("1");
    end;
end;
disableGamepadInventoryControl = function() --[[ Line: 1569 ]] --[[ Name: disableGamepadInventoryControl ]]
    -- upvalues: v77 (copy), v63 (copy), l_GuiService_0 (copy), v50 (ref)
    unbindAllGamepadEquipActions();
    for v307 = 1, v77 do
        local v308 = v63[v307];
        if v308 and v308.Frame then
            v308.Frame.BorderSizePixel = 0;
        end;
    end;
    if l_GuiService_0.SelectedObject and l_GuiService_0.SelectedObject:IsDescendantOf(v50) then
        l_GuiService_0.SelectedObject = nil;
    end;
end;
local function _() --[[ Line: 1584 ]] --[[ Name: bindBackpackHotbarAction ]]
    -- upvalues: v71 (ref), v47 (ref), l_ContextActionService_0 (copy), v59 (ref)
    if v71 and not v47 then
        v47 = true;
        l_ContextActionService_0:BindAction("BackpackHotbarEquip", v59, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
end;
local function _() --[[ Line: 1597 ]] --[[ Name: unbindBackpackHotbarAction ]]
    -- upvalues: v47 (ref), l_ContextActionService_0 (copy)
    disableGamepadInventoryControl();
    v47 = false;
    l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
end;
gamepadDisconnected = function() --[[ Line: 1603 ]] --[[ Name: gamepadDisconnected ]]
    -- upvalues: v75 (ref)
    v75 = false;
    disableGamepadInventoryControl();
end;
gamepadConnected = function() --[[ Line: 1608 ]] --[[ Name: gamepadConnected ]]
    -- upvalues: v75 (ref), l_GuiService_0 (copy), v50 (ref), v68 (ref), v71 (ref), v47 (ref), l_ContextActionService_0 (copy), v59 (ref), v52 (ref)
    v75 = true;
    l_GuiService_0:AddSelectionParent("BackpackSelection", v50);
    if v68 >= 1 and v71 and not v47 then
        v47 = true;
        l_ContextActionService_0:BindAction("BackpackHotbarEquip", v59, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
    if v52.Visible then
        enableGamepadInventoryControl();
    end;
end;
local function _(v311) --[[ Line: 1621 ]] --[[ Name: OnIconChanged ]]
    -- upvalues: l_StarterGui_0 (copy), v71 (ref), v50 (ref), v68 (ref), v47 (ref), l_ContextActionService_0 (copy), v59 (ref)
    v311 = v311 and l_StarterGui_0:GetCore("TopbarEnabled");
    v71 = v311;
    v50.Visible = v311;
    if v311 then
        if v68 >= 1 and v71 and not v47 then
            v47 = true;
            l_ContextActionService_0:BindAction("BackpackHotbarEquip", v59, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            return;
        end;
    else
        disableGamepadInventoryControl();
        v47 = false;
        l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
    end;
end;
local function v318(v313, v314) --[[ Line: 1645 ]] --[[ Name: MakeVRRoundButton ]]
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Name = v313;
    l_ImageButton_0.Size = UDim2.new(0, 40, 0, 40);
    l_ImageButton_0.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png";
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Icon";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_0.Position = UDim2.new(0.25, 0, 0.25, 0);
    l_ImageLabel_0.Image = v314;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Name = "Selection";
    l_ImageLabel_1.Size = UDim2.new(0.9, 0, 0.9, 0);
    l_ImageLabel_1.Position = UDim2.new(0.05, 0, 0.05, 0);
    l_ImageLabel_1.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png";
    l_ImageButton_0.SelectionImageObject = l_ImageLabel_1;
    return l_ImageButton_0, l_ImageLabel_0, l_ImageLabel_1;
end;
v50 = Instance.new("Frame");
v50.BackgroundTransparency = 1;
v50.Name = "Backpack";
v50.Size = UDim2.new(1, 0, 1, 0);
v50.Visible = false;
v50.Parent = l_ScreenGui_0;
v51 = Instance.new("Frame");
v51.BackgroundTransparency = 1;
v51.Name = "Hotbar";
v51.Size = UDim2.new(1, 0, 1, 0);
v51.Parent = v50;
for v319 = 1, v77 do
    local v320 = v122(v51, v319);
    v320.Frame.Visible = false;
    if not v64 then
        v64 = v320;
    end;
end;
local l_ImageLabel_2 = Instance.new("ImageLabel");
l_ImageLabel_2.BackgroundTransparency = 1;
l_ImageLabel_2.Name = "LeftBumper";
l_ImageLabel_2.Size = UDim2.new(0, 40, 0, 40);
l_ImageLabel_2.Position = UDim2.new(0, -l_ImageLabel_2.Size.X.Offset, 0.5, -l_ImageLabel_2.Size.Y.Offset / 2);
local l_ImageLabel_3 = Instance.new("ImageLabel");
l_ImageLabel_3.BackgroundTransparency = 1;
l_ImageLabel_3.Name = "RightBumper";
l_ImageLabel_3.Size = UDim2.new(0, 40, 0, 40);
l_ImageLabel_3.Position = UDim2.new(1, 0, 0.5, -l_ImageLabel_3.Size.Y.Offset / 2);
v52 = Instance.new("Frame");
v52.Name = "Inventory";
v52.Size = UDim2.new(1, 0, 1, 0);
v52.BackgroundTransparency = v18;
v52.BackgroundColor3 = v20;
v52.Active = true;
v52.Visible = false;
v52.Parent = v50;
local l_UICorner_3 = Instance.new("UICorner");
l_UICorner_3.Name = "Corner";
l_UICorner_3.CornerRadius = v19;
l_UICorner_3.Parent = v52;
v53 = Instance.new("TextButton");
v53.Name = "VRInventorySelector";
v53.Position = UDim2.new(0, 0, 0, 0);
v53.Size = UDim2.new(1, 0, 1, 0);
v53.BackgroundTransparency = 1;
v53.Text = "";
v53.Parent = v52;
local l_ImageLabel_4 = Instance.new("ImageLabel");
l_ImageLabel_4.BackgroundTransparency = 1;
l_ImageLabel_4.Name = "Selector";
l_ImageLabel_4.Size = UDim2.new(1, 0, 1, 0);
l_ImageLabel_4.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
l_ImageLabel_4.ScaleType = Enum.ScaleType.Slice;
l_ImageLabel_4.SliceCenter = Rect.new(12, 12, 52, 52);
l_ImageLabel_4.Visible = false;
v53.SelectionImageObject = l_ImageLabel_4;
v53.MouseButton1Click:Connect(function() --[[ Line: 1742 ]]
    vrMoveSlotToInventory();
end);
v54 = Instance.new("ScrollingFrame");
v54.BackgroundTransparency = 1;
v54.Name = "ScrollingFrame";
v54.Size = UDim2.new(1, 0, 1, 0);
v54.Selectable = false;
v54.ScrollingDirection = Enum.ScrollingDirection.Y;
v54.BorderSizePixel = 0;
v54.ScrollBarThickness = 8;
v54.ScrollBarImageColor3 = Color3.new(1, 1, 1);
v54.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
v54.CanvasSize = UDim2.new(0, 0, 0, 0);
v54.Parent = v52;
v55 = Instance.new("Frame");
v55.BackgroundTransparency = 1;
v55.Name = "UIGridFrame";
v55.Selectable = false;
v55.Size = UDim2.new(1, -10, 1, 0);
v55.Position = UDim2.new(0, 5, 0, 0);
v55.Parent = v54;
v56 = Instance.new("UIGridLayout");
v56.SortOrder = Enum.SortOrder.LayoutOrder;
v56.CellSize = UDim2.new(0, v40, 0, v40);
v56.CellPadding = UDim2.new(0, 5, 0, 5);
v56.Parent = v55;
v57 = v318("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v57.Size = UDim2.new(0, 34, 0, 34);
v57.Position = UDim2.new(0.5, -v57.Size.X.Offset / 2, 0, 43);
v57.Icon.Position = v57.Icon.Position - UDim2.new(0, 0, 0, 2);
v57.MouseButton1Click:Connect(function() --[[ Line: 1779 ]]
    -- upvalues: v54 (ref), v40 (ref)
    v54.CanvasPosition = Vector2.new(v54.CanvasPosition.X, (math.min(v54.CanvasSize.Y.Offset - v54.AbsoluteWindowSize.Y, (math.max(0, v54.CanvasPosition.Y - (v40 + 5))))));
end);
v58 = v318("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v58.Rotation = 180;
v58.Icon.Position = v58.Icon.Position - UDim2.new(0, 0, 0, 2);
v58.Size = UDim2.new(0, 34, 0, 34);
v58.Position = UDim2.new(0.5, -v58.Size.X.Offset / 2, 1, -v58.Size.Y.Offset - 3);
v58.MouseButton1Click:Connect(function() --[[ Line: 1796 ]]
    -- upvalues: v54 (ref), v40 (ref)
    v54.CanvasPosition = Vector2.new(v54.CanvasPosition.X, (math.min(v54.CanvasSize.Y.Offset - v54.AbsoluteWindowSize.Y, (math.max(0, v54.CanvasPosition.Y + (v40 + 5))))));
end);
v54.Changed:Connect(function(v325) --[[ Line: 1807 ]]
    -- upvalues: v54 (ref), v57 (ref), v58 (ref)
    if v325 == "AbsoluteWindowSize" or v325 == "CanvasPosition" or v325 == "CanvasSize" then
        local v326 = v54.CanvasPosition.Y ~= 0;
        local v327 = v54.CanvasPosition.Y < v54.CanvasSize.Y.Offset - v54.AbsoluteWindowSize.Y;
        v57.Visible = v326;
        v58.Visible = v327;
    end;
end);
task.spawn(v101);
local l_Frame_2 = Instance.new("Frame");
l_Frame_2.Name = "GamepadHintsFrame";
l_Frame_2.Size = UDim2.new(0, v51.Size.X.Offset, 0, v46 and 95 or 60);
l_Frame_2.BackgroundTransparency = v18;
l_Frame_2.BackgroundColor3 = v20;
l_Frame_2.Visible = false;
l_Frame_2.Parent = v50;
local l_UIListLayout_0 = Instance.new("UIListLayout");
l_UIListLayout_0.Name = "Layout";
l_UIListLayout_0.Padding = UDim.new(0, 25);
l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
l_UIListLayout_0.Parent = l_Frame_2;
local l_UICorner_4 = Instance.new("UICorner");
l_UICorner_4.Name = "Corner";
l_UICorner_4.CornerRadius = v19;
l_UICorner_4.Parent = l_Frame_2;
local function v338(v331, v332) --[[ Line: 1843 ]] --[[ Name: addGamepadHint ]]
    -- upvalues: l_Frame_2 (copy), v46 (copy), v36 (copy)
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "HintFrame";
    l_Frame_3.AutomaticSize = Enum.AutomaticSize.XY;
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Parent = l_Frame_2;
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.Name = "Layout";
    l_UIListLayout_1.Padding = v46 and UDim.new(0, 20) or UDim.new(0, 12);
    l_UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center;
    l_UIListLayout_1.Parent = l_Frame_3;
    local l_ImageLabel_5 = Instance.new("ImageLabel");
    l_ImageLabel_5.Name = "HintImage";
    l_ImageLabel_5.Size = v46 and UDim2.new(0, 60, 0, 60) or UDim2.new(0, 30, 0, 30);
    l_ImageLabel_5.BackgroundTransparency = 1;
    l_ImageLabel_5.Image = v331;
    l_ImageLabel_5.Parent = l_Frame_3;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "HintText";
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_TextLabel_0.FontFace = Font.new(v36.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    l_TextLabel_0.TextSize = v46 and 32 or 19;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Text = v332;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.Parent = l_Frame_3;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = l_TextLabel_0.TextSize;
    l_UITextSizeConstraint_0.Parent = l_TextLabel_0;
end;
v338(l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX), "Remove From Hotbar");
v338(l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA), "Select/Swap");
v338(l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonB), "Close Backpack");
local function v347() --[[ Line: 1887 ]] --[[ Name: resizeGamepadHintsFrame ]]
    -- upvalues: l_Frame_2 (copy), v51 (ref), v46 (copy), v52 (ref)
    l_Frame_2.Size = UDim2.new(v51.Size.X.Scale, v51.Size.X.Offset, 0, v46 and 95 or 60);
    l_Frame_2.Position = UDim2.new(v51.Position.X.Scale, v51.Position.X.Offset, v52.Position.Y.Scale, v52.Position.Y.Offset - l_Frame_2.Size.Y.Offset - 5);
    local v339 = 0;
    local l_l_Frame_2_Children_0 = l_Frame_2:GetChildren();
    local v341 = {};
    for _, v343 in pairs(l_l_Frame_2_Children_0) do
        if v343:IsA("GuiObject") then
            table.insert(v341, v343);
        end;
    end;
    for v344 = 1, #v341 do
        if v341[v344]:IsA("GuiObject") then
            v341[v344].Size = UDim2.new(1, 0, 1, -5);
            v341[v344].Position = UDim2.new(0, 0, 0, 0);
            v339 = v339 + (v341[v344].HintText.Position.X.Offset + v341[v344].HintText.TextBounds.X);
        end;
    end;
    local v345 = (l_Frame_2.AbsoluteSize.X - v339) / (#v341 - 1);
    for v346 = 1, #v341 do
        v341[v346].Position = v346 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, v341[v346 - 1].Position.X.Offset + v341[v346 - 1].Size.X.Offset + v345, 0, 0);
        v341[v346].Size = UDim2.new(0, v341[v346].HintText.Position.X.Offset + v341[v346].HintText.TextBounds.X, 1, -5);
    end;
end;
local l_Frame_4 = Instance.new("Frame");
l_Frame_4.Name = "Search";
l_Frame_4.BackgroundColor3 = v32;
l_Frame_4.BackgroundTransparency = v33;
l_Frame_4.Size = UDim2.new(0, 190, 0, 30);
l_Frame_4.Position = UDim2.new(1, -l_Frame_4.Size.X.Offset - 5, 0, 5);
l_Frame_4.Parent = v52;
local l_UICorner_5 = Instance.new("UICorner");
l_UICorner_5.Name = "Corner";
l_UICorner_5.CornerRadius = v35;
l_UICorner_5.Parent = l_Frame_4;
local l_UIStroke_0 = Instance.new("UIStroke");
l_UIStroke_0.Name = "Border";
l_UIStroke_0.Color = v34;
l_UIStroke_0.Thickness = 1;
l_UIStroke_0.Transparency = 0.8;
l_UIStroke_0.Parent = l_Frame_4;
local l_TextBox_0 = Instance.new("TextBox");
l_TextBox_0.BackgroundTransparency = 1;
l_TextBox_0.Name = "TextBox";
l_TextBox_0.Text = "";
l_TextBox_0.TextColor3 = v29;
l_TextBox_0.TextStrokeTransparency = v30;
l_TextBox_0.TextStrokeColor3 = v31;
l_TextBox_0.FontFace = Font.new(v36.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal);
l_TextBox_0.PlaceholderText = "Search";
l_TextBox_0.TextColor3 = v29;
l_TextBox_0.TextTransparency = v30;
l_TextBox_0.TextStrokeColor3 = v31;
l_TextBox_0.ClearTextOnFocus = false;
l_TextBox_0.TextTruncate = Enum.TextTruncate.AtEnd;
l_TextBox_0.TextSize = v37;
l_TextBox_0.TextXAlignment = Enum.TextXAlignment.Left;
l_TextBox_0.TextYAlignment = Enum.TextYAlignment.Center;
l_TextBox_0.Size = UDim2.new(0, 154, 0, 14);
l_TextBox_0.AnchorPoint = Vector2.new(0, 0.5);
l_TextBox_0.Position = UDim2.new(0, 8, 0.5, 0);
l_TextBox_0.ZIndex = 2;
l_TextBox_0.Parent = l_Frame_4;
local l_TextButton_0 = Instance.new("TextButton");
l_TextButton_0.Name = "X";
l_TextButton_0.Text = "";
l_TextButton_0.Size = UDim2.new(0, 30, 0, 30);
l_TextButton_0.Position = UDim2.new(1, -l_TextButton_0.Size.X.Offset, 0.5, -l_TextButton_0.Size.Y.Offset / 2);
l_TextButton_0.ZIndex = 4;
l_TextButton_0.Visible = false;
l_TextButton_0.BackgroundTransparency = 1;
l_TextButton_0.Parent = l_Frame_4;
local l_ImageButton_1 = Instance.new("ImageButton");
l_ImageButton_1.Name = "X";
l_ImageButton_1.Image = "rbxasset://textures/ui/InspectMenu/x.png";
l_ImageButton_1.BackgroundTransparency = 1;
l_ImageButton_1.Size = UDim2.new(0, l_Frame_4.Size.Y.Offset - 20, 0, l_Frame_4.Size.Y.Offset - 20);
l_ImageButton_1.AnchorPoint = Vector2.new(0.5, 0.5);
l_ImageButton_1.Position = UDim2.new(0.5, 0, 0.5, 0);
l_ImageButton_1.ZIndex = 1;
l_ImageButton_1.BorderSizePixel = 0;
l_ImageButton_1.Parent = l_TextButton_0;
local function v365() --[[ Line: 2024 ]] --[[ Name: search ]]
    -- upvalues: l_TextBox_0 (copy), v77 (copy), v63 (copy), v52 (ref), v73 (ref), v55 (ref), v54 (ref), v97 (copy), l_TextButton_0 (copy)
    local v354 = {};
    for v355 in l_TextBox_0.Text:gmatch("%S+") do
        v354[v355:lower()] = true;
    end;
    local v356 = {};
    for v357 = v77 + 1, #v63 do
        local v358 = v63[v357];
        table.insert(v356, {
            v358, 
            (v358:CheckTerms(v354))
        });
        v358.Frame.Visible = false;
        v358.Frame.Parent = v52;
    end;
    table.sort(v356, function(v359, v360) --[[ Line: 2039 ]]
        return v359[2] > v360[2];
    end);
    v73 = true;
    local v361 = 0;
    for _, v363 in ipairs(v356) do
        local v364 = v363[1];
        if v363[2] > 0 then
            v364.Frame.Visible = true;
            v364.Frame.Parent = v55;
            v364.Frame.LayoutOrder = v77 + v361;
            v361 = v361 + 1;
        end;
    end;
    v54.CanvasPosition = Vector2.new(0, 0);
    v97();
    l_TextButton_0.ZIndex = 3;
end;
local function v368() --[[ Line: 2061 ]] --[[ Name: clearResults ]]
    -- upvalues: l_TextButton_0 (copy), v73 (ref), v77 (copy), v63 (copy), v55 (ref), v97 (copy)
    if l_TextButton_0.ZIndex > 0 then
        v73 = false;
        for v366 = v77 + 1, #v63 do
            local v367 = v63[v366];
            v367.Frame.LayoutOrder = v367.Index;
            v367.Frame.Parent = v55;
            v367.Frame.Visible = true;
        end;
        l_TextButton_0.ZIndex = 0;
    end;
    v97();
end;
local function v369() --[[ Line: 2075 ]] --[[ Name: reset ]]
    -- upvalues: v368 (copy), l_TextBox_0 (copy)
    v368();
    l_TextBox_0.Text = "";
end;
local function v374(v370) --[[ Line: 2080 ]] --[[ Name: onChanged ]]
    -- upvalues: l_TextBox_0 (copy), v30 (copy), v368 (copy), v365 (copy), l_TextButton_0 (copy)
    if v370 == "Text" then
        local l_Text_0 = l_TextBox_0.Text;
        if l_Text_0 == "" then
            l_TextBox_0.TextTransparency = v30;
            v368();
        elseif l_Text_0 ~= "" then
            l_TextBox_0.TextTransparency = 0;
            v365();
        end;
        local l_l_TextButton_0_0 = l_TextButton_0;
        local v373 = false;
        if l_Text_0 ~= "" then
            v373 = l_Text_0 ~= "";
        end;
        l_l_TextButton_0_0.Visible = v373;
    end;
end;
local function v376(v375) --[[ Line: 2094 ]] --[[ Name: focusLost ]]
    -- upvalues: v365 (copy)
    if v375 then
        v365();
    end;
end;
l_TextButton_0.MouseButton1Click:Connect(v369);
l_TextBox_0.Changed:Connect(v374);
l_TextBox_0.FocusLost:Connect(v376);
v12.StateChanged.Event:Connect(function(v377) --[[ Line: 2105 ]]
    -- upvalues: v368 (copy), l_TextBox_0 (copy)
    if not v377 then
        v368();
        l_TextBox_0.Text = "";
    end;
end);
v66[Enum.KeyCode.Escape.Value] = function(v378) --[[ Line: 2113 ]]
    -- upvalues: v368 (copy), l_TextBox_0 (copy)
    if v378 then
        v368();
        l_TextBox_0.Text = "";
    end;
end;
l_UserInputService_0.LastInputTypeChanged:Connect(function(v379) --[[ Line: 2118 ]] --[[ Name: detectGamepad ]]
    -- upvalues: l_UserInputService_0 (copy), l_Frame_4 (copy)
    if v379 == Enum.UserInputType.Gamepad1 and not l_UserInputService_0.VREnabled then
        l_Frame_4.Visible = false;
        return;
    else
        l_Frame_4.Visible = true;
        return;
    end;
end);
l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 2129 ]]
    -- upvalues: l_ScreenGui_0 (copy), v44 (copy)
    l_ScreenGui_0.Enabled = false;
    v44:setEnabled(false);
end);
l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 2135 ]]
    -- upvalues: l_ScreenGui_0 (copy), v44 (copy)
    l_ScreenGui_0.Enabled = true;
    v44:setEnabled(true);
end);
l_UICorner_5 = function(_, v381, _) --[[ Line: 2142 ]]
    -- upvalues: l_GuiService_0 (copy), v77 (copy), v63 (copy)
    if v381 ~= Enum.UserInputState.Begin then
        return;
    elseif not l_GuiService_0.SelectedObject then
        return;
    else
        for v383 = 1, v77 do
            if v63[v383].Frame == l_GuiService_0.SelectedObject and v63[v383].Tool then
                v63[v383]:MoveToInventory();
                return;
            end;
        end;
        return;
    end;
end;
local l_l_UICorner_5_0 = l_UICorner_5 --[[ copy: 121 -> 131 ]];
l_UIStroke_0 = function() --[[ Line: 2158 ]] --[[ Name: openClose ]]
    -- upvalues: v67 (copy), v52 (ref), v94 (copy), v51 (ref), v77 (copy), v63 (copy), v75 (ref), v42 (copy), l_UserInputService_0 (copy), v347 (copy), l_Frame_2 (copy), l_ContextActionService_0 (copy), l_l_UICorner_5_0 (copy), v12 (copy)
    if not next(v67) then
        v52.Visible = not v52.Visible;
        local l_Visible_2 = v52.Visible;
        v94();
        v51.Active = not v51.Active;
        for v386 = 1, v77 do
            v63[v386]:SetClickability(not l_Visible_2);
        end;
    end;
    if v52.Visible then
        if v75 then
            if v42[l_UserInputService_0:GetLastInputType()] then
                v347();
                l_Frame_2.Visible = not l_UserInputService_0.VREnabled;
            end;
            enableGamepadInventoryControl();
        end;
    else
        if v75 then
            l_Frame_2.Visible = false;
        end;
        disableGamepadInventoryControl();
    end;
    if v52.Visible then
        l_ContextActionService_0:BindAction("BackpackRemoveSlot", l_l_UICorner_5_0, false, Enum.KeyCode.ButtonX);
    else
        l_ContextActionService_0:UnbindAction("BackpackRemoveSlot");
    end;
    v12.IsOpen = v52.Visible;
    v12.StateChanged:Fire(v52.Visible);
end;
task.spawn(function() --[[ Line: 2198 ]]
    -- upvalues: l_StarterGui_0 (copy)
    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
end);
v12.OpenClose = l_UIStroke_0;
while not l_LocalPlayer_0 do
    task.wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
l_LocalPlayer_0.CharacterAdded:Connect(v268);
if l_LocalPlayer_0.Character then
    task.spawn(v268, l_LocalPlayer_0.Character);
end;
l_UserInputService_0.InputBegan:Connect(v274);
l_UserInputService_0.TextBoxFocused:Connect(function() --[[ Line: 2223 ]]
    -- upvalues: v72 (ref)
    v72 = true;
end);
l_UserInputService_0.TextBoxFocusReleased:Connect(function() --[[ Line: 2226 ]]
    -- upvalues: v72 (ref)
    v72 = false;
end);
v66[l_Value_0] = function() --[[ Line: 2231 ]]
    -- upvalues: v69 (ref), l_Humanoid_0 (ref), v65 (copy)
    if v69 and l_Humanoid_0 then
        l_Humanoid_0:UnequipTools();
        if v69 then
            v69:ToggleSelect();
            v65[v69]:UpdateEquipView();
            v69 = nil;
        end;
    end;
end;
l_UserInputService_0.LastInputTypeChanged:Connect(v283);
v283();
if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
    gamepadConnected();
end;
l_UserInputService_0.GamepadConnected:Connect(function(v387) --[[ Line: 2245 ]]
    if v387 == Enum.UserInputType.Gamepad1 then
        gamepadConnected();
    end;
end);
l_UserInputService_0.GamepadDisconnected:Connect(function(v388) --[[ Line: 2250 ]]
    if v388 == Enum.UserInputType.Gamepad1 then
        gamepadDisconnected();
    end;
end);
v12.SetBackpackEnabled = function(_, v390) --[[ Line: 2258 ]] --[[ Name: SetBackpackEnabled ]]
    -- upvalues: v43 (ref)
    v43 = v390;
end;
v12.IsOpened = function(_) --[[ Line: 2263 ]] --[[ Name: IsOpened ]]
    -- upvalues: v12 (copy)
    return v12.IsOpen;
end;
v12.GetBackpackEnabled = function(_) --[[ Line: 2268 ]] --[[ Name: GetBackpackEnabled ]]
    -- upvalues: v43 (ref)
    return v43;
end;
v12.GetStateChangedEvent = function(_) --[[ Line: 2273 ]] --[[ Name: GetStateChangedEvent ]]
    -- upvalues: v12 (copy)
    return v12.StateChanged;
end;
task.spawn(function() --[[ Line: 2278 ]]
    -- upvalues: l_StarterGui_0 (copy), l_RunService_0 (copy), v43 (ref), v71 (ref), v50 (ref), v68 (ref), v47 (ref), l_ContextActionService_0 (copy), v59 (ref)
    local v394 = 30;
    while v394 > 0 and not pcall(function() --[[ Line: 2281 ]]
        -- upvalues: l_StarterGui_0 (ref)
        l_StarterGui_0:GetCore("TopbarEnabled");
    end) do
        v394 = v394 - task.wait();
    end;
    l_RunService_0.Heartbeat:Connect(function() --[[ Line: 2292 ]]
        -- upvalues: v43 (ref), l_StarterGui_0 (ref), v71 (ref), v50 (ref), v68 (ref), v47 (ref), l_ContextActionService_0 (ref), v59 (ref)
        local v395 = v43 and l_StarterGui_0:GetCore("TopbarEnabled");
        v71 = v395;
        v50.Visible = v395;
        if v395 then
            if v68 >= 1 and v71 and not v47 then
                v47 = true;
                l_ContextActionService_0:BindAction("BackpackHotbarEquip", v59, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                return;
            end;
        else
            disableGamepadInventoryControl();
            v47 = false;
            l_ContextActionService_0:UnbindAction("BackpackHotbarEquip");
        end;
    end);
end);
l_UICorner_5 = function() --[[ Line: 2298 ]] --[[ Name: OnPreferredTransparencyChanged ]]
    -- upvalues: l_GuiService_0 (copy), v18 (ref), v17 (copy), v52 (ref), v23 (ref), v22 (copy), v63 (copy), v33 (ref), l_Frame_4 (copy)
    local l_PreferredTransparency_0 = l_GuiService_0.PreferredTransparency;
    v18 = v17 * l_PreferredTransparency_0;
    v52.BackgroundTransparency = v18;
    v23 = v22 * l_PreferredTransparency_0;
    for _, v398 in ipairs(v63) do
        v398.Frame.BackgroundTransparency = v23;
    end;
    v33 = l_PreferredTransparency_0 * 0.2;
    l_Frame_4.BackgroundTransparency = v33;
end;
l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(l_UICorner_5);
return v12;