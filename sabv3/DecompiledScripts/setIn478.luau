local v0 = require(script.Parent.updateIn);
local v1 = require(script.Parent.Parent.None);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0(v2, v3, function() --[[ Line: 5 ]]
        -- upvalues: v4 (copy)
        return v4;
    end, v1);
end;