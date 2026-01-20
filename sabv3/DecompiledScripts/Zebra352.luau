local v0 = require(script.Parent.Parent.ColorSequenceUtils);
local v1 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
    ColorSequenceKeypoint.new(0.015625, Color3.new(1, 1, 1)), 
    ColorSequenceKeypoint.new(0.1458333283662796, Color3.new(1, 1, 1)), 
    ColorSequenceKeypoint.new(0.2482638955116272, Color3.new(1, 1, 1)), 
    ColorSequenceKeypoint.new(0.3559027910232544, Color3.new(1, 1, 1)), 
    ColorSequenceKeypoint.new(0.4970000088214874, Color3.new(1, 1, 1)), 
    ColorSequenceKeypoint.new(0.503000020980835, Color3.new(0, 0, 0)), 
    ColorSequenceKeypoint.new(0.647569477558136, Color3.new(0, 0, 0)), 
    ColorSequenceKeypoint.new(0.7829861044883728, Color3.new(0, 0, 0)), 
    ColorSequenceKeypoint.new(0.890625, Color3.new(0, 0, 0)), 
    ColorSequenceKeypoint.new(0.9774305820465088, Color3.new(0, 0, 0)), 
    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
});
local v2 = 0;
return {
    simulate = function(v3) --[[ Line: 22 ]] --[[ Name: simulate ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        v2 = v2 + v3 * 0.5;
        return {
            main = v0.calculateColorSequence(v1, v2), 
            stroke = v0.calculateColorSequence(v1, v2 + 0.5)
        };
    end, 
    apply = function(v4) --[[ Line: 29 ]] --[[ Name: apply ]]
        local v5 = {};
        local function _(v6, v7, v8) --[[ Line: 32 ]] --[[ Name: modifyAndRestore ]]
            -- upvalues: v5 (copy)
            local v9 = v6[v7];
            v6[v7] = v8;
            table.insert(v5, 1, function() --[[ Line: 35 ]]
                -- upvalues: v6 (copy), v7 (copy), v9 (copy)
                v6[v7] = v9;
            end);
        end;
        local function v15(v11, v12) --[[ Line: 40 ]] --[[ Name: useOrCreate ]]
            -- upvalues: v5 (copy)
            local l_v11_FirstChildWhichIsA_0 = v11:FindFirstChildWhichIsA(v12);
            if not l_v11_FirstChildWhichIsA_0 then
                local v14 = Instance.new(v12);
                v14.Parent = v11;
                table.insert(v5, 1, function() --[[ Line: 45 ]]
                    -- upvalues: v14 (copy)
                    v14:Destroy();
                end);
                l_v11_FirstChildWhichIsA_0 = v14;
            end;
            return l_v11_FirstChildWhichIsA_0;
        end;
        if v4:IsA("TextLabel") then
            local v16 = Color3.new(1, 1, 1);
            local l_TextColor3_0 = v4.TextColor3;
            v4.TextColor3 = v16;
            local v18 = 1;
            local v19 = "TextColor3";
            local l_v19_0 = v19 --[[ copy: 10 -> 26 ]];
            local l_l_TextColor3_0_0 = l_TextColor3_0 --[[ copy: 5 -> 27 ]];
            table.insert(v5, v18, function() --[[ Line: 35 ]]
                -- upvalues: v4 (copy), l_v19_0 (copy), l_l_TextColor3_0_0 (copy)
                v4[l_v19_0] = l_l_TextColor3_0_0;
            end);
        end;
        local v22 = v15(v4, "UIGradient");
        local v23 = v15(v4, "UIStroke");
        local v24 = v15(v23, "UIGradient");
        local v25 = Color3.new(1, 1, 1);
        local l_Color_0 = v23.Color;
        v23.Color = v25;
        local v27 = 1;
        local v28 = "Color";
        local l_v28_0 = v28 --[[ copy: 13 -> 15 ]];
        local l_l_Color_0_0 = l_Color_0 --[[ copy: 8 -> 16 ]];
        table.insert(v5, v27, function() --[[ Line: 35 ]]
            -- upvalues: v23 (copy), l_v28_0 (copy), l_l_Color_0_0 (copy)
            v23[l_v28_0] = l_l_Color_0_0;
        end);
        v25 = v23.Thickness;
        v23.Thickness = 1;
        local v31 = 1;
        local v32 = "Thickness";
        local l_v32_0 = v32 --[[ copy: 12 -> 17 ]];
        local l_v25_0 = v25 --[[ copy: 7 -> 18 ]];
        table.insert(v5, v31, function() --[[ Line: 35 ]]
            -- upvalues: v23 (copy), l_v32_0 (copy), l_v25_0 (copy)
            v23[l_v32_0] = l_v25_0;
        end);
        v25 = v23.Transparency;
        v23.Transparency = 0;
        v31 = 1;
        v32 = "Transparency";
        local l_v32_1 = v32 --[[ copy: 12 -> 19 ]];
        local l_v25_1 = v25 --[[ copy: 7 -> 20 ]];
        table.insert(v5, v31, function() --[[ Line: 35 ]]
            -- upvalues: v23 (copy), l_v32_1 (copy), l_v25_1 (copy)
            v23[l_v32_1] = l_v25_1;
        end);
        v25 = v23:GetPropertyChangedSignal("Thickness"):Connect(function() --[[ Line: 65 ]]
            -- upvalues: v23 (copy)
            if v23.Thickness ~= 1 then
                v23.Thickness = 1;
            end;
        end);
        l_Color_0 = v22.Rotation;
        v22.Rotation = 90;
        v27 = 1;
        v28 = "Rotation";
        local l_v28_1 = v28 --[[ copy: 13 -> 21 ]];
        local l_l_Color_0_1 = l_Color_0 --[[ copy: 8 -> 22 ]];
        table.insert(v5, v27, function() --[[ Line: 35 ]]
            -- upvalues: v22 (copy), l_v28_1 (copy), l_l_Color_0_1 (copy)
            v22[l_v28_1] = l_l_Color_0_1;
        end);
        l_Color_0 = NumberSequence.new(0);
        local l_Transparency_0 = v22.Transparency;
        v22.Transparency = l_Color_0;
        v32 = 1;
        local v40 = "Transparency";
        local l_v40_0 = v40 --[[ copy: 14 -> 23 ]];
        local l_l_Transparency_0_0 = l_Transparency_0 --[[ copy: 9 -> 24 ]];
        table.insert(v5, v32, function() --[[ Line: 35 ]]
            -- upvalues: v22 (copy), l_v40_0 (copy), l_l_Transparency_0_0 (copy)
            v22[l_v40_0] = l_l_Transparency_0_0;
        end);
        l_Color_0 = v24.Rotation;
        v24.Rotation = 90;
        v27 = 1;
        v28 = "Rotation";
        local l_l_Color_0_2 = l_Color_0 --[[ copy: 8 -> 25 ]];
        table.insert(v5, v27, function() --[[ Line: 35 ]]
            -- upvalues: v24 (copy), v28 (copy), l_l_Color_0_2 (copy)
            v24[v28] = l_l_Color_0_2;
        end);
        l_Color_0 = NumberSequence.new(0);
        l_Transparency_0 = v24.Transparency;
        v24.Transparency = l_Color_0;
        v32 = 1;
        v40 = "Transparency";
        table.insert(v5, v32, function() --[[ Line: 35 ]]
            -- upvalues: v24 (copy), v40 (copy), l_Transparency_0 (copy)
            v24[v40] = l_Transparency_0;
        end);
        return {
            main = v22, 
            stroke = v24, 
            cleanup = function() --[[ Line: 81 ]] --[[ Name: cleanup ]]
                -- upvalues: v25 (copy), v5 (copy)
                v25:Disconnect();
                for _, v45 in v5 do
                    v45();
                end;
            end
        };
    end
};