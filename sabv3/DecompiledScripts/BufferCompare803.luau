--!native
return function(v0, v1) --[[ Line: 20 ]] --[[ Name: CompareBuffer ]]
    local v2 = buffer.len(v0);
    local v3 = buffer.len(v1);
    for v4 = 0, math.min(v2, v3) - 1 do
        local v5 = buffer.readu8(v0, v4);
        local v6 = buffer.readu8(v1, v4);
        if v5 ~= v6 then
            return v5 - v6;
        end;
    end;
    return v2 - v3;
end;