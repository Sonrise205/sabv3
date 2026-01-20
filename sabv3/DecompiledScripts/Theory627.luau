--!native
local function v3(v0) --[[ Line: 23 ]] --[[ Name: MatClone ]]
    local v1 = table.clone(v0);
    for v2 = 1, #v1 do
        v1[v2] = table.clone(v1[v2]);
    end;
    return v1;
end;
local function v7(v4) --[[ Line: 33 ]] --[[ Name: MatZero ]]
    local v5 = table.create(v4);
    for v6 = 1, v4 do
        v5[v6] = table.create(v4, 0);
    end;
    return v5;
end;
local function v11(v8) --[[ Line: 43 ]] --[[ Name: MatIdent ]]
    -- upvalues: v7 (copy)
    local v9 = v7(v8);
    for v10 = 1, v8 do
        v9[v10][v10] = 1;
    end;
    return v9;
end;
local function v23(v12, v13) --[[ Line: 53 ]] --[[ Name: MatMul ]]
    local v14 = {};
    local v15 = #v12;
    local v16 = #v12[1];
    local v17 = #v13[1];
    for v18 = 1, v15 do
        local v19 = table.create(v17, 0);
        for v20 = 1, v17 do
            local v21 = 0;
            for v22 = 1, v16 do
                v21 = bit32.bxor(v21, (bit32.band(v12[v18][v22], v13[v22][v20])));
            end;
            v19[v20] = v21;
        end;
        v14[v18] = v19;
    end;
    return v14;
end;
local function v32(v24, v25) --[[ Line: 73 ]] --[[ Name: MatMulVec ]]
    local v26 = #v24;
    local v27 = #v24[1];
    local v28 = table.create(v26, 0);
    for v29 = 1, v26 do
        local v30 = 0;
        for v31 = 1, v27 do
            v30 = bit32.bxor(v30, (bit32.band(v24[v29][v31], v25[v31])));
        end;
        v28[v29] = v30;
    end;
    return v28;
end;
local function v40(v33, v34) --[[ Line: 89 ]] --[[ Name: MatSum ]]
    -- upvalues: v7 (copy)
    local v35 = #v33;
    local v36 = #v33[1];
    local v37 = v7(v35);
    for v38 = 1, v35 do
        for v39 = 1, v36 do
            v37[v38][v39] = bit32.bxor(v33[v38][v39], v34[v38][v39]);
        end;
    end;
    return v37;
end;
local function v54(v41) --[[ Line: 103 ]] --[[ Name: MatInverse ]]
    -- upvalues: v3 (copy), v7 (copy)
    local v42 = #v41;
    local v43 = v3(v41);
    local v44 = v7(v42);
    for v45 = 1, v42 do
        v44[v45][v45] = 1;
    end;
    local l_v44_0 = v44;
    for v47 = 1, v42 do
        local v48 = nil;
        for v49 = v47, v42 do
            if v43[v49][v47] == 1 then
                v48 = v49;
                break;
            end;
        end;
        assert(v48, "not invertible");
        local v50 = v43[v48];
        local v51 = v43[v47];
        v43[v47] = v50;
        v43[v48] = v51;
        v50 = l_v44_0[v48];
        v51 = l_v44_0[v47];
        l_v44_0[v47] = v50;
        l_v44_0[v48] = v51;
        for v52 = 1, v42 do
            if v52 ~= v47 and v43[v52][v47] == 1 then
                for v53 = 1, v42 do
                    v43[v52][v53] = bit32.bxor(v43[v52][v53], v43[v47][v53]);
                    l_v44_0[v52][v53] = bit32.bxor(l_v44_0[v52][v53], l_v44_0[v47][v53]);
                end;
            end;
        end;
    end;
    return l_v44_0;
end;
local function v61(v55, v56) --[[ Line: 132 ]] --[[ Name: MatPow ]]
    -- upvalues: v7 (copy), v54 (copy), v3 (copy), v23 (copy)
    local v57 = #v55;
    local v58 = v7(v57);
    for v59 = 1, v57 do
        v58[v59][v59] = 1;
    end;
    local l_v58_0 = v58;
    v57 = if v56 < 0 then v54(v55) else v3(v55);
    v56 = math.abs(v56);
    while v56 > 0 do
        if math.fmod(v56, 2) >= 0.5 then
            l_v58_0 = v23(l_v58_0, v57);
        end;
        v57 = v23(v57, v57);
        v56 = math.floor(v56 / 2);
    end;
    return l_v58_0;
end;
local function v66(v62, v63) --[[ Line: 150 ]] --[[ Name: L ]]
    -- upvalues: v7 (copy)
    local v64 = v7(v63);
    for v65 = 1, v63 - v62 do
        v64[v65][v65 + v62] = 1;
    end;
    return v64;
end;
local function v71(v67, v68) --[[ Line: 161 ]] --[[ Name: R ]]
    -- upvalues: v7 (copy)
    local v69 = v7(v68);
    for v70 = v67 + 1, v68 do
        v69[v70][v70 - v67] = 1;
    end;
    return v69;
end;
local function v79(v72, v73, v74, v75) --[[ Line: 172 ]] --[[ Name: Embed ]]
    -- upvalues: v7 (copy)
    local v76 = v7(v73);
    for v77 = 1, #v72 do
        for v78 = 1, #v72[1] do
            v76[v74 + v77][v75 + v78] = v72[v77][v78];
        end;
    end;
    return v76;
end;
local function v86(v80, v81, v82, v83) --[[ Line: 187 ]] --[[ Name: ToColumnVector128 ]]
    local v84 = table.create(128, 0);
    for v85 = 0, 31 do
        v84[32 - v85] = bit32.band(bit32.rshift(v80, v85), 1);
        v84[64 - v85] = bit32.band(bit32.rshift(v81, v85), 1);
        v84[96 - v85] = bit32.band(bit32.rshift(v82, v85), 1);
        v84[128 - v85] = bit32.band(bit32.rshift(v83, v85), 1);
    end;
    return v84;
end;
local function v93(v87) --[[ Line: 203 ]] --[[ Name: FromColumnVector128 ]]
    local v88 = 0;
    local v89 = 0;
    local v90 = 0;
    local v91 = 0;
    for v92 = 0, 31 do
        v88 = bit32.bor(v88, (bit32.lshift(v87[32 - v92], v92)));
        v89 = bit32.bor(v89, (bit32.lshift(v87[64 - v92], v92)));
        v90 = bit32.bor(v90, (bit32.lshift(v87[96 - v92], v92)));
        v91 = bit32.bor(v91, (bit32.lshift(v87[128 - v92], v92)));
    end;
    return v88, v89, v90, v91;
end;
local v98 = (function() --[[ Line: 216 ]] --[[ Name: BuildMatTransform ]]
    -- upvalues: v11 (copy), v66 (copy), v23 (copy), v40 (copy), v79 (copy), v71 (copy)
    local v94 = v11(32);
    local v95 = v11(128);
    local l_v95_0 = v95;
    local v97 = v66(11, 32);
    l_v95_0 = v23(v40(v95, (v79(v97, 128, 0, 0))), l_v95_0);
    v97 = v71(8, 32);
    l_v95_0 = v23(v40(v95, (v79(v97, 128, 0, 0))), l_v95_0);
    l_v95_0 = v23(v40(v95, (v79(v94, 128, 0, 96))), l_v95_0);
    v97 = v71(19, 32);
    l_v95_0 = v23(v40(v95, (v79(v97, 128, 0, 96))), l_v95_0);
    return (v23(v40(v66(32, 128), (v71(96, 128))), l_v95_0));
end)();
local v105 = {
    ToColumnVector128 = v86, 
    FromColumnVector128 = v93, 
    MatTransform = function() --[[ Line: 249 ]] --[[ Name: MatTransform ]]
        -- upvalues: v3 (copy), v98 (copy)
        return (v3(v98));
    end, 
    Transform = function(v99, v100, v101, v102, v103) --[[ Line: 253 ]] --[[ Name: Transform ]]
        -- upvalues: v86 (copy), v32 (copy), v61 (copy), v3 (copy), v98 (copy), v93 (copy)
        local v104 = v86(v99, v100, v101, v102);
        v104 = v32(v61(v3(v98), v103), v104);
        return v93(v104);
    end
};
return table.freeze(v105);