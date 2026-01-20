local function _(v0) --[[ Line: 289 ]] --[[ Name: char ]]
    return (string.byte(v0));
end;
local function v571(v2, v3) --[[ Line: 294 ]] --[[ Name: parse ]]
    local v4 = 0;
    local v5 = 0;
    local v6 = buffer.len(v2);
    local function _() --[[ Line: 299 ]] --[[ Name: peek ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy)
        if v4 == v6 then
            return 0;
        else
            return (buffer.readu8(v2, v4));
        end;
    end;
    local function _() --[[ Line: 304 ]] --[[ Name: bump ]]
        -- upvalues: v4 (ref), v6 (copy)
        v4 = math.min(v4 + 1, v6);
    end;
    local function _() --[[ Line: 306 ]] --[[ Name: bump_any ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v5 (ref)
        if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
            v5 = v5 + 1;
        end;
        v4 = math.min(v4 + 1, v6);
        if v4 == v6 then
            return 0;
        else
            return (buffer.readu8(v2, v4));
        end;
    end;
    local function _(v10) --[[ Line: 315 ]] --[[ Name: eof ]]
        -- upvalues: v4 (ref), v6 (copy)
        if v6 <= v4 then
            error(v10, 0);
        end;
        return false;
    end;
    local function _() --[[ Line: 320 ]] --[[ Name: bump_peek ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy)
        v4 = math.min(v4 + 1, v6);
        if v4 == v6 then
            return 0;
        else
            return (buffer.readu8(v2, v4));
        end;
    end;
    local function _(v13) --[[ Line: 325 ]] --[[ Name: is_whitespace ]]
        local v14 = true;
        if v13 ~= 32 then
            v14 = true;
            if v13 ~= 9 then
                v14 = v13 == 13;
            end;
        end;
        return v14;
    end;
    local function _(v16) --[[ Line: 329 ]] --[[ Name: is_digit ]]
        local v17 = false;
        if v16 >= 48 then
            v17 = v16 <= 57;
        end;
        return v17;
    end;
    local function v20(v19) --[[ Line: 333 ]] --[[ Name: is_alpha ]]
        return v19 >= 97 and v19 <= 122 or v19 >= 65 and v19 <= 90 or v19 == 95 or v19 == 64;
    end;
    local function v26() --[[ Line: 340 ]] --[[ Name: string_backslash ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v5 (ref)
        local v21 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        if v21 == 13 then
            v4 = math.min(v4 + 1, v6);
            if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                v4 = math.min(v4 + 1, v6);
                v5 = v5 + 1;
                return;
            end;
        elseif v21 == 122 then
            v4 = math.min(v4 + 1, v6);
            while true do
                local v22 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                local v23 = true;
                if v22 ~= 32 then
                    v23 = true;
                    if v22 ~= 9 then
                        v23 = v22 == 13;
                    end;
                end;
                if v23 then
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                        v5 = v5 + 1;
                    end;
                    v4 = math.min(v4 + 1, v6);
                    if v4 == v6 then
                        v23 = 0;
                    else
                        v23 = buffer.readu8(v2, v4);
                    end;
                else
                    break;
                end;
            end;
        else
            if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                v5 = v5 + 1;
            end;
            v4 = math.min(v4 + 1, v6);
            if v4 == v6 then
                local _ = 0;
                return;
            else
                local _ = buffer.readu8(v2, v4);
            end;
        end;
    end;
    local function v29() --[[ Line: 361 ]] --[[ Name: quoted_string ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v26 (copy)
        local v27 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        v4 = math.min(v4 + 1, v6);
        local v28 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        while v28 ~= v27 do
            if v6 <= v4 then
                error("expected string to be finished at", 0);
            end;
            if not false then
                if v28 == 0 or v28 == 10 or v28 == 13 then
                    return "error";
                else
                    if v28 == 92 then
                        v4 = math.min(v4 + 1, v6);
                        v26();
                    else
                        v4 = math.min(v4 + 1, v6);
                    end;
                    if v4 == v6 then
                        v28 = 0;
                    else
                        v28 = buffer.readu8(v2, v4);
                    end;
                end;
            else
                break;
            end;
        end;
        v4 = math.min(v4 + 1, v6);
        return "string";
    end;
    local function v37() --[[ Line: 384 ]] --[[ Name: number ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy)
        local l_v4_0 = v4;
        local v31 = 10;
        local v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        local v33 = false;
        if v32 == 45 then
            v4 = math.min(v4 + 1, v6);
            v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
            v33 = true;
        end;
        if v32 == 48 then
            v4 = math.min(v4 + 1, v6);
            v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
            if v32 == 120 or v32 == 88 then
                v4 = math.min(v4 + 1, v6);
                v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                v31 = 16;
            elseif v32 == 98 or v32 == 66 then
                v4 = math.min(v4 + 1, v6);
                v32 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                v31 = 2;
            end;
        end;
        while true do
            local l_v32_0 = v32;
            local v35 = true;
            if l_v32_0 ~= 32 then
                v35 = true;
                if l_v32_0 ~= 9 then
                    v35 = l_v32_0 == 13;
                end;
            end;
            if not v35 and v32 ~= 0 then
                v4 = math.min(v4 + 1, v6);
                if v4 == v6 then
                    v32 = 0;
                else
                    v32 = buffer.readu8(v2, v4);
                end;
            else
                break;
            end;
        end;
        local v36 = nil;
        v36 = if v31 == 10 then buffer.readstring(v2, l_v4_0, v4 - l_v4_0) else buffer.readstring(v2, l_v4_0 + 2 + (v33 and 1 or 0), v4 - l_v4_0 - 2 - (v33 and 1 or 0));
        v36 = string.gsub(v36, "_", "");
        return "number";
    end;
    local function v38() --[[ Line: 428 ]] --[[ Name: read_kind ]]
        -- upvalues: v4 (ref), v6 (copy), v2 (copy), v5 (ref), v38 (copy), v20 (copy), v37 (copy), v29 (copy)
        local v39 = v4 == v6 and 0 or buffer.readu8(v2, v4);
        if v39 == 0 then
            return "eof";
        elseif v39 == 35 then
            if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                v5 = v5 + 1;
            end;
            v4 = math.min(v4 + 1, v6);
            local _ = v4 == v6 and 0 or buffer.readu8(v2, v4);
            while v39 ~= 10 and v39 ~= 0 do
                if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 10 then
                    v5 = v5 + 1;
                end;
                v4 = math.min(v4 + 1, v6);
                if v4 == v6 then
                    v39 = 0;
                else
                    v39 = buffer.readu8(v2, v4);
                end;
            end;
            return v38();
        else
            local l_v39_0 = v39;
            local v42 = true;
            if l_v39_0 ~= 32 then
                v42 = true;
                if l_v39_0 ~= 9 then
                    v42 = l_v39_0 == 13;
                end;
            end;
            if v42 then
                v4 = math.min(v4 + 1, v6);
                return "whitespace";
            elseif v20(v39) then
                v42 = v4;
                while true do
                    v4 = math.min(v4 + 1, v6);
                    v39 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                    if v20(v39) then
                        continue;
                    end;
                    local l_v39_1 = v39;
                    l_v39_0 = false;
                    if l_v39_1 >= 48 then
                        l_v39_0 = l_v39_1 <= 57;
                    end;
                    if not l_v39_0 and v39 ~= 45 then
                        break;
                    end;
                end;
                l_v39_0 = buffer.readstring(v2, v42, v4 - v42);
                if l_v39_0 == "true" then
                    return "true";
                elseif l_v39_0 == "false" then
                    return "false";
                elseif l_v39_0 == "nil" then
                    return "nil";
                elseif l_v39_0 == "return" then
                    return "return";
                elseif l_v39_0 == "for" then
                    return "for";
                elseif l_v39_0 == "while" then
                    return "while";
                elseif l_v39_0 == "if" then
                    return "if";
                elseif l_v39_0 == "else" then
                    return "else";
                elseif l_v39_0 == "break" then
                    return "break";
                elseif l_v39_0 == "continue" then
                    return "continue";
                else
                    return "identifier";
                end;
            else
                l_v39_0 = v39;
                v42 = false;
                if l_v39_0 >= 48 then
                    v42 = l_v39_0 <= 57;
                end;
                if v42 or v39 == 45 then
                    return (v37());
                elseif v39 == 34 then
                    return (v29());
                elseif v39 == 39 then
                    return (v29());
                elseif v39 == 46 then
                    l_v39_0 = v4 == v6 and 0 or buffer.readu8(v2, v4);
                    v42 = false;
                    if l_v39_0 >= 48 then
                        v42 = l_v39_0 <= 57;
                    end;
                    if v42 then
                        v4 = v4 - 1;
                        return (v37());
                    else
                        v4 = math.min(v4 + 1, v6);
                        return ".";
                    end;
                elseif v39 == 61 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return "==";
                    else
                        return "=";
                    end;
                elseif v39 == 126 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return "~=";
                    else
                        has_error = true;
                        return "error";
                    end;
                elseif v39 == 62 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return ">=";
                    else
                        return ">";
                    end;
                elseif v39 == 60 then
                    v4 = math.min(v4 + 1, v6);
                    if (v4 == v6 and 0 or buffer.readu8(v2, v4)) == 61 then
                        return "<=";
                    else
                        return "<";
                    end;
                elseif v39 == 36 then
                    v4 = math.min(v4 + 1, v6);
                    return "$";
                elseif v39 == 40 then
                    v4 = math.min(v4 + 1, v6);
                    return "(";
                elseif v39 == 41 then
                    v4 = math.min(v4 + 1, v6);
                    return ")";
                elseif v39 == 123 then
                    v4 = math.min(v4 + 1, v6);
                    return "{";
                elseif v39 == 125 then
                    v4 = math.min(v4 + 1, v6);
                    return "}";
                elseif v39 == 91 then
                    v4 = math.min(v4 + 1, v6);
                    return "[";
                elseif v39 == 93 then
                    v4 = math.min(v4 + 1, v6);
                    return "]";
                elseif v39 == 124 then
                    v4 = math.min(v4 + 1, v6);
                    return "|";
                elseif v39 == 10 then
                    v4 = math.min(v4 + 1, v6);
                    return "\n";
                elseif v39 == 59 then
                    v4 = math.min(v4 + 1, v6);
                    return ";";
                elseif v39 == 44 then
                    v4 = math.min(v4 + 1, v6);
                    return ",";
                else
                    l_v39_0 = v39;
                    v42 = true;
                    if l_v39_0 ~= 32 then
                        v42 = true;
                        if l_v39_0 ~= 9 then
                            v42 = l_v39_0 == 13;
                        end;
                    end;
                    if v42 then
                        v4 = math.min(v4 + 1, v6);
                        return v38();
                    else
                        v4 = math.min(v4 + 1, v6);
                        return "error";
                    end;
                end;
            end;
        end;
    end;
    local function v46() --[[ Line: 569 ]] --[[ Name: next_token ]]
        -- upvalues: v4 (ref), v38 (copy), v2 (copy)
        local l_v4_1 = v4;
        local v45 = v38();
        while v45 == "whitespace" or v45 == "comment" do
            l_v4_1 = v4;
            v45 = v38();
        end;
        return {
            kind = v45, 
            text = buffer.readstring(v2, l_v4_1, v4 - l_v4_1), 
            span = vector.create(l_v4_1, v4, 0)
        };
    end;
    local v47 = v46();
    local l_kind_0 = v47.kind;
    local l_x_0 = v47.span.x;
    local v50 = v46();
    local l_kind_1 = v50.kind;
    local l_x_1 = v50.span.x;
    local function _() --[[ Line: 592 ]] --[[ Name: consume ]]
        -- upvalues: v47 (ref), l_kind_0 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy)
        local l_v47_0 = v47;
        local l_l_kind_0_0 = l_kind_0;
        local l_v50_0 = v50;
        local l_l_kind_1_0 = l_kind_1;
        v47 = l_v50_0;
        l_kind_0 = l_l_kind_1_0;
        l_x_0 = l_x_1;
        v50 = v46();
        l_kind_1 = v50.kind;
        l_x_1 = v50.span.x;
        return l_v47_0, l_l_kind_0_0;
    end;
    local _ = function(v58) --[[ Line: 602 ]] --[[ Name: current_is ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy)
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_1 = v50;
            local l_l_kind_1_1 = l_kind_1;
            v47 = l_v50_1;
            l_kind_0 = l_l_kind_1_1;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        return l_kind_0 == v58;
    end;
    local function _(v64) --[[ Line: 610 ]] --[[ Name: lookahead_is ]]
        -- upvalues: l_kind_1 (ref), v50 (ref), v46 (copy)
        while l_kind_1 == "\n" do
            v50 = v46();
            l_kind_1 = v50.kind;
        end;
        return l_kind_1 == v64;
    end;
    local function _(v66) --[[ Line: 619 ]] --[[ Name: display ]]
        local l_kind_2 = v66.kind;
        if l_kind_2 == "identifier" or l_kind_2 == "number" or l_kind_2 == "string" then
            return l_kind_2;
        elseif v66.kind == "error" then
            return "error '" .. v66.text .. "'";
        else
            return "'" .. l_kind_2 .. "'";
        end;
    end;
    local function v72(v69, v70) --[[ Line: 631 ]] --[[ Name: report ]]
        -- upvalues: v47 (ref)
        local v71 = {
            message = v69, 
            span = v70 or v47.span
        };
        error(("%* from %* to %*"):format(v71.message, v71.span.x, v71.span.y), 0);
    end;
    local function v80(v73) --[[ Line: 640 ]] --[[ Name: expect_failure ]]
        -- upvalues: v72 (copy), v47 (ref), l_kind_0 (ref)
        local l_v72_0 = v72;
        local v75 = "expected %*, but got %* of %* instead";
        local v76 = {
            kind = v73
        };
        local l_kind_3 = v76.kind;
        local v78 = if not (l_kind_3 ~= "identifier" and l_kind_3 ~= "number") or l_kind_3 == "string" then l_kind_3 else if v76.kind == "error" then "error '" .. v76.text .. "'" else "'" .. l_kind_3 .. "'";
        l_kind_3 = v47;
        local l_kind_4 = l_kind_3.kind;
        return l_v72_0((v75:format(v78, if not (l_kind_4 ~= "identifier" and l_kind_4 ~= "number") or l_kind_4 == "string" then l_kind_4 else if l_kind_3.kind == "error" then "error '" .. l_kind_3.text .. "'" else "'" .. l_kind_4 .. "'", l_kind_0)));
    end;
    local function v103(v81) --[[ Line: 650 ]] --[[ Name: expect ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v3 (copy), v80 (copy)
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_2 = v50;
            local l_l_kind_1_2 = l_kind_1;
            v47 = l_v50_2;
            l_kind_0 = l_l_kind_1_2;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == v81 then
            local l_v47_3 = v47;
            local _ = l_kind_0;
            local l_v50_3 = v50;
            local l_l_kind_1_3 = l_kind_1;
            v47 = l_v50_3;
            l_kind_0 = l_l_kind_1_3;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
            return l_v47_3;
        elseif l_kind_0 == "eof" and v3 then
            yield();
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_4 = v50;
                local l_l_kind_1_4 = l_kind_1;
                v47 = l_v50_4;
                l_kind_0 = l_l_kind_1_4;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == v81 then
                local l_v47_5 = v47;
                local _ = l_kind_0;
                local l_v50_5 = v50;
                local l_l_kind_1_5 = l_kind_1;
                v47 = l_v50_5;
                l_kind_0 = l_l_kind_1_5;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
                return l_v47_5;
            else
                local v98 = "expected %*, but got %* of %* instead";
                local v99 = {
                    kind = v81
                };
                local l_kind_5 = v99.kind;
                local v101 = if not (l_kind_5 ~= "identifier" and l_kind_5 ~= "number") or l_kind_5 == "string" then l_kind_5 else if v99.kind == "error" then "error '" .. v99.text .. "'" else "'" .. l_kind_5 .. "'";
                l_kind_5 = v47;
                local l_kind_6 = l_kind_5.kind;
                v98 = {
                    message = v98:format(v101, if not (l_kind_6 ~= "identifier" and l_kind_6 ~= "number") or l_kind_6 == "string" then l_kind_6 else if l_kind_5.kind == "error" then "error '" .. l_kind_5.text .. "'" else "'" .. l_kind_6 .. "'", l_kind_0), 
                    span = v47.span
                };
                error(("%* from %* to %*"):format(v98.message, v98.span.x, v98.span.y), 0);
                return nil;
            end;
        else
            return v80(v81);
        end;
    end;
    local v104 = nil;
    local v105 = nil;
    local v106 = nil;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    local v114 = nil;
    local v115 = nil;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    v110 = function() --[[ Line: 677 ]] --[[ Name: parse_var_root ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v103 (copy), v108 (ref), v72 (copy)
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_6 = v50;
            local l_l_kind_1_6 = l_kind_1;
            v47 = l_v50_6;
            l_kind_0 = l_l_kind_1_6;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "identifier" then
            local v123 = v103("identifier");
            return {
                kind = "global", 
                span = v123.span, 
                token = v123
            };
        else
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_7 = v50;
                local l_l_kind_1_7 = l_kind_1;
                v47 = l_v50_7;
                l_kind_0 = l_l_kind_1_7;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "$" then
                while l_kind_1 == "\n" do
                    v50 = v46();
                    l_kind_1 = v50.kind;
                end;
                if l_kind_1 == "(" then
                    local v128 = v103("$");
                    local v129 = v103("(");
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_8 = v50;
                        local l_l_kind_1_8 = l_kind_1;
                        v47 = l_v50_8;
                        l_kind_0 = l_l_kind_1_8;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    if not (l_kind_0 == "eof") then
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_9 = v50;
                            local l_l_kind_1_9 = l_kind_1;
                            v47 = l_v50_9;
                            l_kind_0 = l_l_kind_1_9;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        if l_kind_0 ~= ";" then
                            local v138 = v108();
                            while l_kind_0 == "\n" do
                                local _ = v47;
                                local _ = l_kind_0;
                                local l_v50_10 = v50;
                                local l_l_kind_1_10 = l_kind_1;
                                v47 = l_v50_10;
                                l_kind_0 = l_l_kind_1_10;
                                l_x_0 = l_x_1;
                                v50 = v46();
                                l_kind_1 = v50.kind;
                                l_x_1 = v50.span.x;
                            end;
                            if l_kind_0 == "}" then
                                local v143 = v103("}");
                                return {
                                    kind = "paren", 
                                    span = vector.create(v128.span.x, v143.span.y, 0), 
                                    expr = {
                                        left = v129, 
                                        right = v143, 
                                        value = v138
                                    }, 
                                    operator = v128
                                };
                            else
                                return {
                                    kind = "paren", 
                                    span = vector.create(v128.span.x, v138.span.y, 0), 
                                    expr = {
                                        left = v129, 
                                        value = v138
                                    }, 
                                    operator = v128
                                };
                            end;
                        end;
                    end;
                    return {
                        kind = "paren", 
                        span = vector.create(v128.span.x, v129.span.y, 0), 
                        expr = {
                            left = v129
                        }, 
                        operator = v128
                    };
                end;
            end;
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_11 = v50;
                local l_l_kind_1_11 = l_kind_1;
                v47 = l_v50_11;
                l_kind_0 = l_l_kind_1_11;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "$" then
                local v148 = v103("$");
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_12 = v50;
                    local l_l_kind_1_12 = l_kind_1;
                    v47 = l_v50_12;
                    l_kind_0 = l_l_kind_1_12;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == "identifier" then
                    local v153 = v103("identifier");
                    return {
                        kind = "name", 
                        span = vector.create(v148.span.x, v153.span.y, 0), 
                        name = v153, 
                        operator = v148
                    };
                else
                    return {
                        kind = "name", 
                        span = vector.create(v148.span.x, v148.span.y, 0), 
                        operator = v148
                    };
                end;
            else
                local l_v72_1 = v72;
                local v155 = "expected identifier, got %*";
                local l_v50_13 = v50;
                local l_kind_7 = l_v50_13.kind;
                return l_v72_1((v155:format(if not (l_kind_7 ~= "identifier" and l_kind_7 ~= "number") or l_kind_7 == "string" then l_kind_7 else if l_v50_13.kind == "error" then "error '" .. l_v50_13.text .. "'" else "'" .. l_kind_7 .. "'")));
            end;
        end;
    end;
    v111 = function() --[[ Line: 738 ]] --[[ Name: parse_var_suffix ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v103 (copy), v108 (ref), v72 (copy)
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_14 = v50;
            local l_l_kind_1_13 = l_kind_1;
            v47 = l_v50_14;
            l_kind_0 = l_l_kind_1_13;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "." then
            local v162 = v103(".");
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_15 = v50;
                local l_l_kind_1_14 = l_kind_1;
                v47 = l_v50_15;
                l_kind_0 = l_l_kind_1_14;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "identifier" == false then
                return {
                    kind = "nameindex", 
                    span = vector.create(v162.span.x, v162.span.y, 0), 
                    operator = v162
                };
            else
                local v167 = v103("identifier");
                return {
                    kind = "nameindex", 
                    span = vector.create(v162.span.x, v167.span.y, 0), 
                    operator = v162, 
                    name = v167
                };
            end;
        else
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_16 = v50;
                local l_l_kind_1_15 = l_kind_1;
                v47 = l_v50_16;
                l_kind_0 = l_l_kind_1_15;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "[" then
                local v172 = v103("[");
                if l_kind_0 == "eof" then
                    return {
                        kind = "exprindex", 
                        span = vector.create(v172.span.x, v172.span.y, 0), 
                        expr = {
                            left = v172
                        }
                    };
                else
                    local v173 = v108();
                    if l_kind_0 ~= "]" then
                        return {
                            kind = "exprindex", 
                            span = vector.create(v172.span.x, v173.span.y, 0), 
                            expr = {
                                left = v172, 
                                value = v173
                            }
                        };
                    else
                        local v174 = v103("]");
                        return {
                            kind = "exprindex", 
                            span = vector.create(v172.span.x, v174.span.y, 0), 
                            expr = {
                                left = v172, 
                                right = v174, 
                                value = v173
                            }
                        };
                    end;
                end;
            else
                return v72("invalid");
            end;
        end;
    end;
    v112 = function() --[[ Line: 789 ]] --[[ Name: parse_var_suffixes ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v111 (ref)
        local v175 = false;
        local v176 = {};
        while true do
            if l_kind_0 == "\n" then
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_17 = v50;
                local l_l_kind_1_16 = l_kind_1;
                v47 = l_v50_17;
                l_kind_0 = l_l_kind_1_16;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
                continue;
            end;
            v175 = l_kind_0 == ".";
            if not v175 then
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_18 = v50;
                    local l_l_kind_1_17 = l_kind_1;
                    v47 = l_v50_18;
                    l_kind_0 = l_l_kind_1_17;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 ~= "[" then
                    break;
                end;
            end;
            v175 = false;
            table.insert(v176, (v111()));
        end;
        return v176;
    end;
    v109 = function() --[[ Line: 798 ]] --[[ Name: parse_var ]]
        -- upvalues: v110 (ref), v112 (ref)
        local v185 = v110();
        local v186 = if v185.kind ~= "global" then v112() else {};
        return {
            span = vector.create(v185.span.x, if #v186 > 0 then v186[#v186].span.y else v185.span.y, 0), 
            prefix = v185, 
            suffixes = v186
        };
    end;
    v108 = function() --[[ Line: 816 ]] --[[ Name: parse_expression_or_command ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v105 (ref), v104 (ref)
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_19 = v50;
            local l_l_kind_1_18 = l_kind_1;
            v47 = l_v50_19;
            l_kind_0 = l_l_kind_1_18;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "identifier" then
            return v105();
        else
            return v104();
        end;
    end;
    v113 = function() --[[ Line: 824 ]] --[[ Name: parse_function_body ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v106 (ref)
        local v191 = v103("|");
        local v192 = {};
        local v193 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_20 = v50;
                local l_l_kind_1_19 = l_kind_1;
                v47 = l_v50_20;
                l_kind_0 = l_l_kind_1_19;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
                continue;
            end;
            if not (l_kind_0 == "|") then
                if not v193 then
                    v103(",");
                end;
                v193 = false;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_21 = v50;
                    local l_l_kind_1_20 = l_kind_1;
                    v47 = l_v50_21;
                    l_kind_0 = l_l_kind_1_20;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == "identifier" then
                    table.insert(v192, v103("identifier"));
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_22 = v50;
            local l_l_kind_1_21 = l_kind_1;
            v47 = l_v50_22;
            l_kind_0 = l_l_kind_1_21;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v206 = if l_kind_0 == "|" then v103("|") else nil;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_23 = v50;
            local l_l_kind_1_22 = l_kind_1;
            v47 = l_v50_23;
            l_kind_0 = l_l_kind_1_22;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v211 = if l_kind_0 == "{" then v103("{") else nil;
        local v212 = v106("}");
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_24 = v50;
            local l_l_kind_1_23 = l_kind_1;
            v47 = l_v50_24;
            l_kind_0 = l_l_kind_1_23;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v217 = if l_kind_0 == "}" then v103("}") else nil;
        return {
            arguments = {
                left = v191, 
                right = v206, 
                value = v192
            }, 
            block = if not not v211 or v212 or v217 then {
                left = v211, 
                right = v217, 
                value = v212
            } else nil, 
            span = vector.create(v191.span.x, if v217 then v217.span.y else v212.span.y, 0)
        };
    end;
    v107 = function() --[[ Line: 862 ]] --[[ Name: parse_lambda ]]
        -- upvalues: v113 (ref)
        local v218 = v113();
        return {
            kind = "lambda", 
            body = v218, 
            span = v218.span
        };
    end;
    parse_table = function() --[[ Line: 871 ]] --[[ Name: parse_table ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v104 (ref)
        local v219 = v103("{");
        local v220 = {};
        local v221 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_25 = v50;
                local l_l_kind_1_24 = l_kind_1;
                v47 = l_v50_25;
                l_kind_0 = l_l_kind_1_24;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
                continue;
            end;
            if not (l_kind_0 == "}") then
                if not v221 then
                    v103(",");
                end;
                v221 = false;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_26 = v50;
                    local l_l_kind_1_25 = l_kind_1;
                    v47 = l_v50_26;
                    l_kind_0 = l_l_kind_1_25;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == "identifier" then
                    while l_kind_1 == "\n" do
                        v50 = v46();
                        l_kind_1 = v50.kind;
                    end;
                    if l_kind_1 == "=" then
                        local v230 = v103("identifier");
                        local v231 = v103("=");
                        if l_kind_0 == "eof" then
                            table.insert(v220, {
                                kind = "namekey", 
                                span = vector.create(v230.span.x, v231.span.y, 0), 
                                name = v230, 
                                operator = v231
                            });
                            break;
                        else
                            local v232 = v104();
                            table.insert(v220, {
                                kind = "namekey", 
                                name = v230, 
                                value = v232
                            });
                            continue;
                        end;
                    end;
                end;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_27 = v50;
                    local l_l_kind_1_26 = l_kind_1;
                    v47 = l_v50_27;
                    l_kind_0 = l_l_kind_1_26;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == "[" then
                    local v237 = v103("[");
                    if l_kind_0 == "eof" then
                        table.insert(v220, {
                            kind = "exprkey", 
                            span = vector.create(v237.span.x, v237.span.y, 0), 
                            key = {
                                left = v237
                            }
                        });
                        break;
                    else
                        local v238 = v104();
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_28 = v50;
                            local l_l_kind_1_27 = l_kind_1;
                            v47 = l_v50_28;
                            l_kind_0 = l_l_kind_1_27;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        local v243 = if l_kind_0 == "]" then v103("]") else nil;
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_29 = v50;
                            local l_l_kind_1_28 = l_kind_1;
                            v47 = l_v50_29;
                            l_kind_0 = l_l_kind_1_28;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        local v248 = if l_kind_0 == "=" then v103("=") else nil;
                        if l_kind_0 == "eof" then
                            table.insert(v220, {
                                kind = "exprkey", 
                                span = vector.create(v237.span.x, if v248 then v248.span.y else if v243 then v243.span.y else v238.span.y, 0), 
                                key = {
                                    left = v237, 
                                    right = v243, 
                                    value = v238
                                }, 
                                operator = v248
                            });
                            break;
                        else
                            local v249 = v104();
                            table.insert(v220, {
                                kind = "exprkey", 
                                span = vector.create(v237.span.x, v249.span.y, 0), 
                                key = {
                                    left = v237, 
                                    right = v243, 
                                    value = v238
                                }, 
                                operator = v248, 
                                value = v249
                            });
                        end;
                    end;
                elseif l_kind_0 ~= "eof" then
                    local v250 = v104();
                    table.insert(v220, {
                        kind = "nokey", 
                        value = v250
                    });
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_30 = v50;
            local l_l_kind_1_29 = l_kind_1;
            v47 = l_v50_30;
            l_kind_0 = l_l_kind_1_29;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "}" then
            local v255 = v103("}");
            return {
                fields = {
                    left = v219, 
                    right = v255, 
                    value = v220
                }, 
                span = vector.create(v219.span.x, v255.span.y, 0)
            };
        else
            local l_y_0 = v219.span.y;
            if #v220 > 0 then
                l_y_0 = v220[#v220].span.y;
            end;
            return {
                fields = {
                    left = v219, 
                    value = v220
                }, 
                span = vector.create(v219.span.x, l_y_0, 0)
            };
        end;
    end;
    v118 = function() --[[ Line: 973 ]] --[[ Name: parse_vector ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v104 (ref)
        local v257 = v103("[");
        local l_x_2 = v257.span.x;
        local l_y_1 = v257.span.y;
        local v260 = {};
        local v261 = 0;
        while v261 < 3 do
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_31 = v50;
                local l_l_kind_1_30 = l_kind_1;
                v47 = l_v50_31;
                l_kind_0 = l_l_kind_1_30;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if not (l_kind_0 == "]") then
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_32 = v50;
                    local l_l_kind_1_31 = l_kind_1;
                    v47 = l_v50_32;
                    l_kind_0 = l_l_kind_1_31;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if not (l_kind_0 == "eof") then
                    if v261 ~= 0 then
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_33 = v50;
                            local l_l_kind_1_32 = l_kind_1;
                            v47 = l_v50_33;
                            l_kind_0 = l_l_kind_1_32;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        if l_kind_0 == "," then
                            v103(",");
                        end;
                    end;
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_34 = v50;
                        local l_l_kind_1_33 = l_kind_1;
                        v47 = l_v50_34;
                        l_kind_0 = l_l_kind_1_33;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    if not (l_kind_0 == "eof") then
                        v261 = v261 + 1;
                        local v278 = v104();
                        v260[v261] = v278;
                        l_y_1 = v278.span.y;
                    else
                        break;
                    end;
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_35 = v50;
            local l_l_kind_1_34 = l_kind_1;
            v47 = l_v50_35;
            l_kind_0 = l_l_kind_1_34;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v283 = if l_kind_0 == "]" then v103("]") else nil;
        if v283 then
            l_y_1 = v283.span.y;
        end;
        return {
            kind = "vector", 
            span = vector.create(l_x_2, l_y_1, 0), 
            contents = {
                left = v257, 
                right = v283, 
                value = v260
            }
        };
    end;
    v104 = function() --[[ Line: 1005 ]] --[[ Name: parse_expression ]]
        -- upvalues: l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v103 (copy), v105 (ref), v104 (ref), v109 (ref), v107 (ref), v118 (ref), v72 (copy)
        local v284 = false;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_36 = v50;
            local l_l_kind_1_35 = l_kind_1;
            v47 = l_v50_36;
            l_kind_0 = l_l_kind_1_35;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "$" then
            while l_kind_1 == "\n" do
                v50 = v46();
                l_kind_1 = v50.kind;
            end;
            if l_kind_1 == "(" then
                local v289 = v103("$");
                local v290 = v103("(");
                local v291 = nil;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_37 = v50;
                    local l_l_kind_1_36 = l_kind_1;
                    v47 = l_v50_37;
                    l_kind_0 = l_l_kind_1_36;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if not (l_kind_0 == "$") then
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_38 = v50;
                        local l_l_kind_1_37 = l_kind_1;
                        v47 = l_v50_38;
                        l_kind_0 = l_l_kind_1_37;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    if l_kind_0 ~= "identifier" then
                        if l_kind_0 == "eof" then
                            return {
                                kind = "evaluate", 
                                body = {
                                    left = v290
                                }, 
                                operator = v289, 
                                span = vector.create(v289.span.x, v290.span.y, 0)
                            };
                        else
                            v291 = v104();
                            v284 = true;
                        end;
                    end;
                end;
                if not v284 then
                    v291 = v105();
                end;
                v284 = false;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_39 = v50;
                    local l_l_kind_1_38 = l_kind_1;
                    v47 = l_v50_39;
                    l_kind_0 = l_l_kind_1_38;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == ")" then
                    local v304 = v103(")");
                    return {
                        kind = "evaluate", 
                        body = {
                            left = v290, 
                            right = v304, 
                            value = v291
                        }, 
                        operator = v289, 
                        span = vector.create(v289.span.x, v304.span.y, 0)
                    };
                else
                    return {
                        kind = "evaluate", 
                        body = {
                            left = v290, 
                            value = v291
                        }, 
                        operator = v289, 
                        span = vector.create(v289.span.x, v291.span.y, 0)
                    };
                end;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_40 = v50;
            local l_l_kind_1_39 = l_kind_1;
            v47 = l_v50_40;
            l_kind_0 = l_l_kind_1_39;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "$" then
            while l_kind_1 == "\n" do
                v50 = v46();
                l_kind_1 = v50.kind;
            end;
            if l_kind_1 == "identifier" then
                local v309 = v109();
                return {
                    kind = "var", 
                    var = v309, 
                    span = v309.span
                };
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_41 = v50;
            local l_l_kind_1_40 = l_kind_1;
            v47 = l_v50_41;
            l_kind_0 = l_l_kind_1_40;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "string" then
            local v314 = v103("string");
            return {
                kind = "string", 
                token = v314, 
                span = v314.span
            };
        else
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_42 = v50;
                local l_l_kind_1_41 = l_kind_1;
                v47 = l_v50_42;
                l_kind_0 = l_l_kind_1_41;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "number" then
                local v319 = v103("number");
                return {
                    kind = "number", 
                    token = v319, 
                    span = v319.span
                };
            else
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_43 = v50;
                    local l_l_kind_1_42 = l_kind_1;
                    v47 = l_v50_43;
                    l_kind_0 = l_l_kind_1_42;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == "true" then
                    local v324 = v103("true");
                    return {
                        kind = "boolean", 
                        token = v324, 
                        span = v324.span
                    };
                else
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_44 = v50;
                        local l_l_kind_1_43 = l_kind_1;
                        v47 = l_v50_44;
                        l_kind_0 = l_l_kind_1_43;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    if l_kind_0 == "false" then
                        local v329 = v103("false");
                        return {
                            kind = "boolean", 
                            token = v329, 
                            span = v329.span
                        };
                    else
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_45 = v50;
                            local l_l_kind_1_44 = l_kind_1;
                            v47 = l_v50_45;
                            l_kind_0 = l_l_kind_1_44;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        if l_kind_0 == "identifier" then
                            local v334 = v103("identifier");
                            return {
                                kind = "identifier", 
                                token = v334, 
                                span = v334.span
                            };
                        else
                            while l_kind_0 == "\n" do
                                local _ = v47;
                                local _ = l_kind_0;
                                local l_v50_46 = v50;
                                local l_l_kind_1_45 = l_kind_1;
                                v47 = l_v50_46;
                                l_kind_0 = l_l_kind_1_45;
                                l_x_0 = l_x_1;
                                v50 = v46();
                                l_kind_1 = v50.kind;
                                l_x_1 = v50.span.x;
                            end;
                            if l_kind_0 == "|" then
                                return v107();
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v47;
                                    local _ = l_kind_0;
                                    local l_v50_47 = v50;
                                    local l_l_kind_1_46 = l_kind_1;
                                    v47 = l_v50_47;
                                    l_kind_0 = l_l_kind_1_46;
                                    l_x_0 = l_x_1;
                                    v50 = v46();
                                    l_kind_1 = v50.kind;
                                    l_x_1 = v50.span.x;
                                end;
                                if l_kind_0 == "{" then
                                    local v343 = parse_table();
                                    return {
                                        kind = "table", 
                                        table = v343, 
                                        span = v343.span
                                    };
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v47;
                                        local _ = l_kind_0;
                                        local l_v50_48 = v50;
                                        local l_l_kind_1_47 = l_kind_1;
                                        v47 = l_v50_48;
                                        l_kind_0 = l_l_kind_1_47;
                                        l_x_0 = l_x_1;
                                        v50 = v46();
                                        l_kind_1 = v50.kind;
                                        l_x_1 = v50.span.x;
                                    end;
                                    if l_kind_0 == "[" then
                                        return v118();
                                    else
                                        return v72((("expected expression, got %*"):format(l_kind_0)));
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v105 = function() --[[ Line: 1096 ]] --[[ Name: parse_command ]]
        -- upvalues: v109 (ref), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v104 (ref)
        local v348 = v109();
        local v349 = {};
        while l_kind_0 ~= "\n" do
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_49 = v50;
                local l_l_kind_1_48 = l_kind_1;
                v47 = l_v50_49;
                l_kind_0 = l_l_kind_1_48;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if not (l_kind_0 == "$") then
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_50 = v50;
                    local l_l_kind_1_49 = l_kind_1;
                    v47 = l_v50_50;
                    l_kind_0 = l_l_kind_1_49;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if not (l_kind_0 == "string") then
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_51 = v50;
                        local l_l_kind_1_50 = l_kind_1;
                        v47 = l_v50_51;
                        l_kind_0 = l_l_kind_1_50;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    if not (l_kind_0 == "number") then
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_52 = v50;
                            local l_l_kind_1_51 = l_kind_1;
                            v47 = l_v50_52;
                            l_kind_0 = l_l_kind_1_51;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        if not (l_kind_0 == "true") then
                            while l_kind_0 == "\n" do
                                local _ = v47;
                                local _ = l_kind_0;
                                local l_v50_53 = v50;
                                local l_l_kind_1_52 = l_kind_1;
                                v47 = l_v50_53;
                                l_kind_0 = l_l_kind_1_52;
                                l_x_0 = l_x_1;
                                v50 = v46();
                                l_kind_1 = v50.kind;
                                l_x_1 = v50.span.x;
                            end;
                            if not (l_kind_0 == "false") then
                                while l_kind_0 == "\n" do
                                    local _ = v47;
                                    local _ = l_kind_0;
                                    local l_v50_54 = v50;
                                    local l_l_kind_1_53 = l_kind_1;
                                    v47 = l_v50_54;
                                    l_kind_0 = l_l_kind_1_53;
                                    l_x_0 = l_x_1;
                                    v50 = v46();
                                    l_kind_1 = v50.kind;
                                    l_x_1 = v50.span.x;
                                end;
                                if not (l_kind_0 == "identifier") then
                                    while l_kind_0 == "\n" do
                                        local _ = v47;
                                        local _ = l_kind_0;
                                        local l_v50_55 = v50;
                                        local l_l_kind_1_54 = l_kind_1;
                                        v47 = l_v50_55;
                                        l_kind_0 = l_l_kind_1_54;
                                        l_x_0 = l_x_1;
                                        v50 = v46();
                                        l_kind_1 = v50.kind;
                                        l_x_1 = v50.span.x;
                                    end;
                                    if not (l_kind_0 == "{") then
                                        while l_kind_0 == "\n" do
                                            local _ = v47;
                                            local _ = l_kind_0;
                                            local l_v50_56 = v50;
                                            local l_l_kind_1_55 = l_kind_1;
                                            v47 = l_v50_56;
                                            l_kind_0 = l_l_kind_1_55;
                                            l_x_0 = l_x_1;
                                            v50 = v46();
                                            l_kind_1 = v50.kind;
                                            l_x_1 = v50.span.x;
                                        end;
                                        if not (l_kind_0 == "|") then
                                            while l_kind_0 == "\n" do
                                                local _ = v47;
                                                local _ = l_kind_0;
                                                local l_v50_57 = v50;
                                                local l_l_kind_1_56 = l_kind_1;
                                                v47 = l_v50_57;
                                                l_kind_0 = l_l_kind_1_56;
                                                l_x_0 = l_x_1;
                                                v50 = v46();
                                                l_kind_1 = v50.kind;
                                                l_x_1 = v50.span.x;
                                            end;
                                            if l_kind_0 ~= "[" then
                                                break;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            table.insert(v349, (v104()));
        end;
        local v386 = if #v349 > 0 then v349[#v349].span.y else v348.span.y;
        return {
            kind = "command", 
            prefix = v348, 
            arguments = v349, 
            span = vector.create(v348.span.x, v386, 0)
        };
    end;
    v114 = function() --[[ Line: 1131 ]] --[[ Name: parse_if ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v105 (ref), v104 (ref), v106 (ref)
        local v387 = {};
        local v388 = true;
        local v389 = nil;
        local v390 = nil;
        while true do
            if v388 then
                v388 = false;
                local v391 = v103("if");
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_58 = v50;
                    local l_l_kind_1_57 = l_kind_1;
                    v47 = l_v50_58;
                    l_kind_0 = l_l_kind_1_57;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                local v396 = if l_kind_0 == "(" then v103("(") else nil;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_59 = v50;
                    local l_l_kind_1_58 = l_kind_1;
                    v47 = l_v50_59;
                    l_kind_0 = l_l_kind_1_58;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                local v401 = if l_kind_0 == "identifier" then v105() else v104();
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_60 = v50;
                    local l_l_kind_1_59 = l_kind_1;
                    v47 = l_v50_60;
                    l_kind_0 = l_l_kind_1_59;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                local v406 = if l_kind_0 == ")" then v103(")") else nil;
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_61 = v50;
                    local l_l_kind_1_60 = l_kind_1;
                    v47 = l_v50_61;
                    l_kind_0 = l_l_kind_1_60;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                local v411 = if l_kind_0 == "{" then v103("{") else nil;
                local v412 = v106("}");
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_62 = v50;
                    local l_l_kind_1_61 = l_kind_1;
                    v47 = l_v50_62;
                    l_kind_0 = l_l_kind_1_61;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                local v417 = if l_kind_0 == "}" then v103("}") else nil;
                table.insert(v387, {
                    keyword = v391, 
                    condition = {
                        left = v396, 
                        right = v406, 
                        value = v401
                    }, 
                    block = {
                        left = v411, 
                        right = v417, 
                        value = v412
                    }, 
                    span = vector.create(v391.span.x, if v417 then v417.span.y else v412.span.y, 0)
                });
                v388 = false;
                continue;
            end;
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_63 = v50;
                local l_l_kind_1_62 = l_kind_1;
                v47 = l_v50_63;
                l_kind_0 = l_l_kind_1_62;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "else" then
                while l_kind_1 == "\n" do
                    v50 = v46();
                    l_kind_1 = v50.kind;
                end;
                if l_kind_1 == "if" then
                    local v422 = v103("else");
                    local v423 = v103("if");
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_64 = v50;
                        local l_l_kind_1_63 = l_kind_1;
                        v47 = l_v50_64;
                        l_kind_0 = l_l_kind_1_63;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    local v428 = if l_kind_0 == "(" then v103("(") else nil;
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_65 = v50;
                        local l_l_kind_1_64 = l_kind_1;
                        v47 = l_v50_65;
                        l_kind_0 = l_l_kind_1_64;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    local v433 = if l_kind_0 == "identifier" then v105() else v104();
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_66 = v50;
                        local l_l_kind_1_65 = l_kind_1;
                        v47 = l_v50_66;
                        l_kind_0 = l_l_kind_1_65;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    local v438 = if l_kind_0 == ")" then v103(")") else nil;
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_67 = v50;
                        local l_l_kind_1_66 = l_kind_1;
                        v47 = l_v50_67;
                        l_kind_0 = l_l_kind_1_66;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    local v443 = if l_kind_0 == "{" then v103("{") else nil;
                    local v444 = v106("}");
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_68 = v50;
                        local l_l_kind_1_67 = l_kind_1;
                        v47 = l_v50_68;
                        l_kind_0 = l_l_kind_1_67;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    local v449 = if l_kind_0 == "}" then v103("}") else nil;
                    table.insert(v387, {
                        elsekeyword = v422, 
                        keyword = v423, 
                        condition = {
                            left = v428, 
                            right = v438, 
                            value = v433
                        }, 
                        block = {
                            left = v443, 
                            right = v449, 
                            value = v444
                        }, 
                        span = vector.create(v422.span.x, if v449 then v449.span.y else v444.span.y, 0)
                    });
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_69 = v50;
            local l_l_kind_1_68 = l_kind_1;
            v47 = l_v50_69;
            l_kind_0 = l_l_kind_1_68;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        if l_kind_0 == "else" then
            v389 = v103("else");
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_70 = v50;
                local l_l_kind_1_69 = l_kind_1;
                v47 = l_v50_70;
                l_kind_0 = l_l_kind_1_69;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            local v458 = if l_kind_0 == "{" then v103("{") else nil;
            local v459 = v106("}");
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_71 = v50;
                local l_l_kind_1_70 = l_kind_1;
                v47 = l_v50_71;
                l_kind_0 = l_l_kind_1_70;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            local v464 = if l_kind_0 == "}" then v103("}") else nil;
            v390 = {
                left = v458, 
                right = v464, 
                value = v459
            };
        end;
        return {
            kind = "if", 
            ifs = v387, 
            else_keyword = v389, 
            fallback = v390, 
            span = vector.create(v387[1].span.x, if v390 and v390.right then v390.right.span.y else if v390 then v390.value.span.y else v387[#v387].span.y, 0)
        };
    end;
    v115 = function() --[[ Line: 1227 ]] --[[ Name: parse_while ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v105 (ref), v104 (ref), v106 (ref)
        local v465 = v103("while");
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_72 = v50;
            local l_l_kind_1_71 = l_kind_1;
            v47 = l_v50_72;
            l_kind_0 = l_l_kind_1_71;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v470 = if l_kind_0 == "(" then v103("(") else nil;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_73 = v50;
            local l_l_kind_1_72 = l_kind_1;
            v47 = l_v50_73;
            l_kind_0 = l_l_kind_1_72;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v475 = if l_kind_0 == "identifier" then v105() else v104();
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_74 = v50;
            local l_l_kind_1_73 = l_kind_1;
            v47 = l_v50_74;
            l_kind_0 = l_l_kind_1_73;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v480 = if l_kind_0 == ")" then v103(")") else nil;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_75 = v50;
            local l_l_kind_1_74 = l_kind_1;
            v47 = l_v50_75;
            l_kind_0 = l_l_kind_1_74;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v485 = if l_kind_0 == "{" then v103("{") else nil;
        local v486 = v106("}");
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_76 = v50;
            local l_l_kind_1_75 = l_kind_1;
            v47 = l_v50_76;
            l_kind_0 = l_l_kind_1_75;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v491 = if l_kind_0 == "}" then v103("}") else nil;
        return {
            kind = "while", 
            keyword = v465, 
            expression = {
                left = v470, 
                right = v480, 
                value = v475
            }, 
            block = {
                left = v485, 
                right = v491, 
                value = v486
            }, 
            span = vector.create(v465.span.x, if v491 then v491.span.y else v486.span.y, 0)
        };
    end;
    v116 = function() --[[ Line: 1254 ]] --[[ Name: parse_for ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v46 (copy), v108 (ref), v113 (ref)
        local v492 = v103("for");
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_77 = v50;
            local l_l_kind_1_76 = l_kind_1;
            v47 = l_v50_77;
            l_kind_0 = l_l_kind_1_76;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v497 = if l_kind_0 == "(" then v103("(") else nil;
        local v498 = v108();
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_78 = v50;
            local l_l_kind_1_77 = l_kind_1;
            v47 = l_v50_78;
            l_kind_0 = l_l_kind_1_77;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v503 = if l_kind_0 == ")" then v103(")") else nil;
        while l_kind_0 == "\n" do
            local _ = v47;
            local _ = l_kind_0;
            local l_v50_79 = v50;
            local l_l_kind_1_78 = l_kind_1;
            v47 = l_v50_79;
            l_kind_0 = l_l_kind_1_78;
            l_x_0 = l_x_1;
            v50 = v46();
            l_kind_1 = v50.kind;
            l_x_1 = v50.span.x;
        end;
        local v508 = if l_kind_0 == "|" then v113() else nil;
        return {
            kind = "for", 
            keyword = v492, 
            expression = {
                left = v497, 
                right = v503, 
                value = v498
            }, 
            call = v508, 
            span = vector.create(v492.span.x, if v508 then v508.span.y else if v503 then v503.span.y else v498.span.y, 0)
        };
    end;
    v117 = function() --[[ Line: 1277 ]] --[[ Name: parse_return ]]
        -- upvalues: v103 (copy), l_kind_0 (ref), v104 (ref)
        local v509 = v103("return");
        local l_y_2 = v509.span.y;
        local v511 = {};
        while l_kind_0 ~= "}" and l_kind_0 ~= "eof" do
            if #v511 > 0 then
                v103(",");
            end;
            local v512 = v104();
            table.insert(v511, v512);
            l_y_2 = v512.span.y;
        end;
        return {
            kind = "return", 
            values = v511, 
            keyword = v509, 
            span = vector.create(v509.span.x, l_y_2, 0)
        };
    end;
    v106 = function(v513, v514) --[[ Line: 1298 ]] --[[ Name: parse_block ]]
        -- upvalues: l_x_0 (ref), l_kind_0 (ref), v47 (ref), v50 (ref), l_kind_1 (ref), l_x_1 (ref), v46 (copy), v103 (copy), v108 (ref), v114 (ref), v115 (ref), v116 (ref), v117 (ref), v105 (ref)
        local v515 = false;
        local v516 = {};
        local v517 = nil;
        local v518 = v514 or l_x_0;
        local l_v518_0 = v518;
        while l_kind_0 ~= v513 do
            if v517 then
                local v520 = {
                    message = "expected to finish after last statement", 
                    span = v47.span
                };
                error(("%* from %* to %*"):format(v520.message, v520.span.x, v520.span.y), 0);
            end;
            while l_kind_0 == "\n" do
                local _ = v47;
                local _ = l_kind_0;
                local l_v50_80 = v50;
                local l_l_kind_1_79 = l_kind_1;
                v47 = l_v50_80;
                l_kind_0 = l_l_kind_1_79;
                l_x_0 = l_x_1;
                v50 = v46();
                l_kind_1 = v50.kind;
                l_x_1 = v50.span.x;
            end;
            if l_kind_0 == "identifier" then
                while l_kind_1 == "\n" do
                    v50 = v46();
                    l_kind_1 = v50.kind;
                end;
                if l_kind_1 == "=" then
                    local v525 = v103("identifier");
                    local v526 = v103("=");
                    local v527 = v108();
                    table.insert(v516, {
                        kind = "assign", 
                        span = vector.create(v525.span.x, v527.span.y, 0), 
                        operator = v526, 
                        left = v525, 
                        right = v527
                    });
                    v515 = true;
                end;
            end;
            if not v515 then
                while l_kind_0 == "\n" do
                    local _ = v47;
                    local _ = l_kind_0;
                    local l_v50_81 = v50;
                    local l_l_kind_1_80 = l_kind_1;
                    v47 = l_v50_81;
                    l_kind_0 = l_l_kind_1_80;
                    l_x_0 = l_x_1;
                    v50 = v46();
                    l_kind_1 = v50.kind;
                    l_x_1 = v50.span.x;
                end;
                if l_kind_0 == "if" then
                    table.insert(v516, v114());
                else
                    while l_kind_0 == "\n" do
                        local _ = v47;
                        local _ = l_kind_0;
                        local l_v50_82 = v50;
                        local l_l_kind_1_81 = l_kind_1;
                        v47 = l_v50_82;
                        l_kind_0 = l_l_kind_1_81;
                        l_x_0 = l_x_1;
                        v50 = v46();
                        l_kind_1 = v50.kind;
                        l_x_1 = v50.span.x;
                    end;
                    if l_kind_0 == "while" then
                        table.insert(v516, v115());
                    else
                        while l_kind_0 == "\n" do
                            local _ = v47;
                            local _ = l_kind_0;
                            local l_v50_83 = v50;
                            local l_l_kind_1_82 = l_kind_1;
                            v47 = l_v50_83;
                            l_kind_0 = l_l_kind_1_82;
                            l_x_0 = l_x_1;
                            v50 = v46();
                            l_kind_1 = v50.kind;
                            l_x_1 = v50.span.x;
                        end;
                        if l_kind_0 == "for" then
                            table.insert(v516, v116());
                        else
                            while l_kind_0 == "\n" do
                                local _ = v47;
                                local _ = l_kind_0;
                                local l_v50_84 = v50;
                                local l_l_kind_1_83 = l_kind_1;
                                v47 = l_v50_84;
                                l_kind_0 = l_l_kind_1_83;
                                l_x_0 = l_x_1;
                                v50 = v46();
                                l_kind_1 = v50.kind;
                                l_x_1 = v50.span.x;
                            end;
                            if l_kind_0 == "return" then
                                v517 = v117();
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v47;
                                    local _ = l_kind_0;
                                    local l_v50_85 = v50;
                                    local l_l_kind_1_84 = l_kind_1;
                                    v47 = l_v50_85;
                                    l_kind_0 = l_l_kind_1_84;
                                    l_x_0 = l_x_1;
                                    v50 = v46();
                                    l_kind_1 = v50.kind;
                                    l_x_1 = v50.span.x;
                                end;
                                if l_kind_0 == "break" then
                                    local v548 = v103("break");
                                    v517 = {
                                        kind = "break", 
                                        span = v548.span, 
                                        keyword = v548
                                    };
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v47;
                                        local _ = l_kind_0;
                                        local l_v50_86 = v50;
                                        local l_l_kind_1_85 = l_kind_1;
                                        v47 = l_v50_86;
                                        l_kind_0 = l_l_kind_1_85;
                                        l_x_0 = l_x_1;
                                        v50 = v46();
                                        l_kind_1 = v50.kind;
                                        l_x_1 = v50.span.x;
                                    end;
                                    if l_kind_0 == "continue" then
                                        local v553 = v103("continue");
                                        v517 = {
                                            kind = "continue", 
                                            span = v553.span, 
                                            keyword = v553
                                        };
                                    else
                                        while l_kind_0 == "\n" do
                                            local _ = v47;
                                            local _ = l_kind_0;
                                            local l_v50_87 = v50;
                                            local l_l_kind_1_86 = l_kind_1;
                                            v47 = l_v50_87;
                                            l_kind_0 = l_l_kind_1_86;
                                            l_x_0 = l_x_1;
                                            v50 = v46();
                                            l_kind_1 = v50.kind;
                                            l_x_1 = v50.span.x;
                                        end;
                                        if not (l_kind_0 == "identifier") then
                                            while l_kind_0 == "\n" do
                                                local _ = v47;
                                                local _ = l_kind_0;
                                                local l_v50_88 = v50;
                                                local l_l_kind_1_87 = l_kind_1;
                                                v47 = l_v50_88;
                                                l_kind_0 = l_l_kind_1_87;
                                                l_x_0 = l_x_1;
                                                v50 = v46();
                                                l_kind_1 = v50.kind;
                                                l_x_1 = v50.span.x;
                                            end;
                                            if l_kind_0 ~= "$" then
                                                while l_kind_0 == "\n" do
                                                    local _ = v47;
                                                    local _ = l_kind_0;
                                                    local l_v50_89 = v50;
                                                    local l_l_kind_1_88 = l_kind_1;
                                                    v47 = l_v50_89;
                                                    l_kind_0 = l_l_kind_1_88;
                                                    l_x_0 = l_x_1;
                                                    v50 = v46();
                                                    l_kind_1 = v50.kind;
                                                    l_x_1 = v50.span.x;
                                                end;
                                                if l_kind_0 == ";" then
                                                    local _ = v47;
                                                    local _ = l_kind_0;
                                                    local l_v50_90 = v50;
                                                    local l_l_kind_1_89 = l_kind_1;
                                                    v47 = l_v50_90;
                                                    l_kind_0 = l_l_kind_1_89;
                                                    l_x_0 = l_x_1;
                                                    v50 = v46();
                                                    l_kind_1 = v50.kind;
                                                    l_x_1 = v50.span.x;
                                                    v515 = true;
                                                elseif l_kind_0 ~= "eof" then
                                                    if l_kind_0 == v513 then
                                                        l_v518_0 = l_x_0;
                                                        break;
                                                    else
                                                        local v570 = {
                                                            message = ("cannot parse %*"):format(l_kind_0), 
                                                            span = v47.span
                                                        };
                                                        error(("%* from %* to %*"):format(v570.message, v570.span.x, v570.span.y), 0);
                                                        v515 = true;
                                                    end;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                        if not v515 then
                                            if not v515 then
                                                table.insert(v516, v105());
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v515 = false;
            l_v518_0 = l_x_0;
        end;
        return {
            span = vector.create(v518, l_v518_0, 0), 
            body = v516, 
            last_statement = v517
        };
    end;
    return v106("eof");
end;
local function v579(v572) --[[ Line: 1383 ]] --[[ Name: generate ]]
    -- upvalues: v571 (copy)
    local v573 = nil;
    v573 = function(v574, v575) --[[ Line: 1386 ]] --[[ Name: get_result ]]
        -- upvalues: v572 (copy)
        if v574 == false then
            return {
                status = "error", 
                src = v572, 
                why = v575
            };
        else
            return {
                status = "finished", 
                src = v572, 
                value = v575
            };
        end;
    end;
    local v576 = buffer.fromstring(v572);
    local l_status_0, l_result_0 = pcall(v571, v576);
    return v573(l_status_0, l_result_0);
end;
local v580 = nil;
local v581 = "ban 3d";
local l_v581_0 = v581 --[[ copy: 4 -> 8 ]];
v580 = function(v583, v584) --[[ Line: 1386 ]] --[[ Name: get_result ]]
    -- upvalues: l_v581_0 (copy)
    if v583 == false then
        return {
            status = "error", 
            src = l_v581_0, 
            why = v584
        };
    else
        return {
            status = "finished", 
            src = l_v581_0, 
            value = v584
        };
    end;
end;
v581 = buffer.fromstring("ban 3d");
local l_status_1, l_result_1 = pcall(v571, v581);
local _ = v580(l_status_1, l_result_1);
return v579;