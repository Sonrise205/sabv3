--!native
local v0 = buffer.create(64);
local v1 = buffer.create(256);
for v2 = 1, 64 do
    local v3 = v2 - 1;
    local v4 = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v2);
    buffer.writeu8(v0, v3, v4);
    buffer.writeu8(v1, v4, v3);
end;
encode = function(v5, v6) --[[ Line: 42 ]] --[[ Name: encode ]]
    -- upvalues: v0 (copy)
    local v7 = v6 or buffer.len(v5);
    local v8 = math.ceil(v7 / 3);
    local v9 = v8 * 4;
    local v10 = buffer.create(v9);
    for v11 = 1, v8 - 1 do
        local v12 = (v11 - 1) * 3;
        local v13 = (v11 - 1) * 4;
        local v14 = bit32.byteswap((buffer.readu32(v5, v12)));
        local v15 = bit32.rshift(v14, 26);
        local v16 = bit32.band(bit32.rshift(v14, 20), 63);
        local v17 = bit32.band(bit32.rshift(v14, 14), 63);
        local v18 = bit32.band(bit32.rshift(v14, 8), 63);
        buffer.writeu8(v10, v13, (buffer.readu8(v0, v15)));
        buffer.writeu8(v10, v13 + 1, (buffer.readu8(v0, v16)));
        buffer.writeu8(v10, v13 + 2, (buffer.readu8(v0, v17)));
        buffer.writeu8(v10, v13 + 3, (buffer.readu8(v0, v18)));
    end;
    local v19 = v7 % 3;
    if v19 == 1 then
        local v20 = buffer.readu8(v5, v7 - 1);
        local v21 = bit32.rshift(v20, 2);
        local v22 = bit32.band(bit32.lshift(v20, 4), 63);
        buffer.writeu8(v10, v9 - 4, (buffer.readu8(v0, v21)));
        buffer.writeu8(v10, v9 - 3, (buffer.readu8(v0, v22)));
        buffer.writeu8(v10, v9 - 2, 61);
        buffer.writeu8(v10, v9 - 1, 61);
        return v10;
    elseif v19 == 2 then
        local v23 = bit32.bor(bit32.lshift(buffer.readu8(v5, v7 - 2), 8), (buffer.readu8(v5, v7 - 1)));
        local v24 = bit32.rshift(v23, 10);
        local v25 = bit32.band(bit32.rshift(v23, 4), 63);
        local v26 = bit32.band(bit32.lshift(v23, 2), 63);
        buffer.writeu8(v10, v9 - 4, (buffer.readu8(v0, v24)));
        buffer.writeu8(v10, v9 - 3, (buffer.readu8(v0, v25)));
        buffer.writeu8(v10, v9 - 2, (buffer.readu8(v0, v26)));
        buffer.writeu8(v10, v9 - 1, 61);
        return v10;
    else
        if v19 == 0 and v7 ~= 0 then
            local v27 = bit32.bor(bit32.lshift(buffer.readu8(v5, v7 - 3), 16), bit32.lshift(buffer.readu8(v5, v7 - 2), 8), (buffer.readu8(v5, v7 - 1)));
            local v28 = bit32.rshift(v27, 18);
            local v29 = bit32.band(bit32.rshift(v27, 12), 63);
            local v30 = bit32.band(bit32.rshift(v27, 6), 63);
            local v31 = bit32.band(v27, 63);
            buffer.writeu8(v10, v9 - 4, (buffer.readu8(v0, v28)));
            buffer.writeu8(v10, v9 - 3, (buffer.readu8(v0, v29)));
            buffer.writeu8(v10, v9 - 2, (buffer.readu8(v0, v30)));
            buffer.writeu8(v10, v9 - 1, (buffer.readu8(v0, v31)));
        end;
        return v10;
    end;
end;
decode = function(v32) --[[ Line: 115 ]] --[[ Name: decode ]]
    -- upvalues: v1 (copy)
    local v33 = buffer.len(v32);
    local v34 = math.ceil(v33 / 4);
    local v35 = 0;
    if v33 ~= 0 then
        if buffer.readu8(v32, v33 - 1) == 61 then
            v35 = v35 + 1;
        end;
        if buffer.readu8(v32, v33 - 2) == 61 then
            v35 = v35 + 1;
        end;
    end;
    local v36 = v34 * 3 - v35;
    local v37 = buffer.create(v36);
    for v38 = 1, v34 - 1 do
        local v39 = (v38 - 1) * 4;
        local v40 = (v38 - 1) * 3;
        local v41 = buffer.readu8(v1, (buffer.readu8(v32, v39)));
        local v42 = buffer.readu8(v1, (buffer.readu8(v32, v39 + 1)));
        local v43 = buffer.readu8(v1, (buffer.readu8(v32, v39 + 2)));
        local v44 = buffer.readu8(v1, (buffer.readu8(v32, v39 + 3)));
        local v45 = bit32.bor(bit32.lshift(v41, 18), bit32.lshift(v42, 12), bit32.lshift(v43, 6), v44);
        local v46 = bit32.rshift(v45, 16);
        local v47 = bit32.band(bit32.rshift(v45, 8), 255);
        local v48 = bit32.band(v45, 255);
        buffer.writeu8(v37, v40, v46);
        buffer.writeu8(v37, v40 + 1, v47);
        buffer.writeu8(v37, v40 + 2, v48);
    end;
    if v33 ~= 0 then
        local v49 = (v34 - 1) * 4;
        local v50 = (v34 - 1) * 3;
        local v51 = buffer.readu8(v1, (buffer.readu8(v32, v49)));
        local v52 = buffer.readu8(v1, (buffer.readu8(v32, v49 + 1)));
        local v53 = buffer.readu8(v1, (buffer.readu8(v32, v49 + 2)));
        local v54 = buffer.readu8(v1, (buffer.readu8(v32, v49 + 3)));
        local v55 = bit32.bor(bit32.lshift(v51, 18), bit32.lshift(v52, 12), bit32.lshift(v53, 6), v54);
        if v35 <= 2 then
            buffer.writeu8(v37, v50, (bit32.rshift(v55, 16)));
            if v35 <= 1 then
                local v56 = bit32.band(bit32.rshift(v55, 8), 255);
                buffer.writeu8(v37, v50 + 1, v56);
                if v35 == 0 then
                    local v57 = bit32.band(v55, 255);
                    buffer.writeu8(v37, v50 + 2, v57);
                end;
            end;
        end;
    end;
    return v37;
end;
Encode = function(v58) --[[ Line: 189 ]] --[[ Name: Encode ]]
    return buffer.tostring(encode(buffer.fromstring(v58)));
end;
Decode = function(v59) --[[ Line: 193 ]] --[[ Name: Decode ]]
    return buffer.tostring(decode(buffer.fromstring(v59)));
end;
return table.freeze({
    Encode = Encode, 
    Decode = Decode, 
    EncodeBuffer = encode, 
    DecodeBuffer = decode
});