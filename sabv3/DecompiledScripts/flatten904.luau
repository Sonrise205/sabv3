local v0 = require(script.Parent.Parent.utils.maybeFreeze);
local function v1(v2, v3) --[[ Line: 4 ]] --[[ Name: flattenImpl ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for v5, v6 in v2 do
        if type(v6) == "table" and (not v3 or v3 > 0) then
            local v7 = v1(v6, v3 and v3 - 1);
            for v8, v9 in pairs(v4) do
                v7[v8] = v9;
            end;
            v4 = v7;
        else
            v4[v5] = v6;
        end;
    end;
    return v4;
end;
return function(v10, v11) --[[ Line: 45 ]] --[[ Name: flatten ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0((v1(v10, v11)));
end;