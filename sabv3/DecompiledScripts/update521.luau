local v0 = require(script.Parent.Parent.utils.update);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v2, v3, v4, v5) --[[ Line: 24 ]] --[[ Name: update ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1(v0(v2, v3, v4, v5));
end;