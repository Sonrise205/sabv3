--!native
local function v2(v0, v1) --[[ Line: 11 ]] --[[ Name: newcursor ]]
    return {
        Buf = buffer.create(v0 or 8), 
        Pos = v1 or 0
    };
end;
local function v4(v3) --[[ Line: 18 ]] --[[ Name: frombuffer ]]
    return {
        Buf = v3, 
        Pos = buffer.len(v3)
    };
end;
local function v7(v5) --[[ Line: 25 ]] --[[ Name: tobuffer ]]
    local v6 = buffer.create(v5.Pos);
    buffer.copy(v6, 0, v5.Buf, 0, v5.Pos);
    return v6;
end;
local function v15(v8, v9) --[[ Line: 31 ]] --[[ Name: tryrealloc ]]
    local l_Buf_0 = v8.Buf;
    local l_Pos_0 = v8.Pos;
    local v12 = buffer.len(l_Buf_0);
    if v12 < l_Pos_0 + v9 then
        local v13 = math.ceil((math.log((v9 + l_Pos_0) / v12, 1.5)));
        local v14 = buffer.create(v12 * 1.5 ^ v13);
        buffer.copy(v14, 0, l_Buf_0, 0);
        v8.Buf = v14;
    end;
end;
local function v18(v16, v17) --[[ Line: 43 ]] --[[ Name: pushu1 ]]
    buffer.writeu8(v16.Buf, v16.Pos, v17);
    v16.Pos = v16.Pos + 1;
end;
local function v20(v19) --[[ Line: 48 ]] --[[ Name: popu1 ]]
    v19.Pos = v19.Pos - 1;
    return (buffer.readu8(v19.Buf, v19.Pos));
end;
local function v23(v21, v22) --[[ Line: 53 ]] --[[ Name: pushu2 ]]
    buffer.writeu16(v21.Buf, v21.Pos, v22);
    v21.Pos = v21.Pos + 2;
end;
local function v25(v24) --[[ Line: 58 ]] --[[ Name: popu2 ]]
    v24.Pos = v24.Pos - 2;
    return (buffer.readu16(v24.Buf, v24.Pos));
end;
local function v28(v26, v27) --[[ Line: 63 ]] --[[ Name: pushu3 ]]
    buffer.writeu8(v26.Buf, v26.Pos, v27);
    buffer.writeu16(v26.Buf, v26.Pos + 1, v27 // 256);
    v26.Pos = v26.Pos + 3;
end;
local function v30(v29) --[[ Line: 69 ]] --[[ Name: popu3 ]]
    v29.Pos = v29.Pos - 3;
    return buffer.readu8(v29.Buf, v29.Pos) + buffer.readu16(v29.Buf, v29.Pos + 1) * 256;
end;
local function v33(v31, v32) --[[ Line: 76 ]] --[[ Name: pushu4 ]]
    buffer.writeu32(v31.Buf, v31.Pos, v32);
    v31.Pos = v31.Pos + 4;
end;
local function v35(v34) --[[ Line: 81 ]] --[[ Name: popu4 ]]
    v34.Pos = v34.Pos - 4;
    return (buffer.readu32(v34.Buf, v34.Pos));
end;
local function v38(v36, v37) --[[ Line: 86 ]] --[[ Name: pushu5 ]]
    buffer.writeu8(v36.Buf, v36.Pos, v37);
    buffer.writeu32(v36.Buf, v36.Pos + 1, v37 // 256);
    v36.Pos = v36.Pos + 5;
end;
local function v40(v39) --[[ Line: 92 ]] --[[ Name: popu5 ]]
    v39.Pos = v39.Pos - 5;
    return buffer.readu8(v39.Buf, v39.Pos) + buffer.readu32(v39.Buf, v39.Pos + 1) * 256;
end;
local function v43(v41, v42) --[[ Line: 99 ]] --[[ Name: pushu6 ]]
    buffer.writeu16(v41.Buf, v41.Pos, v42);
    buffer.writeu32(v41.Buf, v41.Pos + 2, v42 // 65536);
    v41.Pos = v41.Pos + 6;
end;
local function v45(v44) --[[ Line: 105 ]] --[[ Name: popu6 ]]
    v44.Pos = v44.Pos - 6;
    return buffer.readu16(v44.Buf, v44.Pos) + buffer.readu32(v44.Buf, v44.Pos + 2) * 65536;
end;
local function v48(v46, v47) --[[ Line: 112 ]] --[[ Name: pushu7 ]]
    buffer.writeu8(v46.Buf, v46.Pos, v47);
    buffer.writeu16(v46.Buf, v46.Pos + 1, v47 // 256);
    buffer.writeu32(v46.Buf, v46.Pos + 3, v47 // 16777216);
    v46.Pos = v46.Pos + 7;
end;
local function v53(v49) --[[ Line: 119 ]] --[[ Name: popu7 ]]
    v49.Pos = v49.Pos - 7;
    local v50 = buffer.readu8(v49.Buf, v49.Pos);
    local v51 = buffer.readu16(v49.Buf, v49.Pos + 1);
    local v52 = buffer.readu32(v49.Buf, v49.Pos + 3);
    return v50 + v51 * 256 + v52 * 16777216;
end;
local function v56(v54, v55) --[[ Line: 127 ]] --[[ Name: pushu8 ]]
    buffer.writeu32(v54.Buf, v54.Pos, v55);
    buffer.writeu32(v54.Buf, v54.Pos + 4, v55 // 4294967296);
    v54.Pos = v54.Pos + 8;
end;
local function v58(v57) --[[ Line: 133 ]] --[[ Name: popu8 ]]
    v57.Pos = v57.Pos - 8;
    return buffer.readu32(v57.Buf, v57.Pos) + buffer.readu32(v57.Buf, v57.Pos + 4) * 4294967296;
end;
local function v61(v59, v60) --[[ Line: 140 ]] --[[ Name: pushi1 ]]
    buffer.writei8(v59.Buf, v59.Pos, v60);
    v59.Pos = v59.Pos + 1;
end;
local function v63(v62) --[[ Line: 145 ]] --[[ Name: popi1 ]]
    v62.Pos = v62.Pos - 1;
    return (buffer.readi8(v62.Buf, v62.Pos));
end;
local function v66(v64, v65) --[[ Line: 150 ]] --[[ Name: pushi2 ]]
    buffer.writei16(v64.Buf, v64.Pos, v65);
    v64.Pos = v64.Pos + 2;
end;
local function v68(v67) --[[ Line: 155 ]] --[[ Name: popi2 ]]
    v67.Pos = v67.Pos - 2;
    return (buffer.readi16(v67.Buf, v67.Pos));
end;
local function v72(v69, v70) --[[ Line: 160 ]] --[[ Name: pushi3 ]]
    local v71 = if v70 >= 0 then v70 * 2 else -v70 * 2 - 1;
    buffer.writeu8(v69.Buf, v69.Pos, v71 % 256);
    buffer.writeu16(v69.Buf, v69.Pos + 1, v71 // 256);
    v69.Pos = v69.Pos + 3;
end;
local function v75(v73) --[[ Line: 167 ]] --[[ Name: popi3 ]]
    v73.Pos = v73.Pos - 3;
    local v74 = buffer.readu8(v73.Buf, v73.Pos) + buffer.readu16(v73.Buf, v73.Pos + 1) * 256;
    if v74 % 2 == 0 then
        return v74 // 2;
    else
        return -((v74 + 1) // 2);
    end;
end;
local function v78(v76, v77) --[[ Line: 175 ]] --[[ Name: pushi4 ]]
    buffer.writei32(v76.Buf, v76.Pos, v77);
    v76.Pos = v76.Pos + 4;
end;
local function v80(v79) --[[ Line: 180 ]] --[[ Name: popi4 ]]
    v79.Pos = v79.Pos - 4;
    return (buffer.readi32(v79.Buf, v79.Pos));
end;
local function v84(v81, v82) --[[ Line: 185 ]] --[[ Name: pushi5 ]]
    local v83 = if v82 >= 0 then v82 * 2 else -v82 * 2 - 1;
    buffer.writeu8(v81.Buf, v81.Pos, v83);
    buffer.writeu32(v81.Buf, v81.Pos + 1, v83 // 256);
    v81.Pos = v81.Pos + 5;
end;
local function v87(v85) --[[ Line: 192 ]] --[[ Name: popi5 ]]
    v85.Pos = v85.Pos - 5;
    local v86 = buffer.readu8(v85.Buf, v85.Pos) + buffer.readu32(v85.Buf, v85.Pos + 1) * 256;
    if v86 % 2 == 0 then
        return v86 // 2;
    else
        return -((v86 + 1) // 2);
    end;
end;
local function v91(v88, v89) --[[ Line: 200 ]] --[[ Name: pushi6 ]]
    local v90 = if v89 >= 0 then v89 * 2 else -v89 * 2 - 1;
    buffer.writeu16(v88.Buf, v88.Pos, v90);
    buffer.writeu32(v88.Buf, v88.Pos + 2, v90 // 65536);
    v88.Pos = v88.Pos + 6;
end;
local function v94(v92) --[[ Line: 207 ]] --[[ Name: popi6 ]]
    v92.Pos = v92.Pos - 6;
    local v93 = buffer.readu16(v92.Buf, v92.Pos) + buffer.readu32(v92.Buf, v92.Pos + 2) * 65536;
    if v93 % 2 == 0 then
        return v93 // 2;
    else
        return -((v93 + 1) // 2);
    end;
end;
local function v98(v95, v96) --[[ Line: 215 ]] --[[ Name: pushi7 ]]
    local v97 = if v96 >= 0 then v96 * 2 else -v96 * 2 - 1;
    buffer.writeu8(v95.Buf, v95.Pos, v97);
    buffer.writeu16(v95.Buf, v95.Pos + 1, v97 // 256);
    buffer.writeu32(v95.Buf, v95.Pos + 3, v97 // 16777216);
    v95.Pos = v95.Pos + 7;
end;
local function v104(v99) --[[ Line: 223 ]] --[[ Name: popi7 ]]
    v99.Pos = v99.Pos - 7;
    local v100 = buffer.readu8(v99.Buf, v99.Pos);
    local v101 = buffer.readu16(v99.Buf, v99.Pos + 1);
    local v102 = buffer.readu32(v99.Buf, v99.Pos + 3);
    local v103 = v100 + v101 * 256 + v102 * 16777216;
    if v103 % 2 == 0 then
        return v103 // 2;
    else
        return -((v103 + 1) // 2);
    end;
end;
local function v108(v105, v106) --[[ Line: 232 ]] --[[ Name: pushi8 ]]
    local v107 = if v106 >= 0 then v106 * 2 else -v106 * 2 - 1;
    buffer.writeu32(v105.Buf, v105.Pos, v107);
    buffer.writeu32(v105.Buf, v105.Pos + 4, v107 // 4294967296);
    v105.Pos = v105.Pos + 8;
end;
local function v111(v109) --[[ Line: 239 ]] --[[ Name: popi8 ]]
    v109.Pos = v109.Pos - 8;
    local v110 = buffer.readu32(v109.Buf, v109.Pos) + buffer.readu32(v109.Buf, v109.Pos + 4) * 4294967296;
    if v110 % 2 == 0 then
        return v110 // 2;
    else
        return -((v110 + 1) // 2);
    end;
end;
local function v114(v112, v113) --[[ Line: 247 ]] --[[ Name: pushf4 ]]
    buffer.writef32(v112.Buf, v112.Pos, v113);
    v112.Pos = v112.Pos + 4;
end;
local function v116(v115) --[[ Line: 252 ]] --[[ Name: popf4 ]]
    v115.Pos = v115.Pos - 4;
    return (buffer.readf32(v115.Buf, v115.Pos));
end;
local function v119(v117, v118) --[[ Line: 257 ]] --[[ Name: pushf8 ]]
    buffer.writef64(v117.Buf, v117.Pos, v118);
    v117.Pos = v117.Pos + 8;
end;
local function v121(v120) --[[ Line: 262 ]] --[[ Name: popf8 ]]
    v120.Pos = v120.Pos - 8;
    return (buffer.readf64(v120.Buf, v120.Pos));
end;
local function _(v122, v123, v124, v125, v126, v127, v128, v129, v130) --[[ Line: 267 ]] --[[ Name: pushbool ]]
    local v131 = (v123 and 1 or 0) + (v124 and 2 or 0) + (v125 and 4 or 0) + (v126 and 8 or 0) + (v127 and 16 or 0) + (v128 and 32 or 0) + (v129 and 64 or 0) + (v130 and 128 or 0);
    buffer.writeu8(v122.Buf, v122.Pos, v131);
    v122.Pos = v122.Pos + 1;
end;
local function v135(v133) --[[ Line: 291 ]] --[[ Name: popbool ]]
    v133.Pos = v133.Pos - 1;
    local v134 = buffer.readu8(v133.Buf, v133.Pos);
    return v134 % 2 >= 1, v134 % 4 >= 2, v134 % 8 >= 4, v134 % 16 >= 8, v134 % 32 >= 16, v134 % 64 >= 32, v134 % 128 >= 64, v134 % 256 >= 128;
end;
local v136 = nil;
local v137 = nil;
v136 = function(v138, v139) --[[ Line: 302 ]] --[[ Name: pushvlqrealloc ]]
    -- upvalues: v15 (copy)
    local v140 = 1;
    if v139 >= 562949953421312 then
        v140 = 8;
    elseif v139 >= 4398046511104 then
        v140 = 7;
    elseif v139 >= 34359738368 then
        v140 = 6;
    elseif v139 >= 268435456 then
        v140 = 5;
    elseif v139 >= 2097152 then
        v140 = 4;
    elseif v139 >= 16384 then
        v140 = 3;
    elseif v139 >= 128 then
        v140 = 2;
    end;
    v15(v138, v140);
    local v141 = v139 // 4294967296;
    local v142 = v139 - v141 * 4294967296;
    local v143 = v142 % 128;
    buffer.writeu8(v138.Buf, v138.Pos, v143);
    v138.Pos = v138.Pos + 1;
    if v140 >= 2 then
        v143 = v141;
        local v144 = v143 % 128 * 33554432 + v142 // 128;
        local v145 = v143 // 128;
        local v146 = v144 % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v146);
        v138.Pos = v138.Pos + 1;
        v142 = v144;
        v141 = v145;
    end;
    if v140 >= 3 then
        v143 = v141;
        local v147 = v143 % 128 * 33554432 + v142 // 128;
        local v148 = v143 // 128;
        local v149 = v147 % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v149);
        v138.Pos = v138.Pos + 1;
        v142 = v147;
        v141 = v148;
    end;
    if v140 >= 4 then
        v143 = v141;
        local v150 = v143 % 128 * 33554432 + v142 // 128;
        local v151 = v143 // 128;
        local v152 = v150 % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v152);
        v138.Pos = v138.Pos + 1;
        v142 = v150;
        v141 = v151;
    end;
    if v140 >= 5 then
        v143 = v141;
        local v153 = v143 % 128 * 33554432 + v142 // 128;
        local v154 = v143 // 128;
        local v155 = v153 % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v155);
        v138.Pos = v138.Pos + 1;
        v142 = v153;
        v141 = v154;
    end;
    if v140 >= 6 then
        v143 = v141;
        local v156 = v143 % 128 * 33554432 + v142 // 128;
        local v157 = v143 // 128;
        local v158 = v156 % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v158);
        v138.Pos = v138.Pos + 1;
        v142 = v156;
        v141 = v157;
    end;
    if v140 >= 7 then
        v143 = v141;
        local v159 = v143 % 128 * 33554432 + v142 // 128;
        local v160 = v143 // 128;
        local v161 = v159 % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v161);
        v138.Pos = v138.Pos + 1;
        v142 = v159;
        v141 = v160;
    end;
    if v140 == 8 then
        local v162 = (v141 % 128 * 33554432 + v142 // 128) % 128 + 128;
        buffer.writeu8(v138.Buf, v138.Pos, v162);
        v138.Pos = v138.Pos + 1;
    end;
end;
v137 = function(v163) --[[ Line: 382 ]] --[[ Name: popvlq ]]
    v163.Pos = v163.Pos - 1;
    local v164 = buffer.readu8(v163.Buf, v163.Pos);
    local v165 = v164 % 128;
    if v164 < 128 then
        return v165;
    else
        v163.Pos = v163.Pos - 1;
        local v166 = buffer.readu8(v163.Buf, v163.Pos);
        local v167 = v165 * 128 + v166 % 128;
        if v166 < 128 then
            return v167;
        else
            v163.Pos = v163.Pos - 1;
            local v168 = buffer.readu8(v163.Buf, v163.Pos);
            local v169 = v167 * 128 + v168 % 128;
            if v168 < 128 then
                return v169;
            else
                v163.Pos = v163.Pos - 1;
                local v170 = buffer.readu8(v163.Buf, v163.Pos);
                local v171 = v169 * 128 + v170 % 128;
                if v170 < 128 then
                    return v171;
                else
                    v163.Pos = v163.Pos - 1;
                    local v172 = buffer.readu8(v163.Buf, v163.Pos);
                    local v173 = v171 * 128 + v172 % 128;
                    if v172 < 128 then
                        return v173;
                    else
                        v163.Pos = v163.Pos - 1;
                        local v174 = buffer.readu8(v163.Buf, v163.Pos);
                        local v175 = v173 * 128 + v174 % 128;
                        if v174 < 128 then
                            return v175;
                        else
                            v163.Pos = v163.Pos - 1;
                            local v176 = buffer.readu8(v163.Buf, v163.Pos);
                            local v177 = v175 * 128 + v176 % 128;
                            if v176 < 128 then
                                return v177;
                            else
                                v163.Pos = v163.Pos - 1;
                                local v178 = buffer.readu8(v163.Buf, v163.Pos);
                                return v177 * 128 + v178 % 128;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function _(v179, v180, v181) --[[ Line: 431 ]] --[[ Name: pushstr ]]
    -- upvalues: v136 (ref)
    local v182 = v181 or #v180;
    buffer.writestring(v179.Buf, v179.Pos, v180);
    v179.Pos = v179.Pos + v182;
    if not v181 then
        v136(v179, v182);
    end;
end;
local function v187(v184, v185) --[[ Line: 441 ]] --[[ Name: popstr ]]
    -- upvalues: v137 (ref)
    local v186 = v185 or v137(v184);
    v184.Pos = v184.Pos - v186;
    return buffer.readstring(v184.Buf, v184.Pos, v186);
end;
local function _(v188, v189, v190) --[[ Line: 447 ]] --[[ Name: pushbuf ]]
    -- upvalues: v136 (ref)
    local v191 = v190 or buffer.len(v189);
    buffer.copy(v188.Buf, v188.Pos, v189, 0, v191);
    v188.Pos = v188.Pos + v191;
    if not v190 then
        v136(v188, v191);
    end;
end;
local function v197(v193, v194) --[[ Line: 457 ]] --[[ Name: popbuf ]]
    -- upvalues: v137 (ref)
    local v195 = v194 or v137(v193);
    v193.Pos = v193.Pos - v195;
    local v196 = buffer.create(v195);
    buffer.copy(v196, 0, v193.Buf, v193.Pos, v195);
    return v196;
end;
local v205 = {
    print = function(v198) --[[ Line: 465 ]] --[[ Name: printcursor ]]
        local v199 = {
            string.byte(buffer.tostring(v198.Buf), 1, -1)
        };
        local v200 = 7;
        for v201 = 1, v198.Pos do
            local v202 = v199[v201];
            v200 = v200 + ((v202 == 0 and 1 or math.ceil((math.log10(1 + v202)))) + 1);
        end;
        local v203 = v199[v198.Pos + 1];
        if v203 then
            v200 = v200 + (v203 == 0 and 1 or math.ceil((math.log10(1 + v203)))) // 2;
        end;
        if #v199 == 0 or v198.Pos == buffer.len(v198.Buf) then
            table.insert(v199, " ");
        end;
        print((("Pos: %* / %*\nBuf: { %* }\n%*^"):format(v198.Pos, buffer.len(v198.Buf), table.concat(v199, " "), (string.rep(" ", v200)))));
    end, 
    cursor = v2, 
    frombuffer = v4, 
    tobuffer = v7, 
    tryrealloc = v15, 
    T = function(v204) --[[ Line: 500 ]] --[[ Name: T ]]
        return v204;
    end
};
local v206 = nil;
v206 = {
    ser = function(v207, v208, v209, v210, v211, v212, v213, v214, v215) --[[ Line: 507 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v207, 1);
        local v216 = (v208 and 1 or 0) + (v209 and 2 or 0) + (v210 and 4 or 0) + (v211 and 8 or 0) + (v212 and 16 or 0) + (v213 and 32 or 0) + (v214 and 64 or 0) + (v215 and 128 or 0);
        buffer.writeu8(v207.Buf, v207.Pos, v216);
        v207.Pos = v207.Pos + 1;
    end, 
    des = v135
};
v205.boolean = function() --[[ Line: 513 ]] --[[ Name: boolean ]]
    -- upvalues: v206 (ref)
    return v206;
end;
local v217 = {};
local l_v217_0 = v217 --[[ copy: 51 -> 64 ]];
v205.uint = function(v219) --[[ Line: 520 ]] --[[ Name: uint ]]
    -- upvalues: l_v217_0 (copy), v18 (copy), v20 (copy), v23 (copy), v25 (copy), v28 (copy), v30 (copy), v33 (copy), v35 (copy), v38 (copy), v40 (copy), v43 (copy), v45 (copy), v48 (copy), v53 (copy), v56 (copy), v58 (copy), v15 (copy)
    if l_v217_0[v219] then
        return l_v217_0[v219];
    else
        local v220 = nil;
        local v221 = nil;
        if v219 == 1 then
            v220 = v18;
            v221 = v20;
        elseif v219 == 2 then
            v220 = v23;
            v221 = v25;
        elseif v219 == 3 then
            v220 = v28;
            v221 = v30;
        elseif v219 == 4 then
            v220 = v33;
            v221 = v35;
        elseif v219 == 5 then
            v220 = v38;
            v221 = v40;
        elseif v219 == 6 then
            v220 = v43;
            v221 = v45;
        elseif v219 == 7 then
            v220 = v48;
            v221 = v53;
        elseif v219 == 8 then
            v220 = v56;
            v221 = v58;
        else
            error((("uint bytes must be integer between [1, 8], got %*"):format(v219)));
        end;
        local v224 = {
            ser = function(v222, v223) --[[ Line: 547 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v219 (copy), v220 (ref)
                v15(v222, v219);
                v220(v222, v223);
            end, 
            des = v221
        };
        l_v217_0[v219] = v224;
        return v224;
    end;
end;
v217 = {};
local l_v217_1 = v217 --[[ copy: 51 -> 65 ]];
v205.int = function(v226) --[[ Line: 560 ]] --[[ Name: int ]]
    -- upvalues: l_v217_1 (copy), v61 (copy), v63 (copy), v66 (copy), v68 (copy), v72 (copy), v75 (copy), v78 (copy), v80 (copy), v84 (copy), v87 (copy), v91 (copy), v94 (copy), v98 (copy), v104 (copy), v108 (copy), v111 (copy), v15 (copy)
    if l_v217_1[v226] then
        return l_v217_1[v226];
    else
        local v227 = nil;
        local v228 = nil;
        if v226 == 1 then
            v227 = v61;
            v228 = v63;
        elseif v226 == 2 then
            v227 = v66;
            v228 = v68;
        elseif v226 == 3 then
            v227 = v72;
            v228 = v75;
        elseif v226 == 4 then
            v227 = v78;
            v228 = v80;
        elseif v226 == 5 then
            v227 = v84;
            v228 = v87;
        elseif v226 == 6 then
            v227 = v91;
            v228 = v94;
        elseif v226 == 7 then
            v227 = v98;
            v228 = v104;
        elseif v226 == 8 then
            v227 = v108;
            v228 = v111;
        else
            error((("int bytes must be integer between [1, 8], got %*"):format(v226)));
        end;
        local v231 = {
            ser = function(v229, v230) --[[ Line: 587 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v226 (copy), v227 (ref)
                v15(v229, v226);
                v227(v229, v230);
            end, 
            des = v228
        };
        l_v217_1[v226] = v231;
        return v231;
    end;
end;
v217 = {};
local l_v217_2 = v217 --[[ copy: 51 -> 66 ]];
v205.number = function(v233) --[[ Line: 600 ]] --[[ Name: number ]]
    -- upvalues: l_v217_2 (copy), v114 (copy), v116 (copy), v119 (copy), v121 (copy), v15 (copy)
    if l_v217_2[v233] then
        return l_v217_2[v233];
    else
        local v234 = nil;
        local v235 = nil;
        if v233 == 4 then
            v234 = v114;
            v235 = v116;
        elseif v233 == 8 then
            v234 = v119;
            v235 = v121;
        else
            error((("number bytes must be integer 4 or 8, got %*"):format(v233)));
        end;
        local v238 = {
            ser = function(v236, v237) --[[ Line: 615 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v233 (copy), v234 (ref)
                v15(v236, v233);
                v234(v236, v237);
            end, 
            des = v235
        };
        l_v217_2[v233] = v238;
        return v238;
    end;
end;
v217 = {};
local l_v217_3 = v217 --[[ copy: 51 -> 67 ]];
v205.range = function(v240, v241) --[[ Line: 629 ]] --[[ Name: range ]]
    -- upvalues: l_v217_3 (copy), v18 (copy), v20 (copy), v23 (copy), v25 (copy), v28 (copy), v30 (copy), v33 (copy), v35 (copy), v38 (copy), v40 (copy), v43 (copy), v45 (copy), v48 (copy), v53 (copy), v56 (copy), v58 (copy), v15 (copy)
    local v242 = ("%*_%*"):format(v240, v241);
    local v243 = l_v217_3[v242];
    if v243 then
        return v243;
    else
        local v244 = false;
        if v240 == v240 // 1 then
            v244 = false;
            if v241 == v241 // 1 then
                v244 = v240 < v241;
            end;
        end;
        assert(v244, "min and max must be integers, and min < max");
        local v245 = nil;
        v244 = nil;
        local v246 = nil;
        local v247 = v241 - v240;
        if v247 < 256 then
            v245 = v18;
            v244 = v20;
            v246 = 1;
        elseif v247 < 65536 then
            v245 = v23;
            v244 = v25;
            v246 = 2;
        elseif v247 < 16777216 then
            v245 = v28;
            v244 = v30;
            v246 = 3;
        elseif v247 < 4294967296 then
            v245 = v33;
            v244 = v35;
            v246 = 4;
        elseif v247 < 1099511627776 then
            v245 = v38;
            v244 = v40;
            v246 = 5;
        elseif v247 < 281474976710656 then
            v245 = v43;
            v244 = v45;
            v246 = 6;
        elseif v247 < 7.205759403792794E16 then
            v245 = v48;
            v244 = v53;
            v246 = 7;
        else
            v245 = v56;
            v244 = v58;
            v246 = 8;
        end;
        local v251 = {
            ser = function(v248, v249) --[[ Line: 658 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v246 (ref), v245 (ref), v240 (copy)
                v15(v248, v246);
                v245(v248, v249 - v240);
            end, 
            des = function(v250) --[[ Line: 662 ]] --[[ Name: des ]]
                -- upvalues: v244 (ref), v240 (copy)
                return v244(v250) + v240;
            end
        };
        l_v217_3[v242] = v251;
        return v251;
    end;
end;
v217 = {
    ser = function(v252, v253) --[[ Line: 674 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref)
        local v254 = #v253;
        v15(v252, v254);
        local v255 = #v253;
        buffer.writestring(v252.Buf, v252.Pos, v253);
        v252.Pos = v252.Pos + v255;
        v136(v252, v255);
    end, 
    des = v187
};
local v256 = {};
local l_v217_4 = v217 --[[ copy: 51 -> 68 ]];
local l_v256_0 = v256 --[[ copy: 52 -> 69 ]];
local v267 = {
    __call = function(_, v260) --[[ Line: 683 ]] --[[ Name: __call ]]
        -- upvalues: l_v217_4 (copy), l_v256_0 (copy), v15 (copy), v136 (ref), v187 (copy)
        if not v260 then
            return l_v217_4;
        elseif l_v256_0[v260] then
            return l_v256_0[v260];
        else
            local v266 = {
                ser = function(v261, v262) --[[ Line: 693 ]] --[[ Name: ser ]]
                    -- upvalues: v15 (ref), v260 (copy), v136 (ref)
                    v15(v261, v260);
                    local l_v260_0 = v260;
                    local v264 = l_v260_0 or #v262;
                    buffer.writestring(v261.Buf, v261.Pos, v262);
                    v261.Pos = v261.Pos + v264;
                    if not l_v260_0 then
                        v136(v261, v264);
                    end;
                end, 
                des = function(v265) --[[ Line: 698 ]] --[[ Name: des ]]
                    -- upvalues: v187 (ref), v260 (copy)
                    return v187(v265, v260);
                end
            };
            l_v256_0[v260] = v266;
            return v266;
        end;
    end
};
local v288 = {
    convert = function(v268, v269, v270) --[[ Line: 707 ]] --[[ Name: convert ]]
        local v271 = {};
        for v272 = 1, #v269 do
            v271[string.byte(v269, v272)] = v272 - 1;
        end;
        local v273 = {};
        for v274 = 1, #v270 do
            v273[v274 - 1] = string.byte(v270, v274);
        end;
        local v275 = {};
        for v276 = 1, #v268 do
            table.insert(v275, v271[string.byte(v268, v276)]);
        end;
        local v277 = {};
        local v278 = #v269;
        local v279 = #v270;
        local v280 = nil;
        local v281 = nil;
        while #v275 > 0 do
            v280 = 0;
            for v282 = 1, #v275 do
                v281 = v275[v282] + v280 * v278;
                v275[v282] = math.floor(v281 / v279);
                v280 = v281 % v279;
            end;
            while #v275 > 0 and v275[1] == 0 do
                table.remove(v275, 1);
            end;
            table.insert(v277, 1, (string.char(v273[v280])));
        end;
        return table.concat(v277);
    end, 
    alphabet = function(v283) --[[ Line: 745 ]] --[[ Name: alphabet ]]
        local v284 = {};
        local v285 = table.create(#v283);
        for v286 = 1, #v283 do
            local v287 = string.sub(v283, v286, v286);
            if not v284[v287] then
                v284[v287] = true;
                table.insert(v285, v287);
            end;
        end;
        table.sort(v285);
        return table.concat(v285);
    end, 
    binary = "01", 
    octal = "01234567", 
    decimal = "0123456789", 
    duodecimal = "0123456789AB", 
    hexadecimal = "0123456789ABCDEF"
};
local v289 = table.create(256);
for v290 = 0, 255 do
    v289[v290 + 1] = string.char(v290);
end;
v288.utf8 = table.concat(v289);
v288.lower = "abcdefghijklmnopqrstuvwxyz";
v288.upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
v288.letters = v288.lower .. v288.upper;
v288.punctuation = " .,?!:;'\"-_";
v288.english = v288.letters .. v288.punctuation;
v288.filepath = v288.letters .. ":/";
v288.datastore = " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~";
v205.string = setmetatable(v288, v267);
v217 = nil;
v217 = {};
v256 = {};
local l_v256_1 = v256 --[[ copy: 52 -> 70 ]];
v205.opt = function(v292) --[[ Line: 784 ]] --[[ Name: opt ]]
    -- upvalues: l_v256_1 (copy), v15 (copy), v217 (ref)
    if l_v256_1[v292] then
        return l_v256_1[v292];
    else
        local v296 = {
            ser = function(v293, v294) --[[ Line: 790 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v292 (copy)
                if v294 == nil then
                    v15(v293, 1);
                    buffer.writeu8(v293.Buf, v293.Pos, 0);
                    v293.Pos = v293.Pos + 1;
                    return;
                else
                    v292.ser(v293, v294);
                    v15(v293, 1);
                    buffer.writeu8(v293.Buf, v293.Pos, 1);
                    v293.Pos = v293.Pos + 1;
                    return;
                end;
            end, 
            des = function(v295) --[[ Line: 801 ]] --[[ Name: des ]]
                -- upvalues: v292 (copy)
                v295.Pos = v295.Pos - 1;
                if buffer.readu8(v295.Buf, v295.Pos) == 1 then
                    return v292.des(v295);
                else
                    return nil;
                end;
            end
        };
        l_v256_1[v292] = v296;
        v217[v296] = v292;
        return v296;
    end;
end;
v256 = {
    ser = function(v297, v298) --[[ Line: 817 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref)
        v15(v297, buffer.len(v298));
        local v299 = buffer.len(v298);
        buffer.copy(v297.Buf, v297.Pos, v298, 0, v299);
        v297.Pos = v297.Pos + v299;
        v136(v297, v299);
    end, 
    des = v197
};
v267 = {};
local l_v256_2 = v256 --[[ copy: 52 -> 71 ]];
local l_v267_0 = v267 --[[ copy: 53 -> 72 ]];
v205.buffer = function(v302) --[[ Line: 824 ]] --[[ Name: buffer ]]
    -- upvalues: l_v256_2 (copy), l_v267_0 (copy), v15 (copy), v136 (ref), v137 (ref)
    if not v302 then
        return l_v256_2;
    elseif l_v267_0[v302] then
        return l_v267_0[v302];
    else
        local v310 = {
            ser = function(v303, v304) --[[ Line: 834 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v302 (copy), v136 (ref)
                v15(v303, v302);
                local l_v302_0 = v302;
                local v306 = l_v302_0 or buffer.len(v304);
                buffer.copy(v303.Buf, v303.Pos, v304, 0, v306);
                v303.Pos = v303.Pos + v306;
                if not l_v302_0 then
                    v136(v303, v306);
                end;
            end, 
            des = function(v307) --[[ Line: 839 ]] --[[ Name: des ]]
                -- upvalues: v302 (copy), v137 (ref)
                local v308 = v302 or v137(v307);
                v307.Pos = v307.Pos - v308;
                local v309 = buffer.create(v308);
                buffer.copy(v309, 0, v307.Buf, v307.Pos, v308);
                return v309;
            end
        };
        l_v267_0[v302] = v310;
        return v310;
    end;
end;
v256 = {
    ser = v136, 
    des = v137
};
local l_v256_3 = v256 --[[ copy: 52 -> 73 ]];
v205.vlq = function() --[[ Line: 853 ]] --[[ Name: vlq ]]
    -- upvalues: l_v256_3 (copy)
    return l_v256_3;
end;
v256 = function(v312, v313, v314) --[[ Line: 860 ]] --[[ Name: serbitarr ]]
    local v315 = v314 or #v313;
    if v315 == 0 then
        return;
    else
        local v316 = v315 % 8;
        local v317 = v315 - v316;
        for v318 = 0, v317 - 1, 8 do
            local v319 = v313[v318 + 1];
            local v320 = v313[v318 + 2];
            local v321 = v313[v318 + 3];
            local v322 = v313[v318 + 4];
            local v323 = v313[v318 + 5];
            local v324 = v313[v318 + 6];
            local v325 = v313[v318 + 7];
            local v326 = v313[v318 + 8];
            local v327 = (v319 and 1 or 0) + (v320 and 2 or 0) + (v321 and 4 or 0) + (v322 and 8 or 0) + (v323 and 16 or 0) + (v324 and 32 or 0) + (v325 and 64 or 0) + (v326 and 128 or 0);
            buffer.writeu8(v312.Buf, v312.Pos, v327);
            v312.Pos = v312.Pos + 1;
        end;
        if v316 == 1 then
            local v328 = (v313[v317 + 1] and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
            buffer.writeu8(v312.Buf, v312.Pos, v328);
            v312.Pos = v312.Pos + 1;
            return;
        elseif v316 == 2 then
            local v329 = v313[v317 + 1];
            local v330 = v313[v317 + 2];
            local v331 = (v329 and 1 or 0) + (v330 and 2 or 0) + 0 + 0 + 0 + 0 + 0 + 0;
            buffer.writeu8(v312.Buf, v312.Pos, v331);
            v312.Pos = v312.Pos + 1;
            return;
        elseif v316 == 3 then
            local v332 = v313[v317 + 1];
            local v333 = v313[v317 + 2];
            local v334 = v313[v317 + 3];
            local v335 = (v332 and 1 or 0) + (v333 and 2 or 0) + (v334 and 4 or 0) + 0 + 0 + 0 + 0 + 0;
            buffer.writeu8(v312.Buf, v312.Pos, v335);
            v312.Pos = v312.Pos + 1;
            return;
        elseif v316 == 4 then
            local v336 = v313[v317 + 1];
            local v337 = v313[v317 + 2];
            local v338 = v313[v317 + 3];
            local v339 = v313[v317 + 4];
            local v340 = (v336 and 1 or 0) + (v337 and 2 or 0) + (v338 and 4 or 0) + (v339 and 8 or 0) + 0 + 0 + 0 + 0;
            buffer.writeu8(v312.Buf, v312.Pos, v340);
            v312.Pos = v312.Pos + 1;
            return;
        elseif v316 == 5 then
            local v341 = v313[v317 + 1];
            local v342 = v313[v317 + 2];
            local v343 = v313[v317 + 3];
            local v344 = v313[v317 + 4];
            local v345 = v313[v317 + 5];
            local v346 = (v341 and 1 or 0) + (v342 and 2 or 0) + (v343 and 4 or 0) + (v344 and 8 or 0) + (v345 and 16 or 0) + 0 + 0 + 0;
            buffer.writeu8(v312.Buf, v312.Pos, v346);
            v312.Pos = v312.Pos + 1;
            return;
        elseif v316 == 6 then
            local v347 = v313[v317 + 1];
            local v348 = v313[v317 + 2];
            local v349 = v313[v317 + 3];
            local v350 = v313[v317 + 4];
            local v351 = v313[v317 + 5];
            local v352 = v313[v317 + 6];
            local v353 = (v347 and 1 or 0) + (v348 and 2 or 0) + (v349 and 4 or 0) + (v350 and 8 or 0) + (v351 and 16 or 0) + (v352 and 32 or 0) + 0 + 0;
            buffer.writeu8(v312.Buf, v312.Pos, v353);
            v312.Pos = v312.Pos + 1;
            return;
        else
            if v316 == 7 then
                local v354 = v313[v317 + 1];
                local v355 = v313[v317 + 2];
                local v356 = v313[v317 + 3];
                local v357 = v313[v317 + 4];
                local v358 = v313[v317 + 5];
                local v359 = v313[v317 + 6];
                local v360 = v313[v317 + 7];
                local v361 = (v354 and 1 or 0) + (v355 and 2 or 0) + (v356 and 4 or 0) + (v357 and 8 or 0) + (v358 and 16 or 0) + (v359 and 32 or 0) + (v360 and 64 or 0) + 0;
                buffer.writeu8(v312.Buf, v312.Pos, v361);
                v312.Pos = v312.Pos + 1;
            end;
            return;
        end;
    end;
end;
v267 = function(v362, v363) --[[ Line: 892 ]] --[[ Name: desbitarr ]]
    if v363 == 0 then
        return {};
    else
        local v364 = table.create(v363);
        local v365 = v363 // 8;
        local v366 = v365 * 8;
        local v367 = v363 % 8;
        if v367 > 0 then
            v362.Pos = v362.Pos - 1;
            local v368 = buffer.readu8(v362.Buf, v362.Pos);
            local v369 = v368 % 2 >= 1;
            local v370 = v368 % 4 >= 2;
            local v371 = v368 % 8 >= 4;
            local v372 = v368 % 16 >= 8;
            local v373 = v368 % 32 >= 16;
            local v374 = v368 % 64 >= 32;
            local v375 = v368 % 128 >= 64;
            local _ = v368 % 256 >= 128;
            v364[v366 + 1] = v369;
            v364[v366 + 2] = if v367 > 1 then v370 else nil;
            v364[v366 + 3] = if v367 > 2 then v371 else nil;
            v364[v366 + 4] = if v367 > 3 then v372 else nil;
            v364[v366 + 5] = if v367 > 4 then v373 else nil;
            v364[v366 + 6] = if v367 > 5 then v374 else nil;
            v364[v366 + 7] = if v367 > 6 then v375 else nil;
        end;
        for v377 = v365 - 1, 0, -1 do
            local v378 = v377 * 8;
            local v379 = v378 + 1;
            local v380 = v378 + 2;
            local v381 = v378 + 3;
            local v382 = v378 + 4;
            local v383 = v378 + 5;
            local v384 = v378 + 6;
            local v385 = v378 + 7;
            local v386 = v378 + 8;
            v362.Pos = v362.Pos - 1;
            local v387 = buffer.readu8(v362.Buf, v362.Pos);
            local v388 = v387 % 2 >= 1;
            local v389 = v387 % 4 >= 2;
            local v390 = v387 % 8 >= 4;
            local v391 = v387 % 16 >= 8;
            local v392 = v387 % 32 >= 16;
            local v393 = v387 % 64 >= 32;
            local v394 = v387 % 128 >= 64;
            local v395 = v387 % 256 >= 128;
            v364[v379] = v388;
            v364[v380] = v389;
            v364[v381] = v390;
            v364[v382] = v391;
            v364[v383] = v392;
            v364[v384] = v393;
            v364[v385] = v394;
            v364[v386] = v395;
        end;
        return v364;
    end;
end;
v288 = {};
local l_v288_0 = v288 --[[ copy: 54 -> 74 ]];
v205.array = function(v397, v398) --[[ Line: 924 ]] --[[ Name: array ]]
    -- upvalues: l_v288_0 (copy), v206 (ref), v256 (copy), v136 (ref), v137 (ref), v267 (copy), v217 (ref), v15 (copy)
    local v399 = l_v288_0[v397];
    local v400 = v398 or 0;
    if v399 then
        if v399[v400] then
            return v399[v400];
        end;
    else
        v399 = {};
        l_v288_0[v397] = v399;
    end;
    if v397 == v206 then
        local v406 = {
            ser = function(v401, v402) --[[ Line: 938 ]] --[[ Name: ser ]]
                -- upvalues: v398 (copy), v256 (ref), v136 (ref)
                local v403 = if type(v398) == "number" then v398 else #v402;
                v256(v401, v402, v403);
                if not v398 then
                    v136(v401, v403);
                    return;
                else
                    if type(v398) ~= "number" then
                        v398.ser(v401, v403);
                    end;
                    return;
                end;
            end, 
            des = function(v404) --[[ Line: 947 ]] --[[ Name: des ]]
                -- upvalues: v398 (copy), v137 (ref), v267 (ref)
                local v405 = if not v398 then v137(v404) else if type(v398) == "number" then v398 else v398.des(v404);
                return (v267(v404, v405));
            end
        };
        v399[v400] = v406;
        return v406;
    elseif v217[v397] then
        local v407 = v217[v397];
        if v407 == v206 then
            local v428 = {
                ser = function(v408, v409) --[[ Line: 958 ]] --[[ Name: ser ]]
                    -- upvalues: v398 (copy), v15 (ref), v256 (ref), v136 (ref)
                    local v410 = if type(v398) == "number" then v398 else table.maxn(v409);
                    local v411 = table.create(v410);
                    local v412 = table.create(v410);
                    for v413 = 1, v410 do
                        local v414 = v409[v413];
                        if v414 ~= nil then
                            table.insert(v411, v414);
                            v412[v413] = true;
                        else
                            v412[v413] = false;
                        end;
                    end;
                    local v415 = #v411 // 8 + 1;
                    local v416 = 1 + v410 // 8;
                    v15(v408, v415 + v416);
                    v256(v408, v411);
                    v256(v408, v412);
                    if not v398 then
                        v136(v408, v410);
                        return;
                    else
                        if type(v398) ~= "number" then
                            v398.ser(v408, v410);
                        end;
                        return;
                    end;
                end, 
                des = function(v417) --[[ Line: 983 ]] --[[ Name: des ]]
                    -- upvalues: v398 (copy), v137 (ref), v267 (ref)
                    local v418 = if not v398 then v137(v417) else if type(v398) == "number" then v398 else v398.des(v417);
                    local v419 = v267(v417, v418);
                    local v420 = 0;
                    for _, v422 in v419 do
                        v420 = v420 + (v422 and 1 or 0);
                    end;
                    local v423 = v267(v417, v420);
                    local v424 = table.create(v418);
                    local v425 = 1;
                    for v426, v427 in v419 do
                        if v427 then
                            v424[v426] = v423[v425];
                            v425 = v425 + 1;
                        end;
                    end;
                    return v424;
                end
            };
            v399[v400] = v428;
            return v428;
        else
            local v443 = {
                ser = function(v429, v430) --[[ Line: 1008 ]] --[[ Name: ser ]]
                    -- upvalues: v407 (copy), v398 (copy), v15 (ref), v256 (ref), v136 (ref)
                    local l_ser_0 = v407.ser;
                    local v432 = if type(v398) == "number" then v398 else table.maxn(v430);
                    local v433 = table.create(v432);
                    for v434 = 1, v432 do
                        local v435 = v430[v434];
                        if v435 ~= nil then
                            l_ser_0(v429, v435);
                            v433[v434] = true;
                        else
                            v433[v434] = false;
                        end;
                    end;
                    local v436 = 1 + v432 // 8;
                    v15(v429, v436);
                    v256(v429, v433);
                    if not v398 then
                        v136(v429, v432);
                        return;
                    else
                        if type(v398) ~= "number" then
                            v398.ser(v429, v432);
                        end;
                        return;
                    end;
                end, 
                des = function(v437) --[[ Line: 1031 ]] --[[ Name: des ]]
                    -- upvalues: v407 (copy), v398 (copy), v137 (ref), v267 (ref)
                    local l_des_0 = v407.des;
                    local v439 = if not v398 then v137(v437) else if type(v398) == "number" then v398 else v398.des(v437);
                    local v440 = v267(v437, v439);
                    local v441 = table.create(v439);
                    for v442 = v439, 1, -1 do
                        if v440[v442] then
                            v441[v442] = l_des_0(v437);
                        end;
                    end;
                    return v441;
                end
            };
            v399[v400] = v443;
            return v443;
        end;
    else
        local v454 = {
            ser = function(v444, v445) --[[ Line: 1051 ]] --[[ Name: ser ]]
                -- upvalues: v397 (copy), v398 (copy), v136 (ref)
                local l_ser_1 = v397.ser;
                local v447 = if type(v398) == "number" then v398 else #v445;
                for v448 = 1, v447 do
                    l_ser_1(v444, v445[v448]);
                end;
                if not v398 then
                    v136(v444, v447);
                    return;
                else
                    if type(v398) ~= "number" then
                        v398.ser(v444, v447);
                    end;
                    return;
                end;
            end, 
            des = function(v449) --[[ Line: 1064 ]] --[[ Name: des ]]
                -- upvalues: v397 (copy), v398 (copy), v137 (ref)
                local l_des_1 = v397.des;
                local v451 = if not v398 then v137(v449) else if type(v398) == "number" then v398 else v398.des(v449);
                local v452 = table.create(v451);
                for v453 = v451, 1, -1 do
                    v452[v453] = l_des_1(v449);
                end;
                return v452;
            end
        };
        v399[v400] = v454;
        return v454;
    end;
end;
v205.tuple = function(...) --[[ Line: 1082 ]] --[[ Name: tuple ]]
    local v455 = {
        ...
    };
    local v456 = #v455;
    if v456 == 1 then
        return v455[1];
    else
        return {
            ser = function(v457, ...) --[[ Line: 1090 ]] --[[ Name: ser ]]
                -- upvalues: v455 (copy)
                for v458, v459 in {
                    ...
                } do
                    v455[v458].ser(v457, v459);
                end;
            end, 
            des = function(v460) --[[ Line: 1096 ]] --[[ Name: des ]]
                -- upvalues: v456 (copy), v455 (copy)
                local v461 = table.create(v456);
                for v462 = v456, 1, -1 do
                    v461[v462] = v455[v462].des(v460);
                end;
                return table.unpack(v461);
            end
        };
    end;
end;
v205.record = function(v463) --[[ Line: 1110 ]] --[[ Name: record ]]
    -- upvalues: v217 (ref), v206 (ref), v15 (copy), v256 (copy), v267 (copy)
    local v464 = {};
    local v465 = {};
    local v466 = {};
    local v467 = {};
    for v468, v469 in v463 do
        if type(v468) == "string" then
            local v470 = v217[v469];
            if v470 == v206 then
                table.insert(v467, v468);
            elseif v470 then
                table.insert(v465, v468);
            elseif v469 == v206 then
                table.insert(v466, v468);
            else
                table.insert(v464, v468);
            end;
        end;
    end;
    local v471 = #v464;
    table.sort(v464);
    local v472 = #v466;
    if v472 > 0 then
        table.sort(v466);
    end;
    local v473 = #v465;
    local v474 = {};
    if v473 > 0 then
        table.sort(v465);
        for v475, v476 in v465 do
            v474[v475] = v217[v463[v476]];
        end;
    end;
    local v477 = #v467;
    if v477 > 0 then
        table.sort(v467);
    end;
    return {
        ser = function(v478, v479) --[[ Line: 1153 ]] --[[ Name: ser ]]
            -- upvalues: v464 (copy), v463 (copy), v472 (copy), v477 (copy), v466 (copy), v473 (copy), v467 (copy), v465 (copy), v474 (copy), v15 (ref), v256 (ref)
            for _, v481 in v464 do
                local v482 = v479[v481];
                v463[v481].ser(v478, v482);
            end;
            local v483 = table.create(v472 + v477);
            for v484, v485 in v466 do
                v483[v484] = v479[v485];
            end;
            local l_v472_0 = v472;
            local v487 = table.create(v477 + v473);
            for v488, v489 in v467 do
                local v490 = v479[v489];
                if v490 == nil then
                    v487[v488] = false;
                else
                    l_v472_0 = l_v472_0 + 1;
                    v483[l_v472_0] = v490;
                    v487[v488] = true;
                end;
            end;
            for v491, v492 in v465 do
                local v493 = v491 + v477;
                local v494 = v479[v492];
                if v494 == nil then
                    v487[v493] = false;
                else
                    v474[v491].ser(v478, v494);
                    v487[v493] = true;
                end;
            end;
            v15(v478, l_v472_0 + v477 + v473);
            v256(v478, v483, l_v472_0);
            v256(v478, v487, v477 + v473);
        end, 
        des = function(v495) --[[ Line: 1195 ]] --[[ Name: des ]]
            -- upvalues: v267 (ref), v477 (copy), v473 (copy), v472 (copy), v466 (copy), v467 (copy), v465 (copy), v463 (copy), v474 (copy), v471 (copy), v464 (copy)
            local v496 = {};
            local v497 = v267(v495, v477 + v473);
            local l_v472_1 = v472;
            for v499 = 1, v477 do
                l_v472_1 = l_v472_1 + (v497[v499] and 1 or 0);
            end;
            local v500 = v267(v495, l_v472_1);
            for v501, v502 in v466 do
                v496[v502] = v500[v501];
            end;
            local l_l_v472_1_0 = l_v472_1;
            for v504 = v477, 1, -1 do
                if v497[v504] then
                    v496[v467[v504]] = v500[l_l_v472_1_0];
                    l_l_v472_1_0 = l_l_v472_1_0 - 1;
                end;
            end;
            for v505 = v473, 1, -1 do
                if v497[v505 + v477] then
                    local v506 = v465[v505];
                    local _ = v463[v506];
                    v496[v506] = v474[v505].des(v495);
                end;
            end;
            for v508 = v471, 1, -1 do
                local v509 = v464[v508];
                v496[v509] = v463[v509].des(v495);
            end;
            return v496;
        end
    };
end;
v205.map = function(v510, v511, v512) --[[ Line: 1243 ]] --[[ Name: map ]]
    -- upvalues: v136 (ref), v137 (ref)
    return {
        ser = function(v513, v514) --[[ Line: 1245 ]] --[[ Name: ser ]]
            -- upvalues: v511 (copy), v510 (copy), v512 (copy), v136 (ref)
            local v515 = 0;
            for v516, v517 in v514 do
                v511.ser(v513, v517);
                v510.ser(v513, v516);
                v515 = v515 + 1;
            end;
            if not v512 then
                v136(v513, v515);
                return;
            else
                if type(v512) ~= "number" then
                    v512.ser(v513, v515);
                end;
                return;
            end;
        end, 
        des = function(v518) --[[ Line: 1259 ]] --[[ Name: des ]]
            -- upvalues: v512 (copy), v137 (ref), v510 (copy), v511 (copy)
            local v519 = {};
            local v520 = if not v512 then v137(v518) else if type(v512) == "number" then v512 else v512.des(v518);
            for _ = 1, v520 do
                v519[v510.des(v518)] = v511.des(v518);
            end;
            return v519;
        end
    };
end;
v205.literal = function(...) --[[ Line: 1277 ]] --[[ Name: literal ]]
    -- upvalues: v15 (copy)
    local v522 = {
        ...
    };
    local v523 = {};
    for v524, v525 in v522 do
        v523[v525] = v524 - 1;
    end;
    return {
        ser = function(v526, v527) --[[ Line: 1286 ]] --[[ Name: ser ]]
            -- upvalues: v15 (ref), v523 (copy)
            v15(v526, 1);
            local v528 = v523[v527];
            buffer.writeu8(v526.Buf, v526.Pos, v528);
            v526.Pos = v526.Pos + 1;
        end, 
        des = function(v529) --[[ Line: 1291 ]] --[[ Name: des ]]
            -- upvalues: v522 (copy)
            local l_v522_0 = v522;
            v529.Pos = v529.Pos - 1;
            return l_v522_0[buffer.readu8(v529.Buf, v529.Pos) + 1];
        end
    };
end;
v205.table = function(v531, v532) --[[ Line: 1299 ]] --[[ Name: table ]]
    -- upvalues: v15 (copy), v136 (ref), v137 (ref)
    local v533 = {};
    local v534 = {};
    for v535 in v531 do
        local v536 = #v533 + 1;
        v533[v536] = v535;
        v534[v535] = v536;
    end;
    return {
        ser = function(v537, v538) --[[ Line: 1310 ]] --[[ Name: ser ]]
            -- upvalues: v531 (copy), v534 (copy), v15 (ref), v532 (copy), v136 (ref)
            local v539 = 0;
            for v540, v541 in v538 do
                local v542 = typeof(v541);
                local v543 = v531[v542];
                if v543 then
                    local v544 = typeof(v540);
                    local v545 = v531[v544];
                    if v545 then
                        v543.ser(v537, v541);
                        local v546 = v534[v542] or error("");
                        v15(v537, 1);
                        local v547 = v546 - 1;
                        buffer.writeu8(v537.Buf, v537.Pos, v547);
                        v537.Pos = v537.Pos + 1;
                        v545.ser(v537, v540);
                        v547 = v534[v544] or error("");
                        v15(v537, 1);
                        local v548 = v547 - 1;
                        buffer.writeu8(v537.Buf, v537.Pos, v548);
                        v537.Pos = v537.Pos + 1;
                        v539 = v539 + 1;
                    end;
                end;
            end;
            if not v532 then
                v136(v537, v539);
                return;
            else
                if type(v532) ~= "number" then
                    v532.ser(v537, v539);
                end;
                return;
            end;
        end, 
        des = function(v549) --[[ Line: 1345 ]] --[[ Name: des ]]
            -- upvalues: v532 (copy), v137 (ref), v533 (copy), v531 (copy)
            local v550 = {};
            local v551 = if not v532 then v137(v549) else if type(v532) == "number" then v532 else v532.des(v549);
            for _ = 1, v551 do
                v549.Pos = v549.Pos - 1;
                local v553 = v531[v533[buffer.readu8(v549.Buf, v549.Pos) + 1]].des(v549);
                v549.Pos = v549.Pos - 1;
                v550[v553] = v531[v533[buffer.readu8(v549.Buf, v549.Pos) + 1]].des(v549);
            end;
            return v550;
        end
    };
end;
v288 = {
    ser = function(v554, v555) --[[ Line: 1369 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v554, 2);
        local l_Back_0 = v555.Back;
        local l_Bottom_0 = v555.Bottom;
        local l_Front_0 = v555.Front;
        local l_Left_0 = v555.Left;
        local l_Right_0 = v555.Right;
        local l_Top_0 = v555.Top;
        local v562 = (l_Back_0 and 1 or 0) + (l_Bottom_0 and 2 or 0) + (l_Front_0 and 4 or 0) + (l_Left_0 and 8 or 0) + (l_Right_0 and 16 or 0) + (l_Top_0 and 32 or 0) + 0 + 0;
        buffer.writeu8(v554.Buf, v554.Pos, v562);
        v554.Pos = v554.Pos + 1;
        l_Back_0 = v555.X;
        l_Bottom_0 = v555.Y;
        l_Front_0 = v555.Z;
        l_Left_0 = (l_Back_0 and 1 or 0) + (l_Bottom_0 and 2 or 0) + (l_Front_0 and 4 or 0) + 0 + 0 + 0 + 0 + 0;
        buffer.writeu8(v554.Buf, v554.Pos, l_Left_0);
        v554.Pos = v554.Pos + 1;
    end, 
    des = function(v563) --[[ Line: 1375 ]] --[[ Name: des ]]
        v563.Pos = v563.Pos - 1;
        local v564 = buffer.readu8(v563.Buf, v563.Pos);
        local v565 = v564 % 2 >= 1;
        local v566 = v564 % 4 >= 2;
        local v567 = v564 % 8 >= 4;
        local v568 = v564 % 16 >= 8;
        v568 = v564 % 32 >= 16;
        v568 = v564 % 64 >= 32;
        v568 = v564 % 128 >= 64;
        v568 = v564 % 256 >= 128;
        v563.Pos = v563.Pos - 1;
        local v569 = buffer.readu8(v563.Buf, v563.Pos);
        v564 = v569 % 2 >= 1;
        v568 = v569 % 4 >= 2;
        local v570 = v569 % 8 >= 4;
        local v571 = v569 % 16 >= 8;
        local v572 = v569 % 32 >= 16;
        local v573 = v569 % 64 >= 32;
        local v574 = v569 % 128 >= 64;
        v574 = v569 % 256 >= 128;
        return Axes.new(v565 and Enum.Axis.X, v566 and Enum.Axis.Y, v567 and Enum.Axis.Z, v564 and Enum.NormalId.Back, v568 and Enum.NormalId.Bottom, v570 and Enum.NormalId.Front, v571 and Enum.NormalId.Left, v572 and Enum.NormalId.Right, v573 and Enum.NormalId.Top);
    end
};
local l_v288_1 = v288 --[[ copy: 54 -> 75 ]];
v205.Axes = function() --[[ Line: 1391 ]] --[[ Name: Axes ]]
    -- upvalues: l_v288_1 (copy)
    return l_v288_1;
end;
v288 = {
    ser = function(v576, v577) --[[ Line: 1398 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v576, 2);
        local l_Number_0 = v577.Number;
        buffer.writeu16(v576.Buf, v576.Pos, l_Number_0);
        v576.Pos = v576.Pos + 2;
    end, 
    des = function(v579) --[[ Line: 1403 ]] --[[ Name: des ]]
        v579.Pos = v579.Pos - 2;
        local v580 = buffer.readu16(v579.Buf, v579.Pos);
        return BrickColor.new(v580);
    end
};
local l_v288_2 = v288 --[[ copy: 54 -> 76 ]];
v205.BrickColor = function() --[[ Line: 1408 ]] --[[ Name: BrickColor ]]
    -- upvalues: l_v288_2 (copy)
    return l_v288_2;
end;
v288 = nil;
v289 = {};
local l_v289_0 = v289 --[[ copy: 55 -> 77 ]];
v205.EnumItem = function(v583) --[[ Line: 1416 ]] --[[ Name: EnumItem ]]
    -- upvalues: l_v289_0 (copy), v136 (ref), v137 (ref)
    if l_v289_0[v583] then
        return l_v289_0[v583];
    else
        local l_v583_EnumItems_0 = v583:GetEnumItems();
        table.sort(l_v583_EnumItems_0, function(v585, v586) --[[ Line: 1422 ]]
            return v585.Value < v586.Value;
        end);
        local v587 = {};
        local v588 = table.create(#l_v583_EnumItems_0);
        for v589, v590 in l_v583_EnumItems_0 do
            v587[v590] = v589;
            v588[v589] = v590;
        end;
        local v594 = {
            ser = function(v591, v592) --[[ Line: 1434 ]] --[[ Name: ser ]]
                -- upvalues: v136 (ref), v587 (copy)
                v136(v591, v587[v592]);
            end, 
            des = function(v593) --[[ Line: 1438 ]] --[[ Name: des ]]
                -- upvalues: v137 (ref), v588 (copy)
                return v588[v137(v593)];
            end
        };
        l_v289_0[v583] = v594;
        return v594;
    end;
end;
v288 = v205.EnumItem;
v289 = {
    ser = function(v595, v596) --[[ Line: 1452 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref), v288 (ref)
        v15(v595, #v596.CreatorName + 10 + #v596.SearchKeyword);
        local v597 = (v596.IncludeOffSale and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
        buffer.writeu8(v595.Buf, v595.Pos, v597);
        v595.Pos = v595.Pos + 1;
        local l_Limit_0 = v596.Limit;
        buffer.writeu8(v595.Buf, v595.Pos, l_Limit_0);
        v595.Pos = v595.Pos + 1;
        l_Limit_0 = v596.MinPrice;
        buffer.writeu32(v595.Buf, v595.Pos, l_Limit_0);
        v595.Pos = v595.Pos + 4;
        l_Limit_0 = v596.MaxPrice;
        buffer.writeu32(v595.Buf, v595.Pos, l_Limit_0);
        v595.Pos = v595.Pos + 4;
        l_Limit_0 = v596.CreatorName;
        v597 = #l_Limit_0;
        buffer.writestring(v595.Buf, v595.Pos, l_Limit_0);
        v595.Pos = v595.Pos + v597;
        v136(v595, v597);
        l_Limit_0 = v596.SearchKeyword;
        v597 = #l_Limit_0;
        buffer.writestring(v595.Buf, v595.Pos, l_Limit_0);
        v595.Pos = v595.Pos + v597;
        v136(v595, v597);
        v288(Enum.CatalogSortType).ser(v595, v596.SortType);
        v288(Enum.CatalogSortAggregation).ser(v595, v596.SortAggregation);
        v288(Enum.CatalogCategoryFilter).ser(v595, v596.CategoryFilter);
        v288(Enum.SalesTypeFilter).ser(v595, v596.SalesTypeFilter);
        for _, v600 in v596.AssetTypes do
            v288(Enum.AssetType).ser(v595, v600);
        end;
        v136(v595, #v596.AssetTypes);
    end, 
    des = function(v601) --[[ Line: 1470 ]] --[[ Name: des ]]
        -- upvalues: v137 (ref), v288 (ref)
        local v602 = CatalogSearchParams.new();
        local v603 = v137(v601);
        local v604 = table.create(v603);
        for v605 = v603, 1, -1 do
            v604[v605] = v288(Enum.AssetType).des(v601);
        end;
        v602.AssetTypes = v604;
        v602.SalesTypeFilter = v288(Enum.SalesTypeFilter).des(v601);
        v602.CategoryFilter = v288(Enum.CatalogCategoryFilter).des(v601);
        v602.SortAggregation = v288(Enum.CatalogSortAggregation).des(v601);
        v602.SortType = v288(Enum.CatalogSortType).des(v601);
        local v606 = v137(v601);
        v601.Pos = v601.Pos - v606;
        v602.SearchKeyword = buffer.readstring(v601.Buf, v601.Pos, v606);
        v606 = v137(v601);
        v601.Pos = v601.Pos - v606;
        v602.CreatorName = buffer.readstring(v601.Buf, v601.Pos, v606);
        v601.Pos = v601.Pos - 4;
        v602.MaxPrice = buffer.readu32(v601.Buf, v601.Pos);
        v601.Pos = v601.Pos - 4;
        v602.MinPrice = buffer.readu32(v601.Buf, v601.Pos);
        v601.Pos = v601.Pos - 1;
        v602.Limit = buffer.readu8(v601.Buf, v601.Pos);
        v601.Pos = v601.Pos - 1;
        v606 = buffer.readu8(v601.Buf, v601.Pos);
        local v607 = v606 % 2 >= 1;
        local v608 = v606 % 4 >= 2;
        v608 = v606 % 8 >= 4;
        v608 = v606 % 16 >= 8;
        v608 = v606 % 32 >= 16;
        v608 = v606 % 64 >= 32;
        v608 = v606 % 128 >= 64;
        v608 = v606 % 256 >= 128;
        v602.IncludeOffSale = v607;
        return v602;
    end
};
local l_v289_1 = v289 --[[ copy: 55 -> 78 ]];
v205.CatalogSearchParams = function() --[[ Line: 1492 ]] --[[ Name: CatalogSearchParams ]]
    -- upvalues: l_v289_1 (copy)
    return l_v289_1;
end;
v289 = nil;
local v610 = nil;
local function v611() --[[ Line: 1499 ]] --[[ Name: cframeLookupEntries ]]
    return {
        CFrame.Angles(0, 0, 0), 
        CFrame.Angles(1.5707963267948966, 0, 0), 
        CFrame.Angles(0, 3.141592653589793, 3.141592653589793), 
        CFrame.Angles(-1.5707963267948966, 0, 0), 
        CFrame.Angles(0, 3.141592653589793, 1.5707963267948966), 
        CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966), 
        CFrame.Angles(0, 0, 1.5707963267948966), 
        CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966), 
        CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0), 
        CFrame.Angles(0, -1.5707963267948966, 0), 
        CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0), 
        CFrame.Angles(0, 1.5707963267948966, 3.141592653589793), 
        CFrame.Angles(0, -1.5707963267948966, 3.141592653589793), 
        CFrame.Angles(0, 3.141592653589793, 0), 
        CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0), 
        CFrame.Angles(0, 0, 3.141592653589793), 
        CFrame.Angles(1.5707963267948966, 3.141592653589793, 0), 
        CFrame.Angles(0, 0, -1.5707963267948966), 
        CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966), 
        CFrame.Angles(0, -3.141592653589793, -1.5707963267948966), 
        CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966), 
        CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0), 
        CFrame.Angles(0, 1.5707963267948966, 0), 
        CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
    };
end;
local function v616(v612) --[[ Line: 1528 ]] --[[ Name: cframeSpecialCaseLookup ]]
    local v613 = {};
    for v614, v615 in v612 do
        v613[Vector3.new(v615:ToOrientation())] = v614;
    end;
    return v613;
end;
local v617 = v611();
local v618 = v616(v617);
local l_v618_0 = v618 --[[ copy: 60 -> 79 ]];
v289 = function(v620, v621) --[[ Line: 1541 ]] --[[ Name: rotser ]]
    -- upvalues: l_v618_0 (copy), v15 (copy)
    local v622 = l_v618_0[Vector3.new(v621:ToOrientation())];
    if v622 then
        v15(v620, 1);
        buffer.writeu8(v620.Buf, v620.Pos, v622);
        v620.Pos = v620.Pos + 1;
        return;
    else
        local v623, v624 = v621:ToAxisAngle();
        v623 = v623 * math.sin(v624 / 2);
        v15(v620, 7);
        local v625 = math.round((v623.Z + 1) * 32768 - 1);
        local v626 = math.round((v623.Y + 1) * 32768 - 1);
        local v627 = math.round((v623.X + 1) * 32768 - 1);
        buffer.writeu16(v620.Buf, v620.Pos, v625);
        v620.Pos = v620.Pos + 2;
        buffer.writeu16(v620.Buf, v620.Pos, v626);
        v620.Pos = v620.Pos + 2;
        buffer.writeu16(v620.Buf, v620.Pos, v627);
        v620.Pos = v620.Pos + 2;
        buffer.writeu8(v620.Buf, v620.Pos, 0);
        v620.Pos = v620.Pos + 1;
        return;
    end;
end;
local l_v617_0 = v617 --[[ copy: 59 -> 80 ]];
v610 = function(v629) --[[ Line: 1560 ]] --[[ Name: rotdes ]]
    -- upvalues: l_v617_0 (copy)
    v629.Pos = v629.Pos - 1;
    local v630 = buffer.readu8(v629.Buf, v629.Pos);
    if v630 ~= 0 then
        return l_v617_0[v630];
    else
        v629.Pos = v629.Pos - 2;
        local v631 = (buffer.readu16(v629.Buf, v629.Pos) + 1) * 3.0517578125E-5 - 1;
        v629.Pos = v629.Pos - 2;
        local v632 = (buffer.readu16(v629.Buf, v629.Pos) + 1) * 3.0517578125E-5 - 1;
        v629.Pos = v629.Pos - 2;
        local v633 = (buffer.readu16(v629.Buf, v629.Pos) + 1) * 3.0517578125E-5 - 1;
        local v634 = math.sqrt(1 - math.clamp(v631 * v631 + v632 * v632 + v633 * v633, 0, 1));
        return CFrame.new(0, 0, 0, v631, v632, v633, v634);
    end;
end;
local v635 = {
    ser = v289, 
    des = v610
};
v205.rotation = function() --[[ Line: 1577 ]] --[[ Name: rotation ]]
    -- upvalues: v635 (copy)
    return v635;
end;
v611 = nil;
v616 = {};
local l_v616_0 = v616 --[[ copy: 58 -> 81 ]];
v205.CFrame = function(v637) --[[ Line: 1585 ]] --[[ Name: CFrame ]]
    -- upvalues: l_v616_0 (copy), v289 (ref), v610 (ref)
    if l_v616_0[v637] then
        return l_v616_0[v637];
    else
        local l_ser_2 = v637.ser;
        local l_des_2 = v637.des;
        local v647 = {
            ser = function(v640, v641) --[[ Line: 1593 ]] --[[ Name: ser ]]
                -- upvalues: v289 (ref), l_ser_2 (copy)
                v289(v640, v641);
                local l_Position_0 = v641.Position;
                l_ser_2(v640, l_Position_0.Z);
                l_ser_2(v640, l_Position_0.Y);
                l_ser_2(v640, l_Position_0.X);
            end, 
            des = function(v643) --[[ Line: 1602 ]] --[[ Name: des ]]
                -- upvalues: l_des_2 (copy), v610 (ref)
                local v644 = l_des_2(v643);
                local v645 = l_des_2(v643);
                local v646 = l_des_2(v643);
                return v610(v643) + Vector3.new(v644, v645, v646);
            end
        };
        l_v616_0[v637] = v647;
        return v647;
    end;
end;
v611 = v205.CFrame;
v616 = function(v648, v649) --[[ Line: 1614 ]] --[[ Name: pushcolor3 ]]
    local v650 = v649.B * 255;
    buffer.writeu8(v648.Buf, v648.Pos, v650);
    v648.Pos = v648.Pos + 1;
    v650 = v649.G * 255;
    buffer.writeu8(v648.Buf, v648.Pos, v650);
    v648.Pos = v648.Pos + 1;
    v650 = v649.R * 255;
    buffer.writeu8(v648.Buf, v648.Pos, v650);
    v648.Pos = v648.Pos + 1;
end;
v617 = function(v651) --[[ Line: 1619 ]] --[[ Name: popcolor3 ]]
    local l_fromRGB_0 = Color3.fromRGB;
    v651.Pos = v651.Pos - 1;
    local v653 = buffer.readu8(v651.Buf, v651.Pos);
    v651.Pos = v651.Pos - 1;
    local v654 = buffer.readu8(v651.Buf, v651.Pos);
    v651.Pos = v651.Pos - 1;
    return l_fromRGB_0(v653, v654, (buffer.readu8(v651.Buf, v651.Pos)));
end;
v618 = {
    ser = function(v655, v656) --[[ Line: 1624 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v655, 3);
        local v657 = v656.B * 255;
        buffer.writeu8(v655.Buf, v655.Pos, v657);
        v655.Pos = v655.Pos + 1;
        v657 = v656.G * 255;
        buffer.writeu8(v655.Buf, v655.Pos, v657);
        v655.Pos = v655.Pos + 1;
        v657 = v656.R * 255;
        buffer.writeu8(v655.Buf, v655.Pos, v657);
        v655.Pos = v655.Pos + 1;
    end, 
    des = v617
};
local l_v618_1 = v618 --[[ copy: 60 -> 82 ]];
v205.Color3 = function() --[[ Line: 1630 ]] --[[ Name: Color3 ]]
    -- upvalues: l_v618_1 (copy)
    return l_v618_1;
end;
v618 = function(v659, v660) --[[ Line: 1635 ]] --[[ Name: pushcolorsequencekeypoint ]]
    local l_Value_0 = v660.Value;
    local v662 = l_Value_0.B * 255;
    buffer.writeu8(v659.Buf, v659.Pos, v662);
    v659.Pos = v659.Pos + 1;
    v662 = l_Value_0.G * 255;
    buffer.writeu8(v659.Buf, v659.Pos, v662);
    v659.Pos = v659.Pos + 1;
    v662 = l_Value_0.R * 255;
    buffer.writeu8(v659.Buf, v659.Pos, v662);
    v659.Pos = v659.Pos + 1;
    l_Value_0 = v660.Time * 255;
    buffer.writeu8(v659.Buf, v659.Pos, l_Value_0);
    v659.Pos = v659.Pos + 1;
end;
local v669 = {
    ser = function(v663, v664) --[[ Line: 1644 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v663, 4);
        local l_Value_1 = v664.Value;
        local v666 = l_Value_1.B * 255;
        buffer.writeu8(v663.Buf, v663.Pos, v666);
        v663.Pos = v663.Pos + 1;
        v666 = l_Value_1.G * 255;
        buffer.writeu8(v663.Buf, v663.Pos, v666);
        v663.Pos = v663.Pos + 1;
        v666 = l_Value_1.R * 255;
        buffer.writeu8(v663.Buf, v663.Pos, v666);
        v663.Pos = v663.Pos + 1;
        l_Value_1 = v664.Time * 255;
        buffer.writeu8(v663.Buf, v663.Pos, l_Value_1);
        v663.Pos = v663.Pos + 1;
    end, 
    des = function(v667) --[[ Line: 1639 ]] --[[ Name: popcolorsequencekeypoint ]]
        -- upvalues: v617 (copy)
        local l_new_0 = ColorSequenceKeypoint.new;
        v667.Pos = v667.Pos - 1;
        return l_new_0(buffer.readu8(v667.Buf, v667.Pos) / 255, v617(v667));
    end
};
local l_v669_0 = v669 --[[ copy: 62 -> 83 ]];
v205.ColorSequenceKeypoint = function() --[[ Line: 1650 ]] --[[ Name: ColorSequenceKeypoint ]]
    -- upvalues: l_v669_0 (copy)
    return l_v669_0;
end;
v669 = {
    ser = function(v671, v672) --[[ Line: 1657 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref)
        v15(v671, #v672.Keypoints * 4);
        for _, v674 in v672.Keypoints do
            local l_Value_2 = v674.Value;
            local v676 = l_Value_2.B * 255;
            buffer.writeu8(v671.Buf, v671.Pos, v676);
            v671.Pos = v671.Pos + 1;
            v676 = l_Value_2.G * 255;
            buffer.writeu8(v671.Buf, v671.Pos, v676);
            v671.Pos = v671.Pos + 1;
            v676 = l_Value_2.R * 255;
            buffer.writeu8(v671.Buf, v671.Pos, v676);
            v671.Pos = v671.Pos + 1;
            l_Value_2 = v674.Time * 255;
            buffer.writeu8(v671.Buf, v671.Pos, l_Value_2);
            v671.Pos = v671.Pos + 1;
        end;
        v136(v671, #v672.Keypoints);
    end, 
    des = function(v677) --[[ Line: 1665 ]] --[[ Name: des ]]
        -- upvalues: v137 (ref), v617 (copy)
        local v678 = v137(v677);
        local v679 = table.create(v678);
        for v680 = v678, 1, -1 do
            local l_new_1 = ColorSequenceKeypoint.new;
            v677.Pos = v677.Pos - 1;
            v679[v680] = l_new_1(buffer.readu8(v677.Buf, v677.Pos) / 255, v617(v677));
        end;
        return ColorSequence.new(v679);
    end
};
local l_v669_1 = v669 --[[ copy: 62 -> 84 ]];
v205.ColorSequence = function() --[[ Line: 1674 ]] --[[ Name: ColorSequence ]]
    -- upvalues: l_v669_1 (copy)
    return l_v669_1;
end;
v669 = {
    ser = function(v683, v684) --[[ Line: 1681 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v683, 6);
        local l_UnixTimestampMillis_0 = v684.UnixTimestampMillis;
        buffer.writeu16(v683.Buf, v683.Pos, l_UnixTimestampMillis_0);
        buffer.writeu32(v683.Buf, v683.Pos + 2, l_UnixTimestampMillis_0 // 65536);
        v683.Pos = v683.Pos + 6;
    end, 
    des = function(v686) --[[ Line: 1685 ]] --[[ Name: des ]]
        local l_fromUnixTimestampMillis_0 = DateTime.fromUnixTimestampMillis;
        v686.Pos = v686.Pos - 6;
        return l_fromUnixTimestampMillis_0(buffer.readu16(v686.Buf, v686.Pos) + buffer.readu32(v686.Buf, v686.Pos + 2) * 65536);
    end
};
local l_v669_2 = v669 --[[ copy: 62 -> 85 ]];
v205.DateTime = function() --[[ Line: 1689 ]] --[[ Name: DateTime ]]
    -- upvalues: l_v669_2 (copy)
    return l_v669_2;
end;
v669 = {
    ser = function(v689, v690) --[[ Line: 1696 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v689, 1);
        local l_Back_1 = v690.Back;
        local l_Bottom_1 = v690.Bottom;
        local l_Front_1 = v690.Front;
        local l_Left_1 = v690.Left;
        local l_Right_1 = v690.Right;
        local l_Top_1 = v690.Top;
        local v697 = (l_Back_1 and 1 or 0) + (l_Bottom_1 and 2 or 0) + (l_Front_1 and 4 or 0) + (l_Left_1 and 8 or 0) + (l_Right_1 and 16 or 0) + (l_Top_1 and 32 or 0) + 0 + 0;
        buffer.writeu8(v689.Buf, v689.Pos, v697);
        v689.Pos = v689.Pos + 1;
    end, 
    des = function(v698) --[[ Line: 1701 ]] --[[ Name: des ]]
        v698.Pos = v698.Pos - 1;
        local v699 = buffer.readu8(v698.Buf, v698.Pos);
        local v700 = v699 % 2 >= 1;
        local v701 = v699 % 4 >= 2;
        local v702 = v699 % 8 >= 4;
        local v703 = v699 % 16 >= 8;
        local v704 = v699 % 32 >= 16;
        local v705 = v699 % 64 >= 32;
        local v706 = v699 % 128 >= 64;
        v706 = v699 % 256 >= 128;
        return Faces.new(v700 and Enum.NormalId.Back, v701 and Enum.NormalId.Bottom, v702 and Enum.NormalId.Front, v703 and Enum.NormalId.Left, v704 and Enum.NormalId.Right, v705 and Enum.NormalId.Top);
    end
};
local l_v669_3 = v669 --[[ copy: 62 -> 86 ]];
v205.Faces = function() --[[ Line: 1713 ]] --[[ Name: Faces ]]
    -- upvalues: l_v669_3 (copy)
    return l_v669_3;
end;
v669 = {
    ser = function(v708, v709) --[[ Line: 1720 ]] --[[ Name: ser ]]
        -- upvalues: v288 (ref), v15 (copy)
        v288(Enum.KeyInterpolationMode).ser(v708, v709.Interpolation);
        v15(v708, 8);
        local l_Value_3 = v709.Value;
        buffer.writef32(v708.Buf, v708.Pos, l_Value_3);
        v708.Pos = v708.Pos + 4;
        l_Value_3 = v709.Time;
        buffer.writef32(v708.Buf, v708.Pos, l_Value_3);
        v708.Pos = v708.Pos + 4;
    end, 
    des = function(v711) --[[ Line: 1727 ]] --[[ Name: des ]]
        -- upvalues: v288 (ref)
        local l_new_2 = FloatCurveKey.new;
        v711.Pos = v711.Pos - 4;
        local v713 = buffer.readf32(v711.Buf, v711.Pos);
        v711.Pos = v711.Pos - 4;
        return l_new_2(v713, buffer.readf32(v711.Buf, v711.Pos), (v288(Enum.KeyInterpolationMode).des(v711)));
    end
};
local l_v669_4 = v669 --[[ copy: 62 -> 87 ]];
v205.FloatCurveKey = function() --[[ Line: 1731 ]] --[[ Name: FloatCurveKey ]]
    -- upvalues: l_v669_4 (copy)
    return l_v669_4;
end;
v669 = {
    ser = function(v715, v716) --[[ Line: 1738 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref), v288 (ref)
        local v717 = string.match(v716.Family, "rbxasset://fonts/families/(.+).json") or error((("Invalid font family %*"):format(v716.Family)));
        v15(v715, #v717 + 1);
        local v718 = #v717;
        buffer.writestring(v715.Buf, v715.Pos, v717);
        v715.Pos = v715.Pos + v718;
        v136(v715, v718);
        local v719 = (v716.Bold and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
        buffer.writeu8(v715.Buf, v715.Pos, v719);
        v715.Pos = v715.Pos + 1;
        v288(Enum.FontWeight).ser(v715, v716.Weight);
        v288(Enum.FontStyle).ser(v715, v716.Style);
    end, 
    des = function(v720) --[[ Line: 1747 ]] --[[ Name: des ]]
        -- upvalues: v288 (ref), v137 (ref)
        local v721 = v288(Enum.FontStyle).des(v720);
        local v722 = v288(Enum.FontWeight).des(v720);
        v720.Pos = v720.Pos - 1;
        local v723 = buffer.readu8(v720.Buf, v720.Pos);
        local v724 = v723 % 2 >= 1;
        local v725 = v723 % 4 >= 2;
        v725 = v723 % 8 >= 4;
        v725 = v723 % 16 >= 8;
        v725 = v723 % 32 >= 16;
        v725 = v723 % 64 >= 32;
        v725 = v723 % 128 >= 64;
        v725 = v723 % 256 >= 128;
        v725 = v137(v720);
        v720.Pos = v720.Pos - v725;
        v723 = buffer.readstring(v720.Buf, v720.Pos, v725);
        v725 = Font.new(("rbxasset://fonts/families/%*.json"):format(v723), v722, v721);
        v725.Bold = v724;
        return v725;
    end
};
local l_v669_5 = v669 --[[ copy: 62 -> 88 ]];
v205.Font = function() --[[ Line: 1757 ]] --[[ Name: Font ]]
    -- upvalues: l_v669_5 (copy)
    return l_v669_5;
end;
v669 = {};
local l_v669_6 = v669 --[[ copy: 62 -> 89 ]];
v205.NumberRange = function(v728) --[[ Line: 1764 ]] --[[ Name: NumberRange ]]
    -- upvalues: l_v669_6 (copy)
    if l_v669_6[v728] then
        return l_v669_6[v728];
    else
        local l_ser_3 = v728.ser;
        local l_des_3 = v728.des;
        local v734 = {
            ser = function(v731, v732) --[[ Line: 1772 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_3 (copy)
                l_ser_3(v731, v732.Max);
                l_ser_3(v731, v732.Min);
            end, 
            des = function(v733) --[[ Line: 1777 ]] --[[ Name: des ]]
                -- upvalues: l_des_3 (copy)
                return NumberRange.new(l_des_3(v733), l_des_3(v733));
            end
        };
        l_v669_6[v728] = v734;
        return v734;
    end;
end;
v669 = nil;
local v735 = {};
local l_v735_0 = v735 --[[ copy: 63 -> 90 ]];
v205.NumberSequenceKeypoint = function(v737) --[[ Line: 1789 ]] --[[ Name: NumberSequenceKeypoint ]]
    -- upvalues: l_v735_0 (copy), v15 (copy)
    if l_v735_0[v737] then
        return l_v735_0[v737];
    else
        local l_ser_4 = v737.ser;
        local l_des_4 = v737.des;
        local v747 = {
            ser = function(v740, v741) --[[ Line: 1797 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_4 (copy), v15 (ref)
                l_ser_4(v740, v741.Value);
                l_ser_4(v740, v741.Envelope);
                v15(v740, 4);
                local l_Time_0 = v741.Time;
                buffer.writef32(v740.Buf, v740.Pos, l_Time_0);
                v740.Pos = v740.Pos + 4;
            end, 
            des = function(v743) --[[ Line: 1804 ]] --[[ Name: des ]]
                -- upvalues: l_des_4 (copy)
                v743.Pos = v743.Pos - 4;
                local v744 = buffer.readf32(v743.Buf, v743.Pos);
                local v745 = l_des_4(v743);
                local v746 = l_des_4(v743);
                return NumberSequenceKeypoint.new(v744, v746, v745);
            end
        };
        l_v735_0[v737] = v747;
        return v747;
    end;
end;
v669 = v205.NumberSequenceKeypoint;
v735 = {};
local l_v735_1 = v735 --[[ copy: 63 -> 91 ]];
v205.NumberSequence = function(v749) --[[ Line: 1819 ]] --[[ Name: NumberSequence ]]
    -- upvalues: l_v735_1 (copy), v669 (ref), v136 (ref), v137 (ref)
    if l_v735_1[v749] then
        return l_v735_1[v749];
    else
        local l_ser_5 = v669(v749).ser;
        local l_des_5 = v669(v749).des;
        local v761 = {
            ser = function(v752, v753) --[[ Line: 1827 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_5 (copy), v136 (ref)
                local l_l_ser_5_0 = l_ser_5;
                for _, v756 in v753.Keypoints do
                    l_l_ser_5_0(v752, v756);
                end;
                v136(v752, #v753.Keypoints);
            end, 
            des = function(v757) --[[ Line: 1835 ]] --[[ Name: des ]]
                -- upvalues: v137 (ref), l_des_5 (copy)
                local v758 = v137(v757);
                local v759 = table.create(v758);
                for v760 = v758, 1, -1 do
                    v759[v760] = l_des_5(v757);
                end;
                return NumberSequence.new(v759);
            end
        };
        l_v735_1[v749] = v761;
        return v761;
    end;
end;
v735 = {
    ser = function(v762, v763) --[[ Line: 1853 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref), v288 (ref)
        v15(v762, #v763.CollisionGroup + 3);
        local l_BruteForceAllSlow_0 = v763.BruteForceAllSlow;
        local l_RespectCanCollide_0 = v763.RespectCanCollide;
        local v766 = (l_BruteForceAllSlow_0 and 1 or 0) + (l_RespectCanCollide_0 and 2 or 0) + 0 + 0 + 0 + 0 + 0 + 0;
        buffer.writeu8(v762.Buf, v762.Pos, v766);
        v762.Pos = v762.Pos + 1;
        l_BruteForceAllSlow_0 = v763.MaxParts;
        buffer.writeu16(v762.Buf, v762.Pos, l_BruteForceAllSlow_0);
        v762.Pos = v762.Pos + 2;
        l_BruteForceAllSlow_0 = v763.CollisionGroup;
        l_RespectCanCollide_0 = #l_BruteForceAllSlow_0;
        buffer.writestring(v762.Buf, v762.Pos, l_BruteForceAllSlow_0);
        v762.Pos = v762.Pos + l_RespectCanCollide_0;
        v136(v762, l_RespectCanCollide_0);
        v288(Enum.RaycastFilterType).ser(v762, v763.FilterType);
    end, 
    des = function(v767) --[[ Line: 1861 ]] --[[ Name: des ]]
        -- upvalues: v288 (ref), v137 (ref)
        local v768 = OverlapParams.new();
        v768.FilterType = v288(Enum.RaycastFilterType).des(v767);
        local v769 = v137(v767);
        v767.Pos = v767.Pos - v769;
        v768.CollisionGroup = buffer.readstring(v767.Buf, v767.Pos, v769);
        v767.Pos = v767.Pos - 2;
        v768.MaxParts = buffer.readu16(v767.Buf, v767.Pos);
        v767.Pos = v767.Pos - 1;
        local v770 = buffer.readu8(v767.Buf, v767.Pos);
        local v771 = v770 % 2 >= 1;
        v769 = v770 % 4 >= 2;
        local v772 = v770 % 8 >= 4;
        v772 = v770 % 16 >= 8;
        v772 = v770 % 32 >= 16;
        v772 = v770 % 64 >= 32;
        v772 = v770 % 128 >= 64;
        v772 = v770 % 256 >= 128;
        v768.BruteForceAllSlow = v771;
        v768.RespectCanCollide = v769;
        return v768;
    end
};
local l_v735_2 = v735 --[[ copy: 63 -> 92 ]];
v205.OverlapParams = function() --[[ Line: 1870 ]] --[[ Name: OverlapParams ]]
    -- upvalues: l_v735_2 (copy)
    return l_v735_2;
end;
v735 = {
    ser = function(v774, v775) --[[ Line: 1877 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref), v288 (ref)
        v15(v774, #v775.CollisionGroup + 1);
        local l_BruteForceAllSlow_1 = v775.BruteForceAllSlow;
        local l_RespectCanCollide_1 = v775.RespectCanCollide;
        local l_IgnoreWater_0 = v775.IgnoreWater;
        local v779 = (l_BruteForceAllSlow_1 and 1 or 0) + (l_RespectCanCollide_1 and 2 or 0) + (l_IgnoreWater_0 and 4 or 0) + 0 + 0 + 0 + 0 + 0;
        buffer.writeu8(v774.Buf, v774.Pos, v779);
        v774.Pos = v774.Pos + 1;
        l_BruteForceAllSlow_1 = v775.CollisionGroup;
        l_RespectCanCollide_1 = #l_BruteForceAllSlow_1;
        buffer.writestring(v774.Buf, v774.Pos, l_BruteForceAllSlow_1);
        v774.Pos = v774.Pos + l_RespectCanCollide_1;
        v136(v774, l_RespectCanCollide_1);
        v288(Enum.RaycastFilterType).ser(v774, v775.FilterType);
    end, 
    des = function(v780) --[[ Line: 1884 ]] --[[ Name: des ]]
        -- upvalues: v288 (ref), v137 (ref)
        local v781 = RaycastParams.new();
        v781.FilterType = v288(Enum.RaycastFilterType).des(v780);
        local v782 = v137(v780);
        v780.Pos = v780.Pos - v782;
        v781.CollisionGroup = buffer.readstring(v780.Buf, v780.Pos, v782);
        v780.Pos = v780.Pos - 1;
        local v783 = buffer.readu8(v780.Buf, v780.Pos);
        local v784 = v783 % 2 >= 1;
        v782 = v783 % 4 >= 2;
        local v785 = v783 % 8 >= 4;
        local v786 = v783 % 16 >= 8;
        v786 = v783 % 32 >= 16;
        v786 = v783 % 64 >= 32;
        v786 = v783 % 128 >= 64;
        v786 = v783 % 256 >= 128;
        v781.BruteForceAllSlow = v784;
        v781.RespectCanCollide = v782;
        v781.IgnoreWater = v785;
        return v781;
    end
};
local l_v735_3 = v735 --[[ copy: 63 -> 93 ]];
v205.RaycastParams = function() --[[ Line: 1892 ]] --[[ Name: RaycastParams ]]
    -- upvalues: l_v735_3 (copy)
    return l_v735_3;
end;
v735 = {};
local l_v735_4 = v735 --[[ copy: 63 -> 94 ]];
v205.Vector3 = function(v789) --[[ Line: 1899 ]] --[[ Name: Vector3 ]]
    -- upvalues: l_v735_4 (copy)
    if l_v735_4[v789] then
        return l_v735_4[v789];
    else
        local l_ser_6 = v789.ser;
        local l_des_6 = v789.des;
        local v795 = {
            ser = function(v792, v793) --[[ Line: 1907 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_6 (copy)
                l_ser_6(v792, v793.Z);
                l_ser_6(v792, v793.Y);
                l_ser_6(v792, v793.X);
            end, 
            des = function(v794) --[[ Line: 1913 ]] --[[ Name: des ]]
                -- upvalues: l_des_6 (copy)
                return (Vector3.new(l_des_6(v794), l_des_6(v794), l_des_6(v794)));
            end
        };
        l_v735_4[v789] = v795;
        return v795;
    end;
end;
v735 = {};
local l_v735_5 = v735 --[[ copy: 63 -> 95 ]];
v205.PathWaypoint = function(v797) --[[ Line: 1925 ]] --[[ Name: PathWaypoint ]]
    -- upvalues: l_v735_5 (copy), v15 (copy), v136 (ref), v288 (ref), v187 (copy)
    if l_v735_5[v797] then
        return l_v735_5[v797];
    else
        local l_ser_7 = v797.ser;
        local l_des_7 = v797.des;
        local v805 = {
            ser = function(v800, v801) --[[ Line: 1933 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), v136 (ref), v288 (ref), l_ser_7 (copy)
                v15(v800, #v801.Label);
                local l_Label_0 = v801.Label;
                local v803 = #l_Label_0;
                buffer.writestring(v800.Buf, v800.Pos, l_Label_0);
                v800.Pos = v800.Pos + v803;
                v136(v800, v803);
                v288(Enum.PathWaypointAction).ser(v800, v801.Action);
                l_ser_7(v800, v801.Position.Z);
                l_ser_7(v800, v801.Position.Y);
                l_ser_7(v800, v801.Position.X);
            end, 
            des = function(v804) --[[ Line: 1942 ]] --[[ Name: des ]]
                -- upvalues: l_des_7 (copy), v288 (ref), v187 (ref)
                return PathWaypoint.new(Vector3.new(l_des_7(v804), l_des_7(v804), l_des_7(v804)), v288(Enum.PathWaypointAction).des(v804), v187(v804));
            end
        };
        l_v735_5[v797] = v805;
        return v805;
    end;
end;
v735 = {
    ser = function(v806, v807) --[[ Line: 1957 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v806, 20);
        local l_ElasticityWeight_0 = v807.ElasticityWeight;
        buffer.writef32(v806.Buf, v806.Pos, l_ElasticityWeight_0);
        v806.Pos = v806.Pos + 4;
        l_ElasticityWeight_0 = v807.FrictionWeight;
        buffer.writef32(v806.Buf, v806.Pos, l_ElasticityWeight_0);
        v806.Pos = v806.Pos + 4;
        l_ElasticityWeight_0 = v807.Elasticity;
        buffer.writef32(v806.Buf, v806.Pos, l_ElasticityWeight_0);
        v806.Pos = v806.Pos + 4;
        l_ElasticityWeight_0 = v807.Friction;
        buffer.writef32(v806.Buf, v806.Pos, l_ElasticityWeight_0);
        v806.Pos = v806.Pos + 4;
        l_ElasticityWeight_0 = v807.Density;
        buffer.writef32(v806.Buf, v806.Pos, l_ElasticityWeight_0);
        v806.Pos = v806.Pos + 4;
    end, 
    des = function(v809) --[[ Line: 1966 ]] --[[ Name: des ]]
        local l_new_3 = PhysicalProperties.new;
        v809.Pos = v809.Pos - 4;
        local v811 = buffer.readf32(v809.Buf, v809.Pos);
        v809.Pos = v809.Pos - 4;
        local v812 = buffer.readf32(v809.Buf, v809.Pos);
        v809.Pos = v809.Pos - 4;
        local v813 = buffer.readf32(v809.Buf, v809.Pos);
        v809.Pos = v809.Pos - 4;
        local v814 = buffer.readf32(v809.Buf, v809.Pos);
        v809.Pos = v809.Pos - 4;
        return l_new_3(v811, v812, v813, v814, (buffer.readf32(v809.Buf, v809.Pos)));
    end
};
local l_v735_6 = v735 --[[ copy: 63 -> 96 ]];
v205.PhysicalProperties = function() --[[ Line: 1970 ]] --[[ Name: PhysicalProperties ]]
    -- upvalues: l_v735_6 (copy)
    return l_v735_6;
end;
v735 = {};
local l_v735_7 = v735 --[[ copy: 63 -> 97 ]];
v205.Ray = function(v817) --[[ Line: 1977 ]] --[[ Name: Ray ]]
    -- upvalues: l_v735_7 (copy)
    if l_v735_7[v817] then
        return l_v735_7[v817];
    else
        local l_ser_8 = v817.ser;
        local l_des_8 = v817.des;
        local v823 = {
            ser = function(v820, v821) --[[ Line: 1985 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_8 (copy)
                l_ser_8(v820, v821.Direction.Z);
                l_ser_8(v820, v821.Direction.Y);
                l_ser_8(v820, v821.Direction.X);
                l_ser_8(v820, v821.Origin.Z);
                l_ser_8(v820, v821.Origin.Y);
                l_ser_8(v820, v821.Origin.X);
            end, 
            des = function(v822) --[[ Line: 1994 ]] --[[ Name: des ]]
                -- upvalues: l_des_8 (copy)
                return Ray.new(Vector3.new(l_des_8(v822), l_des_8(v822), l_des_8(v822)), (Vector3.new(l_des_8(v822), l_des_8(v822), l_des_8(v822))));
            end
        };
        l_v735_7[v817] = v823;
        return v823;
    end;
end;
v735 = {};
local l_v735_8 = v735 --[[ copy: 63 -> 98 ]];
v205.RaycastResult = function(v825) --[[ Line: 2012 ]] --[[ Name: RaycastResult ]]
    -- upvalues: l_v735_8 (copy), v15 (copy), v288 (ref)
    if l_v735_8[v825] then
        return l_v735_8[v825];
    else
        local l_ser_9 = v825.ser;
        local l_des_9 = v825.des;
        local v833 = {
            ser = function(v828, v829) --[[ Line: 2020 ]] --[[ Name: ser ]]
                -- upvalues: v15 (ref), l_ser_9 (copy), v288 (ref)
                v15(v828, 4);
                local l_Distance_0 = v829.Distance;
                buffer.writef32(v828.Buf, v828.Pos, l_Distance_0);
                v828.Pos = v828.Pos + 4;
                l_ser_9(v828, v829.Position.Z);
                l_ser_9(v828, v829.Position.Y);
                l_ser_9(v828, v829.Position.X);
                l_ser_9(v828, v829.Normal.Z);
                l_ser_9(v828, v829.Normal.Y);
                l_ser_9(v828, v829.Normal.X);
                v288(Enum.Material).ser(v828, v829.Material);
            end, 
            des = function(v831) --[[ Line: 2032 ]] --[[ Name: des ]]
                -- upvalues: v288 (ref), l_des_9 (copy)
                local v832 = {
                    Material = v288(Enum.Material).des(v831), 
                    Normal = Vector3.new(l_des_9(v831), l_des_9(v831), l_des_9(v831)), 
                    Position = Vector3.new(l_des_9(v831), l_des_9(v831), l_des_9(v831))
                };
                v831.Pos = v831.Pos - 4;
                v832.Distance = buffer.readf32(v831.Buf, v831.Pos);
                v832.Instance = nil;
                return v832;
            end
        };
        l_v735_8[v825] = v833;
        return v833;
    end;
end;
v735 = {};
local l_v735_9 = v735 --[[ copy: 63 -> 99 ]];
v205.Vector2 = function(v835) --[[ Line: 2050 ]] --[[ Name: Vector2 ]]
    -- upvalues: l_v735_9 (copy)
    if l_v735_9[v835] then
        return l_v735_9[v835];
    else
        local l_ser_10 = v835.ser;
        local l_des_10 = v835.des;
        local v841 = {
            ser = function(v838, v839) --[[ Line: 2058 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_10 (copy)
                l_ser_10(v838, v839.Y);
                l_ser_10(v838, v839.X);
            end, 
            des = function(v840) --[[ Line: 2063 ]] --[[ Name: des ]]
                -- upvalues: l_des_10 (copy)
                return Vector2.new(l_des_10(v840), l_des_10(v840));
            end
        };
        l_v735_9[v835] = v841;
        return v841;
    end;
end;
v735 = {};
local l_v735_10 = v735 --[[ copy: 63 -> 100 ]];
v205.Rect = function(v843) --[[ Line: 2075 ]] --[[ Name: Rect ]]
    -- upvalues: l_v735_10 (copy)
    if l_v735_10[v843] then
        return l_v735_10[v843];
    else
        local l_ser_11 = v843.ser;
        local l_des_11 = v843.des;
        local v849 = {
            ser = function(v846, v847) --[[ Line: 2083 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_11 (copy)
                l_ser_11(v846, v847.Max.Y);
                l_ser_11(v846, v847.Max.X);
                l_ser_11(v846, v847.Min.Y);
                l_ser_11(v846, v847.Min.X);
            end, 
            des = function(v848) --[[ Line: 2090 ]] --[[ Name: des ]]
                -- upvalues: l_des_11 (copy)
                return Rect.new(l_des_11(v848), l_des_11(v848), l_des_11(v848), l_des_11(v848));
            end
        };
        l_v735_10[v843] = v849;
        return v849;
    end;
end;
v735 = {};
local l_v735_11 = v735 --[[ copy: 63 -> 101 ]];
v205.Region3 = function(v851) --[[ Line: 2101 ]] --[[ Name: Region3 ]]
    -- upvalues: l_v735_11 (copy)
    if l_v735_11[v851] then
        return l_v735_11[v851];
    else
        local l_ser_12 = v851.ser;
        local l_des_12 = v851.des;
        local v861 = {
            ser = function(v854, v855) --[[ Line: 2109 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_12 (copy)
                local l_Size_0 = v855.Size;
                l_ser_12(v854, l_Size_0.Z);
                l_ser_12(v854, l_Size_0.Y);
                l_ser_12(v854, l_Size_0.X);
                local l_Position_1 = v855.CFrame.Position;
                l_ser_12(v854, l_Position_1.Z);
                l_ser_12(v854, l_Position_1.Y);
                l_ser_12(v854, l_Position_1.X);
            end, 
            des = function(v858) --[[ Line: 2120 ]] --[[ Name: des ]]
                -- upvalues: l_des_12 (copy)
                local v859 = Vector3.new(l_des_12(v858), l_des_12(v858), l_des_12(v858));
                local v860 = 0.5 * Vector3.new(l_des_12(v858), l_des_12(v858), l_des_12(v858));
                return Region3.new(v859 - v860, v859 + v860);
            end
        };
        l_v735_11[v851] = v861;
        return v861;
    end;
end;
v735 = {
    ser = function(v862, v863) --[[ Line: 2133 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v862, 12);
        local l_Max_0 = v863.Max;
        local l_Z_0 = l_Max_0.Z;
        buffer.writei16(v862.Buf, v862.Pos, l_Z_0);
        v862.Pos = v862.Pos + 2;
        l_Z_0 = l_Max_0.Y;
        buffer.writei16(v862.Buf, v862.Pos, l_Z_0);
        v862.Pos = v862.Pos + 2;
        l_Z_0 = l_Max_0.X;
        buffer.writei16(v862.Buf, v862.Pos, l_Z_0);
        v862.Pos = v862.Pos + 2;
        l_Z_0 = v863.Min;
        local l_Z_1 = l_Z_0.Z;
        buffer.writei16(v862.Buf, v862.Pos, l_Z_1);
        v862.Pos = v862.Pos + 2;
        l_Z_1 = l_Z_0.Y;
        buffer.writei16(v862.Buf, v862.Pos, l_Z_1);
        v862.Pos = v862.Pos + 2;
        l_Z_1 = l_Z_0.X;
        buffer.writei16(v862.Buf, v862.Pos, l_Z_1);
        v862.Pos = v862.Pos + 2;
    end, 
    des = function(v867) --[[ Line: 2145 ]] --[[ Name: des ]]
        local l_new_4 = Vector3int16.new;
        v867.Pos = v867.Pos - 2;
        local v869 = buffer.readi16(v867.Buf, v867.Pos);
        v867.Pos = v867.Pos - 2;
        local v870 = buffer.readi16(v867.Buf, v867.Pos);
        v867.Pos = v867.Pos - 2;
        l_new_4 = l_new_4(v869, v870, (buffer.readi16(v867.Buf, v867.Pos)));
        v869 = Vector3int16.new;
        v867.Pos = v867.Pos - 2;
        v870 = buffer.readi16(v867.Buf, v867.Pos);
        v867.Pos = v867.Pos - 2;
        local v871 = buffer.readi16(v867.Buf, v867.Pos);
        v867.Pos = v867.Pos - 2;
        v869 = v869(v870, v871, (buffer.readi16(v867.Buf, v867.Pos)));
        return Region3int16.new(l_new_4, v869);
    end
};
local l_v735_12 = v735 --[[ copy: 63 -> 102 ]];
v205.Region3int16 = function() --[[ Line: 2151 ]] --[[ Name: Region3int16 ]]
    -- upvalues: l_v735_12 (copy)
    return l_v735_12;
end;
v735 = {};
local l_v735_13 = v735 --[[ copy: 63 -> 103 ]];
v205.RotationCurveKey = function(v874) --[[ Line: 2158 ]] --[[ Name: RotationCurveKey ]]
    -- upvalues: l_v735_13 (copy), v611 (ref), v288 (ref), v15 (copy)
    if l_v735_13[v874] then
        return l_v735_13[v874];
    else
        local l_ser_13 = v611(v874).ser;
        local l_des_13 = v611(v874).des;
        local v882 = {
            ser = function(v877, v878) --[[ Line: 2166 ]] --[[ Name: ser ]]
                -- upvalues: v288 (ref), l_ser_13 (copy), v15 (ref)
                v288(Enum.KeyInterpolationMode).ser(v877, v878.Interpolation);
                l_ser_13(v877, v878.Value);
                v15(v877, 4);
                local l_Time_1 = v878.Time;
                buffer.writef32(v877.Buf, v877.Pos, l_Time_1);
                v877.Pos = v877.Pos + 4;
            end, 
            des = function(v880) --[[ Line: 2173 ]] --[[ Name: des ]]
                -- upvalues: l_des_13 (copy), v288 (ref)
                local l_new_5 = RotationCurveKey.new;
                v880.Pos = v880.Pos - 4;
                return l_new_5(buffer.readf32(v880.Buf, v880.Pos), l_des_13(v880), (v288(Enum.KeyInterpolationMode).des(v880)));
            end
        };
        l_v735_13[v874] = v882;
        return v882;
    end;
end;
v735 = {
    ser = function(v883, v884) --[[ Line: 2188 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy), v136 (ref), v288 (ref)
        v15(v883, 9);
        local l_DelayTime_0 = v884.DelayTime;
        buffer.writef32(v883.Buf, v883.Pos, l_DelayTime_0);
        v883.Pos = v883.Pos + 4;
        l_DelayTime_0 = v884.Time;
        buffer.writef32(v883.Buf, v883.Pos, l_DelayTime_0);
        v883.Pos = v883.Pos + 4;
        local v886 = (v884.Reverses and 1 or 0) + 0 + 0 + 0 + 0 + 0 + 0 + 0;
        buffer.writeu8(v883.Buf, v883.Pos, v886);
        v883.Pos = v883.Pos + 1;
        v136(v883, v884.RepeatCount);
        v288(Enum.EasingDirection).ser(v883, v884.EasingDirection);
        v288(Enum.EasingStyle).ser(v883, v884.EasingStyle);
    end, 
    des = function(v887) --[[ Line: 2198 ]] --[[ Name: des ]]
        -- upvalues: v288 (ref), v137 (ref)
        local v888 = v288(Enum.EasingStyle).des(v887);
        local v889 = v288(Enum.EasingDirection).des(v887);
        local v890 = v137(v887);
        v887.Pos = v887.Pos - 1;
        local v891 = buffer.readu8(v887.Buf, v887.Pos);
        local v892 = v891 % 2 >= 1;
        local v893 = v891 % 4 >= 2;
        v893 = v891 % 8 >= 4;
        v893 = v891 % 16 >= 8;
        v893 = v891 % 32 >= 16;
        v893 = v891 % 64 >= 32;
        v893 = v891 % 128 >= 64;
        v893 = v891 % 256 >= 128;
        v887.Pos = v887.Pos - 4;
        v891 = buffer.readf32(v887.Buf, v887.Pos);
        v887.Pos = v887.Pos - 4;
        v893 = buffer.readf32(v887.Buf, v887.Pos);
        return TweenInfo.new(v891, v888, v889, v890, v892, v893);
    end
};
local l_v735_14 = v735 --[[ copy: 63 -> 104 ]];
v205.TweenInfo = function() --[[ Line: 2208 ]] --[[ Name: TweenInfo ]]
    -- upvalues: l_v735_14 (copy)
    return l_v735_14;
end;
v735 = {};
local l_v735_15 = v735 --[[ copy: 63 -> 105 ]];
v205.UDim = function(v896) --[[ Line: 2215 ]] --[[ Name: UDim ]]
    -- upvalues: l_v735_15 (copy)
    if l_v735_15[v896] then
        return l_v735_15[v896];
    else
        local l_ser_14 = v896.ser;
        local l_des_14 = v896.des;
        local v902 = {
            ser = function(v899, v900) --[[ Line: 2223 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_14 (copy)
                l_ser_14(v899, v900.Offset);
                l_ser_14(v899, v900.Scale);
            end, 
            des = function(v901) --[[ Line: 2228 ]] --[[ Name: des ]]
                -- upvalues: l_des_14 (copy)
                return UDim.new(l_des_14(v901), l_des_14(v901));
            end
        };
        l_v735_15[v896] = v902;
        return v902;
    end;
end;
v735 = {};
local l_v735_16 = v735 --[[ copy: 63 -> 106 ]];
v205.UDim2 = function(v904) --[[ Line: 2240 ]] --[[ Name: UDim2 ]]
    -- upvalues: l_v735_16 (copy)
    if l_v735_16[v904] then
        return l_v735_16[v904];
    else
        local l_ser_15 = v904.ser;
        local l_des_15 = v904.des;
        local v910 = {
            ser = function(v907, v908) --[[ Line: 2248 ]] --[[ Name: ser ]]
                -- upvalues: l_ser_15 (copy)
                l_ser_15(v907, v908.Y.Offset);
                l_ser_15(v907, v908.Y.Scale);
                l_ser_15(v907, v908.X.Offset);
                l_ser_15(v907, v908.X.Scale);
            end, 
            des = function(v909) --[[ Line: 2255 ]] --[[ Name: des ]]
                -- upvalues: l_des_15 (copy)
                return UDim2.new(l_des_15(v909), l_des_15(v909), l_des_15(v909), l_des_15(v909));
            end
        };
        l_v735_16[v904] = v910;
        return v910;
    end;
end;
v735 = {
    ser = function(v911, v912) --[[ Line: 2267 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v911, 4);
        local l_Y_0 = v912.Y;
        buffer.writei16(v911.Buf, v911.Pos, l_Y_0);
        v911.Pos = v911.Pos + 2;
        l_Y_0 = v912.X;
        buffer.writei16(v911.Buf, v911.Pos, l_Y_0);
        v911.Pos = v911.Pos + 2;
    end, 
    des = function(v914) --[[ Line: 2273 ]] --[[ Name: des ]]
        local l_new_6 = Vector2int16.new;
        v914.Pos = v914.Pos - 2;
        local v916 = buffer.readi16(v914.Buf, v914.Pos);
        v914.Pos = v914.Pos - 2;
        return l_new_6(v916, (buffer.readi16(v914.Buf, v914.Pos)));
    end
};
local l_v735_17 = v735 --[[ copy: 63 -> 107 ]];
v205.Vector2int16 = function() --[[ Line: 2277 ]] --[[ Name: Vector2int16 ]]
    -- upvalues: l_v735_17 (copy)
    return l_v735_17;
end;
v735 = {
    ser = function(v918, v919) --[[ Line: 2284 ]] --[[ Name: ser ]]
        -- upvalues: v15 (copy)
        v15(v918, 6);
        local l_Z_2 = v919.Z;
        buffer.writei16(v918.Buf, v918.Pos, l_Z_2);
        v918.Pos = v918.Pos + 2;
        l_Z_2 = v919.Y;
        buffer.writei16(v918.Buf, v918.Pos, l_Z_2);
        v918.Pos = v918.Pos + 2;
        l_Z_2 = v919.X;
        buffer.writei16(v918.Buf, v918.Pos, l_Z_2);
        v918.Pos = v918.Pos + 2;
    end, 
    des = function(v921) --[[ Line: 2291 ]] --[[ Name: des ]]
        local l_new_7 = Vector3int16.new;
        v921.Pos = v921.Pos - 2;
        local v923 = buffer.readi16(v921.Buf, v921.Pos);
        v921.Pos = v921.Pos - 2;
        local v924 = buffer.readi16(v921.Buf, v921.Pos);
        v921.Pos = v921.Pos - 2;
        return l_new_7(v923, v924, (buffer.readi16(v921.Buf, v921.Pos)));
    end
};
v205.Vector3int16 = function() --[[ Line: 2295 ]] --[[ Name: Vector3int16 ]]
    -- upvalues: v735 (copy)
    return v735;
end;
return v205;