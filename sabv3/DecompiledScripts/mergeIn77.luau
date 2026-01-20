local v0 = require(script.Parent.updateIn);
local v1 = require(script.Parent.merge);
return function(v2, v3, ...) --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v4 = {
        ...
    };
    return v0(v2, v3, function(v5) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v4 (copy)
        return v1(v5, table.unpack(v4));
    end, {});
end;