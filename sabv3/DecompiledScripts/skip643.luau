local v0 = require(script.Parent.slice);
return function(v1, v2) --[[ Line: 15 ]] --[[ Name: skip ]]
    -- upvalues: v0 (copy)
    return v0(v1, (math.max(1, v2 + 1)));
end;