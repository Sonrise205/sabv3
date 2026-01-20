--!native
local function v3(v0, v1, v2) --[[ Line: 20 ]] --[[ Name: Mix ]]
    v0 = bit32.bor(v0, 0);
    v1 = bit32.bor(v1, 0);
    v2 = bit32.bor(v2, 0);
    v0 = bit32.bxor(v0 - v1 - v2, (bit32.rshift(v2, 13)));
    v1 = bit32.bxor(v1 - v2 - v0, (bit32.lshift(v0, 8)));
    v2 = bit32.bxor(v2 - v0 - v1, (bit32.rshift(v1, 13)));
    v0 = bit32.bxor(v0 - v1 - v2, (bit32.rshift(v2, 12)));
    v1 = bit32.bxor(v1 - v2 - v0, (bit32.lshift(v0, 16)));
    v2 = bit32.bxor(v2 - v0 - v1, (bit32.rshift(v1, 5)));
    v0 = bit32.bxor(v0 - v1 - v2, (bit32.rshift(v2, 3)));
    v1 = bit32.bxor(v1 - v2 - v0, (bit32.lshift(v0, 10)));
    return (bit32.bxor(v2 - v0 - v1, (bit32.rshift(v1, 15))));
end;
local function _(v4) --[[ Line: 34 ]] --[[ Name: Unpack64 ]]
    if v4 < 0 then
        local v5 = -1 - v4;
        return bit32.bnot(v5 // 4294967296), (bit32.bnot(v5));
    else
        return bit32.bor(v4 // 4294967296, 0), (bit32.bor(v4, 0));
    end;
end;
local function v12(v7, v8) --[[ Line: 44 ]] --[[ Name: DoubleFromInt64 ]]
    -- upvalues: v3 (copy)
    local v9, v10;
    if v7 < 0 then
        local v11 = -1 - v7;
        v10 = bit32.bnot(v11 // 4294967296);
        v9 = bit32.bnot(v11);
    else
        v10 = bit32.bor(v7 // 4294967296, 0);
        v9 = bit32.bor(v7, 0);
    end;
    return v3(v9, v10, v8) / 4294967296;
end;
local function v14(v13) --[[ Line: 53 ]] --[[ Name: ParseUUID ]]
    return tonumber(string.sub(v13, 1, 8), 16), tonumber(string.sub(v13, 10, 13) .. string.sub(v13, 15, 18), 16), tonumber(string.sub(v13, 20, 23) .. string.sub(v13, 25, 28), 16), (tonumber(string.sub(v13, 29, 36), 16));
end;
return table.freeze({
    Mix = v3, 
    DoubleFromInt64 = v12, 
    DoubleFromUUID = function(v15, v16) --[[ Line: 59 ]] --[[ Name: DoubleFromUUID ]]
        -- upvalues: v14 (copy), v3 (copy)
        local v17, v18, v19, v20 = v14(v15);
        return v3(v3(v17, v18, 2197175160), v3(v19, v20, 2821953579), v16) / 4294967296;
    end, 
    IntegerFromUUID = function(v21, v22, v23, v24) --[[ Line: 68 ]] --[[ Name: IntegerFromUUID ]]
        -- upvalues: v14 (copy), v3 (copy)
        local v25 = v24 - v23 + 1;
        local v26, v27, v28, v29 = v14(v21);
        return (math.floor(v23 + v25 * (v3(v3(v26, v27, 2197175160), v3(v28, v29, 2821953579), v22) / 4294967296)));
    end
});