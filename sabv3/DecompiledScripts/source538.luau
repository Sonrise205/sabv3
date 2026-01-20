if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.graph);
local l_create_source_node_0 = v0.create_source_node;
local l_push_child_to_scope_0 = v0.push_child_to_scope;
local l_update_descendants_0 = v0.update_descendants;
return function(v4) --[[ Line: 11 ]] --[[ Name: source ]]
    -- upvalues: l_create_source_node_0 (copy), l_push_child_to_scope_0 (copy), l_update_descendants_0 (copy)
    local v5 = l_create_source_node_0(v4);
    return function(...) --[[ Line: 14 ]]
        -- upvalues: l_push_child_to_scope_0 (ref), v5 (copy), l_update_descendants_0 (ref)
        if select("#", ...) == 0 then
            l_push_child_to_scope_0(v5);
            return v5.cache;
        else
            local v6 = ...;
            if v5.cache == v6 and (type(v6) ~= "table" or table.isfrozen(v6)) then
                return v6;
            else
                v5.cache = v6;
                l_update_descendants_0(v5);
                return v6;
            end;
        end;
    end;
end;