--!native
local function _(v0, v1) --[[ Line: 37 ]] --[[ Name: mult ]]
    return bit32.band(v0, 65535) * v1 + bit32.lshift(bit32.band(bit32.rshift(v0, 16) * v1, 65535), 16);
end;
return function(v3, v4) --[[ Line: 50 ]] --[[ Name: xxhash32 ]]
    local v5 = v4 == nil and 0 or bit32.bor(v4, 0);
    local v6 = #v3;
    local v7 = 1;
    local v8 = 1;
    local v9 = nil;
    if v6 >= 16 then
        local v10 = v5 + 2654435761 + 2246822519;
        local v11 = v5 + 2246822519;
        local l_v5_0 = v5;
        local v13 = v5 - 2654435761;
        for _ = 0, v6 - 16, 16 do
            local v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30 = string.byte(v3, v8, v8 + 15);
            local v31 = bit32.bor(bit32.lshift(v18, 24), bit32.lshift(v17, 16), bit32.lshift(v16, 8), v15);
            local v32 = bit32.lrotate(v10 + (bit32.band(v31, 65535) * 2246822519 + bit32.lshift(bit32.band(bit32.rshift(v31, 16) * 2246822519, 65535), 16)), 13);
            v10 = bit32.band(v32, 65535) * 2654435761 + bit32.lshift(bit32.band(bit32.rshift(v32, 16) * 2654435761, 65535), 16);
            v31 = bit32.bor(bit32.lshift(v22, 24), bit32.lshift(v21, 16), bit32.lshift(v20, 8), v19);
            v32 = bit32.lrotate(v11 + (bit32.band(v31, 65535) * 2246822519 + bit32.lshift(bit32.band(bit32.rshift(v31, 16) * 2246822519, 65535), 16)), 13);
            v11 = bit32.band(v32, 65535) * 2654435761 + bit32.lshift(bit32.band(bit32.rshift(v32, 16) * 2654435761, 65535), 16);
            v31 = bit32.bor(bit32.lshift(v26, 24), bit32.lshift(v25, 16), bit32.lshift(v24, 8), v23);
            v32 = bit32.lrotate(l_v5_0 + (bit32.band(v31, 65535) * 2246822519 + bit32.lshift(bit32.band(bit32.rshift(v31, 16) * 2246822519, 65535), 16)), 13);
            l_v5_0 = bit32.band(v32, 65535) * 2654435761 + bit32.lshift(bit32.band(bit32.rshift(v32, 16) * 2654435761, 65535), 16);
            v31 = bit32.bor(bit32.lshift(v30, 24), bit32.lshift(v29, 16), bit32.lshift(v28, 8), v27);
            v32 = bit32.lrotate(v13 + (bit32.band(v31, 65535) * 2246822519 + bit32.lshift(bit32.band(bit32.rshift(v31, 16) * 2246822519, 65535), 16)), 13);
            v13 = bit32.band(v32, 65535) * 2654435761 + bit32.lshift(bit32.band(bit32.rshift(v32, 16) * 2654435761, 65535), 16);
            v7 = v7 + 4;
            v8 = v8 + 16;
        end;
        v9 = bit32.lrotate(v10, 1) + bit32.lrotate(v11, 7) + bit32.lrotate(l_v5_0, 12) + bit32.lrotate(v13, 18);
    else
        v9 = bit32.bor(v5 + 374761393, 0);
    end;
    v9 = bit32.bor(v9 + v6, 0);
    for _ = v7, v6 // 4 do
        local v34, v35, v36, v37 = string.byte(v3, v8, v8 + 3);
        local v38 = bit32.bor(bit32.lshift(v37, 24), bit32.lshift(v36, 16), bit32.lshift(v35, 8), v34);
        local v39 = bit32.lrotate(v9 + (bit32.band(v38, 65535) * 3266489917 + bit32.lshift(bit32.band(bit32.rshift(v38, 16) * 3266489917, 65535), 16)), 17);
        v9 = bit32.band(v39, 65535) * 668265263 + bit32.lshift(bit32.band(bit32.rshift(v39, 16) * 668265263, 65535), 16);
        v7 = v7 + 1;
        v8 = v8 + 4;
    end;
    for v40 = -(v6 % 4), -1 do
        local v41 = string.byte(v3, v40);
        local v42 = bit32.lrotate(v9 + (bit32.band(v41, 65535) * 374761393 + bit32.lshift(bit32.band(bit32.rshift(v41, 16) * 374761393, 65535), 16)), 11);
        v9 = bit32.band(v42, 65535) * 2654435761 + bit32.lshift(bit32.band(bit32.rshift(v42, 16) * 2654435761, 65535), 16);
    end;
    local v43 = bit32.bxor(v9, (bit32.rshift(v9, 15)));
    v9 = bit32.band(v43, 65535) * 2246822519 + bit32.lshift(bit32.band(bit32.rshift(v43, 16) * 2246822519, 65535), 16);
    v43 = bit32.bxor(v9, (bit32.rshift(v9, 13)));
    v9 = bit32.band(v43, 65535) * 3266489917 + bit32.lshift(bit32.band(bit32.rshift(v43, 16) * 3266489917, 65535), 16);
    return (bit32.bxor(v9, (bit32.rshift(v9, 16))));
end;