local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1, v2, ...) --[[ Line: 16 ]] --[[ Name: insert ]]
    -- upvalues: v0 (copy)
    local v3 = #v1;
    if v2 < 1 then
        v2 = v3 + v2;
    end;
    v2 = math.clamp(v2, 1, v3 + 1);
    local v4 = {};
    local v5 = 1;
    for v6 = 1, v3 + 1 do
        if v6 == v2 then
            for v7 = 1, select("#", ...) do
                v4[v5] = select(v7, ...);
                v5 = v5 + 1;
            end;
        end;
        v4[v5] = v1[v6];
        v5 = v5 + 1;
    end;
    return v0(v4);
end;