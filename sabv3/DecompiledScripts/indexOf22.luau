local v0 = require(script.Parent.Parent.utils.keyOf);
return function(v1, v2) --[[ Line: 15 ]] --[[ Name: indexOf ]]
    -- upvalues: v0 (copy)
    local v3 = v0(v1, v2);
    if v3 == nil then
        return nil;
    else
        return v3;
    end;
end;