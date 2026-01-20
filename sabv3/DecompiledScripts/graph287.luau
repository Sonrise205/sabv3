if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.throw);
local v1 = require(script.Parent.flags);
local v2 = {
    n = 0
};
local function v10(v3, v4) --[[ Line: 27 ]] --[[ Name: ycall ]]
    local v5 = coroutine.create(xpcall);
    local v7, v8, v9 = coroutine.resume(v5, v3, function(v6) --[[ Line: 29 ]] --[[ Name: efn ]]
        return debug.traceback(v6, 3);
    end, v4);
    assert(v7);
    if coroutine.status(v5) ~= "dead" then
        return false, debug.traceback(v5, "attempt to yield in reactive scope");
    else
        return v8, v9;
    end;
end;
local function v11() --[[ Line: 41 ]] --[[ Name: get_scope ]]
    -- upvalues: v2 (copy)
    return v2[v2.n];
end;
local function v14() --[[ Line: 45 ]] --[[ Name: assert_stable_scope ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v12 = v2[v2.n];
    if not v12 then
        local v13 = debug.info(2, "n");
        return v0((("cannot use %*() outside a stable or reactive scope"):format(v13)));
    else
        if v12.effect then
            v0("cannot create a new reactive scope inside another reactive scope");
        end;
        return v12;
    end;
end;
local function v17(v15, v16) --[[ Line: 58 ]] --[[ Name: push_child ]]
    table.insert(v15, v16);
    table.insert(v16.parents, v15);
end;
local function v20(v18) --[[ Line: 63 ]] --[[ Name: push_scope ]]
    -- upvalues: v2 (copy)
    local v19 = v2.n + 1;
    v2.n = v19;
    v2[v19] = v18;
end;
local function v22() --[[ Line: 69 ]] --[[ Name: pop_scope ]]
    -- upvalues: v2 (copy)
    local l_n_0 = v2.n;
    v2.n = l_n_0 - 1;
    v2[l_n_0] = nil;
end;
local function v25(v23, v24) --[[ Line: 75 ]] --[[ Name: push_cleanup ]]
    if v23.cleanups then
        table.insert(v23.cleanups, v24);
        return;
    else
        v23.cleanups = {
            v24
        };
        return;
    end;
end;
local function v31(v26) --[[ Line: 83 ]] --[[ Name: flush_cleanups ]]
    -- upvalues: v0 (copy)
    if v26.cleanups then
        for _, v28 in next, v26.cleanups do
            local l_status_0, l_result_0 = pcall(v28);
            if not l_status_0 then
                v0((("cleanup error: %*"):format(l_result_0)));
            end;
        end;
        table.clear(v26.cleanups);
    end;
end;
local function _(v32, v33) --[[ Line: 94 ]] --[[ Name: find_and_swap_pop ]]
    local v34 = table.find(v32, v33);
    local v35 = #v32;
    v32[v34] = v32[v35];
    v32[v35] = nil;
end;
local function _(v37) --[[ Line: 101 ]] --[[ Name: unparent ]]
    local l_parents_0 = v37.parents;
    for v39, v40 in l_parents_0 do
        local v41 = table.find(v40, v37);
        local v42 = #v40;
        v40[v41] = v40[v42];
        v40[v42] = nil;
        l_parents_0[v39] = nil;
    end;
end;
local function v44(v45) --[[ Line: 110 ]] --[[ Name: destroy ]]
    -- upvalues: v31 (copy), v44 (copy)
    v31(v45);
    local l_parents_1 = v45.parents;
    for v47, v48 in l_parents_1 do
        local v49 = table.find(v48, v45);
        local v50 = #v48;
        v48[v49] = v48[v50];
        v48[v50] = nil;
        l_parents_1[v47] = nil;
    end;
    if v45.owner then
        l_parents_1 = v45.owner.owned;
        local v51 = table.find(l_parents_1, v45);
        local v52 = #l_parents_1;
        l_parents_1[v51] = l_parents_1[v52];
        l_parents_1[v52] = nil;
        v45.owner = false;
    end;
    if v45.owned then
        l_parents_1 = v45.owned;
        while l_parents_1[1] do
            v44(l_parents_1[1]);
        end;
    end;
end;
local function _(v53) --[[ Line: 125 ]] --[[ Name: destroy_owned ]]
    -- upvalues: v44 (copy)
    if v53.owned then
        local l_owned_0 = v53.owned;
        while l_owned_0[1] do
            v44(l_owned_0[1]);
        end;
    end;
end;
local v56 = {
    n = 0
};
local function v70(v57) --[[ Line: 134 ]] --[[ Name: evaluate_node ]]
    -- upvalues: v1 (copy), v31 (copy), v44 (copy), v2 (copy), v10 (copy), v56 (copy), v0 (copy)
    if v1.strict then
        local l_cache_0 = v57.cache;
        for _ = 1, 2 do
            local l_cache_1 = v57.cache;
            v31(v57);
            if v57.owned then
                local l_owned_1 = v57.owned;
                while l_owned_1[1] do
                    v44(l_owned_1[1]);
                end;
            end;
            local v62 = v2.n + 1;
            v2.n = v62;
            v2[v62] = v57;
            local v63;
            v62, v63 = v10(v57.effect, l_cache_1);
            local l_n_1 = v2.n;
            v2.n = l_n_1 - 1;
            v2[l_n_1] = nil;
            if not v62 then
                table.clear(v56);
                v56.n = 0;
                v0((("effect stacktrace:\n%*"):format(v63)));
            end;
            v57.cache = v63;
        end;
        return l_cache_0 ~= v57.cache;
    else
        local l_cache_2 = v57.cache;
        v31(v57);
        if v57.owned then
            local l_owned_2 = v57.owned;
            while l_owned_2[1] do
                v44(l_owned_2[1]);
            end;
        end;
        local v67 = v2.n + 1;
        v2.n = v67;
        v2[v67] = v57;
        local v68;
        v67, v68 = pcall(v57.effect, v57.cache);
        local l_n_2 = v2.n;
        v2.n = l_n_2 - 1;
        v2[l_n_2] = nil;
        if not v67 then
            table.clear(v56);
            v56.n = 0;
            v0((("effect stacktrace:\n%*\n"):format(v68)));
        end;
        v57.cache = v68;
        return l_cache_2 ~= v68;
    end;
end;
local function _(v71) --[[ Line: 179 ]] --[[ Name: queue_children_for_update ]]
    -- upvalues: v56 (copy)
    local l_n_3 = v56.n;
    while v71[1] do
        l_n_3 = l_n_3 + 1;
        v56[l_n_3] = v71[1];
        local v73 = v71[1];
        local l_parents_2 = v73.parents;
        for v75, v76 in l_parents_2 do
            local v77 = table.find(v76, v73);
            local v78 = #v76;
            v76[v77] = v76[v78];
            v76[v78] = nil;
            l_parents_2[v75] = nil;
        end;
    end;
    v56.n = l_n_3;
end;
return table.freeze({
    push_scope = v20, 
    pop_scope = v22, 
    evaluate_node = v70, 
    get_scope = v11, 
    assert_stable_scope = v14, 
    push_cleanup = v25, 
    destroy = v44, 
    flush_cleanups = v31, 
    push_child_to_scope = function(v80) --[[ Line: 233 ]] --[[ Name: push_child_to_scope ]]
        -- upvalues: v2 (copy)
        local v81 = v2[v2.n];
        if v81 and v81.effect then
            table.insert(v80, v81);
            table.insert(v81.parents, v80);
        end;
    end, 
    update_descendants = function(v82) --[[ Line: 210 ]] --[[ Name: update_descendants ]]
        -- upvalues: v56 (copy), v1 (copy), v70 (copy)
        local l_n_4 = v56.n;
        local l_n_5 = v56.n;
        while v82[1] do
            l_n_5 = l_n_5 + 1;
            v56[l_n_5] = v82[1];
            local v85 = v82[1];
            local l_parents_3 = v85.parents;
            for v87, v88 in l_parents_3 do
                local v89 = table.find(v88, v85);
                local v90 = #v88;
                v88[v89] = v88[v90];
                v88[v90] = nil;
                l_parents_3[v87] = nil;
            end;
        end;
        v56.n = l_n_5;
        if v1.batch then
            return;
        else
            l_n_5 = l_n_4 + 1;
            while l_n_5 <= v56.n do
                local v91 = v56[l_n_5];
                if v91.owner and v70(v91) then
                    local l_n_6 = v56.n;
                    while v91[1] do
                        l_n_6 = l_n_6 + 1;
                        v56[l_n_6] = v91[1];
                        local v93 = v91[1];
                        local l_parents_4 = v93.parents;
                        for v95, v96 in l_parents_4 do
                            local v97 = table.find(v96, v93);
                            local v98 = #v96;
                            v96[v97] = v96[v98];
                            v96[v98] = nil;
                            l_parents_4[v95] = nil;
                        end;
                    end;
                    v56.n = l_n_6;
                end;
                v56[l_n_5] = false;
                l_n_5 = l_n_5 + 1;
            end;
            v56.n = l_n_4;
            return;
        end;
    end, 
    push_child = v17, 
    create_node = function(v99, v100, v101) --[[ Line: 240 ]] --[[ Name: create_node ]]
        local v102 = {
            cache = v101, 
            effect = v100, 
            cleanups = false, 
            context = false, 
            owner = v99, 
            owned = false, 
            parents = {}
        };
        if v99 then
            if v99.owned then
                table.insert(v99.owned, v102);
                return v102;
            else
                v99.owned = {
                    v102
                };
            end;
        end;
        return v102;
    end, 
    create_source_node = function(v103) --[[ Line: 265 ]] --[[ Name: create_source_node ]]
        return {
            cache = v103
        };
    end, 
    get_children = function(v104) --[[ Line: 269 ]] --[[ Name: get_children ]]
        return {
            unpack(v104)
        };
    end, 
    flush_update_queue = function(v105) --[[ Line: 193 ]] --[[ Name: flush_update_queue ]]
        -- upvalues: v56 (copy), v70 (copy)
        local v106 = v105 + 1;
        while v106 <= v56.n do
            local v107 = v56[v106];
            if v107.owner and v70(v107) then
                local l_n_7 = v56.n;
                while v107[1] do
                    l_n_7 = l_n_7 + 1;
                    v56[l_n_7] = v107[1];
                    local v109 = v107[1];
                    local l_parents_5 = v109.parents;
                    for v111, v112 in l_parents_5 do
                        local v113 = table.find(v112, v109);
                        local v114 = #v112;
                        v112[v113] = v112[v114];
                        v112[v114] = nil;
                        l_parents_5[v111] = nil;
                    end;
                end;
                v56.n = l_n_7;
            end;
            v56[v106] = false;
            v106 = v106 + 1;
        end;
        v56.n = v105;
    end, 
    get_update_queue_length = function() --[[ Line: 189 ]] --[[ Name: get_update_queue_length ]]
        -- upvalues: v56 (copy)
        return v56.n;
    end, 
    set_context = function(v115, v116, v117) --[[ Line: 273 ]] --[[ Name: set_context ]]
        if v115.context then
            v115.context[v116] = v117;
            return;
        else
            v115.context = {
                [v116] = v117
            };
            return;
        end;
    end, 
    scopes = v2
});