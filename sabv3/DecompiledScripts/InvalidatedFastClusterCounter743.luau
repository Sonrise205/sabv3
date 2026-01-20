local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
if not l_RunService_0:IsStudio() then
    return;
else
    local v3 = require(l_ReplicatedStorage_0.Packages.Trove);
    local v4 = require(l_ReplicatedStorage_0.Packages.Signal);
    local v5 = v4.new();
    local v6 = v4.new();
    local v7 = false;
    local v8 = table.create(256);
    for v9 = 1, 256 do
        v8[v9] = {};
    end;
    local v10 = {};
    local function v22(v11) --[[ Line: 29 ]] --[[ Name: watchModel ]]
        -- upvalues: v10 (copy), v3 (copy), v7 (ref), v6 (copy), v8 (copy)
        if v10[v11] then
            return;
        else
            local v12 = v3.new();
            v12:AttachToInstance(v11);
            v10[v11] = v12;
            v12:Add(function() --[[ Line: 38 ]]
                -- upvalues: v10 (ref), v11 (copy)
                v10[v11] = nil;
            end);
            local v13 = false;
            local function _() --[[ Line: 43 ]] --[[ Name: onInvalidated ]]
                -- upvalues: v7 (ref), v13 (ref), v6 (ref), v8 (ref), v11 (copy)
                if v7 then
                    return;
                elseif v13 then
                    return;
                else
                    v13 = true;
                    v6:Once(function() --[[ Line: 49 ]]
                        -- upvalues: v13 (ref), v8 (ref), v11 (ref)
                        v13 = false;
                        table.insert(v8[#v8], v11);
                    end);
                    return;
                end;
            end;
            local v15 = {};
            local function v18(v16) --[[ Line: 56 ]] --[[ Name: watchProperties ]]
                -- upvalues: v7 (ref), v13 (ref), v6 (ref), v8 (ref), v11 (copy), v12 (copy), v15 (copy)
                if not v7 and not v13 then
                    v13 = true;
                    v6:Once(function() --[[ Line: 49 ]]
                        -- upvalues: v13 (ref), v8 (ref), v11 (ref)
                        v13 = false;
                        table.insert(v8[#v8], v11);
                    end);
                end;
                local v17 = v12:Extend();
                v17:AttachToInstance(v16);
                v15[v16] = v17;
                v17:Add(function() --[[ Line: 63 ]]
                    -- upvalues: v15 (ref), v16 (copy)
                    v15[v16] = nil;
                end);
                v17:Add(v16.Changed:Connect(function() --[[ Line: 67 ]]
                    -- upvalues: v7 (ref), v13 (ref), v6 (ref), v8 (ref), v11 (ref)
                    if v7 then
                        return;
                    elseif v13 then
                        return;
                    else
                        v13 = true;
                        v6:Once(function() --[[ Line: 49 ]]
                            -- upvalues: v13 (ref), v8 (ref), v11 (ref)
                            v13 = false;
                            table.insert(v8[#v8], v11);
                        end);
                        return;
                    end;
                end));
            end;
            if not v7 and not v13 then
                v13 = true;
                v6:Once(function() --[[ Line: 49 ]]
                    -- upvalues: v13 (ref), v8 (ref), v11 (copy)
                    v13 = false;
                    table.insert(v8[#v8], v11);
                end);
            end;
            for _, v20 in v11:GetDescendants() do
                v18(v20);
            end;
            v12:Add(v11.DescendantAdded:Connect(v18));
            v12:Add(v11.DescendantRemoving:Connect(function(v21) --[[ Line: 77 ]]
                -- upvalues: v7 (ref), v13 (ref), v6 (ref), v8 (ref), v11 (copy), v15 (copy)
                if not v7 and not v13 then
                    v13 = true;
                    v6:Once(function() --[[ Line: 49 ]]
                        -- upvalues: v13 (ref), v8 (ref), v11 (ref)
                        v13 = false;
                        table.insert(v8[#v8], v11);
                    end);
                end;
                if v15[v21] then
                    v15[v21]:Destroy();
                end;
            end));
            return;
        end;
    end;
    for _, v24 in workspace:QueryDescendants("Model > MeshPart [HasSkinnedMesh = true]") do
        local l_v24_FirstAncestor_0 = v24:FindFirstAncestor("Model");
        if l_v24_FirstAncestor_0 then
            v22(l_v24_FirstAncestor_0);
        end;
    end;
    workspace.DescendantAdded:Connect(function(v26) --[[ Line: 92 ]]
        -- upvalues: v22 (copy)
        if v26.ClassName == "MeshPart" then
            local l_v26_FirstAncestorOfClass_0 = v26:FindFirstAncestorOfClass("Model");
            if not l_v26_FirstAncestorOfClass_0 then
                return;
            else
                v22(l_v26_FirstAncestorOfClass_0);
            end;
        end;
    end);
    local l_FastClusterCounters_0 = script.FastClusterCounters;
    l_FastClusterCounters_0.Enabled = true;
    l_FastClusterCounters_0.Parent = game.Players.LocalPlayer.PlayerGui;
    local v29 = {};
    for v30 = 1, 256 do
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 93, 87);
        l_Frame_0.LayoutOrder = v30;
        l_Frame_0.Position = UDim2.fromScale(v30 / 256, 1);
        l_Frame_0.AnchorPoint = Vector2.new(0, 1);
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.Parent = l_FastClusterCounters_0.Frame.Bars;
        l_Frame_0.MouseEnter:Connect(function() --[[ Line: 116 ]]

        end);
        v29[v30] = l_Frame_0;
    end;
    l_RunService_0.RenderStepped:Connect(function() --[[ Line: 122 ]]
        -- upvalues: v6 (copy), v7 (ref), v8 (copy), v29 (copy), l_FastClusterCounters_0 (copy), v5 (copy)
        v6:Fire();
        if not v7 then
            table.remove(v8, 1);
            v8[#v8 + 1] = 0;
        end;
        local v32 = math.max(24, (math.max(unpack(v8))));
        local _ = {};
        for v34 = 1, 256 do
            local v35 = v8[v34];
            if not v35 or v32 == 0 then
                v29[v34].Size = UDim2.fromScale(0.00390625, 0);
            else
                v29[v34].Size = UDim2.fromScale(0.00390625, (math.clamp(v35 / v32, 0, 1)));
            end;
        end;
        l_FastClusterCounters_0.Frame.ValueMax.Text = v32;
        l_FastClusterCounters_0.Frame.ValueHalf.Text = v32 // 2;
        l_FastClusterCounters_0.Frame.ValueZero.Text = "0";
        v5:Fire();
    end);
    l_UserInputService_0.InputBegan:Connect(function(v36) --[[ Line: 151 ]]
        -- upvalues: l_UserInputService_0 (copy), v7 (ref), l_FastClusterCounters_0 (copy), v6 (copy), v8 (copy)
        if v36.KeyCode == Enum.KeyCode.P and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
            v7 = true;
            return;
        elseif v36.KeyCode == Enum.KeyCode.O and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
            v7 = false;
            return;
        elseif v36.KeyCode == Enum.KeyCode.L and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
            l_FastClusterCounters_0.Enabled = not l_FastClusterCounters_0.Enabled;
            return;
        else
            if v36.KeyCode == Enum.KeyCode.E then
                v6:Once(function() --[[ Line: 159 ]]
                    -- upvalues: v8 (ref)
                    v8[#v8] = math.random(1, 24);
                end);
            end;
            return;
        end;
    end);
    return;
end;