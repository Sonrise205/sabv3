local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v5 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v6 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v7 = require(l_Packages_0.Synchronizer);
local v8 = require(l_Packages_0.Trove);
local v9 = require(l_ReplicatedStorage_0.Packages.Signal);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v11 = require(l_Datas_0.Animals);
local v12 = require(l_Datas_0.Rarities);
local v13 = require(l_ReplicatedStorage_0.Datas.Index);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v15 = require(l_Shared_0.Animals);
local v16 = require(l_Shared_0.Index);
local v17 = require(l_Shared_0.Updates);
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v19 = require(l_Controllers_0.InterfaceController);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v21 = require(l_Classes_0.AnimatedButton);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Index_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Index").Index;
local l_Header_0 = l_Index_0.Main.Header;
local l_Close_0 = l_Header_0.Close;
local l_List_0 = l_Index_0.Main.Content.Holder.List;
local l_Template_0 = l_List_0.Template;
local l_Mutations_0 = l_Index_0.Main.Mutations;
local l_Template_1 = l_Mutations_0.Template;
local l_Progress_0 = l_Index_0.Progress;
local l_Description_0 = l_Progress_0.Description;
local l_Bar_0 = l_Progress_0.Bar;
local l_Loading_0 = l_Bar_0.Loading;
local l_Number_0 = l_Bar_0.Number;
local v35 = {};
local v36 = "Default";
local v37 = v9.new();
local v38 = v8.new();
local v39 = nil;
local v40 = {};
local v41 = false;
local function v75() --[[ Line: 73 ]] --[[ Name: Setup ]]
    -- upvalues: v41 (ref), v37 (copy), v36 (ref), v7 (copy), l_LocalPlayer_0 (copy), v13 (copy), v15 (copy), v11 (copy), v12 (copy), v16 (copy), l_List_0 (copy), l_Template_0 (copy), v35 (copy), v38 (copy), v4 (copy), l_Loading_0 (copy), l_Header_0 (copy), l_Number_0 (copy)
    if v41 then
        v37:Fire(v36);
        return;
    else
        local v42 = v7:Get(l_LocalPlayer_0);
        if not v42 then
            return;
        else
            v41 = true;
            local v43 = v13[v36];
            local l_v15_List_0 = v15:GetList("Generation", true);
            for v45 = 1, #l_v15_List_0 do
                local v46 = l_v15_List_0[v45];
                local v47 = v11[v46];
                local v48 = v12[v47.Rarity];
                if v16:CanShowInIndex(v46) then
                    local l_l_List_0_FirstChild_0 = l_List_0:FindFirstChild(v46);
                    if l_l_List_0_FirstChild_0 then
                        l_l_List_0_FirstChild_0.LayoutOrder = v45;
                    else
                        local v50 = l_Template_0:Clone();
                        v50.Name = v46;
                        v50.LayoutOrder = v45;
                        v50.Visible = not v43 or not v43.Index or v43.Index[v46];
                        v37:Connect(function() --[[ Line: 111 ]]
                            -- upvalues: v13 (ref), v36 (ref), v50 (copy), v46 (copy)
                            local v51 = v13[v36];
                            v50.Visible = not v51 or not v51.Index or v51.Index[v46];
                        end);
                        local l_ViewportFrame_0 = v50.ViewportFrame;
                        local v53 = nil;
                        local v54 = nil;
                        local v55 = nil;
                        v50.NameLabel.Text = v47.DisplayName;
                        v50.RarityLabel.Text = v47.Rarity;
                        local v56, v57 = v15:AttachOnViewport(v46, l_ViewportFrame_0, true, nil, true);
                        if v56 then
                            v35[l_ViewportFrame_0] = {
                                targetParent = v50, 
                                cellIndex = v45, 
                                state = nil
                            };
                        end;
                        do
                            local l_v53_0, l_v54_0, l_v55_0 = v53, v54, v55;
                            local function _() --[[ Line: 141 ]] --[[ Name: cleanupEffects ]]
                                -- upvalues: l_v54_0 (ref), v38 (ref), l_v53_0 (ref), l_v55_0 (ref)
                                if l_v54_0 then
                                    v38:Remove(l_v54_0);
                                    l_v54_0 = nil;
                                end;
                                if l_v53_0 then
                                    v38:Remove(l_v53_0);
                                    l_v53_0 = nil;
                                end;
                                if l_v55_0 then
                                    l_v55_0();
                                    l_v55_0 = nil;
                                end;
                            end;
                            local function v62() --[[ Line: 158 ]] --[[ Name: update ]]
                                -- upvalues: v35 (ref), l_ViewportFrame_0 (copy), v62 (copy), v36 (ref), v13 (ref), v42 (copy), v46 (copy), v50 (copy), l_v54_0 (ref), v38 (ref), l_v53_0 (ref), l_v55_0 (ref), v48 (copy), v4 (ref), v57 (copy), v15 (ref)
                                if v35[l_ViewportFrame_0] and v35[l_ViewportFrame_0].state ~= true then
                                    v35[l_ViewportFrame_0].scheduledUpdate = v62;
                                    return;
                                else
                                    local v63 = v36 or "Default";
                                    if not v13[v63] then
                                        v63 = "Default";
                                    end;
                                    local v64 = not v13[v63] or v13[v63].IsMutation;
                                    local v65 = v42:Get({
                                        "Index", 
                                        v46
                                    });
                                    local v66 = false;
                                    if v13[v63] and v13[v63].CustomIndex then
                                        v66 = v65 ~= nil and v65[v13[v63].CustomIndex.Name] or nil;
                                    elseif v64 then
                                        v66 = v65 ~= nil and v65[v63] or nil;
                                    else
                                        local v67 = false;
                                        if v65 ~= nil then
                                            v67 = next(v65) ~= nil;
                                        end;
                                        v66 = v67;
                                    end;
                                    v50.NameLabel.Visible = v66;
                                    l_ViewportFrame_0.ImageColor3 = not v66 and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255);
                                    if l_v54_0 then
                                        v38:Remove(l_v54_0);
                                        l_v54_0 = nil;
                                    end;
                                    if l_v53_0 then
                                        v38:Remove(l_v53_0);
                                        l_v53_0 = nil;
                                    end;
                                    if l_v55_0 then
                                        l_v55_0();
                                        l_v55_0 = nil;
                                    end;
                                    if v48.GradientPreset then
                                        v50.RarityLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
                                        l_v55_0 = v38:Add(v4.apply(v50.RarityLabel, v48.GradientPreset));
                                    else
                                        v50.RarityLabel.TextColor3 = v48.Color;
                                    end;
                                    if v63 == "Rainbow" then
                                        v50.MutationLabel.Text = "Rainbow";
                                        local v68 = v4.apply(v50.MutationLabel, "Rainbow");
                                        if v68 then
                                            l_v54_0 = v38:Add(v68);
                                        end;
                                    elseif v63 == "Christmas" then
                                        v50.MutationLabel.Text = "Christmas";
                                        local v69 = v4.apply(v50.MutationLabel, "SlowGreenRed");
                                        if v69 then
                                            l_v54_0 = v38:Add(v69);
                                        end;
                                    else
                                        v50.MutationLabel.Text = if v13[v63] then v13[v63].DisplayWithRichText else "Default";
                                    end;
                                    if v57 and v63 ~= "Default" and v66 and v64 then
                                        l_v53_0 = v38:Add(v15:ApplyMutation(v57, v46, v63, true));
                                    end;
                                    return;
                                end;
                            end;
                            v37:Connect(function() --[[ Line: 217 ]]
                                -- upvalues: l_v54_0 (ref), v38 (ref), l_v53_0 (ref), l_v55_0 (ref), v62 (copy)
                                if l_v54_0 then
                                    v38:Remove(l_v54_0);
                                    l_v54_0 = nil;
                                end;
                                if l_v53_0 then
                                    v38:Remove(l_v53_0);
                                    l_v53_0 = nil;
                                end;
                                if l_v55_0 then
                                    l_v55_0();
                                    l_v55_0 = nil;
                                end;
                                v62();
                            end);
                            v42:OnChanged({
                                "Index", 
                                v46
                            }, v62, true);
                            task.spawn(v62);
                            v50.Parent = l_List_0;
                        end;
                    end;
                end;
            end;
            local function v74() --[[ Line: 227 ]] --[[ Name: update ]]
                -- upvalues: v16 (ref), l_LocalPlayer_0 (ref), v36 (ref), l_Loading_0 (ref), l_Header_0 (ref), l_Number_0 (ref)
                local l_v16_IndexAnimals_0, v71, v72 = v16:GetIndexAnimals(l_LocalPlayer_0, v36);
                assert(l_v16_IndexAnimals_0, v71, v72);
                local v73 = v16:IsComplete(l_LocalPlayer_0, v36);
                l_Loading_0.Size = UDim2.new(math.clamp(l_v16_IndexAnimals_0 / v71, 0, 1), 0, 1, 0);
                l_Header_0.Total.Text = ("%*/%*"):format(l_v16_IndexAnimals_0, v72);
                if v73 then
                    l_Number_0.Text = "Milestone Completed";
                    l_Number_0.TextColor3 = Color3.new(0.0588235, 1, 0.32549);
                    l_Loading_0.BackgroundColor3 = Color3.new(0.490196, 0.941176, 0.439216);
                    return;
                else
                    l_Number_0.Text = ("%*/%*"):format(l_v16_IndexAnimals_0, v71);
                    l_Number_0.TextColor3 = Color3.new(1, 1, 1);
                    l_Loading_0.BackgroundColor3 = Color3.new(0.941176, 0.729412, 0.482353);
                    return;
                end;
            end;
            v37:Connect(v74);
            v74();
            return;
        end;
    end;
end;
v40.Start = function(_) --[[ Line: 252 ]] --[[ Name: Start ]]
    -- upvalues: v39 (ref), v19 (copy), l_Index_0 (copy), l_Close_0 (copy), l_Template_1 (copy), l_Mutations_0 (copy), v21 (copy), v36 (ref), v37 (copy), v13 (copy), v4 (copy), v6 (copy), v17 (copy), v5 (copy), l_List_0 (copy), l_RunService_0 (copy), v35 (copy), v7 (copy), l_LocalPlayer_0 (copy), v75 (copy), v38 (copy), l_Description_0 (copy)
    v39 = v19:Register("Index", l_Index_0, "TopQuint");
    v39:AttachCloseButton(l_Close_0);
    v39:Close();
    local v77 = l_Template_1:Clone();
    v77.TextLabel.Text = "Normal";
    v77.Name = "Default";
    v77.Parent = l_Mutations_0;
    v77.Visible = true;
    local v78 = v21.new(v77);
    v78:Animate();
    v78.OnActivated:Connect(function() --[[ Line: 279 ]]
        -- upvalues: v36 (ref), v77 (copy), v37 (ref)
        if v36 == v77.Name then
            return;
        else
            v36 = v77.Name;
            v37:Fire(v36);
            return;
        end;
    end);
    for v79, v80 in v13 do
        local l_LimitedMutation_0 = v80.LimitedMutation;
        if (not l_LimitedMutation_0 or l_LimitedMutation_0 >= workspace:GetServerTimeNow()) and not v80.DisableIndex then
            local v82 = l_Template_1:Clone();
            v82.Name = v79;
            v82.LayoutOrder = v80.Order or 1;
            v82.Visible = true;
            v82.TextLabel.Text = if v80.UseRichText then v80.DisplayWithRichText else v80.DisplayText;
            v82.TextLabel.RichText = v80.UseRichText;
            if v79 == "Rainbow" then
                v4.apply(v82.TextLabel, "Rainbow");
            elseif v79 == "Christmas" then
                v4.apply(v82.TextLabel, "SlowGreenRed");
            else
                v82.TextLabel.TextColor3 = v80.MainColor;
            end;
            v82.Parent = l_Mutations_0;
            local function _() --[[ Line: 313 ]] --[[ Name: isVisible ]]
                -- upvalues: v6 (ref), v79 (copy), l_LimitedMutation_0 (copy), v80 (copy), v17 (ref)
                local l_v6_Instant_0 = v6:GetInstant(("%*Timer"):format(v79), l_LimitedMutation_0);
                local v84 = not v80.Update or v17.Methods.IsEnabled(v80.Update);
                local v85 = l_v6_Instant_0 - workspace:GetServerTimeNow();
                local v86 = false;
                if v85 > 0 then
                    v86 = v84;
                end;
                return v86;
            end;
            if l_LimitedMutation_0 then
                task.spawn(function() --[[ Line: 321 ]]
                    -- upvalues: v17 (ref), v82 (copy), v6 (ref), v79 (copy), l_LimitedMutation_0 (copy), v80 (copy), l_Mutations_0 (ref), v5 (ref), v36 (ref), v37 (ref)
                    local v88 = true;
                    v17.OnUpdateEnabled:Connect(function() --[[ Line: 324 ]]
                        -- upvalues: v82 (ref), v6 (ref), v79 (ref), l_LimitedMutation_0 (ref), v80 (ref), v17 (ref)
                        local l_v82_0 = v82;
                        local l_v6_Instant_1 = v6:GetInstant(("%*Timer"):format(v79), l_LimitedMutation_0);
                        local v91 = not v80.Update or v17.Methods.IsEnabled(v80.Update);
                        local v92 = l_v6_Instant_1 - workspace:GetServerTimeNow();
                        local v93 = false;
                        if v92 > 0 then
                            v93 = v91;
                        end;
                        l_v82_0.Visible = v93;
                    end);
                    v17.OnUpdateDisabled:Connect(function() --[[ Line: 328 ]]
                        -- upvalues: v82 (ref), v6 (ref), v79 (ref), l_LimitedMutation_0 (ref), v80 (ref), v17 (ref)
                        local l_v82_1 = v82;
                        local l_v6_Instant_2 = v6:GetInstant(("%*Timer"):format(v79), l_LimitedMutation_0);
                        local v96 = not v80.Update or v17.Methods.IsEnabled(v80.Update);
                        local v97 = l_v6_Instant_2 - workspace:GetServerTimeNow();
                        local v98 = false;
                        if v97 > 0 then
                            v98 = v96;
                        end;
                        l_v82_1.Visible = v98;
                    end);
                    while v82.Parent == l_Mutations_0 do
                        local v99 = v6:GetInstant(("%*Timer"):format(v79), l_LimitedMutation_0) - workspace:GetServerTimeNow();
                        v82.Timer.Text = v5:E(v99);
                        v82.Timer.Visible = v99 > 0;
                        if v99 <= 0 and not v88 then
                            v88 = true;
                            v82.TextLabel.Position = UDim2.fromScale(0.5, 0.5);
                            v82.TextLabel.Size = UDim2.fromScale(0.85, 0.55);
                            v82.TextLabel.AnchorPoint = Vector2.new(0.5, 0.5);
                            local l_v82_2 = v82;
                            local l_v6_Instant_3 = v6:GetInstant(("%*Timer"):format(v79), l_LimitedMutation_0);
                            local v102 = not v80.Update or v17.Methods.IsEnabled(v80.Update);
                            local v103 = l_v6_Instant_3 - workspace:GetServerTimeNow();
                            local v104 = false;
                            if v103 > 0 then
                                v104 = v102;
                            end;
                            l_v82_2.Visible = v104;
                            if v36 == v79 then
                                v36 = "Default";
                                v37:Fire(v36);
                            end;
                        elseif v99 > 0 and v88 then
                            v88 = false;
                            v82.TextLabel.Position = UDim2.fromScale(0.5, 0);
                            v82.TextLabel.Size = UDim2.fromScale(0.85, 0.65);
                            v82.TextLabel.AnchorPoint = Vector2.new(0.5, 0);
                            local l_v82_3 = v82;
                            local l_v6_Instant_4 = v6:GetInstant(("%*Timer"):format(v79), l_LimitedMutation_0);
                            local v107 = not v80.Update or v17.Methods.IsEnabled(v80.Update);
                            local v108 = l_v6_Instant_4 - workspace:GetServerTimeNow();
                            local v109 = false;
                            if v108 > 0 then
                                v109 = v107;
                            end;
                            l_v82_3.Visible = v109;
                        end;
                        task.wait(1);
                    end;
                end);
            end;
            local v110 = v21.new(v82);
            v110:Animate();
            v110.OnActivated:Connect(function() --[[ Line: 366 ]]
                -- upvalues: v36 (ref), v79 (copy), v37 (ref)
                if v36 == v79 then
                    return;
                else
                    v36 = v79;
                    v37:Fire(v36);
                    return;
                end;
            end);
        end;
    end;
    local v111 = 0;
    local v112 = 0;
    local v113 = 0;
    local l_zero_0 = Vector2.zero;
    local l_zero_1 = Vector2.zero;
    local v116 = nil;
    local v117 = nil;
    local l_UIGridLayout_0 = l_List_0.UIGridLayout;
    do
        local l_v111_0, l_v112_0, l_v113_0, l_l_zero_0_0, l_l_zero_1_0, l_v116_0, l_v117_0 = v111, v112, v113, l_zero_0, l_zero_1, v116, v117;
        local function v127() --[[ Line: 388 ]] --[[ Name: updateSize ]]
            -- upvalues: l_l_zero_0_0 (ref), l_List_0 (ref), l_v112_0 (ref), l_UIGridLayout_0 (copy), l_v117_0 (ref)
            l_l_zero_0_0 = l_List_0.AbsoluteSize;
            l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
            local l_CellPadding_0 = l_UIGridLayout_0.CellPadding;
            l_v117_0 = l_CellPadding_0.Y.Scale * l_l_zero_0_0.Y + l_CellPadding_0.Y.Offset;
        end;
        local function _() --[[ Line: 395 ]] --[[ Name: updatePosition ]]
            -- upvalues: l_v111_0 (ref), l_List_0 (ref), l_v112_0 (ref), l_l_zero_0_0 (ref)
            l_v111_0 = l_List_0.AbsolutePosition.Y;
            l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
        end;
        local v129 = false;
        local function v130() --[[ Line: 401 ]] --[[ Name: updateWindowTop ]]
            -- upvalues: l_v113_0 (ref), l_v111_0 (ref), l_List_0 (ref), v129 (ref), l_Index_0 (ref)
            l_v113_0 = l_v111_0 - l_List_0.CanvasPosition.Y;
            v129 = l_Index_0.Visible;
        end;
        l_l_zero_0_0 = l_List_0.AbsoluteSize;
        l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
        local l_CellPadding_1 = l_UIGridLayout_0.CellPadding;
        l_v117_0 = l_CellPadding_1.Y.Scale * l_l_zero_0_0.Y + l_CellPadding_1.Y.Offset;
        l_v111_0 = l_List_0.AbsolutePosition.Y;
        l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
        l_v113_0 = l_v111_0 - l_List_0.CanvasPosition.Y;
        v129 = l_Index_0.Visible;
        l_l_zero_1_0 = l_UIGridLayout_0.AbsoluteCellCount;
        l_v116_0 = l_UIGridLayout_0.AbsoluteCellSize;
        l_UIGridLayout_0:GetPropertyChangedSignal("AbsoluteCellCount"):Connect(function() --[[ Line: 413 ]]
            -- upvalues: l_l_zero_1_0 (ref), l_UIGridLayout_0 (copy)
            l_l_zero_1_0 = l_UIGridLayout_0.AbsoluteCellCount;
        end);
        l_UIGridLayout_0:GetPropertyChangedSignal("AbsoluteCellSize"):Connect(function() --[[ Line: 417 ]]
            -- upvalues: l_v116_0 (ref), l_UIGridLayout_0 (copy)
            l_v116_0 = l_UIGridLayout_0.AbsoluteCellSize;
        end);
        l_UIGridLayout_0:GetPropertyChangedSignal("CellPadding"):Connect(function() --[[ Line: 421 ]]
            -- upvalues: l_UIGridLayout_0 (copy), l_v117_0 (ref), l_l_zero_0_0 (ref)
            local l_CellPadding_2 = l_UIGridLayout_0.CellPadding;
            l_v117_0 = l_CellPadding_2.Y.Scale * l_l_zero_0_0.Y + l_CellPadding_2.Y.Offset;
        end);
        l_List_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v127);
        l_List_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 427 ]]
            -- upvalues: l_v111_0 (ref), l_List_0 (ref), l_v112_0 (ref), l_l_zero_0_0 (ref), l_v113_0 (ref), v129 (ref), l_Index_0 (ref)
            l_v111_0 = l_List_0.AbsolutePosition.Y;
            l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
            l_v113_0 = l_v111_0 - l_List_0.CanvasPosition.Y;
            v129 = l_Index_0.Visible;
        end);
        l_List_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v130);
        l_Index_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 432 ]]
            -- upvalues: l_v111_0 (ref), l_List_0 (ref), l_v112_0 (ref), l_l_zero_0_0 (ref), l_UIGridLayout_0 (copy), l_v117_0 (ref), l_v113_0 (ref), v129 (ref), l_Index_0 (ref)
            l_v111_0 = l_List_0.AbsolutePosition.Y;
            l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
            l_l_zero_0_0 = l_List_0.AbsoluteSize;
            l_v112_0 = l_List_0.AbsolutePosition.Y + l_l_zero_0_0.Y;
            local l_CellPadding_3 = l_UIGridLayout_0.CellPadding;
            l_v117_0 = l_CellPadding_3.Y.Scale * l_l_zero_0_0.Y + l_CellPadding_3.Y.Offset;
            l_v113_0 = l_v111_0 - l_List_0.CanvasPosition.Y;
            v129 = l_Index_0.Visible;
        end);
        l_CellPadding_1 = {};
        local v134 = false;
        local function v144() --[[ Line: 440 ]] --[[ Name: resortGrid ]]
            -- upvalues: v134 (ref), l_List_0 (ref), l_CellPadding_1 (copy)
            if v134 then
                return;
            else
                v134 = true;
                task.defer(function() --[[ Line: 445 ]]
                    -- upvalues: v134 (ref), l_List_0 (ref), l_CellPadding_1 (ref)
                    v134 = false;
                    local l_l_List_0_Children_0 = l_List_0:GetChildren();
                    local v136 = {};
                    local v137 = {};
                    local v138 = {};
                    for v139 = #l_l_List_0_Children_0, 1, -1 do
                        if not l_l_List_0_Children_0[v139]:IsA("GuiObject") or not l_l_List_0_Children_0[v139].Visible then
                            table.remove(l_l_List_0_Children_0, v139);
                        else
                            v137[l_l_List_0_Children_0[v139]] = l_l_List_0_Children_0[v139].Name;
                            v136[l_l_List_0_Children_0[v139]] = l_l_List_0_Children_0[v139].LayoutOrder;
                            v138[l_l_List_0_Children_0[v139]] = v139;
                        end;
                    end;
                    table.sort(l_l_List_0_Children_0, function(v140, v141) --[[ Line: 461 ]]
                        -- upvalues: v136 (copy), v137 (copy), v138 (copy)
                        if v136[v140] == v136[v141] then
                            if v137[v140] == v137[v141] then
                                return v138[v140] < v138[v141];
                            else
                                return v137[v140] < v137[v141];
                            end;
                        else
                            return v136[v140] < v136[v141];
                        end;
                    end);
                    table.clear(l_CellPadding_1);
                    for v142, v143 in l_l_List_0_Children_0 do
                        l_CellPadding_1[v143] = v142;
                    end;
                end);
                return;
            end;
        end;
        if not v134 then
            v134 = true;
            task.defer(function() --[[ Line: 445 ]]
                -- upvalues: v134 (ref), l_List_0 (ref), l_CellPadding_1 (copy)
                v134 = false;
                local l_l_List_0_Children_1 = l_List_0:GetChildren();
                local v146 = {};
                local v147 = {};
                local v148 = {};
                for v149 = #l_l_List_0_Children_1, 1, -1 do
                    if not l_l_List_0_Children_1[v149]:IsA("GuiObject") or not l_l_List_0_Children_1[v149].Visible then
                        table.remove(l_l_List_0_Children_1, v149);
                    else
                        v147[l_l_List_0_Children_1[v149]] = l_l_List_0_Children_1[v149].Name;
                        v146[l_l_List_0_Children_1[v149]] = l_l_List_0_Children_1[v149].LayoutOrder;
                        v148[l_l_List_0_Children_1[v149]] = v149;
                    end;
                end;
                table.sort(l_l_List_0_Children_1, function(v150, v151) --[[ Line: 461 ]]
                    -- upvalues: v146 (copy), v147 (copy), v148 (copy)
                    if v146[v150] == v146[v151] then
                        if v147[v150] == v147[v151] then
                            return v148[v150] < v148[v151];
                        else
                            return v147[v150] < v147[v151];
                        end;
                    else
                        return v146[v150] < v146[v151];
                    end;
                end);
                table.clear(l_CellPadding_1);
                for v152, v153 in l_l_List_0_Children_1 do
                    l_CellPadding_1[v153] = v152;
                end;
            end);
        end;
        l_List_0.UIGridLayout:GetPropertyChangedSignal("AbsoluteCellCount"):Connect(v144);
        l_RunService_0.Heartbeat:Connect(function() --[[ Line: 481 ]]
            -- upvalues: l_v116_0 (ref), v35 (ref), l_CellPadding_1 (copy), l_l_zero_1_0 (ref), l_v113_0 (ref), l_v117_0 (ref), v129 (ref), l_v111_0 (ref), l_v112_0 (ref)
            debug.profilebegin("Index::Cull");
            local v154 = 0;
            local v155 = l_v116_0.Y * 2;
            for v156, v157 in v35 do
                local v158 = l_CellPadding_1[v157.targetParent];
                local v159 = false;
                if v158 then
                    local v160 = math.ceil(v158 / l_l_zero_1_0.X) - 1;
                    local v161 = l_v113_0 + (l_v116_0.Y + l_v117_0) * v160 - l_v117_0;
                    local v162 = v161 + l_v116_0.Y;
                    v159 = v129 and v162 > l_v111_0 and v161 < l_v112_0 + v155;
                end;
                if v157.state ~= v159 then
                    v156.Parent = if v159 then v157.targetParent else nil;
                    v157.state = v159;
                    if v157.scheduledUpdate and v159 == true then
                        v157.scheduledUpdate();
                        v157.scheduledUpdate = nil;
                    end;
                end;
                v154 = v154 + 1;
            end;
            debug.profileend();
        end);
    end;
    v7:WaitAndCall(l_LocalPlayer_0, function(_) --[[ Line: 520 ]]
        -- upvalues: v39 (ref), v75 (ref), v38 (ref)
        v39.OnOpen:Connect(v75);
        v39.OnClose:Connect(function() --[[ Line: 522 ]]
            -- upvalues: v38 (ref)
            v38:Clean();
        end);
        if v39:IsOpened() then
            v75();
        end;
    end);
    v17.OnUpdateEnabled:Connect(function() --[[ Line: 536 ]]
        -- upvalues: v39 (ref), v37 (ref), v36 (ref), v75 (ref)
        if v39:IsOpened() then
            v37:Fire(v36);
            v75();
        end;
    end);
    v17.OnUpdateDisabled:Connect(function() --[[ Line: 543 ]]
        -- upvalues: v39 (ref), v75 (ref)
        if v39:IsOpened() then
            v75();
        end;
    end);
    v111 = function() --[[ Line: 556 ]] --[[ Name: updateDescription ]]
        -- upvalues: v36 (ref), v13 (ref), l_Description_0 (ref)
        if not v36 then
            return;
        else
            local v164 = v13[v36];
            local v165 = v164 and v164.CompletitionPercent or v36 == "Default" and 0.75 or 1;
            local v166 = Color3.new(1, 1, 1);
            if v36 ~= "Default" and v36 ~= nil and v164 then
                v166 = v164.MainColor;
            end;
            local v167 = not v164 or not v164.LimitedMutation;
            local v168 = v164 and v164.DisplayWithRichText or ("<font color=\"#%*\">%*</font>"):format(v166:ToHex(), v36);
            l_Description_0.Text = if v36 == "Default" then ("Collect %*%% Normal Brainrots for +0.5x Base Multi"):format((math.ceil(v165 * 100))) else if v36 == "Halloween" then ("Collect %*%% %* Brainrots for a <font color=\"#%*\">%* Base</font>"):format(math.ceil(v165 * 100), v168, v166:ToHex(), v168) else ("Collect %*%% %* Brainrots for %*a <font color=\"#%*\">%* Base</font>"):format(math.ceil(v165 * 100), v168, v167 and "+0.5x Base Multi and " or "", v166:ToHex(), v168);
            return;
        end;
    end;
    v37:Connect(v111);
    v111();
end;
return v40;