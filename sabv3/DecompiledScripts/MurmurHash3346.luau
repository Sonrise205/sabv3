--!native
local l_band_0 = bit32.band;
local l_lshift_0 = bit32.lshift;
local l_rshift_0 = bit32.rshift;
local l_lrotate_0 = bit32.lrotate;
local l_bxor_0 = bit32.bxor;
local l_bor_0 = bit32.bor;
local l_len_0 = buffer.len;
local l_readu32_0 = buffer.readu32;
local l_readu8_0 = buffer.readu8;
local l_readu16_0 = buffer.readu16;
local l_fromstring_0 = buffer.fromstring;
mul32 = function(v11, v12) --[[ Line: 26 ]] --[[ Name: mul32 ]]
    -- upvalues: l_band_0 (copy), l_rshift_0 (copy), l_lshift_0 (copy)
    return l_band_0(v11, 65535) * v12 + l_lshift_0(l_band_0(l_rshift_0(v11, 16) * v12, 65535), 16);
end;
DigestBufferUnsafe = function(v13, v14, v15, v16) --[[ Line: 30 ]] --[[ Name: DigestBufferUnsafe ]]
    -- upvalues: l_bor_0 (copy), l_readu32_0 (copy), l_lrotate_0 (copy), l_bxor_0 (copy), l_lshift_0 (copy), l_band_0 (copy), l_readu8_0 (copy), l_readu16_0 (copy), l_rshift_0 (copy)
    local v17 = 0;
    if v16 ~= nil then
        assert(l_bor_0(v16, 0) == v16);
        v17 = v16;
    end;
    local l_v14_0 = v14;
    local v19 = v14 + v15 - 3;
    while l_v14_0 < v19 do
        local v20 = l_readu32_0(v13, l_v14_0);
        v20 = l_lrotate_0(mul32(v20, 3432918353), 15);
        v17 = l_lshift_0(l_lrotate_0(l_bxor_0(v17, (mul32(v20, 461845907))), 13) * 5, 0) + 3864292196;
        l_v14_0 = l_v14_0 + 4;
    end;
    local v21 = l_band_0(v15, 3);
    if v21 > 0 then
        local v22 = nil;
        v22 = if v21 == 3 then l_readu8_0(v13, l_v14_0) + l_lshift_0(l_readu16_0(v13, l_v14_0 + 1), 8) else if v21 == 2 then l_readu16_0(v13, l_v14_0) else l_readu8_0(v13, l_v14_0);
        v22 = l_lrotate_0(mul32(v22, 3432918353), 15);
        v17 = l_bxor_0(v17, (mul32(v22, 461845907)));
    end;
    v17 = l_bxor_0(v17, v15);
    v17 = l_bxor_0(v17, (l_rshift_0(v17, 16)));
    v17 = mul32(v17, 2246822507);
    v17 = l_bxor_0(v17, (l_rshift_0(v17, 13)));
    v17 = mul32(v17, 3266489909);
    return (l_bxor_0(v17, (l_rshift_0(v17, 16))));
end;
DigestBufferCustom = function(v23, v24, v25, v26) --[[ Line: 83 ]] --[[ Name: DigestBufferCustom ]]
    -- upvalues: l_len_0 (copy)
    assert(type(v23) == "buffer");
    local v27 = false;
    if type(v24) == "number" then
        v27 = false;
        if v24 >= 0 then
            v27 = v24 <= l_len_0(v23);
        end;
    end;
    assert(v27);
    v27 = false;
    if type(v25) == "number" then
        v27 = false;
        if v25 >= 0 then
            v27 = v25 <= l_len_0(v23) - v24;
        end;
    end;
    assert(v27);
    return DigestBufferUnsafe(v23, v24, v25, v26);
end;
DigestBuffer = function(v28, v29) --[[ Line: 99 ]] --[[ Name: DigestBuffer ]]
    -- upvalues: l_len_0 (copy)
    return DigestBufferUnsafe(v28, 0, l_len_0(v28), v29);
end;
Digest = function(v30, v31) --[[ Line: 103 ]] --[[ Name: Digest ]]
    -- upvalues: l_fromstring_0 (copy), l_len_0 (copy)
    local v32 = l_fromstring_0(v30);
    return DigestBufferUnsafe(v32, 0, l_len_0(v32), v31);
end;
local v33 = {
    DigestBufferCustom = DigestBufferCustom, 
    DigestBuffer = DigestBuffer, 
    Digest = Digest
};
table.freeze(v33);
return v33;