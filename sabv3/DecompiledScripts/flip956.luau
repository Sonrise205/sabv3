local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1) --[[ Line: 14 ]] --[[ Name: flip ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for v3, v4 in v1 do
        v2[v4] = v3;
    end;
    return v0(v2);
end;