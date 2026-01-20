local l_create_0 = require("../../roblox_packages/vide").create;
return function(v1) --[[ Line: 14 ]]
    -- upvalues: l_create_0 (copy)
    return l_create_0("ScreenGui")({
        Name = v1.name, 
        Enabled = v1.enabled, 
        DisplayOrder = v1.display_order; 
        unpack(v1)
    });
end;