local v0 = require(script.Parent.Parent.utils.maybeFreeze);
local function v1(v2, v3) --[[ Line: 27 ]] --[[ Name: flatten ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v4 = {};
    local v5 = 1;
    for _, v7 in v2 do
        if type(v7) == "table" and (not v3 or v3 > 0) then
            local v8 = v1(v7, v3 and v3 - 1);
            for v9 = 1, #v8 do
                v4[v5] = v8[v9];
                v5 = v5 + 1;
            end;
        else
            v4[v5] = v7;
            v5 = v5 + 1;
        end;
    end;
    return v0(v4);
end;
return v1;