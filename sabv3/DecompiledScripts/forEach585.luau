return function(v0, v1) --[[ Line: 3 ]]
    local v2 = 0;
    for v3, v4 in v0 do
        v2 = v2 + 1;
        if v1(v4, v3) == false then
            break;
        end;
    end;
    return v2;
end;