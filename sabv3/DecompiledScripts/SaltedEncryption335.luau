--!native
local v0 = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.AES);
local v1 = require(game.ReplicatedStorage.UserGenerated.IO.Base64);
local v2 = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.HMAC);
local v3 = require(game.ReplicatedStorage.UserGenerated.Randoms.ISAAC);
local v4 = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.SHA256);
local _ = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash);
local v6 = v3.Unique();
local function v10(v7) --[[ Line: 44 ]] --[[ Name: GetRandomBytes ]]
    -- upvalues: v6 (copy)
    local v8 = buffer.create(v7);
    for v9 = 0, v7 - 1 do
        buffer.writeu8(v8, v9, (v6:NextInteger(0, 255)));
    end;
    return v8;
end;
local function v28(v11, v12, v13, v14, v15) --[[ Line: 62 ]] --[[ Name: PBKDF2 ]]
    -- upvalues: v2 (copy)
    local v16 = v2.Derive(v15, v11);
    local l_OutputSize_0 = v15.OutputSize;
    local v18 = math.ceil(v13 / l_OutputSize_0);
    local v19 = buffer.create(v13);
    local v20 = 0;
    for v21 = 1, v18 do
        local v22 = buffer.create(buffer.len(v12) + 4);
        buffer.copy(v22, 0, v12);
        buffer.writeu32(v22, buffer.len(v12), (bit32.byteswap(v21)));
        local v23 = v16.DigestBuffer(v22);
        local v24 = buffer.create(buffer.len(v23));
        buffer.copy(v24, 0, v23);
        for _ = 2, v14 do
            v23 = v16.DigestBuffer(v23);
            for v26 = 0, buffer.len(v23) - 1 do
                buffer.writeu8(v24, v26, (bit32.bxor(buffer.readu8(v24, v26), (buffer.readu8(v23, v26)))));
            end;
        end;
        local v27 = math.min(l_OutputSize_0, v13 - v20);
        buffer.copy(v19, v20, v24, 0, v27);
        v20 = v20 + v27;
    end;
    return v19;
end;
local function v35(v29) --[[ Line: 115 ]] --[[ Name: ApplyPKCS7Padding ]]
    local v30 = buffer.len(v29);
    local v31 = 16 - v30 % 16;
    local v32 = v30 + v31;
    local v33 = buffer.create(v32);
    buffer.copy(v33, 0, v29);
    for v34 = v30, v32 - 1 do
        buffer.writeu8(v33, v34, v31);
    end;
    return v33;
end;
local function v42(v36) --[[ Line: 137 ]] --[[ Name: RemovePKCS7Padding ]]
    local v37 = buffer.len(v36);
    if v37 == 0 then
        error("Invalid padding: empty input");
    end;
    local v38 = buffer.readu8(v36, v37 - 1);
    if v38 < 1 or v38 > 16 then
        error("Invalid padding length: " .. v38);
    end;
    for v39 = v37 - v38, v37 - 1 do
        if buffer.readu8(v36, v39) ~= v38 then
            error("Invalid padding");
        end;
    end;
    local v40 = v37 - v38;
    local v41 = buffer.create(v40);
    buffer.copy(v41, 0, v36, 0, v40);
    return v41;
end;
local function v56(v43, v44, v45) --[[ Line: 172 ]] --[[ Name: Encrypt ]]
    -- upvalues: v4 (copy), v10 (copy), v28 (copy), v35 (copy), v0 (copy), v1 (copy)
    local v46 = v45 or v4;
    local v47 = buffer.fromstring(v43);
    local v48 = v10(8);
    local v49 = v28(v44, v48, 48, 10000, v46);
    local v50 = buffer.create(32);
    buffer.copy(v50, 0, v49, 0, 32);
    local v51 = buffer.create(16);
    buffer.copy(v51, 0, v49, 32, 16);
    local v52 = v35(v47);
    local v53 = v0.new(buffer.tostring(v50), v0.modes.CBC, v0.pads.None):Encrypt(v52, nil, v51);
    local v54 = 16 + buffer.len(v53);
    local v55 = buffer.create(v54);
    buffer.writestring(v55, 0, "Salted__");
    buffer.copy(v55, 8, v48);
    buffer.copy(v55, 16, v53);
    return buffer.tostring(v1.EncodeBuffer(v55));
end;
local function v71(v57, v58, v59) --[[ Line: 226 ]] --[[ Name: Decrypt ]]
    -- upvalues: v4 (copy), v1 (copy), v28 (copy), v0 (copy), v42 (copy)
    local v60 = v59 or v4;
    local v61 = v1.DecodeBuffer(buffer.fromstring(v57));
    if buffer.len(v61) < 16 then
        error("Invalid data: too short");
    end;
    local v62 = buffer.create(8);
    buffer.copy(v62, 0, v61, 0, 8);
    if buffer.tostring(v62) ~= "Salted__" then
        error("Invalid data: Missing 'Salted__' header");
    end;
    local v63 = buffer.create(8);
    buffer.copy(v63, 0, v61, 8, 8);
    local v64 = buffer.len(v61) - 16;
    local v65 = buffer.create(v64);
    buffer.copy(v65, 0, v61, 16, v64);
    local v66 = v28(v58, v63, 48, 10000, v60);
    local v67 = buffer.create(32);
    buffer.copy(v67, 0, v66, 0, 32);
    local v68 = buffer.create(16);
    buffer.copy(v68, 0, v66, 32, 16);
    local v69 = v0.new(buffer.tostring(v67), v0.modes.CBC, v0.pads.None):Decrypt(v65, nil, v68);
    local v70 = v42(v69);
    return buffer.tostring(v70);
end;
local v78 = {
    Encrypt = v56, 
    Decrypt = v71, 
    EncryptString = function(v72, v73, v74) --[[ Line: 287 ]] --[[ Name: EncryptString ]]
        -- upvalues: v56 (copy)
        return v56(v72, buffer.fromstring(v73), v74);
    end, 
    DecryptString = function(v75, v76, v77) --[[ Line: 300 ]] --[[ Name: DecryptString ]]
        -- upvalues: v71 (copy)
        return v71(v75, buffer.fromstring(v76), v77);
    end, 
    PBKDF2 = v28, 
    GetRandomBytes = v10
};
table.freeze(v78);
return v78;