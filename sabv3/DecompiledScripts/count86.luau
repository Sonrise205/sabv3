return function(v0, v1) --[[ Line: 3 ]] --[[ Name: count ]]
    local v2 = 0;
    for v3, v4 in v0 do
        if v1 == nil or v1(v4, v3) then
            v2 = v2 + 1;
        end;
    end;
    return v2;
end;