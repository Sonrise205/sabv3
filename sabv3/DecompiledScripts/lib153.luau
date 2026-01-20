local v0 = require("./optional_ast");
local _ = require("../roblox_packages/types");
return {
    generate_analysis_info = function(v2) --[[ Line: 33 ]] --[[ Name: generate_analysis_info ]]
        -- upvalues: v0 (copy)
        local v3 = {};
        local l_where_0 = v2.where;
        local function _(v5, v6) --[[ Line: 56 ]] --[[ Name: LOG ]]
            -- upvalues: v3 (copy)
            table.insert(v3, {
                kind = v5, 
                text = v6
            });
        end;
        local function v11(v8) --[[ Line: 60 ]] --[[ Name: get_span ]]
            local _ = nil;
            local _ = nil;
            return (vector.create(if v8.left then v8.left.span.x else if v8.value then v8.value.span.x else v8.right.span.x, if v8.right then v8.right.span.y else if v8.value then v8.value.span.y else v8.left.span.y, 0));
        end;
        local function _(v12) --[[ Line: 85 ]] --[[ Name: get_text_token ]]
            -- upvalues: l_where_0 (copy)
            local l_span_0 = v12.span;
            local v14 = l_where_0 - l_span_0.x;
            return (string.sub(v12.text, 1, v14));
        end;
        local function _(v16) --[[ Line: 91 ]] --[[ Name: position_relative ]]
            -- upvalues: l_where_0 (copy)
            if l_where_0 >= v16.x and l_where_0 <= v16.y then
                return "within";
            elseif l_where_0 < v16.x then
                return "before";
            else
                return "after";
            end;
        end;
        local v18 = v0(v2.code);
        local v19 = nil;
        local function v21(v20) --[[ Line: 103 ]] --[[ Name: no_suggestions ]]
            -- upvalues: l_where_0 (copy), v3 (copy), v18 (copy)
            return {
                at = l_where_0, 
                text = v20, 
                logs = v3, 
                suggestions = {}, 
                ast = v18 and v18.status == "finished" and v18.value
            };
        end;
        if v18.status == "error" then
            local l_why_0 = v18.why;
            table.insert(v3, {
                kind = "error", 
                text = l_why_0
            });
            return (v21(""));
        else
            v19 = v18.value;
            local v23 = nil;
            local v24 = nil;
            local v25 = nil;
            local v26 = nil;
            local v27 = nil;
            local v28 = nil;
            local v29 = nil;
            local v30 = nil;
            v26 = function(v31, v32) --[[ Line: 135 ]] --[[ Name: process_command ]]
                -- upvalues: l_where_0 (copy), v2 (copy), v21 (copy), v29 (ref), v3 (copy)
                local l_span_1 = v31.prefix.span;
                local v34 = l_where_0 >= l_span_1.x and l_where_0 <= l_span_1.y and "within" or l_where_0 < l_span_1.x and "before" or "after";
                if v34 == "within" then
                    return process_variable(v31.prefix, v32);
                elseif v34 == "after" then
                    local l_prefix_0 = v31.prefix.prefix;
                    local v36 = nil;
                    if l_prefix_0.kind == "global" then
                        for _, v38 in v2.commands do
                            if v38.name == l_prefix_0.token.text then
                                v36 = v38;
                                break;
                            end;
                        end;
                    end;
                    if not v36 then
                        return (v21(""));
                    else
                        local v39 = 1;
                        local v40 = vector.create(v31.prefix.span.y + 1, v31.prefix.span.y + 1);
                        local v41 = v21("");
                        for _, v43 in v31.arguments do
                            local l_span_2 = v43.span;
                            local v45 = l_where_0 >= l_span_2.x and l_where_0 <= l_span_2.y and "within" or l_where_0 < l_span_2.x and "before" or "after";
                            if v45 == "within" then
                                v40 = v43.span;
                                v41 = v29(v43);
                                break;
                            elseif v45 == "after" then
                                v40 = vector.create(v43.span.y + 1, v43.span.y + 1, 0);
                                v39 = v39 + 1;
                            elseif v45 == "before" then
                                break;
                            end;
                        end;
                        local v46 = v36.arguments[v39];
                        if #v36.arguments < v39 then
                            v46 = v36.arguments[#v36.arguments];
                            if v46 and v46.kind ~= "variadic" then
                                if v41.text ~= v41.text:match("%s*") then
                                    local v47 = ("no argument #%*"):format(v39);
                                    table.insert(v3, {
                                        kind = "warn", 
                                        text = v47
                                    });
                                end;
                                return v41;
                            end;
                        end;
                        if v46 and v46.suggestion_generator then
                            local l_suggestion_generator_0 = v46.suggestion_generator;
                            local l_text_0 = v41.text;
                            local v50 = l_suggestion_generator_0(l_text_0);
                            for v51, v52 in v50 do
                                v50[v51] = {
                                    name = v52, 
                                    type = l_text_0, 
                                    replace = v40, 
                                    with = v52
                                };
                            end;
                            table.move(v50, 1, #v50, #v41.suggestions + 1, v41.suggestions);
                        end;
                        v41.analyzing = v41.analyzing or v46;
                        return v41;
                    end;
                else
                    return (v21(""));
                end;
            end;
            process_if = function(v53) --[[ Line: 228 ]] --[[ Name: process_if ]]
                -- upvalues: v11 (copy), l_where_0 (copy), v30 (ref), v25 (ref)
                local l_condition_0 = v53.condition;
                local v55 = v11(l_condition_0);
                if (l_where_0 >= v55.x and l_where_0 <= v55.y and "within" or l_where_0 < v55.x and "before" or "after") == "within" then
                    return v30(l_condition_0.value);
                elseif v53.block then
                    return v25(v53.block.value);
                else
                    return;
                end;
            end;
            parse_if_stat = function(v56) --[[ Line: 239 ]] --[[ Name: parse_if_stat ]]
                -- upvalues: l_where_0 (copy), v11 (copy), v25 (ref)
                for _, v58 in v56.ifs do
                    local l_span_3 = v58.span;
                    local v60 = l_where_0 >= l_span_3.x and l_where_0 <= l_span_3.y and "within" or l_where_0 < l_span_3.x and "before" or "after";
                    if v60 ~= "before" then
                        if v60 ~= "after" then
                            return process_if(v58);
                        else
                            break;
                        end;
                    end;
                end;
                local l_fallback_0 = v56.fallback;
                if l_fallback_0 then
                    local v62 = v11(l_fallback_0);
                    if (l_where_0 >= v62.x and l_where_0 <= v62.y and "within" or l_where_0 < v62.x and "before" or "after") == "within" then
                        return v25(l_fallback_0.value);
                    end;
                end;
            end;
            v27 = function(v63) --[[ Line: 253 ]] --[[ Name: process_function ]]
                -- upvalues: v21 (copy), v11 (copy), l_where_0 (copy), v25 (ref)
                if not v63.block then
                    return (v21(""));
                else
                    local v64 = v11(v63.block);
                    if (l_where_0 >= v64.x and l_where_0 <= v64.y and "within" or l_where_0 < v64.x and "before" or "after") == "within" then
                        return v25(v63.block.value);
                    else
                        return (v21(""));
                    end;
                end;
            end;
            process_var_prefix = function(v65, v66) --[[ Line: 262 ]] --[[ Name: process_var_prefix ]]
                -- upvalues: l_where_0 (copy), v2 (copy), v30 (ref), v3 (copy), v18 (copy)
                local l_prefix_1 = v65.prefix;
                local v68 = nil;
                local v69 = nil;
                local v70 = {};
                if l_prefix_1.kind == "global" then
                    local l_token_0 = l_prefix_1.token;
                    local l_span_4 = l_token_0.span;
                    local v73 = l_where_0 - l_span_4.x;
                    v69 = string.sub(l_token_0.text, 1, v73);
                    if v66 and string.sub("true", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "true", 
                            type = "true", 
                            replace = v65.span, 
                            with = "true"
                        });
                    end;
                    if v66 and string.sub("false", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "false", 
                            type = "false", 
                            replace = v65.span, 
                            with = "false"
                        });
                    end;
                    if v66 and string.sub("nil", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "nil", 
                            type = "nil", 
                            replace = v65.span, 
                            with = "nil"
                        });
                    end;
                    if not v66 and string.sub("for", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "for", 
                            type = "for", 
                            replace = v65.span, 
                            with = "for"
                        });
                    end;
                    if not v66 and string.sub("if", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "if", 
                            type = "if", 
                            replace = v65.span, 
                            with = "if"
                        });
                    end;
                    if not v66 and string.sub("while", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "while", 
                            type = "while", 
                            replace = v65.span, 
                            with = "while"
                        });
                    end;
                    if not v66 and string.sub("else", 1, #v69) == v69 then
                        table.insert(v70, {
                            name = "else", 
                            type = "else", 
                            replace = v65.span, 
                            with = "else"
                        });
                    end;
                    for _, v75 in v2.commands do
                        local v76 = string.lower(v69);
                        if string.sub(string.lower(v75.name), 1, #v76) == v76 then
                            if #v76 == #v75.name then
                                v68 = v75;
                            end;
                            table.insert(v70, {
                                name = v75.name, 
                                description = v75.description, 
                                type = "Command", 
                                replace = v65.span, 
                                with = v75.name
                            });
                        end;
                    end;
                elseif l_prefix_1.kind == "name" then
                    v69 = l_prefix_1.name and l_prefix_1.name.text or "";
                    for v77, v78 in v2.variables do
                        local v79 = string.lower(v69);
                        if string.sub(string.lower(v77), 1, #v79) == v79 then
                            if #v79 == #v77 then
                                v68 = {
                                    kind = "argument", 
                                    name = v77, 
                                    type = typeof(v78)
                                };
                            end;
                            table.insert(v70, {
                                name = v77, 
                                type = typeof(v78), 
                                replace = l_prefix_1.name and l_prefix_1.name.span or vector.create(l_prefix_1.span.x + 1, l_prefix_1.span.y), 
                                with = v77
                            });
                        end;
                    end;
                elseif l_prefix_1.kind == "paren" and l_prefix_1.expr.value then
                    return v30(l_prefix_1.expr.value);
                end;
                return {
                    at = l_where_0, 
                    text = v69, 
                    logs = v3, 
                    ast = v18.value, 
                    analyzing = v68, 
                    suggestions = v70
                };
            end;
            process_variable = function(v80, v81) --[[ Line: 400 ]] --[[ Name: process_variable ]]
                -- upvalues: l_where_0 (copy), v21 (copy), v2 (copy), v3 (copy)
                local l_span_5 = v80.prefix.span;
                if (l_where_0 >= l_span_5.x and l_where_0 <= l_span_5.y and "within" or l_where_0 < l_span_5.x and "before" or "after") == "within" then
                    return process_var_prefix(v80, v81);
                elseif v80.prefix.kind == "paren" then
                    return (v21(""));
                elseif v80.prefix.kind == "global" then
                    return (v21(""));
                else
                    local l_prefix_2 = v80.prefix;
                    l_span_5 = l_prefix_2.name and l_prefix_2.name.text;
                    if not l_span_5 then
                        return (v21(""));
                    else
                        local v84 = v2.variables[l_span_5];
                        local v85 = vector.create(v80.span.x, 0);
                        local v86 = nil;
                        if v84 == nil then
                            local v87 = ("no defined variable named \"%*\""):format(l_span_5);
                            table.insert(v3, {
                                kind = "warn", 
                                text = v87
                            });
                            return (v21(l_span_5));
                        else
                            for _, v89 in v80.suffixes do
                                if type(v84) ~= "table" and type(v84) ~= "userdata" and type(v84) ~= "vector" then
                                    local v90 = ("probably can't index \"%*\" which is a \"%*\""):format(l_span_5, (typeof(v84)));
                                    table.insert(v3, {
                                        kind = "warn", 
                                        text = v90
                                    });
                                end;
                                local l_span_6 = v89.span;
                                if (l_where_0 >= l_span_6.x and l_where_0 <= l_span_6.y and "within" or l_where_0 < l_span_6.x and "before" or "after") ~= "within" then
                                    if v89.kind == "nameindex" then
                                        local v92 = v89.name and v89.name.text;
                                        if not v92 then
                                            return (v21(v92));
                                        else
                                            v84 = v84[v92];
                                            v86 = v92;
                                        end;
                                    else
                                        return (v21(""));
                                    end;
                                elseif v89.kind == "nameindex" then
                                    local v93 = v89.name and v89.name.text;
                                    if not v93 then
                                        return (v21(v93));
                                    else
                                        v86 = v93;
                                        v85 = v89.name and v89.name.span or vector.create(v89.span.x + 1, v89.span.x + 1);
                                        break;
                                    end;
                                elseif v89.kind == "exprindex" then
                                    return (v21(""));
                                else
                                    break;
                                end;
                            end;
                            local v94 = {};
                            local v95 = nil;
                            if v84[v86] then
                                local v96 = v84[v86];
                                v95 = {
                                    kind = "argument", 
                                    name = v86, 
                                    type = typeof(v96)
                                };
                            end;
                            if type(v84) == "table" then
                                for v97, v98 in v84 do
                                    local v99 = string.lower(v86);
                                    if string.sub(string.lower(v97), 1, #v99) == v99 then
                                        table.insert(v94, {
                                            name = v97, 
                                            with = v97, 
                                            type = typeof(v98), 
                                            replace = v85
                                        });
                                    end;
                                end;
                            end;
                            return {
                                at = l_where_0, 
                                text = v86, 
                                logs = v3, 
                                analyzing = v95, 
                                suggestions = v94
                            };
                        end;
                    end;
                end;
            end;
            v29 = function(v100) --[[ Line: 497 ]] --[[ Name: process_expression ]]
                -- upvalues: v27 (ref), v11 (copy), l_where_0 (copy), v30 (ref), v29 (ref), v21 (copy)
                if v100.kind == "lambda" then
                    return v27(v100.body);
                else
                    if v100.kind == "evaluate" then
                        local v101 = v11(v100.body);
                        if (l_where_0 >= v101.x and l_where_0 <= v101.y and "within" or l_where_0 < v101.x and "before" or "after") == "within" and v100.body.value then
                            return v30(v100.body.value);
                        end;
                    elseif v100.kind == "vector" then
                        for _, v103 in v100.contents.value do
                            local l_span_7 = v103.span;
                            if (l_where_0 >= l_span_7.x and l_where_0 <= l_span_7.y and "within" or l_where_0 < l_span_7.x and "before" or "after") ~= "before" then
                                return v29(v103);
                            end;
                        end;
                    elseif v100.kind == "identifier" then
                        return (v21(v100.token.text));
                    elseif v100.kind == "string" then
                        return (v21((string.sub(v100.token.text, 2, -2))));
                    elseif v100.kind == "number" then
                        return (v21(v100.token.text));
                    elseif v100.kind == "var" then
                        return process_variable(v100.var, true);
                    end;
                    return (v21(""));
                end;
            end;
            v28 = function(v105) --[[ Line: 527 ]] --[[ Name: process_return ]]
                -- upvalues: l_where_0 (copy), v30 (ref), v21 (copy)
                for _, v107 in v105.values do
                    local l_span_8 = v107.span;
                    if (l_where_0 >= l_span_8.x and l_where_0 <= l_span_8.y and "within" or l_where_0 < l_span_8.x and "before" or "after") ~= "before" then
                        return v30(v107);
                    end;
                end;
                return (v21(""));
            end;
            v30 = function(v109) --[[ Line: 535 ]] --[[ Name: process_expression_or_command ]]
                -- upvalues: v26 (ref), v29 (ref)
                if v109.kind == "command" then
                    return v26(v109, true);
                else
                    return v29(v109);
                end;
            end;
            v23 = function(v110) --[[ Line: 543 ]] --[[ Name: process_assignment ]]
                -- upvalues: v21 (copy), l_where_0 (copy), v30 (ref)
                if not v110.right then
                    return (v21(""));
                else
                    local l_span_9 = v110.operator.span;
                    if (l_where_0 >= l_span_9.x and l_where_0 <= l_span_9.y and "within" or l_where_0 < l_span_9.x and "before" or "after") == "before" then
                        return (v21(""));
                    else
                        return v30(v110.right);
                    end;
                end;
            end;
            v24 = function(v112) --[[ Line: 551 ]] --[[ Name: process_while ]]
                -- upvalues: v11 (copy), l_where_0 (copy), v30 (ref), v25 (ref), v21 (copy)
                local v113 = v11(v112.expression);
                if (l_where_0 >= v113.x and l_where_0 <= v113.y and "within" or l_where_0 < v113.x and "before" or "after") == "within" then
                    return v30(v112.expression.value, true);
                else
                    local l_block_0 = v112.block;
                    if l_block_0 then
                        local v115 = v11(l_block_0);
                        if (l_where_0 >= v115.x and l_where_0 <= v115.y and "within" or l_where_0 < v115.x and "before" or "after") == "within" then
                            return v25(l_block_0.value);
                        end;
                    end;
                    return (v21(""));
                end;
            end;
            parse_for = function(v116) --[[ Line: 564 ]] --[[ Name: parse_for ]]
                -- upvalues: v11 (copy), l_where_0 (copy), v21 (copy), v29 (ref), v27 (ref)
                if v116.expression then
                    local v117 = v11(v116.expression);
                    if (l_where_0 >= v117.x and l_where_0 <= v117.y and "within" or l_where_0 < v117.x and "before" or "after") == "within" then
                        if v116.expression.value == nil then
                            return (v21(""));
                        else
                            return v29(v116.expression.value);
                        end;
                    end;
                end;
                if v116.call then
                    return v27(v116.call);
                else
                    return;
                end;
            end;
            v25 = function(v118) --[[ Line: 576 ]] --[[ Name: process_block ]]
                -- upvalues: l_where_0 (copy), v21 (copy), v23 (ref), v26 (ref), v28 (ref), v24 (ref)
                local v119 = nil;
                for v120, v121 in v118.body do
                    v119 = v121;
                    local l_span_10 = v121.span;
                    local v123 = l_where_0 >= l_span_10.x and l_where_0 <= l_span_10.y and "within" or l_where_0 < l_span_10.x and "before" or "after";
                    if v123 ~= "before" and (v123 ~= "after" or v120 >= #v118.body) then
                        if v119 == nil then
                            return (v21(""));
                        elseif v119.kind == "if" then
                            return (parse_if_stat(v119));
                        elseif v119.kind == "assign" then
                            return (v23(v119));
                        elseif v119.kind == "command" then
                            return (v26(v119));
                        elseif v119.kind == "return" then
                            return (v28(v119));
                        elseif v119.kind == "for" then
                            return (parse_for(v119));
                        elseif v119.kind == "while" then
                            return (v24(v119));
                        else
                            return (v21(""));
                        end;
                    end;
                end;
                return (v21(""));
            end;
            return v25(v19);
        end;
    end
};