--!native
local v0 = {
    [0] = -12336, 
    [1] = -12592, 
    [2] = -12848, 
    [3] = -13104, 
    [4] = -13360, 
    [5] = -13616, 
    [6] = -13872, 
    [7] = -14128, 
    [8] = 25180, 
    [9] = 29788, 
    [10] = 28252, 
    [11] = -25136, 
    [12] = 26204, 
    [13] = 29276, 
    [14] = -25904, 
    [15] = -26160, 
    [16] = -12337, 
    [17] = -12593, 
    [18] = -12849, 
    [19] = -13105, 
    [20] = -13361, 
    [21] = -13617, 
    [22] = -13873, 
    [23] = -14129, 
    [24] = -14385, 
    [25] = -14641, 
    [26] = -24881, 
    [27] = -25137, 
    [28] = -25393, 
    [29] = -25649, 
    [30] = -25905, 
    [31] = -26161
};
local v1 = {
    [36] = true, 
    [95] = true
};
local v2 = {
    [36] = true, 
    [95] = true
};
for v3 = 65, 90 do
    v1[v3] = true;
    v2[v3] = true;
end;
for v4 = 97, 122 do
    v1[v4] = true;
    v2[v4] = true;
end;
v2[48] = true;
v2[49] = true;
v2[50] = true;
v2[51] = true;
v2[52] = true;
v2[53] = true;
v2[54] = true;
v2[55] = true;
v2[56] = true;
v2[57] = true;
local function v6(v5) --[[ Line: 91 ]] --[[ Name: Stream ]]
    return {
        Buf = v5, 
        Pos = 0, 
        Cap = buffer.len(v5), 
        Indent = 0, 
        Pretty = false, 
        Encoders = {}, 
        Null = nil, 
        QuoteChar = 34, 
        UnquoteIdent = false
    };
end;
local function v8(v7) --[[ Line: 105 ]] --[[ Name: ToString ]]
    return buffer.readstring(v7.Buf, 0, v7.Pos);
end;
local function _(v9) --[[ Line: 109 ]] --[[ Name: AllocSize ]]
    return (math.max(v9, 2 ^ math.ceil((math.log(v9, 2)))));
end;
local function v17(v11, v12) --[[ Line: 115 ]] --[[ Name: Reserve ]]
    local l_Pos_0 = v11.Pos;
    local v14 = l_Pos_0 + v12;
    if v11.Cap < v14 then
        local v15 = math.max(v14, 2 ^ math.ceil((math.log(v14, 2))));
        local v16 = buffer.create(v15);
        buffer.copy(v16, 0, v11.Buf, 0, l_Pos_0);
        v11.Buf = v16;
        v11.Cap = v15;
    end;
    v11.Pos = v14;
    return l_Pos_0;
end;
local function _(v18, v19) --[[ Line: 131 ]] --[[ Name: WriteString ]]
    -- upvalues: v17 (copy)
    local v20 = string.len(v19);
    local v21 = v17(v18, v20);
    buffer.writestring(v18.Buf, v21, v19, v20);
end;
local function v28(v23) --[[ Line: 137 ]] --[[ Name: WriteIndent ]]
    -- upvalues: v17 (copy)
    local v24 = v23.Indent * 2;
    local v25 = v17(v23, v24);
    local l_Buf_0 = v23.Buf;
    for v27 = 0, v24 - 1 do
        buffer.writeu16(l_Buf_0, v25 + v27 * 2, 8224);
    end;
end;
local function _(v29, v30) --[[ Line: 146 ]] --[[ Name: IncrementIndent ]]
    v29.Indent = v29.Indent + v30;
end;
local function _(v32, v33) --[[ Line: 150 ]] --[[ Name: WriteU8 ]]
    -- upvalues: v17 (copy)
    local v34 = v17(v32, 1);
    buffer.writeu8(v32.Buf, v34, v33);
end;
local function _(v36, v37) --[[ Line: 155 ]] --[[ Name: WriteU16 ]]
    -- upvalues: v17 (copy)
    local v38 = v17(v36, 2);
    buffer.writeu16(v36.Buf, v38, v37);
end;
local function _(v40, v41) --[[ Line: 160 ]] --[[ Name: WriteU32 ]]
    -- upvalues: v17 (copy)
    local v42 = v17(v40, 4);
    buffer.writeu32(v40.Buf, v42, v41);
end;
local function v47(v44, _) --[[ Line: 165 ]] --[[ Name: EncodeNull ]]
    -- upvalues: v17 (copy)
    local v46 = v17(v44, 4);
    buffer.writeu32(v44.Buf, v46, 1819047278);
end;
local function v53(v48, v49) --[[ Line: 169 ]] --[[ Name: EncodeBoolean ]]
    -- upvalues: v17 (copy)
    if v49 then
        local v50 = v17(v48, 4);
        buffer.writeu32(v48.Buf, v50, 1702195828);
        return;
    else
        local v51 = v17(v48, 5);
        local l_Buf_1 = v48.Buf;
        buffer.writeu32(l_Buf_1, v51, 1936482662);
        buffer.writeu8(l_Buf_1, v51 + 4, 101);
        return;
    end;
end;
local function v67(v54, v55) --[[ Line: 180 ]] --[[ Name: EncodeNumber ]]
    -- upvalues: v17 (copy)
    if v55 ~= v55 then
        local v56 = v17(v54, 3);
        local l_Buf_2 = v54.Buf;
        buffer.writeu16(l_Buf_2, v56, 24910);
        buffer.writeu8(l_Buf_2, v56 + 2, 78);
        return;
    elseif v55 == 1e999 then
        local v58 = v17(v54, 8);
        local l_Buf_3 = v54.Buf;
        buffer.writeu32(l_Buf_3, v58, 1768320585);
        buffer.writeu32(l_Buf_3, v58 + 4, 2037672302);
        return;
    elseif v55 == -1e999 then
        local v60 = v17(v54, 9);
        local l_Buf_4 = v54.Buf;
        buffer.writeu8(l_Buf_4, v60, 45);
        buffer.writeu32(l_Buf_4, v60 + 1, 1768320585);
        buffer.writeu32(l_Buf_4, v60 + 5, 2037672302);
        return;
    else
        local v62 = tostring(v55);
        local v63 = string.find(v62, "e%+");
        if v63 then
            v62 = string.sub(v62, 1, v63) .. string.sub(v62, v63 + 2);
        end;
        local l_v62_0 = v62;
        local v65 = string.len(l_v62_0);
        local v66 = v17(v54, v65);
        buffer.writestring(v54.Buf, v66, l_v62_0, v65);
        return;
    end;
end;
local _ = function(_, v69) --[[ Line: 207 ]] --[[ Name: IsIdentifierName ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v70 = string.len(v69);
    if v70 == 0 then
        return false;
    elseif not v1[string.byte(v69, 1)] then
        return false;
    else
        local l_v2_0 = v2;
        for v72 = 2, v70 do
            if not l_v2_0[string.byte(v69, v72)] then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v89(v74, v75, v76) --[[ Line: 228 ]] --[[ Name: EncodeString ]]
    -- upvalues: v1 (copy), v2 (copy), v17 (copy), v0 (copy)
    local v77 = false;
    if v76 then
        local v78 = string.len(v75);
        local v79;
        if v78 == 0 then
            v79 = false;
        elseif not v1[string.byte(v75, 1)] then
            v79 = false;
        else
            local l_v2_1 = v2;
            for v81 = 2, v78 do
                if not l_v2_1[string.byte(v75, v81)] then
                    v79 = false;
                    v77 = true;
                end;
                if v77 then
                    break;
                end;
            end;
            if not v77 then
                v79 = true;
            end;
        end;
        v77 = false;
        if not v79 then
            v76 = false;
        end;
    end;
    local v82 = string.len(v75);
    local v83 = v17(v74, v82 * 6 + 2);
    local l_Buf_5 = v74.Buf;
    local l_QuoteChar_0 = v74.QuoteChar;
    if not v76 then
        buffer.writeu8(l_Buf_5, v83, l_QuoteChar_0);
        v83 = v83 + 1;
    end;
    for v86 = 1, v82 do
        local v87 = string.byte(v75, v86);
        if v87 > 31 then
            if v87 ~= l_QuoteChar_0 and v87 ~= 92 then
                buffer.writeu8(l_Buf_5, v83, v87);
                v83 = v83 + 1;
            else
                buffer.writeu16(l_Buf_5, v83, bit32.lshift(v87, 8) + 92);
                v83 = v83 + 2;
            end;
        else
            local v88 = v0[v87];
            if v88 < 0 then
                v88 = -v88;
                buffer.writeu32(l_Buf_5, v83, 808482140);
                v83 = v83 + 4;
            end;
            buffer.writeu16(l_Buf_5, v83, v88);
            v83 = v83 + 2;
        end;
    end;
    if not v76 then
        buffer.writeu8(l_Buf_5, v83, l_QuoteChar_0);
        v83 = v83 + 1;
    end;
    v74.Pos = v83;
end;
local function v99(v90, v91) --[[ Line: 278 ]] --[[ Name: EncodeBuffer ]]
    -- upvalues: v17 (copy), v0 (copy)
    local v92 = buffer.len(v91);
    local v93 = v17(v90, 2 + v92 * 6);
    local l_Buf_6 = v90.Buf;
    local l_QuoteChar_1 = v90.QuoteChar;
    buffer.writeu8(l_Buf_6, v93, l_QuoteChar_1);
    v93 = v93 + 1;
    for v96 = 0, v92 - 1 do
        local v97 = buffer.readu8(v91, v96);
        if v97 > 31 then
            if v97 ~= l_QuoteChar_1 and v97 ~= 92 then
                buffer.writeu8(l_Buf_6, v93, v97);
                v93 = v93 + 1;
            else
                buffer.writeu16(l_Buf_6, v93, bit32.lshift(v97, 8) + 92);
                v93 = v93 + 2;
            end;
        else
            local v98 = v0[v97];
            if v98 < 0 then
                v98 = -v98;
                buffer.writeu32(l_Buf_6, v93, 808482140);
                v93 = v93 + 4;
            end;
            buffer.writeu16(l_Buf_6, v93, v98);
            v93 = v93 + 2;
        end;
    end;
    buffer.writeu8(l_Buf_6, v93, l_QuoteChar_1);
    v90.Pos = v93 + 1;
end;
local function _(v100, v101) --[[ Line: 316 ]] --[[ Name: EncodeAny ]]
    if v101 == v100.Null then
        v101 = nil;
    end;
    v100.Encoders[typeof(v101)](v100, v101);
end;
local function v112(v103, v104) --[[ Line: 323 ]] --[[ Name: EncodeArray ]]
    -- upvalues: v17 (copy), v28 (copy)
    local l_Pretty_0 = v103.Pretty;
    local v106 = v17(v103, 1);
    buffer.writeu8(v103.Buf, v106, 91);
    if l_Pretty_0 then
        v103.Indent = v103.Indent + 1;
    end;
    for v107, v108 in ipairs(v104) do
        if v107 > 1 then
            local v109 = v17(v103, 1);
            buffer.writeu8(v103.Buf, v109, 44);
        end;
        if l_Pretty_0 then
            local v110 = v17(v103, 1);
            buffer.writeu8(v103.Buf, v110, 10);
            v28(v103);
        end;
        local l_v108_0 = v108;
        if l_v108_0 == v103.Null then
            l_v108_0 = nil;
        end;
        v103.Encoders[typeof(l_v108_0)](v103, l_v108_0);
    end;
    if l_Pretty_0 then
        v103.Indent = v103.Indent + -1;
        if #v104 > 0 then
            v106 = v17(v103, 1);
            buffer.writeu8(v103.Buf, v106, 10);
            v28(v103);
        end;
    end;
    v106 = v17(v103, 1);
    buffer.writeu8(v103.Buf, v106, 93);
end;
local function v128(v113, v114) --[[ Line: 350 ]] --[[ Name: EncodeMap ]]
    -- upvalues: v17 (copy), v28 (copy), v89 (copy)
    local v115 = {};
    for v116, _ in pairs(v114) do
        assert(type(v116) == "string");
        table.insert(v115, v116);
    end;
    table.sort(v115);
    local l_Pretty_1 = v113.Pretty;
    local l_UnquoteIdent_0 = v113.UnquoteIdent;
    local v120 = v17(v113, 1);
    buffer.writeu8(v113.Buf, v120, 123);
    if l_Pretty_1 then
        v113.Indent = v113.Indent + 1;
    end;
    for v121, v122 in ipairs(v115) do
        if v121 > 1 then
            local v123 = v17(v113, 1);
            buffer.writeu8(v113.Buf, v123, 44);
        end;
        if l_Pretty_1 then
            local v124 = v17(v113, 1);
            buffer.writeu8(v113.Buf, v124, 10);
            v28(v113);
        end;
        v89(v113, v122, l_UnquoteIdent_0);
        if l_Pretty_1 then
            local v125 = v17(v113, 2);
            buffer.writeu16(v113.Buf, v125, 8250);
        else
            local v126 = v17(v113, 1);
            buffer.writeu8(v113.Buf, v126, 58);
        end;
        local v127 = v114[v122];
        if v127 == v113.Null then
            v127 = nil;
        end;
        v113.Encoders[typeof(v127)](v113, v127);
    end;
    if l_Pretty_1 then
        v113.Indent = v113.Indent + -1;
        if #v115 > 0 then
            v120 = v17(v113, 1);
            buffer.writeu8(v113.Buf, v120, 10);
            v28(v113);
        end;
    end;
    v120 = v17(v113, 1);
    buffer.writeu8(v113.Buf, v120, 125);
end;
local function v131(v129, v130) --[[ Line: 389 ]] --[[ Name: EncodeTable ]]
    -- upvalues: v112 (copy), v128 (copy)
    if #v130 > 0 or next(v130) == nil then
        v112(v129, v130);
        return;
    else
        v128(v129, v130);
        return;
    end;
end;
local function v134(v132, v133) --[[ Line: 398 ]] --[[ Name: EncodeVector2 ]]
    -- upvalues: v112 (copy)
    v112(v132, {
        v133.X, 
        v133.Y
    });
end;
local function v137(v135, v136) --[[ Line: 402 ]] --[[ Name: EncodeVector3 ]]
    -- upvalues: v112 (copy)
    v112(v135, {
        v136.X, 
        v136.Y, 
        v136.Z
    });
end;
local function v140(v138, v139) --[[ Line: 406 ]] --[[ Name: EncodeVector2int16 ]]
    -- upvalues: v112 (copy)
    v112(v138, {
        v139.X, 
        v139.Y
    });
end;
local function v143(v141, v142) --[[ Line: 410 ]] --[[ Name: EncodeVector3int16 ]]
    -- upvalues: v112 (copy)
    v112(v141, {
        v142.X, 
        v142.Y, 
        v142.Z
    });
end;
local function v148(v144, v145) --[[ Line: 414 ]] --[[ Name: EncodeRegion3 ]]
    -- upvalues: v112 (copy)
    local v146 = v145.CFrame * (v145.Size * -0.5);
    local v147 = v145.CFrame * (v145.Size * 0.5);
    v112(v144, {
        v146.X, 
        v146.Y, 
        v146.Z, 
        v147.X, 
        v147.Y, 
        v147.Z
    });
end;
local function v151(v149, v150) --[[ Line: 420 ]] --[[ Name: EncodeRegion3int16 ]]
    -- upvalues: v112 (copy)
    v112(v149, {
        v150.Min.X, 
        v150.Min.Y, 
        v150.Min.Z, 
        v150.Max.X, 
        v150.Max.Y, 
        v150.Max.Z
    });
end;
local function v154(v152, v153) --[[ Line: 424 ]] --[[ Name: EncodeUDim ]]
    -- upvalues: v112 (copy)
    v112(v152, {
        v153.Scale, 
        v153.Offset
    });
end;
local function v157(v155, v156) --[[ Line: 428 ]] --[[ Name: EncodeUDim2 ]]
    -- upvalues: v112 (copy)
    v112(v155, {
        v156.X.Scale, 
        v156.X.Offset, 
        v156.Y.Scale, 
        v156.Y.Offset
    });
end;
local function v160(v158, v159) --[[ Line: 432 ]] --[[ Name: EncodeCFrame ]]
    -- upvalues: v112 (copy)
    v112(v158, {
        v159:GetComponents()
    });
end;
local function v163(v161, v162) --[[ Line: 436 ]] --[[ Name: EncodeColor3 ]]
    -- upvalues: v112 (copy)
    v112(v161, {
        math.round(v162.R * 255), 
        math.round(v162.G * 255), 
        (math.round(v162.B * 255))
    });
end;
local function v166(v164, v165) --[[ Line: 444 ]] --[[ Name: EncodeNumberRange ]]
    -- upvalues: v112 (copy)
    v112(v164, {
        v165.Min, 
        v165.Max
    });
end;
local function v169(v167, v168) --[[ Line: 448 ]] --[[ Name: EncodeRect ]]
    -- upvalues: v112 (copy)
    v112(v167, {
        v168.Min.X, 
        v168.Min.Y, 
        v168.Max.X, 
        v168.Max.Y
    });
end;
local function v172(v170, v171) --[[ Line: 452 ]] --[[ Name: EncodeEnumItem ]]
    -- upvalues: v67 (copy)
    v67(v170, v171.Value);
end;
local v173 = {
    ["nil"] = v47, 
    boolean = v53, 
    number = v67, 
    string = v89, 
    buffer = v99, 
    table = v131
};
local v174 = table.clone(v173);
v174.Vector2 = v134;
v174.Vector3 = v137;
v174.Vector2int16 = v140;
v174.Vector3int16 = v143;
v174.Region3 = v148;
v174.Region3int16 = v151;
v174.UDim = v154;
v174.UDim2 = v157;
v174.CFrame = v160;
v174.Color3 = v163;
v174.NumberRange = v166;
v174.Rect = v169;
v174.EnumItem = v172;
local v175 = buffer.create(4096);
local v176 = v6(v175);
v176.Encoders = v173;
local function v181(v177, v178) --[[ Line: 485 ]] --[[ Name: Compact ]]
    -- upvalues: v176 (copy), v8 (copy)
    local l_v176_0 = v176;
    l_v176_0.Pos = 0;
    l_v176_0.Null = v178;
    local l_v177_0 = v177;
    if l_v177_0 == l_v176_0.Null then
        l_v177_0 = nil;
    end;
    l_v176_0.Encoders[typeof(l_v177_0)](l_v176_0, l_v177_0);
    return v8(l_v176_0);
end;
local v182 = v6(v175);
v182.Encoders = v173;
v182.Pretty = true;
local function v187(v183, v184) --[[ Line: 496 ]] --[[ Name: Pretty ]]
    -- upvalues: v182 (copy), v8 (copy)
    local l_v182_0 = v182;
    l_v182_0.Pos = 0;
    l_v182_0.Indent = 0;
    l_v182_0.Null = v184;
    local l_v183_0 = v183;
    if l_v183_0 == l_v182_0.Null then
        l_v183_0 = nil;
    end;
    l_v182_0.Encoders[typeof(l_v183_0)](l_v182_0, l_v183_0);
    return v8(l_v182_0);
end;
local v188 = v6(v175);
v188.Encoders = v174;
local function v193(v189, v190) --[[ Line: 507 ]] --[[ Name: CompactExt ]]
    -- upvalues: v188 (copy), v8 (copy)
    local l_v188_0 = v188;
    l_v188_0.Pos = 0;
    l_v188_0.Null = v190;
    local l_v189_0 = v189;
    if l_v189_0 == l_v188_0.Null then
        l_v189_0 = nil;
    end;
    l_v188_0.Encoders[typeof(l_v189_0)](l_v188_0, l_v189_0);
    return v8(l_v188_0);
end;
local v194 = v6(v175);
v194.Encoders = v174;
v194.Pretty = true;
local function v199(v195, v196) --[[ Line: 518 ]] --[[ Name: PrettyExt ]]
    -- upvalues: v194 (copy), v8 (copy)
    local l_v194_0 = v194;
    l_v194_0.Pos = 0;
    l_v194_0.Indent = 0;
    l_v194_0.Null = v196;
    local l_v195_0 = v195;
    if l_v195_0 == l_v194_0.Null then
        l_v195_0 = nil;
    end;
    l_v194_0.Encoders[typeof(l_v195_0)](l_v194_0, l_v195_0);
    return v8(l_v194_0);
end;
local v200 = v6(v175);
v200.Encoders = v173;
v200.UnquoteIdent = true;
v200.QuoteChar = 39;
local function v205(v201, v202) --[[ Line: 532 ]] --[[ Name: Compact5 ]]
    -- upvalues: v200 (copy), v8 (copy)
    local l_v200_0 = v200;
    l_v200_0.Pos = 0;
    l_v200_0.Null = v202;
    local l_v201_0 = v201;
    if l_v201_0 == l_v200_0.Null then
        l_v201_0 = nil;
    end;
    l_v200_0.Encoders[typeof(l_v201_0)](l_v200_0, l_v201_0);
    return v8(l_v200_0);
end;
local v206 = v6(v175);
v206.Encoders = v173;
v206.Pretty = true;
v206.UnquoteIdent = true;
v206.QuoteChar = 39;
local v211 = {
    Compact = v181, 
    Pretty = v187, 
    CompactExt = v193, 
    PrettyExt = v199, 
    Compact5 = v205, 
    Pretty5 = function(v207, v208) --[[ Line: 545 ]] --[[ Name: Pretty5 ]]
        -- upvalues: v206 (copy), v8 (copy)
        local l_v206_0 = v206;
        l_v206_0.Pos = 0;
        l_v206_0.Indent = 0;
        l_v206_0.Null = v208;
        local l_v207_0 = v207;
        if l_v207_0 == l_v206_0.Null then
            l_v207_0 = nil;
        end;
        l_v206_0.Encoders[typeof(l_v207_0)](l_v206_0, l_v207_0);
        return v8(l_v206_0);
    end
};
return table.freeze(v211);