if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.graph);
local l_create_node_0 = v0.create_node;
local l_assert_stable_scope_0 = v0.assert_stable_scope;
local l_evaluate_node_0 = v0.evaluate_node;
create_implicit_effect = function(v4, v5) --[[ Line: 9 ]] --[[ Name: create_implicit_effect ]]
    -- upvalues: l_evaluate_node_0 (copy), l_create_node_0 (copy), l_assert_stable_scope_0 (copy)
    l_evaluate_node_0(l_create_node_0(l_assert_stable_scope_0(), v4, v5));
end;
local function v7(v6) --[[ Line: 19 ]] --[[ Name: update_property_effect ]]
    v6.instance[v6.property] = v6.source();
    return v6;
end;
local function v9(v8) --[[ Line: 29 ]] --[[ Name: update_parent_effect ]]
    v8.instance.Parent = v8.parent();
    return v8;
end;
local function v19(v10) --[[ Line: 42 ]] --[[ Name: update_children_effect ]]
    local l_cur_children_set_0 = v10.cur_children_set;
    local l_new_children_set_0 = v10.new_children_set;
    local v13 = v10.children();
    if type(v13) ~= "table" then
        v13 = {
            v13
        };
    end;
    local function v14(v15) --[[ Line: 52 ]] --[[ Name: process_child ]]
        -- upvalues: v14 (copy), l_new_children_set_0 (copy), l_cur_children_set_0 (copy), v10 (copy)
        if type(v15) == "table" then
            for _, v17 in next, v15 do
                v14(v17);
            end;
            return;
        elseif l_new_children_set_0[v15] then
            return;
        else
            l_new_children_set_0[v15] = true;
            if not l_cur_children_set_0[v15] then
                v15.Parent = v10.instance;
                return;
            else
                l_cur_children_set_0[v15] = nil;
                return;
            end;
        end;
    end;
    v14(v13);
    for v18 in next, l_cur_children_set_0 do
        v18.Parent = nil;
    end;
    table.clear(l_cur_children_set_0);
    v10.cur_children_set = l_new_children_set_0;
    v10.new_children_set = l_cur_children_set_0;
    return v10;
end;
return {
    property = function(v20, v21, v22) --[[ Line: 82 ]] --[[ Name: property ]]
        -- upvalues: v7 (copy)
        return create_implicit_effect(v7, {
            instance = v20, 
            property = v21, 
            source = v22
        });
    end, 
    parent = function(v23, v24) --[[ Line: 90 ]] --[[ Name: parent ]]
        -- upvalues: v9 (copy)
        return create_implicit_effect(v9, {
            instance = v23, 
            parent = v24
        });
    end, 
    children = function(v25, v26) --[[ Line: 97 ]] --[[ Name: children ]]
        -- upvalues: v19 (copy)
        return create_implicit_effect(v19, {
            instance = v25, 
            cur_children_set = {}, 
            new_children_set = {}, 
            children = v26
        });
    end
};