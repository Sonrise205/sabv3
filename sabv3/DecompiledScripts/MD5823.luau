--!native
local _ = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash);
local v1 = {
    3614090360, 
    3905402710, 
    606105819, 
    3250441966, 
    4118548399, 
    1200080426, 
    2821735955, 
    4249261313, 
    1770035416, 
    2336552879, 
    4294925233, 
    2304563134, 
    1804603682, 
    4254626195, 
    2792965006, 
    1236535329, 
    4129170786, 
    3225465664, 
    643717713, 
    3921069994, 
    3593408605, 
    38016083, 
    3634488961, 
    3889429448, 
    568446438, 
    3275163606, 
    4107603335, 
    1163531501, 
    2850285829, 
    4243563512, 
    1735328473, 
    2368359562, 
    4294588738, 
    2272392833, 
    1839030562, 
    4259657740, 
    2763975236, 
    1272893353, 
    4139469664, 
    3200236656, 
    681279174, 
    3936430074, 
    3572445317, 
    76029189, 
    3654602809, 
    3873151461, 
    530742520, 
    3299628645, 
    4096336452, 
    1126891415, 
    2878612391, 
    4237533241, 
    1700485571, 
    2399980690, 
    4293915773, 
    2240044497, 
    1873313359, 
    4264355552, 
    2734768916, 
    1309151649, 
    4149444226, 
    3174756917, 
    718787259, 
    3951481745
};
local v2 = {
    7, 
    12, 
    17, 
    22, 
    7, 
    12, 
    17, 
    22, 
    7, 
    12, 
    17, 
    22, 
    7, 
    12, 
    17, 
    22, 
    5, 
    9, 
    14, 
    20, 
    5, 
    9, 
    14, 
    20, 
    5, 
    9, 
    14, 
    20, 
    5, 
    9, 
    14, 
    20, 
    4, 
    11, 
    16, 
    23, 
    4, 
    11, 
    16, 
    23, 
    4, 
    11, 
    16, 
    23, 
    4, 
    11, 
    16, 
    23, 
    6, 
    10, 
    15, 
    21, 
    6, 
    10, 
    15, 
    21, 
    6, 
    10, 
    15, 
    21, 
    6, 
    10, 
    15, 
    21
};
local v3 = table.create(64, 0);
processBlocks = function(v4, v5, v6, v7) --[[ Line: 66 ]] --[[ Name: processBlocks ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local l_v3_0 = v3;
    local v9 = v4[1];
    local v10 = v4[2];
    local v11 = v4[3];
    local v12 = v4[4];
    for v13 = v6, v7, 64 do
        local l_v13_0 = v13;
        for v15 = 1, 16 do
            local v16, v17, v18, v19 = string.byte(v5, l_v13_0, l_v13_0 + 3);
            l_v3_0[v15] = bit32.bor(bit32.lshift(v19, 24), bit32.lshift(v18, 16), bit32.lshift(v17, 8), v16);
            l_v13_0 = l_v13_0 + 4;
        end;
        local l_v9_0 = v9;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        local l_v12_0 = v12;
        local v24 = 0;
        local v25 = 0;
        for v26 = 0, 15 do
            v25 = bit32.bxor(l_v12_0, (bit32.band(l_v10_0, (bit32.bxor(l_v11_0, l_v12_0)))));
            v24 = l_v12_0;
            l_v12_0 = l_v11_0;
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v10_0 + bit32.lrotate(l_v9_0 + v25 + v1[v26 + 1] + l_v3_0[v26 + 1], v2[v26 + 1]);
            l_v9_0 = v24;
        end;
        for v27 = 16, 31 do
            v25 = bit32.bxor(l_v11_0, (bit32.band(l_v12_0, (bit32.bxor(l_v10_0, l_v11_0)))));
            v24 = l_v12_0;
            l_v12_0 = l_v11_0;
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v10_0 + bit32.lrotate(l_v9_0 + v25 + v1[v27 + 1] + l_v3_0[(5 * v27 + 1) % 16 + 1], v2[v27 + 1]);
            l_v9_0 = v24;
        end;
        for v28 = 32, 47 do
            v25 = bit32.bxor(l_v10_0, l_v11_0, l_v12_0);
            v24 = l_v12_0;
            l_v12_0 = l_v11_0;
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v10_0 + bit32.lrotate(l_v9_0 + v25 + v1[v28 + 1] + l_v3_0[(3 * v28 + 5) % 16 + 1], v2[v28 + 1]);
            l_v9_0 = v24;
        end;
        for v29 = 48, 63 do
            v25 = bit32.bxor(l_v11_0, (bit32.bor(l_v10_0, (bit32.bnot(l_v12_0)))));
            v24 = l_v12_0;
            l_v12_0 = l_v11_0;
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v10_0 + bit32.lrotate(l_v9_0 + v25 + v1[v29 + 1] + l_v3_0[7 * v29 % 16 + 1], v2[v29 + 1]);
            l_v9_0 = v24;
        end;
        v9 = bit32.bor(l_v9_0 + v9);
        v10 = bit32.bor(l_v10_0 + v10);
        v11 = bit32.bor(l_v11_0 + v11);
        v12 = bit32.bor(l_v12_0 + v12);
    end;
    v4[1] = v9;
    v4[2] = v10;
    v4[3] = v11;
    v4[4] = v12;
end;
md5 = function(v30) --[[ Line: 141 ]] --[[ Name: md5 ]]
    local v31 = {
        1732584193, 
        4023233417, 
        2562383102, 
        271733878
    };
    local v32 = #v30;
    local v33 = v32 % 64;
    if v32 >= 64 then
        processBlocks(v31, v30, 1, v32 - v33);
    end;
    local v34 = bit32.band(v33 + 32, 4294967232);
    local v35 = {
        if v33 ~= 0 then string.sub(v30, -v33) else "", 
        "\128", 
        string.rep("\000", (v34 - v33 - 9) % 64), 
        string.pack("<L", v32 * 8)
    };
    local v36 = table.concat(v35);
    processBlocks(v31, v36, 1, #v36);
    local v37 = buffer.create(16);
    buffer.writeu32(v37, 0, v31[1]);
    buffer.writeu32(v37, 4, v31[2]);
    buffer.writeu32(v37, 8, v31[3]);
    buffer.writeu32(v37, 12, v31[4]);
    return v37;
end;
local v40 = {
    Name = "MD5", 
    BlockSize = 64, 
    OutputSize = 16, 
    Digest = function(v38) --[[ Line: 181 ]] --[[ Name: Digest ]]
        return buffer.tostring(md5(v38));
    end, 
    DigestBuffer = function(v39) --[[ Line: 184 ]] --[[ Name: DigestBuffer ]]
        return md5(buffer.tostring(v39));
    end, 
    DigestToBuffer = md5
};
table.freeze(v40);
return v40;