local v0 = require(script.Parent.Parent.utils.setIn);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v2, v3, v4) --[[ Line: 24 ]] --[[ Name: setIn ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1(v0(v2, v3, v4));
end;