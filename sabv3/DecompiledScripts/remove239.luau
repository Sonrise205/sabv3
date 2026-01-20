local v0 = require(script.Parent.isImmutable);
local v1 = require(script.Parent.isDataStructure);
local v2 = require(script.Parent.shallowCopy);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v0 (copy), v2 (copy)
    if not v1(v3) then
        error("Cannot update non-data-structure value: " .. tostring(v3));
    end;
    if v0(v3) then
        if not v3.remove then
            error("Cannot update immutable value without .remove() method: " .. tostring(v3));
        end;
        return v3:remove(v4);
    elseif not v3[v4] then
        return v3;
    else
        local v5 = v2(v3);
        if #v5 > 0 then
            table.remove(v3, v4);
            return v5;
        else
            v3[v4] = nil;
            return v5;
        end;
    end;
end;