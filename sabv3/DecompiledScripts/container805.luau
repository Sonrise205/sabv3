local v0 = require("../../roblox_packages/vide");
local l_create_0 = v0.create;
local l_read_0 = v0.read;
return function(v3) --[[ Line: 22 ]]
    -- upvalues: l_create_0 (copy), l_read_0 (copy)
    return l_create_0("Frame")({
        Size = function() --[[ Line: 24 ]] --[[ Name: Size ]]
            -- upvalues: l_read_0 (ref), v3 (copy)
            return UDim2.fromOffset(l_read_0(v3.width) or 0, l_read_0(v3.height) or 0);
        end, 
        Position = function() --[[ Line: 30 ]] --[[ Name: Position ]]
            -- upvalues: l_read_0 (ref), v3 (copy)
            return UDim2.new(l_read_0(v3.xs) or 0, l_read_0(v3.x) or 0, l_read_0(v3.ys) or 0, l_read_0(v3.y) or 0);
        end, 
        AnchorPoint = v3.anchor and function() --[[ Line: 39 ]]
            -- upvalues: l_read_0 (ref), v3 (copy)
            return Vector2.new(l_read_0(v3.anchor)[1] or 0, l_read_0(v3.anchor)[2] or 0);
        end or nil, 
        AutomaticSize = v3.auto, 
        LayoutOrder = v3.layout, 
        ZIndex = v3.zindex, 
        BackgroundTransparency = 1; 
        unpack(v3)
    });
end;