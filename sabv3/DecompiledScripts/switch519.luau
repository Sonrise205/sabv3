if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.throw);
local v1 = require(script.Parent.graph);
local l_create_node_0 = v1.create_node;
local l_evaluate_node_0 = v1.evaluate_node;
local l_push_child_to_scope_0 = v1.push_child_to_scope;
local l_destroy_0 = v1.destroy;
local l_assert_stable_scope_0 = v1.assert_stable_scope;
local l_push_scope_0 = v1.push_scope;
local l_pop_scope_0 = v1.pop_scope;
return function(v9) --[[ Line: 17 ]] --[[ Name: switch ]]
    -- upvalues: l_assert_stable_scope_0 (copy), l_destroy_0 (copy), v0 (copy), l_create_node_0 (copy), l_push_scope_0 (copy), l_pop_scope_0 (copy), l_evaluate_node_0 (copy), l_push_child_to_scope_0 (copy)
    local v10 = l_assert_stable_scope_0();
    return function(v11) --[[ Line: 20 ]]
        -- upvalues: v9 (copy), l_destroy_0 (ref), v0 (ref), l_create_node_0 (ref), v10 (copy), l_push_scope_0 (ref), l_pop_scope_0 (ref), l_evaluate_node_0 (ref), l_push_child_to_scope_0 (ref)
        local v12 = nil;
        local v13 = nil;
        local v19 = l_create_node_0(v10, function(v14) --[[ Line: 24 ]] --[[ Name: update ]]
            -- upvalues: v11 (copy), v9 (ref), v13 (ref), v12 (ref), l_destroy_0 (ref), v0 (ref), l_create_node_0 (ref), v10 (ref), l_push_scope_0 (ref), l_pop_scope_0 (ref)
            local v15 = v11[v9()];
            if v15 == v13 then
                return v14;
            else
                v13 = v15;
                if v12 then
                    l_destroy_0(v12);
                    v12 = nil;
                end;
                if v15 == nil then
                    return nil;
                else
                    if type(v15) ~= "function" then
                        v0("map must map a value to a function");
                    end;
                    local v16 = l_create_node_0(v10, false, false);
                    v12 = v16;
                    l_push_scope_0(v16);
                    local l_status_0, l_result_0 = pcall(v15);
                    l_pop_scope_0();
                    if not l_status_0 then
                        error(l_result_0, 0);
                    end;
                    return l_result_0;
                end;
            end;
        end, nil);
        l_evaluate_node_0(v19);
        return function() --[[ Line: 58 ]]
            -- upvalues: l_push_child_to_scope_0 (ref), v19 (copy)
            l_push_child_to_scope_0(v19);
            return v19.cache;
        end;
    end;
end;