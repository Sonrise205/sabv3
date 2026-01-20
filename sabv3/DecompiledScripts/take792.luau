local v0 = require(script.Parent.slice);
return function(v1, v2) --[[ Line: 15 ]] --[[ Name: take ]]
    -- upvalues: v0 (copy)
    return v0(v1, 1, (math.max(1, v2)));
end;