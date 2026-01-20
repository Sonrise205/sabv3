local function v2(v0, v1) --[[ Line: 2 ]]
    return v1 < v0;
end;
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local v5 = if v4 == nil then v2 else v4;
    local v6 = nil;
    local v7 = nil;
    for v8, v9 in v3 do
        if v7 == nil or v5(v7, v9) == true then
            v6 = v8;
            v7 = v9;
        end;
    end;
    return v7, v6;
end;