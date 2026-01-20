--!native
local v0 = {
    "\225\154\128", 
    "\226\128\128", 
    "\226\128\129", 
    "\226\128\130", 
    "\226\128\131", 
    "\226\128\132", 
    "\226\128\133", 
    "\226\128\134", 
    "\226\128\135", 
    "\226\128\136", 
    "\226\128\137", 
    "\226\128\138", 
    "\226\128\168", 
    "\226\128\169", 
    "\226\128\175", 
    "\226\129\159", 
    "\227\128\128", 
    "\194\160", 
    "\r\n", 
    "\t", 
    "\n", 
    "\v", 
    "\f", 
    "\r", 
    " "
};
local v1 = {
    "\226\128\168", 
    "\226\128\169", 
    "\r\n", 
    "\r", 
    "\n"
};
local _ = function(v2) --[[ Line: 68 ]] --[[ Name: MAKE_LOOKUP ]]
    local v3 = {};
    for _, v5 in ipairs(v2) do
        v3[v5] = true;
    end;
    return v3;
end;
local v7 = {};
for _, v9 in ipairs(v0) do
    v7[v9] = true;
end;
local _ = v7;
local v11 = {};
for _, v13 in ipairs(v1) do
    v11[v13] = true;
end;
v7 = v11;
v11 = {
    ["0"] = "\000", 
    ["'"] = "'", 
    ["\""] = "\"", 
    ["\\"] = "\\", 
    b = "\b", 
    f = "\f", 
    n = "\n", 
    r = "\r", 
    t = "\t", 
    v = "\v"
};
local function _(v14) --[[ Line: 92 ]] --[[ Name: Q ]]
    return (string.format("%q", v14):gsub("\r", "\\r"):gsub("\n", "\\n"));
end;
local function v18(v16, v17) --[[ Line: 98 ]] --[[ Name: formatError ]]
    return string.format("%s at line %d col %d", v16, v17[1], v17[2]);
end;
local function _(v19, v20) --[[ Line: 107 ]] --[[ Name: advanceNewline ]]
    -- upvalues: v7 (copy)
    if v7[v19] then
        v20[1] = v20[1] + 1;
        v20[2] = 1;
        return true;
    else
        return false;
    end;
end;
local function v27(v22, v23) --[[ Line: 122 ]] --[[ Name: getNewline ]]
    -- upvalues: v1 (copy), v7 (copy)
    for _, v25 in ipairs(v1) do
        if v22:sub(1, #v25) == v25 then
            local v26;
            if v7[v25] then
                v23[1] = v23[1] + 1;
                v23[2] = 1;
                v26 = true;
            else
                v26 = false;
            end;
            if v26 then
                return v25;
            end;
        end;
    end;
    return nil;
end;
local function v32(v28, v29) --[[ Line: 137 ]] --[[ Name: getWhitespace ]]
    -- upvalues: v0 (copy), v7 (copy)
    if #v28 == 0 then
        return nil;
    else
        for _, v31 in ipairs(v0) do
            if v28:sub(1, #v31) == v31 then
                v29[2] = v29[2] + #v31;
                if v7[v31] then
                    v29[1] = v29[1] + 1;
                    v29[2] = 1;
                    return v31;
                else
                    return v31;
                end;
            end;
        end;
        return nil;
    end;
end;
local function v36(v33, v34) --[[ Line: 158 ]] --[[ Name: stripWhitespace ]]
    -- upvalues: v32 (copy)
    while true do
        local v35 = v32(v33, v34);
        if v35 ~= nil then
            v33 = v33:sub(#v35 + 1);
        else
            break;
        end;
    end;
    return v33;
end;
local function v40(v37, v38) --[[ Line: 178 ]] --[[ Name: stripInlineComments ]]
    -- upvalues: v27 (copy)
    while true do
        if #v37 ~= 0 then
            local v39 = v27(v37, v38);
            if v39 then
                return (v37:sub(#v39 + 1));
            else
                v37 = v37:sub(2);
                v38[2] = v38[2] + 1;
            end;
        else
            return v37;
        end;
    end;
end;
local function v44(v41, v42) --[[ Line: 205 ]] --[[ Name: stripBlockComments ]]
    -- upvalues: v27 (copy), v18 (copy)
    while true do
        if #v41 > 0 then
            if v41:sub(1, 2) == "*/" then
                v42[2] = v42[2] + 2;
                return v41:sub(3);
            else
                local v43 = v27(v41, v42);
                if v43 then
                    v41 = v41:sub(#v43 + 1);
                else
                    v42[2] = v42[2] + 1;
                    v41 = v41:sub(2);
                end;
            end;
        else
            error(v18("missing multiline comment close tag", v42));
            return "";
        end;
    end;
end;
local function v46(v45) --[[ Line: 232 ]] --[[ Name: codepointToutf8 ]]
    if v45 <= 127 then
        return (string.char(v45));
    elseif v45 <= 2047 then
        return (string.char(math.floor(v45 / 64) + 192, v45 % 64 + 128));
    elseif v45 <= 65535 then
        return (string.char(math.floor(v45 / 4096) + 224, math.floor(v45 % 4096 / 64) + 128, v45 % 64 + 128));
    elseif v45 <= 1114111 then
        return (string.char(math.floor(v45 / 262144) + 240, math.floor(v45 % 262144 / 4096) + 128, math.floor(v45 % 4096 / 64) + 128, v45 % 64 + 128));
    else
        return nil, string.format("invalid unicode codepoint '%x'", v45);
    end;
end;
local function v51(v47, v48) --[[ Line: 257 ]] --[[ Name: parseUnicodeImpl ]]
    -- upvalues: v18 (copy)
    local v49 = v47:match("^\\u(%x%x%x%x)");
    if not v49 then
        error(v18("invalid unicode hex escape sequence", v48));
    end;
    local v50 = tonumber(v49, 16);
    if not v50 then
        error(v18("invalid unicode hex escape sequence", v48));
    end;
    v48[2] = v48[2] + 6;
    return v50, v47:sub(7);
end;
local function _(v52, v53) --[[ Line: 277 ]] --[[ Name: getSurrogatePair ]]
    return (v53 - 55296) * 1024 + (v52 - 56320) + 65536;
end;
local function v63(v55, v56) --[[ Line: 283 ]] --[[ Name: parseUnicode ]]
    -- upvalues: v51 (copy), v46 (copy), v18 (copy)
    local v57 = v56[1];
    local v58 = v56[2];
    local v59 = nil;
    local v60, v61 = v51(v55, v56);
    v59 = v60;
    v55 = v61;
    if v59 >= 55296 and v59 < 56320 then
        v60 = nil;
        local v62;
        v61, v62 = v51(v55, v56);
        v60 = v61;
        v55 = v62;
        if v60 and v60 >= 56320 and v60 <= 57343 then
            v59 = (v59 - 55296) * 1024 + (v60 - 56320) + 65536;
        end;
    end;
    v60, v61 = v46(v59);
    if not v60 then
        error(v18(assert(v61), {
            v57, 
            v58
        }));
    end;
    return v60, v55;
end;
local function v77(v64, v65, v66, v67) --[[ Line: 316 ]] --[[ Name: parseStringImpl ]]
    -- upvalues: v11 (copy), v18 (copy), v63 (copy), v27 (copy)
    local v68 = {};
    while not v65(v64) do
        local v69 = v64:sub(1, 1);
        if v69 == "\\" then
            local v70 = v64:sub(2, 2);
            v67[2] = v67[2] + 1;
            if v11[v70] then
                v67[2] = v67[2] + 1;
                if v66 then
                    error(v18("escape sequence not allowed", v67));
                end;
                v68[#v68 + 1] = v11[v70];
                v64 = v64:sub(3);
            elseif v70 == "u" then
                local v71 = nil;
                local v72, v73 = v63(v64, v67);
                v71 = v72;
                v64 = v73;
                v68[#v68 + 1] = v71;
            elseif v70 == "x" then
                if v66 then
                    error(v18("hex escape sequence not allowed", v67));
                end;
                v67[2] = v67[2] + 2;
                local v74 = tonumber(v64:sub(2, 3), 16);
                if not v74 then
                    error(v18("invalid hex escape sequence", v67));
                end;
                v68[#v68 + 1] = string.char(v74);
                v67[2] = v67[2] + 2;
                v64 = v64:sub(5);
            else
                if v66 then
                    error(v18("invalid escape sequence", v67));
                end;
                local v75 = v27(v64:sub(2), v67);
                local v76 = 2;
                if v75 then
                    v76 = #v75 + 2;
                end;
                v64 = v64:sub(v76);
            end;
        elseif v69:byte(1, 1) < 32 then
            error(v18("control character found", v67));
        else
            v68[#v68 + 1] = v69;
            v64 = v64:sub(2);
            v67[2] = v67[2] + 1;
        end;
    end;
    return table.concat(v68), v64;
end;
local function v85(v78, v79) --[[ Line: 395 ]] --[[ Name: parseString ]]
    -- upvalues: v77 (copy)
    local v80 = v78:sub(1, 1);
    local v81 = nil;
    local v83, v84 = v77(v78:sub(2), function(v82) --[[ Line: 403 ]] --[[ Name: stopCriterion ]]
        -- upvalues: v80 (copy)
        return v82:sub(1, 1) == v80;
    end, false, v79);
    v81 = v83;
    v78 = v84;
    v79[2] = v79[2] + 1;
    return v81, v78:sub(2);
end;
local function v97(v86, v87) --[[ Line: 416 ]] --[[ Name: parseNumber ]]
    -- upvalues: v32 (copy), v18 (copy)
    local v88 = 1;
    local v89 = v86:sub(1, 1);
    local v90 = v87[1];
    local v91 = v87[2];
    if v89 == "+" then
        v88 = 1;
        v86 = v86:sub(2);
        v87[2] = v87[2] + 1;
    elseif v89 == "-" then
        v88 = -1;
        v86 = v86:sub(2);
        v87[2] = v87[2] + 1;
    end;
    if v86:sub(1, 3) == "NaN" then
        v87[2] = v87[2] + 3;
        return (0/0), v86:sub(4);
    elseif v86:find("Infinity", 1, true) == 1 then
        v87[2] = v87[2] + 8;
        return 1e999 * v88, v86:sub(9);
    else
        local v92 = 0;
        local l_v86_0 = v86;
        while not v32(l_v86_0, v87) do
            local v94 = l_v86_0:sub(1, 1);
            if v94 ~= "" and v94 ~= "," and v94 ~= "]" and v94 ~= "}" then
                v92 = v92 + 1;
                l_v86_0 = l_v86_0:sub(2);
                v87[2] = v87[2] + 1;
            else
                break;
            end;
        end;
        local v95 = v86:sub(1, v92);
        local v96 = nil;
        v96 = if v95:sub(1, 1) == "0" and v95:sub(2):find("^%d+$") then nil else tonumber(v95);
        if v96 == nil then
            error(v18("invalid number sequence " .. string.format("%q", v95):gsub("\r", "\\r"):gsub("\n", "\\n"), {
                v90, 
                v91
            }));
        end;
        v87[2] = v87[2] + v92;
        return v96 * v88, v86:sub(v92 + 1);
    end;
end;
local function v101(v98, v99, v100) --[[ Line: 486 ]] --[[ Name: parseNull ]]
    -- upvalues: v18 (copy)
    if v98:sub(1, 4) ~= "null" then
        error(v18("invalid null literal", v99));
    end;
    v99[2] = v99[2] + 1;
    return v100, v98:sub(5);
end;
local function v104(v102, v103) --[[ Line: 501 ]] --[[ Name: parseBoolean ]]
    -- upvalues: v18 (copy)
    if v102:sub(1, 4) == "true" then
        v103[2] = v103[2] + 4;
        return true, v102:sub(5);
    elseif v102:sub(1, 5) == "false" then
        v103[2] = v103[2] + 5;
        return false, v102:sub(6);
    else
        error(v18("invalid boolean literal", v103));
        return;
    end;
end;
local function v108(v105, v106) --[[ Line: 518 ]] --[[ Name: stripComments ]]
    -- upvalues: v40 (copy), v44 (copy)
    local v107 = v105:sub(1, 2);
    if v107 == "//" then
        v106[2] = v106[2] + 2;
        return (v40(v105:sub(3), v106));
    elseif v107 == "/*" then
        v106[2] = v106[2] + 2;
        return v44(v105:sub(3), v106);
    else
        return v105;
    end;
end;
local function v112(v109, v110) --[[ Line: 536 ]] --[[ Name: stripWhitespaceAndComments ]]
    -- upvalues: v36 (copy), v108 (copy)
    while true do
        local v111 = v36(v109, v110);
        v111 = v108(v111, v110);
        if v111 ~= v109 then
            v109 = v111;
        else
            break;
        end;
    end;
    return v109;
end;
local v113 = nil;
local function v121(v114, v115, v116) --[[ Line: 564 ]] --[[ Name: parseArray ]]
    -- upvalues: v112 (copy), v113 (ref), v18 (copy)
    v114 = v114:sub(2);
    v115[2] = v115[2] + 1;
    local v117 = {};
    while true do
        v114 = v112(v114, v115);
        if v114:sub(1, 1) == "]" then
            v115[2] = v115[2] + 1;
            v114 = v114:sub(2);
            break;
        else
            local v118 = nil;
            local v119, v120 = v113(v114, v115, v116);
            v118 = v119;
            v114 = v112(v120, v115);
            v117[#v117 + 1] = v118;
            v119 = v114:sub(1, 1);
            v114 = v114:sub(2);
            if v119 == "]" then
                v115[2] = v115[2] + 1;
                break;
            else
                if v119 ~= "," then
                    error(v18("expected comma got " .. string.format("%q", v119):gsub("\r", "\\r"):gsub("\n", "\\n"), v115));
                end;
                v115[2] = v115[2] + 1;
            end;
        end;
    end;
    return v117, v114;
end;
local function v126(v122) --[[ Line: 610 ]] --[[ Name: testIdentifier ]]
    local v123 = v122:byte(1, 1);
    if v123 >= 48 and v123 <= 57 then
        return false;
    else
        for v124 = 1, #v122 do
            local v125 = v122:byte(v124, v124);
            if v125 < 36 then
                return false;
            elseif v125 >= 37 and v125 <= 47 then
                return false;
            elseif v125 >= 58 and v125 <= 64 then
                return false;
            elseif v125 >= 91 and v125 <= 94 then
                return false;
            elseif v125 == 96 then
                return false;
            elseif v125 >= 123 and v125 <= 128 then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v129(v127) --[[ Line: 649 ]] --[[ Name: stopIdentifier ]]
    -- upvalues: v32 (copy)
    local v128 = true;
    if v127:sub(1, 1) ~= ":" then
        v128 = v32(v127, {
            0, 
            0
        }) ~= nil;
    end;
    return v128;
end;
local function v140(v130, v131) --[[ Line: 657 ]] --[[ Name: parseIdentifier ]]
    -- upvalues: v85 (copy), v77 (copy), v129 (copy), v126 (copy), v18 (copy)
    local v132 = v130:sub(1, 1);
    local v133 = nil;
    if v132 == "'" or v132 == "\"" then
        local v134, v135 = v85(v130, v131);
        v133 = v134;
        v130 = v135;
    else
        local v136 = v131[1];
        local v137 = v131[2];
        local v138, v139 = v77(v130, v129, true, v131);
        v133 = v138;
        v130 = v139;
        if not v126(v133) then
            error(v18("invalid identifier " .. string.format("%q", v133):gsub("\r", "\\r"):gsub("\n", "\\n"), {
                v136, 
                v137
            }));
        end;
    end;
    return v133, v130;
end;
local function v151(v141, v142, v143) --[[ Line: 685 ]] --[[ Name: parseObject ]]
    -- upvalues: v112 (copy), v140 (copy), v18 (copy), v113 (ref)
    v142[2] = v142[2] + 1;
    v141 = v141:sub(2);
    local v144 = {};
    while true do
        v141 = v112(v141, v142);
        if v141:sub(1, 1) == "}" then
            v142[2] = v142[2] + 1;
            v141 = v141:sub(2);
            break;
        else
            local v145 = nil;
            local v146, v147 = v140(v141, v142);
            v145 = v146;
            v141 = v112(v147, v142);
            if v141:sub(1, 1) ~= ":" then
                v146 = error;
                v147 = v18;
                local v148 = "expected colon after identifier, got ";
                local v149 = v141:sub(1, 1);
                v146(v147(v148 .. string.format("%q", v149):gsub("\r", "\\r"):gsub("\n", "\\n"), v142));
            end;
            v142[2] = v142[2] + 1;
            v141 = v141:sub(2);
            v141 = v112(v141, v142);
            v146 = nil;
            local v150;
            v147, v150 = v113(v141, v142, v143);
            v146 = v147;
            v141 = v112(v150, v142);
            v144[v145] = v146;
            v147 = v141:sub(1, 1);
            v141 = v141:sub(2);
            if v147 == "}" then
                v142[2] = v142[2] + 1;
                break;
            else
                if v147 ~= "," then
                    error(v18("expected comma got " .. string.format("%q", v147):gsub("\r", "\\r"):gsub("\n", "\\n"), v142));
                end;
                v142[2] = v142[2] + 1;
            end;
        end;
    end;
    return v144, v141;
end;
local v154 = {
    ["-"] = v97, 
    ["+"] = v97, 
    ["."] = v97, 
    ["0"] = v97, 
    ["1"] = v97, 
    ["2"] = v97, 
    ["3"] = v97, 
    ["4"] = v97, 
    ["5"] = v97, 
    ["6"] = v97, 
    ["7"] = v97, 
    ["8"] = v97, 
    ["9"] = v97, 
    N = v97, 
    I = v97, 
    n = v101, 
    t = v104, 
    f = v104, 
    ["'"] = v85, 
    ["\""] = v85, 
    ["["] = v121, 
    ["{"] = v151, 
    [""] = function(_, v153) --[[ Line: 752 ]] --[[ Name: catchEOF ]]
        -- upvalues: v18 (copy)
        error(v18("unexpected eof", v153));
    end
};
v113 = function(v155, v156, v157) --[[ Line: 786 ]]
    -- upvalues: v112 (copy), v154 (copy), v18 (copy)
    v155 = v112(v155, v156);
    local v158 = v155:sub(1, 1);
    local v159 = v154[v158];
    if not v159 then
        error(v18("invalid value literal " .. string.format("%q", v158):gsub("\r", "\\r"):gsub("\n", "\\n"), v156));
    end;
    return v159(v155, v156, v157);
end;
local v166 = {
    Null = newproxy(false), 
    Decode = function(v160, v161) --[[ Line: 821 ]] --[[ Name: Decode ]]
        -- upvalues: v112 (copy), v113 (ref), v18 (copy)
        local v162 = {
            1, 
            1
        };
        v160 = v112(v160, v162);
        local v163 = nil;
        local v164, v165 = v113(v160, v162, v161);
        v163 = v164;
        if #v112(v165, v162) > 0 then
            error(v18("trailing garbage", v162));
        end;
        return v163;
    end
};
return table.freeze(v166);