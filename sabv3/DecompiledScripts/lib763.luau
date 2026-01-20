local _ = require("../roblox_packages/types");
local function _(v1) --[[ Line: 8 ]] --[[ Name: error_handler ]]
    error(v1);
end;
local function v3(...) --[[ Line: 10 ]] --[[ Name: LOG ]]

end;
return function() --[[ Line: 15 ]] --[[ Name: create_vm ]]
    -- upvalues: v3 (copy)
    local v4 = os.clock();
    local v5 = {};
    local v6 = {};
    local v7 = {};
    local v8 = table.create(255);
    local v9 = 1;
    local v10 = 0;
    local v11 = 0;
    local function _(v12) --[[ Line: 25 ]] --[[ Name: PUSH ]]
        -- upvalues: v8 (ref), v11 (ref)
        v8[v11 + 1] = v12;
        v11 = v11 + 1;
    end;
    local function _() --[[ Line: 31 ]] --[[ Name: POP ]]
        -- upvalues: v11 (ref), v8 (ref)
        v11 = v11 - 1;
        return v8[v11 + 1];
    end;
    local function v18(v15) --[[ Line: 37 ]] --[[ Name: POPN ]]
        -- upvalues: v11 (ref), v8 (ref)
        local l_v11_0 = v11;
        local v17 = v11 - v15 + 1;
        v11 = v11 - v15;
        return unpack(v8, v17, l_v11_0);
    end;
    local function _(v19) --[[ Line: 45 ]] --[[ Name: GET ]]
        -- upvalues: v11 (ref), v8 (ref)
        if v19 < 0 then
            v19 = v11 + v19 + 1;
        end;
        if v11 < v19 then
            return nil;
        else
            return v8[v19];
        end;
    end;
    local function v26(v21, _, v23, ...) --[[ Line: 51 ]] --[[ Name: call_success ]]
        -- upvalues: v8 (ref), v11 (ref)
        if not v23 then
            error(("%*"):format((table.concat({
                ...
            }, " "))), 0);
        end;
        for v24 = 1, math.min(v21, select("#", ...)) do
            local v25 = select(v24, ...);
            v8[v11 + 1] = v25;
            v11 = v11 + 1;
        end;
    end;
    local function v27(v28) --[[ Line: 64 ]] --[[ Name: process ]]
        -- upvalues: v4 (ref), v18 (copy), v11 (ref), v8 (ref), v26 (copy), v9 (ref), v7 (ref), v5 (ref), v6 (ref), v10 (ref), v27 (copy), v3 (ref)
        if os.clock() > v4 + 30 then
            error("reached execution time limit", 0);
        end;
        if v28.kind == "call" then
            local l_arguments_0 = v28.arguments;
            local v30 = {
                v18(l_arguments_0)
            };
            v11 = v11 - 1;
            local v31 = v8[v11 + 1];
            v26(v28.results, typeof(v31), pcall(v31, unpack(v30)));
            return;
        elseif v28.kind == "goto" then
            v9 = v28.to - 1;
            return;
        elseif v28.kind == "index" then
            local l_v11_1 = v11;
            local v33 = v11 - 2 + 1;
            v11 = v11 - 2;
            local v34, v35 = unpack(v8, v33, l_v11_1);
            local l_v34_0 = v34;
            local l_v35_0 = v35;
            l_v11_1, v33 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_v34_0 (copy), l_v35_0 (copy)
                return l_v34_0[l_v35_0];
            end);
            if not l_v11_1 then
                error(("attempt to index %* with %*"):format(typeof(l_v34_0), (tostring(l_v35_0))), 0);
            end;
            v8[v11 + 1] = v33;
            v11 = v11 + 1;
            return;
        else
            if v28.kind == "jump_if" then
                v11 = v11 - 1;
                if not v8[v11 + 1] then
                    v9 = v28.to - 1;
                    v11 = 0;
                    return;
                end;
            elseif v28.kind == "jump_if_not_nil" then
                local v38 = 1;
                if v38 < 0 then
                    v38 = v11 + v38 + 1;
                end;
                if (if v11 < v38 then nil else v8[v38]) == nil then
                    v9 = v28.to - 1;
                    v11 = 0;
                    return;
                end;
            elseif v28.kind == "push_boolean" then
                local l_b_0 = v28.b;
                v8[v11 + 1] = l_b_0;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_cmd" then
                local v40 = v7[v28.name];
                v8[v11 + 1] = v40;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_function" then
                local l_body_0 = v28.body;
                local function v44(...) --[[ Line: 106 ]] --[[ Name: VM_FN ]]
                    -- upvalues: v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v11 (ref), v9 (ref), v10 (ref), v28 (copy), l_body_0 (copy), v27 (ref)
                    local v42 = {
                        start = v4, 
                        locals = v5, 
                        globals = v6, 
                        commands = v7, 
                        stack = v8, 
                        n = v11, 
                        instruction_at = v9, 
                        instruction_end = v10
                    };
                    local v43 = {
                        ...
                    };
                    v5 = {};
                    v4 = os.clock();
                    v8 = v43;
                    v11 = v28.arguments;
                    v9 = 1;
                    v10 = #l_body_0;
                    while v9 <= v10 do
                        v27(l_body_0[v9]);
                        v9 = v9 + 1;
                    end;
                    v5 = v42.locals;
                    v6 = v42.globals;
                    v7 = v42.commands;
                    v8 = v42.stack;
                    v4 = v42.start;
                    v11 = v42.n;
                    v9 = v42.instruction_at;
                    v10 = v42.instruction_end;
                    return unpack(v43, 1, v11);
                end;
                v8[v11 + 1] = v44;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_global" then
                local v45 = v6[v28.name];
                v8[v11 + 1] = v45;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_vector" then
                v11 = v11 - 1;
                local v46 = v8[v11 + 1];
                v11 = v11 - 1;
                local v47 = v8[v11 + 1];
                v11 = v11 - 1;
                local v48 = vector.create(v8[v11 + 1], v47, v46);
                v8[v11 + 1] = v48;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_local" then
                local v49 = v5[v28.index];
                v8[v11 + 1] = v49;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_nil" then
                v8[v11 + 1] = nil;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_number" then
                local l_n_0 = v28.n;
                v8[v11 + 1] = l_n_0;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_string" then
                local l_s_0 = v28.s;
                v8[v11 + 1] = l_s_0;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "push_table" then
                local v52 = table.create(v28.alloc);
                v8[v11 + 1] = v52;
                v11 = v11 + 1;
                return;
            elseif v28.kind == "set_global" then
                local l_v6_0 = v6;
                local l_name_0 = v28.name;
                v11 = v11 - 1;
                l_v6_0[l_name_0] = v8[v11 + 1];
                return;
            elseif v28.kind == "set_local" then
                local l_v5_0 = v5;
                local l_index_0 = v28.index;
                v11 = v11 - 1;
                l_v5_0[l_index_0] = v8[v11 + 1];
                return;
            elseif v28.kind == "set_table" then
                v11 = v11 - 1;
                local v57 = v8[v11 + 1];
                v11 = v11 - 1;
                local v58 = v8[v11 + 1];
                local l_v11_2 = v11;
                if l_v11_2 < 0 then
                    l_v11_2 = v11 + l_v11_2 + 1;
                end;
                (if v11 < l_v11_2 then nil else v8[l_v11_2])[v58] = v57;
                return;
            elseif v28.kind == "return" then
                v3("stack", #v8, v8[1]);
                v9 = v10;
                return;
            elseif v28.kind == "reset" then
                v11 = 0;
                return;
            elseif v28.kind == "turn-into-iterator" then
                v11 = v11 - 1;
                local v60 = v8[v11 + 1];
                if typeof(v60) == "table" then
                    local l_pairs_0 = pairs;
                    local v62 = getmetatable(v60);
                    if typeof(v62) == "table" then
                        l_pairs_0 = v62.__iter or l_pairs_0;
                    end;
                    local v63 = pairs(v60);
                    local v64 = {};
                    local function v66() --[[ Line: 194 ]]
                        -- upvalues: v63 (copy), v60 (copy), v64 (ref)
                        local v65 = {
                            v63(v60, unpack(v64))
                        };
                        v64 = v65;
                        return unpack(v65);
                    end;
                    v8[v11 + 1] = v66;
                    v11 = v11 + 1;
                    return;
                else
                    v8[v11 + 1] = v60;
                    v11 = v11 + 1;
                end;
            end;
            return;
        end;
    end;
    local function v69(v67) --[[ Line: 205 ]] --[[ Name: run ]]
        -- upvalues: v4 (ref), v9 (ref), v10 (ref), v27 (copy), v11 (ref), v8 (ref)
        v4 = os.clock();
        v9 = 1;
        v10 = #v67;
        while v9 <= v10 do
            v27(v67[v9]);
            v9 = v9 + 1;
        end;
        local l_v11_3 = v11;
        v11 = 0;
        return l_v11_3, unpack(v8, 1, l_v11_3);
    end;
    v4 = os.clock();
    return {
        commands = v7, 
        globals = v6, 
        locals = v5, 
        run = v69
    };
end;