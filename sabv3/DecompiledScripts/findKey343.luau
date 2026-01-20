local v0 = require(script.Parent.Parent.utils.findPair);
return function(v1, v2, v3) --[[ Line: 17 ]] --[[ Name: findKey ]]
    -- upvalues: v0 (copy)
    local v4, _ = v0(v1, v2);
    if v4 == nil then
        return v3;
    else
        return v4;
    end;
end;