--!native
local l_bxor_0 = bit32.bxor;
local l_rrotate_0 = bit32.rrotate;
local l_copy_0 = buffer.copy;
local l_create_0 = buffer.create;
local l_fromstring_0 = buffer.fromstring;
local l_len_0 = buffer.len;
local l_readu8_0 = buffer.readu8;
local l_readu16_0 = buffer.readu16;
local l_readu32_0 = buffer.readu32;
local l_tostring_0 = buffer.tostring;
local l_writestring_0 = buffer.writestring;
local l_writeu8_0 = buffer.writeu8;
local l_writeu16_0 = buffer.writeu16;
local l_writeu32_0 = buffer.writeu32;
local l_floor_0 = math.floor;
local l_sub_0 = string.sub;
local v16 = l_create_0(131072);
local v17 = l_create_0(65536);
local v18 = l_create_0(65536);
local v19 = l_create_0(65536);
local v20 = l_create_0(65536);
local v21 = l_create_0(65536);
local function v31(v22, v23, v24, v25) --[[ Line: 158 ]] --[[ Name: keySchedule ]]
    -- upvalues: l_copy_0 (copy), l_writestring_0 (copy), l_readu32_0 (copy), l_rrotate_0 (copy), v16 (copy), l_floor_0 (copy), l_readu16_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy)
    if v25 then
        l_copy_0(v24, 0, v22, 0, v23);
    else
        l_writestring_0(v24, 0, v22, v23);
    end;
    local v26 = l_rrotate_0(l_readu32_0(v24, v23 - 4), 8);
    local v27 = 0.5;
    if v23 == 32 then
        for v28 = 32, 192, 32 do
            v27 = v27 * 2 % 229;
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 32), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2), v27);
            l_writeu32_0(v24, v28, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 28), v26);
            l_writeu32_0(v24, v28 + 4, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 24), v26);
            l_writeu32_0(v24, v28 + 8, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 20), v26);
            l_writeu32_0(v24, v28 + 12, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 16), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2));
            l_writeu32_0(v24, v28 + 16, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 12), v26);
            l_writeu32_0(v24, v28 + 20, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 8), v26);
            l_writeu32_0(v24, v28 + 24, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v28 - 4), v26);
            l_writeu32_0(v24, v28 + 28, v26);
            v26 = l_rrotate_0(v26, 8);
        end;
        v26 = l_bxor_0(l_readu32_0(v24, 192), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2), 64);
        l_writeu32_0(v24, 224, v26);
        v26 = l_bxor_0(l_readu32_0(v24, 196), v26);
        l_writeu32_0(v24, 228, v26);
        v26 = l_bxor_0(l_readu32_0(v24, 200), v26);
        l_writeu32_0(v24, 232, v26);
        l_writeu32_0(v24, 236, (l_bxor_0(l_readu32_0(v24, 204), v26)));
        return v24;
    elseif v23 == 24 then
        for v29 = 24, 168, 24 do
            v27 = v27 * 2 % 229;
            v26 = l_bxor_0(l_readu32_0(v24, v29 - 24), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2), v27);
            l_writeu32_0(v24, v29, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v29 - 20), v26);
            l_writeu32_0(v24, v29 + 4, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v29 - 16), v26);
            l_writeu32_0(v24, v29 + 8, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v29 - 12), v26);
            l_writeu32_0(v24, v29 + 12, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v29 - 8), v26);
            l_writeu32_0(v24, v29 + 16, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v29 - 4), v26);
            l_writeu32_0(v24, v29 + 20, v26);
            v26 = l_rrotate_0(v26, 8);
        end;
        v26 = l_bxor_0(l_readu32_0(v24, 168), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2), 128);
        l_writeu32_0(v24, 192, v26);
        v26 = l_bxor_0(l_readu32_0(v24, 172), v26);
        l_writeu32_0(v24, 196, v26);
        v26 = l_bxor_0(l_readu32_0(v24, 176), v26);
        l_writeu32_0(v24, 200, v26);
        l_writeu32_0(v24, 204, (l_bxor_0(l_readu32_0(v24, 180), v26)));
        return v24;
    else
        for v30 = 16, 144, 16 do
            v27 = v27 * 2 % 229;
            v26 = l_bxor_0(l_readu32_0(v24, v30 - 16), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2), v27);
            l_writeu32_0(v24, v30, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v30 - 12), v26);
            l_writeu32_0(v24, v30 + 4, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v30 - 8), v26);
            l_writeu32_0(v24, v30 + 8, v26);
            v26 = l_bxor_0(l_readu32_0(v24, v30 - 4), v26);
            l_writeu32_0(v24, v30 + 12, v26);
            v26 = l_rrotate_0(v26, 8);
        end;
        v26 = l_bxor_0(l_readu32_0(v24, 144), l_readu16_0(v16, l_floor_0(v26 / 65536) * 2) * 65536 + l_readu16_0(v16, v26 % 65536 * 2), 54);
        l_writeu32_0(v24, 160, v26);
        v26 = l_bxor_0(l_readu32_0(v24, 148), v26);
        l_writeu32_0(v24, 164, v26);
        v26 = l_bxor_0(l_readu32_0(v24, 152), v26);
        l_writeu32_0(v24, 168, v26);
        l_writeu32_0(v24, 172, (l_bxor_0(l_readu32_0(v24, 156), v26)));
        return v24;
    end;
end;
local function v71(v32, v33, v34, v35, v36, v37) --[[ Line: 259 ]] --[[ Name: encryptBlock ]]
    -- upvalues: l_readu8_0 (copy), l_bxor_0 (copy), v17 (copy), v18 (copy), v16 (copy), l_readu16_0 (copy), l_readu32_0 (copy), l_writeu32_0 (copy)
    local v38 = l_bxor_0(l_readu8_0(v34, v35), (l_readu8_0(v32, 0)));
    local v39 = l_bxor_0(l_readu8_0(v34, v35 + 1), (l_readu8_0(v32, 1)));
    local v40 = l_bxor_0(l_readu8_0(v34, v35 + 2), (l_readu8_0(v32, 2)));
    local v41 = l_bxor_0(l_readu8_0(v34, v35 + 3), (l_readu8_0(v32, 3)));
    local v42 = l_bxor_0(l_readu8_0(v34, v35 + 4), (l_readu8_0(v32, 4)));
    local v43 = l_bxor_0(l_readu8_0(v34, v35 + 5), (l_readu8_0(v32, 5)));
    local v44 = l_bxor_0(l_readu8_0(v34, v35 + 6), (l_readu8_0(v32, 6)));
    local v45 = l_bxor_0(l_readu8_0(v34, v35 + 7), (l_readu8_0(v32, 7)));
    local v46 = l_bxor_0(l_readu8_0(v34, v35 + 8), (l_readu8_0(v32, 8)));
    local v47 = l_bxor_0(l_readu8_0(v34, v35 + 9), (l_readu8_0(v32, 9)));
    local v48 = l_bxor_0(l_readu8_0(v34, v35 + 10), (l_readu8_0(v32, 10)));
    local v49 = l_bxor_0(l_readu8_0(v34, v35 + 11), (l_readu8_0(v32, 11)));
    local v50 = l_bxor_0(l_readu8_0(v34, v35 + 12), (l_readu8_0(v32, 12)));
    local v51 = l_bxor_0(l_readu8_0(v34, v35 + 13), (l_readu8_0(v32, 13)));
    local v52 = l_bxor_0(l_readu8_0(v34, v35 + 14), (l_readu8_0(v32, 14)));
    local v53 = l_bxor_0(l_readu8_0(v34, v35 + 15), (l_readu8_0(v32, 15)));
    local v54 = v38 * 256 + v43;
    local v55 = v43 * 256 + v48;
    local v56 = v48 * 256 + v53;
    local v57 = v53 * 256 + v38;
    local v58 = v42 * 256 + v47;
    local v59 = v47 * 256 + v52;
    local v60 = v52 * 256 + v41;
    local v61 = v41 * 256 + v42;
    local v62 = v46 * 256 + v51;
    local v63 = v51 * 256 + v40;
    local v64 = v40 * 256 + v45;
    local v65 = v45 * 256 + v46;
    local v66 = v50 * 256 + v39;
    local v67 = v39 * 256 + v44;
    local v68 = v44 * 256 + v49;
    local v69 = v49 * 256 + v50;
    for v70 = 16, v33, 16 do
        v38 = l_bxor_0(l_readu8_0(v17, v54), l_readu8_0(v18, v56), (l_readu8_0(v32, v70)));
        v39 = l_bxor_0(l_readu8_0(v17, v55), l_readu8_0(v18, v57), (l_readu8_0(v32, v70 + 1)));
        v40 = l_bxor_0(l_readu8_0(v17, v56), l_readu8_0(v18, v54), (l_readu8_0(v32, v70 + 2)));
        v41 = l_bxor_0(l_readu8_0(v17, v57), l_readu8_0(v18, v55), (l_readu8_0(v32, v70 + 3)));
        v42 = l_bxor_0(l_readu8_0(v17, v58), l_readu8_0(v18, v60), (l_readu8_0(v32, v70 + 4)));
        v43 = l_bxor_0(l_readu8_0(v17, v59), l_readu8_0(v18, v61), (l_readu8_0(v32, v70 + 5)));
        v44 = l_bxor_0(l_readu8_0(v17, v60), l_readu8_0(v18, v58), (l_readu8_0(v32, v70 + 6)));
        v45 = l_bxor_0(l_readu8_0(v17, v61), l_readu8_0(v18, v59), (l_readu8_0(v32, v70 + 7)));
        v46 = l_bxor_0(l_readu8_0(v17, v62), l_readu8_0(v18, v64), (l_readu8_0(v32, v70 + 8)));
        v47 = l_bxor_0(l_readu8_0(v17, v63), l_readu8_0(v18, v65), (l_readu8_0(v32, v70 + 9)));
        v48 = l_bxor_0(l_readu8_0(v17, v64), l_readu8_0(v18, v62), (l_readu8_0(v32, v70 + 10)));
        v49 = l_bxor_0(l_readu8_0(v17, v65), l_readu8_0(v18, v63), (l_readu8_0(v32, v70 + 11)));
        v50 = l_bxor_0(l_readu8_0(v17, v66), l_readu8_0(v18, v68), (l_readu8_0(v32, v70 + 12)));
        v51 = l_bxor_0(l_readu8_0(v17, v67), l_readu8_0(v18, v69), (l_readu8_0(v32, v70 + 13)));
        v52 = l_bxor_0(l_readu8_0(v17, v68), l_readu8_0(v18, v66), (l_readu8_0(v32, v70 + 14)));
        v53 = l_bxor_0(l_readu8_0(v17, v69), l_readu8_0(v18, v67), (l_readu8_0(v32, v70 + 15)));
        v54 = v38 * 256 + v43;
        v55 = v43 * 256 + v48;
        v56 = v48 * 256 + v53;
        v57 = v53 * 256 + v38;
        v58 = v42 * 256 + v47;
        v59 = v47 * 256 + v52;
        v60 = v52 * 256 + v41;
        v61 = v41 * 256 + v42;
        v62 = v46 * 256 + v51;
        v63 = v51 * 256 + v40;
        v64 = v40 * 256 + v45;
        v65 = v45 * 256 + v46;
        v66 = v50 * 256 + v39;
        v67 = v39 * 256 + v44;
        v68 = v44 * 256 + v49;
        v69 = v49 * 256 + v50;
    end;
    l_writeu32_0(v36, v37, (l_bxor_0(l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v69), l_readu8_0(v18, v67), (l_readu8_0(v32, v33 + 31))) * 512 + l_bxor_0(l_readu8_0(v17, v64), l_readu8_0(v18, v62), (l_readu8_0(v32, v33 + 26))) * 2) * 65536 + l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v59), l_readu8_0(v18, v61), (l_readu8_0(v32, v33 + 21))) * 512 + l_bxor_0(l_readu8_0(v17, v54), l_readu8_0(v18, v56), (l_readu8_0(v32, v33 + 16))) * 2), (l_readu32_0(v32, v33 + 32)))));
    l_writeu32_0(v36, v37 + 4, (l_bxor_0(l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v57), l_readu8_0(v18, v55), (l_readu8_0(v32, v33 + 19))) * 512 + l_bxor_0(l_readu8_0(v17, v68), l_readu8_0(v18, v66), (l_readu8_0(v32, v33 + 30))) * 2) * 65536 + l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v63), l_readu8_0(v18, v65), (l_readu8_0(v32, v33 + 25))) * 512 + l_bxor_0(l_readu8_0(v17, v58), l_readu8_0(v18, v60), (l_readu8_0(v32, v33 + 20))) * 2), (l_readu32_0(v32, v33 + 36)))));
    l_writeu32_0(v36, v37 + 8, (l_bxor_0(l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v61), l_readu8_0(v18, v59), (l_readu8_0(v32, v33 + 23))) * 512 + l_bxor_0(l_readu8_0(v17, v56), l_readu8_0(v18, v54), (l_readu8_0(v32, v33 + 18))) * 2) * 65536 + l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v67), l_readu8_0(v18, v69), (l_readu8_0(v32, v33 + 29))) * 512 + l_bxor_0(l_readu8_0(v17, v62), l_readu8_0(v18, v64), (l_readu8_0(v32, v33 + 24))) * 2), (l_readu32_0(v32, v33 + 40)))));
    l_writeu32_0(v36, v37 + 12, (l_bxor_0(l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v65), l_readu8_0(v18, v63), (l_readu8_0(v32, v33 + 27))) * 512 + l_bxor_0(l_readu8_0(v17, v60), l_readu8_0(v18, v58), (l_readu8_0(v32, v33 + 22))) * 2) * 65536 + l_readu16_0(v16, l_bxor_0(l_readu8_0(v17, v55), l_readu8_0(v18, v57), (l_readu8_0(v32, v33 + 17))) * 512 + l_bxor_0(l_readu8_0(v17, v66), l_readu8_0(v18, v68), (l_readu8_0(v32, v33 + 28))) * 2), (l_readu32_0(v32, v33 + 44)))));
end;
local function v111(v72, v73, v74, v75, v76, v77) --[[ Line: 326 ]] --[[ Name: decryptBlock ]]
    -- upvalues: v19 (copy), l_readu8_0 (copy), l_bxor_0 (copy), v20 (copy), v21 (copy), l_writeu32_0 (copy)
    local v78 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75) * 256 + l_readu8_0(v72, v73 + 32)), (l_readu8_0(v72, v73 + 16)));
    local v79 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 13) * 256 + l_readu8_0(v72, v73 + 45)), (l_readu8_0(v72, v73 + 17)));
    local v80 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 10) * 256 + l_readu8_0(v72, v73 + 42)), (l_readu8_0(v72, v73 + 18)));
    local v81 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 7) * 256 + l_readu8_0(v72, v73 + 39)), (l_readu8_0(v72, v73 + 19)));
    local v82 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 4) * 256 + l_readu8_0(v72, v73 + 36)), (l_readu8_0(v72, v73 + 20)));
    local v83 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 1) * 256 + l_readu8_0(v72, v73 + 33)), (l_readu8_0(v72, v73 + 21)));
    local v84 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 14) * 256 + l_readu8_0(v72, v73 + 46)), (l_readu8_0(v72, v73 + 22)));
    local v85 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 11) * 256 + l_readu8_0(v72, v73 + 43)), (l_readu8_0(v72, v73 + 23)));
    local v86 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 8) * 256 + l_readu8_0(v72, v73 + 40)), (l_readu8_0(v72, v73 + 24)));
    local v87 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 5) * 256 + l_readu8_0(v72, v73 + 37)), (l_readu8_0(v72, v73 + 25)));
    local v88 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 2) * 256 + l_readu8_0(v72, v73 + 34)), (l_readu8_0(v72, v73 + 26)));
    local v89 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 15) * 256 + l_readu8_0(v72, v73 + 47)), (l_readu8_0(v72, v73 + 27)));
    local v90 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 12) * 256 + l_readu8_0(v72, v73 + 44)), (l_readu8_0(v72, v73 + 28)));
    local v91 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 9) * 256 + l_readu8_0(v72, v73 + 41)), (l_readu8_0(v72, v73 + 29)));
    local v92 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 6) * 256 + l_readu8_0(v72, v73 + 38)), (l_readu8_0(v72, v73 + 30)));
    local v93 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v74, v75 + 3) * 256 + l_readu8_0(v72, v73 + 35)), (l_readu8_0(v72, v73 + 31)));
    local v94 = v78 * 256 + v79;
    local v95 = v79 * 256 + v80;
    local v96 = v80 * 256 + v81;
    local v97 = v81 * 256 + v78;
    local v98 = v82 * 256 + v83;
    local v99 = v83 * 256 + v84;
    local v100 = v84 * 256 + v85;
    local v101 = v85 * 256 + v82;
    local v102 = v86 * 256 + v87;
    local v103 = v87 * 256 + v88;
    local v104 = v88 * 256 + v89;
    local v105 = v89 * 256 + v86;
    local v106 = v90 * 256 + v91;
    local v107 = v91 * 256 + v92;
    local v108 = v92 * 256 + v93;
    local v109 = v93 * 256 + v90;
    for v110 = v73, 16, -16 do
        v78 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v94) * 256 + l_readu8_0(v21, v96)), (l_readu8_0(v72, v110)));
        v79 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v107) * 256 + l_readu8_0(v21, v109)), (l_readu8_0(v72, v110 + 1)));
        v80 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v104) * 256 + l_readu8_0(v21, v102)), (l_readu8_0(v72, v110 + 2)));
        v81 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v101) * 256 + l_readu8_0(v21, v99)), (l_readu8_0(v72, v110 + 3)));
        v82 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v98) * 256 + l_readu8_0(v21, v100)), (l_readu8_0(v72, v110 + 4)));
        v83 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v95) * 256 + l_readu8_0(v21, v97)), (l_readu8_0(v72, v110 + 5)));
        v84 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v108) * 256 + l_readu8_0(v21, v106)), (l_readu8_0(v72, v110 + 6)));
        v85 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v105) * 256 + l_readu8_0(v21, v103)), (l_readu8_0(v72, v110 + 7)));
        v86 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v102) * 256 + l_readu8_0(v21, v104)), (l_readu8_0(v72, v110 + 8)));
        v87 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v99) * 256 + l_readu8_0(v21, v101)), (l_readu8_0(v72, v110 + 9)));
        v88 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v96) * 256 + l_readu8_0(v21, v94)), (l_readu8_0(v72, v110 + 10)));
        v89 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v109) * 256 + l_readu8_0(v21, v107)), (l_readu8_0(v72, v110 + 11)));
        v90 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v106) * 256 + l_readu8_0(v21, v108)), (l_readu8_0(v72, v110 + 12)));
        v91 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v103) * 256 + l_readu8_0(v21, v105)), (l_readu8_0(v72, v110 + 13)));
        v92 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v100) * 256 + l_readu8_0(v21, v98)), (l_readu8_0(v72, v110 + 14)));
        v93 = l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v97) * 256 + l_readu8_0(v21, v95)), (l_readu8_0(v72, v110 + 15)));
        v94 = v78 * 256 + v79;
        v95 = v79 * 256 + v80;
        v96 = v80 * 256 + v81;
        v97 = v81 * 256 + v78;
        v98 = v82 * 256 + v83;
        v99 = v83 * 256 + v84;
        v100 = v84 * 256 + v85;
        v101 = v85 * 256 + v82;
        v102 = v86 * 256 + v87;
        v103 = v87 * 256 + v88;
        v104 = v88 * 256 + v89;
        v105 = v89 * 256 + v86;
        v106 = v90 * 256 + v91;
        v107 = v91 * 256 + v92;
        v108 = v92 * 256 + v93;
        v109 = v93 * 256 + v90;
    end;
    l_writeu32_0(v76, v77, l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v101) * 256 + l_readu8_0(v21, v99)), (l_readu8_0(v72, 3))) * 16777216 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v104) * 256 + l_readu8_0(v21, v102)), (l_readu8_0(v72, 2))) * 65536 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v107) * 256 + l_readu8_0(v21, v109)), (l_readu8_0(v72, 1))) * 256 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v94) * 256 + l_readu8_0(v21, v96)), (l_readu8_0(v72, 0))));
    l_writeu32_0(v76, v77 + 4, l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v105) * 256 + l_readu8_0(v21, v103)), (l_readu8_0(v72, 7))) * 16777216 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v108) * 256 + l_readu8_0(v21, v106)), (l_readu8_0(v72, 6))) * 65536 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v95) * 256 + l_readu8_0(v21, v97)), (l_readu8_0(v72, 5))) * 256 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v98) * 256 + l_readu8_0(v21, v100)), (l_readu8_0(v72, 4))));
    l_writeu32_0(v76, v77 + 8, l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v109) * 256 + l_readu8_0(v21, v107)), (l_readu8_0(v72, 11))) * 16777216 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v96) * 256 + l_readu8_0(v21, v94)), (l_readu8_0(v72, 10))) * 65536 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v99) * 256 + l_readu8_0(v21, v101)), (l_readu8_0(v72, 9))) * 256 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v102) * 256 + l_readu8_0(v21, v104)), (l_readu8_0(v72, 8))));
    l_writeu32_0(v76, v77 + 12, l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v97) * 256 + l_readu8_0(v21, v95)), (l_readu8_0(v72, 15))) * 16777216 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v100) * 256 + l_readu8_0(v21, v98)), (l_readu8_0(v72, 14))) * 65536 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v103) * 256 + l_readu8_0(v21, v105)), (l_readu8_0(v72, 13))) * 256 + l_bxor_0(l_readu8_0(v19, l_readu8_0(v20, v106) * 256 + l_readu8_0(v21, v108)), (l_readu8_0(v72, 12))));
end;
local v112 = l_create_0(256);
local v113 = l_create_0(256);
local v114 = l_create_0(256);
local v115 = l_create_0(256);
local v116 = l_create_0(256);
local v117 = 1;
local v118 = 1;
local v119 = nil;
local function v124(v120, v121) --[[ Line: 409 ]] --[[ Name: gfmul ]]
    -- upvalues: l_bxor_0 (copy), l_floor_0 (copy)
    local v122 = 0;
    for _ = 0, 7 do
        if v121 % 2 == 1 then
            v122 = l_bxor_0(v122, v120);
        end;
        if v120 >= 128 then
            v120 = l_bxor_0(v120 * 2 % 256, 27);
        else
            v120 = v120 * 2 % 256;
        end;
        v121 = l_floor_0(v121 / 2);
    end;
    return v122;
end;
l_writeu8_0(v112, 0, 99);
for _ = 1, 255 do
    v117 = l_bxor_0(v117, v117 * 2, v117 < 128 and 0 or 27) % 256;
    v118 = l_bxor_0(v118, v118 * 2);
    v118 = l_bxor_0(v118, v118 * 4);
    v118 = l_bxor_0(v118, v118 * 16) % 256;
    if v118 >= 128 then
        v118 = l_bxor_0(v118, 9);
    end;
    v119 = l_bxor_0(v118, v118 % 128 * 2 + v118 / 128, v118 % 64 * 4 + v118 / 64, v118 % 32 * 8 + v118 / 32, v118 % 16 * 16 + v118 / 16, 99);
    l_writeu8_0(v112, v117, v119);
    l_writeu8_0(v113, v119, v117);
    l_writeu8_0(v114, v117, (v124(3, v117)));
    l_writeu8_0(v115, v117, (v124(9, v117)));
    l_writeu8_0(v116, v117, (v124(11, v117)));
end;
v119 = 0;
for v126 = 0, 255 do
    v117 = l_readu8_0(v112, v126);
    local v127 = v117 * 256;
    local v128 = v124(2, v117);
    local v129 = v124(13, v126);
    local v130 = v124(14, v126);
    for v131 = 0, 255 do
        v118 = l_readu8_0(v112, v131);
        l_writeu16_0(v16, v119 * 2, v127 + v118);
        l_writeu8_0(v19, v119, (l_readu8_0(v113, (l_bxor_0(v126, v131)))));
        l_writeu8_0(v17, v119, (l_bxor_0(v128, (l_readu8_0(v114, v118)))));
        l_writeu8_0(v18, v119, (l_bxor_0(v117, v118)));
        l_writeu8_0(v20, v119, (l_bxor_0(v130, (l_readu8_0(v116, v131)))));
        l_writeu8_0(v21, v119, (l_bxor_0(v129, (l_readu8_0(v115, v131)))));
        v119 = v119 + 1;
    end;
end;
v112 = function(_, v133) --[[ Line: 481 ]] --[[ Name: newidx ]]
    return error((("%* cannot be assigned to"):format(v133)));
end;
v113 = function() --[[ Line: 484 ]] --[[ Name: tostr ]]
    return "AesCipher";
end;
v114 = require(script.Modes);
v115 = require(script.Pads);
v116 = function(v134, v135) --[[ Line: 490 ]] --[[ Name: expandKey ]]
    -- upvalues: l_len_0 (copy), v31 (copy), l_create_0 (copy)
    local v136 = typeof(v134) == "buffer";
    local v137 = if v136 then l_len_0(v134) else #v134;
    local v138 = v137 == 32 and 240 or v137 == 24 and 208 or v137 == 16 and 176 or error("Key must be either 16, 24 or 32 bytes long");
    return (v31(v134, v137, v135 or l_create_0(v138), v136));
end;
v117 = function(v139, v140, v141) --[[ Line: 496 ]] --[[ Name: fromKey ]]
    -- upvalues: l_len_0 (copy), l_tostring_0 (copy), l_sub_0 (copy), v114 (copy), v115 (copy), v71 (copy), v111 (copy), l_fromstring_0 (copy), l_create_0 (copy), v112 (copy), v113 (copy)
    local v142 = l_len_0(v139);
    local v143 = nil;
    local v144 = nil;
    local v145 = l_tostring_0(v139);
    if v142 == 240 then
        v143 = 192;
        v144 = l_sub_0(v145, 1, 32);
    elseif v142 == 208 then
        v143 = 160;
        v144 = l_sub_0(v145, 1, 24);
    elseif v142 == 176 then
        v143 = 128;
        v144 = l_sub_0(v145, 1, 16);
    else
        error("Round keys must be either 240, 208 or 128 bytes long");
    end;
    local l_v139_0 = v139;
    local v147 = v140 or v114.ECB;
    local l_FwdMode_0 = v147.FwdMode;
    local l_InvMode_0 = v147.InvMode;
    local v150 = v147.SegmentSize or 16;
    local v151 = v141 or v115.Pkcs7;
    local l_Pad_0 = v151.Pad;
    local l_Unpad_0 = v151.Unpad;
    local v154 = newproxy(true);
    local v155 = getmetatable(v154);
    local function v160(v156, v157, v158, v159) --[[ Line: 523 ]] --[[ Name: encp ]]
        -- upvalues: v71 (ref), l_v139_0 (ref), v143 (ref)
        v71(l_v139_0, v143, v156, v157, v158, v159);
    end;
    local function v165(v161, v162, v163, v164) --[[ Line: 526 ]] --[[ Name: decp ]]
        -- upvalues: v111 (ref), l_v139_0 (ref), v143 (ref)
        v111(l_v139_0, v143, v161, v162, v163, v164);
    end;
    local function v171(v166, v167, v168, ...) --[[ Line: 529 ]] --[[ Name: enc ]]
        -- upvalues: l_fromstring_0 (ref), v154 (copy), v143 (ref), l_Pad_0 (copy), v150 (copy), l_FwdMode_0 (ref), v160 (copy), v165 (copy), v151 (ref), v147 (ref), l_create_0 (ref)
        local v169 = if typeof(v167) == "buffer" then v167 else if typeof(v167) == "string" then l_fromstring_0(v167) else error((("Unable to cast %* to buffer"):format((typeof(v167)))));
        local v170 = false;
        if typeof(v168) == "buffer" then
            v170 = v168;
        end;
        v168 = v170;
        if v166 ~= v154 then
            return v166:Encrypt(v169, v168, ...);
        elseif v143 then
            v170 = l_Pad_0(v169, v168, v150);
            l_FwdMode_0(v160, v165, if v151.Overwrite == false then v169 else v170, v170, v147, ...);
            return v170;
        else
            error("AesCipher object's already destroyed");
            return l_create_0(0);
        end;
    end;
    local function v177(v172, v173, v174, v175, v176) --[[ Line: 544 ]] --[[ Name: encb ]]
        -- upvalues: v154 (copy), v143 (ref), v71 (ref), l_v139_0 (ref)
        if v172 ~= v154 then
            v172:EncryptBlock(v173, v174, v175, v176);
            return;
        elseif v143 then
            v71(l_v139_0, v143, v173, v174, v175 or v173, v176 or v174);
            return;
        else
            error("AesCipher object's already destroyed");
            return;
        end;
    end;
    local function v184(v178, v179, v180, ...) --[[ Line: 553 ]] --[[ Name: dec ]]
        -- upvalues: l_fromstring_0 (ref), v154 (copy), v143 (ref), v151 (ref), l_create_0 (ref), l_len_0 (ref), l_InvMode_0 (ref), v160 (copy), v165 (copy), v147 (ref), l_Unpad_0 (copy), v150 (copy)
        local v181 = if typeof(v179) == "buffer" then v179 else if typeof(v179) == "string" then l_fromstring_0(v179) else error((("Unable to cast %* to buffer"):format((typeof(v179)))));
        local v182 = false;
        if typeof(v180) == "buffer" then
            v182 = v180;
        end;
        v180 = v182;
        if v178 ~= v154 then
            return v178:Decrypt(v181, v180, ...);
        elseif v143 then
            v182 = v151.Overwrite;
            local v183 = if v182 == nil then l_create_0(l_len_0(v181)) else if v182 then v181 else v180 or l_create_0(l_len_0(v181));
            l_InvMode_0(v160, v165, v181, v183, v147, ...);
            return (l_Unpad_0(v183, v180, v150));
        else
            error("AesCipher object's already destroyed");
            return l_create_0(0);
        end;
    end;
    local function v190(v185, v186, v187, v188, v189) --[[ Line: 569 ]] --[[ Name: decb ]]
        -- upvalues: v154 (copy), v143 (ref), v111 (ref), l_v139_0 (ref)
        if v185 ~= v154 then
            v185:DecryptBlock(v186, v187, v188, v189);
            return;
        elseif v143 then
            v111(l_v139_0, v143, v186, v187, v188 or v186, v189 or v187);
            return;
        else
            error("AesCipher object's already destroyed");
            return;
        end;
    end;
    local function v201(v191) --[[ Line: 578 ]] --[[ Name: destroy ]]
        -- upvalues: v154 (copy), v143 (ref), v145 (ref), l_v139_0 (ref), l_FwdMode_0 (ref), l_InvMode_0 (ref), v147 (ref), v151 (ref), v144 (ref), v142 (ref)
        if v191 ~= v154 then
            v191:Destroy();
            return;
        elseif v143 then
            local v192 = nil;
            local v193 = nil;
            local v194 = nil;
            local v195 = nil;
            local v196 = nil;
            local v197 = nil;
            local v198 = nil;
            local v199 = nil;
            local v200 = nil;
            v145 = v192;
            l_v139_0 = v193;
            v143 = v194;
            l_FwdMode_0 = v195;
            l_InvMode_0 = v196;
            v147 = v197;
            v151 = v198;
            v144 = v199;
            v142 = v200;
            return;
        else
            error("AesCipher object's already destroyed");
            return;
        end;
    end;
    v155.__index = function(_, v203) --[[ Line: 589 ]]
        -- upvalues: v171 (copy), v184 (copy), v177 (copy), v190 (copy), v201 (copy), v143 (ref), v144 (ref), v145 (ref), v147 (ref), v151 (ref), v142 (ref)
        if v203 == "Encrypt" then
            return v171;
        elseif v203 == "Decrypt" then
            return v184;
        elseif v203 == "EncryptBlock" then
            return v177;
        elseif v203 == "DecryptBlock" then
            return v190;
        elseif v203 == "Destroy" then
            return v201;
        elseif v143 then
            if v203 == "Key" then
                return v144;
            elseif v203 == "RoundKeys" then
                return v145;
            elseif v203 == "Mode" then
                return v147;
            elseif v203 == "Padding" then
                return v151;
            elseif v203 == "Length" then
                return v142;
            else
                return (error((("%* is not a valid member of AesCipher"):format(v203))));
            end;
        else
            return (error("AesCipher object's already destroyed"));
        end;
    end;
    v155.__newindex = v112;
    v155.__tostring = v113;
    v155.__len = function() --[[ Line: 597 ]]
        -- upvalues: v142 (ref)
        return v142 or error("AesCipher object's destroyed");
    end;
    v155.__metatable = "AesCipher object: Metatable's locked";
    return v154;
end;
return table.freeze({
    new = function(v204, v205, v206) --[[ Line: 605 ]] --[[ Name: new ]]
        -- upvalues: v117 (copy), v116 (copy)
        return (v117(v116(v204), v205, v206));
    end, 
    expandKey = v116, 
    fromKey = v117, 
    modes = v114, 
    pads = v115
});