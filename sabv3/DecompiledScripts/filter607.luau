local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1, v2) --[[ Line: 16 ]] --[[ Name: filter ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    for v4, v5 in v1 do
        if v2(v5, v4) == true then
            v3[v4] = v5;
        end;
    end;
    return v0(v3);
end;