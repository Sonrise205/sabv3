if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.graph);
local l_create_node_0 = v0.create_node;
local l_assert_stable_scope_0 = v0.assert_stable_scope;
local l_evaluate_node_0 = v0.evaluate_node;
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: effect ]]
    -- upvalues: l_create_node_0 (copy), l_assert_stable_scope_0 (copy), l_evaluate_node_0 (copy)
    local v6 = l_create_node_0(l_assert_stable_scope_0(), v4, v5);
    l_evaluate_node_0(v6);
end;