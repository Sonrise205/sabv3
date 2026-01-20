if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.throw);
local v1 = require(script.Parent.flags);
local v2 = require(script.Parent.graph);
local l_create_node_0 = v2.create_node;
local l_create_source_node_0 = v2.create_source_node;
local l_push_child_to_scope_0 = v2.push_child_to_scope;
local l_update_descendants_0 = v2.update_descendants;
local l_assert_stable_scope_0 = v2.assert_stable_scope;
local l_push_scope_0 = v2.push_scope;
local l_pop_scope_0 = v2.pop_scope;
local l_evaluate_node_0 = v2.evaluate_node;
local l_destroy_0 = v2.destroy;
local function v15(v12) --[[ Line: 20 ]] --[[ Name: check_primitives ]]
    -- upvalues: v1 (copy), v0 (copy)
    if not v1.strict then
        return;
    else
        for _, v14 in next, v12 do
            if type(v14) ~= "table" and type(v14) ~= "userdata" and type(v14) ~= "function" then
                v0("table source map cannot return primitives");
            end;
        end;
        return;
    end;
end;
local function v41(v16, v17) --[[ Line: 29 ]] --[[ Name: indexes ]]
    -- upvalues: l_assert_stable_scope_0 (copy), l_create_node_0 (copy), l_destroy_0 (copy), l_push_scope_0 (copy), l_create_source_node_0 (copy), l_push_child_to_scope_0 (copy), l_pop_scope_0 (copy), l_update_descendants_0 (copy), v15 (copy), l_evaluate_node_0 (copy)
    local v18 = l_assert_stable_scope_0();
    local v19 = l_create_node_0(v18, false, false);
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local function v39(v25) --[[ Line: 39 ]] --[[ Name: update_children ]]
        -- upvalues: v20 (copy), v23 (copy), l_destroy_0 (ref), v24 (copy), v21 (copy), v22 (copy), l_push_scope_0 (ref), v19 (copy), l_create_node_0 (ref), l_create_source_node_0 (ref), v17 (copy), l_push_child_to_scope_0 (ref), l_pop_scope_0 (ref), l_update_descendants_0 (ref), v15 (ref)
        for v26 in next, v20 do
            if v25[v26] == nil then
                table.insert(v23, v26);
            end;
        end;
        for _, v28 in next, v23 do
            l_destroy_0(v24[v28]);
            v20[v28] = nil;
            v21[v28] = nil;
            v22[v28] = nil;
            v24[v28] = nil;
        end;
        table.clear(v23);
        l_push_scope_0(v19);
        for v29, v30 in next, v25 do
            local v31 = v20[v29];
            if v31 ~= v30 then
                if v31 == nil then
                    local v32 = l_create_node_0(v19, false, false);
                    v24[v29] = v32;
                    local v33 = l_create_source_node_0(v30);
                    l_push_scope_0(v32);
                    local l_status_0, l_result_0 = pcall(v17, function() --[[ Line: 74 ]]
                        -- upvalues: l_push_child_to_scope_0 (ref), v33 (copy)
                        l_push_child_to_scope_0(v33);
                        return v33.cache;
                    end, v29);
                    l_pop_scope_0();
                    if not l_status_0 then
                        l_pop_scope_0();
                        error(l_result_0, 0);
                    end;
                    v22[v29] = v33;
                    v21[v29] = l_result_0;
                else
                    v22[v29].cache = v30;
                    l_update_descendants_0(v22[v29]);
                end;
                v20[v29] = v30;
            end;
        end;
        l_pop_scope_0();
        local v36 = table.create(#v24);
        for _, v38 in next, v21 do
            table.insert(v36, v38);
        end;
        v15(v36);
        return v36;
    end;
    local v40 = l_create_node_0(v18, function() --[[ Line: 108 ]]
        -- upvalues: v39 (copy), v16 (copy)
        return (v39(v16()));
    end, false);
    l_evaluate_node_0(v40);
    return function() --[[ Line: 114 ]]
        -- upvalues: l_push_child_to_scope_0 (ref), v40 (copy)
        l_push_child_to_scope_0(v40);
        return v40.cache;
    end;
end;
local function v70(v42, v43) --[[ Line: 120 ]] --[[ Name: values ]]
    -- upvalues: l_assert_stable_scope_0 (copy), l_create_node_0 (copy), v1 (copy), v0 (copy), l_push_scope_0 (copy), l_create_source_node_0 (copy), l_push_child_to_scope_0 (copy), l_pop_scope_0 (copy), l_update_descendants_0 (copy), l_destroy_0 (copy), v15 (copy), l_evaluate_node_0 (copy)
    local v44 = l_assert_stable_scope_0();
    local v45 = l_create_node_0(v44, false, false);
    local v46 = {};
    local v47 = {};
    local v48 = {};
    local v49 = {};
    local v50 = {};
    local function v68(v51) --[[ Line: 130 ]] --[[ Name: update_children ]]
        -- upvalues: v46 (ref), v47 (ref), v1 (ref), v0 (ref), l_push_scope_0 (ref), v45 (copy), l_create_node_0 (ref), v50 (copy), l_create_source_node_0 (ref), v43 (copy), l_push_child_to_scope_0 (ref), l_pop_scope_0 (ref), v49 (copy), v48 (copy), l_update_descendants_0 (ref), l_destroy_0 (ref), v15 (ref)
        local l_v46_0 = v46;
        local l_v47_0 = v47;
        if v1.strict then
            local v54 = {};
            for _, v56 in next, v51 do
                if v54[v56] ~= nil then
                    v0("duplicate table value detected");
                end;
                v54[v56] = true;
            end;
        end;
        l_push_scope_0(v45);
        for v57, v58 in next, v51 do
            l_v47_0[v58] = v57;
            local v59 = l_v46_0[v58];
            if v59 == nil then
                local v60 = l_create_node_0(v45, false, false);
                v50[v58] = v60;
                local v61 = l_create_source_node_0(v57);
                l_push_scope_0(v60);
                local l_status_1, l_result_1 = pcall(v43, v58, function() --[[ Line: 159 ]]
                    -- upvalues: l_push_child_to_scope_0 (ref), v61 (copy)
                    l_push_child_to_scope_0(v61);
                    return v61.cache;
                end);
                l_pop_scope_0();
                if not l_status_1 then
                    l_pop_scope_0();
                    error(l_result_1, 0);
                end;
                v49[v58] = v61;
                v48[v58] = l_result_1;
            else
                if v59 ~= v57 then
                    v49[v58].cache = v57;
                    l_update_descendants_0(v49[v58]);
                end;
                l_v46_0[v58] = nil;
            end;
        end;
        l_pop_scope_0();
        for v64 in next, l_v46_0 do
            l_destroy_0(v50[v64]);
            v48[v64] = nil;
            v49[v64] = nil;
            v50[v64] = nil;
        end;
        table.clear(l_v46_0);
        v46 = l_v47_0;
        v47 = l_v46_0;
        local v65 = table.create(#v50);
        for _, v67 in next, v48 do
            table.insert(v65, v67);
        end;
        v15(v65);
        return v65;
    end;
    local v69 = l_create_node_0(v44, function() --[[ Line: 207 ]]
        -- upvalues: v68 (copy), v42 (copy)
        return (v68(v42()));
    end, false);
    l_evaluate_node_0(v69);
    return function() --[[ Line: 213 ]]
        -- upvalues: l_push_child_to_scope_0 (ref), v69 (copy)
        l_push_child_to_scope_0(v69);
        return v69.cache;
    end;
end;
return function() --[[ Line: 219 ]]
    -- upvalues: v41 (copy), v70 (copy)
    return v41, v70;
end;