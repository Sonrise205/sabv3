--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.UserGenerated.Randoms.Base);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.IO.Crypto.GenerateSeed);
local v3 = require(script.Theory);
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
local l_format_0 = string.format;
local l_new_0 = Vector2.new;
local l_new_1 = Vector3.new;
assert(true);
local v22 = Random.new();
local function _(v23, v24) --[[ Line: 44 ]] --[[ Name: Mul32 ]]
    -- upvalues: l_rshift_0 (copy), l_band_0 (copy), l_lshift_0 (copy)
    local v25 = l_rshift_0(v23, 16);
    local v26 = l_band_0(v23, 65535);
    local v27 = l_rshift_0(v24, 16);
    local v28 = l_band_0(v24, 65535);
    return l_lshift_0(l_band_0(v25 * v28 + v26 * v27, 65535), 16) + v26 * v28;
end;
local function _(v30) --[[ Line: 55 ]] --[[ Name: IsInteger ]]
    -- upvalues: l_floor_0 (copy)
    local v31 = false;
    if type(v30) == "number" then
        v31 = false;
        if l_floor_0(v30) == v30 then
            v31 = false;
            if v30 ~= 1e999 then
                v31 = v30 ~= -1e999;
            end;
        end;
    end;
    return v31;
end;
local function _(v33) --[[ Line: 62 ]] --[[ Name: AssertInteger ]]
    -- upvalues: l_floor_0 (copy)
    local v34 = false;
    if type(v33) == "number" then
        v34 = false;
        if l_floor_0(v33) == v33 then
            v34 = false;
            if v33 ~= 1e999 then
                v34 = v33 ~= -1e999;
            end;
        end;
    end;
    if not v34 then
        error("Integer", 2);
    end;
end;
local function _(v36) --[[ Line: 67 ]] --[[ Name: AssertIntegerNonNegative ]]
    -- upvalues: l_floor_0 (copy)
    local v37 = false;
    if type(v36) == "number" then
        v37 = false;
        if l_floor_0(v36) == v36 then
            v37 = false;
            if v36 ~= 1e999 then
                v37 = v36 ~= -1e999;
            end;
        end;
    end;
    if not v37 then
        error("Integer", 2);
    end;
    if v36 < 0 then
        error("NonNegative", 2);
    end;
end;
local function v44(v39) --[[ Line: 88 ]] --[[ Name: NextU32 ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy)
    local l_x_0 = v39.x;
    local l_w_0 = v39.w;
    l_x_0 = l_bxor_0(l_x_0, (l_lshift_0(l_x_0, 11)));
    l_x_0 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_0, (l_rshift_0(l_x_0, 8))), l_w_0), (l_rshift_0(l_w_0, 19)));
    local l_y_0 = v39.y;
    local l_z_0 = v39.z;
    v39.x = l_y_0;
    v39.y = l_z_0;
    v39.z = l_w_0;
    v39.w = l_x_0;
    return l_x_0;
end;
local function v51(v45) --[[ Line: 98 ]] --[[ Name: NextU64 ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy)
    local l_x_1 = v45.x;
    local l_w_1 = v45.w;
    l_x_1 = l_bxor_0(l_x_1, (l_lshift_0(l_x_1, 11)));
    l_x_1 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_1, (l_rshift_0(l_x_1, 8))), l_w_1), (l_rshift_0(l_w_1, 19)));
    local l_y_1 = v45.y;
    local l_z_1 = v45.z;
    v45.x = l_y_1;
    v45.y = l_z_1;
    v45.z = l_w_1;
    v45.w = l_x_1;
    local v50 = l_ldexp_0(l_x_1, 32);
    l_x_1 = v45.x;
    l_w_1 = v45.w;
    l_x_1 = l_bxor_0(l_x_1, (l_lshift_0(l_x_1, 11)));
    l_x_1 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_1, (l_rshift_0(l_x_1, 8))), l_w_1), (l_rshift_0(l_w_1, 19)));
    l_y_1 = v45.y;
    l_z_1 = v45.z;
    v45.x = l_y_1;
    v45.y = l_z_1;
    v45.z = l_w_1;
    v45.w = l_x_1;
    return v50 + l_x_1;
end;
local function v57(v52) --[[ Line: 102 ]] --[[ Name: NextFloat ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy)
    local l_x_2 = v52.x;
    local l_w_2 = v52.w;
    l_x_2 = l_bxor_0(l_x_2, (l_lshift_0(l_x_2, 11)));
    l_x_2 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_2, (l_rshift_0(l_x_2, 8))), l_w_2), (l_rshift_0(l_w_2, 19)));
    local l_y_2 = v52.y;
    local l_z_2 = v52.z;
    v52.x = l_y_2;
    v52.y = l_z_2;
    v52.z = l_w_2;
    v52.w = l_x_2;
    return (l_ldexp_0(l_x_2, -32));
end;
local function v64(v58) --[[ Line: 106 ]] --[[ Name: NextDouble ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy)
    local l_x_3 = v58.x;
    local l_w_3 = v58.w;
    l_x_3 = l_bxor_0(l_x_3, (l_lshift_0(l_x_3, 11)));
    l_x_3 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_3, (l_rshift_0(l_x_3, 8))), l_w_3), (l_rshift_0(l_w_3, 19)));
    local l_y_3 = v58.y;
    local l_z_3 = v58.z;
    v58.x = l_y_3;
    v58.y = l_z_3;
    v58.z = l_w_3;
    v58.w = l_x_3;
    local v63 = l_ldexp_0(l_x_3, 32);
    l_x_3 = v58.x;
    l_w_3 = v58.w;
    l_x_3 = l_bxor_0(l_x_3, (l_lshift_0(l_x_3, 11)));
    l_x_3 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_3, (l_rshift_0(l_x_3, 8))), l_w_3), (l_rshift_0(l_w_3, 19)));
    l_y_3 = v58.y;
    l_z_3 = v58.z;
    v58.x = l_y_3;
    v58.y = l_z_3;
    v58.z = l_w_3;
    v58.w = l_x_3;
    return (l_ldexp_0(v63 + l_x_3, -64));
end;
local function v74(v65, v66, v67) --[[ Line: 110 ]] --[[ Name: NextNumber ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy)
    local v68 = v67 - v66;
    local l_x_4 = v65.x;
    local l_w_4 = v65.w;
    l_x_4 = l_bxor_0(l_x_4, (l_lshift_0(l_x_4, 11)));
    l_x_4 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_4, (l_rshift_0(l_x_4, 8))), l_w_4), (l_rshift_0(l_w_4, 19)));
    local l_y_4 = v65.y;
    local l_z_4 = v65.z;
    v65.x = l_y_4;
    v65.y = l_z_4;
    v65.z = l_w_4;
    v65.w = l_x_4;
    local v73 = l_ldexp_0(l_x_4, 32);
    l_x_4 = v65.x;
    l_w_4 = v65.w;
    l_x_4 = l_bxor_0(l_x_4, (l_lshift_0(l_x_4, 11)));
    l_x_4 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_4, (l_rshift_0(l_x_4, 8))), l_w_4), (l_rshift_0(l_w_4, 19)));
    l_y_4 = v65.y;
    l_z_4 = v65.z;
    v65.x = l_y_4;
    v65.y = l_z_4;
    v65.z = l_w_4;
    v65.w = l_x_4;
    return v66 + v68 * l_ldexp_0(v73 + l_x_4, -64);
end;
local function v84(v75, v76, v77) --[[ Line: 114 ]] --[[ Name: NextInteger ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy), l_floor_0 (copy)
    local v78 = v77 - v76 + 1;
    local l_x_5 = v75.x;
    local l_w_5 = v75.w;
    l_x_5 = l_bxor_0(l_x_5, (l_lshift_0(l_x_5, 11)));
    l_x_5 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_5, (l_rshift_0(l_x_5, 8))), l_w_5), (l_rshift_0(l_w_5, 19)));
    local l_y_5 = v75.y;
    local l_z_5 = v75.z;
    v75.x = l_y_5;
    v75.y = l_z_5;
    v75.z = l_w_5;
    v75.w = l_x_5;
    local v83 = l_ldexp_0(l_x_5, 32);
    l_x_5 = v75.x;
    l_w_5 = v75.w;
    l_x_5 = l_bxor_0(l_x_5, (l_lshift_0(l_x_5, 11)));
    l_x_5 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_5, (l_rshift_0(l_x_5, 8))), l_w_5), (l_rshift_0(l_w_5, 19)));
    l_y_5 = v75.y;
    l_z_5 = v75.z;
    v75.x = l_y_5;
    v75.y = l_z_5;
    v75.z = l_w_5;
    v75.w = l_x_5;
    return (l_floor_0(v76 + v78 * l_ldexp_0(v83 + l_x_5, -64)));
end;
local function v99(v85, v86, v87) --[[ Line: 118 ]] --[[ Name: NextNormal ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy), l_max_0 (copy), l_log_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local v88 = 2.2250738585072014E-308;
    local l_x_6 = v85.x;
    local l_w_6 = v85.w;
    l_x_6 = l_bxor_0(l_x_6, (l_lshift_0(l_x_6, 11)));
    l_x_6 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_6, (l_rshift_0(l_x_6, 8))), l_w_6), (l_rshift_0(l_w_6, 19)));
    local l_y_6 = v85.y;
    local l_z_6 = v85.z;
    v85.x = l_y_6;
    v85.y = l_z_6;
    v85.z = l_w_6;
    v85.w = l_x_6;
    local v93 = l_ldexp_0(l_x_6, 32);
    l_x_6 = v85.x;
    l_w_6 = v85.w;
    l_x_6 = l_bxor_0(l_x_6, (l_lshift_0(l_x_6, 11)));
    l_x_6 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_6, (l_rshift_0(l_x_6, 8))), l_w_6), (l_rshift_0(l_w_6, 19)));
    l_y_6 = v85.y;
    l_z_6 = v85.z;
    v85.x = l_y_6;
    v85.y = l_z_6;
    v85.z = l_w_6;
    v85.w = l_x_6;
    local v94 = l_sqrt_0(l_log_0((l_max_0(v88, (l_ldexp_0(v93 + l_x_6, -64))))) * -2) * (v87 or 0);
    local v95 = 6.283185307179586;
    local l_x_7 = v85.x;
    v93 = v85.w;
    l_x_7 = l_bxor_0(l_x_7, (l_lshift_0(l_x_7, 11)));
    l_x_7 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_7, (l_rshift_0(l_x_7, 8))), v93), (l_rshift_0(v93, 19)));
    local l_y_7 = v85.y;
    l_x_6 = v85.z;
    v85.x = l_y_7;
    v85.y = l_x_6;
    v85.z = v93;
    v85.w = l_x_7;
    v88 = l_ldexp_0(l_x_7, 32);
    l_x_7 = v85.x;
    v93 = v85.w;
    l_x_7 = l_bxor_0(l_x_7, (l_lshift_0(l_x_7, 11)));
    l_x_7 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_7, (l_rshift_0(l_x_7, 8))), v93), (l_rshift_0(v93, 19)));
    l_y_7 = v85.y;
    l_x_6 = v85.z;
    v85.x = l_y_7;
    v85.y = l_x_6;
    v85.z = v93;
    v85.w = l_x_7;
    local v98 = v95 * l_ldexp_0(v88 + l_x_7, -64);
    v95 = v86 or 0;
    return l_cos_0(v98) * v94 + v95, l_sin_0(v98) * v94 + v95;
end;
local function v107(v100, v101) --[[ Line: 130 ]] --[[ Name: NextBoolean ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy)
    local l_x_8 = v100.x;
    local l_w_7 = v100.w;
    l_x_8 = l_bxor_0(l_x_8, (l_lshift_0(l_x_8, 11)));
    l_x_8 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_8, (l_rshift_0(l_x_8, 8))), l_w_7), (l_rshift_0(l_w_7, 19)));
    local l_y_8 = v100.y;
    local l_z_7 = v100.z;
    v100.x = l_y_8;
    v100.y = l_z_7;
    v100.z = l_w_7;
    v100.w = l_x_8;
    local v106 = l_ldexp_0(l_x_8, 32);
    l_x_8 = v100.x;
    l_w_7 = v100.w;
    l_x_8 = l_bxor_0(l_x_8, (l_lshift_0(l_x_8, 11)));
    l_x_8 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_8, (l_rshift_0(l_x_8, 8))), l_w_7), (l_rshift_0(l_w_7, 19)));
    l_y_8 = v100.y;
    l_z_7 = v100.z;
    v100.x = l_y_8;
    v100.y = l_z_7;
    v100.z = l_w_7;
    v100.w = l_x_8;
    return l_ldexp_0(v106 + l_x_8, -64) < (v101 or 0.5);
end;
local function v118(v108, v109) --[[ Line: 134 ]] --[[ Name: NextVector2 ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy), l_new_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local v110 = v109 or 1;
    local v111 = 6.283185307179586;
    local l_x_9 = v108.x;
    local l_w_8 = v108.w;
    l_x_9 = l_bxor_0(l_x_9, (l_lshift_0(l_x_9, 11)));
    l_x_9 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_9, (l_rshift_0(l_x_9, 8))), l_w_8), (l_rshift_0(l_w_8, 19)));
    local l_y_9 = v108.y;
    local l_z_8 = v108.z;
    v108.x = l_y_9;
    v108.y = l_z_8;
    v108.z = l_w_8;
    v108.w = l_x_9;
    local v116 = l_ldexp_0(l_x_9, 32);
    l_x_9 = v108.x;
    l_w_8 = v108.w;
    l_x_9 = l_bxor_0(l_x_9, (l_lshift_0(l_x_9, 11)));
    l_x_9 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_9, (l_rshift_0(l_x_9, 8))), l_w_8), (l_rshift_0(l_w_8, 19)));
    l_y_9 = v108.y;
    l_z_8 = v108.z;
    v108.x = l_y_9;
    v108.y = l_z_8;
    v108.z = l_w_8;
    v108.w = l_x_9;
    local v117 = v111 * l_ldexp_0(v116 + l_x_9, -64);
    return l_new_0(l_cos_0(v117) * v110, l_sin_0(v117) * v110);
end;
local function v133(v119, v120) --[[ Line: 143 ]] --[[ Name: NextVector3 ]]
    -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy), l_new_1 (copy)
    local v121 = v120 or 1;
    local v122 = 6.283185307179586;
    local l_x_10 = v119.x;
    local l_w_9 = v119.w;
    l_x_10 = l_bxor_0(l_x_10, (l_lshift_0(l_x_10, 11)));
    l_x_10 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_10, (l_rshift_0(l_x_10, 8))), l_w_9), (l_rshift_0(l_w_9, 19)));
    local l_y_10 = v119.y;
    local l_z_9 = v119.z;
    v119.x = l_y_10;
    v119.y = l_z_9;
    v119.z = l_w_9;
    v119.w = l_x_10;
    local v127 = l_ldexp_0(l_x_10, 32);
    l_x_10 = v119.x;
    l_w_9 = v119.w;
    l_x_10 = l_bxor_0(l_x_10, (l_lshift_0(l_x_10, 11)));
    l_x_10 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_10, (l_rshift_0(l_x_10, 8))), l_w_9), (l_rshift_0(l_w_9, 19)));
    l_y_10 = v119.y;
    l_z_9 = v119.z;
    v119.x = l_y_10;
    v119.y = l_z_9;
    v119.z = l_w_9;
    v119.w = l_x_10;
    local v128 = v122 * l_ldexp_0(v127 + l_x_10, -64);
    local v129 = 2;
    l_y_10 = v119.x;
    l_z_9 = v119.w;
    l_y_10 = l_bxor_0(l_y_10, (l_lshift_0(l_y_10, 11)));
    l_y_10 = l_bxor_0(l_bxor_0(l_bxor_0(l_y_10, (l_rshift_0(l_y_10, 8))), l_z_9), (l_rshift_0(l_z_9, 19)));
    local l_y_11 = v119.y;
    local l_z_10 = v119.z;
    v119.x = l_y_11;
    v119.y = l_z_10;
    v119.z = l_z_9;
    v119.w = l_y_10;
    l_x_10 = l_ldexp_0(l_y_10, 32);
    l_y_10 = v119.x;
    l_z_9 = v119.w;
    l_y_10 = l_bxor_0(l_y_10, (l_lshift_0(l_y_10, 11)));
    l_y_10 = l_bxor_0(l_bxor_0(l_bxor_0(l_y_10, (l_rshift_0(l_y_10, 8))), l_z_9), (l_rshift_0(l_z_9, 19)));
    l_y_11 = v119.y;
    l_z_10 = v119.z;
    v119.x = l_y_11;
    v119.y = l_z_10;
    v119.z = l_z_9;
    v119.w = l_y_10;
    v122 = v129 * l_ldexp_0(l_x_10 + l_y_10, -64) - 1;
    local v132 = l_sqrt_0(1 - v122 * v122);
    return (l_new_1(l_cos_0(v128) * v132 * v121, l_sin_0(v128) * v132 * v121, v122 * v121));
end;
local function v146(v134) --[[ Line: 155 ]] --[[ Name: NextUUIDv4 ]]
    -- upvalues: l_format_0 (copy), l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_band_0 (copy), l_bor_0 (copy)
    local l_l_format_0_0 = l_format_0;
    local v136 = "%08x%08x%08x%08x";
    local l_x_11 = v134.x;
    local l_w_10 = v134.w;
    l_x_11 = l_bxor_0(l_x_11, (l_lshift_0(l_x_11, 11)));
    l_x_11 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_11, (l_rshift_0(l_x_11, 8))), l_w_10), (l_rshift_0(l_w_10, 19)));
    local l_y_12 = v134.y;
    local l_z_11 = v134.z;
    v134.x = l_y_12;
    v134.y = l_z_11;
    v134.z = l_w_10;
    v134.w = l_x_11;
    local l_l_x_11_0 = l_x_11;
    l_z_11 = v134.x;
    local l_w_11 = v134.w;
    l_z_11 = l_bxor_0(l_z_11, (l_lshift_0(l_z_11, 11)));
    l_z_11 = l_bxor_0(l_bxor_0(l_bxor_0(l_z_11, (l_rshift_0(l_z_11, 8))), l_w_11), (l_rshift_0(l_w_11, 19)));
    local l_y_13 = v134.y;
    local l_z_12 = v134.z;
    v134.x = l_y_13;
    v134.y = l_z_12;
    v134.z = l_w_11;
    v134.w = l_z_11;
    l_x_11 = l_bor_0(l_band_0(l_z_11, 4294905855), 16384);
    l_w_11 = v134.x;
    l_y_13 = v134.w;
    l_w_11 = l_bxor_0(l_w_11, (l_lshift_0(l_w_11, 11)));
    l_w_11 = l_bxor_0(l_bxor_0(l_bxor_0(l_w_11, (l_rshift_0(l_w_11, 8))), l_y_13), (l_rshift_0(l_y_13, 19)));
    l_z_12 = v134.y;
    local l_z_13 = v134.z;
    v134.x = l_z_12;
    v134.y = l_z_13;
    v134.z = l_y_13;
    v134.w = l_w_11;
    l_w_10 = l_bor_0(l_band_0(l_w_11, 1073741823), 2147483648);
    l_z_11 = v134.x;
    l_w_11 = v134.w;
    l_z_11 = l_bxor_0(l_z_11, (l_lshift_0(l_z_11, 11)));
    l_z_11 = l_bxor_0(l_bxor_0(l_bxor_0(l_z_11, (l_rshift_0(l_z_11, 8))), l_w_11), (l_rshift_0(l_w_11, 19)));
    l_y_13 = v134.y;
    l_z_12 = v134.z;
    v134.x = l_y_13;
    v134.y = l_z_12;
    v134.z = l_w_11;
    v134.w = l_z_11;
    return l_l_format_0_0(v136, l_l_x_11_0, l_x_11, l_w_10, l_z_11);
end;
local function v163(v147, v148) --[[ Line: 165 ]] --[[ Name: Seed ]]
    -- upvalues: v22 (copy), l_bor_0 (copy), l_rshift_0 (copy), l_band_0 (copy), l_lshift_0 (copy)
    local v149 = nil;
    v149 = if v148 == nil then {} else if type(v148) == "number" then {
        v148
    } else v148;
    local v150 = v149[1];
    local v151 = v149[2];
    local v152 = v149[3];
    local v153 = v149[4];
    if not v150 then
        v150 = v22:NextInteger(0, 4294967295);
    end;
    v150 = l_bor_0(v150, 0);
    if not v151 then
        local l_v150_0 = v150;
        local v155 = l_rshift_0(l_v150_0, 16);
        local v156 = l_band_0(l_v150_0, 65535);
        v151 = l_lshift_0(l_band_0(v156 * 27655 + v155 * 35173, 65535), 16) + v156 * 35173 + 1;
    end;
    v151 = l_bor_0(v151, 0);
    if not v152 then
        local l_v151_0 = v151;
        local v158 = l_rshift_0(l_v151_0, 16);
        local v159 = l_band_0(l_v151_0, 65535);
        v152 = l_lshift_0(l_band_0(v159 * 27655 + v158 * 35173, 65535), 16) + v159 * 35173 + 1;
    end;
    v152 = l_bor_0(v152, 0);
    if not v153 then
        local l_v152_0 = v152;
        local v161 = l_rshift_0(l_v152_0, 16);
        local v162 = l_band_0(l_v152_0, 65535);
        v153 = l_lshift_0(l_band_0(v162 * 27655 + v161 * 35173, 65535), 16) + v162 * 35173 + 1;
    end;
    v153 = l_bor_0(v153, 0);
    v147.x = v150;
    v147.y = v151;
    v147.z = v152;
    v147.w = v153;
end;
local v184 = table.freeze({
    NextU32 = v44, 
    NextU64 = v51, 
    NextFloat = v57, 
    NextDouble = v64, 
    NextNumber = v74, 
    NextInteger = v84, 
    NextNormal = v99, 
    NextBoolean = v107, 
    NextVector2 = v118, 
    NextVector3 = v133, 
    NextUUIDv4 = v146, 
    Seed = v163, 
    Shuffle = function(v164, v165) --[[ Line: 196 ]] --[[ Name: Shuffle ]]
        -- upvalues: l_lshift_0 (copy), l_bxor_0 (copy), l_rshift_0 (copy), l_ldexp_0 (copy), l_floor_0 (copy)
        assert(type(v165) == "table");
        for v166 = #v165, 2, -1 do
            local v167 = 1;
            local v168 = v166 - 1 + 1;
            local l_x_12 = v164.x;
            local l_w_12 = v164.w;
            l_x_12 = l_bxor_0(l_x_12, (l_lshift_0(l_x_12, 11)));
            l_x_12 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_12, (l_rshift_0(l_x_12, 8))), l_w_12), (l_rshift_0(l_w_12, 19)));
            local l_y_14 = v164.y;
            local l_z_14 = v164.z;
            v164.x = l_y_14;
            v164.y = l_z_14;
            v164.z = l_w_12;
            v164.w = l_x_12;
            local v173 = l_ldexp_0(l_x_12, 32);
            l_x_12 = v164.x;
            l_w_12 = v164.w;
            l_x_12 = l_bxor_0(l_x_12, (l_lshift_0(l_x_12, 11)));
            l_x_12 = l_bxor_0(l_bxor_0(l_bxor_0(l_x_12, (l_rshift_0(l_x_12, 8))), l_w_12), (l_rshift_0(l_w_12, 19)));
            l_y_14 = v164.y;
            l_z_14 = v164.z;
            v164.x = l_y_14;
            v164.y = l_z_14;
            v164.z = l_w_12;
            v164.w = l_x_12;
            local v174 = l_floor_0(v167 + v168 * l_ldexp_0(v173 + l_x_12, -64));
            local v175 = v165[v174];
            v167 = v165[v166];
            v165[v166] = v175;
            v165[v174] = v167;
        end;
    end, 
    Clone = function(v176) --[[ Line: 204 ]] --[[ Name: Clone ]]
        return (setmetatable({
            x = v176.x, 
            y = v176.y, 
            z = v176.z, 
            w = v176.w
        }, (getmetatable(v176))));
    end, 
    GetState = function(v177) --[[ Line: 214 ]] --[[ Name: GetState ]]
        return {
            v177.x, 
            v177.y, 
            v177.z, 
            v177.w
        };
    end, 
    Skip = function(v178, v179) --[[ Line: 218 ]] --[[ Name: Skip ]]
        -- upvalues: l_floor_0 (copy), v3 (copy)
        local v180 = false;
        if type(v179) == "number" then
            v180 = false;
            if l_floor_0(v179) == v179 then
                v180 = false;
                if v179 ~= 1e999 then
                    v180 = v179 ~= -1e999;
                end;
            end;
        end;
        if not v180 then
            error("Integer", 2);
        end;
        local v181, v182, v183;
        v180, v181, v182, v183 = v3.Transform(v178.x, v178.y, v178.z, v178.w, v179);
        v178.x = v180;
        v178.y = v181;
        v178.z = v182;
        v178.w = v183;
    end
});
local v185 = table.freeze({
    __index = v184
});
local v188 = {
    new = function(v186) --[[ Line: 246 ]] --[[ Name: new ]]
        -- upvalues: v163 (copy), v185 (copy)
        local v187 = {
            x = 0, 
            y = 0, 
            z = 0, 
            w = 0
        };
        v163(v187, v186);
        return (setmetatable(v187, v185));
    end
};
v188.Unique = function(v189) --[[ Line: 257 ]] --[[ Name: Unique ]]
    -- upvalues: l_floor_0 (copy), l_clamp_0 (copy), v188 (copy), v2 (copy)
    if v189 ~= nil then
        local v190 = false;
        if type(v189) == "number" then
            v190 = false;
            if l_floor_0(v189) == v189 then
                v190 = false;
                if v189 ~= 1e999 then
                    v190 = v189 ~= -1e999;
                end;
            end;
        end;
        if not v190 then
            error("Integer", 2);
        end;
        if v189 < 0 then
            error("NonNegative", 2);
        end;
    end;
    local v191 = l_clamp_0(v189 or 4, 0, 4);
    return v188.new(v2(v191));
end;
v188.R = v188.Unique();
return table.freeze(v188);