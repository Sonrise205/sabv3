--!native
local v0 = {};
for v1 = 0, 255 do
    local l_v1_0 = v1;
    for _ = 1, 8 do
        if bit32.band(l_v1_0, 1) ~= 0 then
            l_v1_0 = bit32.bxor(bit32.rshift(l_v1_0, 1), 3988292384);
        else
            l_v1_0 = bit32.rshift(l_v1_0, 1);
        end;
    end;
    v0[1 + v1] = l_v1_0;
end;
local v21 = {
    Init = function() --[[ Line: 45 ]] --[[ Name: Init ]]
        return 4294967295;
    end, 
    Update = function(v4, v5, v6, v7) --[[ Line: 49 ]] --[[ Name: Update ]]
        -- upvalues: v0 (copy)
        local v8 = v6 or 1;
        local v9 = v7 or string.len(v5);
        for v10 = v8, v8 + v9 - 1 do
            local v11 = string.byte(v5, v10);
            v4 = bit32.bxor(bit32.rshift(v4, 8), v0[bit32.band(bit32.bxor(v4, v11), 255) + 1]);
        end;
        return v4;
    end, 
    UpdateBuffer = function(v12, v13, v14, v15) --[[ Line: 65 ]] --[[ Name: UpdateBuffer ]]
        -- upvalues: v0 (copy)
        local v16 = v14 or 0;
        local v17 = v15 or buffer.len(v13);
        for v18 = v16, v16 + v17 - 1 do
            local v19 = buffer.readu8(v13, v18);
            v12 = bit32.bxor(bit32.rshift(v12, 8), v0[bit32.band(bit32.bxor(v12, v19), 255) + 1]);
        end;
        return v12;
    end, 
    Finish = function(v20) --[[ Line: 81 ]] --[[ Name: Finish ]]
        return (bit32.bnot(v20));
    end
};
v21.Digest = function(v22, v23, v24) --[[ Line: 87 ]] --[[ Name: Digest ]]
    -- upvalues: v21 (copy)
    local v25 = v21.Init();
    v25 = v21.Update(v25, v22, v23, v24);
    return v21.Finish(v25);
end;
v21.DigestBuffer = function(v26, v27, v28) --[[ Line: 97 ]] --[[ Name: DigestBuffer ]]
    -- upvalues: v21 (copy)
    local v29 = v21.Init();
    v29 = v21.UpdateBuffer(v29, v26, v27, v28);
    return v21.Finish(v29);
end;
return table.freeze(v21);