return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: slice ]]
    local v3 = #v0;
    local v4 = if v1 and v1 < 0 then v3 + (v1 + 1) else v1 or 1;
    local v5 = if v2 and v2 < 0 then v3 + v2 else v2 or v3;
    if v4 == 1 and v5 == #v0 then
        return v0;
    else
        local v6 = {};
        local v7 = 1;
        for v8 = v4, v5 do
            v6[v7] = v0[v8];
            v7 = v7 + 1;
        end;
        return v6;
    end;
end;