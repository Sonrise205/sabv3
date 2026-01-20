--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.UserGenerated.Randoms.Base);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.IO.Crypto.GenerateSeed);
local l_bxor_0 = bit32.bxor;
local l_bor_0 = bit32.bor;
local l_band_0 = bit32.band;
local l_lshift_0 = bit32.lshift;
local l_rshift_0 = bit32.rshift;
local _ = 1e999;
local _ = 3.141592653589793;
local l_floor_0 = math.floor;
local l_ldexp_0 = math.ldexp;
local l_sqrt_0 = math.sqrt;
local l_log_0 = math.log;
local l_max_0 = math.max;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_clamp_0 = math.clamp;
local l_create_0 = table.create;
local l_clone_0 = table.clone;
local l_format_0 = string.format;
local l_new_0 = Vector2.new;
local l_new_1 = Vector3.new;
assert(true);
local v23 = Random.new();
local function _(v24) --[[ Line: 45 ]] --[[ Name: IsInteger ]]
    -- upvalues: l_floor_0 (copy)
    local v25 = false;
    if type(v24) == "number" then
        v25 = false;
        if l_floor_0(v24) == v24 then
            v25 = false;
            if v24 ~= 1e999 then
                v25 = v24 ~= -1e999;
            end;
        end;
    end;
    return v25;
end;
local function _(v27) --[[ Line: 53 ]] --[[ Name: AssertIntegerNonNegative ]]
    -- upvalues: l_floor_0 (copy)
    local v28 = false;
    if type(v27) == "number" then
        v28 = false;
        if l_floor_0(v27) == v27 then
            v28 = false;
            if v27 ~= 1e999 then
                v28 = v27 ~= -1e999;
            end;
        end;
    end;
    if not v28 then
        error("Integer", 2);
    end;
    if v27 < 0 then
        error("NonNegative", 2);
    end;
end;
local function v39(v30) --[[ Line: 77 ]] --[[ Name: IsaacMix ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_bor_0 (copy), l_rshift_0 (copy)
    local v31 = v30[1];
    local v32 = v30[2];
    local v33 = v30[3];
    local v34 = v30[4];
    local v35 = v30[5];
    local v36 = v30[6];
    local v37 = v30[7];
    local v38 = v30[8];
    v31 = l_bxor_0(v31, (l_lshift_0(v32, 11)));
    v34 = l_bor_0(v34 + v31, 0);
    v32 = l_bxor_0(l_bor_0(v32 + v33, 0), (l_rshift_0(v33, 2)));
    v35 = l_bor_0(v35 + v32, 0);
    v33 = l_bxor_0(l_bor_0(v33 + v34, 0), (l_lshift_0(v34, 8)));
    v36 = l_bor_0(v36 + v33, 0);
    v34 = l_bxor_0(l_bor_0(v34 + v35, 0), (l_rshift_0(v35, 16)));
    v37 = l_bor_0(v37 + v34, 0);
    v35 = l_bxor_0(l_bor_0(v35 + v36, 0), (l_lshift_0(v36, 10)));
    v38 = l_bor_0(v38 + v35, 0);
    v36 = l_bxor_0(l_bor_0(v36 + v37, 0), (l_rshift_0(v37, 4)));
    v31 = l_bor_0(v31 + v36, 0);
    v37 = l_bxor_0(l_bor_0(v37 + v38, 0), (l_lshift_0(v38, 8)));
    v32 = l_bor_0(v32 + v37, 0);
    v38 = l_bxor_0(l_bor_0(v38 + v31, 0), (l_rshift_0(v31, 9)));
    v33 = l_bor_0(v33 + v38, 0);
    v30[1] = l_bor_0(v31 + v32, 0);
    v30[2] = v32;
    v30[3] = v33;
    v30[4] = v34;
    v30[5] = v35;
    v30[6] = v36;
    v30[7] = v37;
    v30[8] = v38;
end;
local function v50(v40) --[[ Line: 92 ]] --[[ Name: Isaac ]]
    -- upvalues: l_bor_0 (copy), l_band_0 (copy), l_rshift_0 (copy), l_bxor_0 (copy), l_lshift_0 (copy)
    local l_AA_0 = v40.AA;
    local l_BB_0 = v40.BB;
    local l_CC_0 = v40.CC;
    local l_MM_0 = v40.MM;
    local l_RSL_0 = v40.RSL;
    l_CC_0 = l_bor_0(l_CC_0 + 1, 0);
    l_BB_0 = l_bor_0(l_BB_0 + l_CC_0, 0);
    for v46 = 1, 256 do
        local v47 = l_MM_0[v46];
        local v48 = nil;
        local v49 = l_band_0(v46, 3);
        if v49 == 0 then
            l_AA_0 = l_bxor_0(l_AA_0, (l_rshift_0(l_AA_0, 16)));
        elseif v49 == 1 then
            l_AA_0 = l_bxor_0(l_AA_0, (l_lshift_0(l_AA_0, 13)));
        elseif v49 == 2 then
            l_AA_0 = l_bxor_0(l_AA_0, (l_rshift_0(l_AA_0, 6)));
        elseif v49 == 3 then
            l_AA_0 = l_bxor_0(l_AA_0, (l_lshift_0(l_AA_0, 2)));
        end;
        l_AA_0 = l_bor_0(l_MM_0[l_band_0(v46 + 127, 255) + 1] + l_AA_0, 0);
        v48 = l_bor_0(l_MM_0[l_band_0(l_rshift_0(v47, 2), 255) + 1] + l_AA_0 + l_BB_0, 0);
        l_MM_0[v46] = v48;
        l_BB_0 = l_bor_0(l_MM_0[l_band_0(l_rshift_0(v48, 10), 255) + 1] + v47, 0);
        l_RSL_0[v46] = l_BB_0;
    end;
    v40.AA = l_AA_0;
    v40.BB = l_BB_0;
    v40.CC = l_CC_0;
end;
local function v60(v51, v52) --[[ Line: 115 ]] --[[ Name: IsaacInit ]]
    -- upvalues: l_create_0 (copy), v39 (copy), l_bor_0 (copy)
    local v53 = 0;
    local v54 = 0;
    local v55 = 0;
    v51.AA = v53;
    v51.BB = v54;
    v51.CC = v55;
    v51.Count = 256;
    v53 = v51.MM;
    v54 = v51.RSL;
    v55 = l_create_0(8, 2654435769);
    v39(v55);
    v39(v55);
    v39(v55);
    v39(v55);
    for v56 = 0, 255, 8 do
        if v52 then
            for v57 = 1, 8 do
                v55[v57] = l_bor_0(v55[v57] + v54[v56 + v57], 0);
            end;
        end;
        v39(v55);
        v53[v56 + 1] = v55[1];
        v53[v56 + 2] = v55[2];
        v53[v56 + 3] = v55[3];
        v53[v56 + 4] = v55[4];
        v53[v56 + 5] = v55[5];
        v53[v56 + 6] = v55[6];
        v53[v56 + 7] = v55[7];
        v53[v56 + 8] = v55[8];
    end;
    if v52 then
        for v58 = 0, 255, 8 do
            for v59 = 1, 8 do
                v55[v59] = l_bor_0(v55[v59] + v53[v58 + v59], 0);
            end;
            v39(v55);
            v53[v58 + 1] = v55[1];
            v53[v58 + 2] = v55[2];
            v53[v58 + 3] = v55[3];
            v53[v58 + 4] = v55[4];
            v53[v58 + 5] = v55[5];
            v53[v58 + 6] = v55[6];
            v53[v58 + 7] = v55[7];
            v53[v58 + 8] = v55[8];
        end;
    end;
end;
local function v63(v61) --[[ Line: 152 ]] --[[ Name: NextU32 ]]
    -- upvalues: v50 (copy)
    local v62 = v61.Count + 1;
    if v62 > 256 then
        v62 = 1;
        v50(v61);
    end;
    v61.Count = v62;
    return v61.RSL[v62];
end;
local function v67(v64) --[[ Line: 162 ]] --[[ Name: NextU64 ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy)
    local v65 = v64.Count + 1;
    if v65 > 256 then
        v65 = 1;
        v50(v64);
    end;
    v64.Count = v65;
    local v66 = l_ldexp_0(v64.RSL[v65], 32);
    v65 = v64.Count + 1;
    if v65 > 256 then
        v65 = 1;
        v50(v64);
    end;
    v64.Count = v65;
    return v66 + v64.RSL[v65];
end;
local function v70(v68) --[[ Line: 166 ]] --[[ Name: NextFloat ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy)
    local v69 = v68.Count + 1;
    if v69 > 256 then
        v69 = 1;
        v50(v68);
    end;
    v68.Count = v69;
    return (l_ldexp_0(v68.RSL[v69], -32));
end;
local function v74(v71) --[[ Line: 170 ]] --[[ Name: NextDouble ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy)
    local v72 = v71.Count + 1;
    if v72 > 256 then
        v72 = 1;
        v50(v71);
    end;
    v71.Count = v72;
    local v73 = l_ldexp_0(v71.RSL[v72], 32);
    v72 = v71.Count + 1;
    if v72 > 256 then
        v72 = 1;
        v50(v71);
    end;
    v71.Count = v72;
    return (l_ldexp_0(v73 + v71.RSL[v72], -64));
end;
local function v81(v75, v76, v77) --[[ Line: 174 ]] --[[ Name: NextNumber ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy)
    local v78 = v77 - v76;
    local v79 = v75.Count + 1;
    if v79 > 256 then
        v79 = 1;
        v50(v75);
    end;
    v75.Count = v79;
    local v80 = l_ldexp_0(v75.RSL[v79], 32);
    v79 = v75.Count + 1;
    if v79 > 256 then
        v79 = 1;
        v50(v75);
    end;
    v75.Count = v79;
    return v76 + v78 * l_ldexp_0(v80 + v75.RSL[v79], -64);
end;
local function v88(v82, v83, v84) --[[ Line: 178 ]] --[[ Name: NextInteger ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy), l_floor_0 (copy)
    local v85 = v84 - v83 + 1;
    local v86 = v82.Count + 1;
    if v86 > 256 then
        v86 = 1;
        v50(v82);
    end;
    v82.Count = v86;
    local v87 = l_ldexp_0(v82.RSL[v86], 32);
    v86 = v82.Count + 1;
    if v86 > 256 then
        v86 = 1;
        v50(v82);
    end;
    v82.Count = v86;
    return (l_floor_0(v83 + v85 * l_ldexp_0(v87 + v82.RSL[v86], -64)));
end;
local function v99(v89, v90, v91) --[[ Line: 182 ]] --[[ Name: NextNormal ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy), l_max_0 (copy), l_log_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local v92 = 2.2250738585072014E-308;
    local v93 = v89.Count + 1;
    if v93 > 256 then
        v93 = 1;
        v50(v89);
    end;
    v89.Count = v93;
    local v94 = l_ldexp_0(v89.RSL[v93], 32);
    v93 = v89.Count + 1;
    if v93 > 256 then
        v93 = 1;
        v50(v89);
    end;
    v89.Count = v93;
    local v95 = l_sqrt_0(l_log_0((l_max_0(v92, (l_ldexp_0(v94 + v89.RSL[v93], -64))))) * -2) * (v91 or 0);
    local v96 = 6.283185307179586;
    local v97 = v89.Count + 1;
    if v97 > 256 then
        v97 = 1;
        v50(v89);
    end;
    v89.Count = v97;
    v92 = l_ldexp_0(v89.RSL[v97], 32);
    v97 = v89.Count + 1;
    if v97 > 256 then
        v97 = 1;
        v50(v89);
    end;
    v89.Count = v97;
    local v98 = v96 * l_ldexp_0(v92 + v89.RSL[v97], -64);
    v96 = v90 or 0;
    return l_cos_0(v98) * v95 + v96, l_sin_0(v98) * v95 + v96;
end;
local function v104(v100, v101) --[[ Line: 194 ]] --[[ Name: NextBoolean ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy)
    local v102 = v100.Count + 1;
    if v102 > 256 then
        v102 = 1;
        v50(v100);
    end;
    v100.Count = v102;
    local v103 = l_ldexp_0(v100.RSL[v102], 32);
    v102 = v100.Count + 1;
    if v102 > 256 then
        v102 = 1;
        v50(v100);
    end;
    v100.Count = v102;
    return l_ldexp_0(v103 + v100.RSL[v102], -64) < (v101 or 0.5);
end;
local function v112(v105, v106) --[[ Line: 198 ]] --[[ Name: NextVector2 ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy), l_new_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local v107 = v106 or 1;
    local v108 = 6.283185307179586;
    local v109 = v105.Count + 1;
    if v109 > 256 then
        v109 = 1;
        v50(v105);
    end;
    v105.Count = v109;
    local v110 = l_ldexp_0(v105.RSL[v109], 32);
    v109 = v105.Count + 1;
    if v109 > 256 then
        v109 = 1;
        v50(v105);
    end;
    v105.Count = v109;
    local v111 = v108 * l_ldexp_0(v110 + v105.RSL[v109], -64);
    return l_new_0(l_cos_0(v111) * v107, l_sin_0(v111) * v107);
end;
local function v123(v113, v114) --[[ Line: 207 ]] --[[ Name: NextVector3 ]]
    -- upvalues: v50 (copy), l_ldexp_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy), l_new_1 (copy)
    local v115 = v114 or 1;
    local v116 = 6.283185307179586;
    local v117 = v113.Count + 1;
    if v117 > 256 then
        v117 = 1;
        v50(v113);
    end;
    v113.Count = v117;
    local v118 = l_ldexp_0(v113.RSL[v117], 32);
    v117 = v113.Count + 1;
    if v117 > 256 then
        v117 = 1;
        v50(v113);
    end;
    v113.Count = v117;
    local v119 = v116 * l_ldexp_0(v118 + v113.RSL[v117], -64);
    local v120 = 2;
    local v121 = v113.Count + 1;
    if v121 > 256 then
        v121 = 1;
        v50(v113);
    end;
    v113.Count = v121;
    v117 = l_ldexp_0(v113.RSL[v121], 32);
    v121 = v113.Count + 1;
    if v121 > 256 then
        v121 = 1;
        v50(v113);
    end;
    v113.Count = v121;
    v116 = v120 * l_ldexp_0(v117 + v113.RSL[v121], -64) - 1;
    local v122 = l_sqrt_0(1 - v116 * v116);
    return (l_new_1(l_cos_0(v119) * v122 * v115, l_sin_0(v119) * v122 * v115, v116 * v115));
end;
local function v132(v124) --[[ Line: 219 ]] --[[ Name: NextUUIDv4 ]]
    -- upvalues: l_format_0 (copy), v50 (copy), l_band_0 (copy), l_bor_0 (copy)
    local l_l_format_0_0 = l_format_0;
    local v126 = "%08x%08x%08x%08x";
    local v127 = v124.Count + 1;
    if v127 > 256 then
        v127 = 1;
        v50(v124);
    end;
    v124.Count = v127;
    local v128 = v124.RSL[v127];
    local v129 = v124.Count + 1;
    if v129 > 256 then
        v129 = 1;
        v50(v124);
    end;
    v124.Count = v129;
    v127 = l_bor_0(l_band_0(v124.RSL[v129], 4294905855), 16384);
    local v130 = v124.Count + 1;
    if v130 > 256 then
        v130 = 1;
        v50(v124);
    end;
    v124.Count = v130;
    local v131 = l_bor_0(l_band_0(v124.RSL[v130], 1073741823), 2147483648);
    v129 = v124.Count + 1;
    if v129 > 256 then
        v129 = 1;
        v50(v124);
    end;
    v124.Count = v129;
    return l_l_format_0_0(v126, v128, v127, v131, v124.RSL[v129]);
end;
local function v143(v133, v134, v135) --[[ Line: 229 ]] --[[ Name: Seed ]]
    -- upvalues: v23 (copy), l_bor_0 (copy), v60 (copy)
    local v136 = nil;
    if v134 == nil then
        v136 = {
            v23:NextInteger(0, 4294967295)
        };
    elseif type(v134) == "number" then
        v136 = {
            v134
        };
    else
        assert(type(v134) == "table");
        v136 = v134;
    end;
    local v137 = true;
    if v135 ~= nil then
        assert(type(v135) == "boolean");
        v137 = v135;
    end;
    local v138 = math.min(256, #v136);
    local l_MM_1 = v133.MM;
    local l_RSL_1 = v133.RSL;
    for v141 = 1, 256 do
        l_MM_1[v141] = 0;
        l_RSL_1[v141] = 0;
    end;
    for v142 = 1, v138 do
        l_RSL_1[v142] = l_bor_0(v136[v142], 0);
    end;
    v60(v133, v137);
end;
local v154 = table.freeze({
    NextU32 = v63, 
    NextU64 = v67, 
    NextFloat = v70, 
    NextDouble = v74, 
    NextNumber = v81, 
    NextInteger = v88, 
    NextNormal = v99, 
    NextBoolean = v104, 
    NextVector2 = v112, 
    NextVector3 = v123, 
    NextUUIDv4 = v132, 
    Seed = v143, 
    Shuffle = function(v144, v145) --[[ Line: 260 ]] --[[ Name: Shuffle ]]
        -- upvalues: v50 (copy), l_ldexp_0 (copy), l_floor_0 (copy)
        assert(type(v145) == "table");
        for v146 = #v145, 2, -1 do
            local v147 = 1;
            local v148 = v146 - 1 + 1;
            local v149 = v144.Count + 1;
            if v149 > 256 then
                v149 = 1;
                v50(v144);
            end;
            v144.Count = v149;
            local v150 = l_ldexp_0(v144.RSL[v149], 32);
            v149 = v144.Count + 1;
            if v149 > 256 then
                v149 = 1;
                v50(v144);
            end;
            v144.Count = v149;
            local v151 = l_floor_0(v147 + v148 * l_ldexp_0(v150 + v144.RSL[v149], -64));
            local v152 = v145[v151];
            v147 = v145[v146];
            v145[v146] = v152;
            v145[v151] = v147;
        end;
    end, 
    Clone = function(v153) --[[ Line: 268 ]] --[[ Name: Clone ]]
        -- upvalues: l_clone_0 (copy)
        return (setmetatable({
            RSL = l_clone_0(v153.RSL), 
            Count = v153.Count, 
            MM = l_clone_0(v153.MM), 
            AA = v153.AA, 
            BB = v153.BB, 
            CC = v153.CC
        }, (getmetatable(v153))));
    end
});
local v155 = table.freeze({
    __index = v154
});
local v159 = {
    new = function(v156, v157) --[[ Line: 300 ]] --[[ Name: new ]]
        -- upvalues: l_create_0 (copy), v143 (copy), v155 (copy)
        local v158 = {
            RSL = l_create_0(256, 0), 
            Count = 0, 
            MM = l_create_0(256, 0), 
            AA = 0, 
            BB = 0, 
            CC = 0
        };
        v143(v158, v156, v157);
        return (setmetatable(v158, v155));
    end
};
v159.Unique = function(v160) --[[ Line: 316 ]] --[[ Name: Unique ]]
    -- upvalues: l_floor_0 (copy), l_clamp_0 (copy), v159 (copy), v2 (copy)
    if v160 ~= nil then
        local v161 = false;
        if type(v160) == "number" then
            v161 = false;
            if l_floor_0(v160) == v160 then
                v161 = false;
                if v160 ~= 1e999 then
                    v161 = v160 ~= -1e999;
                end;
            end;
        end;
        if not v161 then
            error("Integer", 2);
        end;
        if v160 < 0 then
            error("NonNegative", 2);
        end;
    end;
    local v162 = l_clamp_0(v160 or 32, 0, 256);
    return v159.new(v2(v162), true);
end;
v159.R = v159.Unique();
return table.freeze(v159);