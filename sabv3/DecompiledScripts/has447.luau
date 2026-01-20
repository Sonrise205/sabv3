local v0 = require(script.Parent.isImmutable);
local v1 = require(script.Parent.isDataStructure);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v0(v2) then
        return (v2:has(v3));
    else
        return v1(v2) and v2[v3] ~= nil;
    end;
end;