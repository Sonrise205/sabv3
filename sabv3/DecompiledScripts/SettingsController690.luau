local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v5 = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v6 = require(l_ReplicatedStorage_0.Packages.Trove);
local v7 = require(l_ReplicatedStorage_0.Packages.Net);
local v8 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local v9 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v10 = require(l_ReplicatedStorage_0.Controllers.DuelsMachineController);
local v11 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v12 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v13 = require(l_ReplicatedStorage_0.Shared.Index);
local v14 = require(l_ReplicatedStorage_0.Shared.Updates);
local v15 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v16 = require(l_ReplicatedStorage_0.Datas.Index);
local v17 = v7:RemoteFunction("SettingsService/ToggleSetting");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v20 = v5.new():setImage(110481567543062, "Selected"):setImage(78403024093069, "Deselected"):setOrder(1);
local v21 = {
    Music = 1, 
    ["Sound Effects"] = 2, 
    VFX = 3, 
    ["Chat Tips"] = 4, 
    ["Mobile Shift Lock"] = 5, 
    ["Receive Duels from"] = 6, 
    ["Base Skin"] = 7
};
local v22 = nil;
local l_Settings_0 = l_PlayerGui_0:WaitForChild("Settings").Settings;
local l_ScrollingFrame_0 = l_Settings_0.Content.ScrollingFrame;
local l_Template_0 = l_ScrollingFrame_0.Template;
local l_TemplateBaseSkin_0 = l_ScrollingFrame_0.TemplateBaseSkin;
local l_Close_0 = l_Settings_0.Header.Close;
local v28 = v6.new();
local v29 = {};
local _ = {};
local _ = function() --[[ Line: 63 ]] --[[ Name: GetMutationNames ]]
    -- upvalues: v16 (copy)
    local v31 = {
        "Normal"
    };
    for v32, _ in v16 do
        table.insert(v31, v32);
    end;
    return v31;
end;
local function v91(v35) --[[ Line: 71 ]] --[[ Name: ConstructSettings ]]
    -- upvalues: v4 (copy), l_LocalPlayer_0 (copy), v28 (copy), l_TemplateBaseSkin_0 (copy), l_ScrollingFrame_0 (copy), v16 (copy), v13 (copy), v8 (copy), v17 (copy), v9 (copy), v12 (copy), v21 (copy), l_Template_0 (copy), v15 (copy), v10 (copy), l_UserInputService_0 (copy)
    local v36 = v4:Get(l_LocalPlayer_0);
    v28:Clean();
    for v37, v38 in v35 do
        if v37 == "Base Skin" then
            local v39 = v28:Clone(l_TemplateBaseSkin_0);
            v39.Name = v37;
            v39.Function.Text = v37;
            v39.Button.DropDown.AnchorPoint = Vector2.new(0.5, 0);
            v39.Button.DropDown.Position = UDim2.fromScale(0.5, 1.2);
            v39.Button.DropDown.Size = UDim2.fromScale(1.221, 0);
            v39.Button.DropDown.AutomaticSize = Enum.AutomaticSize.Y;
            local v40 = {};
            local v41 = {};
            local function _(v42) --[[ Line: 93 ]] --[[ Name: calculateCanvasSize ]]
                -- upvalues: l_ScrollingFrame_0 (ref), v39 (copy), v40 (copy)
                local l_Y_0 = l_ScrollingFrame_0.UIListLayout.AbsoluteContentSize.Y;
                local v44 = if v39.Button.DropDown.Visible then (#v40 + 1) * ((v42 or v39.Button.AbsoluteSize).Y + 8) else 0;
                return UDim2.fromOffset(0, l_Y_0 + v44);
            end;
            local v46 = {
                "Normal"
            };
            for v47, _ in v16 do
                table.insert(v46, v47);
            end;
            for _, v50 in v46 do
                if v50 ~= v38 then
                    local v51 = v16[v50];
                    local v52 = v50 == "Normal" or v13:IsComplete(l_LocalPlayer_0, v50) or v36 and v36:Get((("UnlockedBaseSkins.%*"):format(v50)));
                    if v52 or v51.ShowInSettings ~= false then
                        local v53 = v28:Clone(v39.Button.DropDown.Template);
                        table.insert(v40, v53);
                        v53.Name = v50;
                        v53.Text.RichText = v51 and v51.UseRichTextInSettings or false;
                        v53.Text.Text = v51 and (v51.UseRichTextInSettings and v51.DisplayWithRichText or v51.DisplayText) or v50;
                        v53.Locked.Visible = not v52;
                        v53.BackgroundColor3 = v50 ~= "Normal" and v51.MainColor or Color3.new(0.490196, 0.435294, 0.435294);
                        v53.UIStroke.Color = v50 ~= "Normal" and (if v51.Palettes then v51.Palettes[1][2] else v51.MainColor) or Color3.new(0.490196, 0.435294, 0.435294);
                        v53.Text.UIStroke.Color = v50 ~= "Normal" and (if v51.Palettes then v51.Palettes[1][2] else v51.MainColor) or Color3.new(0.490196, 0.435294, 0.435294);
                        if v52 then
                            local v54 = v8.new(v53);
                            v28:Add(v54);
                            v54:Animate();
                            v28:Add(v54.OnActivated:Connect(function() --[[ Line: 128 ]]
                                -- upvalues: l_ScrollingFrame_0 (ref), v39 (copy), v40 (copy), v17 (ref), v37 (copy), v50 (copy), v9 (ref), v12 (ref)
                                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
                                local l_DropDown_0 = v39.Button.DropDown;
                                if l_DropDown_0.Visible then
                                    l_DropDown_0.Visible = not l_DropDown_0.Visible;
                                    v39.Button.Polygon.Rotation = l_DropDown_0.Visible and 180 or 0;
                                    local l_l_ScrollingFrame_0_0 = l_ScrollingFrame_0;
                                    local l_Y_1 = l_ScrollingFrame_0.UIListLayout.AbsoluteContentSize.Y;
                                    local v58 = if v39.Button.DropDown.Visible then (#v40 + 1) * (v39.Button.AbsoluteSize.Y + 8) else 0;
                                    l_l_ScrollingFrame_0_0.CanvasSize = UDim2.fromOffset(0, l_Y_1 + v58);
                                    l_ScrollingFrame_0.CanvasPosition = l_DropDown_0.Visible and Vector2.new(0, l_ScrollingFrame_0.AbsoluteCanvasSize.Y - l_ScrollingFrame_0.AbsoluteSize.Y) or Vector2.new(0, 0);
                                end;
                                local v59, v60 = v17:InvokeServer(v37, v50);
                                if not v59 then
                                    v9:Error(v60);
                                    v12:PlaySound("Sounds.Sfx.Error");
                                end;
                            end));
                            table.insert(v41, v54);
                        end;
                        v53.LayoutOrder = v50 ~= "Normal" and v16[v50].Order or 1;
                        v53.Visible = true;
                        v53.Parent = v39.Button.DropDown;
                    end;
                end;
            end;
            local function v70() --[[ Line: 155 ]] --[[ Name: updateScaling ]]
                -- upvalues: v39 (copy), v40 (copy), v41 (copy), l_ScrollingFrame_0 (ref)
                local l_AbsoluteSize_0 = v39.Button.AbsoluteSize;
                local v62 = UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
                for _, v64 in v40 do
                    v64.Size = v62;
                end;
                for _, v66 in v41 do
                    v66.DefaultSize = v62;
                end;
                local l_l_ScrollingFrame_0_1 = l_ScrollingFrame_0;
                local l_Y_2 = l_ScrollingFrame_0.UIListLayout.AbsoluteContentSize.Y;
                local v69 = if v39.Button.DropDown.Visible then (#v40 + 1) * ((l_AbsoluteSize_0 or v39.Button.AbsoluteSize).Y + 8) else 0;
                l_l_ScrollingFrame_0_1.CanvasSize = UDim2.fromOffset(0, l_Y_2 + v69);
            end;
            v28:Add(v39.Button:GetPropertyChangedSignal("AbsoluteSize"):Connect(v70));
            v28:Add(v39.Button.DropDown:GetPropertyChangedSignal("Visible"):Connect(v70));
            v28:Add(task.spawn(v70));
            local v71 = v16[v38];
            local l_Button_0 = v39.Button;
            l_Button_0.Text.RichText = v71 and v71.UseRichTextInSettings or false;
            l_Button_0.Text.Text = v71 and (v71.UseRichTextInSettings and v71.DisplayWithRichText or v71.DisplayText) or v38;
            l_Button_0.BackgroundColor3 = v38 ~= "Normal" and v71 and v71.MainColor or Color3.new(0.490196, 0.435294, 0.435294);
            l_Button_0.UIStroke.Color = v38 ~= "Normal" and v71 and (if v71.Palettes then v71.Palettes[1][1] else v71.MainColor) or Color3.new(0.490196, 0.435294, 0.435294);
            v46 = v8.new(l_Button_0);
            v28:Add(v46);
            v28:Add(v46.OnActivated:Connect(function() --[[ Line: 185 ]]
                -- upvalues: l_Button_0 (copy), l_ScrollingFrame_0 (ref), v39 (copy), v40 (copy)
                local l_DropDown_1 = l_Button_0.DropDown;
                l_DropDown_1.Visible = not l_DropDown_1.Visible;
                l_Button_0.Polygon.Rotation = l_DropDown_1.Visible and 180 or 0;
                local l_l_ScrollingFrame_0_2 = l_ScrollingFrame_0;
                local l_Y_3 = l_ScrollingFrame_0.UIListLayout.AbsoluteContentSize.Y;
                local v76 = if v39.Button.DropDown.Visible then (#v40 + 1) * (v39.Button.AbsoluteSize.Y + 8) else 0;
                l_l_ScrollingFrame_0_2.CanvasSize = UDim2.fromOffset(0, l_Y_3 + v76);
                l_ScrollingFrame_0.CanvasPosition = l_DropDown_1.Visible and Vector2.new(0, l_ScrollingFrame_0.AbsoluteCanvasSize.Y - l_ScrollingFrame_0.AbsoluteSize.Y) or Vector2.new(0, 0);
            end));
            v39.LayoutOrder = v21[v37];
            v39.Visible = true;
            v39.Parent = l_ScrollingFrame_0;
        elseif v37 == "Receive Duels from" then
            local v77 = v28:Clone(l_Template_0);
            v77.Name = v37;
            v77.Function.Text = v37;
            local v78 = if v38 == "Everyone" then Color3.fromRGB(12, 119, 60) else if v38 == "Friends" then Color3.fromRGB(255, 149, 0) else Color3.fromRGB(245, 56, 56);
            local v79 = if v38 == "Everyone" then Color3.fromRGB(2, 56, 0) else if v38 == "Friends" then Color3.fromRGB(190, 111, 0) else Color3.fromRGB(177, 0, 0);
            local l_Button_1 = v77.Buttons.Button;
            l_Button_1.Text.Text = v38;
            l_Button_1.BackgroundColor3 = v78;
            l_Button_1.UIStroke.Color = v79;
            l_Button_1.Text.UIStroke.Color = v79;
            local v81 = v8.new(l_Button_1);
            v28:Add(v81);
            v81:Animate();
            v28:Add(v81.OnActivated:Connect(function() --[[ Line: 219 ]]
                -- upvalues: v38 (copy), v17 (ref), v37 (copy), v9 (ref), v12 (ref)
                local v82 = v38 == "Everyone" and "Friends" or v38 == "Friends" and "No one" or "Everyone";
                local v83, v84 = v17:InvokeServer(v37, v82);
                if not v83 then
                    v9:Error(v84);
                    v12:PlaySound("Sounds.Sfx.Error");
                end;
            end));
            v77.LayoutOrder = v21[v37];
            v77.Visible = not v15.IsNewPlayersServer() and v10:IsEnabled();
            v77.Parent = l_ScrollingFrame_0;
        else
            local v85 = v28:Clone(l_Template_0);
            v85.Name = v37;
            v85.Function.Text = v37;
            local l_Button_2 = v85.Buttons.Button;
            l_Button_2.Text.Text = v38 and "On" or "Off";
            l_Button_2.BackgroundColor3 = v38 and Color3.new(0.0470588, 0.466667, 0.235294) or Color3.new(0.490196, 0.435294, 0.435294);
            l_Button_2.UIStroke.Color = v38 and Color3.new(0.00784314, 0.219608, 0) or Color3.new(0.403922, 0.356863, 0.356863);
            l_Button_2.Text.UIStroke.Color = v38 and Color3.new(0.00784314, 0.219608, 0) or Color3.new(0.403922, 0.356863, 0.356863);
            local v87 = v8.new(l_Button_2);
            v28:Add(v87);
            v87:Animate();
            v28:Add(v87.OnActivated:Connect(function() --[[ Line: 251 ]]
                -- upvalues: v17 (ref), v37 (copy), v9 (ref), v12 (ref)
                local v88, v89 = v17:InvokeServer(v37);
                if not v88 then
                    v9:Error(v89);
                    v12:PlaySound("Sounds.Sfx.Error");
                end;
            end));
            local v90 = true;
            if v37 == "Mobile Shift Lock" then
                v90 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
            end;
            v85.LayoutOrder = v21[v37];
            v85.Visible = v90;
            v85.Parent = l_ScrollingFrame_0;
        end;
    end;
end;
v29.Start = function(_) --[[ Line: 270 ]] --[[ Name: Start ]]
    -- upvalues: v22 (ref), v11 (copy), l_Settings_0 (copy), l_Close_0 (copy), v20 (copy), v4 (copy), l_LocalPlayer_0 (copy), v91 (copy), l_UserInputService_0 (copy), v14 (copy), v13 (copy)
    local v93 = nil;
    v22 = v11:Register("Settings", l_Settings_0, "TopQuint");
    v22:AttachCloseButton(l_Close_0);
    v22:Close();
    v20.selected:Connect(function() --[[ Line: 278 ]]
        -- upvalues: v11 (ref)
        v11:SetState("Settings", true);
    end);
    v20.deselected:Connect(function() --[[ Line: 282 ]]
        -- upvalues: v11 (ref)
        v11:SetState("Settings", false);
    end);
    v4:WaitAndCall(l_LocalPlayer_0, function(v94) --[[ Line: 286 ]]
        -- upvalues: v22 (ref), v91 (ref), v93 (ref), l_UserInputService_0 (ref), v20 (ref), v14 (ref), v13 (ref), l_LocalPlayer_0 (ref)
        local function _() --[[ Line: 287 ]] --[[ Name: tryConstruct ]]
            -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            if v22:IsOpened() then
                task.spawn(v91, v94:Get("Settings"));
                return;
            else
                v93 = true;
                return;
            end;
        end;
        l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 295 ]]
            -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            if v22:IsOpened() then
                task.spawn(v91, v94:Get("Settings"));
                return;
            else
                v93 = true;
                return;
            end;
        end);
        v22.OnOpen:Connect(function() --[[ Line: 299 ]]
            -- upvalues: v93 (ref), v91 (ref), v94 (copy), v20 (ref)
            if v93 then
                task.spawn(v91, v94:Get("Settings"));
                v93 = nil;
            end;
            v20:select();
        end);
        v22.OnClose:Connect(function() --[[ Line: 308 ]]
            -- upvalues: v20 (ref)
            v20:deselect();
        end);
        local v96 = v94:Get("Settings");
        v94:OnDictionaryInserted("UnlockedBaseSkins", function() --[[ Line: 314 ]]
            -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            if v22:IsOpened() then
                task.spawn(v91, v94:Get("Settings"));
                return;
            else
                v93 = true;
                return;
            end;
        end);
        v94:OnDictionaryRemoved("UnlockedBaseSkins", function() --[[ Line: 318 ]]
            -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            if v22:IsOpened() then
                task.spawn(v91, v94:Get("Settings"));
                return;
            else
                v93 = true;
                return;
            end;
        end);
        v14.OnUpdateEnabled:Connect(function() --[[ Line: 322 ]]
            -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            if v22:IsOpened() then
                task.spawn(v91, v94:Get("Settings"));
                return;
            else
                v93 = true;
                return;
            end;
        end);
        v14.OnUpdateDisabled:Connect(function() --[[ Line: 326 ]]
            -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            if v22:IsOpened() then
                task.spawn(v91, v94:Get("Settings"));
                return;
            else
                v93 = true;
                return;
            end;
        end);
        for v97, _ in v96 do
            v94:OnChanged(("Settings.%*"):format(v97), function(_) --[[ Line: 331 ]]
                -- upvalues: v22 (ref), v91 (ref), v94 (copy), v93 (ref)
                if v22:IsOpened() then
                    task.spawn(v91, v94:Get("Settings"));
                    return;
                else
                    v93 = true;
                    return;
                end;
            end);
        end;
        local v100 = {};
        local v101 = {
            "Strawberry", 
            "Meowl", 
            "Skibidi"
        };
        v94:OnChanged("AnimalAddedOrRemoved", function() --[[ Line: 339 ]]
            -- upvalues: v101 (copy), v13 (ref), l_LocalPlayer_0 (ref), v100 (copy), v22 (ref), v91 (ref), v94 (copy), v93 (ref)
            local v102 = false;
            for _, v104 in v101 do
                local v105 = v13:IsComplete(l_LocalPlayer_0, v104);
                if v100[v104] ~= v105 then
                    v100[v104] = v105;
                    v102 = true;
                end;
            end;
            if v102 then
                if v22:IsOpened() then
                    task.spawn(v91, v94:Get("Settings"));
                    return;
                else
                    v93 = true;
                end;
            end;
        end);
        if v22:IsOpened() then
            task.spawn(v91, v94:Get("Settings"));
            return;
        else
            v93 = true;
            return;
        end;
    end);
end;
return v29;