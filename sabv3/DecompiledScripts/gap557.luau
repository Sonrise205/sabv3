local v0 = require("../../roblox_packages/vide");
local l_create_0 = v0.create;
local l_read_0 = v0.read;
return function(v3) --[[ Line: 14 ]]
    -- upvalues: l_create_0 (copy), l_read_0 (copy)
    return l_create_0("Frame")({
        Name = "gap", 
        Size = function() --[[ Line: 17 ]] --[[ Name: Size ]]
            -- upvalues: l_read_0 (ref), v3 (copy)
            return UDim2.fromOffset(l_read_0(v3.width) or 0, l_read_0(v3.height) or 0);
        end, 
        BackgroundTransparency = 1; 
        unpack(v3)
    });
end;