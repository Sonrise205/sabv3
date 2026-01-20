--!native
local v0 = {
    [48] = 0, 
    [49] = 1, 
    [50] = 2, 
    [51] = 3, 
    [52] = 4, 
    [53] = 5, 
    [54] = 6, 
    [55] = 7, 
    [56] = 8, 
    [57] = 9, 
    [65] = 10, 
    [66] = 11, 
    [67] = 12, 
    [68] = 13, 
    [69] = 14, 
    [70] = 15, 
    [97] = 10, 
    [98] = 11, 
    [99] = 12, 
    [100] = 13, 
    [101] = 14, 
    [102] = 15
};
return function(v1) --[[ Line: 45 ]] --[[ Name: HexToBuffer ]]
    -- upvalues: v0 (copy)
    local v2 = #v1;
    assert(v2 % 2 == 0, "hex length must be even");
    local v3 = buffer.create(v2 // 2);
    local v4 = 0;
    for v5 = 1, v2, 2 do
        local v6, v7 = string.byte(v1, v5, v5 + 1);
        local v8 = v0[v6];
        if not v8 then
            error((("invalid hex at %*"):format(v5)));
        end;
        local v9 = v0[v7];
        if not v9 then
            error((("invalid hex at %*"):format(v5 + 1)));
        end;
        buffer.writeu8(v3, v4, v8 * 16 + v9);
        v4 = v4 + 1;
    end;
    return v3;
end;