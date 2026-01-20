if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.throw);
local v1 = require(script.Parent.graph);
local l_create_node_0 = v1.create_node;
local l_get_scope_0 = v1.get_scope;
local l_push_scope_0 = v1.push_scope;
local l_pop_scope_0 = v1.pop_scope;
local l_set_context_0 = v1.set_context;
local v7 = newproxy();
local v8 = 0;
return function(...) --[[ Line: 17 ]] --[[ Name: context ]]
    -- upvalues: v8 (ref), l_get_scope_0 (copy), v7 (copy), v0 (copy), l_create_node_0 (copy), l_set_context_0 (copy), l_push_scope_0 (copy), l_pop_scope_0 (copy)
    v8 = v8 + 1;
    local l_v8_0 = v8;
    local v10 = select("#", ...) > 0;
    local v11 = ...;
    return function(...) --[[ Line: 24 ]]
        -- upvalues: l_get_scope_0 (ref), l_v8_0 (copy), v7 (ref), v10 (copy), v11 (copy), v0 (ref), l_create_node_0 (ref), l_set_context_0 (ref), l_push_scope_0 (ref), l_pop_scope_0 (ref)
        local v12 = l_get_scope_0();
        if select("#", ...) == 0 then
            while true do
                if v12 then
                    local l_context_0 = v12.context;
                    if not l_context_0 then
                        v12 = v12.owner;
                    else
                        local v14 = l_context_0[l_v8_0];
                        if v14 == nil then
                            v12 = v12.owner;
                        elseif v14 ~= v7 then
                            return v14;
                        else
                            return nil;
                        end;
                    end;
                elseif v10 ~= nil then
                    return v11;
                else
                    v0("attempt to get context when no context is set and no default context is set");
                    return nil;
                end;
            end;
        elseif not v12 then
            return v0("attempt to set context outside of a vide scope");
        else
            local v15, v16 = ...;
            local v17 = l_create_node_0(v12, false, false);
            l_set_context_0(v17, l_v8_0, if v15 == nil then v7 else v15);
            l_push_scope_0(v17);
            local v19, v20 = xpcall(v16, function(v18) --[[ Line: 61 ]] --[[ Name: efn ]]
                return debug.traceback(v18, 3);
            end);
            l_pop_scope_0();
            if not v19 then
                v0((("error while running context:\n\n%*"):format(v20)));
            end;
            return v20;
        end;
    end;
end;