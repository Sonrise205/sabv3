local _ = require("../roblox_packages/types");
local function _(v1, v2) --[[ Line: 11 ]] --[[ Name: DEFINE_LOCAL ]]
    table.insert(v1.locals, v2);
end;
local function v4(v5, v6) --[[ Line: 29 ]] --[[ Name: compile ]]
    -- upvalues: v4 (copy)
    local l_instructions_0 = v6.instructions;
    local v8 = #l_instructions_0 + 1;
    local v9 = false;
    local function _(v10) --[[ Line: 34 ]] --[[ Name: INSERT ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref)
        l_instructions_0[v8] = v10;
        v8 = v8 + 1;
    end;
    local function v16(v12) --[[ Line: 39 ]] --[[ Name: GET_VALUE ]]
        -- upvalues: v6 (copy), l_instructions_0 (copy), v8 (ref)
        local v13 = table.find(v6.locals, v12);
        if v13 then
            local v14 = {
                kind = "push_local", 
                index = v13
            };
            l_instructions_0[v8] = v14;
            v8 = v8 + 1;
            return;
        else
            local v15 = {
                kind = "push_global", 
                name = v12
            };
            l_instructions_0[v8] = v15;
            v8 = v8 + 1;
            return;
        end;
    end;
    local function v21(v17) --[[ Line: 48 ]] --[[ Name: SET_VALUE ]]
        -- upvalues: v6 (copy), l_instructions_0 (copy), v8 (ref)
        local v18 = table.find(v6.locals, v17);
        if v18 then
            local v19 = {
                kind = "set_local", 
                index = v18
            };
            l_instructions_0[v8] = v19;
            v8 = v8 + 1;
            return;
        else
            local v20 = {
                kind = "set_global", 
                name = v17
            };
            l_instructions_0[v8] = v20;
            v8 = v8 + 1;
            return;
        end;
    end;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    v22 = function(v34) --[[ Line: 70 ]] --[[ Name: compile_expression ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref), v24 (ref), v22 (ref), v25 (ref), v23 (ref), v26 (ref), v33 (ref)
        if v34.kind == "boolean" then
            local v35 = {
                kind = "push_boolean", 
                b = v34.token.kind == "true"
            };
            l_instructions_0[v8] = v35;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "number" then
            local v36 = string.gsub(v34.token.text, "_", "");
            local v37 = string.sub(v34.token.text, 2);
            local v38 = v37 == "0b" and 2 or v37 == "0x" and 16 or 10;
            local v39 = tonumber(if v38 ~= 10 then string.sub(v36, 3) else v36, v38);
            if not v39 then
                error(("%* could not be converted into a number"):format(v34.token.text), 0);
            end;
            local v40 = {
                kind = "push_number", 
                n = v39
            };
            l_instructions_0[v8] = v40;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "evaluate" then
            if v34.body.kind == "command" then
                v24(v34.body, 1);
                return;
            else
                v22(v34.body);
                return;
            end;
        elseif v34.kind == "lambda" then
            v25(v34.body);
            return;
        elseif v34.kind == "nil" then
            local v41 = {
                kind = "push_nil"
            };
            l_instructions_0[v8] = v41;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "string" then
            local v42 = {
                kind = "push_string", 
                s = string.sub(v34.token.text, 2, -2)
            };
            l_instructions_0[v8] = v42;
            v8 = v8 + 1;
            return;
        elseif v34.kind == "table" then
            v23(v34.table);
            return;
        elseif v34.kind == "var" then
            v26(v34.var);
            return;
        else
            if v34.kind == "vector" then
                v33(v34);
            end;
            return;
        end;
    end;
    v33 = function(v43) --[[ Line: 119 ]] --[[ Name: compile_vector ]]
        -- upvalues: v22 (ref), l_instructions_0 (copy), v8 (ref)
        local v44 = v43.contents[1];
        local v45 = v43.contents[2];
        local v46 = v43.contents[3];
        if v44 then
            v22(v44);
        else
            local v47 = {
                kind = "push_number", 
                n = 0
            };
            l_instructions_0[v8] = v47;
            v8 = v8 + 1;
        end;
        if v45 then
            v22(v45);
        else
            local v48 = {
                kind = "push_number", 
                n = 0
            };
            l_instructions_0[v8] = v48;
            v8 = v8 + 1;
        end;
        if v46 then
            v22(v46);
        else
            local v49 = {
                kind = "push_number", 
                n = 0
            };
            l_instructions_0[v8] = v49;
            v8 = v8 + 1;
        end;
        local v50 = {
            kind = "push_vector"
        };
        l_instructions_0[v8] = v50;
        v8 = v8 + 1;
    end;
    v23 = function(v51) --[[ Line: 145 ]] --[[ Name: compile_table ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref), v22 (ref)
        local v52 = {
            kind = "push_table", 
            alloc = 1
        };
        l_instructions_0[v8] = v52;
        v8 = v8 + 1;
        v52 = 1;
        for _, v54 in v51.fields do
            if v54.kind == "exprkey" then
                v22(v54.key);
                v22(v54.value);
                local v55 = {
                    kind = "set_table"
                };
                l_instructions_0[v8] = v55;
                v8 = v8 + 1;
            elseif v54.kind == "namekey" then
                local v56 = {
                    kind = "push_string", 
                    s = v54.name.text
                };
                l_instructions_0[v8] = v56;
                v8 = v8 + 1;
                v22(v54.value);
                v56 = {
                    kind = "set_table"
                };
                l_instructions_0[v8] = v56;
                v8 = v8 + 1;
            elseif v54.kind == "nokey" then
                local v57 = {
                    kind = "push_number", 
                    n = v52
                };
                l_instructions_0[v8] = v57;
                v8 = v8 + 1;
                v22(v54.value);
                v57 = {
                    kind = "set_table"
                };
                l_instructions_0[v8] = v57;
                v8 = v8 + 1;
                v52 = v52 + 1;
            end;
        end;
    end;
    v24 = function(v58, v59) --[[ Line: 167 ]] --[[ Name: compile_command ]]
        -- upvalues: v26 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref)
        v26(v58.prefix);
        for _, v61 in v58.arguments do
            v22(v61);
        end;
        local v62 = {
            kind = "call", 
            arguments = #v58.arguments, 
            results = v59 or 1e999
        };
        l_instructions_0[v8] = v62;
        v8 = v8 + 1;
    end;
    v25 = function(v63) --[[ Line: 180 ]] --[[ Name: compile_lambda ]]
        -- upvalues: v6 (copy), v4 (ref), l_instructions_0 (copy), v8 (ref)
        local v64 = {
            locals = {}, 
            upvalues = {}, 
            instructions = {}, 
            up = v6
        };
        for v65, v66 in v63.arguments do
            local l_text_0 = v66.text;
            table.insert(v64.locals, l_text_0);
            table.insert(v64.instructions, {
                kind = "set_local", 
                index = v65
            });
        end;
        v4(v63.block, v64);
        local v68 = {
            kind = "push_function", 
            body = v64.instructions, 
            arguments = #v63.arguments
        };
        l_instructions_0[v8] = v68;
        v8 = v8 + 1;
    end;
    v26 = function(v69) --[[ Line: 201 ]] --[[ Name: compile_var ]]
        -- upvalues: l_instructions_0 (copy), v8 (ref), v16 (copy), v24 (ref), v22 (ref)
        local l_prefix_0 = v69.prefix;
        if l_prefix_0.kind == "global" then
            local v71 = {
                kind = "push_cmd", 
                name = l_prefix_0.token.text
            };
            l_instructions_0[v8] = v71;
            v8 = v8 + 1;
        elseif l_prefix_0.kind == "name" then
            v16(l_prefix_0.name.text);
        elseif l_prefix_0.kind == "paren" then
            if l_prefix_0.expr.kind == "command" then
                v24(l_prefix_0.expr);
            else
                v22(l_prefix_0.expr);
            end;
        end;
        for _, v73 in v69.suffixes do
            if v73.kind == "exprindex" then
                if v73.expr.kind == "command" then
                    v24(v73.expr, 1);
                else
                    v22(v73.expr);
                end;
                local v74 = {
                    kind = "index"
                };
                l_instructions_0[v8] = v74;
                v8 = v8 + 1;
            elseif v73.kind == "nameindex" then
                local v75 = {
                    kind = "push_string", 
                    s = v73.name.text
                };
                l_instructions_0[v8] = v75;
                v8 = v8 + 1;
                v75 = {
                    kind = "index"
                };
                l_instructions_0[v8] = v75;
                v8 = v8 + 1;
            end;
        end;
    end;
    v27 = function(v76) --[[ Line: 231 ]] --[[ Name: compile_assignment ]]
        -- upvalues: v24 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref)
        local l_text_1 = v76.left.text;
        local l_right_0 = v76.right;
        if l_right_0.kind == "command" then
            v24(l_right_0);
        else
            v22(l_right_0);
        end;
        local v79 = {
            kind = "set_global", 
            name = l_text_1
        };
        l_instructions_0[v8] = v79;
        v8 = v8 + 1;
    end;
    v28 = function(v80) --[[ Line: 243 ]] --[[ Name: compile_last ]]
        -- upvalues: v24 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref), v9 (ref)
        if v80.kind == "return" then
            for _, v82 in v80.values do
                if v82.kind == "command" then
                    v24(v82);
                else
                    v22(v82);
                end;
            end;
            local v83 = {
                kind = "return"
            };
            l_instructions_0[v8] = v83;
            v8 = v8 + 1;
            return;
        elseif v80.kind == "break" then
            assert(v9, "cannot use continue outside a loop");
            local v84 = {
                kind = "goto-pending", 
                type = "break"
            };
            l_instructions_0[v8] = v84;
            v8 = v8 + 1;
            return;
        elseif v80.kind == "continue" then
            assert(v9, "cannot use continue outside a loop");
            local v85 = {
                kind = "goto", 
                to = v9
            };
            l_instructions_0[v8] = v85;
            v8 = v8 + 1;
            return;
        else
            error((("unimplemented %*"):format(v80.kind)));
            return;
        end;
    end;
    v29 = function(v86) --[[ Line: 266 ]] --[[ Name: compile_if ]]
        -- upvalues: v8 (ref), v24 (ref), v22 (ref), l_instructions_0 (copy), v32 (ref)
        local l_v8_0 = v8;
        for _, v89 in v86.ifs do
            local l_v8_1 = v8;
            if v89.condition.kind == "command" then
                v24(v89.condition, 1);
            else
                v22(v89.condition);
            end;
            local v91 = {
                kind = "goto-pending", 
                type = "next-if"
            };
            l_instructions_0[v8] = v91;
            v8 = v8 + 1;
            v32(v89.block);
            v91 = {
                kind = "goto-pending", 
                type = "if-end"
            };
            l_instructions_0[v8] = v91;
            v8 = v8 + 1;
            for v92 = v8 - 1, l_v8_1, -1 do
                local v93 = l_instructions_0[v92];
                if v93.kind == "goto-pending" and v93.type == "next-if" then
                    l_instructions_0[v92] = {
                        kind = "jump_if", 
                        to = v8
                    };
                end;
            end;
        end;
        if v86.fallback then
            v32(v86.fallback);
        end;
        for v94 = v8 - 1, l_v8_0, -1 do
            local v95 = l_instructions_0[v94];
            if v95.kind == "goto-pending" and v95.type == "if-end" then
                l_instructions_0[v94] = {
                    kind = "goto", 
                    to = v8
                };
            end;
        end;
    end;
    v30 = function(v96) --[[ Line: 304 ]] --[[ Name: compile_for ]]
        -- upvalues: v9 (ref), v24 (ref), v22 (ref), l_instructions_0 (copy), v8 (ref), v21 (copy), v16 (copy), v32 (ref)
        local v97 = #v96.call.arguments;
        local l_v9_0 = v9;
        if v96.expression.kind == "command" then
            v24(v96.expression, 1);
        else
            v22(v96.expression);
        end;
        local v99 = {
            kind = "turn-into-iterator"
        };
        l_instructions_0[v8] = v99;
        v8 = v8 + 1;
        v21("--iterator");
        v99 = v8;
        v9 = v99;
        v16("--iterator");
        local v100 = {
            kind = "call", 
            arguments = 0, 
            results = math.max(1, v97)
        };
        l_instructions_0[v8] = v100;
        v8 = v8 + 1;
        v100 = {
            kind = "jump_if_not_nil", 
            index = 1, 
            to = 0
        };
        l_instructions_0[v8] = v100;
        v8 = v8 + 1;
        local l_v8_2 = v8;
        for v102 = #v96.call.arguments, 1, -1 do
            local v103 = v96.call.arguments[v102];
            v21(v103.text);
        end;
        local v104 = {
            kind = "reset"
        };
        l_instructions_0[v8] = v104;
        v8 = v8 + 1;
        v32(v96.call.block);
        v104 = {
            kind = "goto", 
            to = v99
        };
        l_instructions_0[v8] = v104;
        v8 = v8 + 1;
        v100.to = v8;
        for v105 = v8 - 1, l_v8_2, -1 do
            local v106 = l_instructions_0[v105];
            if v106.kind == "goto-pending" and v106.type == "break" then
                l_instructions_0[v105] = {
                    kind = "goto", 
                    to = v8
                };
            end;
        end;
        v9 = l_v9_0;
    end;
    v31 = function(v107) --[[ Line: 348 ]] --[[ Name: compile_while ]]
        -- upvalues: v8 (ref), v9 (ref), v24 (ref), v22 (ref), l_instructions_0 (copy), v32 (ref)
        local l_v8_3 = v8;
        local l_v9_1 = v9;
        v9 = l_v8_3;
        if v107.expression.kind == "command" then
            v24(v107.expression, 0);
        else
            v22(v107.expression);
        end;
        local v110 = {
            kind = "jump_if", 
            index = 1, 
            to = 0
        };
        l_instructions_0[v8] = v110;
        v8 = v8 + 1;
        local l_v8_4 = v8;
        v32(v107.block);
        local v112 = {
            kind = "goto", 
            to = l_v8_3
        };
        l_instructions_0[v8] = v112;
        v8 = v8 + 1;
        v110.to = v8;
        for v113 = v8 - 1, l_v8_4, -1 do
            local v114 = l_instructions_0[v113];
            if v114.kind == "goto-pending" and v114.type == "break" then
                l_instructions_0[v113] = {
                    kind = "goto", 
                    to = v8
                };
            end;
        end;
        v9 = l_v9_1;
    end;
    v32 = function(v115) --[[ Line: 378 ]] --[[ Name: compile_block ]]
        -- upvalues: v27 (ref), v6 (copy), v24 (ref), v30 (ref), v29 (ref), v31 (ref), v28 (ref)
        for v116, v117 in v115.body do
            if v117.kind == "assign" then
                v27(v117, v6);
            elseif v117.kind == "command" then
                v24(v117, not v115.last_statement and v116 == #v115.body and 8000 or 0);
            elseif v117.kind == "for" then
                v30(v117);
            elseif v117.kind == "if" then
                v29(v117);
            elseif v117.kind == "while" then
                v31(v117);
            else
                error((("not implemented %*"):format(v117.kind)));
            end;
        end;
        if v115.last_statement then
            v28(v115.last_statement);
        end;
    end;
    v32(v5);
    return v6.instructions;
end;
return v4;