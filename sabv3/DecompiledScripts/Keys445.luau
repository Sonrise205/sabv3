--!native
return function(v0) --[[ Line: 20 ]] --[[ Name: Keys ]]
    local v1 = {};
    for v2, _ in pairs(v0) do
        table.insert(v1, v2);
    end;
    return v1;
end;