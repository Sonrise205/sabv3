local function v0(v1) --[[ Line: 2 ]] --[[ Name: deepCopy ]]
    -- upvalues: v0 (copy)
    local v2 = table.clone(v1);
    for v3, v4 in v2 do
        if typeof(v4) == "table" then
            v2[v3] = v0(v4);
        end;
    end;
    return v2;
end;
return v0;