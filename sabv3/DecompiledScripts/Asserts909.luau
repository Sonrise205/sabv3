--!native
local function _(v0, v1) --[[ Line: 23 ]] --[[ Name: IsEqual ]]
    if rawequal(v0, v1) then
        return true;
    elseif type(v0) == "number" and type(v1) == "number" and v0 ~= v0 and v1 ~= v1 then
        return true;
    else
        return false;
    end;
end;
local function _(v3) --[[ Line: 37 ]] --[[ Name: IsASCII ]]
    for v4 = 1, string.len(v3) do
        local v5 = string.byte(v3, v4);
        if v5 < 32 or v5 > 126 then
            return false;
        end;
    end;
    return true;
end;
local function _(v7) --[[ Line: 49 ]] --[[ Name: IsFinite ]]
    local v8 = false;
    if v7 == v7 then
        v8 = false;
        if v7 ~= 1e999 then
            v8 = v7 ~= -1e999;
        end;
    end;
    return v8;
end;
local function _(v10) --[[ Line: 55 ]] --[[ Name: IsInteger ]]
    local v11 = false;
    if math.floor(v10) == v10 then
        v11 = false;
        if v10 ~= 1e999 then
            v11 = v10 ~= -1e999;
        end;
    end;
    return v11;
end;
local function v28(v13) --[[ Line: 59 ]] --[[ Name: IsCFrameFinite ]]
    local l_v13_Components_0, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25 = v13:GetComponents();
    local v26 = l_v13_Components_0 + v15 + v16 + v17 + v18 + v19 + v20 + v21 + v22 + v23 + v24 + v25;
    local v27 = false;
    if v26 == v26 then
        v27 = false;
        if v26 ~= 1e999 then
            v27 = v26 ~= -1e999;
        end;
    end;
    return v27;
end;
local function v32(v29) --[[ Line: 67 ]] --[[ Name: IsVector2Finite ]]
    local v30 = v29.X + v29.Y;
    local v31 = false;
    if v30 == v30 then
        v31 = false;
        if v30 ~= 1e999 then
            v31 = v30 ~= -1e999;
        end;
    end;
    return v31;
end;
local function v36(v33) --[[ Line: 71 ]] --[[ Name: IsVector3Finite ]]
    local v34 = v33.X + v33.Y + v33.Z;
    local v35 = false;
    if v34 == v34 then
        v35 = false;
        if v34 ~= 1e999 then
            v35 = v34 ~= -1e999;
        end;
    end;
    return v35;
end;
local _ = function(v37) --[[ Line: 76 ]] --[[ Name: LuaString ]]
    local v38, _ = string.format("%q", v37):gsub("\n", "n");
    return v38;
end;
local _ = function(v41) --[[ Line: 81 ]] --[[ Name: StringRep ]]
    if type(v41) == "string" then
        local v42, _ = string.format("%q", v41):gsub("\n", "n");
        return v42;
    elseif typeof(v41) == "Instance" then
        return v41:GetFullName();
    else
        return (tostring(v41));
    end;
end;
local function v57(v45) --[[ Line: 90 ]] --[[ Name: SafeKeyStringRep ]]
    local v46 = false;
    if type(v45) == "number" or type(v45) == "boolean" then
        return (("%*"):format(v45));
    elseif type(v45) == "string" then
        local v47 = utf8.len(v45);
        if not v47 then
            return "InvalidUTF8";
        else
            local v48;
            for v49 = 1, string.len(v45) do
                local v50 = string.byte(v45, v49);
                if v50 < 32 or v50 > 126 then
                    v48 = false;
                    v46 = true;
                end;
                if v46 then
                    break;
                end;
            end;
            if not v46 then
                v48 = true;
            end;
            v46 = false;
            if not v48 then
                return "NonASCII";
            elseif v47 > 30 then
                local v51 = "%*...%*";
                local v52 = string.sub(v45, 1, 30);
                local v53, _ = string.format("%q", v52):gsub("\n", "n");
                return (v51:format(v53, v47 - 30));
            else
                local v55, _ = string.format("%q", v45):gsub("\n", "n");
                return v55;
            end;
        end;
    elseif typeof(v45) == "Instance" then
        return v45:GetFullName();
    else
        return (("UnknownType(%*)"):format((typeof(v45))));
    end;
end;
local function _(v58) --[[ Line: 111 ]] --[[ Name: StripErrorSource ]]
    local v59 = tostring(v58);
    local v60, v61 = string.match(v59, "^(.*:%d+): (.+)$");
    if v60 and v61 then
        v59 = v61;
    end;
    return v59;
end;
local function _(v63) --[[ Line: 122 ]] --[[ Name: ParseError ]]
    local v64 = tostring(v63);
    local v65, v66 = string.match(v64, "^(.*:%d+): (.+)$");
    if v65 and v66 then
        v64 = v66;
    end;
    local l_v64_0 = v64;
    v64, v65 = string.match(l_v64_0, "^(.+) $(%[.+)$");
    if v64 and v65 then
        l_v64_0 = v64;
    end;
    return l_v64_0, v65;
end;
local function _(v69, v70) --[[ Line: 134 ]] --[[ Name: MakeError ]]
    return (("%* $%*"):format(v69, v70));
end;
local v72 = {
    IsCFrameFinite = v28, 
    IsVector2Finite = v32, 
    IsVector3Finite = v36
};
v72.Array = function(v73) --[[ Line: 145 ]] --[[ Name: Array ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.Function(v73);
    return function(v74) --[[ Line: 149 ]]
        -- upvalues: v57 (ref), v73 (copy)
        if type(v74) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v74) ~= nil then
            error("metatable", 2);
        end;
        local v75 = rawlen(v74);
        local v76 = 0;
        for v77, v78 in pairs(v74) do
            v76 = v76 + 1;
            if v77 ~= v76 then
                error(("IndexMismatch $%*"):format((("[%*]"):format((v57(v77))))), 2);
            end;
            if v75 < v76 then
                error(("IndexOverflow $%*"):format((("[%*]"):format(v76))), 2);
            end;
            local l_status_0, l_result_0 = pcall(v73, v78);
            if not l_status_0 then
                local v81 = tostring(l_result_0);
                local v82, v83 = string.match(v81, "^(.*:%d+): (.+)$");
                if v82 and v83 then
                    v81 = v83;
                end;
                local l_v81_0 = v81;
                v81, v82 = string.match(l_v81_0, "^(.+) $(%[.+)$");
                if v81 and v82 then
                    l_v81_0 = v81;
                end;
                error(("%* $%*"):format(l_v81_0, (("[%*]%*"):format(v76, v82 or ""))), 2);
            end;
        end;
        if v75 ~= v76 then
            error("LengthMismatch", 2);
        end;
        return v74;
    end;
end;
v72.ArrayCoerce = function(v85) --[[ Line: 179 ]] --[[ Name: ArrayCoerce ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.Function(v85);
    return function(v86) --[[ Line: 183 ]]
        -- upvalues: v57 (ref), v85 (copy)
        if type(v86) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v86) ~= nil then
            error("metatable", 2);
        end;
        local v87 = rawlen(v86);
        local v88 = 0;
        local v89 = {};
        for v90, v91 in pairs(v86) do
            v88 = v88 + 1;
            if v90 ~= v88 then
                error(("IndexMismatch $%*"):format((("[%*]"):format((v57(v90))))), 2);
            end;
            if v87 < v88 then
                error(("IndexOverflow $%*"):format((("[%*]"):format(v88))), 2);
            end;
            local l_status_1, l_result_1 = pcall(v85, v91);
            if not l_status_1 then
                local v94 = tostring(l_result_1);
                local v95, v96 = string.match(v94, "^(.*:%d+): (.+)$");
                if v95 and v96 then
                    v94 = v96;
                end;
                local l_v94_0 = v94;
                v94, v95 = string.match(l_v94_0, "^(.+) $(%[.+)$");
                if v94 and v95 then
                    l_v94_0 = v94;
                end;
                error(("%* $%*"):format(l_v94_0, (("[%*]%*"):format(v88, v95 or ""))), 2);
            end;
            v89[v90] = l_result_1;
        end;
        if v87 ~= v88 then
            error("LengthMismatch", 2);
        end;
        return v89;
    end;
end;
v72.UniqueArray = function(v98) --[[ Line: 215 ]] --[[ Name: UniqueArray ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.Function(v98);
    return function(v99) --[[ Line: 219 ]]
        -- upvalues: v57 (ref), v98 (copy)
        if type(v99) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v99) ~= nil then
            error("metatable", 2);
        end;
        local v100 = {};
        local v101 = rawlen(v99);
        local v102 = 0;
        for v103, v104 in pairs(v99) do
            v102 = v102 + 1;
            if v103 ~= v102 then
                error(("IndexMismatch $%*"):format((("[%*]"):format((v57(v103))))), 2);
            end;
            if v101 < v102 then
                error(("IndexOverflow $%*"):format((("[%*]"):format(v102))), 2);
            end;
            if v100[v104] then
                error(("UniqueArray $%*"):format((("[%*]"):format(v102))), 2);
            end;
            v100[v104] = true;
            if not v100[v104] then
                error(("InvalidKey $%*"):format((("[%*]"):format(v102))), 2);
            end;
            local l_status_2, l_result_2 = pcall(v98, v104);
            if not l_status_2 then
                local v107 = tostring(l_result_2);
                local v108, v109 = string.match(v107, "^(.*:%d+): (.+)$");
                if v108 and v109 then
                    v107 = v109;
                end;
                local l_v107_0 = v107;
                v107, v108 = string.match(l_v107_0, "^(.+) $(%[.+)$");
                if v107 and v108 then
                    l_v107_0 = v107;
                end;
                error(("%* $%*"):format(l_v107_0, (("[%*]%*"):format(v102, v108 or ""))), 2);
            end;
        end;
        if v101 ~= v102 then
            error("LengthMismatch", 2);
        end;
        return v99;
    end;
end;
v72.UniqueArrayCoerce = function(v111) --[[ Line: 257 ]] --[[ Name: UniqueArrayCoerce ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.Function(v111);
    return function(v112) --[[ Line: 261 ]]
        -- upvalues: v57 (ref), v111 (copy)
        if type(v112) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v112) ~= nil then
            error("metatable", 2);
        end;
        local v113 = {};
        local v114 = rawlen(v112);
        local v115 = 0;
        local v116 = {};
        for v117, v118 in pairs(v112) do
            v115 = v115 + 1;
            if v117 ~= v115 then
                error(("IndexMismatch $%*"):format((("[%*]"):format((v57(v117))))), 2);
            end;
            if v114 < v115 then
                error(("IndexOverflow $%*"):format((("[%*]"):format(v115))), 2);
            end;
            if v113[v118] then
                error(("UniqueArray $%*"):format((("[%*]"):format(v115))), 2);
            end;
            v113[v118] = true;
            if not v113[v118] then
                error(("InvalidKey $%*"):format((("[%*]"):format(v115))), 2);
            end;
            local l_status_3, l_result_3 = pcall(v111, v118);
            if not l_status_3 then
                local v121 = tostring(l_result_3);
                local v122, v123 = string.match(v121, "^(.*:%d+): (.+)$");
                if v122 and v123 then
                    v121 = v123;
                end;
                local l_v121_0 = v121;
                v121, v122 = string.match(l_v121_0, "^(.+) $(%[.+)$");
                if v121 and v122 then
                    l_v121_0 = v121;
                end;
                error(("%* $%*"):format(l_v121_0, (("[%*]%*"):format(v115, v122 or ""))), 2);
            end;
            v116[v117] = l_result_3;
        end;
        if v114 ~= v115 then
            error("LengthMismatch", 2);
        end;
        return v116;
    end;
end;
v72.Map = function(v125, v126, v127) --[[ Line: 302 ]] --[[ Name: Map ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.Function(v125);
    v72.Function(v126);
    v72.Optional(v72.IntegerPositive)(v127);
    local v128 = v127 or 1e999;
    return function(v129) --[[ Line: 312 ]]
        -- upvalues: v128 (copy), v125 (copy), v57 (ref), v126 (copy)
        if type(v129) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v129) ~= nil then
            error("metatable", 2);
        end;
        local v130 = 0;
        for v131, v132 in pairs(v129) do
            v130 = v130 + 1;
            if v128 < v130 then
                error(("LengthLimit(%*)"):format(v128), 2);
            end;
            local l_status_4, l_result_4 = pcall(v125, v131);
            if not l_status_4 then
                local v135 = tostring(l_result_4);
                local v136, v137 = string.match(v135, "^(.*:%d+): (.+)$");
                if v136 and v137 then
                    v135 = v137;
                end;
                local l_v135_0 = v135;
                v135, v136 = string.match(l_v135_0, "^(.+) $(%[.+)$");
                if v135 and v136 then
                    l_v135_0 = v135;
                end;
                error(("%* $%*"):format(l_v135_0, (("<%*>%*"):format(v57(v131), v136 or ""))), 2);
            end;
            local l_status_5, l_result_5 = pcall(v126, v132);
            if not l_status_5 then
                local v141 = tostring(l_result_5);
                local v142, v143 = string.match(v141, "^(.*:%d+): (.+)$");
                if v142 and v143 then
                    v141 = v143;
                end;
                local l_v141_0 = v141;
                v141, v142 = string.match(l_v141_0, "^(.+) $(%[.+)$");
                if v141 and v142 then
                    l_v141_0 = v141;
                end;
                error(("%* $%*"):format(l_v141_0, (("[%*]%*"):format(v57(v131), v142 or ""))), 2);
            end;
        end;
        return v129;
    end;
end;
v72.MapCoerce = function(v145, v146, v147) --[[ Line: 347 ]] --[[ Name: MapCoerce ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.Function(v145);
    v72.Function(v146);
    v72.Optional(v72.IntegerPositive)(v147);
    local v148 = v147 or 1e999;
    return function(v149) --[[ Line: 357 ]]
        -- upvalues: v148 (copy), v145 (copy), v57 (ref), v146 (copy)
        if type(v149) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v149) ~= nil then
            error("metatable", 2);
        end;
        local v150 = 0;
        local v151 = {};
        for v152, v153 in pairs(v149) do
            v150 = v150 + 1;
            if v148 < v150 then
                error(("LengthLimit(%*)"):format(v148), 2);
            end;
            local l_status_6, l_result_6 = pcall(v145, v152);
            if not l_status_6 then
                local v156 = tostring(l_result_6);
                local v157, v158 = string.match(v156, "^(.*:%d+): (.+)$");
                if v157 and v158 then
                    v156 = v158;
                end;
                local l_v156_0 = v156;
                v156, v157 = string.match(l_v156_0, "^(.+) $(%[.+)$");
                if v156 and v157 then
                    l_v156_0 = v156;
                end;
                error(("%* $%*"):format(l_v156_0, (("<%*>%*"):format(v57(v152), v157 or ""))), 2);
            end;
            local l_status_7, l_result_7 = pcall(v146, v153);
            if not l_status_7 then
                local v162 = tostring(l_result_7);
                local v163, v164 = string.match(v162, "^(.*:%d+): (.+)$");
                if v163 and v164 then
                    v162 = v164;
                end;
                local l_v162_0 = v162;
                v162, v163 = string.match(l_v162_0, "^(.+) $(%[.+)$");
                if v162 and v163 then
                    l_v162_0 = v162;
                end;
                error(("%* $%*"):format(l_v162_0, (("[%*]%*"):format(v57(v152), v163 or ""))), 2);
            end;
            v151[l_result_6] = l_result_7;
        end;
        return v151;
    end;
end;
v72.Table = function(v166) --[[ Line: 394 ]] --[[ Name: Table ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.NoMetatable(v166);
    for _, v168 in pairs(v166) do
        v72.Function(v168);
    end;
    v166 = table.clone(v166);
    return function(v169) --[[ Line: 403 ]]
        -- upvalues: v166 (ref), v57 (ref)
        if type(v169) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v169) ~= nil then
            error("metatable", 2);
        end;
        if rawlen(v166) ~= rawlen(v169) then
            error("LengthMismatch", 2);
        end;
        for v170, _ in pairs(v169) do
            if not v166[v170] then
                error(("UnknownKey $%*"):format((("[%*]"):format((v57(v170))))), 2);
            end;
        end;
        for v172, v173 in pairs(v166) do
            local v174 = v169[v172];
            local l_status_8, l_result_8 = pcall(v173, v174);
            if not l_status_8 then
                local v177 = tostring(l_result_8);
                local v178, v179 = string.match(v177, "^(.*:%d+): (.+)$");
                if v178 and v179 then
                    v177 = v179;
                end;
                local l_v177_0 = v177;
                v177, v178 = string.match(l_v177_0, "^(.+) $(%[.+)$");
                if v177 and v178 then
                    l_v177_0 = v177;
                end;
                local l_l_v177_0_0 = l_v177_0;
                local l_v178_0 = v178;
                l_v177_0 = error;
                v179 = "[%*]%*";
                local v183;
                if type(v172) == "string" then
                    local v184, _ = string.format("%q", v172):gsub("\n", "n");
                    v183 = v184;
                else
                    v183 = if typeof(v172) == "Instance" then v172:GetFullName() else tostring(v172);
                end;
                l_v177_0(("%* $%*"):format(l_l_v177_0_0, (v179:format(v183, l_v178_0 or ""))), 2);
            end;
        end;
        return v169;
    end;
end;
v72.TablePermissive = function(v186) --[[ Line: 431 ]] --[[ Name: TablePermissive ]]
    -- upvalues: v72 (copy)
    v72.NoMetatable(v186);
    for _, v188 in pairs(v186) do
        v72.Function(v188);
    end;
    v186 = table.clone(v186);
    return function(v189) --[[ Line: 440 ]]
        -- upvalues: v186 (ref)
        if type(v189) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v189) ~= nil then
            error("metatable", 2);
        end;
        if rawlen(v186) ~= rawlen(v189) then
            error("LengthMismatch", 2);
        end;
        for v190, v191 in pairs(v186) do
            local v192 = v189[v190];
            local l_status_9, l_result_9 = pcall(v191, v192);
            if not l_status_9 then
                local v195 = tostring(l_result_9);
                local v196, v197 = string.match(v195, "^(.*:%d+): (.+)$");
                if v196 and v197 then
                    v195 = v197;
                end;
                local l_v195_0 = v195;
                v195, v196 = string.match(l_v195_0, "^(.+) $(%[.+)$");
                if v195 and v196 then
                    l_v195_0 = v195;
                end;
                local l_l_v195_0_0 = l_v195_0;
                local l_v196_0 = v196;
                l_v195_0 = error;
                v197 = "[%*]%*";
                local v201;
                if type(v190) == "string" then
                    local v202, _ = string.format("%q", v190):gsub("\n", "n");
                    v201 = v202;
                else
                    v201 = if typeof(v190) == "Instance" then v190:GetFullName() else tostring(v190);
                end;
                l_v195_0(("%* $%*"):format(l_l_v195_0_0, (v197:format(v201, l_v196_0 or ""))), 2);
            end;
        end;
        return v189;
    end;
end;
v72.TableCoerce = function(v204) --[[ Line: 469 ]] --[[ Name: TableCoerce ]]
    -- upvalues: v72 (copy), v57 (copy)
    v72.NoMetatable(v204);
    for _, v206 in pairs(v204) do
        v72.Function(v206);
    end;
    v204 = table.clone(v204);
    return function(v207) --[[ Line: 478 ]]
        -- upvalues: v204 (ref), v57 (ref)
        if type(v207) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v207) ~= nil then
            error("metatable", 2);
        end;
        if rawlen(v204) ~= rawlen(v207) then
            error("LengthMismatch", 2);
        end;
        local v208 = {};
        for v209, _ in pairs(v207) do
            if not v204[v209] then
                error(("UnknownKey $%*"):format((("[%*]"):format((v57(v209))))), 2);
            end;
        end;
        for v211, v212 in pairs(v204) do
            local v213 = v207[v211];
            local l_status_10, l_result_10 = pcall(v212, v213);
            if not l_status_10 then
                local v216 = tostring(l_result_10);
                local v217, v218 = string.match(v216, "^(.*:%d+): (.+)$");
                if v217 and v218 then
                    v216 = v218;
                end;
                local l_v216_0 = v216;
                v216, v217 = string.match(l_v216_0, "^(.+) $(%[.+)$");
                if v216 and v217 then
                    l_v216_0 = v216;
                end;
                local l_l_v216_0_0 = l_v216_0;
                local l_v217_0 = v217;
                l_v216_0 = error;
                v218 = "[%*]%*";
                local v222;
                if type(v211) == "string" then
                    local v223, _ = string.format("%q", v211):gsub("\n", "n");
                    v222 = v223;
                else
                    v222 = if typeof(v211) == "Instance" then v211:GetFullName() else tostring(v211);
                end;
                l_v216_0(("%* $%*"):format(l_l_v216_0_0, (v218:format(v222, l_v217_0 or ""))), 2);
            end;
            v208[v211] = l_result_10;
        end;
        return v208;
    end;
end;
v72.IsASCII = function(v225) --[[ Line: 508 ]] --[[ Name: IsASCII ]]
    local v226 = false;
    if type(v225) == "string" then
        for v227 = 1, string.len(v225) do
            local v228 = string.byte(v225, v227);
            if v228 < 32 or v228 > 126 then
                return false;
            end;
        end;
        v226 = true;
    end;
    return v226;
end;
v72.IsFinite = function(v229) --[[ Line: 511 ]] --[[ Name: IsFinite ]]
    local v230 = false;
    if type(v229) == "number" then
        v230 = false;
        if v229 == v229 then
            v230 = false;
            if v229 ~= 1e999 then
                v230 = v229 ~= -1e999;
            end;
        end;
    end;
    return v230;
end;
v72.IsInteger = function(v231) --[[ Line: 514 ]] --[[ Name: IsInteger ]]
    local v232 = false;
    if type(v231) == "number" then
        v232 = false;
        if math.floor(v231) == v231 then
            v232 = false;
            if v231 ~= 1e999 then
                v232 = v231 ~= -1e999;
            end;
        end;
    end;
    return v232;
end;
v72.IsCFrameFinite = function(v233) --[[ Line: 517 ]] --[[ Name: IsCFrameFinite ]]
    local v234 = false;
    if typeof(v233) == "CFrame" then
        local l_v233_Components_0, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246 = v233:GetComponents();
        local v247 = l_v233_Components_0 + v236 + v237 + v238 + v239 + v240 + v241 + v242 + v243 + v244 + v245 + v246;
        v234 = false;
        if v247 == v247 then
            v234 = false;
            if v247 ~= 1e999 then
                v234 = v247 ~= -1e999;
            end;
        end;
    end;
    return v234;
end;
v72.IsVector2Finite = function(v248) --[[ Line: 520 ]] --[[ Name: IsVector2Finite ]]
    local v249 = false;
    if typeof(v248) == "Vector2" then
        local v250 = v248.X + v248.Y;
        v249 = false;
        if v250 == v250 then
            v249 = false;
            if v250 ~= 1e999 then
                v249 = v250 ~= -1e999;
            end;
        end;
    end;
    return v249;
end;
v72.Optional = function(v251) --[[ Line: 524 ]] --[[ Name: Optional ]]
    if type(v251) ~= "function" then
        error("function", 2);
    end;
    return function(v252) --[[ Line: 526 ]]
        -- upvalues: v251 (copy)
        if v252 == nil then
            return nil;
        else
            local l_status_11, l_result_11 = pcall(v251, v252);
            if not l_status_11 then
                local l_error_0 = error;
                local v256 = tostring(l_result_11);
                local v257, v258 = string.match(v256, "^(.*:%d+): (.+)$");
                if v257 and v258 then
                    v256 = v258;
                end;
                l_error_0(v256, 2);
            end;
            return l_result_11;
        end;
    end;
end;
v72.Default = function(v259, v260) --[[ Line: 538 ]] --[[ Name: Default ]]
    if type(v259) ~= "function" then
        error("function", 2);
    end;
    local v261 = v259(v260);
    return function(v262) --[[ Line: 544 ]]
        -- upvalues: v261 (copy), v259 (copy)
        if v262 == nil then
            return v261;
        else
            local l_status_12, l_result_12 = pcall(v259, v262);
            if not l_status_12 then
                local l_error_1 = error;
                local v266 = tostring(l_result_12);
                local v267, v268 = string.match(v266, "^(.*:%d+): (.+)$");
                if v267 and v268 then
                    v266 = v268;
                end;
                l_error_1(v266, 2);
            end;
            return l_result_12;
        end;
    end;
end;
v72.AnyOf = function(...) --[[ Line: 556 ]] --[[ Name: AnyOf ]]
    local v269 = table.pack(...);
    for v270 = 1, v269.n do
        assert(type(v269[v270]) == "function", "function");
    end;
    assert(v269.n > 0);
    return function(v271) --[[ Line: 562 ]]
        -- upvalues: v269 (copy)
        for v272 = 1, v269.n do
            local l_status_13, l_result_13 = pcall(v269[v272], v271);
            if l_status_13 then
                return l_result_13;
            end;
        end;
        error("AnyOf", 2);
    end;
end;
v72.AllOf = function(...) --[[ Line: 573 ]] --[[ Name: AllOf ]]
    local v275 = table.pack(...);
    for v276 = 1, v275.n do
        assert(type(v275[v276]) == "function", "function");
    end;
    assert(v275.n > 0);
    return function(v277) --[[ Line: 579 ]]
        -- upvalues: v275 (copy)
        for v278 = 1, v275.n do
            local l_status_14, l_result_14 = pcall(v275[v278], v277);
            if not l_status_14 then
                local l_error_2 = error;
                local v282 = tostring(l_result_14);
                local v283, v284 = string.match(v282, "^(.*:%d+): (.+)$");
                if v283 and v284 then
                    v282 = v284;
                end;
                l_error_2(v282, 2);
            end;
        end;
        return v277;
    end;
end;
v72.AnyTable = function(v285) --[[ Line: 591 ]] --[[ Name: AnyTable ]]
    if type(v285) ~= "table" then
        error("table", 2);
    end;
    return v285;
end;
v72.Number = function(v286) --[[ Line: 597 ]] --[[ Name: Number ]]
    if type(v286) ~= "number" then
        error("number", 2);
    end;
    return v286;
end;
v72.Boolean = function(v287) --[[ Line: 603 ]] --[[ Name: Boolean ]]
    if type(v287) ~= "boolean" then
        error("boolean", 2);
    end;
    return v287;
end;
v72.Buffer = function(v288) --[[ Line: 609 ]] --[[ Name: Buffer ]]
    if type(v288) ~= "buffer" then
        error("buffer", 2);
    end;
    return v288;
end;
v72.Function = function(v289) --[[ Line: 615 ]] --[[ Name: Function ]]
    if type(v289) ~= "function" then
        error("function", 2);
    end;
    return v289;
end;
v72.Thread = function(v290) --[[ Line: 621 ]] --[[ Name: Thread ]]
    if type(v290) ~= "thread" then
        error("thread", 2);
    end;
    return v290;
end;
v72.String = function(v291) --[[ Line: 628 ]] --[[ Name: String ]]
    if type(v291) ~= "string" then
        error("string", 2);
    end;
    if not utf8.len(v291) then
        error("UTF8", 2);
    end;
    return v291;
end;
v72.RawString = function(v292) --[[ Line: 638 ]] --[[ Name: RawString ]]
    if type(v292) ~= "string" then
        error("string", 2);
    end;
    return v292;
end;
v72.Any = function(v293) --[[ Line: 645 ]] --[[ Name: Any ]]
    return v293;
end;
v72.Equals = function(v294) --[[ Line: 649 ]] --[[ Name: Equals ]]
    return function(v295) --[[ Line: 650 ]]
        -- upvalues: v294 (copy)
        local l_v294_0 = v294;
        if not (rawequal(v295, l_v294_0) and true or type(v295) == "number" and type(l_v294_0) == "number" and v295 ~= v295 and l_v294_0 ~= l_v294_0) then
            error("Equals", 2);
        end;
        return v295;
    end;
end;
v72.Set = function(v297) --[[ Line: 656 ]] --[[ Name: Set ]]
    -- upvalues: v72 (copy)
    v72.Array(v72.Any);
    local v298 = {};
    for _, v300 in ipairs(v297) do
        if v300 ~= v300 then
            error("InvalidKeyNaN", 2);
        end;
        v298[v300] = true;
        if not v298[v300] then
            error("InvalidKey", 2);
        end;
    end;
    return function(v301) --[[ Line: 668 ]]
        -- upvalues: v298 (copy)
        if not v298[v301] then
            error("Set", 2);
        end;
        return v301;
    end;
end;
v72.Pattern = function(v302) --[[ Line: 674 ]] --[[ Name: Pattern ]]
    -- upvalues: v72 (copy)
    v72.String(v302);
    return function(v303) --[[ Line: 676 ]]
        -- upvalues: v302 (copy)
        if type(v303) ~= "string" then
            error("string", 2);
        end;
        if not utf8.len(v303) then
            error("UTF8", 2);
        end;
        if not string.find(v303, v302) then
            error("Pattern", 2);
        end;
        return v303;
    end;
end;
v72.NoMetatable = function(v304) --[[ Line: 684 ]] --[[ Name: NoMetatable ]]
    if type(v304) ~= "table" then
        error("table", 2);
    end;
    if getmetatable(v304) ~= nil then
        error("metatable", 2);
    end;
    return v304;
end;
v72.Finite = function(v305) --[[ Line: 691 ]] --[[ Name: Finite ]]
    if type(v305) ~= "number" then
        error("number", 2);
    end;
    local v306 = false;
    if v305 == v305 then
        v306 = false;
        if v305 ~= 1e999 then
            v306 = v305 ~= -1e999;
        end;
    end;
    if not v306 then
        error("Finite", 2);
    end;
    return v305;
end;
v72.FinitePositive = function(v307) --[[ Line: 698 ]] --[[ Name: FinitePositive ]]
    if type(v307) ~= "number" then
        error("number", 2);
    end;
    local v308 = false;
    if v307 == v307 then
        v308 = false;
        if v307 ~= 1e999 then
            v308 = v307 ~= -1e999;
        end;
    end;
    if not v308 then
        error("Finite", 2);
    end;
    if v307 <= 0 then
        error("Positive", 2);
    end;
    return v307;
end;
v72.FiniteNonNegative = function(v309) --[[ Line: 706 ]] --[[ Name: FiniteNonNegative ]]
    if type(v309) ~= "number" then
        error("number", 2);
    end;
    local v310 = false;
    if v309 == v309 then
        v310 = false;
        if v309 ~= 1e999 then
            v310 = v309 ~= -1e999;
        end;
    end;
    if not v310 then
        error("Finite", 2);
    end;
    if v309 < 0 then
        error("NonNegative", 2);
    end;
    return v309;
end;
v72.Positive = function(v311) --[[ Line: 714 ]] --[[ Name: Positive ]]
    if type(v311) ~= "number" then
        error("number", 2);
    end;
    if v311 <= 0 then
        error("Positive", 2);
    end;
    return v311;
end;
v72.NonNegative = function(v312) --[[ Line: 721 ]] --[[ Name: NonNegative ]]
    if type(v312) ~= "number" then
        error("number", 2);
    end;
    if v312 < 0 then
        error("NonNegative", 2);
    end;
    return v312;
end;
v72.Real = function(v313) --[[ Line: 728 ]] --[[ Name: Real ]]
    if type(v313) ~= "number" then
        error("number", 2);
    end;
    if v313 ~= v313 then
        error("Real", 2);
    end;
    return v313;
end;
v72.Range = function(v314, v315) --[[ Line: 735 ]] --[[ Name: Range ]]
    -- upvalues: v72 (copy)
    v72.Real(v314);
    v72.Real(v315);
    if v314 > v315 then
        error("a<=b", 2);
    end;
    return function(v316) --[[ Line: 739 ]]
        -- upvalues: v314 (copy), v315 (copy)
        if type(v316) ~= "number" then
            error("number", 2);
        end;
        if v314 > v316 or v316 > v315 then
            error(("Range(%*,%*)"):format(v314, v315), 2);
        end;
        return v316;
    end;
end;
v72.Integer = function(v317) --[[ Line: 747 ]] --[[ Name: Integer ]]
    if type(v317) ~= "number" then
        error("number", 2);
    end;
    local v318 = false;
    if math.floor(v317) == v317 then
        v318 = false;
        if v317 ~= 1e999 then
            v318 = v317 ~= -1e999;
        end;
    end;
    if not v318 then
        error("Integer", 2);
    end;
    return v317;
end;
v72.Unsigned32 = function(v319) --[[ Line: 754 ]] --[[ Name: Unsigned32 ]]
    if bit32.bor(v319, 0) ~= v319 then
        error("Unsigned32", 2);
    end;
    return v319;
end;
v72.IntegerPositive = function(v320) --[[ Line: 761 ]] --[[ Name: IntegerPositive ]]
    if type(v320) ~= "number" then
        error("number", 2);
    end;
    local v321 = false;
    if math.floor(v320) == v320 then
        v321 = false;
        if v320 ~= 1e999 then
            v321 = v320 ~= -1e999;
        end;
    end;
    if not v321 then
        error("Integer", 2);
    end;
    if v320 < 1 then
        error("Positive", 2);
    end;
    return v320;
end;
v72.Index = function(v322) --[[ Line: 769 ]] --[[ Name: Index ]]
    if type(v322) ~= "number" then
        error("number", 2);
    end;
    local v323 = false;
    if math.floor(v322) == v322 then
        v323 = false;
        if v322 ~= 1e999 then
            v323 = v322 ~= -1e999;
        end;
    end;
    if not v323 then
        error("Integer", 2);
    end;
    if v322 < 1 then
        error("Positive", 2);
    end;
    return v322;
end;
v72.IntegerNonNegative = function(v324) --[[ Line: 777 ]] --[[ Name: IntegerNonNegative ]]
    if type(v324) ~= "number" then
        error("number", 2);
    end;
    local v325 = false;
    if math.floor(v324) == v324 then
        v325 = false;
        if v324 ~= 1e999 then
            v325 = v324 ~= -1e999;
        end;
    end;
    if not v325 then
        error("Integer", 2);
    end;
    if v324 < 0 then
        error("NonNegative", 2);
    end;
    return v324;
end;
v72.IntegerRange = function(v326, v327) --[[ Line: 785 ]] --[[ Name: IntegerRange ]]
    -- upvalues: v72 (copy)
    v72.Integer(v326);
    v72.Integer(v327);
    if v326 > v327 then
        error("a<=b", 2);
    end;
    return function(v328) --[[ Line: 789 ]]
        -- upvalues: v326 (copy), v327 (copy)
        if type(v328) ~= "number" then
            error("number", 2);
        end;
        local v329 = false;
        if math.floor(v328) == v328 then
            v329 = false;
            if v328 ~= 1e999 then
                v329 = v328 ~= -1e999;
            end;
        end;
        if not v329 then
            error("Integer", 2);
        end;
        if v326 > v328 or v328 > v327 then
            error(("Range(%*,%*)"):format(v326, v327), 2);
        end;
        return v328;
    end;
end;
v72.UInt32 = function() --[[ Line: 797 ]] --[[ Name: UInt32 ]]
    return function(v330) --[[ Line: 798 ]]
        if type(v330) ~= "number" then
            error("number", 2);
        end;
        if bit32.bor(v330, 0) ~= v330 then
            error("UInt32", 2);
        end;
        return v330;
    end;
end;
v72.StringRange = function(v331, v332) --[[ Line: 806 ]] --[[ Name: StringRange ]]
    -- upvalues: v72 (copy)
    v72.Integer(v331);
    v72.Integer(v332);
    if v331 > v332 then
        error("a<=b", 2);
    end;
    return function(v333) --[[ Line: 810 ]]
        -- upvalues: v331 (copy), v332 (copy)
        if type(v333) ~= "string" then
            error("string", 2);
        end;
        local v334 = utf8.len(v333);
        if not v334 then
            error("UTF8", 2);
        end;
        if v331 > v334 or v334 > v332 then
            error(("StringRange(%*,%*)"):format(v331, v332), 2);
        end;
        return v333;
    end;
end;
v72.ASCII = function(v335) --[[ Line: 823 ]] --[[ Name: ASCII ]]
    if type(v335) ~= "string" then
        error("string", 2);
    end;
    for v336 = 1, string.len(v335) do
        local v337 = string.byte(v335, v336);
        if v337 < 32 or v337 > 126 then
            error("ASCII", 2);
        end;
    end;
    return v335;
end;
v72.ASCIIRange = function(v338, v339) --[[ Line: 835 ]] --[[ Name: ASCIIRange ]]
    -- upvalues: v72 (copy)
    v72.Integer(v338);
    v72.Integer(v339);
    if v338 > v339 then
        error("a<=b", 2);
    end;
    return function(v340) --[[ Line: 839 ]]
        -- upvalues: v338 (copy), v339 (copy)
        if type(v340) ~= "string" then
            error("string", 2);
        end;
        local v341 = string.len(v340);
        if v338 > v341 or v341 > v339 then
            error(("ASCIIRange(%*,%*)"):format(v338, v339), 2);
        end;
        for v342 = 1, v341 do
            local v343 = string.byte(v340, v342);
            if v343 < 32 or v343 > 126 then
                error("ASCII", 2);
            end;
        end;
        return v340;
    end;
end;
v72.CFrame = function(v344) --[[ Line: 855 ]] --[[ Name: CFrame ]]
    if typeof(v344) ~= "CFrame" then
        error("CFrame", 2);
    end;
    return v344;
end;
v72.CFrameFinite = function(v345) --[[ Line: 861 ]] --[[ Name: CFrameFinite ]]
    if typeof(v345) ~= "CFrame" then
        error("CFrame", 2);
    end;
    local l_v345_Components_0, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357 = v345:GetComponents();
    local v358 = l_v345_Components_0 + v347 + v348 + v349 + v350 + v351 + v352 + v353 + v354 + v355 + v356 + v357;
    local v359 = false;
    if v358 == v358 then
        v359 = false;
        if v358 ~= 1e999 then
            v359 = v358 ~= -1e999;
        end;
    end;
    if not v359 then
        error("CFrameFinite", 2);
    end;
    return v345;
end;
v72.Vector2 = function(v360) --[[ Line: 870 ]] --[[ Name: Vector2 ]]
    if typeof(v360) ~= "Vector2" then
        error("Vector2", 2);
    end;
    return v360;
end;
v72.Vector2Finite = function(v361) --[[ Line: 876 ]] --[[ Name: Vector2Finite ]]
    if typeof(v361) ~= "Vector2" then
        error("Vector2", 2);
    end;
    local v362 = v361.X + v361.Y;
    local v363 = false;
    if v362 == v362 then
        v363 = false;
        if v362 ~= 1e999 then
            v363 = v362 ~= -1e999;
        end;
    end;
    if not v363 then
        error("Vector2Finite", 2);
    end;
    return v361;
end;
v72.Vector2Unit = function(v364) --[[ Line: 885 ]] --[[ Name: Vector2Unit ]]
    if typeof(v364) ~= "Vector2" then
        error("Vector2", 2);
    end;
    local v365 = v364.X + v364.Y;
    local v366 = false;
    if v365 == v365 then
        v366 = false;
        if v365 ~= 1e999 then
            v366 = v365 ~= -1e999;
        end;
    end;
    if not v366 then
        error("Vector2Finite", 2);
    end;
    if math.abs(v364.Magnitude - 1) > 1.0E-6 then
        error("Vector2Unit", 2);
    end;
    return v364;
end;
v72.Vector3 = function(v367) --[[ Line: 897 ]] --[[ Name: Vector3 ]]
    if typeof(v367) ~= "Vector3" then
        error("Vector3", 2);
    end;
    return v367;
end;
v72.Vector3Finite = function(v368) --[[ Line: 903 ]] --[[ Name: Vector3Finite ]]
    if typeof(v368) ~= "Vector3" then
        error("Vector3", 2);
    end;
    local v369 = v368.X + v368.Y + v368.Z;
    local v370 = false;
    if v369 == v369 then
        v370 = false;
        if v369 ~= 1e999 then
            v370 = v369 ~= -1e999;
        end;
    end;
    if not v370 then
        error("Vector3Finite", 2);
    end;
    return v368;
end;
v72.Vector3Unit = function(v371) --[[ Line: 912 ]] --[[ Name: Vector3Unit ]]
    if typeof(v371) ~= "Vector3" then
        error("Vector3", 2);
    end;
    local v372 = v371.X + v371.Y + v371.Z;
    local v373 = false;
    if v372 == v372 then
        v373 = false;
        if v372 ~= 1e999 then
            v373 = v372 ~= -1e999;
        end;
    end;
    if not v373 then
        error("Vector3Finite", 2);
    end;
    if math.abs(v371.Magnitude - 1) > 1.0E-6 then
        error("Vector3Unit", 2);
    end;
    return v371;
end;
v72.Vector3Positive = function(v374) --[[ Line: 924 ]] --[[ Name: Vector3Positive ]]
    if typeof(v374) ~= "Vector3" then
        error("Vector3", 2);
    end;
    local v375 = v374.X + v374.Y + v374.Z;
    local v376 = false;
    if v375 == v375 then
        v376 = false;
        if v375 ~= 1e999 then
            v376 = v375 ~= -1e999;
        end;
    end;
    if not v376 then
        error("Vector3Finite", 2);
    end;
    if v374.X <= 0 or v374.Y <= 0 or v374.Z <= 0 then
        error("Vector3Positive");
    end;
    return v374;
end;
v72.Vector3int16 = function(v377) --[[ Line: 936 ]] --[[ Name: Vector3int16 ]]
    if typeof(v377) ~= "Vector3int16" then
        error("Vector3int16", 2);
    end;
    return v377;
end;
v72.Vector2int16 = function(v378) --[[ Line: 942 ]] --[[ Name: Vector2int16 ]]
    if typeof(v378) ~= "Vector2int16" then
        error("Vector2int16", 2);
    end;
    return v378;
end;
v72.Region3 = function(v379) --[[ Line: 948 ]] --[[ Name: Region3 ]]
    if typeof(v379) ~= "Region3" then
        error("Region3", 2);
    end;
    return v379;
end;
v72.Region3int16 = function(v380) --[[ Line: 954 ]] --[[ Name: Region3int16 ]]
    if typeof(v380) ~= "Region3int16" then
        error("Region3int16", 2);
    end;
    return v380;
end;
v72.UDim = function(v381) --[[ Line: 960 ]] --[[ Name: UDim ]]
    if typeof(v381) ~= "UDim" then
        error("UDim", 2);
    end;
    return v381;
end;
v72.UDim2 = function(v382) --[[ Line: 966 ]] --[[ Name: UDim2 ]]
    if typeof(v382) ~= "UDim2" then
        error("UDim2", 2);
    end;
    return v382;
end;
v72.Rect = function(v383) --[[ Line: 972 ]] --[[ Name: Rect ]]
    if typeof(v383) ~= "Rect" then
        error("Rect", 2);
    end;
    return v383;
end;
v72.PhysicalProperties = function(v384) --[[ Line: 978 ]] --[[ Name: PhysicalProperties ]]
    if typeof(v384) ~= "PhysicalProperties" then
        error("PhysicalProperties", 2);
    end;
    return v384;
end;
v72.Storable = function(v385, v386) --[[ Line: 988 ]] --[[ Name: Storable ]]
    -- upvalues: v57 (copy), v72 (copy)
    if type(v385) == "boolean" then
        return v385;
    elseif type(v385) == "number" then
        return v385;
    else
        if type(v385) == "string" then
            if not utf8.len(v385) then
                error("UTF8", 2);
                return v385;
            end;
        elseif type(v385) == "buffer" then
            return v385;
        elseif type(v385) == "table" then
            if type(v385) ~= "table" then
                error("table", 2);
            end;
            if getmetatable(v385) ~= nil then
                error("metatable", 2);
            end;
            local v387 = v386 or {};
            if v387[v385] then
                error("Loop", 2);
            end;
            v387[v385] = true;
            local v388 = rawlen(v385);
            if v388 > 0 then
                local v389 = 0;
                for v390, v391 in pairs(v385) do
                    v389 = v389 + 1;
                    if v390 ~= v389 then
                        error(("IndexMismatch $%*"):format((("[%*]"):format((v57(v390))))), 2);
                    end;
                    if v388 < v389 then
                        error(("IndexOverflow $%*"):format((("[%*]"):format(v389))), 2);
                    end;
                    local l_status_15, l_result_15 = pcall(v72.Storable, v391, v387);
                    if not l_status_15 then
                        local v394 = tostring(l_result_15);
                        local v395, v396 = string.match(v394, "^(.*:%d+): (.+)$");
                        if v395 and v396 then
                            v394 = v396;
                        end;
                        local l_v394_0 = v394;
                        v394, v395 = string.match(l_v394_0, "^(.+) $(%[.+)$");
                        if v394 and v395 then
                            l_v394_0 = v394;
                        end;
                        error(("%* $%*"):format(l_v394_0, (("[%*]%*"):format(v389, v395 or ""))), 2);
                    end;
                end;
                if v388 ~= v389 then
                    error("LengthMismatch", 2);
                    return v385;
                end;
            else
                for v398, v399 in pairs(v385) do
                    if type(v398) ~= "string" then
                        error(("KeyString $%*"):format((("[%*]"):format((v57(v398))))), 2);
                    end;
                    if not utf8.len(v398) then
                        error(("KeyUTF8 $%*"):format((("[%*]"):format((v57(v398))))), 2);
                    end;
                    local l_status_16, l_result_16 = pcall(v72.Storable, v399, v387);
                    if not l_status_16 then
                        local v402 = tostring(l_result_16);
                        local v403, v404 = string.match(v402, "^(.*:%d+): (.+)$");
                        if v403 and v404 then
                            v402 = v404;
                        end;
                        local l_v402_0 = v402;
                        v402, v403 = string.match(l_v402_0, "^(.+) $(%[.+)$");
                        if v402 and v403 then
                            l_v402_0 = v402;
                        end;
                        error(("%* $%*"):format(l_v402_0, (("[%*]%*"):format(v57(v398), v403 or ""))), 2);
                    end;
                end;
                return v385;
            end;
        else
            error("Storable", 2);
        end;
        return v385;
    end;
end;
local v406 = {
    boolean = true, 
    number = true, 
    string = true, 
    buffer = true, 
    Color3 = true, 
    Instance = true, 
    NumberRange = true, 
    Rect = true, 
    Region3 = true, 
    Region3int16 = true, 
    UDim = true, 
    UDim2 = true, 
    CFrame = true, 
    Vector2 = true, 
    Vector2int16 = true, 
    Vector3 = true, 
    Vector3int16 = true, 
    EnumItem = true
};
table.freeze(v406);
v72.Networkable = function(v407, v408) --[[ Line: 1084 ]] --[[ Name: Networkable ]]
    -- upvalues: v57 (copy), v72 (copy), v406 (copy)
    if type(v407) == "string" then
        if not utf8.len(v407) then
            error("UTF8", 2);
            return v407;
        end;
    elseif type(v407) == "table" then
        if type(v407) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v407) ~= nil then
            error("metatable", 2);
        end;
        local v409 = v408 or {};
        if v409[v407] then
            error("Loop", 2);
        end;
        v409[v407] = true;
        local v410 = rawlen(v407);
        if v410 > 0 then
            local v411 = 0;
            for v412, v413 in pairs(v407) do
                v411 = v411 + 1;
                if v412 ~= v411 then
                    error(("IndexMismatch $%*"):format((("[%*]"):format((v57(v412))))), 2);
                end;
                if v410 < v411 then
                    error(("IndexOverflow $%*"):format((("[%*]"):format(v411))), 2);
                end;
                local l_status_17, l_result_17 = pcall(v72.Networkable, v413, v409);
                if not l_status_17 then
                    local v416 = tostring(l_result_17);
                    local v417, v418 = string.match(v416, "^(.*:%d+): (.+)$");
                    if v417 and v418 then
                        v416 = v418;
                    end;
                    local l_v416_0 = v416;
                    v416, v417 = string.match(l_v416_0, "^(.+) $(%[.+)$");
                    if v416 and v417 then
                        l_v416_0 = v416;
                    end;
                    error(("%* $%*"):format(l_v416_0, (("[%*]%*"):format(v411, v417 or ""))), 2);
                end;
            end;
            if v410 ~= v411 then
                error("LengthMismatch", 2);
                return v407;
            end;
        else
            for v420, v421 in pairs(v407) do
                if type(v420) ~= "string" then
                    error(("KeyString $%*"):format((("[%*]"):format((v57(v420))))), 2);
                end;
                if not utf8.len(v420) then
                    error(("KeyUTF8 $%*"):format((("[%*]"):format((v57(v420))))), 2);
                end;
                local l_status_18, l_result_18 = pcall(v72.Networkable, v421, v409);
                if not l_status_18 then
                    local v424 = tostring(l_result_18);
                    local v425, v426 = string.match(v424, "^(.*:%d+): (.+)$");
                    if v425 and v426 then
                        v424 = v426;
                    end;
                    local l_v424_0 = v424;
                    v424, v425 = string.match(l_v424_0, "^(.+) $(%[.+)$");
                    if v424 and v425 then
                        l_v424_0 = v424;
                    end;
                    error(("%* $%*"):format(l_v424_0, (("[%*]%*"):format(v57(v420), v425 or ""))), 2);
                end;
            end;
            return v407;
        end;
    elseif not v406[typeof(v407)] then
        error("Networkable", 2);
    end;
    return v407;
end;
v72.Enum = function(v428) --[[ Line: 1150 ]] --[[ Name: Enum ]]
    if typeof(v428) ~= "Enum" then
        error("Enum", 2);
    end;
    return function(v429) --[[ Line: 1152 ]]
        -- upvalues: v428 (copy)
        if typeof(v429) ~= "EnumItem" then
            error("EnumItem", 2);
        end;
        if v429.EnumType ~= v428 then
            error(tostring(v428), 2);
        end;
        return v429;
    end;
end;
v72.EnumValue = function(v430) --[[ Line: 1159 ]] --[[ Name: EnumValue ]]
    if typeof(v430) ~= "Enum" then
        error("Enum", 2);
    end;
    local v431 = {};
    for _, v433 in ipairs(v430:GetEnumItems()) do
        v431[v433.Value] = v433;
    end;
    return function(v434) --[[ Line: 1165 ]]
        -- upvalues: v431 (copy)
        if typeof(v434) ~= "number" then
            error("number", 2);
        end;
        if not v431[v434] then
            error("EnumValue", 2);
        end;
        return v434;
    end;
end;
v72.Player = function(v435) --[[ Line: 1172 ]] --[[ Name: Player ]]
    if typeof(v435) ~= "Instance" or not v435:IsA("Player") then
        error("Player", 2);
    end;
    return v435;
end;
v72.BasePart = function(v436) --[[ Line: 1178 ]] --[[ Name: BasePart ]]
    if typeof(v436) ~= "Instance" or not v436:IsA("BasePart") then
        error("BasePart", 2);
    end;
    return v436;
end;
v72.Part = function(v437) --[[ Line: 1184 ]] --[[ Name: Part ]]
    if typeof(v437) ~= "Instance" or not v437:IsA("Part") then
        error("Part", 2);
    end;
    return v437;
end;
v72.MeshPart = function(v438) --[[ Line: 1190 ]] --[[ Name: MeshPart ]]
    if typeof(v438) ~= "Instance" or not v438:IsA("MeshPart") then
        error("MeshPart", 2);
    end;
    return v438;
end;
v72.Model = function(v439) --[[ Line: 1196 ]] --[[ Name: Model ]]
    if typeof(v439) ~= "Instance" or not v439:IsA("Model") then
        error("Model", 2);
    end;
    return v439;
end;
v72.Animation = function(v440) --[[ Line: 1202 ]] --[[ Name: Animation ]]
    if typeof(v440) ~= "Instance" or not v440:IsA("Animation") then
        error("Animation", 2);
    end;
    return v440;
end;
v72.Humanoid = function(v441) --[[ Line: 1208 ]] --[[ Name: Humanoid ]]
    if typeof(v441) ~= "Instance" or not v441:IsA("Humanoid") then
        error("Humanoid", 2);
    end;
    return v441;
end;
v72.ParticleEmitter = function(v442) --[[ Line: 1214 ]] --[[ Name: ParticleEmitter ]]
    if typeof(v442) ~= "Instance" or not v442:IsA("ParticleEmitter") then
        error("ParticleEmitter", 2);
    end;
    return v442;
end;
v72.Sound = function(v443) --[[ Line: 1220 ]] --[[ Name: Sound ]]
    if typeof(v443) ~= "Instance" or not v443:IsA("Sound") then
        error("Sound", 2);
    end;
    return v443;
end;
v72.Instance = function(v444) --[[ Line: 1226 ]] --[[ Name: Instance ]]
    if typeof(v444) ~= "Instance" then
        error("Instance", 2);
    end;
    return v444;
end;
v72.InstanceOf = function(v445) --[[ Line: 1234 ]] --[[ Name: InstanceOf ]]
    -- upvalues: v72 (copy)
    v72.String(v445);
    return function(v446) --[[ Line: 1236 ]]
        -- upvalues: v445 (copy)
        if typeof(v446) ~= "Instance" then
            error("Instance", 2);
        end;
        if not v446:IsA(v445) then
            error(v445, 2);
        end;
        return v446;
    end;
end;
v72.InstanceClass = function(v447) --[[ Line: 1243 ]] --[[ Name: InstanceClass ]]
    -- upvalues: v72 (copy)
    v72.String(v447);
    return function(v448) --[[ Line: 1245 ]]
        -- upvalues: v447 (copy)
        if typeof(v448) ~= "Instance" then
            error("Instance", 2);
        end;
        if v448.ClassName ~= v447 then
            error(v447, 2);
        end;
        return v448;
    end;
end;
v72.HexLower = function(v449) --[[ Line: 1253 ]] --[[ Name: HexLower ]]
    if type(v449) ~= "string" then
        error("string", 2);
    end;
    for v450 = 1, string.len(v449) do
        local v451 = string.byte(v449, v450);
        if (v451 < 48 or v451 > 57) and (v451 < 97 or v451 > 102) then
            error("HexLower", 2);
        end;
    end;
    return v449;
end;
v72.HexUpper = function(v452) --[[ Line: 1267 ]] --[[ Name: HexUpper ]]
    if type(v452) ~= "string" then
        error("string", 2);
    end;
    for v453 = 1, string.len(v452) do
        local v454 = string.byte(v452, v453);
        if (v454 < 48 or v454 > 57) and (v454 < 65 or v454 > 70) then
            error("HexUpper", 2);
        end;
    end;
    return v452;
end;
v72.UUIDStripped = function(v455) --[[ Line: 1281 ]] --[[ Name: UUIDStripped ]]
    if type(v455) ~= "string" then
        error("string", 2);
    end;
    local v456 = string.len(v455);
    if v456 ~= 32 then
        error("Length32", 2);
    end;
    for v457 = 1, v456 do
        local v458 = string.byte(v455, v457);
        if (v458 < 48 or v458 > 57) and (v458 < 97 or v458 > 102) then
            error("HexLower", 2);
        end;
    end;
    return v455;
end;
v72.UUID = function(v459) --[[ Line: 1295 ]] --[[ Name: UUID ]]
    if type(v459) ~= "string" then
        error("string", 2);
    end;
    if string.len(v459) ~= 36 then
        error("Length36", 2);
    end;
    if not v459:find("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
        error("UUID", 2);
    end;
    return v459;
end;
v72.Base64 = function(v460) --[[ Line: 1306 ]] --[[ Name: Base64 ]]
    if type(v460) ~= "string" then
        error("string", 2);
    end;
    if string.len(v460) % 4 ~= 0 then
        error("Base64Length", 2);
    end;
    if not string.match(v460, "^[A-Za-z0-9+/]*=?=?$") or string.match(v460, "[^=]=+[^=]") then
        error("Base64", 2);
    end;
    return v460;
end;
v72.ToNumber = function(v461) --[[ Line: 1317 ]] --[[ Name: ToNumber ]]
    return function(v462) --[[ Line: 1320 ]]
        -- upvalues: v461 (copy)
        local v463 = tonumber(v462);
        if not v463 then
            error("tonumber", 2);
        end;
        local l_status_19, l_result_19 = pcall(v461, v463);
        if not l_status_19 then
            local l_error_3 = error;
            local v467 = tostring(l_result_19);
            local v468, v469 = string.match(v467, "^(.*:%d+): (.+)$");
            if v468 and v469 then
                v467 = v469;
            end;
            l_error_3(v467, 2);
        end;
        return l_result_19;
    end;
end;
v72.IsoDate = function(v470) --[[ Line: 1333 ]] --[[ Name: IsoDate ]]
    if not DateTime.fromIsoDate(v470) then
        error("IsoDate", 2);
    end;
    return v470;
end;
return table.freeze(v72);