local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1) --[[ Line: 14 ]] --[[ Name: keys ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for v3, _ in v1 do
        table.insert(v2, v3);
    end;
    return v0(v2);
end;