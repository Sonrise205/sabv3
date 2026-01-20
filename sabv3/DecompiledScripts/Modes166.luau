--!native
local l_bxor_0 = bit32.bxor;
local l_copy_0 = buffer.copy;
local l_create_0 = buffer.create;
local l_len_0 = buffer.len;
local l_readu8_0 = buffer.readu8;
local l_readu32_0 = buffer.readu32;
local _ = buffer.tostring;
local l_writestring_0 = buffer.writestring;
local l_writeu8_0 = buffer.writeu8;
local l_writeu32_0 = buffer.writeu32;
local _ = math.floor;
local l_random_0 = math.random;
local l_pack_0 = string.pack;
local v13 = l_create_0(16);
local function v23(v14, v15, v16, v17, v18) --[[ Line: 31 ]] --[[ Name: addByteCtr ]]
    -- upvalues: l_readu8_0 (copy), l_writeu8_0 (copy)
    local v19 = false;
    local v20 = nil;
    if v18 then
        v20 = l_readu8_0(v14, v16) + v15;
        l_writeu8_0(v14, v16, v20);
        if v20 >= 256 then
            for v21 = v16 + 1, v17 do
                v20 = l_readu8_0(v14, v21) + 1;
                l_writeu8_0(v14, v21, v20);
                v19 = v20 < 256;
                if v19 then
                    break;
                end;
            end;
            if not v19 then
                return;
            end;
        end;
    else
        v20 = l_readu8_0(v14, v17) + v15;
        l_writeu8_0(v14, v17, v20);
        if v20 >= 256 then
            for v22 = v17 - 1, v16, -1 do
                v20 = l_readu8_0(v14, v22) + 1;
                l_writeu8_0(v14, v22, v20);
                if v20 < 256 then
                    break;
                end;
            end;
        end;
    end;
    v19 = false;
end;
local v36 = {
    ECB = {
        FwdMode = function(v24, _, v26, v27) --[[ Line: 67 ]] --[[ Name: FwdMode ]]
            -- upvalues: l_len_0 (copy)
            local v28 = l_len_0(v26) - 16;
            assert(v28 % 16 == 0, "Input length must be a multiple of 16 bytes");
            for v29 = 0, v28, 16 do
                v24(v26, v29, v27, v29);
            end;
        end, 
        InvMode = function(_, v31, v32, v33) --[[ Line: 74 ]] --[[ Name: InvMode ]]
            -- upvalues: l_len_0 (copy)
            local v34 = l_len_0(v32) - 16;
            assert(v34 % 16 == 0, "Input length must be a multiple of 16 bytes");
            for v35 = 0, v34, 16 do
                v31(v32, v35, v33, v35);
            end;
        end
    }
};
table.freeze(v36.ECB);
v36.CBC = {
    FwdMode = function(v37, _, v39, v40, _, v42) --[[ Line: 90 ]] --[[ Name: FwdMode ]]
        -- upvalues: l_len_0 (copy), v13 (copy), l_readu32_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy)
        local v43 = l_len_0(v39) - 16;
        assert(v43 % 16 == 0, "Input length must be a multiple of 16 bytes");
        v42 = v42 or v13;
        assert(l_len_0(v42) == 16, "Initialization vector must be 16 bytes long");
        l_writeu32_0(v40, 0, (l_bxor_0(l_readu32_0(v39, 0), (l_readu32_0(v42, 0)))));
        l_writeu32_0(v40, 4, (l_bxor_0(l_readu32_0(v39, 4), (l_readu32_0(v42, 4)))));
        l_writeu32_0(v40, 8, (l_bxor_0(l_readu32_0(v39, 8), (l_readu32_0(v42, 8)))));
        l_writeu32_0(v40, 12, (l_bxor_0(l_readu32_0(v39, 12), (l_readu32_0(v42, 12)))));
        v37(v40, 0, v40, 0);
        for v44 = 16, v43, 16 do
            l_writeu32_0(v40, v44, (l_bxor_0(l_readu32_0(v39, v44), (l_readu32_0(v40, v44 - 16)))));
            l_writeu32_0(v40, v44 + 4, (l_bxor_0(l_readu32_0(v39, v44 + 4), (l_readu32_0(v40, v44 - 12)))));
            l_writeu32_0(v40, v44 + 8, (l_bxor_0(l_readu32_0(v39, v44 + 8), (l_readu32_0(v40, v44 - 8)))));
            l_writeu32_0(v40, v44 + 12, (l_bxor_0(l_readu32_0(v39, v44 + 12), (l_readu32_0(v40, v44 - 4)))));
            v37(v40, v44, v40, v44);
        end;
    end, 
    InvMode = function(_, v46, v47, v48, _, v50) --[[ Line: 108 ]] --[[ Name: InvMode ]]
        -- upvalues: l_len_0 (copy), v13 (copy), l_readu32_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy)
        local v51 = l_len_0(v47) - 16;
        assert(v51 % 16 == 0, "Input length must be a multiple of 16 bytes");
        v50 = v50 or v13;
        assert(l_len_0(v50) == 16, "Initialization vector must be 16 bytes long");
        local v52 = l_readu32_0(v47, 0);
        local v53 = l_readu32_0(v47, 4);
        local v54 = l_readu32_0(v47, 8);
        local v55 = l_readu32_0(v47, 12);
        local v56 = nil;
        local v57 = nil;
        local v58 = nil;
        local v59 = nil;
        v46(v47, 0, v48, 0);
        l_writeu32_0(v48, 0, (l_bxor_0(l_readu32_0(v48, 0), (l_readu32_0(v50, 0)))));
        l_writeu32_0(v48, 4, (l_bxor_0(l_readu32_0(v48, 4), (l_readu32_0(v50, 4)))));
        l_writeu32_0(v48, 8, (l_bxor_0(l_readu32_0(v48, 8), (l_readu32_0(v50, 8)))));
        l_writeu32_0(v48, 12, (l_bxor_0(l_readu32_0(v48, 12), (l_readu32_0(v50, 12)))));
        for v60 = 16, v51, 16 do
            v56 = l_readu32_0(v47, v60);
            v57 = l_readu32_0(v47, v60 + 4);
            v58 = l_readu32_0(v47, v60 + 8);
            v59 = l_readu32_0(v47, v60 + 12);
            v46(v47, v60, v48, v60);
            l_writeu32_0(v48, v60, (l_bxor_0(l_readu32_0(v48, v60), v52)));
            l_writeu32_0(v48, v60 + 4, (l_bxor_0(l_readu32_0(v48, v60 + 4), v53)));
            l_writeu32_0(v48, v60 + 8, (l_bxor_0(l_readu32_0(v48, v60 + 8), v54)));
            l_writeu32_0(v48, v60 + 12, (l_bxor_0(l_readu32_0(v48, v60 + 12), v55)));
            v52 = v56;
            v53 = v57;
            v54 = v58;
            v55 = v59;
        end;
    end
};
table.freeze(v36.CBC);
v36.PCBC = {
    FwdMode = function(v61, _, v63, v64, _, v66) --[[ Line: 143 ]] --[[ Name: FwdMode ]]
        -- upvalues: l_len_0 (copy), v13 (copy), l_readu32_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy)
        local v67 = l_len_0(v63) - 16;
        assert(v67 % 16 == 0, "Input length must be a multiple of 16 bytes");
        v66 = v66 or v13;
        assert(l_len_0(v66) == 16, "Initialization vector must be 16 bytes long");
        local v68 = l_readu32_0(v63, 0);
        local v69 = l_readu32_0(v63, 4);
        local v70 = l_readu32_0(v63, 8);
        local v71 = l_readu32_0(v63, 12);
        local v72 = nil;
        local v73 = nil;
        local v74 = nil;
        local v75 = nil;
        l_writeu32_0(v64, 0, (l_bxor_0(v68, (l_readu32_0(v66, 0)))));
        l_writeu32_0(v64, 4, (l_bxor_0(v69, (l_readu32_0(v66, 4)))));
        l_writeu32_0(v64, 8, (l_bxor_0(v70, (l_readu32_0(v66, 8)))));
        l_writeu32_0(v64, 12, (l_bxor_0(v71, (l_readu32_0(v66, 12)))));
        v61(v64, 0, v64, 0);
        for v76 = 16, v67, 16 do
            v72 = l_readu32_0(v63, v76);
            v73 = l_readu32_0(v63, v76 + 4);
            v74 = l_readu32_0(v63, v76 + 8);
            v75 = l_readu32_0(v63, v76 + 12);
            l_writeu32_0(v64, v76, (l_bxor_0(v68, v72, (l_readu32_0(v64, v76 - 16)))));
            l_writeu32_0(v64, v76 + 4, (l_bxor_0(v69, v73, (l_readu32_0(v64, v76 - 12)))));
            l_writeu32_0(v64, v76 + 8, (l_bxor_0(v70, v74, (l_readu32_0(v64, v76 - 8)))));
            l_writeu32_0(v64, v76 + 12, (l_bxor_0(v71, v75, (l_readu32_0(v64, v76 - 4)))));
            v61(v64, v76, v64, v76);
            v68 = v72;
            v69 = v73;
            v70 = v74;
            v71 = v75;
        end;
    end, 
    InvMode = function(_, v78, v79, v80, _, v82) --[[ Line: 169 ]] --[[ Name: InvMode ]]
        -- upvalues: l_len_0 (copy), v13 (copy), l_readu32_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy)
        local v83 = l_len_0(v79) - 16;
        assert(v83 % 16 == 0, "Input length must be a multiple of 16 bytes");
        v82 = v82 or v13;
        assert(l_len_0(v82) == 16, "Initialization vector must be 16 bytes long");
        local v84 = l_readu32_0(v79, 0);
        local v85 = l_readu32_0(v79, 4);
        local v86 = l_readu32_0(v79, 8);
        local v87 = l_readu32_0(v79, 12);
        v78(v79, 0, v80, 0);
        local v88 = l_bxor_0(l_readu32_0(v80, 0), (l_readu32_0(v82, 0)));
        local v89 = l_bxor_0(l_readu32_0(v80, 4), (l_readu32_0(v82, 4)));
        local v90 = l_bxor_0(l_readu32_0(v80, 8), (l_readu32_0(v82, 8)));
        local v91 = l_bxor_0(l_readu32_0(v80, 12), (l_readu32_0(v82, 12)));
        local v92 = nil;
        local v93 = nil;
        local v94 = nil;
        local v95 = nil;
        l_writeu32_0(v80, 0, v88);
        l_writeu32_0(v80, 4, v89);
        l_writeu32_0(v80, 8, v90);
        l_writeu32_0(v80, 12, v91);
        local v96 = 0;
        local v97 = 4;
        local v98 = 8;
        local v99 = 12;
        for v100 = 16, v83, 16 do
            v96 = v96 + 16;
            v97 = v97 + 16;
            v98 = v98 + 16;
            v99 = v99 + 16;
            v92 = l_readu32_0(v79, v96);
            v93 = l_readu32_0(v79, v97);
            v94 = l_readu32_0(v79, v98);
            v95 = l_readu32_0(v79, v99);
            v78(v79, v100, v80, v100);
            v88 = l_bxor_0(v84, v88, (l_readu32_0(v80, v96)));
            v89 = l_bxor_0(v85, v89, (l_readu32_0(v80, v97)));
            v90 = l_bxor_0(v86, v90, (l_readu32_0(v80, v98)));
            v91 = l_bxor_0(v87, v91, (l_readu32_0(v80, v99)));
            v84 = v92;
            v85 = v93;
            v86 = v94;
            v87 = v95;
            l_writeu32_0(v80, v96, v88);
            l_writeu32_0(v80, v97, v89);
            l_writeu32_0(v80, v98, v90);
            l_writeu32_0(v80, v99, v91);
        end;
    end
};
table.freeze(v36.PCBC);
local function v118(v101, _, v103, v104, v105, v106) --[[ Line: 217 ]] --[[ Name: cfbFwd ]]
    -- upvalues: l_len_0 (copy), v13 (copy), l_create_0 (copy), l_readu8_0 (copy), l_bxor_0 (copy), l_writeu8_0 (copy), l_copy_0 (copy)
    local l_SegmentSize_0 = v105.SegmentSize;
    local v108 = l_len_0(v103);
    assert(v108 % l_SegmentSize_0 == 0, "Input length must be a multiple of segment size");
    v106 = v106 or v13;
    assert(l_len_0(v106) == 16, "Initialization vector must be 16 bytes long");
    local v109 = v105.CommonTemp or l_create_0(31);
    if v108 == l_SegmentSize_0 then
        v101(v106, 0, v109, 0);
        for v110 = 0, l_SegmentSize_0 - 1 do
            l_writeu8_0(v104, v110, (l_bxor_0(l_readu8_0(v103, v110), (l_readu8_0(v109, v110)))));
        end;
        return;
    else
        local v111 = v108 - l_SegmentSize_0;
        local v112 = 16 - l_SegmentSize_0;
        local v113 = nil;
        v101(v106, 0, v109, 0);
        for v114 = 0, l_SegmentSize_0 - 1 do
            l_writeu8_0(v104, v114, (l_bxor_0(l_readu8_0(v103, v114), (l_readu8_0(v109, v114)))));
        end;
        l_copy_0(v109, 0, v106, l_SegmentSize_0, v112);
        l_copy_0(v109, v112, v104, 0, l_SegmentSize_0);
        for v115 = l_SegmentSize_0, v111 - l_SegmentSize_0, l_SegmentSize_0 do
            v113 = 0;
            l_copy_0(v109, 16, v109, l_SegmentSize_0, v112);
            v101(v109, 0, v109, 0);
            for v116 = v115, v115 + l_SegmentSize_0 - 1 do
                l_writeu8_0(v104, v116, (l_bxor_0(l_readu8_0(v103, v116), (l_readu8_0(v109, v113)))));
                v113 = v113 + 1;
            end;
            l_copy_0(v109, 0, v109, 16, v112);
            l_copy_0(v109, v112, v104, v115, l_SegmentSize_0);
        end;
        v101(v109, 0, v109, 0);
        v113 = 0;
        for v117 = v111, v108 - 1 do
            l_writeu8_0(v104, v117, (l_bxor_0(l_readu8_0(v103, v117), (l_readu8_0(v109, v113)))));
            v113 = v113 + 1;
        end;
        return;
    end;
end;
local function v136(v119, _, v121, v122, v123, v124) --[[ Line: 257 ]] --[[ Name: cfbInv ]]
    -- upvalues: l_len_0 (copy), v13 (copy), l_create_0 (copy), l_readu8_0 (copy), l_bxor_0 (copy), l_writeu8_0 (copy), l_copy_0 (copy)
    local v125 = l_len_0(v121);
    local l_SegmentSize_1 = v123.SegmentSize;
    assert(v125 % l_SegmentSize_1 == 0, "Input length must be a multiple of segment size");
    v124 = v124 or v13;
    assert(l_len_0(v124) == 16, "Initialization vector must be 16 bytes long");
    local v127 = v123.CommonTemp or l_create_0(31);
    if v125 == l_SegmentSize_1 then
        v119(v124, 0, v127, 0);
        for v128 = 0, l_SegmentSize_1 - 1 do
            l_writeu8_0(v122, v128, (l_bxor_0(l_readu8_0(v121, v128), (l_readu8_0(v127, v128)))));
        end;
        return;
    else
        local v129 = v125 - l_SegmentSize_1;
        local v130 = 16 - l_SegmentSize_1;
        local v131 = nil;
        v119(v124, 0, v127, 0);
        for v132 = 0, l_SegmentSize_1 - 1 do
            l_writeu8_0(v122, v132, (l_bxor_0(l_readu8_0(v121, v132), (l_readu8_0(v127, v132)))));
        end;
        l_copy_0(v127, 0, v124, l_SegmentSize_1, v130);
        l_copy_0(v127, v130, v121, 0, l_SegmentSize_1);
        for v133 = l_SegmentSize_1, v129 - l_SegmentSize_1, l_SegmentSize_1 do
            v131 = 0;
            l_copy_0(v127, 16, v127, l_SegmentSize_1, v130);
            v119(v127, 0, v127, 0);
            for v134 = v133, v133 + l_SegmentSize_1 - 1 do
                l_writeu8_0(v122, v134, (l_bxor_0(l_readu8_0(v121, v134), (l_readu8_0(v127, v131)))));
                v131 = v131 + 1;
            end;
            l_copy_0(v127, 0, v127, 16, v130);
            l_copy_0(v127, v130, v121, v133, l_SegmentSize_1);
        end;
        v119(v127, 0, v127, 0);
        v131 = 0;
        for v135 = v129, v125 - 1 do
            l_writeu8_0(v122, v135, (l_bxor_0(l_readu8_0(v121, v135), (l_readu8_0(v127, v131)))));
            v131 = v131 + 1;
        end;
        return;
    end;
end;
local function v153(v137, _, v139, v140, _, v142) --[[ Line: 305 ]] --[[ Name: ofbMode ]]
    -- upvalues: l_len_0 (copy), v13 (copy), l_readu32_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy)
    local v143 = l_len_0(v139) - 16;
    assert(v143 % 16 == 0, "Input length must be a multiple of 16 bytes");
    v142 = v142 or v13;
    assert(l_len_0(v142) == 16, "Initialization vector must be 16 bytes long");
    local v144 = l_readu32_0(v139, 0);
    local v145 = l_readu32_0(v139, 4);
    local v146 = l_readu32_0(v139, 8);
    local v147 = l_readu32_0(v139, 12);
    v137(v142, 0, v140, 0);
    v144 = l_bxor_0(v144, (l_readu32_0(v140, 0)));
    v145 = l_bxor_0(v145, (l_readu32_0(v140, 4)));
    v146 = l_bxor_0(v146, (l_readu32_0(v140, 8)));
    v147 = l_bxor_0(v147, (l_readu32_0(v140, 12)));
    local v148 = nil;
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    for v152 = 16, v143, 16 do
        v148 = l_readu32_0(v139, v152);
        v149 = l_readu32_0(v139, v152 + 4);
        v150 = l_readu32_0(v139, v152 + 8);
        v151 = l_readu32_0(v139, v152 + 12);
        v137(v140, v152 - 16, v140, v152);
        l_writeu32_0(v140, v152 - 16, v144);
        l_writeu32_0(v140, v152 - 12, v145);
        l_writeu32_0(v140, v152 - 8, v146);
        l_writeu32_0(v140, v152 - 4, v147);
        v144 = l_bxor_0(v148, (l_readu32_0(v140, v152)));
        v145 = l_bxor_0(v149, (l_readu32_0(v140, v152 + 4)));
        v146 = l_bxor_0(v150, (l_readu32_0(v140, v152 + 8)));
        v147 = l_bxor_0(v151, (l_readu32_0(v140, v152 + 12)));
    end;
    l_writeu32_0(v140, v143, v144);
    l_writeu32_0(v140, v143 + 4, v145);
    l_writeu32_0(v140, v143 + 8, v146);
    l_writeu32_0(v140, v143 + 12, v147);
end;
v36.OFB = {
    FwdMode = v153, 
    InvMode = v153
};
table.freeze(v36.OFB);
local function v173(v154, _, v156, v157, v158) --[[ Line: 358 ]] --[[ Name: ctrMode ]]
    -- upvalues: l_len_0 (copy), l_writestring_0 (copy), l_readu32_0 (copy), l_bxor_0 (copy), l_writeu32_0 (copy), v23 (copy)
    local v159 = l_len_0(v156) - 16;
    assert(v159 % 16 == 0, "Input length must be a multiple of 16 bytes");
    local l_CommonTemp_0 = v158.CommonTemp;
    local l_InitValue_0 = v158.InitValue;
    local l_Prefix_0 = v158.Prefix;
    local l_Suffix_0 = v158.Suffix;
    local l_Step_0 = v158.Step;
    local l_LittleEndian_0 = v158.LittleEndian;
    local v166 = #l_Prefix_0;
    local v167 = v166 + #l_InitValue_0 - 1;
    l_writestring_0(l_CommonTemp_0, 0, l_Prefix_0);
    l_writestring_0(l_CommonTemp_0, v166, l_InitValue_0);
    l_writestring_0(l_CommonTemp_0, v167 + 1, l_Suffix_0);
    local v168 = l_readu32_0(v156, 0);
    local v169 = l_readu32_0(v156, 4);
    local v170 = l_readu32_0(v156, 8);
    local v171 = l_readu32_0(v156, 12);
    v154(l_CommonTemp_0, 0, v157, 0);
    l_writeu32_0(v157, 0, (l_bxor_0(l_readu32_0(v157, 0), v168)));
    l_writeu32_0(v157, 4, (l_bxor_0(l_readu32_0(v157, 4), v169)));
    l_writeu32_0(v157, 8, (l_bxor_0(l_readu32_0(v157, 8), v170)));
    l_writeu32_0(v157, 12, (l_bxor_0(l_readu32_0(v157, 12), v171)));
    for v172 = 16, v159, 16 do
        v168 = l_readu32_0(v156, v172);
        v169 = l_readu32_0(v156, v172 + 4);
        v170 = l_readu32_0(v156, v172 + 8);
        v171 = l_readu32_0(v156, v172 + 12);
        v23(l_CommonTemp_0, l_Step_0, v166, v167, l_LittleEndian_0);
        v154(l_CommonTemp_0, 0, v157, v172);
        l_writeu32_0(v157, v172, (l_bxor_0(v168, (l_readu32_0(v157, v172)))));
        l_writeu32_0(v157, v172 + 4, (l_bxor_0(v169, (l_readu32_0(v157, v172 + 4)))));
        l_writeu32_0(v157, v172 + 8, (l_bxor_0(v170, (l_readu32_0(v157, v172 + 8)))));
        l_writeu32_0(v157, v172 + 12, (l_bxor_0(v171, (l_readu32_0(v157, v172 + 12)))));
    end;
end;
local v176 = {
    __index = function(_, v175) --[[ Line: 391 ]] --[[ Name: __index ]]
        -- upvalues: v118 (copy), v136 (copy), l_create_0 (copy), v173 (copy), l_pack_0 (copy), l_random_0 (copy)
        if v175 == "CFB" then
            return {
                FwdMode = v118, 
                InvMode = v136, 
                SegmentSize = 16, 
                CommonTemp = l_create_0(31)
            };
        elseif v175 == "CTR" then
            return {
                FwdMode = v173, 
                InvMode = v173, 
                InitValue = l_pack_0("I2I2I2I2I2I2I2I2", l_random_0(0, 65535), l_random_0(0, 65535), l_random_0(0, 65535), l_random_0(0, 65535), l_random_0(0, 65535), l_random_0(0, 65535), l_random_0(0, 65535), l_random_0(0, 65535)), 
                Prefix = "", 
                Suffix = "", 
                Step = 1, 
                LittleEndian = false, 
                CommonTemp = l_create_0(16)
            };
        else
            return nil;
        end;
    end, 
    __newindex = function() --[[ Line: 404 ]] --[[ Name: __newindex ]]

    end
};
setmetatable(v36, v176);
v36.CFB = {};
v36.CTR = {};
table.freeze(v36);
v176.__metatable = "This metatable is locked";
return v36;