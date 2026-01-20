local v0 = require(script.Parent.findPair);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v3, _ = v0(v1, v2);
    return v3;
end;