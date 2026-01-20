local v0 = require(script.Parent.Parent.utils.slice);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v2, v3, v4) --[[ Line: 29 ]] --[[ Name: slice ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1(v0(v2, v3, v4));
end;