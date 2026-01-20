--!native
local l_copy_0 = buffer.copy;
local l_create_0 = buffer.create;
local l_fill_0 = buffer.fill;
local l_len_0 = buffer.len;
local l_readu8_0 = buffer.readu8;
local l_writeu8_0 = buffer.writeu8;
local l_random_0 = math.random;
local v7 = {};
local function v9(v8) --[[ Line: 26 ]] --[[ Name: nonPad ]]
    return v8;
end;
v7.None = table.freeze({
    Pad = v9, 
    Unpad = v9, 
    Overwrite = false
});
local function v17(v10, v11, v12) --[[ Line: 39 ]] --[[ Name: anxPad ]]
    -- upvalues: l_len_0 (copy), l_copy_0 (copy), l_fill_0 (copy), l_writeu8_0 (copy), l_create_0 (copy)
    local v13 = l_len_0(v10);
    local v14 = v13 - v13 % v12;
    if v11 then
        assert(l_len_0(v11) >= v13 + v12, "Output buffer out of bounds");
        local v15 = v12 - v13 % v12;
        l_copy_0(v11, 0, v10, 0, v13);
        l_fill_0(v11, v13, 0, v15 - 1);
        l_writeu8_0(v11, v14 + v12 - 1, v15);
        return v11;
    else
        v14 = v14 + v12;
        local v16 = l_create_0(v14);
        l_copy_0(v16, 0, v10, 0, v13);
        l_writeu8_0(v16, v14 - 1, v12 - v13 % v12);
        return v16;
    end;
end;
local function _(v18, v19, v20) --[[ Line: 57 ]] --[[ Name: anxUnpad ]]
    -- upvalues: l_len_0 (copy), l_readu8_0 (copy), l_create_0 (copy), l_copy_0 (copy)
    local v21 = l_len_0(v18);
    local v22 = l_readu8_0(v18, v21 - 1);
    local v23 = v21 - v22;
    local v24 = false;
    if v22 > 0 then
        v24 = v22 <= v20;
    end;
    assert(v24, "Got unexpected padding");
    for v25 = v23, v21 - 2 do
        if l_readu8_0(v18, v25) ~= 0 then
            error("Got unexpected padding");
        end;
    end;
    if v19 then
        assert(v23 <= l_len_0(v19), "Output buffer out of bounds");
    else
        v19 = l_create_0(v23);
    end;
    l_copy_0(v19, 0, v18, 0, v23);
    return v19;
end;
local function v33(v27, v28, v29) --[[ Line: 79 ]] --[[ Name: i10Pad ]]
    -- upvalues: l_len_0 (copy), l_create_0 (copy), l_copy_0 (copy), l_random_0 (copy), l_writeu8_0 (copy)
    local v30 = l_len_0(v27);
    local v31 = v30 - v30 % v29;
    if v28 then
        assert(l_len_0(v28) >= v30 + v29, "Output buffer out of bounds");
    else
        v28 = l_create_0(v31 + v29);
    end;
    l_copy_0(v28, 0, v27, 0, v30);
    for v32 = v30, v31 + v29 - 2 do
        l_writeu8_0(v28, v32, (l_random_0(0, 255)));
    end;
    l_writeu8_0(v28, v31 + v29 - 1, v29 - v30 % v29);
    return v28;
end;
local function v41(v34, v35, v36) --[[ Line: 94 ]] --[[ Name: i10Unpad ]]
    -- upvalues: l_len_0 (copy), l_readu8_0 (copy), l_create_0 (copy), l_copy_0 (copy)
    local v37 = l_len_0(v34);
    local v38 = l_readu8_0(v34, v37 - 1);
    local v39 = v37 - v38;
    local v40 = false;
    if v38 > 0 then
        v40 = v38 <= v36;
    end;
    assert(v40, "Got unexpected padding");
    if v35 then
        assert(v39 <= l_len_0(v35), "Output buffer out of bounds");
    else
        v35 = l_create_0(v39);
    end;
    l_copy_0(v35, 0, v34, 0, v39);
    return v35;
end;
local function v48(v42, v43, v44) --[[ Line: 111 ]] --[[ Name: pksPad ]]
    -- upvalues: l_len_0 (copy), l_create_0 (copy), l_copy_0 (copy), l_fill_0 (copy)
    local v45 = l_len_0(v42);
    local v46 = v45 - v45 % v44;
    if v43 then
        assert(l_len_0(v43) >= v45 + v44, "Output buffer out of bounds");
    else
        v43 = l_create_0(v46 + v44);
    end;
    local v47 = v44 - v45 % v44;
    l_copy_0(v43, 0, v42, 0, v45);
    l_fill_0(v43, v45, v47, v47);
    return v43;
end;
local function v57(v49, v50, v51) --[[ Line: 124 ]] --[[ Name: pksUnpad ]]
    -- upvalues: l_len_0 (copy), l_readu8_0 (copy), l_create_0 (copy), l_copy_0 (copy)
    local v52 = l_len_0(v49);
    local v53 = l_readu8_0(v49, v52 - 1);
    local v54 = v52 - v53;
    local v55 = false;
    if v53 > 0 then
        v55 = v53 <= v51;
    end;
    assert(v55, "Got unexpected padding");
    for v56 = v54, v52 - 2 do
        if l_readu8_0(v49, v56) ~= v53 then
            error("Got unexpected padding");
        end;
    end;
    if v50 then
        assert(v54 <= l_len_0(v50), "Output buffer out of bounds");
    else
        v50 = l_create_0(v54);
    end;
    l_copy_0(v50, 0, v49, 0, v54);
    return v50;
end;
local function v62(v58, v59, v60) --[[ Line: 146 ]] --[[ Name: ii7Pad ]]
    -- upvalues: l_len_0 (copy), l_fill_0 (copy), l_create_0 (copy), l_copy_0 (copy), l_writeu8_0 (copy)
    local v61 = l_len_0(v58);
    if v59 then
        assert(l_len_0(v59) >= v61 + v60, "Output buffer out of bounds");
        l_fill_0(v59, v61 + 1, 0, v60 - v61 % v60 - 1);
    else
        v59 = l_create_0(v61 + v60 - v61 % v60);
    end;
    l_copy_0(v59, 0, v58, 0, v61);
    l_writeu8_0(v59, v61, 128);
    return v59;
end;
local function v69(v63, v64, v65) --[[ Line: 158 ]] --[[ Name: ii7Unpad ]]
    -- upvalues: l_len_0 (copy), l_readu8_0 (copy), l_create_0 (copy), l_copy_0 (copy)
    local v66 = l_len_0(v63) - 1;
    local v67 = nil;
    for v68 = v66, v66 - v65, -1 do
        v67 = l_readu8_0(v63, v68);
        if v67 == 128 then
            if v64 then
                assert(v68 <= l_len_0(v64), "Output buffer out of bounds");
            else
                v64 = l_create_0(v68);
            end;
            l_copy_0(v64, 0, v63, 0, v68);
            return v64;
        else
            assert(v67 == 0, "Got unexpected padding");
        end;
    end;
    error("Got unexpected padding");
    return l_create_0(0);
end;
local function v74(v70, v71, v72) --[[ Line: 182 ]] --[[ Name: zroPad ]]
    -- upvalues: l_len_0 (copy), l_fill_0 (copy), l_create_0 (copy), l_copy_0 (copy)
    local v73 = l_len_0(v70);
    if v71 then
        assert(l_len_0(v71) >= v73 + v72, "Output buffer out of bounds");
        l_fill_0(v71, v73, 0, v72 - v73 % v72);
    else
        v71 = l_create_0(v73 + v72 - v73 % v72);
    end;
    l_copy_0(v71, 0, v70, 0, v73);
    return v71;
end;
local function v82(v75, v76, v77) --[[ Line: 193 ]] --[[ Name: zroUnpad ]]
    -- upvalues: l_len_0 (copy), l_readu8_0 (copy), l_create_0 (copy), l_copy_0 (copy)
    local v78 = l_len_0(v75) - 1;
    local _ = nil;
    for v80 = v78, v78 - v77, -1 do
        local l_v80_0 = v80;
        if l_readu8_0(v75, l_v80_0) == 0 then
            l_v80_0 = l_v80_0 + 1;
            if v76 then
                assert(l_v80_0 <= l_len_0(v76), "Output buffer out of bounds");
            else
                v76 = l_create_0(l_v80_0);
            end;
            l_copy_0(v76, 0, v75, 0, l_v80_0);
            return v76;
        end;
    end;
    l_copy_0(v76, 0, v75, 0, v78 - v77 - 1);
    return v76;
end;
local v85 = {
    __index = function(_, v84) --[[ Line: 214 ]] --[[ Name: __index ]]
        -- upvalues: v17 (copy), v33 (copy), v41 (copy), v48 (copy), v57 (copy), v62 (copy), v69 (copy), v74 (copy), v82 (copy)
        if v84 == "AnsiX923" then
            return {
                Pad = v17, 
                Unpad = v17, 
                Overwrite = nil
            };
        elseif v84 == "Iso10126" then
            return {
                Pad = v33, 
                Unpad = v41, 
                Overwrite = nil
            };
        elseif v84 == "Pkcs7" then
            return {
                Pad = v48, 
                Unpad = v57, 
                Overwrite = nil
            };
        elseif v84 == "Iso7816_4" then
            return {
                Pad = v62, 
                Unpad = v69, 
                Overwrite = nil
            };
        elseif v84 == "Zero" then
            return {
                Pad = v74, 
                Unpad = v82, 
                Overwrite = nil
            };
        else
            return nil;
        end;
    end, 
    __newindex = function() --[[ Line: 232 ]] --[[ Name: __newindex ]]

    end
};
setmetatable(v7, v85);
v7.AnsiX923 = {};
v7.Iso10126 = {};
v7.Pkcs7 = {};
v7.Iso7816_4 = {};
v7.Zero = {};
table.freeze(v7);
v85.__metatable = "This metatable is locked";
return v7;