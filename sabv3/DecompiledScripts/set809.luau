local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1, v2, v3) --[[ Line: 17 ]] --[[ Name: set ]]
    -- upvalues: v0 (copy)
    if v1[v2] == v3 then
        return v1;
    else
        local v4 = table.clone(v1);
        v4[v2] = v3;
        return v0(v4);
    end;
end;