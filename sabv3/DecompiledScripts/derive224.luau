if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.graph);
local l_create_node_0 = v0.create_node;
local l_push_child_to_scope_0 = v0.push_child_to_scope;
local l_assert_stable_scope_0 = v0.assert_stable_scope;
local l_evaluate_node_0 = v0.evaluate_node;
return function(v5) --[[ Line: 9 ]] --[[ Name: derive ]]
    -- upvalues: l_create_node_0 (copy), l_assert_stable_scope_0 (copy), l_evaluate_node_0 (copy), l_push_child_to_scope_0 (copy)
    local v6 = l_create_node_0(l_assert_stable_scope_0(), v5, false);
    l_evaluate_node_0(v6);
    return function() --[[ Line: 14 ]]
        -- upvalues: l_push_child_to_scope_0 (ref), v6 (copy)
        l_push_child_to_scope_0(v6);
        return v6.cache;
    end;
end;