local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(...) --[[ Line: 19 ]] --[[ Name: zip ]]
    -- upvalues: v0 (copy)
    local v1 = select(1, ...);
    local v2 = {};
    local v3 = select("#", ...);
    if v3 <= 0 then
        return v2;
    else
        local v4 = #v1;
        for v5 = 2, v3 do
            local v6 = #select(v5, ...);
            if v6 < v4 then
                v4 = v6;
            end;
        end;
        for v7 = 1, v4 do
            v2[v7] = {};
            for v8 = 1, v3 do
                local v9 = select(v8, ...);
                v2[v7][v8] = v9[v7];
            end;
        end;
        return v0(v2);
    end;
end;