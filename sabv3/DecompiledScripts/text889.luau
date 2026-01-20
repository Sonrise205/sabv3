local v0 = require("../theme");
local v1 = require("../../roblox_packages/vide");
local l_create_0 = v1.create;
local l_read_0 = v1.read;
return function(v4) --[[ Line: 23 ]]
    -- upvalues: l_create_0 (copy), l_read_0 (copy), v0 (copy)
    return l_create_0("TextLabel")({
        Size = function() --[[ Line: 25 ]] --[[ Name: Size ]]
            -- upvalues: l_read_0 (ref), v4 (copy)
            return UDim2.fromOffset(l_read_0(v4.width) or 0, l_read_0(v4.height) or 0);
        end, 
        AutomaticSize = if v4.width and v4.height then nil else if v4.width then Enum.AutomaticSize.Y else Enum.AutomaticSize.X, 
        Text = v4.text, 
        TextSize = v4.text_size, 
        TextColor3 = function() --[[ Line: 38 ]] --[[ Name: TextColor3 ]]
            -- upvalues: v4 (copy), l_read_0 (ref), v0 (ref)
            local l_text_style_0 = v4.text_style;
            if l_read_0(l_text_style_0) == "normal" then
                return (v0.text());
            elseif l_read_0(l_text_style_0) == "warn" then
                return (v0.text_warn());
            elseif l_read_0(l_text_style_0) == "error" then
                return (v0.text_error());
            elseif l_read_0(l_text_style_0) == "info" then
                return (v0.text_info());
            else
                return (v0.text());
            end;
        end, 
        FontFace = function() --[[ Line: 47 ]] --[[ Name: FontFace ]]
            -- upvalues: v0 (ref), l_read_0 (ref), v4 (copy)
            local v6 = v0.font();
            local v7 = l_read_0(v4.weight) or Enum.FontWeight.Regular;
            return Font.new(v6.Family, v7);
        end, 
        TextWrapped = v4.wrapped, 
        TextXAlignment = v4.xalignment, 
        LayoutOrder = v4.order, 
        BackgroundTransparency = 1; 
        unpack(v4)
    });
end;