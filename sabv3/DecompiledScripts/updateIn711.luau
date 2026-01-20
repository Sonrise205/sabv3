local l_utils_0 = script.Parent.Parent.utils;
local v1 = require(l_utils_0.updateIn);
local v2 = require(l_utils_0.maybeFreeze);
return function(v3, v4, v5, v6) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2(v1(v3, v4, v5, v6));
end;