local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1, v2) --[[ Line: 17 ]] --[[ Name: shift ]]
    -- upvalues: v0 (copy)
    local v3 = #v1;
    local v4 = math.min(v3, v2 or 1);
    local v5 = table.create(v3 - v4);
    for v6 = v4 + 1, v3 do
        v5[v6 - v4] = v1[v6];
    end;
    return v0(v5);
end;