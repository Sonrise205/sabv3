local v0 = require("../theme");
local v1 = require("../../roblox_packages/vide");
local l_create_0 = v1.create;
local l_source_0 = v1.source;
local l_cleanup_0 = v1.cleanup;
local l_read_0 = v1.read;
local v6 = {
    "-", 
    "/", 
    "|", 
    "\\"
};
return function(v7) --[[ Line: 34 ]]
    -- upvalues: l_source_0 (copy), l_cleanup_0 (copy), l_create_0 (copy), l_read_0 (copy), v6 (copy), v0 (copy)
    local v8 = l_source_0(0);
    local v9 = task.spawn(function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy)
        while true do
            v8(v8() + task.wait());
        end;
    end);
    l_cleanup_0(function() --[[ Line: 42 ]]
        -- upvalues: v9 (copy)
        task.cancel(v9);
    end);
    return l_create_0("TextLabel")({
        Size = function() --[[ Line: 45 ]] --[[ Name: Size ]]
            -- upvalues: l_read_0 (ref), v7 (copy)
            local v10 = l_read_0(v7.width);
            local v11 = l_read_0(v7.height);
            return UDim2.new(0, v10 or 0, 0, v11 or 0);
        end, 
        Position = function() --[[ Line: 49 ]] --[[ Name: Position ]]
            -- upvalues: l_read_0 (ref), v7 (copy)
            return UDim2.new(l_read_0(v7.xs) or 0, l_read_0(v7.x) or 0, l_read_0(v7.ys) or 0, l_read_0(v7.y) or 0);
        end, 
        AnchorPoint = v7.anchor and function() --[[ Line: 58 ]]
            -- upvalues: l_read_0 (ref), v7 (copy)
            return Vector2.new(l_read_0(v7.anchor)[1] or 0, l_read_0(v7.anchor)[2] or 0);
        end or nil, 
        AutomaticSize = v7.auto, 
        LayoutOrder = v7.layout, 
        BackgroundTransparency = 1, 
        Text = function() --[[ Line: 70 ]] --[[ Name: Text ]]
            -- upvalues: v6 (ref), v8 (copy), v7 (copy)
            return (("%* - %*\ts"):format(v6[v8() * v7.speed // 1 % 4 + 1], v8() * 100 // 1 / 100));
        end, 
        TextSize = v7.text_size, 
        TextColor3 = v7.color or function() --[[ Line: 74 ]]
            -- upvalues: v7 (copy), l_read_0 (ref), v0 (ref)
            local l_text_style_0 = v7.text_style;
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
        FontFace = function() --[[ Line: 83 ]] --[[ Name: FontFace ]]
            -- upvalues: v0 (ref), l_read_0 (ref), v7 (copy)
            local v13 = v0.font();
            local v14 = l_read_0(v7.weight) or Enum.FontWeight.Regular;
            return Font.new(v13.Family, v14);
        end, 
        TextWrapped = v7.wrapped, 
        TextXAlignment = v7.xalignment, 
        BackgroundTransparency = 1; 
        unpack(v7)
    });
end;