local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1, v2) --[[ Line: 16 ]] --[[ Name: sort ]]
    -- upvalues: v0 (copy)
    local v3 = table.clone(v1);
    table.sort(v3, v2);
    return v0(v3);
end;