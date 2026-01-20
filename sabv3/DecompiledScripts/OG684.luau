local v0 = require(script.Parent.Parent.ColorSequenceUtils);
local v1 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 0)), 
    ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)), 
    ColorSequenceKeypoint.new(1, Color3.new(1, 1, 0))
});
local v2 = 0;
return {
    simulate = function(v3) --[[ Line: 13 ]] --[[ Name: simulate ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        v2 = v2 + v3 * 1;
        return {
            main = v0.calculateColorSequence(v1, v2)
        };
    end, 
    apply = function(v4) --[[ Line: 20 ]] --[[ Name: apply ]]
        local v5 = {};
        local function _(v6, v7, v8) --[[ Line: 23 ]] --[[ Name: modifyAndRestore ]]
            -- upvalues: v5 (copy)
            local v9 = v6[v7];
            v6[v7] = v8;
            table.insert(v5, 1, function() --[[ Line: 26 ]]
                -- upvalues: v6 (copy), v7 (copy), v9 (copy)
                v6[v7] = v9;
            end);
        end;
        local function v15(v11, v12) --[[ Line: 31 ]] --[[ Name: useOrCreate ]]
            -- upvalues: v5 (copy)
            local l_v11_FirstChildWhichIsA_0 = v11:FindFirstChildWhichIsA(v12);
            if not l_v11_FirstChildWhichIsA_0 then
                local v14 = Instance.new(v12);
                v14.Parent = v11;
                table.insert(v5, 1, function() --[[ Line: 36 ]]
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
            local l_v19_0 = v19 --[[ copy: 10 -> 21 ]];
            local l_l_TextColor3_0_0 = l_TextColor3_0 --[[ copy: 5 -> 22 ]];
            table.insert(v5, v18, function() --[[ Line: 26 ]]
                -- upvalues: v4 (copy), l_v19_0 (copy), l_l_TextColor3_0_0 (copy)
                v4[l_v19_0] = l_l_TextColor3_0_0;
            end);
        end;
        local v22 = v15(v4, "UIGradient");
        local v23 = v15(v4, "UIStroke");
        local v24 = v15(v23, "UIGradient");
        local v25 = Color3.new(0, 0, 0);
        local l_Color_0 = v23.Color;
        v23.Color = v25;
        local v27 = 1;
        local v28 = "Color";
        local l_v28_0 = v28 --[[ copy: 13 -> 14 ]];
        local l_l_Color_0_0 = l_Color_0 --[[ copy: 8 -> 15 ]];
        table.insert(v5, v27, function() --[[ Line: 26 ]]
            -- upvalues: v23 (copy), l_v28_0 (copy), l_l_Color_0_0 (copy)
            v23[l_v28_0] = l_l_Color_0_0;
        end);
        v25 = v22.Rotation;
        v22.Rotation = 90;
        local v31 = 1;
        local v32 = "Rotation";
        local l_v32_0 = v32 --[[ copy: 12 -> 16 ]];
        local l_v25_0 = v25 --[[ copy: 7 -> 17 ]];
        table.insert(v5, v31, function() --[[ Line: 26 ]]
            -- upvalues: v22 (copy), l_v32_0 (copy), l_v25_0 (copy)
            v22[l_v32_0] = l_v25_0;
        end);
        v25 = NumberSequence.new(0);
        l_Color_0 = v22.Transparency;
        v22.Transparency = v25;
        v27 = 1;
        v28 = "Transparency";
        local l_v28_1 = v28 --[[ copy: 13 -> 18 ]];
        local l_l_Color_0_1 = l_Color_0 --[[ copy: 8 -> 19 ]];
        table.insert(v5, v27, function() --[[ Line: 26 ]]
            -- upvalues: v22 (copy), l_v28_1 (copy), l_l_Color_0_1 (copy)
            v22[l_v28_1] = l_l_Color_0_1;
        end);
        v25 = v24.Rotation;
        v24.Rotation = 90;
        v31 = 1;
        v32 = "Rotation";
        local l_v25_1 = v25 --[[ copy: 7 -> 20 ]];
        table.insert(v5, v31, function() --[[ Line: 26 ]]
            -- upvalues: v24 (copy), v32 (copy), l_v25_1 (copy)
            v24[v32] = l_v25_1;
        end);
        v25 = NumberSequence.new(0);
        l_Color_0 = v24.Transparency;
        v24.Transparency = v25;
        v27 = 1;
        v28 = "Transparency";
        table.insert(v5, v27, function() --[[ Line: 26 ]]
            -- upvalues: v24 (copy), v28 (copy), l_Color_0 (copy)
            v24[v28] = l_Color_0;
        end);
        return {
            main = v22, 
            stroke = v24, 
            cleanup = function() --[[ Line: 72 ]] --[[ Name: cleanup ]]
                -- upvalues: v5 (copy)
                for _, v39 in v5 do
                    v39();
                end;
            end
        };
    end
};