local l_create_0 = require("../../roblox_packages/vide").create;
return function() --[[ Line: 5 ]]
    -- upvalues: l_create_0 (copy)
    local v1 = l_create_0("UIListLayout")({});
    return (setmetatable({
        v1
    }, {
        __index = {
            row = function(v2) --[[ Line: 10 ]] --[[ Name: row ]]
                -- upvalues: v1 (copy)
                v1.FillDirection = Enum.FillDirection.Vertical;
                return v2;
            end, 
            column = function(v3) --[[ Line: 15 ]] --[[ Name: column ]]
                -- upvalues: v1 (copy)
                v1.FillDirection = Enum.FillDirection.Horizontal;
                return v3;
            end, 
            layout = function(v4) --[[ Line: 20 ]] --[[ Name: layout ]]
                -- upvalues: v1 (copy)
                v1.SortOrder = Enum.SortOrder.LayoutOrder;
                return v4;
            end, 
            name = function(v5) --[[ Line: 25 ]] --[[ Name: name ]]
                -- upvalues: v1 (copy)
                v1.SortOrder = Enum.SortOrder.Name;
                return v5;
            end, 
            none = function(v6, v7) --[[ Line: 30 ]] --[[ Name: none ]]
                -- upvalues: v1 (copy)
                if v7 ~= "vertical" then
                    v1.HorizontalFlex = Enum.UIFlexAlignment.None;
                end;
                if v7 ~= "horizontal" then
                    v1.VerticalFlex = Enum.UIFlexAlignment.None;
                end;
                return v6;
            end, 
            even = function(v8, v9) --[[ Line: 40 ]] --[[ Name: even ]]
                -- upvalues: v1 (copy)
                if v9 ~= "vertical" then
                    v1.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly;
                end;
                if v9 ~= "horizontal" then
                    v1.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly;
                end;
                return v8;
            end, 
            around = function(v10, v11) --[[ Line: 50 ]] --[[ Name: around ]]
                -- upvalues: v1 (copy)
                if v11 ~= "vertical" then
                    v1.HorizontalFlex = Enum.UIFlexAlignment.SpaceAround;
                end;
                if v11 ~= "horizontal" then
                    v1.VerticalFlex = Enum.UIFlexAlignment.SpaceAround;
                end;
                return v10;
            end, 
            between = function(v12, v13) --[[ Line: 60 ]] --[[ Name: between ]]
                -- upvalues: v1 (copy)
                if v13 ~= "vertical" then
                    v1.HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween;
                end;
                if v13 ~= "horizontal" then
                    v1.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween;
                end;
                return v12;
            end, 
            fill = function(v14, v15) --[[ Line: 70 ]] --[[ Name: fill ]]
                -- upvalues: v1 (copy)
                if v15 ~= "vertical" then
                    v1.HorizontalFlex = Enum.UIFlexAlignment.Fill;
                end;
                if v15 ~= "horizontal" then
                    v1.VerticalFlex = Enum.UIFlexAlignment.Fill;
                end;
                return v14;
            end, 
            horizontal = function(v16, v17) --[[ Line: 80 ]] --[[ Name: horizontal ]]
                -- upvalues: v1 (copy)
                v1.HorizontalAlignment = if v17 == "left" then Enum.HorizontalAlignment.Left else if v17 == "right" then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center;
                return v16;
            end, 
            vertical = function(v18, v19) --[[ Line: 88 ]] --[[ Name: vertical ]]
                -- upvalues: v1 (copy)
                v1.VerticalAlignment = if v19 == "top" then Enum.VerticalAlignment.Top else if v19 == "bottom" then Enum.VerticalAlignment.Bottom else Enum.VerticalAlignment.Center;
                return v18;
            end, 
            gap = function(v20, v21) --[[ Line: 96 ]] --[[ Name: gap ]]
                -- upvalues: v1 (copy)
                v1.Padding = UDim.new(0, v21);
                return v20;
            end
        }
    }));
end;