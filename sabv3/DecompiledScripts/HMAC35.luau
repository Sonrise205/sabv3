--!native
local _ = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash);
local function v17(v1, v2) --[[ Line: 46 ]] --[[ Name: Derive ]]
    local l_BlockSize_0 = v1.BlockSize;
    local l_v2_0 = v2;
    if l_BlockSize_0 < buffer.len(l_v2_0) then
        l_v2_0 = v1.DigestBuffer(l_v2_0);
    end;
    local v5 = buffer.create(l_BlockSize_0);
    buffer.copy(v5, 0, l_v2_0);
    local v6 = buffer.create(l_BlockSize_0);
    local v7 = buffer.create(l_BlockSize_0);
    for v8 = 0, l_BlockSize_0 - 1 do
        local v9 = buffer.readu8(v5, v8);
        buffer.writeu8(v6, v8, (bit32.bxor(v9, 92)));
        buffer.writeu8(v7, v8, (bit32.bxor(v9, 54)));
    end;
    local function v14(v10) --[[ Line: 72 ]] --[[ Name: ComputeHmac ]]
        -- upvalues: l_BlockSize_0 (copy), v7 (copy), v1 (copy), v6 (copy)
        local v11 = buffer.create(l_BlockSize_0 + buffer.len(v10));
        buffer.copy(v11, 0, v7);
        buffer.copy(v11, l_BlockSize_0, v10);
        local v12 = v1.DigestBuffer(v11);
        local v13 = buffer.create(l_BlockSize_0 + buffer.len(v12));
        buffer.copy(v13, 0, v6);
        buffer.copy(v13, l_BlockSize_0, v12);
        return v1.DigestBuffer(v13);
    end;
    return {
        Name = "HMAC-" .. v1.Name, 
        BlockSize = v1.BlockSize, 
        OutputSize = v1.OutputSize, 
        Digest = function(v15) --[[ Line: 92 ]] --[[ Name: Digest ]]
            -- upvalues: v14 (copy)
            return buffer.tostring(v14(buffer.fromstring(v15)));
        end, 
        DigestBuffer = v14, 
        DigestToBuffer = function(v16) --[[ Line: 96 ]] --[[ Name: DigestToBuffer ]]
            -- upvalues: v14 (copy)
            return v14(buffer.fromstring(v16));
        end
    };
end;
return {
    Derive = v17, 
    DeriveString = function(v18, v19) --[[ Line: 111 ]] --[[ Name: DeriveString ]]
        -- upvalues: v17 (copy)
        return (v17(v18, buffer.fromstring(v19)));
    end
};