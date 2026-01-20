return function(v0, v1) --[[ Line: 15 ]] --[[ Name: joinAsString ]]
    local v2 = {};
    for v3, v4 in v0 do
        table.insert(v2, string.format("%s=%s", tostring(v3), (tostring(v4))));
    end;
    return table.concat(v2, v1 or ",");
end;