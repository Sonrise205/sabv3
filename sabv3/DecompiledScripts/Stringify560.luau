--!native
local v0 = {
    Pretty = true, 
    IndentChar = " ", 
    IndentSize = 2
};
local function _(v1) --[[ Line: 68 ]] --[[ Name: isInt ]]
    return math.abs(v1 - math.round(v1)) < 1.0E-6;
end;
local function _(v3, v4) --[[ Line: 72 ]] --[[ Name: roundTo ]]
    return math.round(v3 * v4) / v4;
end;
local _ = function(v6, v7) --[[ Line: 76 ]] --[[ Name: formatNum ]]
    local v8 = 10 ^ v7;
    local v9 = math.round(v6 * v8) / v8;
    if v9 == 0 and v6 ~= 0 then
        return (tostring(v6));
    else
        local v10, _ = string.format("%." .. v7 .. "f", v9):gsub("%.?0+$", "");
        if v10 == "" or v10 == "-" then
            return "0";
        else
            return v10;
        end;
    end;
end;
local function _(v13) --[[ Line: 86 ]] --[[ Name: isValidId ]]
    return v13:match("^[a-zA-Z_][a-zA-Z0-9_]*$") == v13;
end;
local function _(v15, v16, v17) --[[ Line: 90 ]] --[[ Name: makeIndent ]]
    return string.rep(v15, v16 * v17);
end;
local v19 = {};
local function v23(v20, v21) --[[ Line: 100 ]] --[[ Name: serialize ]]
    -- upvalues: v19 (copy)
    local v22 = v19[typeof(v20)];
    if not v22 then
        return (("[%*]"):format((typeof(v20))));
    else
        return v22(v20, v21);
    end;
end;
v19["nil"] = function(_, _) --[[ Line: 113 ]]
    return "nil";
end;
v19.boolean = function(v26, _) --[[ Line: 117 ]]
    if v26 then
        return "true";
    else
        return "false";
    end;
end;
v19.number = function(v28, v29) --[[ Line: 121 ]]
    local v30 = false;
    if v28 == 1e999 then
        return "math.huge";
    elseif v28 == -1e999 then
        return "-math.huge";
    elseif v28 ~= v28 then
        return "0/0";
    else
        local v31;
        if v29.cfg.Pretty then
            local v32 = math.round(v28 * 1000000) / 1000000;
            if v32 == 0 and v28 ~= 0 then
                v31 = tostring(v28);
            else
                local v33, _ = string.format("%." .. 6 .. "f", v32):gsub("%.?0+$", "");
                v31 = (not (v33 ~= "") or v33 == "-") and "0" or v33;
            end;
            v30 = v31;
        end;
        if not v30 then
            v31 = tostring(v28);
        end;
        v30 = false;
        return v31;
    end;
end;
v19.string = function(v35, _) --[[ Line: 128 ]]
    return string.format("%q", v35);
end;
v19["function"] = function(_) --[[ Line: 132 ]]
    return "[function]";
end;
v19.Instance = function(v38) --[[ Line: 136 ]]
    if v38.Parent then
        return (("[%* %*]"):format(v38.ClassName, (v38:GetFullName())));
    else
        return (("[%*]"):format(v38.ClassName));
    end;
end;
v19.table = function(v39, v40) --[[ Line: 147 ]]
    -- upvalues: v19 (copy)
    local v41 = false;
    local v42 = false;
    local v43 = false;
    local v44 = getmetatable(v39);
    if v44 and v44.__tostring then
        local v45 = tostring(v39);
        local v46 = "\n";
        local v47 = "\n";
        local l_IndentChar_0 = v40.cfg.IndentChar;
        local l_IndentSize_0 = v40.cfg.IndentSize;
        local l_depth_0 = v40.depth;
        return v45:gsub(v46, v47 .. string.rep(l_IndentChar_0, l_IndentSize_0 * l_depth_0));
    elseif v40.seen[v39] then
        return "{...}";
    else
        v40.seen[v39] = true;
        local v51 = {};
        local v52 = 0;
        for v53 in pairs(v39) do
            if typeof(v53) == "number" and math.abs(v53 - math.round(v53)) < 1.0E-6 and v53 > 0 then
                v52 = math.max(v52, v53);
            end;
            table.insert(v51, v53);
        end;
        local v54 = false;
        if #v51 == v52 then
            v54 = #v51 > 0;
        end;
        for v55 = 1, v52 do
            if v39[v55] == nil then
                v54 = false;
                break;
            end;
        end;
        v40.depth = v40.depth + 1;
        local l_Pretty_0 = v40.cfg.Pretty;
        local v57;
        if l_Pretty_0 then
            local v58 = "\n";
            local l_IndentChar_1 = v40.cfg.IndentChar;
            local l_IndentSize_1 = v40.cfg.IndentSize;
            local l_depth_1 = v40.depth;
            v57 = v58 .. string.rep(l_IndentChar_1, l_IndentSize_1 * l_depth_1);
            v41 = v57;
        end;
        if not v41 then
            v57 = "";
        end;
        v41 = false;
        local v62;
        if l_Pretty_0 then
            local v63 = ",\n";
            local l_IndentChar_2 = v40.cfg.IndentChar;
            local l_IndentSize_2 = v40.cfg.IndentSize;
            local l_depth_2 = v40.depth;
            v62 = v63 .. string.rep(l_IndentChar_2, l_IndentSize_2 * l_depth_2);
            v42 = v62;
        end;
        if not v42 then
            v62 = ",";
        end;
        v42 = false;
        local v67 = {};
        if v54 then
            for v68 = 1, v52 do
                local v69 = v39[v68];
                local v70 = v19[typeof(v69)];
                v67[v68] = if not v70 then ("[%*]"):format((typeof(v69))) else v70(v69, v40);
            end;
        else
            local l_order_0 = v40.order;
            local v72 = {};
            for v73, v74 in ipairs(v51) do
                v72[v74] = v73;
            end;
            local v75 = {};
            for _, v77 in ipairs(v51) do
                table.insert(v75, {
                    v77, 
                    v39[v77]
                });
            end;
            if l_order_0 then
                local l_l_order_0_0 = l_order_0 --[[ copy: 10 -> 27 ]];
                local l_v72_0 = v72 --[[ copy: 11 -> 28 ]];
                table.sort(v75, function(v80, v81) --[[ Line: 199 ]]
                    -- upvalues: l_l_order_0_0 (copy), l_v72_0 (copy)
                    local v82 = l_l_order_0_0[v80[1]] and l_l_order_0_0[v80[1]].Index or 1e999;
                    local v83 = l_l_order_0_0[v81[1]] and l_l_order_0_0[v81[1]].Index or 1e999;
                    return v82 ~= v83 and v82 < v83 or l_v72_0[v80[1]] < l_v72_0[v81[1]];
                end);
            end;
            for _, v85 in ipairs(v75) do
                local v86 = v85[1];
                local v87 = v85[2];
                local v88 = l_order_0 and l_order_0[v86] and l_order_0[v86].Child or nil;
                local l_order_1 = v40.order;
                v40.order = v88;
                local v90, v91, v92;
                if typeof(v86) == "string" and v86:match("^[a-zA-Z_][a-zA-Z0-9_]*$") == v86 then
                    v92 = v86;
                    v43 = v92;
                end;
                if not v43 then
                    v90 = "[%*]";
                    v91 = v19[typeof(v86)];
                    v92 = v90:format(if not v91 then ("[%*]"):format((typeof(v86))) else v91(v86, v40));
                end;
                v43 = false;
                local v93 = v19[typeof(v87)];
                v90 = if not v93 then ("[%*]"):format((typeof(v87))) else v93(v87, v40);
                table.insert(v67, l_Pretty_0 and ("%* = %*"):format(v92, v90) or ("%*=%*"):format(v92, v90));
                v40.order = l_order_1;
            end;
        end;
        v40.depth = v40.depth - 1;
        v40.seen[v39] = nil;
        if #v67 == 0 then
            return "{}";
        elseif l_Pretty_0 then
            local v94 = "\n";
            local l_IndentChar_3 = v40.cfg.IndentChar;
            local l_IndentSize_3 = v40.cfg.IndentSize;
            local l_depth_3 = v40.depth;
            local v98 = v94 .. string.rep(l_IndentChar_3, l_IndentSize_3 * l_depth_3);
            return "{" .. v57 .. table.concat(v67, v62) .. "," .. v98 .. "}";
        else
            return "{" .. table.concat(v67, v62) .. "}";
        end;
    end;
end;
v19.Color3 = function(v99, v100) --[[ Line: 237 ]]
    -- upvalues: v19 (copy)
    local v101 = false;
    local v102 = v99.R * 255;
    local v103 = v99.G * 255;
    local v104 = v99.B * 255;
    local v105 = "fromRGB";
    local l_v102_0 = v102;
    if math.abs(l_v102_0 - math.round(l_v102_0)) < 1.0E-6 then
        l_v102_0 = v103;
        if math.abs(l_v102_0 - math.round(l_v102_0)) < 1.0E-6 then
            l_v102_0 = v104;
            if math.abs(l_v102_0 - math.round(l_v102_0)) < 1.0E-6 then
                v102 = math.round(v102);
                v103 = math.round(v103);
                v104 = math.round(v104);
                v101 = true;
            end;
        end;
    end;
    if not v101 then
        v102 = v99.R;
        v103 = v99.G;
        v104 = v99.B;
        v105 = "new";
    end;
    v101 = false;
    if v100.cfg.Pretty then
        l_v102_0 = "Color3.%*(%*, %*, %*)";
        local l_v105_0 = v105;
        local l_v102_1 = v102;
        local v109 = v19[typeof(l_v102_1)];
        local v110 = if not v109 then ("[%*]"):format((typeof(l_v102_1))) else v109(l_v102_1, v100);
        v109 = v103;
        local v111 = v19[typeof(v109)];
        l_v102_1 = if not v111 then ("[%*]"):format((typeof(v109))) else v111(v109, v100);
        v111 = v104;
        local v112 = v19[typeof(v111)];
        return (l_v102_0:format(l_v105_0, v110, l_v102_1, if not v112 then ("[%*]"):format((typeof(v111))) else v112(v111, v100)));
    else
        l_v102_0 = "Color3.%*(%*,%*,%*)";
        local l_v105_1 = v105;
        local l_v102_2 = v102;
        local v115 = v19[typeof(l_v102_2)];
        local v116 = if not v115 then ("[%*]"):format((typeof(l_v102_2))) else v115(l_v102_2, v100);
        v115 = v103;
        local v117 = v19[typeof(v115)];
        l_v102_2 = if not v117 then ("[%*]"):format((typeof(v115))) else v117(v115, v100);
        v117 = v104;
        local v118 = v19[typeof(v117)];
        return (l_v102_0:format(l_v105_1, v116, l_v102_2, if not v118 then ("[%*]"):format((typeof(v117))) else v118(v117, v100)));
    end;
end;
v19.Vector3 = function(v119, v120) --[[ Line: 251 ]]
    -- upvalues: v19 (copy)
    if v119 == Vector3.new(0, 0, 0, 0) then
        return "Vector3.zero";
    elseif v119 == Vector3.new(1, 1, 1, 0) then
        return "Vector3.one";
    elseif v119 == Vector3.new(1, 0, 0, 0) then
        return "Vector3.xAxis";
    elseif v119 == Vector3.new(0, 1, 0, 0) then
        return "Vector3.yAxis";
    elseif v119 == Vector3.new(0, 0, 1, 0) then
        return "Vector3.zAxis";
    elseif v120.cfg.Pretty then
        local v121 = "Vector3.new(%*, %*, %*)";
        local l_X_0 = v119.X;
        local v123 = v19[typeof(l_X_0)];
        local v124 = if not v123 then ("[%*]"):format((typeof(l_X_0))) else v123(l_X_0, v120);
        v123 = v119.Y;
        local v125 = v19[typeof(v123)];
        l_X_0 = if not v125 then ("[%*]"):format((typeof(v123))) else v125(v123, v120);
        v125 = v119.Z;
        local v126 = v19[typeof(v125)];
        return (v121:format(v124, l_X_0, if not v126 then ("[%*]"):format((typeof(v125))) else v126(v125, v120)));
    else
        local v127 = "Vector3.new(%*,%*,%*)";
        local l_X_1 = v119.X;
        local v129 = v19[typeof(l_X_1)];
        local v130 = if not v129 then ("[%*]"):format((typeof(l_X_1))) else v129(l_X_1, v120);
        v129 = v119.Y;
        local v131 = v19[typeof(v129)];
        l_X_1 = if not v131 then ("[%*]"):format((typeof(v129))) else v131(v129, v120);
        v131 = v119.Z;
        local v132 = v19[typeof(v131)];
        return (v127:format(v130, l_X_1, if not v132 then ("[%*]"):format((typeof(v131))) else v132(v131, v120)));
    end;
end;
v19.Vector2 = function(v133, v134) --[[ Line: 263 ]]
    -- upvalues: v19 (copy)
    if v133 == Vector2.zero then
        return "Vector2.zero";
    elseif v133 == Vector2.one then
        return "Vector2.one";
    elseif v133 == Vector2.xAxis then
        return "Vector2.xAxis";
    elseif v133 == Vector2.yAxis then
        return "Vector2.yAxis";
    elseif v134.cfg.Pretty then
        local v135 = "Vector2.new(%*, %*)";
        local l_X_2 = v133.X;
        local v137 = v19[typeof(l_X_2)];
        local v138 = if not v137 then ("[%*]"):format((typeof(l_X_2))) else v137(l_X_2, v134);
        v137 = v133.Y;
        local v139 = v19[typeof(v137)];
        return (v135:format(v138, if not v139 then ("[%*]"):format((typeof(v137))) else v139(v137, v134)));
    else
        local v140 = "Vector2.new(%*,%*)";
        local l_X_3 = v133.X;
        local v142 = v19[typeof(l_X_3)];
        local v143 = if not v142 then ("[%*]"):format((typeof(l_X_3))) else v142(l_X_3, v134);
        v142 = v133.Y;
        local v144 = v19[typeof(v142)];
        return (v140:format(v143, if not v144 then ("[%*]"):format((typeof(v142))) else v144(v142, v134)));
    end;
end;
v19.CFrame = function(v145, v146) --[[ Line: 274 ]]
    -- upvalues: v19 (copy)
    local v147 = false;
    local v148 = false;
    if v145 == CFrame.identity then
        return "CFrame.identity";
    else
        local l_Position_0 = v145.Position;
        local v150, v151, v152 = v145:ToOrientation();
        local l_Magnitude_0 = l_Position_0.Magnitude;
        local _, _, _, v157, v158, v159, v160, v161, v162, v163, v164, v165 = v145:GetComponents();
        local v166 = true;
        if math.abs(v157 - 1) <= 1.0E-6 then
            v166 = true;
            if math.abs(v161 - 1) <= 1.0E-6 then
                v166 = true;
                if math.abs(v165 - 1) <= 1.0E-6 then
                    v166 = true;
                    if math.abs(v158) <= 1.0E-6 then
                        v166 = true;
                        if math.abs(v159) <= 1.0E-6 then
                            v166 = true;
                            if math.abs(v160) <= 1.0E-6 then
                                v166 = true;
                                if math.abs(v162) <= 1.0E-6 then
                                    v166 = true;
                                    if math.abs(v163) <= 1.0E-6 then
                                        v166 = math.abs(v164) > 1.0E-6;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local v167 = l_Magnitude_0 > 1.0E-6;
        local l_Pretty_1 = v146.cfg.Pretty;
        local v169, v170, v171, v172, v173, v174, v175;
        if l_Pretty_1 then
            v169 = "CFrame.new(%*, %*, %*)";
            v170 = math.round(l_Position_0.X * 1000000) / 1000000;
            v171 = v19[typeof(v170)];
            v172 = if not v171 then ("[%*]"):format((typeof(v170))) else v171(v170, v146);
            v171 = math.round(l_Position_0.Y * 1000000) / 1000000;
            v173 = v19[typeof(v171)];
            v170 = if not v173 then ("[%*]"):format((typeof(v171))) else v173(v171, v146);
            v173 = math.round(l_Position_0.Z * 1000000) / 1000000;
            v174 = v19[typeof(v173)];
            v175 = v169:format(v172, v170, if not v174 then ("[%*]"):format((typeof(v173))) else v174(v173, v146));
            v147 = v175;
        end;
        if not v147 then
            v169 = "CFrame.new(%*,%*,%*)";
            v170 = l_Position_0.X;
            v171 = v19[typeof(v170)];
            v172 = if not v171 then ("[%*]"):format((typeof(v170))) else v171(v170, v146);
            v171 = l_Position_0.Y;
            v173 = v19[typeof(v171)];
            v170 = if not v173 then ("[%*]"):format((typeof(v171))) else v173(v171, v146);
            v173 = l_Position_0.Z;
            v174 = v19[typeof(v173)];
            v175 = v169:format(v172, v170, if not v174 then ("[%*]"):format((typeof(v173))) else v174(v173, v146));
        end;
        v147 = false;
        local v176;
        if l_Pretty_1 then
            v176 = "CFrame.fromOrientation(math.rad(%*), math.rad(%*), math.rad(%*))";
            v171 = math.round(math.deg(v150) * 1000000) / 1000000;
            v173 = v19[typeof(v171)];
            v170 = if not v173 then ("[%*]"):format((typeof(v171))) else v173(v171, v146);
            v173 = math.round(math.deg(v151) * 1000000) / 1000000;
            v174 = v19[typeof(v173)];
            v171 = if not v174 then ("[%*]"):format((typeof(v173))) else v174(v173, v146);
            v174 = math.round(math.deg(v152) * 1000000) / 1000000;
            local v177 = v19[typeof(v174)];
            v169 = v176:format(v170, v171, if not v177 then ("[%*]"):format((typeof(v174))) else v177(v174, v146));
            v148 = v169;
        end;
        if not v148 then
            v176 = "CFrame.fromOrientation(%*,%*,%*)";
            v171 = v19[typeof(v150)];
            v170 = if not v171 then ("[%*]"):format((typeof(v150))) else v171(v150, v146);
            v173 = v19[typeof(v151)];
            v171 = if not v173 then ("[%*]"):format((typeof(v151))) else v173(v151, v146);
            v174 = v19[typeof(v152)];
            v169 = v176:format(v170, v171, if not v174 then ("[%*]"):format((typeof(v152))) else v174(v152, v146));
        end;
        v148 = false;
        if v167 then
            return v166 and v175 .. (l_Pretty_1 and " * " or "*") .. v169 or v175;
        else
            return v169;
        end;
    end;
end;
v19.EnumItem = function(v178, _) --[[ Line: 304 ]]
    return (("Enum.%*.%*"):format(tostring(v178.EnumType), v178.Name));
end;
local v187 = {
    DEFAULT_CONFIG = v0, 
    Pretty = function(v180, v181) --[[ Line: 316 ]] --[[ Name: Pretty ]]
        -- upvalues: v0 (copy), v23 (copy)
        local v182 = {
            Pretty = v181 and v181.Pretty or v0.Pretty, 
            IndentChar = v181 and v181.IndentChar or v0.IndentChar, 
            IndentSize = v181 and v181.IndentSize or v0.IndentSize, 
            Order = v181 and v181.Order or v0.Order
        };
        return v23(v180, {
            cfg = v182, 
            depth = 0, 
            order = v182.Order, 
            seen = {}
        });
    end, 
    Serialize = function(v183, v184) --[[ Line: 332 ]] --[[ Name: Serialize ]]
        -- upvalues: v23 (copy)
        return v23(v183, {
            cfg = v184, 
            depth = 0, 
            order = v184.Order, 
            seen = {}
        });
    end, 
    Default = function(v185) --[[ Line: 341 ]] --[[ Name: Default ]]
        -- upvalues: v0 (copy), v23 (copy)
        local l_v0_0 = v0;
        return v23(v185, {
            cfg = l_v0_0, 
            depth = 0, 
            order = l_v0_0.Order, 
            seen = {}
        });
    end
};
v187.DefaultArgs = function(...) --[[ Line: 351 ]] --[[ Name: DefaultArgs ]]
    -- upvalues: v187 (copy)
    local v188 = table.pack(...);
    local v189 = {};
    for v190 = 1, v188.n do
        if v190 > 1 then
            table.insert(v189, ", ");
        end;
        table.insert(v189, v187.Default(v188[v190]));
    end;
    return table.concat(v189);
end;
v187.DefaultArgsPrefix = function(...) --[[ Line: 363 ]] --[[ Name: DefaultArgsPrefix ]]
    -- upvalues: v187 (copy)
    local v191 = table.pack(...);
    local v192 = {};
    for v193 = 1, v191.n do
        table.insert(v192, ", ");
        table.insert(v192, v187.Default(v191[v193]));
    end;
    return table.concat(v192);
end;
v187.CompileOrder = function(v194) --[[ Line: 373 ]] --[[ Name: CompileOrder ]]
    -- upvalues: v187 (copy)
    assert(type(v194) == "table");
    local v195 = true;
    if #v194 == 0 then
        v195 = next(v194) == nil;
    end;
    assert(v195);
    local v196 = {};
    for v197, v198 in ipairs(v194) do
        if type(v198) == "table" then
            local l_Key_0 = v198.Key;
            assert(type(l_Key_0) == "string");
            v196[l_Key_0] = {
                Index = v197, 
                Child = v187.CompileOrder(v198.Value)
            };
        else
            v196[v198] = {
                Index = v197
            };
        end;
    end;
    return v196;
end;
return table.freeze(v187);