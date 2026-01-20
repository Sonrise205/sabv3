local v0 = require(script.Parent.Parent.utils.map);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v2, v3) --[[ Line: 19 ]] --[[ Name: map ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1(v0(v2, v3));
end;