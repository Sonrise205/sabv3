--!native
local _ = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash);
local v1 = table.create(80, 0);
processBlocks = function(v2, v3, v4, v5) --[[ Line: 37 ]] --[[ Name: processBlocks ]]
    -- upvalues: v1 (copy)
    local l_v1_0 = v1;
    local v7 = v2[1];
    local v8 = v2[2];
    local v9 = v2[3];
    local v10 = v2[4];
    local v11 = v2[5];
    for v12 = v4, v5, 64 do
        local l_v12_0 = v12;
        for v14 = 1, 16 do
            local v15, v16, v17, v18 = string.byte(v3, l_v12_0, l_v12_0 + 3);
            l_v1_0[v14] = bit32.bor(bit32.lshift(v15, 24), bit32.lshift(v16, 16), bit32.lshift(v17, 8), v18);
            l_v12_0 = l_v12_0 + 4;
        end;
        for v19 = 17, 80 do
            l_v1_0[v19] = bit32.lrotate(bit32.bxor(l_v1_0[v19 - 3], l_v1_0[v19 - 8], l_v1_0[v19 - 14], l_v1_0[v19 - 16]), 1);
        end;
        local l_v7_0 = v7;
        local l_v8_0 = v8;
        local l_v9_0 = v9;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        local v25 = nil;
        for v26 = 1, 20 do
            v25 = bit32.lrotate(l_v7_0, 5) + bit32.band(l_v8_0, l_v9_0) + bit32.band(bit32.bnot(l_v8_0), l_v10_0) + l_v11_0 + 1518500249 + l_v1_0[v26];
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v9_0;
            l_v9_0 = bit32.lrotate(l_v8_0, 30);
            l_v8_0 = l_v7_0;
            l_v7_0 = v25;
        end;
        for v27 = 21, 40 do
            v25 = bit32.lrotate(l_v7_0, 5) + bit32.bxor(l_v8_0, l_v9_0, l_v10_0) + l_v11_0 + 1859775393 + l_v1_0[v27];
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v9_0;
            l_v9_0 = bit32.lrotate(l_v8_0, 30);
            l_v8_0 = l_v7_0;
            l_v7_0 = v25;
        end;
        for v28 = 41, 60 do
            v25 = bit32.lrotate(l_v7_0, 5) + bit32.band(l_v10_0, l_v9_0) + bit32.band(l_v8_0, (bit32.bxor(l_v10_0, l_v9_0))) + l_v11_0 + 2400959708 + l_v1_0[v28];
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v9_0;
            l_v9_0 = bit32.lrotate(l_v8_0, 30);
            l_v8_0 = l_v7_0;
            l_v7_0 = v25;
        end;
        for v29 = 61, 80 do
            v25 = bit32.lrotate(l_v7_0, 5) + bit32.bxor(l_v8_0, l_v9_0, l_v10_0) + l_v11_0 + 3395469782 + l_v1_0[v29];
            l_v11_0 = l_v10_0;
            l_v10_0 = l_v9_0;
            l_v9_0 = bit32.lrotate(l_v8_0, 30);
            l_v8_0 = l_v7_0;
            l_v7_0 = v25;
        end;
        v7 = bit32.bor(l_v7_0 + v7, 0);
        v8 = bit32.bor(l_v8_0 + v8, 0);
        v9 = bit32.bor(l_v9_0 + v9, 0);
        v10 = bit32.bor(l_v10_0 + v10, 0);
        v11 = bit32.bor(l_v11_0 + v11, 0);
    end;
    v2[1] = v7;
    v2[2] = v8;
    v2[3] = v9;
    v2[4] = v10;
    v2[5] = v11;
end;
sha1 = function(v30) --[[ Line: 112 ]] --[[ Name: sha1 ]]
    local v31 = {
        1732584193, 
        4023233417, 
        2562383102, 
        271733878, 
        3285377520
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
        string.pack(">L", v32 * 8)
    };
    local v36 = table.concat(v35);
    processBlocks(v31, v36, 1, #v36);
    local v37 = buffer.create(20);
    buffer.writeu32(v37, 0, (bit32.byteswap(v31[1])));
    buffer.writeu32(v37, 4, (bit32.byteswap(v31[2])));
    buffer.writeu32(v37, 8, (bit32.byteswap(v31[3])));
    buffer.writeu32(v37, 12, (bit32.byteswap(v31[4])));
    buffer.writeu32(v37, 16, (bit32.byteswap(v31[5])));
    return v37;
end;
local v40 = {
    Name = "SHA-1", 
    BlockSize = 64, 
    OutputSize = 20, 
    Digest = function(v38) --[[ Line: 153 ]] --[[ Name: Digest ]]
        return buffer.tostring(sha1(v38));
    end, 
    DigestBuffer = function(v39) --[[ Line: 156 ]] --[[ Name: DigestBuffer ]]
        return sha1(buffer.tostring(v39));
    end, 
    DigestToBuffer = sha1
};
table.freeze(v40);
return v40;