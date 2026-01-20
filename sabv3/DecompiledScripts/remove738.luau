local v0 = require(script.Parent.Parent.utils.set);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v2, ...) --[[ Line: 18 ]] --[[ Name: remove ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v3 = table.clone(v2);
    for _, v5 in {
        ...
    } do
        v3 = v0(v3, v5, nil);
    end;
    return v1(v3);
end;