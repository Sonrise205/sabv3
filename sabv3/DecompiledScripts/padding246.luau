local l_create_0 = require("../../roblox_packages/vide").create;
return function(v1) --[[ Line: 16 ]] --[[ Name: padding ]]
    -- upvalues: l_create_0 (copy)
    local v2 = v1.padding or 0;
    local v3 = v1.x or v2;
    local v4 = v1.y or v2;
    local v5 = v1.left or v3;
    local v6 = v1.right or v3;
    local v7 = v1.top or v4;
    local v8 = v1.bottom or v4;
    return l_create_0("UIPadding")({
        PaddingLeft = UDim.new(0, v5), 
        PaddingRight = UDim.new(0, v6), 
        PaddingTop = UDim.new(0, v7), 
        PaddingBottom = UDim.new(0, v8)
    });
end;