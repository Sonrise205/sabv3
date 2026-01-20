local v0 = require(script.Parent.Parent.utils.getIn);
local v1 = require(script.Parent.Parent.None);
return function(v2, v3) --[[ Line: 16 ]] --[[ Name: hasIn ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0(v2, v3, v1) ~= v1;
end;