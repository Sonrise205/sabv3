return function(v0, v1, v2) --[[ Line: 2 ]]
    if v0[v1] == v2 then
        return v0;
    else
        local v3 = table.clone(v0);
        v3[v1] = v2;
        return v3;
    end;
end;