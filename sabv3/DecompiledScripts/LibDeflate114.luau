--!native
local v0 = {};
local l_byte_0 = string.byte;
local l_char_0 = string.char;
local l_find_0 = string.find;
local l_gsub_0 = string.gsub;
local l_sub_0 = string.sub;
local l_concat_0 = table.concat;
local l_sort_0 = table.sort;
local v8 = {};
local v9 = {};
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {
    3, 
    4, 
    5, 
    6, 
    7, 
    8, 
    9, 
    10, 
    11, 
    13, 
    15, 
    17, 
    19, 
    23, 
    27, 
    31, 
    35, 
    43, 
    51, 
    59, 
    67, 
    83, 
    99, 
    115, 
    131, 
    163, 
    195, 
    227, 
    258
};
local v18 = {
    0, 
    0, 
    0, 
    0, 
    0, 
    0, 
    0, 
    0, 
    1, 
    1, 
    1, 
    1, 
    2, 
    2, 
    2, 
    2, 
    3, 
    3, 
    3, 
    3, 
    4, 
    4, 
    4, 
    4, 
    5, 
    5, 
    5, 
    5, 
    0
};
local v19 = {
    [0] = 1; 
    2, 
    3, 
    4, 
    5, 
    7, 
    9, 
    13, 
    17, 
    25, 
    33, 
    49, 
    65, 
    97, 
    129, 
    193, 
    257, 
    385, 
    513, 
    769, 
    1025, 
    1537, 
    2049, 
    3073, 
    4097, 
    6145, 
    8193, 
    12289, 
    16385, 
    24577
};
local v20 = {
    [0] = 0; 
    0, 
    0, 
    0, 
    1, 
    1, 
    2, 
    2, 
    3, 
    3, 
    4, 
    4, 
    5, 
    5, 
    6, 
    6, 
    7, 
    7, 
    8, 
    8, 
    9, 
    9, 
    10, 
    10, 
    11, 
    11, 
    12, 
    12, 
    13, 
    13
};
local v21 = {
    16, 
    17, 
    18, 
    0, 
    8, 
    7, 
    9, 
    6, 
    10, 
    5, 
    11, 
    4, 
    12, 
    3, 
    13, 
    2, 
    14, 
    1, 
    15
};
local v22 = {};
local v23 = {};
local v24 = {};
local v25 = {};
local v26 = {};
local v27 = {};
local v28 = {};
local v29 = {};
for v30 = 0, 255 do
    v9[v30] = l_char_0(v30);
end;
local v31 = 1;
for v32 = 0, 32 do
    v8[v32] = v31;
    v31 = v31 * 2;
end;
for v33 = 1, 9 do
    v10[v33] = {};
    for v34 = 0, v8[v33 + 1] - 1 do
        local v35 = 0;
        local l_v34_0 = v34;
        for _ = 1, v33 do
            v35 = v35 - v35 % 2 + ((not (v35 % 2 ~= 1) or l_v34_0 % 2 == 1) and 1 or 0);
            l_v34_0 = (l_v34_0 - l_v34_0 % 2) / 2;
            v35 = v35 * 2;
        end;
        v10[v33][v34] = (v35 - v35 % 2) / 2;
    end;
end;
v31 = 18;
local v38 = 16;
local v39 = 265;
local v40 = 1;
for v41 = 3, 258 do
    if v41 <= 10 then
        v11[v41] = v41 + 254;
        v13[v41] = 0;
    elseif v41 == 258 then
        v11[v41] = 285;
        v13[v41] = 0;
    else
        if v31 < v41 then
            v31 = v31 + v38;
            v38 = v38 * 2;
            v39 = v39 + 4;
            v40 = v40 + 1;
        end;
        local v42 = v41 - v31 - 1 + v38 / 2;
        v11[v41] = (v42 - v42 % (v38 / 8)) / (v38 / 8) + v39;
        v13[v41] = v40;
        v12[v41] = v42 % (v38 / 8);
    end;
end;
v14[1] = 0;
v14[2] = 1;
v16[1] = 0;
v16[2] = 0;
v31 = 3;
v38 = 4;
v39 = 2;
v40 = 0;
for v43 = 3, 256 do
    if v38 < v43 then
        v31 = v31 * 2;
        v38 = v38 * 2;
        v39 = v39 + 2;
        v40 = v40 + 1;
    end;
    v14[v43] = v43 <= v31 and v39 or v39 + 1;
    v16[v43] = v40 < 0 and 0 or v40;
    if v38 >= 8 then
        v15[v43] = (v43 - v38 / 2 - 1) % (v38 / 4);
    end;
end;
v0.Adler32 = function(_, v45) --[[ Line: 372 ]] --[[ Name: Adler32 ]]
    -- upvalues: l_byte_0 (copy)
    if type(v45) ~= "string" then
        error(("Usage: LibDeflate:Adler32(str): 'str' - string expected got '%s'."):format((type(v45))), 2);
    end;
    local v46 = #v45;
    local v47 = 1;
    local v48 = 1;
    local v49 = 0;
    while v47 <= v46 - 15 do
        local v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65 = l_byte_0(v45, v47, v47 + 15);
        v49 = (v49 + v48 * 16 + v50 * 16 + 15 * v51 + 14 * v52 + 13 * v53 + 12 * v54 + 11 * v55 + 10 * v56 + 9 * v57 + 8 * v58 + 7 * v59 + 6 * v60 + 5 * v61 + 4 * v62 + 3 * v63 + 2 * v64 + v65) % 65521;
        v48 = (v48 + v50 + v51 + v52 + v53 + v54 + v55 + v56 + v57 + v58 + v59 + v60 + v61 + v62 + v63 + v64 + v65) % 65521;
        v47 = v47 + 16;
    end;
    while v47 <= v46 do
        v48 = (v48 + l_byte_0(v45, v47, v47)) % 65521;
        v49 = (v49 + v48) % 65521;
        v47 = v47 + 1;
    end;
    return (v49 * 65536 + v48) % 4294967296;
end;
v31 = function(v66, v67) --[[ Line: 417 ]] --[[ Name: IsEqualAdler32 ]]
    return v66 % 4294967296 == v67 % 4294967296;
end;
v0.CreateDictionary = function(v68, v69, v70, v71) --[[ Line: 463 ]] --[[ Name: CreateDictionary ]]
    -- upvalues: l_byte_0 (copy)
    if type(v69) ~= "string" then
        error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'str' - string expected got '%s'."):format((type(v69))), 2);
    end;
    if type(v70) ~= "number" then
        error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'strlen' - number expected got '%s'."):format((type(v70))), 2);
    end;
    if type(v71) ~= "number" then
        error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'adler32' - number expected got '%s'."):format((type(v71))), 2);
    end;
    if v70 ~= #v69 then
        error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'strlen' does not match the actual length of 'str'. 'strlen': %u, '#str': %u . Please check if 'str' is modified unintentionally."):format(v70, #v69));
    end;
    if v70 == 0 then
        error("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'str' - Empty string is not allowed.", 2);
    end;
    if v70 > 32768 then
        error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'str' - string longer than 32768 bytes is not allowed. Got %d bytes."):format(v70), 2);
    end;
    local v72 = v68:Adler32(v69);
    if not (v71 % 4294967296 == v72 % 4294967296) then
        error(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'adler32' does not match the actual adler32 of 'str'. 'adler32': %u, 'Adler32(str)': %u . Please check if 'str' is modified unintentionally."):format(v71, v72));
    end;
    local v73 = {
        adler32 = v71, 
        hash_tables = {}, 
        string_table = {}, 
        strlen = v70
    };
    local l_string_table_0 = v73.string_table;
    local l_hash_tables_0 = v73.hash_tables;
    l_string_table_0[1] = l_byte_0(v69, 1, 1);
    l_string_table_0[2] = l_byte_0(v69, 2, 2);
    if v70 >= 3 then
        local v76 = 1;
        local v77 = l_string_table_0[1] * 256 + l_string_table_0[2];
        while v76 <= v70 - 2 - 3 do
            local v78, v79, v80, v81 = l_byte_0(v69, v76 + 2, v76 + 5);
            l_string_table_0[v76 + 2] = v78;
            l_string_table_0[v76 + 3] = v79;
            l_string_table_0[v76 + 4] = v80;
            l_string_table_0[v76 + 5] = v81;
            v77 = (v77 * 256 + v78) % 16777216;
            local v82 = l_hash_tables_0[v77];
            if not v82 then
                v82 = {};
                l_hash_tables_0[v77] = v82;
            end;
            v82[#v82 + 1] = v76 - v70;
            v76 = v76 + 1;
            v77 = (v77 * 256 + v79) % 16777216;
            v82 = l_hash_tables_0[v77];
            if not v82 then
                v82 = {};
                l_hash_tables_0[v77] = v82;
            end;
            v82[#v82 + 1] = v76 - v70;
            v76 = v76 + 1;
            v77 = (v77 * 256 + v80) % 16777216;
            v82 = l_hash_tables_0[v77];
            if not v82 then
                v82 = {};
                l_hash_tables_0[v77] = v82;
            end;
            v82[#v82 + 1] = v76 - v70;
            v76 = v76 + 1;
            v77 = (v77 * 256 + v81) % 16777216;
            v82 = l_hash_tables_0[v77];
            if not v82 then
                v82 = {};
                l_hash_tables_0[v77] = v82;
            end;
            v82[#v82 + 1] = v76 - v70;
            v76 = v76 + 1;
        end;
        while v76 <= v70 - 2 do
            local v83 = l_byte_0(v69, v76 + 2);
            l_string_table_0[v76 + 2] = v83;
            v77 = (v77 * 256 + v83) % 16777216;
            local v84 = l_hash_tables_0[v77];
            if not v84 then
                v84 = {};
                l_hash_tables_0[v77] = v84;
            end;
            v84[#v84 + 1] = v76 - v70;
            v76 = v76 + 1;
        end;
    end;
    return v73;
end;
v38 = function(v85) --[[ Line: 561 ]] --[[ Name: IsValidDictionary ]]
    if v85 == nil or type(v85) ~= "table" then
        return false, ("'dictionary' - table expected got '%s'."):format((type(v85)));
    elseif type(v85.adler32) ~= "number" or type(v85.string_table) ~= "table" or type(v85.strlen) ~= "number" or v85.strlen <= 0 or v85.strlen > 32768 or v85.strlen ~= #v85.string_table or type(v85.hash_tables) ~= "table" then
        return false, ("'%s' - corrupted dictionary."):format((type(v85)));
    else
        return true, "";
    end;
end;
v39 = {
    [0] = {
        false, 
        nil, 
        0, 
        0, 
        0
    }, 
    [1] = {
        false, 
        nil, 
        4, 
        8, 
        4
    }, 
    [2] = {
        false, 
        nil, 
        5, 
        18, 
        8
    }, 
    [3] = {
        false, 
        nil, 
        6, 
        32, 
        32
    }, 
    [4] = {
        true, 
        4, 
        4, 
        16, 
        16
    }, 
    [5] = {
        true, 
        8, 
        16, 
        32, 
        32
    }, 
    [6] = {
        true, 
        8, 
        16, 
        128, 
        128
    }, 
    [7] = {
        true, 
        8, 
        32, 
        128, 
        256
    }, 
    [8] = {
        true, 
        32, 
        128, 
        258, 
        1024
    }, 
    [9] = {
        true, 
        32, 
        258, 
        258, 
        4096
    }
};
v40 = function(v86, v87, v88, v89, v90) --[[ Line: 641 ]] --[[ Name: IsValidArguments ]]
    -- upvalues: v38 (copy), v39 (copy)
    if type(v86) ~= "string" then
        return false, ("'str' - string expected got '%s'."):format((type(v86)));
    else
        if v87 then
            local v91, v92 = v38(v88);
            if not v91 then
                return false, v92;
            end;
        end;
        if v89 then
            local v93 = type(v90);
            if v93 ~= "nil" and v93 ~= "table" then
                return false, ("'configs' - nil or table expected got '%s'."):format((type(v90)));
            elseif v93 == "table" then
                assert(v90);
                for v94, v95 in pairs(v90) do
                    if v94 ~= "level" and v94 ~= "strategy" then
                        return false, ("'configs' - unsupported table key in the configs: '%s'."):format(v94);
                    elseif v94 == "level" and not v39[v95] then
                        return false, ("'configs' - unsupported 'level': %s."):format((tostring(v95)));
                    elseif v94 == "strategy" and v95 ~= "fixed" and v95 ~= "huffman_only" and v95 ~= "dynamic" then
                        return false, ("'configs' - unsupported 'strategy': '%s'."):format((tostring(v95)));
                    end;
                end;
            end;
        end;
        return true, "";
    end;
end;
local function v111() --[[ Line: 703 ]] --[[ Name: CreateWriter ]]
    -- upvalues: v8 (copy), v9 (copy), l_char_0 (copy), l_concat_0 (copy)
    local v96 = 0;
    local v97 = 0;
    local v98 = 0;
    local v99 = 0;
    local v100 = {};
    local v101 = {};
    return function(v102, v103) --[[ Line: 716 ]] --[[ Name: WriteBits ]]
        -- upvalues: v97 (ref), v8 (ref), v98 (ref), v99 (ref), v96 (ref), v100 (ref), v9 (ref)
        v97 = v97 + v102 * v8[v98];
        v98 = v98 + v103;
        v99 = v99 + v103;
        if v98 >= 32 then
            v96 = v96 + 1;
            v100[v96] = v9[v97 % 256] .. v9[(v97 - v97 % 256) / 256 % 256] .. v9[(v97 - v97 % 65536) / 65536 % 256] .. v9[(v97 - v97 % 16777216) / 16777216 % 256];
            local v104 = v8[32 - v98 + v103];
            v97 = (v102 - v102 % v104) / v104;
            v98 = v98 - 32;
        end;
    end, function(v105) --[[ Line: 738 ]] --[[ Name: WriteString ]]
        -- upvalues: v98 (ref), v96 (ref), v100 (ref), v97 (ref), l_char_0 (ref), v99 (ref)
        for _ = 1, v98, 8 do
            v96 = v96 + 1;
            v100[v96] = l_char_0(v97 % 256);
            v97 = (v97 - v97 % 256) / 256;
        end;
        v98 = 0;
        v96 = v96 + 1;
        v100[v96] = v105;
        v99 = v99 + #v105 * 8;
    end, function(v107) --[[ Line: 757 ]] --[[ Name: FlushWriter ]]
        -- upvalues: v99 (ref), v98 (ref), v97 (ref), v8 (ref), v96 (ref), v100 (ref), v9 (ref), l_concat_0 (ref), v101 (copy)
        if v107 == 3 then
            return v99, nil;
        else
            if v107 == 1 or v107 == 2 then
                local v108 = (8 - v98 % 8) % 8;
                if v98 > 0 then
                    v97 = v97 - v8[v98] + v8[v98 + v108];
                    for _ = 1, v98, 8 do
                        v96 = v96 + 1;
                        v100[v96] = v9[v97 % 256];
                        v97 = (v97 - v97 % 256) / 256;
                    end;
                    v97 = 0;
                    v98 = 0;
                end;
                if v107 == 2 then
                    v99 = v99 + v108;
                    return v99, nil;
                end;
            end;
            local v110 = l_concat_0(v100);
            v100 = {};
            v96 = 0;
            v101[#v101 + 1] = v110;
            if v107 == 0 then
                return v99, nil;
            else
                return v99, l_concat_0(v101);
            end;
        end;
    end;
end;
local function v119(v112, v113, v114) --[[ Line: 809 ]] --[[ Name: MinHeapPush ]]
    v114 = v114 + 1;
    v112[v114] = v113;
    local v115 = v113[1];
    local l_v114_0 = v114;
    local v117 = (l_v114_0 - l_v114_0 % 2) / 2;
    while v117 >= 1 and v115 < v112[v117][1] do
        local v118 = v112[v117];
        v112[v117] = v113;
        v112[l_v114_0] = v118;
        l_v114_0 = v117;
        v117 = (v117 - v117 % 2) / 2;
    end;
end;
local function v130(v120, v121) --[[ Line: 830 ]] --[[ Name: MinHeapPop ]]
    local v122 = v120[1];
    local v123 = v120[v121];
    local v124 = v123[1];
    v120[1] = v123;
    v120[v121] = v122;
    v121 = v121 - 1;
    local v125 = 1;
    local v126 = v125 * 2;
    local v127 = v126 + 1;
    while v126 <= v121 do
        local v128 = v120[v126];
        if v127 <= v121 and v120[v127][1] < v128[1] then
            local v129 = v120[v127];
            if v129[1] < v124 then
                v120[v127] = v123;
                v120[v125] = v129;
                v125 = v127;
                v126 = v125 * 2;
                v127 = v126 + 1;
            else
                break;
            end;
        elseif v128[1] < v124 then
            v120[v126] = v123;
            v120[v125] = v128;
            v125 = v126;
            v126 = v125 * 2;
            v127 = v126 + 1;
        else
            break;
        end;
    end;
    return v122;
end;
local function v143(v131, v132, v133, v134) --[[ Line: 880 ]] --[[ Name: GetHuffmanCodeFromBitlen ]]
    -- upvalues: v10 (copy)
    local v135 = 0;
    local v136 = {};
    local v137 = {};
    for v138 = 1, v134 do
        v135 = (v135 + (v131[v138 - 1] or 0)) * 2;
        v136[v138] = v135;
    end;
    for v139 = 0, v133 do
        local v140 = v132[v139];
        if v140 then
            v135 = v136[v140];
            v136[v140] = v135 + 1;
            if v140 <= 9 then
                v137[v139] = v10[v140][v135];
            else
                local v141 = 0;
                for _ = 1, v140 do
                    v141 = v141 - v141 % 2 + ((not (v141 % 2 ~= 1) or v135 % 2 == 1) and 1 or 0);
                    v135 = (v135 - v135 % 2) / 2;
                    v141 = v141 * 2;
                end;
                v137[v139] = (v141 - v141 % 2) / 2;
            end;
        end;
    end;
    return v137;
end;
local function v147(v144, v145) --[[ Line: 924 ]] --[[ Name: SortByFirstThenSecond ]]
    local v146 = true;
    if v144[1] >= v145[1] then
        v146 = false;
        if v144[1] == v145[1] then
            v146 = v144[2] < v145[2];
        end;
    end;
    return v146;
end;
local function v178(v148, v149, v150) --[[ Line: 939 ]] --[[ Name: GetHuffmanBitlenAndCode ]]
    -- upvalues: l_sort_0 (copy), v147 (copy), v130 (copy), v119 (copy), v143 (copy)
    local v151 = nil;
    local v152 = -1;
    local v153 = {};
    local v154 = {};
    local v155 = {};
    local v156 = {};
    local v157 = {};
    local v158 = 0;
    for v159, v160 in pairs(v148) do
        v158 = v158 + 1;
        v153[v158] = {
            v160, 
            v159
        };
    end;
    if v158 == 0 then
        return {}, {}, -1;
    elseif v158 == 1 then
        local v161 = v153[1][2];
        v155[v161] = 1;
        v156[v161] = 0;
        return v155, v156, v161;
    else
        l_sort_0(v153, v147);
        v151 = v158;
        for v162 = 1, v151 do
            v154[v162] = v153[v162];
        end;
        while v151 > 1 do
            local v163 = v130(v154, v151);
            v151 = v151 - 1;
            local v164 = v130(v154, v151);
            v151 = v151 - 1;
            local v165 = {
                v163[1] + v164[1], 
                -1, 
                v163, 
                v164
            };
            v119(v154, v165, v151);
            v151 = v151 + 1;
        end;
        local v166 = 0;
        local v167 = {
            v154[1], 
            {}, 
            {}, 
            {}
        };
        local v168 = 1;
        local v169 = 1;
        v154[1][1] = 0;
        while v169 <= v168 do
            local v170 = v167[v169];
            local v171 = v170[1];
            local v172 = v170[2];
            local v173 = v170[3];
            local v174 = v170[4];
            if v173 then
                v168 = v168 + 1;
                v167[v168] = v173;
                v173[1] = v171 + 1;
            end;
            if v174 then
                v168 = v168 + 1;
                v167[v168] = v174;
                v174[1] = v171 + 1;
            end;
            v169 = v169 + 1;
            if v149 < v171 then
                v166 = v166 + 1;
                v171 = v149;
            end;
            if v172 >= 0 then
                v155[v172] = v171;
                v152 = v152 < v172 and v172 or v152;
                v157[v171] = (v157[v171] or 0) + 1;
            end;
        end;
        if v166 > 0 then
            repeat
                local v175 = v149 - 1;
                while (v157[v175] or 0) == 0 do
                    v175 = v175 - 1;
                end;
                v157[v175] = v157[v175] - 1;
                v157[v175 + 1] = (v157[v175 + 1] or 0) + 2;
                v157[v149] = v157[v149] - 1;
                v166 = v166 - 2;
            until v166 <= 0;
            v169 = 1;
            for v176 = v149, 1, -1 do
                local v177 = v157[v176] or 0;
                while v177 > 0 do
                    v155[v153[v169][2]] = v176;
                    v177 = v177 - 1;
                    v169 = v169 + 1;
                end;
            end;
        end;
        return v155, v143(v157, v155, v150, v149), v152;
    end;
end;
local function v194(v179, v180, v181, v182) --[[ Line: 1074 ]] --[[ Name: RunLengthEncodeHuffmanBitlen ]]
    local v183 = 0;
    local v184 = {};
    local v185 = {};
    local v186 = 0;
    local v187 = {};
    local v188 = nil;
    local v189 = 0;
    local v190 = v180 + (v182 < 0 and 0 or v182) + 1;
    for v191 = 0, v190 + 1 do
        local v192 = if v191 <= v180 then v179[v191] or 0 else if v191 <= v190 then v181[v191 - v180 - 1] or 0 else nil;
        if v192 == v188 then
            v189 = v189 + 1;
            if v192 ~= 0 and v189 == 6 then
                v183 = v183 + 1;
                v184[v183] = 16;
                v186 = v186 + 1;
                v187[v186] = 3;
                v185[16] = (v185[16] or 0) + 1;
                v189 = 0;
            elseif v192 == 0 and v189 == 138 then
                v183 = v183 + 1;
                v184[v183] = 18;
                v186 = v186 + 1;
                v187[v186] = 127;
                v185[18] = (v185[18] or 0) + 1;
                v189 = 0;
            end;
        else
            if v189 == 1 then
                assert(v188);
                v183 = v183 + 1;
                v184[v183] = v188;
                v185[v188] = (v185[v188] or 0) + 1;
            elseif v189 == 2 then
                assert(v188);
                v183 = v183 + 1;
                v184[v183] = v188;
                v183 = v183 + 1;
                v184[v183] = v188;
                v185[v188] = (v185[v188] or 0) + 2;
            elseif v189 >= 3 then
                v183 = v183 + 1;
                local v193 = v188 ~= 0 and 16 or v189 <= 10 and 17 or 18;
                v184[v183] = v193;
                v185[v193] = (v185[v193] or 0) + 1;
                v186 = v186 + 1;
                v187[v186] = v189 <= 10 and v189 - 3 or v189 - 11;
            end;
            v188 = v192;
            if v192 and v192 ~= 0 then
                v183 = v183 + 1;
                v184[v183] = v192;
                v185[v192] = (v185[v192] or 0) + 1;
                v189 = 0;
            else
                v189 = 1;
            end;
        end;
    end;
    return v184, v187, v185;
end;
local function v232(v195, v196, v197, v198, v199) --[[ Line: 1163 ]] --[[ Name: LoadStringToTable ]]
    -- upvalues: l_byte_0 (copy)
    local v200 = v197 - v199;
    while v200 <= v198 - 15 - v199 do
        local v201 = v200 + 1;
        local v202 = v200 + 2;
        local v203 = v200 + 3;
        local v204 = v200 + 4;
        local v205 = v200 + 5;
        local v206 = v200 + 6;
        local v207 = v200 + 7;
        local v208 = v200 + 8;
        local v209 = v200 + 9;
        local v210 = v200 + 10;
        local v211 = v200 + 11;
        local v212 = v200 + 12;
        local v213 = v200 + 13;
        local v214 = v200 + 14;
        local v215 = v200 + 15;
        local v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231 = l_byte_0(v195, v200 + v199, v200 + 15 + v199);
        v196[v200] = v216;
        v196[v201] = v217;
        v196[v202] = v218;
        v196[v203] = v219;
        v196[v204] = v220;
        v196[v205] = v221;
        v196[v206] = v222;
        v196[v207] = v223;
        v196[v208] = v224;
        v196[v209] = v225;
        v196[v210] = v226;
        v196[v211] = v227;
        v196[v212] = v228;
        v196[v213] = v229;
        v196[v214] = v230;
        v196[v215] = v231;
        v200 = v200 + 16;
    end;
    while v200 <= v198 - v199 do
        v196[v200] = l_byte_0(v195, v200 + v199, v200 + v199);
        v200 = v200 + 1;
    end;
    return v196;
end;
local function v299(v233, v234, v235, v236, v237, v238, v239) --[[ Line: 1220 ]] --[[ Name: GetBlockLZ77Result ]]
    -- upvalues: v39 (copy), v11 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v12 (copy)
    local v240 = v39[v233];
    local v241 = v240[1];
    local v242 = v240[2];
    local v243 = v240[3];
    local v244 = v240[4];
    local v245 = v240[5];
    local v246 = not v241 and v243 or 2147483646;
    local v247 = v245 - v245 % 4 / 4;
    local v248 = 0;
    local v249 = {};
    local v250 = {};
    local v251 = 0;
    if v239 then
        v249 = v239.hash_tables;
        v250 = v239.string_table;
        v251 = v239.strlen;
        assert(v236 == 1);
        if v236 <= v237 and v251 >= 2 then
            v248 = v250[v251 - 1] * 65536 + v250[v251] * 256 + v234[1];
            local v252 = v235[v248];
            if not v252 then
                v252 = {};
                v235[v248] = v252;
            end;
            v252[#v252 + 1] = -1;
        end;
        if v236 + 1 <= v237 and v251 >= 1 then
            v248 = v250[v251] * 65536 + v234[1] * 256 + v234[2];
            local v253 = v235[v248];
            if not v253 then
                v253 = {};
                v235[v248] = v253;
            end;
            v253[#v253 + 1] = 0;
        end;
    end;
    local v254 = v251 + 3;
    v248 = (v234[v236 - v238] or 0) * 256 + (v234[v236 + 1 - v238] or 0);
    local v255 = {};
    local v256 = 0;
    local v257 = {};
    local v258 = {};
    local v259 = 0;
    local v260 = {};
    local v261 = {};
    local v262 = 0;
    local v263 = {};
    local v264 = 0;
    local v265 = false;
    local v266 = nil;
    local v267 = nil;
    local v268 = 0;
    local v269 = 0;
    local l_v236_0 = v236;
    local v271 = v237 + (v241 and 1 or 0);
    while l_v236_0 <= v271 do
        local v272 = l_v236_0 - v238;
        local v273 = v238 - 3;
        v266 = v268;
        v267 = v269;
        v268 = 0;
        v248 = (v248 * 256 + (v234[v272 + 2] or 0)) % 16777216;
        local v274 = nil;
        local v275 = nil;
        local v276 = v235[v248];
        local v277 = nil;
        if not v276 then
            v277 = 0;
            v276 = {};
            v235[v248] = v276;
            if v249 then
                v275 = v249[v248];
                v274 = v275 and #v275 or 0;
            else
                v274 = 0;
            end;
        else
            v277 = #v276;
            v275 = v276;
            v274 = v277;
        end;
        if l_v236_0 <= v237 then
            v276[v277 + 1] = l_v236_0;
        end;
        if v274 > 0 and l_v236_0 + 2 <= v237 and (not v241 or v266 < v243) then
            local v278 = v241 and v242 <= v266 and v247 or v245;
            local v279 = v237 - l_v236_0;
            v279 = (v279 >= 257 and 257 or v279) + v272;
            local v280 = v272 + 3;
            while v274 >= 1 and v278 > 0 do
                local v281 = v275[v274];
                if l_v236_0 - v281 <= 32768 then
                    if v281 < l_v236_0 then
                        local l_v280_0 = v280;
                        if v281 >= -257 then
                            local v283 = v281 - v273;
                            while l_v280_0 <= v279 and v234[v283] == v234[l_v280_0] do
                                l_v280_0 = l_v280_0 + 1;
                                v283 = v283 + 1;
                            end;
                        else
                            local v284 = v254 + v281;
                            while l_v280_0 <= v279 and v250[v284] == v234[l_v280_0] do
                                l_v280_0 = l_v280_0 + 1;
                                v284 = v284 + 1;
                            end;
                        end;
                        local v285 = l_v280_0 - v272;
                        if v268 < v285 then
                            v268 = v285;
                            v269 = l_v236_0 - v281;
                        end;
                        if v244 <= v268 then
                            break;
                        end;
                    end;
                    v274 = v274 - 1;
                    v278 = v278 - 1;
                    if v274 == 0 and v281 > 0 and v249 then
                        v275 = v249[v248];
                        v274 = v275 and #v275 or 0;
                    end;
                else
                    break;
                end;
            end;
        end;
        if not v241 then
            v266 = v268;
            v267 = v269;
        end;
        if (not v241 or v265) and (v266 > 3 or v266 == 3 and v267 < 4096) and v268 <= v266 then
            local v286 = v11[v266];
            local v287 = v13[v266];
            local v288 = nil;
            local v289 = nil;
            local v290 = nil;
            if v267 <= 256 then
                v288 = v14[v267];
                v290 = v15[v267];
                v289 = v16[v267];
            else
                v288 = 16;
                v289 = 7;
                local v291 = 384;
                local v292 = 512;
                while true do
                    if v267 <= v291 then
                        v290 = (v267 - v292 / 2 - 1) % (v292 / 4);
                        break;
                    elseif v267 <= v292 then
                        v290 = (v267 - v292 / 2 - 1) % (v292 / 4);
                        v288 = v288 + 1;
                        break;
                    else
                        v288 = v288 + 2;
                        v289 = v289 + 1;
                        v291 = v291 * 2;
                        v292 = v292 * 2;
                    end;
                end;
            end;
            v256 = v256 + 1;
            v255[v256] = v286;
            v257[v286] = (v257[v286] or 0) + 1;
            v259 = v259 + 1;
            v258[v259] = v288;
            v260[v288] = (v260[v288] or 0) + 1;
            if v287 > 0 then
                local v293 = v12[v266];
                v262 = v262 + 1;
                v261[v262] = v293;
            end;
            if v289 > 0 then
                v264 = v264 + 1;
                v263[v264] = v290;
            end;
            local v294 = l_v236_0 + 1;
            local v295 = l_v236_0 + v266;
            local v296 = v241 and 2 or 1;
            for v297 = v294, v295 - v296 do
                v248 = (v248 * 256 + (v234[v297 - v238 + 2] or 0)) % 16777216;
                if v266 <= v246 then
                    v276 = v235[v248];
                    if not v276 then
                        v276 = {};
                        v235[v248] = v276;
                    end;
                    v276[#v276 + 1] = v297;
                end;
            end;
            l_v236_0 = l_v236_0 + v266 - (v241 and 1 or 0);
            v265 = false;
        elseif not v241 or v265 then
            local v298 = v234[v241 and v272 - 1 or v272];
            v256 = v256 + 1;
            v255[v256] = v298;
            v257[v298] = (v257[v298] or 0) + 1;
            l_v236_0 = l_v236_0 + 1;
        else
            v265 = true;
            l_v236_0 = l_v236_0 + 1;
        end;
    end;
    v255[v256 + 1] = 256;
    v257[256] = (v257[256] or 0) + 1;
    return v255, v261, v257, v258, v263, v260;
end;
local function v317(v300, v301) --[[ Line: 1479 ]] --[[ Name: GetBlockDynamicHuffmanHeader ]]
    -- upvalues: v178 (copy), v194 (copy), v21 (copy)
    local v302, v303, v304 = v178(v300, 15, 285);
    local v305, v306, v307 = v178(v301, 15, 29);
    local v308, v309, v310 = v194(v302, v304, v305, v307);
    local v311, v312 = v178(v310, 7, 18);
    local v313 = 0;
    for v314 = 1, 19 do
        if (v311[v21[v314]] or 0) ~= 0 then
            v313 = v314;
        end;
    end;
    v313 = v313 - 4;
    local v315 = v304 + 1 - 257;
    local v316 = v307 + 1 - 1;
    if v316 < 0 then
        v316 = 0;
    end;
    return v315, v316, v313, v311, v312, v308, v309, v302, v303, v305, v306;
end;
local function v332(v318, v319, v320, v321, v322, v323, v324) --[[ Line: 1517 ]] --[[ Name: GetDynamicHuffmanBlockSize ]]
    -- upvalues: v18 (copy)
    local v325 = 17 + (v320 + 4) * 3;
    for v326 = 1, #v322 do
        local v327 = v322[v326];
        v325 = v325 + v321[v327];
        if v327 >= 16 then
            v325 = v325 + (v327 == 16 and 2 or v327 == 17 and 3 or 7);
        end;
    end;
    local v328 = 0;
    for v329 = 1, #v318 do
        local v330 = v318[v329];
        v325 = v325 + v323[v330];
        if v330 > 256 then
            v328 = v328 + 1;
            if v330 > 264 and v330 < 285 then
                v325 = v325 + v18[v330 - 256];
            end;
            local v331 = v319[v328];
            v325 = v325 + v324[v331];
            if v331 > 3 then
                v325 = v325 + ((v331 - v331 % 2) / 2 - 1);
            end;
        end;
    end;
    return v325;
end;
local function v360(v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349) --[[ Line: 1565 ]] --[[ Name: CompressDynamicHuffmanBlock ]]
    -- upvalues: v21 (copy), v18 (copy)
    v333(v334 and 1 or 0, 1);
    v333(2, 2);
    v333(v339, 5);
    v333(v340, 5);
    v333(v341, 4);
    for v350 = 1, v341 + 4 do
        v333(v342[v21[v350]] or 0, 3);
    end;
    local v351 = 1;
    for v352 = 1, #v344 do
        local v353 = v344[v352];
        v333(v343[v353], v342[v353]);
        if v353 >= 16 then
            v333(v345[v351], v353 == 16 and 2 or v353 == 17 and 3 or 7);
            v351 = v351 + 1;
        end;
    end;
    local v354 = 0;
    local v355 = 0;
    local v356 = 0;
    for v357 = 1, #v335 do
        local v358 = v335[v357];
        v333(v347[v358], v346[v358]);
        if v358 > 256 then
            v354 = v354 + 1;
            if v358 > 264 and v358 < 285 then
                v355 = v355 + 1;
                v333(v336[v355], v18[v358 - 256]);
            end;
            local v359 = v337[v354];
            v333(v349[v359], v348[v359]);
            if v359 > 3 then
                v356 = v356 + 1;
                v333(v338[v356], (v359 - v359 % 2) / 2 - 1);
            end;
        end;
    end;
end;
local function v368(v361, v362) --[[ Line: 1636 ]] --[[ Name: GetFixedHuffmanBlockSize ]]
    -- upvalues: v24 (ref), v18 (copy)
    local v363 = 3;
    local v364 = 0;
    for v365 = 1, #v361 do
        local v366 = v361[v365];
        v363 = v363 + v24[v366];
        if v366 > 256 then
            v364 = v364 + 1;
            if v366 > 264 and v366 < 285 then
                v363 = v363 + v18[v366 - 256];
            end;
            local v367 = v362[v364];
            v363 = v363 + 5;
            if v367 > 3 then
                v363 = v363 + ((v367 - v367 % 2) / 2 - 1);
            end;
        end;
    end;
    return v363;
end;
local function v381(v369, v370, v371, v372, v373, v374) --[[ Line: 1665 ]] --[[ Name: CompressFixedHuffmanBlock ]]
    -- upvalues: v22 (ref), v24 (ref), v18 (copy), v26 (ref)
    v369(v370 and 1 or 0, 1);
    v369(1, 2);
    local v375 = 0;
    local v376 = 0;
    local v377 = 0;
    for v378 = 1, #v371 do
        local v379 = v371[v378];
        v369(v22[v379], v24[v379]);
        if v379 > 256 then
            v375 = v375 + 1;
            if v379 > 264 and v379 < 285 then
                v376 = v376 + 1;
                v369(v372[v376], v18[v379 - 256]);
            end;
            local v380 = v373[v375];
            v369(v26[v380], 5);
            if v380 > 3 then
                v377 = v377 + 1;
                v369(v374[v377], (v380 - v380 % 2) / 2 - 1);
            end;
        end;
    end;
end;
local function _(v382, v383, v384) --[[ Line: 1708 ]] --[[ Name: GetStoreBlockSize ]]
    assert(v383 - v382 + 1 <= 65535);
    return 3 + (8 - (v384 + 3) % 8) % 8 + 32 + (v383 - v382 + 1) * 8;
end;
local function v395(v386, v387, v388, v389, v390, v391, v392) --[[ Line: 1722 ]] --[[ Name: CompressStoreBlock ]]
    -- upvalues: v8 (copy)
    assert(v391 - v390 + 1 <= 65535);
    v386(v388 and 1 or 0, 1);
    v386(0, 2);
    local v393 = (8 - (v392 + 3) % 8) % 8;
    if v393 > 0 then
        v386(v8[v393] - 1, v393);
    end;
    local v394 = v391 - v390 + 1;
    v386(v394, 16);
    v386(255 - v394 % 256 + (255 - (v394 - v394 % 256) / 256) * 256, 16);
    v387(v389:sub(v390, v391));
end;
local function v468(v396, v397, v398, v399, v400, v401) --[[ Line: 1753 ]] --[[ Name: Deflate ]]
    -- upvalues: v232 (copy), v299 (copy), v317 (copy), v332 (copy), v368 (copy), v395 (copy), v381 (copy), v360 (copy)
    local v402 = {};
    local v403 = {};
    local v404 = nil;
    local v405 = 0;
    local v406 = 0;
    local _ = 0;
    local v408, _ = v399(3);
    local v410 = #v400;
    local v411 = 0;
    local v412 = nil;
    local v413 = nil;
    if v396 then
        if v396.level then
            v412 = v396.level;
        end;
        if v396.strategy then
            v413 = v396.strategy;
        end;
    end;
    if not v412 then
        v412 = v410 < 2048 and 7 or v410 > 65536 and 3 or 5;
    end;
    while not v404 do
        if v405 == 0 then
            v405 = 1;
            v406 = 65535;
            v411 = 0;
        else
            v405 = v406 + 1;
            v406 = v406 + 32768;
            v411 = v405 - 32768 - 1;
        end;
        if v410 <= v406 then
            v406 = v410;
            v404 = true;
        else
            v404 = false;
        end;
        local v414 = {};
        local v415 = {};
        local v416 = {};
        local v417 = {};
        local v418 = {};
        local v419 = {};
        local v420 = nil;
        local v421 = nil;
        local v422 = nil;
        local v423 = {};
        local v424 = {};
        local v425 = {};
        local v426 = {};
        local v427 = {};
        local v428 = {};
        local v429 = {};
        local v430 = {};
        local v431 = nil;
        local v432 = nil;
        if v412 ~= 0 then
            v232(v400, v402, v405, v406 + 3, v411);
            if v405 == 1 and v401 then
                local l_string_table_1 = v401.string_table;
                local l_strlen_0 = v401.strlen;
                local v435 = 0;
                local v436 = -l_strlen_0 + 1 < -257 and -257 or -l_strlen_0 + 1;
                for v437 = v435, v436, -1 do
                    v402[v437] = l_string_table_1[l_strlen_0 + v437];
                end;
            end;
            if v413 == "huffman_only" then
                v414 = {};
                v232(v400, v414, v405, v406, v405 - 1);
                v415 = {};
                v416 = {};
                v414[v406 - v405 + 2] = 256;
                for v438 = 1, v406 - v405 + 2 do
                    local v439 = v414[v438];
                    v416[v439] = (v416[v439] or 0) + 1;
                end;
                v417 = {};
                v418 = {};
                v419 = {};
            else
                local v440, v441, v442, v443, v444, v445 = v299(v412, v402, v403, v405, v406, v411, v401);
                v414 = v440;
                v415 = v441;
                v416 = v442;
                v417 = v443;
                v418 = v444;
                v419 = v445;
            end;
            local v446, v447, v448, v449, v450, v451, v452, v453, v454, v455, v456 = v317(v416, v419);
            v420 = v446;
            v421 = v447;
            v422 = v448;
            v423 = v449;
            v424 = v450;
            v425 = v451;
            v426 = v452;
            v427 = v453;
            v428 = v454;
            v429 = v455;
            v430 = v456;
            v431 = v332(v414, v417, v422, v423, v425, v427, v429);
            v432 = v368(v414, v417);
        end;
        local l_v405_0 = v405;
        local l_v406_0 = v406;
        local l_v408_0 = v408;
        assert(l_v406_0 - l_v405_0 + 1 <= 65535);
        local v460 = 3 + (8 - (l_v408_0 + 3) % 8) % 8 + 32 + (l_v406_0 - l_v405_0 + 1) * 8;
        l_v405_0 = v460;
        l_v405_0 = v432 and v432 < l_v405_0 and v432 or l_v405_0;
        l_v405_0 = v431 and v431 < l_v405_0 and v431 or l_v405_0;
        if v412 == 0 or v413 ~= "fixed" and v413 ~= "dynamic" and v460 == l_v405_0 then
            v395(v397, v398, v404, v400, v405, v406, v408);
            v408 = v408 + v460;
        elseif v413 ~= "dynamic" and (v413 == "fixed" or v432 == l_v405_0) then
            v381(v397, v404, v414, v415, v417, v418);
            v408 = v408 + assert(v432);
        elseif v413 == "dynamic" or v431 == l_v405_0 then
            v360(v397, v404, v414, v415, v417, v418, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430);
            v408 = v408 + assert(v431);
        end;
        assert((if v404 then v399(3) else v399(0)) == v408);
        if not v404 then
            l_v406_0 = nil;
            if v401 and v405 == 1 then
                l_v406_0 = 0;
                while v402[l_v406_0] do
                    v402[l_v406_0] = nil;
                    l_v406_0 = l_v406_0 - 1;
                end;
            end;
            v401 = nil;
            l_v406_0 = 1;
            for v461 = v406 - 32767, v406 do
                v402[l_v406_0] = v402[v461 - v411];
                l_v406_0 = l_v406_0 + 1;
            end;
            for v462, v463 in pairs(v403) do
                local v464 = #v463;
                if v464 > 0 and v406 + 1 - v463[1] > 32768 then
                    if v464 == 1 then
                        v403[v462] = nil;
                    else
                        local v465 = {};
                        local v466 = 0;
                        for v467 = 2, v464 do
                            l_v406_0 = v463[v467];
                            if v406 + 1 - l_v406_0 <= 32768 then
                                v466 = v466 + 1;
                                v465[v466] = l_v406_0;
                            end;
                        end;
                        v403[v462] = v465;
                    end;
                end;
            end;
        end;
    end;
end;
local function v477(v469, v470, v471) --[[ Line: 1967 ]] --[[ Name: CompressDeflateInternal ]]
    -- upvalues: v111 (copy), v468 (copy)
    local v472, v473, v474 = v111();
    v468(v471, v472, v473, v474, v469, v470);
    local v475, v476 = v474(1);
    assert(v476);
    return v476, (8 - v475 % 8) % 8;
end;
local function v496(v478, v479, v480) --[[ Line: 1978 ]] --[[ Name: CompressZlibInternal ]]
    -- upvalues: v111 (copy), v468 (copy), v0 (copy)
    local v481, v482, v483 = v111();
    v481(120, 8);
    local v484 = v479 and 1 or 0;
    local v485 = 128 + v484 * 32;
    v481(v485 + (31 - (30720 + v485) % 31), 8);
    if v484 == 1 then
        assert(v479);
        local l_adler32_0 = v479.adler32;
        local v487 = l_adler32_0 % 256;
        l_adler32_0 = (l_adler32_0 - v487) / 256;
        local v488 = l_adler32_0 % 256;
        l_adler32_0 = (l_adler32_0 - v488) / 256;
        local v489 = l_adler32_0 % 256;
        v481((l_adler32_0 - v489) / 256 % 256, 8);
        v481(v489, 8);
        v481(v488, 8);
        v481(v487, 8);
    end;
    v468(v480, v481, v482, v483, v478, v479);
    v483(2);
    local v490 = v0:Adler32(v478);
    local v491 = v490 % 256;
    v490 = (v490 - v491) / 256;
    local v492 = v490 % 256;
    v490 = (v490 - v492) / 256;
    local v493 = v490 % 256;
    v481((v490 - v493) / 256 % 256, 8);
    v481(v493, 8);
    v481(v492, 8);
    v481(v491, 8);
    local v494, v495 = v483(1);
    assert(v495);
    return v495, (8 - v494 % 8) % 8;
end;
v0.CompressDeflate = function(_, v498, v499) --[[ Line: 2049 ]] --[[ Name: CompressDeflate ]]
    -- upvalues: v40 (copy), v477 (copy)
    local v500, v501 = v40(v498, false, nil, true, v499);
    if not v500 then
        error("Usage: LibDeflate:CompressDeflate(str, configs): " .. v501, 2);
    end;
    return v477(v498, nil, v499);
end;
v0.CompressDeflateWithDict = function(_, v503, v504, v505) --[[ Line: 2073 ]] --[[ Name: CompressDeflateWithDict ]]
    -- upvalues: v40 (copy), v477 (copy)
    local v506, v507 = v40(v503, true, v504, true, v505);
    if not v506 then
        error("Usage: LibDeflate:CompressDeflateWithDict" .. "(str, dictionary, configs): " .. v507, 2);
    end;
    return v477(v503, v504, v505);
end;
v0.CompressZlib = function(_, v509, v510) --[[ Line: 2093 ]] --[[ Name: CompressZlib ]]
    -- upvalues: v40 (copy), v496 (copy)
    local v511, v512 = v40(v509, false, nil, true, v510);
    if not v511 then
        error("Usage: LibDeflate:CompressZlib(str, configs): " .. v512, 2);
    end;
    return v496(v509, nil, v510);
end;
v0.CompressZlibWithDict = function(_, v514, v515, v516) --[[ Line: 2114 ]] --[[ Name: CompressZlibWithDict ]]
    -- upvalues: v40 (copy), v496 (copy)
    local v517, v518 = v40(v514, true, v515, true, v516);
    if not v517 then
        error("Usage: LibDeflate:CompressZlibWithDict" .. "(str, dictionary, configs): " .. v518, 2);
    end;
    return v496(v514, v515, v516);
end;
local function v557(v519) --[[ Line: 2143 ]] --[[ Name: CreateReader ]]
    -- upvalues: v8 (copy), l_byte_0 (copy), l_char_0 (copy), l_sub_0 (copy), v10 (copy)
    local v520 = #v519;
    local v521 = 1;
    local v522 = 0;
    local v523 = 0;
    return function(v524) --[[ Line: 2156 ]] --[[ Name: ReadBits ]]
        -- upvalues: v8 (ref), v522 (ref), v523 (ref), v519 (copy), v521 (ref), l_byte_0 (ref)
        local v525 = v8[v524];
        local v526 = nil;
        if v524 <= v522 then
            v526 = v523 % v525;
            v523 = (v523 - v526) / v525;
            v522 = v522 - v524;
            return v526;
        else
            local v527 = v8[v522];
            local v528, v529, v530, v531 = l_byte_0(v519, v521, v521 + 3);
            v523 = v523 + ((v528 or 0) + (v529 or 0) * 256 + (v530 or 0) * 65536 + (v531 or 0) * 16777216) * v527;
            v521 = v521 + 4;
            v522 = v522 + 32 - v524;
            v526 = v523 % v525;
            v523 = (v523 - v526) / v525;
            return v526;
        end;
    end, function(v532, v533, v534) --[[ Line: 2186 ]] --[[ Name: ReadBytes ]]
        -- upvalues: v522 (ref), v523 (ref), l_char_0 (ref), v520 (copy), v521 (ref), v519 (copy), l_sub_0 (ref)
        assert(v522 % 8 == 0);
        local v535 = v522 / 8 < v532 and v522 / 8 or v532;
        for _ = 1, v535 do
            local v537 = v523 % 256;
            v534 = v534 + 1;
            v533[v534] = l_char_0(v537);
            v523 = (v523 - v537) / 256;
        end;
        v522 = v522 - v535 * 8;
        v532 = v532 - v535;
        if (v520 - v521 - v532 + 1) * 8 + v522 < 0 then
            return -1;
        else
            for v538 = v521, v521 + v532 - 1 do
                v534 = v534 + 1;
                v533[v534] = l_sub_0(v519, v538, v538);
            end;
            v521 = v521 + v532;
            return v534;
        end;
    end, function(v539, v540, v541) --[[ Line: 2222 ]] --[[ Name: Decode ]]
        -- upvalues: v522 (ref), v519 (copy), v8 (ref), v521 (ref), l_byte_0 (ref), v523 (ref), v10 (ref)
        local v542 = 0;
        local v543 = 0;
        local v544 = 0;
        local v545 = nil;
        if v541 > 0 then
            if v522 < 15 and v519 then
                local v546 = v8[v522];
                local v547, v548, v549, v550 = l_byte_0(v519, v521, v521 + 3);
                v523 = v523 + ((v547 or 0) + (v548 or 0) * 256 + (v549 or 0) * 65536 + (v550 or 0) * 16777216) * v546;
                v521 = v521 + 4;
                v522 = v522 + 32;
            end;
            local v551 = v8[v541];
            v522 = v522 - v541;
            v542 = v523 % v551;
            v523 = (v523 - v542) / v551;
            v542 = v10[v541][v542];
            v545 = v539[v541];
            if v542 < v545 then
                return v540[v542];
            else
                v544 = v545;
                v543 = v545 * 2;
                v542 = v542 * 2;
            end;
        end;
        for v552 = v541 + 1, 15 do
            local v553 = nil;
            v553 = v523 % 2;
            v523 = (v523 - v553) / 2;
            v522 = v522 - 1;
            v542 = v553 == 1 and v542 + 1 - v542 % 2 or v542;
            v545 = v539[v552] or 0;
            local v554 = v542 - v543;
            if v554 < v545 then
                return v540[v544 + v554];
            else
                v544 = v544 + v545;
                v543 = (v543 + v545) * 2;
                v542 = v542 * 2;
            end;
        end;
        return -10;
    end, function() --[[ Line: 2274 ]] --[[ Name: ReaderBitlenLeft ]]
        -- upvalues: v520 (copy), v521 (ref), v522 (ref)
        return (v520 - v521 + 1) * 8 + v522;
    end, function() --[[ Line: 2278 ]] --[[ Name: SkipToByteBoundary ]]
        -- upvalues: v522 (ref), v8 (ref), v523 (ref)
        local v555 = v522 % 8;
        local v556 = v8[v555];
        v522 = v522 - v555;
        v523 = (v523 - v523 % v556) / v556;
    end;
end;
local function v565(v558, v559) --[[ Line: 2293 ]] --[[ Name: CreateDecompressState ]]
    -- upvalues: v557 (copy)
    local v560, v561, v562, v563, v564 = v557(v558);
    return {
        ReadBits = v560, 
        ReadBytes = v561, 
        Decode = v562, 
        ReaderBitlenLeft = v563, 
        SkipToByteBoundary = v564, 
        buffer_size = 0, 
        buffer = {}, 
        result_buffer = {}, 
        dictionary = v559
    };
end;
local function v580(v566, v567, v568) --[[ Line: 2319 ]] --[[ Name: GetHuffmanForDecode ]]
    local v569 = {};
    local l_v568_0 = v568;
    for v571 = 0, v567 do
        local v572 = v566[v571] or 0;
        l_v568_0 = v572 > 0 and v572 < l_v568_0 and v572 or l_v568_0;
        v569[v572] = (v569[v572] or 0) + 1;
    end;
    if v569[0] == v567 + 1 then
        return 0, v569, {}, 0;
    else
        local v573 = 1;
        for v574 = 1, v568 do
            v573 = v573 * 2 - (v569[v574] or 0);
            if v573 < 0 then
                return v573, {}, {}, 0;
            end;
        end;
        local v575 = {
            [1] = 0
        };
        for v576 = 1, v568 - 1 do
            v575[v576 + 1] = v575[v576] + (v569[v576] or 0);
        end;
        local v577 = {};
        for v578 = 0, v567 do
            local v579 = v566[v578] or 0;
            if v579 ~= 0 then
                v577[v575[v579]] = v578;
                v575[v579] = v575[v579] + 1;
            end;
        end;
        return v573, v569, v577, l_v568_0;
    end;
end;
local function v608(v581, v582, v583, v584, v585, v586, v587) --[[ Line: 2381 ]] --[[ Name: DecodeUntilEndOfBlock ]]
    -- upvalues: v9 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), l_concat_0 (copy)
    local l_buffer_0 = v581.buffer;
    local l_buffer_size_0 = v581.buffer_size;
    local l_ReadBits_0 = v581.ReadBits;
    local l_Decode_0 = v581.Decode;
    local l_ReaderBitlenLeft_0 = v581.ReaderBitlenLeft;
    local l_result_buffer_0 = v581.result_buffer;
    local l_dictionary_0 = v581.dictionary;
    local v595 = {};
    local v596 = nil;
    local v597 = 1;
    if l_dictionary_0 and not l_buffer_0[0] then
        v595 = l_dictionary_0.string_table;
        v596 = l_dictionary_0.strlen;
        v597 = -v596 + 1;
        local v598 = 0;
        local v599 = -v596 + 1 < -257 and -257 or -v596 + 1;
        for v600 = v598, v599, -1 do
            l_buffer_0[v600] = v9[v595[v596 + v600]];
        end;
    end;
    while true do
        local v601 = l_Decode_0(v582, v583, v584);
        if v601 < 0 or v601 > 285 then
            return -10;
        else
            if v601 < 256 then
                l_buffer_size_0 = l_buffer_size_0 + 1;
                l_buffer_0[l_buffer_size_0] = v9[v601];
            elseif v601 > 256 then
                v601 = v601 - 256;
                local v602 = v17[v601];
                v602 = v601 >= 8 and v602 + l_ReadBits_0(v18[v601]) or v602;
                v601 = l_Decode_0(v585, v586, v587);
                if v601 < 0 or v601 > 29 then
                    return -10;
                else
                    local v603 = v19[v601];
                    local v604 = l_buffer_size_0 - (v603 > 4 and v603 + l_ReadBits_0(v20[v601]) or v603) + 1;
                    if v604 < v597 then
                        return -11;
                    elseif v604 >= -257 then
                        for _ = 1, v602 do
                            l_buffer_size_0 = l_buffer_size_0 + 1;
                            l_buffer_0[l_buffer_size_0] = l_buffer_0[v604];
                            v604 = v604 + 1;
                        end;
                    else
                        v604 = v596 + v604;
                        for _ = 1, v602 do
                            l_buffer_size_0 = l_buffer_size_0 + 1;
                            l_buffer_0[l_buffer_size_0] = v9[v595[v604]];
                            v604 = v604 + 1;
                        end;
                    end;
                end;
            end;
            if l_ReaderBitlenLeft_0() < 0 then
                return 2;
            else
                if l_buffer_size_0 >= 65536 then
                    l_result_buffer_0[#l_result_buffer_0 + 1] = l_concat_0(l_buffer_0, "", 1, 32768);
                    for v607 = 32769, l_buffer_size_0 do
                        l_buffer_0[v607 - 32768] = l_buffer_0[v607];
                    end;
                    l_buffer_size_0 = l_buffer_size_0 - 32768;
                    l_buffer_0[l_buffer_size_0 + 1] = nil;
                end;
                if v601 == 256 then
                    v581.buffer_size = l_buffer_size_0;
                    return 0;
                end;
            end;
        end;
    end;
end;
local function v620(v609) --[[ Line: 2481 ]] --[[ Name: DecompressStoreBlock ]]
    -- upvalues: l_concat_0 (copy)
    local l_buffer_1 = v609.buffer;
    local l_buffer_size_1 = v609.buffer_size;
    local l_ReadBits_1 = v609.ReadBits;
    local l_ReadBytes_0 = v609.ReadBytes;
    local l_ReaderBitlenLeft_1 = v609.ReaderBitlenLeft;
    local l_SkipToByteBoundary_0 = v609.SkipToByteBoundary;
    local l_result_buffer_1 = v609.result_buffer;
    l_SkipToByteBoundary_0();
    local v617 = l_ReadBits_1(16);
    if l_ReaderBitlenLeft_1() < 0 then
        return 2;
    else
        local v618 = l_ReadBits_1(16);
        if l_ReaderBitlenLeft_1() < 0 then
            return 2;
        elseif v617 % 256 + v618 % 256 ~= 255 then
            return -2;
        elseif (v617 - v617 % 256) / 256 + (v618 - v618 % 256) / 256 ~= 255 then
            return -2;
        else
            l_buffer_size_1 = l_ReadBytes_0(v617, l_buffer_1, l_buffer_size_1);
            if l_buffer_size_1 < 0 then
                return 2;
            else
                if l_buffer_size_1 >= 65536 then
                    l_result_buffer_1[#l_result_buffer_1 + 1] = l_concat_0(l_buffer_1, "", 1, 32768);
                    for v619 = 32769, l_buffer_size_1 do
                        l_buffer_1[v619 - 32768] = l_buffer_1[v619];
                    end;
                    l_buffer_size_1 = l_buffer_size_1 - 32768;
                    l_buffer_1[l_buffer_size_1 + 1] = nil;
                end;
                v609.buffer_size = l_buffer_size_1;
                return 0;
            end;
        end;
    end;
end;
local function _(v621) --[[ Line: 2527 ]] --[[ Name: DecompressFixBlock ]]
    -- upvalues: v608 (copy), v25 (ref), v23 (ref), v29 (ref), v27 (ref)
    return (v608(v621, v25, v23, 7, v29, v27, 5));
end;
local function v648(v623) --[[ Line: 2537 ]] --[[ Name: DecompressDynamicBlock ]]
    -- upvalues: v21 (copy), v580 (copy), v608 (copy)
    local l_ReadBits_2 = v623.ReadBits;
    local l_Decode_1 = v623.Decode;
    local v626 = l_ReadBits_2(5) + 257;
    local v627 = l_ReadBits_2(5) + 1;
    local v628 = l_ReadBits_2(4) + 4;
    if v626 > 286 or v627 > 30 then
        return -3;
    else
        local v629 = {};
        for v630 = 1, v628 do
            v629[v21[v630]] = l_ReadBits_2(3);
        end;
        local v631, v632, v633, v634 = v580(v629, 18, 7);
        if v631 ~= 0 then
            return -4;
        else
            local v635 = {};
            local v636 = {};
            local v637 = 0;
            while true do
                if v637 < v626 + v627 then
                    local v638 = nil;
                    local v639 = nil;
                    v638 = l_Decode_1(v632, v633, v634);
                    if v638 < 0 then
                        return v638;
                    elseif v638 < 16 then
                        if v637 < v626 then
                            v635[v637] = v638;
                        else
                            v636[v637 - v626] = v638;
                        end;
                        v637 = v637 + 1;
                    else
                        v639 = 0;
                        if v638 == 16 then
                            if v637 == 0 then
                                return -5;
                            else
                                v639 = if v637 - 1 < v626 then v635[v637 - 1] else v636[v637 - v626 - 1];
                                v638 = 3 + l_ReadBits_2(2);
                            end;
                        else
                            v638 = if v638 == 17 then 3 + l_ReadBits_2(3) else 11 + l_ReadBits_2(7);
                        end;
                        if v637 + v638 > v626 + v627 then
                            return -6;
                        else
                            while v638 > 0 do
                                v638 = v638 - 1;
                                if v637 < v626 then
                                    v635[v637] = v639;
                                else
                                    v636[v637 - v626] = v639;
                                end;
                                v637 = v637 + 1;
                            end;
                        end;
                    end;
                elseif (v635[256] or 0) == 0 then
                    return -9;
                else
                    local v640, v641, v642, v643 = v580(v635, v626 - 1, 15);
                    if v640 ~= 0 and (v640 < 0 or v626 ~= (v641[0] or 0) + (v641[1] or 0)) then
                        return -7;
                    else
                        local v644, v645, v646, v647 = v580(v636, v627 - 1, 15);
                        if v644 ~= 0 and (v644 < 0 or v627 ~= (v645[0] or 0) + (v645[1] or 0)) then
                            return -8;
                        else
                            return (v608(v623, v641, v642, v643, v645, v646, v647));
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v654(v649) --[[ Line: 2651 ]] --[[ Name: Inflate ]]
    -- upvalues: v620 (copy), v608 (copy), v25 (ref), v23 (ref), v29 (ref), v27 (ref), v648 (copy), l_concat_0 (copy)
    local l_ReadBits_3 = v649.ReadBits;
    local v651 = nil;
    while true do
        if not v651 then
            v651 = l_ReadBits_3(1) == 1;
            local v652 = l_ReadBits_3(2);
            local v653 = nil;
            if v652 == 0 then
                v653 = v620(v649);
            elseif v652 == 1 then
                v653 = v608(v649, v25, v23, 7, v29, v27, 5);
            elseif v652 == 2 then
                v653 = v648(v649);
            else
                return nil, -1;
            end;
            if v653 ~= 0 then
                return nil, v653;
            end;
        else
            v649.result_buffer[#v649.result_buffer + 1] = l_concat_0(v649.buffer, "", 1, v649.buffer_size);
            return l_concat_0(v649.result_buffer), 0;
        end;
    end;
end;
local function v661(v655, v656) --[[ Line: 2679 ]] --[[ Name: DecompressDeflateInternal ]]
    -- upvalues: v565 (copy), v654 (copy)
    local v657 = v565(v655, v656);
    local v658, v659 = v654(v657);
    if not v658 then
        return nil, v659;
    else
        local v660 = v657.ReaderBitlenLeft();
        return v658, (v660 - v660 % 8) / 8;
    end;
end;
local function v687(v662, v663) --[[ Line: 2691 ]] --[[ Name: DecompressZlibInternal ]]
    -- upvalues: v565 (copy), v654 (copy), v0 (copy)
    local v664 = v565(v662, v663);
    local l_ReadBits_4 = v664.ReadBits;
    local v666 = l_ReadBits_4(8);
    if v664.ReaderBitlenLeft() < 0 then
        return nil, 2;
    else
        local v667 = v666 % 16;
        local v668 = (v666 - v667) / 16;
        if v667 ~= 8 then
            return nil, -12;
        elseif v668 > 7 then
            return nil, -13;
        else
            local v669 = l_ReadBits_4(8);
            if v664.ReaderBitlenLeft() < 0 then
                return nil, 2;
            elseif (v666 * 256 + v669) % 31 ~= 0 then
                return nil, -14;
            else
                local v670 = (v669 - v669 % 32) / 32 % 2;
                local _ = (v669 - v669 % 64) / 64 % 4;
                if v670 == 1 then
                    if not v663 then
                        return nil, -16;
                    else
                        local v672 = l_ReadBits_4(8);
                        local v673 = l_ReadBits_4(8);
                        local v674 = l_ReadBits_4(8);
                        local v675 = l_ReadBits_4(8);
                        local v676 = v672 * 16777216 + v673 * 65536 + v674 * 256 + v675;
                        if v664.ReaderBitlenLeft() < 0 then
                            return nil, 2;
                        else
                            local l_adler32_1 = v663.adler32;
                            if not (v676 % 4294967296 == l_adler32_1 % 4294967296) then
                                return nil, -17;
                            end;
                        end;
                    end;
                end;
                local v678, v679 = v654(v664);
                if not v678 then
                    return nil, v679;
                else
                    v664.SkipToByteBoundary();
                    local v680 = l_ReadBits_4(8);
                    local v681 = l_ReadBits_4(8);
                    local v682 = l_ReadBits_4(8);
                    local v683 = l_ReadBits_4(8);
                    if v664.ReaderBitlenLeft() < 0 then
                        return nil, 2;
                    else
                        local v684 = v680 * 16777216 + v681 * 65536 + v682 * 256 + v683;
                        local v685 = v0:Adler32(v678);
                        if not (v684 % 4294967296 == v685 % 4294967296) then
                            return nil, -15;
                        else
                            local v686 = v664.ReaderBitlenLeft();
                            return v678, (v686 - v686 % 8) / 8;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v0.DecompressDeflate = function(_, v689) --[[ Line: 2773 ]] --[[ Name: DecompressDeflate ]]
    -- upvalues: v661 (copy)
    local v690, v691;
    if type(v689) ~= "string" then
        v690 = false;
        v691 = ("'str' - string expected got '%s'."):format((type(v689)));
    else
        v690 = true;
        v691 = "";
    end;
    if not v690 then
        error("Usage: LibDeflate:DecompressDeflate(str): " .. v691, 2);
    end;
    return v661(v689);
end;
v0.DecompressDeflateWithDict = function(_, v693, v694) --[[ Line: 2799 ]] --[[ Name: DecompressDeflateWithDict ]]
    -- upvalues: v38 (copy), v661 (copy)
    local v695, v696;
    if type(v693) ~= "string" then
        v695 = false;
        v696 = ("'str' - string expected got '%s'."):format((type(v693)));
    else
        local v697, v698 = v38(v694);
        if not v697 then
            v695 = false;
            v696 = v698;
        else
            v695 = true;
            v696 = "";
        end;
    end;
    if not v695 then
        error("Usage: LibDeflate:DecompressDeflateWithDict(str, dictionary): " .. v696, 2);
    end;
    return v661(v693, v694);
end;
v0.DecompressZlib = function(_, v700) --[[ Line: 2821 ]] --[[ Name: DecompressZlib ]]
    -- upvalues: v687 (copy)
    local v701, v702;
    if type(v700) ~= "string" then
        v701 = false;
        v702 = ("'str' - string expected got '%s'."):format((type(v700)));
    else
        v701 = true;
        v702 = "";
    end;
    if not v701 then
        error("Usage: LibDeflate:DecompressZlib(str): " .. v702, 2);
    end;
    return v687(v700);
end;
v0.DecompressZlibWithDict = function(_, v704, v705) --[[ Line: 2847 ]] --[[ Name: DecompressZlibWithDict ]]
    -- upvalues: v38 (copy), v687 (copy)
    local v706, v707;
    if type(v704) ~= "string" then
        v706 = false;
        v707 = ("'str' - string expected got '%s'."):format((type(v704)));
    else
        local v708, v709 = v38(v705);
        if not v708 then
            v706 = false;
            v707 = v709;
        else
            v706 = true;
            v707 = "";
        end;
    end;
    if not v706 then
        error("Usage: LibDeflate:DecompressZlibWithDict(str, dictionary): " .. v707, 2);
    end;
    return v687(v704, v705);
end;
v24 = {};
for v710 = 0, 143 do
    v24[v710] = 8;
end;
for v711 = 144, 255 do
    v24[v711] = 9;
end;
v24[256] = 7;
v24[257] = 7;
v24[258] = 7;
v24[259] = 7;
v24[260] = 7;
v24[261] = 7;
v24[262] = 7;
v24[263] = 7;
v24[264] = 7;
v24[265] = 7;
v24[266] = 7;
v24[267] = 7;
v24[268] = 7;
v24[269] = 7;
v24[270] = 7;
v24[271] = 7;
v24[272] = 7;
v24[273] = 7;
v24[274] = 7;
v24[275] = 7;
v24[276] = 7;
v24[277] = 7;
v24[278] = 7;
v24[279] = 7;
v24[280] = 8;
v24[281] = 8;
v24[282] = 8;
v24[283] = 8;
v24[284] = 8;
v24[285] = 8;
v24[286] = 8;
v24[287] = 8;
v28 = {};
for v712 = 0, 31 do
    v28[v712] = 5;
end;
local v713 = nil;
local v714, v715, v716 = v580(v24, 287, 9);
v713 = v714;
v25 = v715;
v23 = v716;
assert(v713 == 0);
v714, v715, v716 = v580(v28, 31, 5);
v713 = v714;
v29 = v715;
v27 = v716;
assert(v713 == 0);
v22 = v143(v25, v24, 287, 9);
v26 = v143(v29, v28, 31, 5);
v713 = {
    ["\000"] = "%z", 
    ["("] = "%(", 
    [")"] = "%)", 
    ["."] = "%.", 
    ["%"] = "%%", 
    ["+"] = "%+", 
    ["-"] = "%-", 
    ["*"] = "%*", 
    ["?"] = "%?", 
    ["["] = "%[", 
    ["]"] = "%]", 
    ["^"] = "%^", 
    ["$"] = "%$"
};
v714 = function(v717) --[[ Line: 2908 ]] --[[ Name: escape_for_gsub ]]
    -- upvalues: v713 (copy)
    local v718, _ = v717:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
    return v718;
end;
v0.CreateCodec = function(_, v721, v722, v723) --[[ Line: 2953 ]] --[[ Name: CreateCodec ]]
    -- upvalues: l_byte_0 (copy), l_sub_0 (copy), l_concat_0 (copy), v713 (copy), v9 (copy), l_gsub_0 (copy), l_find_0 (copy)
    if type(v721) ~= "string" or type(v722) ~= "string" or type(v723) ~= "string" then
        error("Usage: LibDeflate:CreateCodec(reserved_chars, escape_chars, map_chars): All arguments must be string.", 2);
    end;
    if v722 == "" then
        return nil, "No escape characters supplied.";
    elseif #v721 < #v723 then
        return nil, "The number of reserved characters must be at least as many as the number of mapped chars.";
    elseif v721 == "" then
        return nil, "No characters to encode.";
    else
        local v724 = v721 .. v722 .. v723;
        local v725 = {};
        for v726 = 1, #v724 do
            local v727 = l_byte_0(v724, v726, v726);
            if v725[v727] then
                return nil, "There must be no duplicate characters in the concatenation of reserved_chars, escape_chars and map_chars.";
            else
                v725[v727] = true;
            end;
        end;
        local v728 = {};
        local v729 = {};
        local v730 = {};
        local v731 = {};
        if #v723 > 0 then
            local v732 = {};
            local v733 = {};
            for v734 = 1, #v723 do
                local v735 = l_sub_0(v721, v734, v734);
                local v736 = l_sub_0(v723, v734, v734);
                v731[v735] = v736;
                v730[#v730 + 1] = v735;
                v733[v736] = v735;
                v732[#v732 + 1] = v736;
            end;
            local v737 = #v728 + 1;
            local v738 = "([";
            local v739, _ = l_concat_0(v732):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
            v728[v737] = v738 .. v739 .. "])";
            v729[#v729 + 1] = v733;
        end;
        local v741 = 1;
        local v742 = l_sub_0(v722, v741, v741);
        local v743 = 0;
        local v744 = {};
        local v745 = {};
        for v746 = 1, #v724 do
            local v747 = l_sub_0(v724, v746, v746);
            if not v731[v747] then
                while true do
                    if v743 >= 256 or v725[v743] then
                        v743 = v743 + 1;
                        if v743 > 255 then
                            local v748 = #v728 + 1;
                            local v749, v750 = v742:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
                            local l_v749_0 = v749;
                            local v752 = "([";
                            v749, v750 = l_concat_0(v744):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
                            v728[v748] = l_v749_0 .. v752 .. v749 .. "])";
                            v729[#v729 + 1] = v745;
                            v741 = v741 + 1;
                            v742 = l_sub_0(v722, v741, v741);
                            v743 = 0;
                            v744 = {};
                            v745 = {};
                            if not v742 or v742 == "" then
                                return nil, "Out of escape characters.";
                            end;
                        end;
                    else
                        local v753 = v9[v743];
                        v731[v747] = v742 .. v753;
                        v730[#v730 + 1] = v747;
                        v745[v753] = v747;
                        v744[#v744 + 1] = v753;
                        v743 = v743 + 1;
                        break;
                    end;
                end;
            end;
            if v746 == #v724 then
                local v754 = #v728 + 1;
                local v755, v756 = v742:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
                local l_v755_0 = v755;
                local v758 = "([";
                v755, v756 = l_concat_0(v744):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
                v728[v754] = l_v755_0 .. v758 .. v755 .. "])";
                v729[#v729 + 1] = v745;
            end;
        end;
        local v759 = {};
        local v760 = "([";
        local v761, v762 = l_concat_0(v730):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
        local v763 = v760 .. v761 .. "])";
        v759.Encode = function(_, v765) --[[ Line: 3066 ]] --[[ Name: Encode ]]
            -- upvalues: l_gsub_0 (ref), v763 (copy), v731 (copy)
            if type(v765) ~= "string" then
                error(("Usage: codec:Encode(str): 'str' - string expected got '%s'."):format((type(v765))), 2);
            end;
            local v766, _ = l_gsub_0(v765, v763, v731);
            return v766;
        end;
        v760 = #v728;
        local v768 = "([";
        local v769;
        v762, v769 = v721:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v713);
        local v770 = v768 .. v762 .. "])";
        v759.Decode = function(_, v772) --[[ Line: 3079 ]] --[[ Name: Decode ]]
            -- upvalues: l_find_0 (ref), v770 (copy), v760 (copy), l_gsub_0 (ref), v728 (copy), v729 (copy)
            if type(v772) ~= "string" then
                error(("Usage: codec:Decode(str): 'str' - string expected got '%s'."):format((type(v772))), 2);
            end;
            if l_find_0(v772, v770) then
                return nil;
            else
                for v773 = 1, v760 do
                    v772 = l_gsub_0(v772, v728[v773], v729[v773]);
                end;
                return v772;
            end;
        end;
        return v759, "";
    end;
end;
v0.internals = {
    LoadStringToTable = v232, 
    IsValidDictionary = v38, 
    IsEqualAdler32 = v31
};
return table.freeze(v0);