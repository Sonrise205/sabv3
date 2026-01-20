--!native
local _ = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash);
local v1 = table.create(80, 0);
local v2 = table.create(80, 0);
local v3 = {
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
    3329325298, 
    3391569614, 
    3515267271, 
    3940187606, 
    4118630271, 
    116418474, 
    174292421, 
    289380356, 
    460393269, 
    685471733, 
    852142971, 
    1017036298, 
    1126000580, 
    1288033470, 
    1501505948, 
    1607167915, 
    1816402316
};
local v4 = {
    3609767458, 
    602891725, 
    3964484399, 
    2173295548, 
    4081628472, 
    3053834265, 
    2937671579, 
    3664609560, 
    2734883394, 
    1164996542, 
    1323610764, 
    3590304994, 
    4068182383, 
    991336113, 
    633803317, 
    3479774868, 
    2666613458, 
    944711139, 
    2341262773, 
    2007800933, 
    1495990901, 
    1856431235, 
    3175218132, 
    2198950837, 
    3999719339, 
    766784016, 
    2566594879, 
    3203337956, 
    1034457026, 
    2466948901, 
    3758326383, 
    168717936, 
    1188179964, 
    1546045734, 
    1522805485, 
    2643833823, 
    2343527390, 
    1014477480, 
    1206759142, 
    344077627, 
    1290863460, 
    3158454273, 
    3505952657, 
    106217008, 
    3606008344, 
    1432725776, 
    1467031594, 
    851169720, 
    3100823752, 
    1363258195, 
    3750685593, 
    3785050280, 
    3318307427, 
    3812723403, 
    2003034995, 
    3602036899, 
    1575990012, 
    1125592928, 
    2716904306, 
    442776044, 
    593698344, 
    3733110249, 
    2999351573, 
    3815920427, 
    3928383900, 
    566280711, 
    3454069534, 
    4000239992, 
    1914138554, 
    2731055270, 
    3203993006, 
    320620315, 
    587496836, 
    1086792851, 
    365543100, 
    2618297676, 
    3409855158, 
    4234509866, 
    987167468, 
    1246189591
};
lil_sig0 = function(v5, v6) --[[ Line: 76 ]] --[[ Name: lil_sig0 ]]
    return bit32.bxor(bit32.rshift(v5, 1), bit32.lshift(v6, 31), bit32.rshift(v5, 8), bit32.lshift(v6, 24), (bit32.rshift(v5, 7))), (bit32.bxor(bit32.rshift(v6, 1), bit32.lshift(v5, 31), bit32.rshift(v6, 8), bit32.lshift(v5, 24), bit32.rshift(v6, 7), (bit32.lshift(v5, 25))));
end;
lil_sig1 = function(v7, v8) --[[ Line: 98 ]] --[[ Name: lil_sig1 ]]
    return bit32.bxor(bit32.rshift(v7, 19), bit32.lshift(v8, 13), bit32.lshift(v7, 3), bit32.rshift(v8, 29), (bit32.rshift(v7, 6))), (bit32.bxor(bit32.rshift(v8, 19), bit32.lshift(v7, 13), bit32.lshift(v8, 3), bit32.rshift(v7, 29), bit32.rshift(v8, 6), (bit32.lshift(v7, 26))));
end;
big_sig0 = function(v9, v10) --[[ Line: 119 ]] --[[ Name: big_sig0 ]]
    return bit32.bxor(bit32.rshift(v9, 28), bit32.lshift(v10, 4), bit32.lshift(v9, 30), bit32.rshift(v10, 2), bit32.lshift(v9, 25), (bit32.rshift(v10, 7))), (bit32.bxor(bit32.rshift(v10, 28), bit32.lshift(v9, 4), bit32.lshift(v10, 30), bit32.rshift(v9, 2), bit32.lshift(v10, 25), (bit32.rshift(v9, 7))));
end;
big_sig1 = function(v11, v12) --[[ Line: 137 ]] --[[ Name: big_sig1 ]]
    return bit32.bxor(bit32.rshift(v11, 14), bit32.lshift(v12, 18), bit32.rshift(v11, 18), bit32.lshift(v12, 14), bit32.lshift(v11, 23), (bit32.rshift(v12, 9))), (bit32.bxor(bit32.rshift(v12, 14), bit32.lshift(v11, 18), bit32.rshift(v12, 18), bit32.lshift(v11, 14), bit32.lshift(v12, 23), (bit32.rshift(v11, 9))));
end;
processBlocks = function(v13, v14, v15, v16, v17) --[[ Line: 157 ]] --[[ Name: processBlocks ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy)
    local l_v1_0 = v1;
    local l_v2_0 = v2;
    local v20 = v13[1];
    local v21 = v13[2];
    local v22 = v13[3];
    local v23 = v13[4];
    local v24 = v13[5];
    local v25 = v13[6];
    local v26 = v13[7];
    local v27 = v13[8];
    local v28 = v14[1];
    local v29 = v14[2];
    local v30 = v14[3];
    local v31 = v14[4];
    local v32 = v14[5];
    local v33 = v14[6];
    local v34 = v14[7];
    local v35 = v14[8];
    for v36 = v16, v17, 128 do
        local l_v36_0 = v36;
        for v38 = 1, 16 do
            local v39, v40, v41, v42, v43, v44, v45, v46 = string.byte(v15, l_v36_0, l_v36_0 + 7);
            l_v1_0[v38] = bit32.bor(bit32.lshift(v39, 24), bit32.lshift(v40, 16), bit32.lshift(v41, 8), v42);
            l_v2_0[v38] = bit32.bor(bit32.lshift(v43, 24), bit32.lshift(v44, 16), bit32.lshift(v45, 8), v46);
            l_v36_0 = l_v36_0 + 8;
        end;
        for v47 = 17, 80 do
            local v48, v49 = lil_sig0(l_v1_0[v47 - 15], l_v2_0[v47 - 15]);
            local v50, v51 = lil_sig1(l_v1_0[v47 - 2], l_v2_0[v47 - 2]);
            local v52 = l_v2_0[v47 - 16] + v49 + l_v2_0[v47 - 7] + v51;
            l_v2_0[v47] = bit32.bor(v52, 0);
            l_v1_0[v47] = l_v1_0[v47 - 16] + v48 + l_v1_0[v47 - 7] + v50 + v52 // 4294967296;
        end;
        local l_v20_0 = v20;
        local l_v21_0 = v21;
        local l_v22_0 = v22;
        local l_v23_0 = v23;
        local l_v24_0 = v24;
        local l_v25_0 = v25;
        local l_v26_0 = v26;
        local l_v27_0 = v27;
        local l_v28_0 = v28;
        local l_v29_0 = v29;
        local l_v30_0 = v30;
        local l_v31_0 = v31;
        local l_v32_0 = v32;
        local l_v33_0 = v33;
        local l_v34_0 = v34;
        local l_v35_0 = v35;
        for v69 = 1, 80 do
            local v70, v71 = big_sig0(l_v20_0, l_v28_0);
            local v72, v73 = big_sig1(l_v24_0, l_v32_0);
            local v74 = l_v35_0 + v73 + bit32.bor(bit32.band(l_v32_0, l_v33_0), bit32.band(-1 - l_v32_0, l_v34_0), 0) + v4[v69] + l_v2_0[v69];
            local v75 = l_v27_0 + v72 + bit32.bor(bit32.band(l_v24_0, l_v25_0), bit32.band(-1 - l_v24_0, l_v26_0), 0) + v3[v69] + l_v1_0[v69] + v74 // 4294967296;
            v74 = bit32.bor(v74, 0);
            local v76 = v71 + bit32.band(l_v30_0, l_v29_0) + bit32.band(l_v28_0, (bit32.bxor(l_v30_0, l_v29_0)));
            local v77 = v70 + bit32.band(l_v22_0, l_v21_0) + bit32.band(l_v20_0, (bit32.bxor(l_v22_0, l_v21_0)));
            l_v27_0 = l_v26_0;
            l_v35_0 = l_v34_0;
            l_v26_0 = l_v25_0;
            l_v34_0 = l_v33_0;
            l_v25_0 = l_v24_0;
            l_v33_0 = l_v32_0;
            l_v32_0 = v74 + l_v31_0;
            l_v24_0 = v75 + l_v23_0 + l_v32_0 // 4294967296;
            l_v32_0 = bit32.bor(l_v32_0, 0);
            l_v23_0 = l_v22_0;
            l_v31_0 = l_v30_0;
            l_v22_0 = l_v21_0;
            l_v30_0 = l_v29_0;
            l_v21_0 = l_v20_0;
            l_v29_0 = l_v28_0;
            l_v28_0 = v74 + v76;
            l_v20_0 = v75 + v77 + l_v28_0 // 4294967296;
            l_v28_0 = bit32.bor(l_v28_0, 0);
        end;
        v28 = v28 + l_v28_0;
        v20 = bit32.bor(v20 + l_v20_0 + v28 // 4294967296, 0);
        v28 = bit32.bor(v28, 0);
        v29 = v29 + l_v29_0;
        v21 = bit32.bor(v21 + l_v21_0 + v29 // 4294967296, 0);
        v29 = bit32.bor(v29, 0);
        v30 = v30 + l_v30_0;
        v22 = bit32.bor(v22 + l_v22_0 + v30 // 4294967296, 0);
        v30 = bit32.bor(v30, 0);
        v31 = v31 + l_v31_0;
        v23 = bit32.bor(v23 + l_v23_0 + v31 // 4294967296, 0);
        v31 = bit32.bor(v31, 0);
        v32 = v32 + l_v32_0;
        v24 = bit32.bor(v24 + l_v24_0 + v32 // 4294967296, 0);
        v32 = bit32.bor(v32, 0);
        v33 = v33 + l_v33_0;
        v25 = bit32.bor(v25 + l_v25_0 + v33 // 4294967296, 0);
        v33 = bit32.bor(v33, 0);
        v34 = v34 + l_v34_0;
        v26 = bit32.bor(v26 + l_v26_0 + v34 // 4294967296, 0);
        v34 = bit32.bor(v34, 0);
        v35 = v35 + l_v35_0;
        v27 = bit32.bor(v27 + l_v27_0 + v35 // 4294967296, 0);
        v35 = bit32.bor(v35, 0);
    end;
    v13[1] = v20;
    v14[1] = v28;
    v13[2] = v21;
    v14[2] = v29;
    v13[3] = v22;
    v14[3] = v30;
    v13[4] = v23;
    v14[4] = v31;
    v13[5] = v24;
    v14[5] = v32;
    v13[6] = v25;
    v14[6] = v33;
    v13[7] = v26;
    v14[7] = v34;
    v13[8] = v27;
    v14[8] = v35;
end;
sha512 = function(v78) --[[ Line: 297 ]] --[[ Name: sha512 ]]
    local v79 = {
        1779033703, 
        3144134277, 
        1013904242, 
        2773480762, 
        1359893119, 
        2600822924, 
        528734635, 
        1541459225
    };
    local v80 = {
        4089235720, 
        2227873595, 
        4271175723, 
        1595750129, 
        2917565137, 
        725511199, 
        4215389547, 
        327033209
    };
    local v81 = #v78;
    if v81 > 1.125899906842624E15 then
        error("cannot calculate the SHA-512 hash of a string longer than 2^50 bytes", 2);
    end;
    local v82 = v81 % 128;
    if v81 >= 128 then
        processBlocks(v79, v80, v78, 1, v81 - v82);
    end;
    local v83 = bit32.band(v82 + 64, 4294963200);
    local v84 = {
        if v82 ~= 0 then string.sub(v78, -v82) else "", 
        "\128", 
        string.rep("\000", (v83 - v82 - 17) % 128), 
        string.pack(">L", v81 * 8 / 4294967296), 
        string.pack(">L", v81 * 8 % 4294967296)
    };
    local v85 = table.concat(v84);
    processBlocks(v79, v80, v85, 1, #v85);
    local v86 = buffer.create(64);
    for v87 = 1, 8 do
        buffer.writeu32(v86, 8 * (v87 - 1), (bit32.byteswap(v79[v87])));
        buffer.writeu32(v86, 8 * (v87 - 1) + 4, (bit32.byteswap(v80[v87])));
    end;
    return v86;
end;
local v90 = {
    Name = "SHA-512", 
    BlockSize = 128, 
    OutputSize = 64, 
    Digest = function(v88) --[[ Line: 347 ]] --[[ Name: Digest ]]
        return buffer.tostring(sha512(v88));
    end, 
    DigestBuffer = function(v89) --[[ Line: 350 ]] --[[ Name: DigestBuffer ]]
        return sha512(buffer.tostring(v89));
    end, 
    DigestToBuffer = sha512
};
table.freeze(v90);
return v90;