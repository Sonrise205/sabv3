local _ = require("../roblox_packages/types");
local function _(v1) --[[ Line: 8 ]] --[[ Name: char ]]
    return (string.byte(v1));
end;
local function v404(v3, v4) --[[ Line: 13 ]] --[[ Name: parse ]]
    local v5 = 0;
    local v6 = 0;
    local v7 = buffer.len(v3);
    local function _() --[[ Line: 18 ]] --[[ Name: peek ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref)
        if v5 == v7 then
            return 0;
        else
            return (buffer.readu8(v3, v5));
        end;
    end;
    local function _() --[[ Line: 23 ]] --[[ Name: bump ]]
        -- upvalues: v5 (ref), v7 (ref)
        v5 = math.min(v5 + 1, v7);
    end;
    local function _() --[[ Line: 25 ]] --[[ Name: bump_any ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v6 (ref)
        if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
            v6 = v6 + 1;
        end;
        v5 = math.min(v5 + 1, v7);
        if v5 == v7 then
            return 0;
        else
            return (buffer.readu8(v3, v5));
        end;
    end;
    local function _(v11) --[[ Line: 34 ]] --[[ Name: eof ]]
        -- upvalues: v5 (ref), v7 (ref)
        if v7 <= v5 then
            error(v11, 0);
        end;
        return false;
    end;
    local function _() --[[ Line: 39 ]] --[[ Name: bump_peek ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref)
        v5 = math.min(v5 + 1, v7);
        if v5 == v7 then
            return 0;
        else
            return (buffer.readu8(v3, v5));
        end;
    end;
    local function _(v14) --[[ Line: 44 ]] --[[ Name: is_whitespace ]]
        local v15 = true;
        if v14 ~= 32 then
            v15 = true;
            if v14 ~= 9 then
                v15 = v14 == 13;
            end;
        end;
        return v15;
    end;
    local function _(v17) --[[ Line: 48 ]] --[[ Name: is_digit ]]
        local v18 = false;
        if v17 >= 48 then
            v18 = v17 <= 57;
        end;
        return v18;
    end;
    local function v21(v20) --[[ Line: 52 ]] --[[ Name: is_alpha ]]
        return v20 >= 97 and v20 <= 122 or v20 >= 65 and v20 <= 90 or v20 == 64 or v20 == 95;
    end;
    local function v27() --[[ Line: 59 ]] --[[ Name: string_backslash ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v6 (ref)
        local v22 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        if v22 == 13 then
            v5 = math.min(v5 + 1, v7);
            if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                v5 = math.min(v5 + 1, v7);
                v6 = v6 + 1;
                return;
            end;
        elseif v22 == 122 then
            v5 = math.min(v5 + 1, v7);
            while true do
                local v23 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                local v24 = true;
                if v23 ~= 32 then
                    v24 = true;
                    if v23 ~= 9 then
                        v24 = v23 == 13;
                    end;
                end;
                if v24 then
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                        v6 = v6 + 1;
                    end;
                    v5 = math.min(v5 + 1, v7);
                    if v5 == v7 then
                        v24 = 0;
                    else
                        v24 = buffer.readu8(v3, v5);
                    end;
                else
                    break;
                end;
            end;
        else
            if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                v6 = v6 + 1;
            end;
            v5 = math.min(v5 + 1, v7);
            if v5 == v7 then
                local _ = 0;
                return;
            else
                local _ = buffer.readu8(v3, v5);
            end;
        end;
    end;
    local function v30() --[[ Line: 80 ]] --[[ Name: quoted_string ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v27 (copy)
        local v28 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        v5 = math.min(v5 + 1, v7);
        local v29 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        while v29 ~= v28 do
            if v7 <= v5 then
                error("unterminated string", 0);
            end;
            if not false then
                if v29 == 0 or v29 == 10 or v29 == 13 then
                    has_error = true;
                    return "error";
                else
                    if v29 == 92 then
                        v5 = math.min(v5 + 1, v7);
                        v27();
                    else
                        v5 = math.min(v5 + 1, v7);
                    end;
                    if v5 == v7 then
                        v29 = 0;
                    else
                        v29 = buffer.readu8(v3, v5);
                    end;
                end;
            else
                break;
            end;
        end;
        v5 = math.min(v5 + 1, v7);
        return "string";
    end;
    local function v40() --[[ Line: 102 ]] --[[ Name: number ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v21 (copy)
        local l_v5_0 = v5;
        local v32 = 10;
        local v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        local v34 = false;
        if v33 == 45 then
            v5 = math.min(v5 + 1, v7);
            v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            v34 = true;
        end;
        if v33 == 48 then
            v5 = math.min(v5 + 1, v7);
            v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            if v33 == 120 or v33 == 88 then
                v5 = math.min(v5 + 1, v7);
                v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                v32 = 16;
            elseif v33 == 98 or v33 == 66 then
                v5 = math.min(v5 + 1, v7);
                v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                v32 = 2;
            end;
        end;
        while true do
            local l_v33_0 = v33;
            local v36 = false;
            if l_v33_0 >= 48 then
                v36 = l_v33_0 <= 57;
            end;
            if v36 or v33 == 46 or v33 == 95 then
                v5 = math.min(v5 + 1, v7);
                if v5 == v7 then
                    v33 = 0;
                else
                    v33 = buffer.readu8(v3, v5);
                end;
            else
                break;
            end;
        end;
        if v33 == 101 or v33 == 69 then
            v5 = math.min(v5 + 1, v7);
            v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            if v33 == 43 or v33 == 45 then
                v5 = math.min(v5 + 1, v7);
                v33 = v5 == v7 and 0 or buffer.readu8(v3, v5);
            end;
        end;
        while true do
            local l_v33_1 = v33;
            local v38 = false;
            if l_v33_1 >= 48 then
                v38 = l_v33_1 <= 57;
            end;
            if v38 or v21(v33) or v33 == 95 then
                v5 = math.min(v5 + 1, v7);
                if v5 == v7 then
                    v33 = 0;
                else
                    v33 = buffer.readu8(v3, v5);
                end;
            else
                break;
            end;
        end;
        local v39 = nil;
        v39 = if v32 == 10 then buffer.readstring(v3, l_v5_0, v5 - l_v5_0) else buffer.readstring(v3, l_v5_0 + 2 + (v34 and 1 or 0), v5 - l_v5_0 - 2 - (v34 and 1 or 0));
        if tonumber(string.gsub(v39, "_", ""), v32) then
            return "number";
        else
            has_error = true;
            return "error";
        end;
    end;
    local function v41() --[[ Line: 161 ]] --[[ Name: read_kind ]]
        -- upvalues: v5 (ref), v7 (ref), v3 (ref), v6 (ref), v41 (copy), v21 (copy), v40 (copy), v30 (copy)
        local v42 = v5 == v7 and 0 or buffer.readu8(v3, v5);
        if v42 == 0 then
            return "eof";
        elseif v42 == 35 then
            while v42 ~= 10 and v42 ~= 0 do
                if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 10 then
                    v6 = v6 + 1;
                end;
                v5 = math.min(v5 + 1, v7);
                if v5 == v7 then
                    v42 = 0;
                else
                    v42 = buffer.readu8(v3, v5);
                end;
            end;
            return v41();
        else
            local l_v42_0 = v42;
            local v44 = true;
            if l_v42_0 ~= 32 then
                v44 = true;
                if l_v42_0 ~= 9 then
                    v44 = l_v42_0 == 13;
                end;
            end;
            if v44 then
                v5 = math.min(v5 + 1, v7);
                return "whitespace";
            elseif v21(v42) then
                v44 = v5;
                while true do
                    v5 = math.min(v5 + 1, v7);
                    v42 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                    if v21(v42) then
                        continue;
                    end;
                    local l_v42_1 = v42;
                    l_v42_0 = false;
                    if l_v42_1 >= 48 then
                        l_v42_0 = l_v42_1 <= 57;
                    end;
                    if not l_v42_0 and v42 ~= 45 then
                        break;
                    end;
                end;
                l_v42_0 = buffer.readstring(v3, v44, v5 - v44);
                if l_v42_0 == "true" then
                    return "true";
                elseif l_v42_0 == "false" then
                    return "false";
                elseif l_v42_0 == "nil" then
                    return "nil";
                elseif l_v42_0 == "return" then
                    return "return";
                elseif l_v42_0 == "for" then
                    return "for";
                elseif l_v42_0 == "while" then
                    return "while";
                elseif l_v42_0 == "if" then
                    return "if";
                elseif l_v42_0 == "else" then
                    return "else";
                elseif l_v42_0 == "break" then
                    return "break";
                elseif l_v42_0 == "continue" then
                    return "continue";
                else
                    return "identifier";
                end;
            else
                l_v42_0 = v42;
                v44 = false;
                if l_v42_0 >= 48 then
                    v44 = l_v42_0 <= 57;
                end;
                if v44 or v42 == 45 then
                    return (v40());
                elseif v42 == 34 then
                    return (v30());
                elseif v42 == 39 then
                    return (v30());
                elseif v42 == 46 then
                    l_v42_0 = v5 == v7 and 0 or buffer.readu8(v3, v5);
                    v44 = false;
                    if l_v42_0 >= 48 then
                        v44 = l_v42_0 <= 57;
                    end;
                    if v44 then
                        v5 = v5 - 1;
                        return (v40());
                    else
                        v5 = math.min(v5 + 1, v7);
                        return ".";
                    end;
                elseif v42 == 61 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return "==";
                    else
                        return "=";
                    end;
                elseif v42 == 126 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return "~=";
                    else
                        has_error = true;
                        return "error";
                    end;
                elseif v42 == 62 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return ">=";
                    else
                        return ">";
                    end;
                elseif v42 == 60 then
                    v5 = math.min(v5 + 1, v7);
                    if (v5 == v7 and 0 or buffer.readu8(v3, v5)) == 61 then
                        return "<=";
                    else
                        return "<";
                    end;
                elseif v42 == 36 then
                    v5 = math.min(v5 + 1, v7);
                    return "$";
                elseif v42 == 40 then
                    v5 = math.min(v5 + 1, v7);
                    return "(";
                elseif v42 == 41 then
                    v5 = math.min(v5 + 1, v7);
                    return ")";
                elseif v42 == 123 then
                    v5 = math.min(v5 + 1, v7);
                    return "{";
                elseif v42 == 125 then
                    v5 = math.min(v5 + 1, v7);
                    return "}";
                elseif v42 == 91 then
                    v5 = math.min(v5 + 1, v7);
                    return "[";
                elseif v42 == 93 then
                    v5 = math.min(v5 + 1, v7);
                    return "]";
                elseif v42 == 124 then
                    v5 = math.min(v5 + 1, v7);
                    return "|";
                elseif v42 == 10 then
                    v5 = math.min(v5 + 1, v7);
                    return "\n";
                elseif v42 == 59 then
                    v5 = math.min(v5 + 1, v7);
                    return ";";
                elseif v42 == 44 then
                    v5 = math.min(v5 + 1, v7);
                    return ",";
                else
                    l_v42_0 = v42;
                    v44 = true;
                    if l_v42_0 ~= 32 then
                        v44 = true;
                        if l_v42_0 ~= 9 then
                            v44 = l_v42_0 == 13;
                        end;
                    end;
                    if v44 then
                        v5 = math.min(v5 + 1, v7);
                        return v41();
                    else
                        error(("no symbol matching %*"):format((string.char(v42))), 0);
                        return "error";
                    end;
                end;
            end;
        end;
    end;
    local function v48() --[[ Line: 301 ]] --[[ Name: next_token ]]
        -- upvalues: v5 (ref), v41 (copy), v3 (ref)
        local l_v5_1 = v5;
        local v47 = v41();
        while v47 == "whitespace" or v47 == "comment" do
            l_v5_1 = v5;
            v47 = v41();
        end;
        return {
            kind = v47, 
            text = buffer.readstring(v3, l_v5_1, v5 - l_v5_1), 
            span = vector.create(l_v5_1, v5, 0)
        };
    end;
    local v49 = v48();
    local l_kind_0 = v49.kind;
    local l_x_0 = v49.span.x;
    local v52 = v48();
    local l_kind_1 = v52.kind;
    local l_x_1 = v52.span.x;
    local function _() --[[ Line: 324 ]] --[[ Name: consume ]]
        -- upvalues: v49 (ref), l_kind_0 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy)
        local l_v49_0 = v49;
        local l_l_kind_0_0 = l_kind_0;
        local l_v52_0 = v52;
        local l_l_kind_1_0 = l_kind_1;
        v49 = l_v52_0;
        l_kind_0 = l_l_kind_1_0;
        l_x_0 = l_x_1;
        v52 = v48();
        l_kind_1 = v52.kind;
        l_x_1 = v52.span.x;
        return l_v49_0, l_l_kind_0_0;
    end;
    local _ = function(v60) --[[ Line: 334 ]] --[[ Name: current_is ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_1 = v52;
            local l_l_kind_1_1 = l_kind_1;
            v49 = l_v52_1;
            l_kind_0 = l_l_kind_1_1;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        return l_kind_0 == v60;
    end;
    local function _(v66) --[[ Line: 342 ]] --[[ Name: lookahead_is ]]
        -- upvalues: l_kind_1 (ref), v52 (ref), v48 (copy)
        while l_kind_1 == "\n" do
            v52 = v48();
            l_kind_1 = v52.kind;
        end;
        return l_kind_1 == v66;
    end;
    local function _() --[[ Line: 351 ]] --[[ Name: yield ]]
        -- upvalues: v4 (copy), v3 (ref), v7 (ref), v49 (ref), v48 (copy), l_kind_0 (ref), v52 (ref), l_kind_1 (ref)
        if v4 then
            local v68 = coroutine.yield();
            assert(typeof(v68) == "buffer");
            v3 = v68;
            v7 = buffer.len(v68);
            v49 = v48();
            l_kind_0 = v49.kind;
            v52 = v48();
            l_kind_1 = v52.kind;
        end;
    end;
    local function _(v70) --[[ Line: 365 ]] --[[ Name: display ]]
        local l_kind_2 = v70.kind;
        if l_kind_2 == "identifier" or l_kind_2 == "number" or l_kind_2 == "string" then
            return l_kind_2;
        elseif v70.kind == "error" then
            return "error '" .. v70.text .. "'";
        else
            return "'" .. l_kind_2 .. "'";
        end;
    end;
    local function v76(v73, v74) --[[ Line: 377 ]] --[[ Name: report ]]
        -- upvalues: v49 (ref)
        local v75 = {
            message = v73, 
            span = v74 or v49.span
        };
        error(("%* from %* to %*"):format(v75.message, v75.span.x, v75.span.y), 0);
    end;
    local function v84(v77) --[[ Line: 386 ]] --[[ Name: expect_failure ]]
        -- upvalues: v76 (copy), v49 (ref), l_kind_0 (ref)
        local l_v76_0 = v76;
        local v79 = "expected %*, but got %* of %* instead";
        local v80 = {
            kind = v77
        };
        local l_kind_3 = v80.kind;
        local v82 = if not (l_kind_3 ~= "identifier" and l_kind_3 ~= "number") or l_kind_3 == "string" then l_kind_3 else if v80.kind == "error" then "error '" .. v80.text .. "'" else "'" .. l_kind_3 .. "'";
        l_kind_3 = v49;
        local l_kind_4 = l_kind_3.kind;
        return l_v76_0((v79:format(v82, if not (l_kind_4 ~= "identifier" and l_kind_4 ~= "number") or l_kind_4 == "string" then l_kind_4 else if l_kind_3.kind == "error" then "error '" .. l_kind_3.text .. "'" else "'" .. l_kind_4 .. "'", l_kind_0)));
    end;
    local function v108(v85) --[[ Line: 396 ]] --[[ Name: expect ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v4 (copy), v3 (ref), v7 (ref), v84 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_2 = v52;
            local l_l_kind_1_2 = l_kind_1;
            v49 = l_v52_2;
            l_kind_0 = l_l_kind_1_2;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == v85 then
            local l_v49_3 = v49;
            local _ = l_kind_0;
            local l_v52_3 = v52;
            local l_l_kind_1_3 = l_kind_1;
            v49 = l_v52_3;
            l_kind_0 = l_l_kind_1_3;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
            return l_v49_3;
        elseif l_kind_0 == "eof" and v4 then
            if v4 then
                local v94 = coroutine.yield();
                assert(typeof(v94) == "buffer");
                v3 = v94;
                v7 = buffer.len(v94);
                v49 = v48();
                l_kind_0 = v49.kind;
                v52 = v48();
                l_kind_1 = v52.kind;
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_4 = v52;
                local l_l_kind_1_4 = l_kind_1;
                v49 = l_v52_4;
                l_kind_0 = l_l_kind_1_4;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == v85 then
                local l_v49_5 = v49;
                local _ = l_kind_0;
                local l_v52_5 = v52;
                local l_l_kind_1_5 = l_kind_1;
                v49 = l_v52_5;
                l_kind_0 = l_l_kind_1_5;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                return l_v49_5;
            else
                local v103 = "expected %*, but got %* of %* instead";
                local v104 = {
                    kind = v85
                };
                local l_kind_5 = v104.kind;
                local v106 = if not (l_kind_5 ~= "identifier" and l_kind_5 ~= "number") or l_kind_5 == "string" then l_kind_5 else if v104.kind == "error" then "error '" .. v104.text .. "'" else "'" .. l_kind_5 .. "'";
                l_kind_5 = v49;
                local l_kind_6 = l_kind_5.kind;
                v103 = {
                    message = v103:format(v106, if not (l_kind_6 ~= "identifier" and l_kind_6 ~= "number") or l_kind_6 == "string" then l_kind_6 else if l_kind_5.kind == "error" then "error '" .. l_kind_5.text .. "'" else "'" .. l_kind_6 .. "'", l_kind_0), 
                    span = v49.span
                };
                error(("%* from %* to %*"):format(v103.message, v103.span.x, v103.span.y), 0);
                return nil;
            end;
        else
            return v84(v85);
        end;
    end;
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
    local v119 = nil;
    local v120 = nil;
    local v121 = nil;
    local v122 = nil;
    v115 = function() --[[ Line: 422 ]] --[[ Name: parse_var_root ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v108 (copy), v113 (ref), v76 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_6 = v52;
            local l_l_kind_1_6 = l_kind_1;
            v49 = l_v52_6;
            l_kind_0 = l_l_kind_1_6;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "identifier" then
            local v127 = v108("identifier");
            return {
                kind = "global", 
                span = v127.span, 
                token = v127
            };
        else
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_7 = v52;
                local l_l_kind_1_7 = l_kind_1;
                v49 = l_v52_7;
                l_kind_0 = l_l_kind_1_7;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "$" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "identifier" then
                    local v132 = v108("$");
                    local v133 = v108("identifier");
                    return {
                        kind = "name", 
                        span = vector.create(v132.span.x, v133.span.y, 0), 
                        name = v133
                    };
                end;
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_8 = v52;
                local l_l_kind_1_8 = l_kind_1;
                v49 = l_v52_8;
                l_kind_0 = l_l_kind_1_8;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "$" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "(" then
                    local v138 = v108("$");
                    v108("(");
                    local v139 = v113();
                    local v140 = v108(")");
                    return {
                        kind = "paren", 
                        span = vector.create(v138.span.x, v140.span.y, 0), 
                        expr = v139
                    };
                end;
            end;
            local l_v76_1 = v76;
            local v142 = "expected identifier, got %*";
            local l_v52_9 = v52;
            local l_kind_7 = l_v52_9.kind;
            return l_v76_1((v142:format(if not (l_kind_7 ~= "identifier" and l_kind_7 ~= "number") or l_kind_7 == "string" then l_kind_7 else if l_v52_9.kind == "error" then "error '" .. l_v52_9.text .. "'" else "'" .. l_kind_7 .. "'")));
        end;
    end;
    v116 = function() --[[ Line: 451 ]] --[[ Name: parse_var_suffix ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v108 (copy), v113 (ref), v76 (copy)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_10 = v52;
            local l_l_kind_1_9 = l_kind_1;
            v49 = l_v52_10;
            l_kind_0 = l_l_kind_1_9;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "." then
            local v149 = v108(".");
            local v150 = v108("identifier");
            return {
                kind = "nameindex", 
                span = vector.create(v149.span.x, v150.span.y, 0), 
                name = v150
            };
        else
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_11 = v52;
                local l_l_kind_1_10 = l_kind_1;
                v49 = l_v52_11;
                l_kind_0 = l_l_kind_1_10;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "[" then
                local v155 = v108("[");
                local v156 = v113();
                local v157 = v108("]");
                return {
                    kind = "exprindex", 
                    span = vector.create(v155.span.x, v157.span.y, 0), 
                    expr = v156
                };
            else
                return v76("invalid");
            end;
        end;
    end;
    v117 = function() --[[ Line: 474 ]] --[[ Name: parse_var_suffixes ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v116 (ref)
        local v158 = false;
        local v159 = {};
        while true do
            if l_kind_0 == "\n" then
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_12 = v52;
                local l_l_kind_1_11 = l_kind_1;
                v49 = l_v52_12;
                l_kind_0 = l_l_kind_1_11;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                continue;
            end;
            v158 = l_kind_0 == ".";
            if not v158 then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_13 = v52;
                    local l_l_kind_1_12 = l_kind_1;
                    v49 = l_v52_13;
                    l_kind_0 = l_l_kind_1_12;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 ~= "[" then
                    break;
                end;
            end;
            v158 = false;
            table.insert(v159, (v116()));
        end;
        return v159;
    end;
    v114 = function() --[[ Line: 483 ]] --[[ Name: parse_var ]]
        -- upvalues: v115 (ref), v117 (ref)
        local v168 = v115();
        local v169 = if v168.kind ~= "global" then v117() else {};
        return {
            span = vector.create(v168.span.x, if #v169 > 0 then v169[#v169].span.y else v168.span.y, 0), 
            prefix = v168, 
            suffixes = v169
        };
    end;
    v113 = function() --[[ Line: 501 ]] --[[ Name: parse_expression_or_command ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v110 (ref), v4 (copy), v3 (ref), v7 (ref), v113 (ref), v109 (ref)
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_14 = v52;
            local l_l_kind_1_13 = l_kind_1;
            v49 = l_v52_14;
            l_kind_0 = l_l_kind_1_13;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "identifier" then
            return v110();
        elseif l_kind_0 == "eof" and v4 then
            if v4 then
                local v174 = coroutine.yield();
                assert(typeof(v174) == "buffer");
                v3 = v174;
                v7 = buffer.len(v174);
                v49 = v48();
                l_kind_0 = v49.kind;
                v52 = v48();
                l_kind_1 = v52.kind;
            end;
            return v113();
        else
            return v109();
        end;
    end;
    v118 = function() --[[ Line: 512 ]] --[[ Name: parse_function_body ]]
        -- upvalues: v108 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v4 (copy), v3 (ref), v7 (ref), v111 (ref)
        local l_x_2 = v108("|").span.x;
        local v176 = {};
        local v177 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_15 = v52;
                local l_l_kind_1_14 = l_kind_1;
                v49 = l_v52_15;
                l_kind_0 = l_l_kind_1_14;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                continue;
            end;
            if not (l_kind_0 == "|") then
                if l_kind_0 == "eof" and v4 then
                    if v4 then
                        local v182 = coroutine.yield();
                        assert(typeof(v182) == "buffer");
                        v3 = v182;
                        v7 = buffer.len(v182);
                        v49 = v48();
                        l_kind_0 = v49.kind;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                    end;
                else
                    if not v177 then
                        v108(",");
                    end;
                    table.insert(v176, v108("identifier"));
                    v177 = false;
                end;
            else
                break;
            end;
        end;
        v108("|");
        v108("{");
        local v183 = v111("}");
        return {
            span = vector.create(l_x_2, v108("}").span.y, 0), 
            arguments = v176, 
            block = v183
        };
    end;
    v112 = function() --[[ Line: 541 ]] --[[ Name: parse_lambda ]]
        -- upvalues: v118 (ref)
        local v184 = v118();
        return {
            kind = "lambda", 
            body = v184, 
            span = v184.span
        };
    end;
    parse_table = function() --[[ Line: 550 ]] --[[ Name: parse_table ]]
        -- upvalues: v108 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v109 (ref)
        local l_x_3 = v108("{").span.x;
        local v186 = {};
        local v187 = true;
        while true do
            if l_kind_0 == "\n" then
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_16 = v52;
                local l_l_kind_1_15 = l_kind_1;
                v49 = l_v52_16;
                l_kind_0 = l_l_kind_1_15;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
                continue;
            end;
            if not (l_kind_0 == "}") then
                if not v187 then
                    v108(",");
                end;
                v187 = false;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_17 = v52;
                    local l_l_kind_1_16 = l_kind_1;
                    v49 = l_v52_17;
                    l_kind_0 = l_l_kind_1_16;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "identifier" then
                    while l_kind_1 == "\n" do
                        v52 = v48();
                        l_kind_1 = v52.kind;
                    end;
                    if l_kind_1 == "=" then
                        local v196 = v108("identifier");
                        v108("=");
                        local v197 = v109();
                        table.insert(v186, {
                            kind = "namekey", 
                            name = v196, 
                            value = v197
                        });
                        continue;
                    end;
                end;
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_18 = v52;
                    local l_l_kind_1_17 = l_kind_1;
                    v49 = l_v52_18;
                    l_kind_0 = l_l_kind_1_17;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "[" then
                    v108("[");
                    local v202 = v109();
                    v108("]");
                    v108("=");
                    local v203 = v109();
                    table.insert(v186, {
                        kind = "exprkey", 
                        key = v202, 
                        value = v203
                    });
                else
                    local v204 = v109();
                    table.insert(v186, {
                        kind = "nokey", 
                        value = v204
                    });
                end;
            else
                break;
            end;
        end;
        local l_y_0 = v108("}").span.y;
        return {
            fields = v186, 
            span = vector.create(l_x_3, l_y_0, 0)
        };
    end;
    parse_vector = function() --[[ Line: 593 ]] --[[ Name: parse_vector ]]
        -- upvalues: v108 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v109 (ref)
        local v206 = v108("[");
        local v207 = {};
        local v208 = 0;
        while v208 < 3 do
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_19 = v52;
                local l_l_kind_1_18 = l_kind_1;
                v49 = l_v52_19;
                l_kind_0 = l_l_kind_1_18;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if not (l_kind_0 == "]") then
                if v208 ~= 0 then
                    v108(",");
                end;
                v208 = v208 + 1;
                v207[v208] = v109();
            else
                break;
            end;
        end;
        local v213 = v108("]");
        return {
            kind = "vector", 
            span = vector.create(v206.span.x, v213.span.y, 0), 
            contents = v207
        };
    end;
    v109 = function() --[[ Line: 616 ]] --[[ Name: parse_expression ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v108 (copy), v110 (ref), v109 (ref), v114 (ref), v112 (ref), v4 (copy), v3 (ref), v7 (ref), v76 (copy)
        local v214 = false;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_20 = v52;
            local l_l_kind_1_19 = l_kind_1;
            v49 = l_v52_20;
            l_kind_0 = l_l_kind_1_19;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "$" then
            while l_kind_1 == "\n" do
                v52 = v48();
                l_kind_1 = v52.kind;
            end;
            if l_kind_1 == "(" then
                local l_x_4 = v108("$").span.x;
                local v220 = nil;
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if not (l_kind_1 == "$") then
                    while l_kind_1 == "\n" do
                        v52 = v48();
                        l_kind_1 = v52.kind;
                    end;
                    if l_kind_1 ~= "identifier" then
                        v108("(");
                        v220 = v109();
                        v214 = true;
                    end;
                end;
                if not v214 then
                    v108("(");
                    v220 = v110();
                end;
                v214 = false;
                local l_y_1 = v108(")").span.y;
                return {
                    kind = "evaluate", 
                    body = v220, 
                    span = vector.create(l_x_4, l_y_1, 0)
                };
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_21 = v52;
            local l_l_kind_1_20 = l_kind_1;
            v49 = l_v52_21;
            l_kind_0 = l_l_kind_1_20;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "$" then
            local v226 = v114();
            return {
                kind = "var", 
                var = v226, 
                span = v226.span
            };
        else
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_22 = v52;
                local l_l_kind_1_21 = l_kind_1;
                v49 = l_v52_22;
                l_kind_0 = l_l_kind_1_21;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "string" then
                local v231 = v108("string");
                return {
                    kind = "string", 
                    token = v231, 
                    span = v231.span
                };
            else
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_23 = v52;
                    local l_l_kind_1_22 = l_kind_1;
                    v49 = l_v52_23;
                    l_kind_0 = l_l_kind_1_22;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "number" then
                    local v236 = v108("number");
                    return {
                        kind = "number", 
                        token = v236, 
                        span = v236.span
                    };
                else
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_24 = v52;
                        local l_l_kind_1_23 = l_kind_1;
                        v49 = l_v52_24;
                        l_kind_0 = l_l_kind_1_23;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if l_kind_0 == "true" then
                        local v241 = v108("true");
                        return {
                            kind = "boolean", 
                            token = v241, 
                            span = v241.span
                        };
                    else
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_25 = v52;
                            local l_l_kind_1_24 = l_kind_1;
                            v49 = l_v52_25;
                            l_kind_0 = l_l_kind_1_24;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if l_kind_0 == "false" then
                            local v246 = v108("false");
                            return {
                                kind = "boolean", 
                                token = v246, 
                                span = v246.span
                            };
                        else
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_26 = v52;
                                local l_l_kind_1_25 = l_kind_1;
                                v49 = l_v52_26;
                                l_kind_0 = l_l_kind_1_25;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if l_kind_0 == "identifier" then
                                local v251 = v108("identifier");
                                return {
                                    kind = "string", 
                                    token = {
                                        kind = "string", 
                                        text = ("\"%*\""):format(v251.text), 
                                        span = v251.span
                                    }, 
                                    span = v251.span
                                };
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v49;
                                    local _ = l_kind_0;
                                    local l_v52_27 = v52;
                                    local l_l_kind_1_26 = l_kind_1;
                                    v49 = l_v52_27;
                                    l_kind_0 = l_l_kind_1_26;
                                    l_x_0 = l_x_1;
                                    v52 = v48();
                                    l_kind_1 = v52.kind;
                                    l_x_1 = v52.span.x;
                                end;
                                if l_kind_0 == "|" then
                                    return v112();
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v49;
                                        local _ = l_kind_0;
                                        local l_v52_28 = v52;
                                        local l_l_kind_1_27 = l_kind_1;
                                        v49 = l_v52_28;
                                        l_kind_0 = l_l_kind_1_27;
                                        l_x_0 = l_x_1;
                                        v52 = v48();
                                        l_kind_1 = v52.kind;
                                        l_x_1 = v52.span.x;
                                    end;
                                    if l_kind_0 == "{" then
                                        local v260 = parse_table();
                                        return {
                                            kind = "table", 
                                            table = v260, 
                                            span = v260.span
                                        };
                                    else
                                        while l_kind_0 == "\n" do
                                            local _ = v49;
                                            local _ = l_kind_0;
                                            local l_v52_29 = v52;
                                            local l_l_kind_1_28 = l_kind_1;
                                            v49 = l_v52_29;
                                            l_kind_0 = l_l_kind_1_28;
                                            l_x_0 = l_x_1;
                                            v52 = v48();
                                            l_kind_1 = v52.kind;
                                            l_x_1 = v52.span.x;
                                        end;
                                        if l_kind_0 == "[" then
                                            return parse_vector();
                                        elseif l_kind_0 == "eof" and v4 then
                                            if v4 then
                                                local v265 = coroutine.yield();
                                                assert(typeof(v265) == "buffer");
                                                v3 = v265;
                                                v7 = buffer.len(v265);
                                                v49 = v48();
                                                l_kind_0 = v49.kind;
                                                v52 = v48();
                                                l_kind_1 = v52.kind;
                                            end;
                                            return v109();
                                        else
                                            return v76((("expected expression, got %*"):format(l_kind_0)));
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v110 = function() --[[ Line: 696 ]] --[[ Name: parse_command ]]
        -- upvalues: v114 (ref), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v109 (ref)
        local v266 = v114();
        local v267 = {};
        while l_kind_0 ~= "\n" do
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_30 = v52;
                local l_l_kind_1_29 = l_kind_1;
                v49 = l_v52_30;
                l_kind_0 = l_l_kind_1_29;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if not (l_kind_0 == "$") then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_31 = v52;
                    local l_l_kind_1_30 = l_kind_1;
                    v49 = l_v52_31;
                    l_kind_0 = l_l_kind_1_30;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if not (l_kind_0 == "string") then
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_32 = v52;
                        local l_l_kind_1_31 = l_kind_1;
                        v49 = l_v52_32;
                        l_kind_0 = l_l_kind_1_31;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if not (l_kind_0 == "number") then
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_33 = v52;
                            local l_l_kind_1_32 = l_kind_1;
                            v49 = l_v52_33;
                            l_kind_0 = l_l_kind_1_32;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if not (l_kind_0 == "true") then
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_34 = v52;
                                local l_l_kind_1_33 = l_kind_1;
                                v49 = l_v52_34;
                                l_kind_0 = l_l_kind_1_33;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if not (l_kind_0 == "false") then
                                while l_kind_0 == "\n" do
                                    local _ = v49;
                                    local _ = l_kind_0;
                                    local l_v52_35 = v52;
                                    local l_l_kind_1_34 = l_kind_1;
                                    v49 = l_v52_35;
                                    l_kind_0 = l_l_kind_1_34;
                                    l_x_0 = l_x_1;
                                    v52 = v48();
                                    l_kind_1 = v52.kind;
                                    l_x_1 = v52.span.x;
                                end;
                                if not (l_kind_0 == "identifier") then
                                    while l_kind_0 == "\n" do
                                        local _ = v49;
                                        local _ = l_kind_0;
                                        local l_v52_36 = v52;
                                        local l_l_kind_1_35 = l_kind_1;
                                        v49 = l_v52_36;
                                        l_kind_0 = l_l_kind_1_35;
                                        l_x_0 = l_x_1;
                                        v52 = v48();
                                        l_kind_1 = v52.kind;
                                        l_x_1 = v52.span.x;
                                    end;
                                    if not (l_kind_0 == "{") then
                                        while l_kind_0 == "\n" do
                                            local _ = v49;
                                            local _ = l_kind_0;
                                            local l_v52_37 = v52;
                                            local l_l_kind_1_36 = l_kind_1;
                                            v49 = l_v52_37;
                                            l_kind_0 = l_l_kind_1_36;
                                            l_x_0 = l_x_1;
                                            v52 = v48();
                                            l_kind_1 = v52.kind;
                                            l_x_1 = v52.span.x;
                                        end;
                                        if not (l_kind_0 == "|") then
                                            while l_kind_0 == "\n" do
                                                local _ = v49;
                                                local _ = l_kind_0;
                                                local l_v52_38 = v52;
                                                local l_l_kind_1_37 = l_kind_1;
                                                v49 = l_v52_38;
                                                l_kind_0 = l_l_kind_1_37;
                                                l_x_0 = l_x_1;
                                                v52 = v48();
                                                l_kind_1 = v52.kind;
                                                l_x_1 = v52.span.x;
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
            table.insert(v267, (v109()));
        end;
        local v304 = if #v267 > 0 then v267[#v267].span.y else v266.span.y;
        return {
            kind = "command", 
            prefix = v266, 
            arguments = v267, 
            span = vector.create(v266.span.x, v304, 0)
        };
    end;
    v119 = function() --[[ Line: 731 ]] --[[ Name: parse_if ]]
        -- upvalues: v108 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v110 (ref), v109 (ref), v111 (ref)
        local l_x_5 = v108("if").span.x;
        local v306 = {};
        local v307 = nil;
        local v308 = true;
        local v309 = 0;
        while true do
            if v308 then
                v108("(");
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_39 = v52;
                    local l_l_kind_1_38 = l_kind_1;
                    v49 = l_v52_39;
                    l_kind_0 = l_l_kind_1_38;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                local v314 = if l_kind_0 == "identifier" then v110() else v109();
                v108(")");
                v108("{");
                local v315 = v111("}");
                v309 = v108("}").span.y;
                table.insert(v306, {
                    condition = v314, 
                    block = v315
                });
                v308 = false;
                continue;
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_40 = v52;
                local l_l_kind_1_39 = l_kind_1;
                v49 = l_v52_40;
                l_kind_0 = l_l_kind_1_39;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "else" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "if" then
                    v108("else");
                    v108("if");
                    v108("(");
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_41 = v52;
                        local l_l_kind_1_40 = l_kind_1;
                        v49 = l_v52_41;
                        l_kind_0 = l_l_kind_1_40;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    local v324 = if l_kind_0 == "identifier" then v110() else v109();
                    v108(")");
                    v108("{");
                    local v325 = v111("}");
                    v309 = v108("}").span.y;
                    table.insert(v306, {
                        condition = v324, 
                        block = v325
                    });
                else
                    break;
                end;
            else
                break;
            end;
        end;
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_42 = v52;
            local l_l_kind_1_41 = l_kind_1;
            v49 = l_v52_42;
            l_kind_0 = l_l_kind_1_41;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        if l_kind_0 == "else" then
            v108("else");
            v108("{");
            v307 = v111("}");
            v309 = v108("}").span.y;
        end;
        return {
            kind = "if", 
            ifs = v306, 
            fallback = v307, 
            span = vector.create(l_x_5, v309, 0)
        };
    end;
    v120 = function() --[[ Line: 791 ]] --[[ Name: parse_while ]]
        -- upvalues: v108 (copy), l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v110 (ref), v109 (ref), v111 (ref)
        local l_x_6 = v108("while").span.x;
        v108("(");
        while l_kind_0 == "\n" do
            local _ = v49;
            local _ = l_kind_0;
            local l_v52_43 = v52;
            local l_l_kind_1_42 = l_kind_1;
            v49 = l_v52_43;
            l_kind_0 = l_l_kind_1_42;
            l_x_0 = l_x_1;
            v52 = v48();
            l_kind_1 = v52.kind;
            l_x_1 = v52.span.x;
        end;
        local v335 = if l_kind_0 == "identifier" then v110() else v109();
        v108(")");
        v108("{");
        local v336 = v111("}");
        local l_y_2 = v108("}").span.y;
        return {
            kind = "while", 
            expression = v335, 
            block = v336, 
            span = vector.create(l_x_6, l_y_2, 0)
        };
    end;
    v121 = function() --[[ Line: 812 ]] --[[ Name: parse_for ]]
        -- upvalues: v108 (copy), v113 (ref), v118 (ref)
        local l_x_7 = v108("for").span.x;
        v108("(");
        local v339 = v113();
        v108(")");
        local v340 = v118();
        return {
            kind = "for", 
            expression = v339, 
            call = v340, 
            span = vector.create(l_x_7, v340.span.y, 0)
        };
    end;
    v122 = function() --[[ Line: 827 ]] --[[ Name: parse_return ]]
        -- upvalues: v108 (copy), l_kind_0 (ref), v109 (ref)
        local l_span_0 = v108("return").span;
        local l_x_8 = l_span_0.x;
        local l_y_3 = l_span_0.y;
        local v344 = {};
        while l_kind_0 ~= "}" and l_kind_0 ~= "eof" do
            if #v344 > 0 then
                v108(",");
            end;
            local v345 = v109();
            table.insert(v344, v345);
            l_y_3 = v345.span.y;
        end;
        return {
            kind = "return", 
            values = v344, 
            span = vector.create(l_x_8, l_y_3, 0)
        };
    end;
    v111 = function(v346, v347) --[[ Line: 848 ]] --[[ Name: parse_block ]]
        -- upvalues: l_kind_0 (ref), v49 (ref), v52 (ref), l_kind_1 (ref), l_x_0 (ref), l_x_1 (ref), v48 (copy), v108 (copy), v113 (ref), v119 (ref), v120 (ref), v121 (ref), v122 (ref), v110 (ref), v4 (copy), v3 (ref), v7 (ref)
        local v348 = false;
        local v349 = {};
        local v350 = nil;
        local v351 = v347 or 0;
        local l_v351_0 = v351;
        while l_kind_0 ~= v346 do
            if v350 then
                local v353 = {
                    message = "expected to finish after last statement", 
                    span = v49.span
                };
                error(("%* from %* to %*"):format(v353.message, v353.span.x, v353.span.y), 0);
            end;
            while l_kind_0 == "\n" do
                local _ = v49;
                local _ = l_kind_0;
                local l_v52_44 = v52;
                local l_l_kind_1_43 = l_kind_1;
                v49 = l_v52_44;
                l_kind_0 = l_l_kind_1_43;
                l_x_0 = l_x_1;
                v52 = v48();
                l_kind_1 = v52.kind;
                l_x_1 = v52.span.x;
            end;
            if l_kind_0 == "identifier" then
                while l_kind_1 == "\n" do
                    v52 = v48();
                    l_kind_1 = v52.kind;
                end;
                if l_kind_1 == "=" then
                    local v358 = v108("identifier");
                    v108("=");
                    local v359 = v113();
                    table.insert(v349, {
                        kind = "assign", 
                        left = v358, 
                        right = v359
                    });
                    v348 = true;
                end;
            end;
            if not v348 then
                while l_kind_0 == "\n" do
                    local _ = v49;
                    local _ = l_kind_0;
                    local l_v52_45 = v52;
                    local l_l_kind_1_44 = l_kind_1;
                    v49 = l_v52_45;
                    l_kind_0 = l_l_kind_1_44;
                    l_x_0 = l_x_1;
                    v52 = v48();
                    l_kind_1 = v52.kind;
                    l_x_1 = v52.span.x;
                end;
                if l_kind_0 == "if" then
                    table.insert(v349, v119());
                else
                    while l_kind_0 == "\n" do
                        local _ = v49;
                        local _ = l_kind_0;
                        local l_v52_46 = v52;
                        local l_l_kind_1_45 = l_kind_1;
                        v49 = l_v52_46;
                        l_kind_0 = l_l_kind_1_45;
                        l_x_0 = l_x_1;
                        v52 = v48();
                        l_kind_1 = v52.kind;
                        l_x_1 = v52.span.x;
                    end;
                    if l_kind_0 == "while" then
                        table.insert(v349, v120());
                    else
                        while l_kind_0 == "\n" do
                            local _ = v49;
                            local _ = l_kind_0;
                            local l_v52_47 = v52;
                            local l_l_kind_1_46 = l_kind_1;
                            v49 = l_v52_47;
                            l_kind_0 = l_l_kind_1_46;
                            l_x_0 = l_x_1;
                            v52 = v48();
                            l_kind_1 = v52.kind;
                            l_x_1 = v52.span.x;
                        end;
                        if l_kind_0 == "for" then
                            table.insert(v349, v121());
                        else
                            while l_kind_0 == "\n" do
                                local _ = v49;
                                local _ = l_kind_0;
                                local l_v52_48 = v52;
                                local l_l_kind_1_47 = l_kind_1;
                                v49 = l_v52_48;
                                l_kind_0 = l_l_kind_1_47;
                                l_x_0 = l_x_1;
                                v52 = v48();
                                l_kind_1 = v52.kind;
                                l_x_1 = v52.span.x;
                            end;
                            if l_kind_0 == "return" then
                                v350 = v122();
                            else
                                while l_kind_0 == "\n" do
                                    local _ = v49;
                                    local _ = l_kind_0;
                                    local l_v52_49 = v52;
                                    local l_l_kind_1_48 = l_kind_1;
                                    v49 = l_v52_49;
                                    l_kind_0 = l_l_kind_1_48;
                                    l_x_0 = l_x_1;
                                    v52 = v48();
                                    l_kind_1 = v52.kind;
                                    l_x_1 = v52.span.x;
                                end;
                                if l_kind_0 == "break" then
                                    local l_span_1 = v108("break").span;
                                    v350 = {
                                        kind = "break", 
                                        span = l_span_1
                                    };
                                else
                                    while l_kind_0 == "\n" do
                                        local _ = v49;
                                        local _ = l_kind_0;
                                        local l_v52_50 = v52;
                                        local l_l_kind_1_49 = l_kind_1;
                                        v49 = l_v52_50;
                                        l_kind_0 = l_l_kind_1_49;
                                        l_x_0 = l_x_1;
                                        v52 = v48();
                                        l_kind_1 = v52.kind;
                                        l_x_1 = v52.span.x;
                                    end;
                                    if l_kind_0 == "continue" then
                                        local v385 = v108("continue");
                                        v350 = {
                                            kind = "continue", 
                                            span = v385
                                        };
                                    else
                                        while l_kind_0 == "\n" do
                                            local _ = v49;
                                            local _ = l_kind_0;
                                            local l_v52_51 = v52;
                                            local l_l_kind_1_50 = l_kind_1;
                                            v49 = l_v52_51;
                                            l_kind_0 = l_l_kind_1_50;
                                            l_x_0 = l_x_1;
                                            v52 = v48();
                                            l_kind_1 = v52.kind;
                                            l_x_1 = v52.span.x;
                                        end;
                                        if not (l_kind_0 == "identifier") then
                                            while l_kind_0 == "\n" do
                                                local _ = v49;
                                                local _ = l_kind_0;
                                                local l_v52_52 = v52;
                                                local l_l_kind_1_51 = l_kind_1;
                                                v49 = l_v52_52;
                                                l_kind_0 = l_l_kind_1_51;
                                                l_x_0 = l_x_1;
                                                v52 = v48();
                                                l_kind_1 = v52.kind;
                                                l_x_1 = v52.span.x;
                                            end;
                                            if l_kind_0 ~= "$" then
                                                while l_kind_0 == "\n" do
                                                    local _ = v49;
                                                    local _ = l_kind_0;
                                                    local l_v52_53 = v52;
                                                    local l_l_kind_1_52 = l_kind_1;
                                                    v49 = l_v52_53;
                                                    l_kind_0 = l_l_kind_1_52;
                                                    l_x_0 = l_x_1;
                                                    v52 = v48();
                                                    l_kind_1 = v52.kind;
                                                    l_x_1 = v52.span.x;
                                                end;
                                                if l_kind_0 == ";" then
                                                    local _ = v49;
                                                    local _ = l_kind_0;
                                                    local l_v52_54 = v52;
                                                    local l_l_kind_1_53 = l_kind_1;
                                                    v49 = l_v52_54;
                                                    l_kind_0 = l_l_kind_1_53;
                                                    l_x_0 = l_x_1;
                                                    v52 = v48();
                                                    l_kind_1 = v52.kind;
                                                    l_x_1 = v52.span.x;
                                                    v348 = true;
                                                elseif l_kind_0 == "eof" and v346 ~= "eof" and v4 then
                                                    if v4 then
                                                        local v402 = coroutine.yield();
                                                        assert(typeof(v402) == "buffer");
                                                        v3 = v402;
                                                        v7 = buffer.len(v402);
                                                        v49 = v48();
                                                        l_kind_0 = v49.kind;
                                                        v52 = v48();
                                                        l_kind_1 = v52.kind;
                                                        v348 = true;
                                                    else
                                                        v348 = true;
                                                    end;
                                                elseif l_kind_0 == v346 then
                                                    l_v351_0 = l_x_0;
                                                    break;
                                                else
                                                    local v403 = {
                                                        message = ("cannot parse %*"):format(l_kind_0), 
                                                        span = v49.span
                                                    };
                                                    error(("%* from %* to %*"):format(v403.message, v403.span.x, v403.span.y), 0);
                                                    v348 = true;
                                                end;
                                            end;
                                        end;
                                        if not v348 then
                                            if not v348 then
                                                if not v348 then
                                                    if not v348 then
                                                        table.insert(v349, v110());
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v348 = false;
            l_v351_0 = l_x_0;
        end;
        return {
            span = vector.create(v351, l_v351_0, 0), 
            body = v349, 
            last_statement = v350
        };
    end;
    return v111("eof");
end;
return function(v405, v406) --[[ Line: 932 ]] --[[ Name: generate ]]
    -- upvalues: v404 (copy)
    local l_v405_0 = v405;
    local v408 = coroutine.create(v404);
    local v409 = nil;
    local function v412(v410) --[[ Line: 937 ]] --[[ Name: append ]]
        -- upvalues: l_v405_0 (ref), v409 (ref), v408 (copy), v406 (copy)
        l_v405_0 = l_v405_0 .. v410;
        local v411 = buffer.fromstring(l_v405_0);
        return v409(coroutine.resume(v408, v411, v406));
    end;
    local function v415(v413) --[[ Line: 943 ]] --[[ Name: overwrite ]]
        -- upvalues: l_v405_0 (ref), v409 (ref), v408 (copy), v406 (copy)
        l_v405_0 = v413;
        local v414 = buffer.fromstring(v413);
        return v409(coroutine.resume(v408, v414, v406));
    end;
    v409 = function(v416, v417) --[[ Line: 949 ]] --[[ Name: get_result ]]
        -- upvalues: v408 (copy), l_v405_0 (ref), v412 (copy), v415 (copy)
        if coroutine.status(v408) == "suspended" then
            return {
                status = "pending", 
                src = l_v405_0, 
                append = v412, 
                set = v415
            };
        elseif v416 == false then
            return {
                status = "error", 
                src = l_v405_0, 
                why = v417
            };
        elseif coroutine.status(v408) == "dead" then
            return {
                status = "finished", 
                src = l_v405_0, 
                value = v417
            };
        else
            error("?");
            return;
        end;
    end;
    return v415(v405);
end;