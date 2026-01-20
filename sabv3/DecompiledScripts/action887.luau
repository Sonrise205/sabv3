local v0 = table.freeze({});
local function v2(v1) --[[ Line: 8 ]] --[[ Name: is_action ]]
    -- upvalues: v0 (copy)
    return getmetatable(v1) == v0;
end;
local function v6(v3, v4) --[[ Line: 12 ]] --[[ Name: action ]]
    -- upvalues: v0 (copy)
    local v5 = {
        priority = v4 or 1, 
        callback = v3
    };
    setmetatable(v5, v0);
    return table.freeze(v5);
end;
return function() --[[ Line: 23 ]]
    -- upvalues: v6 (copy), v2 (copy)
    return v6, v2;
end;