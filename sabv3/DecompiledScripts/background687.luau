local v0 = require("../theme");
local v1 = require("../../roblox_packages/vide");
local l_create_0 = v1.create;
local l_read_0 = v1.read;
return function(v4) --[[ Line: 24 ]]
    -- upvalues: l_create_0 (copy), l_read_0 (copy), v0 (copy)
    return l_create_0("Frame")({
        Size = function() --[[ Line: 26 ]] --[[ Name: Size ]]
            -- upvalues: l_read_0 (ref), v4 (copy)
            local v5 = l_read_0(v4.width);
            local v6 = l_read_0(v4.height);
            return UDim2.new(v5 and 0 or 1, v5 or 0, v6 and 0 or 1, v6 or 0);
        end, 
        Position = function() --[[ Line: 35 ]] --[[ Name: Position ]]
            -- upvalues: l_read_0 (ref), v4 (copy)
            return UDim2.new(l_read_0(v4.xs) or 0, l_read_0(v4.x) or 0, l_read_0(v4.ys) or 0, l_read_0(v4.y) or 0);
        end, 
        AnchorPoint = v4.anchor and function() --[[ Line: 44 ]]
            -- upvalues: l_read_0 (ref), v4 (copy)
            return Vector2.new(l_read_0(v4.anchor)[1] or 0, l_read_0(v4.anchor)[2] or 0);
        end or nil, 
        AutomaticSize = v4.auto, 
        LayoutOrder = v4.layout, 
        BackgroundColor3 = v4.color or v0.background, 
        BackgroundTransparency = v0.background_transparency; 
        unpack(v4)
    });
end;