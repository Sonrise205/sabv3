--!native
local _ = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash);
local v1 = {
    1116352408, 
    1899447441, 
    3049323471, 
    3921009573, 
    961987163, 
    1508970993, 
    2453635748, 
    2870763221, 
    3624381080, 
    310598401, 
    607225278, 
    1426881987, 
    1925078388, 
    2162078206, 
    2614888103, 
    3248222580, 
    3835390401, 
    4022224774, 
    264347078, 
    604807628, 
    770255983, 
    1249150122, 
    1555081692, 
    1996064986, 
    2554220882, 
    2821834349, 
    2952996808, 
    3210313671, 
    3336571891, 
    3584528711, 
    113926993, 
    338241895, 
    666307205, 
    773529912, 
    1294757372, 
    1396182291, 
    1695183700, 
    1986661051, 
    2177026350, 
    2456956037, 
    2730485921, 
    2820302411, 
    3259730800, 
    3345764771, 
    3516065817, 
    3600352804, 
    4094571909, 
    275423344, 
    430227734, 
    506948616, 
    659060556, 
    883997877, 
    958139571, 
    1322822218, 
    1537002063, 
    1747873779, 
    1955562222, 
    2024104815, 
    2227730452, 
    2361852424, 
    2428436474, 
    2756734187, 
    3204031479, 
    3329325298
};
local v2 = table.create(64, 0);
processBlocks = function(v3, v4, v5, v6) --[[ Line: 49 ]] --[[ Name: processBlocks ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_v2_0 = v2;
    local v8 = v3[1];
    local v9 = v3[2];
    local v10 = v3[3];
    local v11 = v3[4];
    local v12 = v3[5];
    local v13 = v3[6];
    local v14 = v3[7];
    local v15 = v3[8];
    for v16 = v5, v6, 64 do
        local l_v16_0 = v16;
        for v18 = 1, 16 do
            local v19, v20, v21, v22 = string.byte(v4, l_v16_0, l_v16_0 + 3);
            l_v2_0[v18] = bit32.bor(bit32.lshift(v19, 24), bit32.lshift(v20, 16), bit32.lshift(v21, 8), v22);
            l_v16_0 = l_v16_0 + 4;
        end;
        for v23 = 17, 64 do
            local v24 = l_v2_0[v23 - 2];
            local v25 = l_v2_0[v23 - 15];
            l_v2_0[v23] = bit32.bxor(bit32.rrotate(v24, 17), bit32.rrotate(v24, 19), (bit32.rshift(v24, 10))) + l_v2_0[v23 - 7] + bit32.bxor(bit32.rrotate(v25, 7), bit32.rrotate(v25, 18), (bit32.rshift(v25, 3))) + l_v2_0[v23 - 16];
        end;
        local l_v8_0 = v8;
        local l_v9_0 = v9;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        local l_v12_0 = v12;
        local l_v13_0 = v13;
        local l_v14_0 = v14;
        local l_v15_0 = v15;
        local v34 = nil;
        local v35 = nil;
        for v36 = 1, 64 do
            v34 = l_v15_0 + bit32.bxor(bit32.rrotate(l_v12_0, 6), bit32.rrotate(l_v12_0, 11), (bit32.rrotate(l_v12_0, 25))) + bit32.band(l_v12_0, l_v13_0) + bit32.band(bit32.bnot(l_v12_0), l_v14_0) + v1[v36] + l_v2_0[v36];
            v35 = bit32.band(l_v10_0, l_v9_0) + bit32.band(l_v8_0, (bit32.bxor(l_v10_0, l_v9_0))) + bit32.bxor(bit32.rrotate(l_v8_0, 2), bit32.rrotate(l_v8_0, 13), (bit32.rrotate(l_v8_0, 22)));
            l_v15_0 = l_v14_0;
            l_v14_0 = l_v13_0;
            l_v13_0 = l_v12_0;
            l_v12_0 = l_v11_0 + v34;
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v9_0;
            l_v9_0 = l_v8_0;
            l_v8_0 = v34 + v35;
        end;
        v8 = bit32.bor(l_v8_0 + v8, 0);
        v9 = bit32.bor(l_v9_0 + v9, 0);
        v10 = bit32.bor(l_v10_0 + v10, 0);
        v11 = bit32.bor(l_v11_0 + v11, 0);
        v12 = bit32.bor(l_v12_0 + v12, 0);
        v13 = bit32.bor(l_v13_0 + v13, 0);
        v14 = bit32.bor(l_v14_0 + v14, 0);
        v15 = bit32.bor(l_v15_0 + v15, 0);
    end;
    v3[1] = v8;
    v3[2] = v9;
    v3[3] = v10;
    v3[4] = v11;
    v3[5] = v12;
    v3[6] = v13;
    v3[7] = v14;
    v3[8] = v15;
end;
sha256 = function(v37) --[[ Line: 128 ]] --[[ Name: sha256 ]]
    local v38 = {
        1779033703, 
        3144134277, 
        1013904242, 
        2773480762, 
        1359893119, 
        2600822924, 
        528734635, 
        1541459225
    };
    local v39 = #v37;
    local v40 = v39 % 64;
    if v39 >= 64 then
        processBlocks(v38, v37, 1, v39 - v40);
    end;
    local v41 = bit32.band(v40 + 32, 4294967232);
    local v42 = {
        if v40 ~= 0 then string.sub(v37, -v40) else "", 
        "\128", 
        string.rep("\000", (v41 - v40 - 9) % 64), 
        string.pack(">L", v39 * 8)
    };
    local v43 = table.concat(v42);
    processBlocks(v38, v43, 1, #v43);
    local v44 = buffer.create(32);
    for v45 = 1, 8 do
        buffer.writeu32(v44, 4 * (v45 - 1), (bit32.byteswap(v38[v45])));
    end;
    return v44;
end;
local v48 = {
    Name = "SHA-256", 
    BlockSize = 64, 
    OutputSize = 32, 
    Digest = function(v46) --[[ Line: 172 ]] --[[ Name: Digest ]]
        return buffer.tostring(sha256(v46));
    end, 
    DigestBuffer = function(v47) --[[ Line: 175 ]] --[[ Name: DigestBuffer ]]
        return sha256(buffer.tostring(v47));
    end, 
    DigestToBuffer = sha256
};
table.freeze(v48);
return v48;